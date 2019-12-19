--Dibuat oleh
--Elsen Chandra - 2201738182
--Gerald Stephanus Tamon - 2201743182
--Giodio Nathanael Pratama Mitaart - 2201768310
--Muhammad Fadhil Achmadi - 2201728704
--Tanael Budiman - 2201753063

-- Transaksi Banyaknya Gown yang Member Sewa
insert into DetailRentTransaction VALUES
('RE009','GW005','20')
--Transaksi Banyaknya Gown yang Member Beli
Insert into DetailPurchaseTransaction VALUES
('PD007','GW005','20')

update DetailRentTransaction
SET GownRentedQTY = GownRentedQTY - 5
WHERE GownID = 'GW005'

--
update DetailPurchaseTransaction
SET GownPurchaseQTY = GownPurchaseQTY - 5
WHERE PurchaseTransactionID = 'PD007'
