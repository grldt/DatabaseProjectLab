--Dibuat oleh
--Elsen Chandra - 2201738182
--Gerald Stephanus Tamon - 2201743182
--Giodio Nathanael Pratama Mitaart - 2201768310
--Muhammad Fadhil Achmadi - 2201728704
--Tanael Budiman - 2201753063

INSERT  into Member VALUES ('MM001','Male',',Fadhil','Fadhil@gmail.com','089663078891'), 
('MM002','Male','Madhil','Madhil@gmail.com','089663078831'),
('MM003','Male','Fadil','Fadil@gmail.com','089663078821'),
('MM004','Female','Mash','Mash@gmail.com','089663078191'),
('MM005','Male','Budi','Budi@gmail.com','089663578891'),
('MM006','Female','Nadhia','Nadhia@gmail.com','082663078891'),
('MM007','Female','Marlu','Marlu@gmail.com','089664578891'),
('MM008','Male','Fakhir','Fakhir@gmail.com','089663078331'),
('MM009','Male','Fakumram','Fakumram@gmail.com','089663078491'),
('MM010','Female','Sinta','Sinta@gmail.com','089663078855')

Insert into Staff VALUES ('ST001','Male','Gerald','3000000','Gerald@gmail.com','JL.Jati','089663078332'),
('ST002','Female','Gelda','5000000','Gelda@gmail.com','JL.Jatinegara','089663078322'),
('ST003','Male','Gerud','4000000','Gerud@gmail.com','JL.JatiPondok','089663078362'),
('ST004','Female','Galdu','6000000','Galdu@gmail.com','JL.PondokJati','089663073332'),
('ST005','Female','Gulda','7000000','Gulda@gmail.com','JL.Negara','089663078432'),
('ST006','Male','Ganru','3000000','Ganru@gmail.com','JL.Jatiluhur','089663056332'),
('ST007','Male','Aunram','8000000','Gunram@gmail.com','JL.Jatikayu','089663328332'),
('ST008','Female','lili','5000000','lili@gmail.com','JL.kayuJati','089663019332'),
('ST009','Male','dono','9000000','dono@gmail.com','JL.PondokRanji','089663018332'),
('ST010','Male','Joko','9000000','Joko@gmail.com','JL.Jatimayu','089663075432')


insert into GownType VALUES ('GT001','Asymmetrical','Panjang'),
('GT002','MermaidStyle','Pendek'),
('GT003','JacketGown','Lebar'),
('GT004','A-line','Tinggi'),
('GT005','The Sheath','Bagus'),
('GT006','TeaLength','Indah'),
('GT007','Exaggerated','Keren'),
('GT008','BallGown','Panjang'),
('GT009','PrincessGown','Pendek'),
('GT010','Empire Waist','Lebar')


insert into Gown VALUES ('GW001','1000000','200000','GT001','Yellow','100'),
('GW002','200000','200000','GT002','Yellow','100'),
('GW003','150000','300000','GT003','White','100'),
('GW004','120000','400000','GT004','Black','100'),
('GW005','130000','500000','GT005','Red','100'),
('GW006','140000','600000','GT006','Pink','100'),
('GW007','110000','700000','GT007','Green','100'),
('GW008','160000','800000','GT008','Blue','100'),
('GW009','170000','900000','GT009','Purple','100'),
('GW010','180000','950000','GT010','OceanBlue','100')


insert into Supplier VALUES ('VD001','Elsen','Elsen@gmail.com','089663075431'),
('VD002','Elsa','Elsen@gmail.com','089663075451'),
('VD003','Elsword','Elsword@gmail.com','089663065431'),
('VD004','Elesis','Elesis@gmail.com','089663075131'),
('VD005','Elson','Elson@gmail.com','089663075441'),
('VD006','Elman','Elman@gmail.com','089663075421'),
('VD007','Elka','Elka@gmail.com','089663075431'),
('VD008','Elulu','Elsen@gmail.com','089663075410'),
('VD009','Ela','Ela@gmail.com','089663075411'),
('VD010','Elena','Elena@gmail.com','089663075531')

insert into Payment VALUES ('PY001','OVO','10000000'),
('PY002','OVO','1000000'),
('PY003','BCA','10000000'),
('PY004','GOPAY','10000000'),
('PY005','CASH','10000000'),
('PY006','CASH','2000000'),
('PY007','GOPAY','1500000'),
('PY008','OVO','900000'),
('PY009','BCA','950000'),
('PY010','OVO','900000')

insert into RentTransaction VALUES('RE001','MM001','ST001','2019-05-19','2019-06-27'),
('RE002','MM002','ST001','2019-10-15','2019-11-27'),
('RE003','MM003','ST001','2019-09-14','2019-10-27'),
('RE004','MM004','ST001','2019-08-13','2019-09-27'),
('RE005','MM005','ST001','2019-07-12','2019-08-27'),
('RE006','MM006','ST001','2019-06-11','2019-07-27'),
('RE007','MM007','ST001','2019-05-10','2019-06-27'),
('RE008','MM008','ST001','2019-04-15','2019-05-27'),
('RE009','MM009','ST001','2019-03-16','2019-04-27'),
('RE010','MM010','ST001','2019-02-18','2019-03-27'),
('RE011','MM002','ST001','2019-01-20','2019-02-27'),
('RE012','MM004','ST001','2019-10-25','2019-12-27'),
('RE013','MM005','ST001','2019-12-29','2020-01-27'),
('RE014','MM006','ST001','2019-11-23','2019-12-27'),
('RE015','MM007','ST001','2019-05-27','2019-06-27')

insert into PurchaseTransaction VALUES ('PD001','ST001','VD001','PY001','2019-05-22'),
('PD002','ST001','VD001','PY001','2019-05-21'),
('PD003','ST001','VD001','PY001','2019-05-23'),
('PD004','ST001','VD001','PY001','2019-05-24'),
('PD005','ST001','VD001','PY001','2019-05-25'),
('PD006','ST001','VD001','PY001','2019-05-26'),
('PD007','ST001','VD001','PY001','2019-05-20'),
('PD008','ST001','VD001','PY001','2019-05-27'),
('PD009','ST001','VD001','PY001','2019-05-28'),
('PD010','ST001','VD001','PY001','2019-05-29'),
('PD011','ST001','VD001','PY001','2019-05-30'),
('PD012','ST001','VD001','PY001','2019-05-11'),
('PD013','ST001','VD001','PY001','2019-05-14'),
('PD014','ST001','VD001','PY001','2019-05-13'),
('PD015','ST001','VD001','PY001','2019-05-12')

insert into DetailRentTransaction VALUES('RE001','GW001','10'),
('RE002','GW002','10'),
('RE003','GW003','11'),
('RE004','GW004','12'),
('RE005','GW005','13'),
('RE006','GW006','14'),
('RE007','GW007','15'),
('RE008','GW008','16'),
('RE009','GW009','17'),
('RE010','GW010','18'),
('RE011','GW010','19'),
('RE012','GW009','10'),
('RE013','GW010','12'),
('RE014','GW008','14'),
('RE015','GW010','15'),
('RE013','GW007','14'),
('RE014','GW010','14'),
('RE012','GW007','13'),
('RE011','GW005','12'),
('RE010','GW003','12'),
('RE009','GW004','12'),
('RE004','GW003','13'),
('RE005','GW003','11'),
('RE002','GW001','11'),
('RE003','GW006','17')

INSERT INTO DetailPurchaseTransaction VALUES ('PD001','GW001','19'),
('PD002','GW002','19'),
('PD003','GW003','19'),
('PD004','GW004','19'),
('PD005','GW005','19'),
('PD006','GW006','19'),
('PD007','GW007','19'),
('PD008','GW008','19'),
('PD009','GW009','19'),
('PD010','GW010','19'),
('PD011','GW005','19'),
('PD012','GW003','19'),
('PD013','GW002','19'),
('PD014','GW004','19'),
('PD015','GW005','19'),
('PD012','GW006','19'),
('PD013','GW008','19'),
('PD004','GW001','19'),
('PD005','GW001','19'),
('PD002','GW001','19'),
('PD003','GW001','19'),
('PD005','GW003','19'),
('PD006','GW007','19'),
('PD008','GW009','19'),
('PD003','GW006','19')