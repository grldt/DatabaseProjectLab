--Dibuat oleh
--Elsen Chandra - 2201738182
--Gerald Stephanus Tamon - 2201743182
--Giodio Nathanael Pratama Mitaart - 2201768310
--Muhammad Fadhil Achmadi - 2201728704
--Tanael Budiman - 2201753063

create table Member (
	MemberID Char(5)   PRIMARY KEY check (MemberID   like 'MM[0-9][0-9][0-9]') NOT NULL,
	MemberGender VARCHAR(20) check(MemberGender in('Male','Female')) NOT NULL,
	MemberName VARCHAR(20) NOT NULL,
	MemberEmail VARCHAR (20) NOT NULL,
	MemberPhone VARCHAR(20) NOT NULL,
)

create table Staff (
	StaffID Char(5)   PRIMARY KEY check (StaffID   like 'ST[0-9][0-9][0-9]') NOT NULL,
	StaffGender VARCHAR(20) check(Staffgender in('Male','Female')) NOT NULL,
	StaffName VARCHAR(20) NOT NULL,
	StaffSalary int NOT NULL,
	StaffEmail VARCHAR(20) NOT NULL,
	StaffAddress VARCHAR(20) NOT NULL,
	StaffPhone Varchar(20) NOT NULL,
)	

create table RentTransaction(
	RentTransactionID Char(5)   PRIMARY KEY check (RentTransactionID   like 'RE[0-9][0-9][0-9]') NOT NULL,
	MemberID CHAR(5) FOREIGN KEY (MemberID) REFERENCES Member ON UPDATE CASCADE NOT NULL,
	StaffID CHAR(5) FOREIGN KEY (StaffID) REFERENCES Staff ON UPDATE CASCADE NOT NULL,
	DateStart DATE  NOT NULL,
	DateEnd DATE NOT NULL,
)

create table GownType (
	GownTypeID Char(5)   PRIMARY KEY check (GownTypeID   like 'GT[0-9][0-9][0-9]') NOT NULL,
	GownTypeName VARCHAR(20) NOT NULL,
	GownTypeDescription VARCHAR(50) NOT NULL,
)

create table Gown (
	GownID Char(5)   PRIMARY KEY check (GownID   like 'GW[0-9][0-9][0-9]') NOT NULL,
	GownPrice int NOT NULL,
	GownRentPrice int  NOT NULL,
	GownTypeID  char(5) FOREIGN KEY (GownTypeID) REFERENCES GownType  ON UPDATE CASCADE NOT NULL,
	GownColor VARCHAR(20) NOT NULL,
	GownStock VARCHAR (20) NOT NULL
)
create table Supplier (
	SupplierID Char(5)   PRIMARY KEY check (SupplierID   like 'VD[0-9][0-9][0-9]') NOT NULL,
	SupplierName VARCHAR(20) NOT NULL,
	SupplierEmail VARCHAR (20) NOT NULL,
	SupplierPhone VARCHAR(20) NOT NULL,
)

create table Payment(
	PaymentID Char(5)   PRIMARY KEY check (PaymentID   like 'PY[0-9][0-9][0-9]') NOT NULL,
	PaymentType VARCHAR(20) check(PaymentType in('OVO','GOPAY','CASH','BCA')) NOT NULL,
	PaymentAmount int NOT NULL,
	
)

create table DetailRentTransaction (
	RentTransactionID Char(5)   FOREIGN KEY (RentTransactionID) REFERENCES RentTransaction,
	GownID Char(5)    FOREIGN KEY (GownID) REFERENCES Gown  ON UPDATE  CASCADE,
	PRIMARY KEY(RentTransactionID,GownID),
	GownRentedQTY int  NOT NULL ,
)


create table PurchaseTransaction (
	PurchaseTransactionID Char(5)   PRIMARY KEY check (PurchaseTransactionID   like 'PD[0-9][0-9][0-9]') NOT NULL,
	StaffID CHAR(5) FOREIGN KEY (StaffID) REFERENCES Staff  ON UPDATE  CASCADE NOT NULL,
	SupplierID CHAR (5) FOREIGN KEY (SupplierID) REFERENCES Supplier  ON UPDATE  CASCADE NOT NULL,
	PaymentID CHAR(5) FOREIGN KEY (PaymentID) REFERENCES Payment  ON UPDATE  CASCADE NOT NULL,
	TransactionDate DATE NOT NULL
)

create table DetailPurchaseTransaction (
	PurchaseTransactionID Char(5) check (PurchaseTransactionID   like 'PD[0-9][0-9][0-9]')  NOT NULL,
	GownID CHAR(5) FOREIGN KEY (GownID)  REFERENCES   Gown ON UPDATE  CASCADE NOT NULL,
	PRIMARY KEY (PurchaseTransactionID,GownID ),
	GownPurchaseQTY int
)


