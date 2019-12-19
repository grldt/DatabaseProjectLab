--Dibuat oleh
--Elsen Chandra - 2201738182
--Gerald Stephanus Tamon - 2201743182
--Giodio Nathanael Pratama Mitaart - 2201768310
--Muhammad Fadhil Achmadi - 2201728704
--Tanael Budiman - 2201753063

--Case 1
Select Member.MemberID,MemberName,
SUM(GownRentedQTY) as TotalRentedQTY

From Member,RentTransaction,DetailRentTransaction
WHERE Member.MemberID = RentTransaction.MemberID  AND RentTransaction.RentTransactionID = DetailRentTransaction.RentTransactionID AND
MONTH(RentTransaction.DateStart) = 6

GROUP BY Member.MemberID,
		 Member.MemberName

--Case 2
Select Staff.StaffID,Staff.StaffName,
[Total Transaction] = convert(varchar(50), count(PurchaseTransaction.PurchaseTransactionID))
from Staff,PurchaseTransaction,Payment
WHERE Staff.StaffID = PurchaseTransaction.StaffID AND PurchaseTransaction.PaymentID = Payment.PaymentID
AND Payment.PaymentAmount>=1000000 AND MONTH(PurchaseTransaction.TransactionDate) = 5
GROUP BY Staff.StaffID,Staff.StaffName



--case 3
Select [Member]='Mrs.' + MemberName ,
[RentingCost] = SUM(DATEDIFF(DAY,DateStart,DateEnd)*GownRentPrice),
[Total Gown Rented] = count(GownRentedQTY)
from Member,RentTransaction,DetailRentTransaction,Gown
WHERE Member.MemberID = RentTransaction.MemberID AND RentTransaction.RentTransactionID = DetailRentTransaction.RentTransactionID
	  AND DetailRentTransaction.GownID = Gown.GownID
	  AND Member.MemberGender like 'Female' AND DAY(DateStart) = 15
GROUP BY MemberName,
		RentTransaction.DateStart,
		RentTransaction.DateEnd,Gown.GownRentPrice
	  UNION
Select 'Mr.' + MemberName ,
[RentingCost] = DATEDIFF(DAY,DateStart,DateEnd)*GownRentPrice,
[Total Gown Rented] = count(GownRentedQTY)
from Member,RentTransaction,DetailRentTransaction,Gown
WHERE Member.MemberID = RentTransaction.MemberID AND RentTransaction.RentTransactionID = DetailRentTransaction.RentTransactionID
	  AND DetailRentTransaction.GownID = Gown.GownID
	  AND Member.MemberGender = 'Male' AND DAY(DateStart) = 15
Group by MemberName,
		 RentTransaction.DateStart,
		RentTransaction.DateEnd,Gown.GownRentPrice

--case 4
select Staff.StaffID,[FirstName] = Staff.StaffName , Count(CONVERT(INT,PaymentAmount)) as TotalPurchasingAmount

from Staff,Payment,PurchaseTransaction
WHERE Staff.StaffID = PurchaseTransaction.StaffID and PurchaseTransaction.PaymentID = Payment.PaymentID
AND Staff.StaffName like '% ' or Staff.StaffName like '%'  and Staff.StaffID = 'ST001' AND PaymentAmount >= 1 
GROUP BY Staff.StaffID,Staff.StaffName


--case 5
select StaffID ,StaffName ,StaffGender,StaffSalary

from Staff
WHERE left(StaffName,1) = 'A' and StaffSalary 
IN(SELECT StaffSalary
FROM Staff,(SELECT [rt] = AVG(StaffSalary) FROM Staff ) as rt
WHERE StaffSalary>rt
)
ORDER BY StaffID DESC

--Case 6 
SELECT  Gown.GownID,[Rented Total Times] = CONVERT(VARCHAR,COUNT(RentTransaction.RentTransactionID)) + ' times'
,GownColor,GownTypeName,[Description length] = GownTypeDescription  


FROM Gown,RentTransaction,GownType,DetailRentTransaction
WHERE Gown.GownID = DetailRentTransaction.GownID and RentTransaction.RentTransactionID = DetailRentTransaction.RentTransactionID
and Gown.GownTypeID = GownType.GownTypeID
and  len(GownTypeDescription) < (SELECT [LENG] = AVG(LEN(GownTypeDescription)) FROM GownType) and MONTH(DateEnd) = 6

GROUP BY Gown.GownID,Gown.GownColor,GownTypeName,GownTypeDescription


--CASE 7
SELECT REPLACE(g.GownID,'GW','Gown') as GownNumber,GownTypeName,'Rp.' + Convert(VARCHAR,GownRentPrice) as GownRentPrice,
[Gown Rented Times] = COUNT(dr.RentTransactionID),GownColor

FROM Gown g,GownType gt,RentTransaction rt,DetailRentTransaction dr
WHERE g.GownID = dr.GownID and rt.RentTransactionID = dr.RentTransactionID and g.GownTypeID = gt.GownTypeID
AND GownRentPrice
IN 	
(SELECT GownRentPrice

FROM Gown,(SELECT [RT] = AVG(GownRentPrice) FROM Gown ) as RT,DetailRentTransaction dr,RentTransaction 
WHERE Gown.GownID = dr.GownID and RentTransaction.RentTransactionID = dr.RentTransactionID and g.GownTypeID = gt.GownTypeID and 
GownRentPrice>RT AND MONTH(DateEnd) = 6
)
GROUP BY g.GownID,gt.GownTypeName,g.GownRentPrice,g.GownColor
ORDER BY g.GownID ASC

--CASE 8 
SELECT [Purchase Date] = convert(VARCHAR,TransactionDate,101),
[Staff Number] = REPLACE(Staff.StaffID,'ST','Staff'),
PurchaseTransactionID,Payment.PaymentID,
[Payment Amount] = 'Rp.' + convert(varchar,PaymentAmount),
[Total Gown Rented] = COUNT(RentTransactionID)
FROM Payment,PurchaseTransaction,Staff,RentTransaction
WHERE Payment.PaymentID = PurchaseTransaction.PaymentID and 
PurchaseTransaction.StaffID = Staff.StaffID and
Staff.StaffID = RentTransaction.StaffID AND 
Payment.PaymentAmount = (SELECT [hi] = MAX(PaymentAmount)   FROM Payment) AND
MONTH(TransactionDate) = 5


GROUP BY PaymentAmount,Payment.PaymentID,PaymentType,PurchaseTransaction.TransactionDate
,Staff.StaffID,PurchaseTransaction.PurchaseTransactionID

--CASE 9
CREATE VIEW MemberTotalTransaction AS
SELECT Member.MemberID,MemberName,
[TotalRent] = count(RentTransaction.RentTransactionID),
[Total Purchase Amount] = DATEDIFF(DAY,DateStart,DateEnd)*GownRentPrice
FROM Member,RentTransaction,DetailRentTransaction,Gown
WHERE Member.MemberID = RentTransaction.MemberID AND RentTransaction.RentTransactionID = DetailRentTransaction.RentTransactionID
	  AND DetailRentTransaction.GownID = Gown.GownID
	  AND Member.MemberID = 'MM001' AND DATEDIFF(DAY,DateStart,DateEnd)>1
GROUP BY Member.MemberID,MemberName,
		RentTransaction.DateStart,
		RentTransaction.DateEnd,Gown.GownRentPrice

--CASE 10 
CREATE VIEW StaffInvolvement AS
SELECT Staff.StaffID,StaffName,[StaffPurchaseInvolvement] = count(PurchaseTransactionID),
[StaffTotalExpense] = SUM(CONVERT(INT,PaymentAmount))
FROM Staff,PurchaseTransaction,Payment ,( select [StaffTotalExpense] = SUM(CONVERT(INT,PaymentAmount)) FROM Payment)AS A
WHERE Staff.StaffID = PurchaseTransaction.StaffID AND PurchaseTransaction.PaymentID = Payment.PaymentID AND
MONTH(TransactionDate) = 5 
AND A.StaffTotalExpense >= 1000000

GROUP BY Staff.StaffID,StaffName
