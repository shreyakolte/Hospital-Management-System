create database Hospital;
show databases;
use Hospital;
create table Bill(BillID int primary key, TotalCost DECIMAL(10, 2) not null);
insert into Bill values(101, 1038.45);
insert into Bill values(102, 5386.66);
insert into Bill values(103, 500.50);
insert into Bill values(104, 800.99);
insert into Bill values(105, 10437.00);
insert into Bill values(106, 2763.79);
insert into Bill values(107, 2465.35);
insert into Bill values(108, 237600.38);
insert into Bill values(109, 7083.19);
insert into Bill values(110, 3700.00);
select * from Hospital.Bill order by BillID;
create table Patient( PatientID int primary key, FirstName varchar(20) not null, LastName varchar(20) not null, 
PhoneNumberTXT varchar(15) not null, Dateofbirth date not null, Gender varchar(15) not null, email varchar(30) not null, 
MedicalHistory varchar(50) null, BillID int, foreign key (BillID) references Bill(BillID));
insert into Patient values(1, "Jacob", "Black", (948)-874-9804, "1962-11-09", "Male", "jacobblack@gmail.com", "Diabetes", 101); 
insert into Patient values(2, "Isabella", "Johnson", (287)-874-8749, "1985-08-01", "Female", "bellajohnson@gmail.com", "Anemia", 102); 
insert into Patient values(3, "Edward", "Cullen", (653)-675-9824, "1982-11-07", "Male", "edwardcullen@gmail.com", "Arthritis", 103); 
insert into Patient values(4, "Harvey ", "Specter", (736)-894-9824, "2004-01-02", "Male", "harveyspecter@gmail.com", NULL, 104); 
insert into Patient values(5, "Rachel ", "Zane", (673)-988-7839, "1996-05-06", "Female", "rachzane@gmail.com", "Asthama", 105); 
insert into Patient values(6, "Jessica ", "Pearson", (764)-657-8767, "1989-07-14", "Female", "jpearson@gmail.com", NULL, 106); 
insert into Patient values(7, "Peter", "Kavinsky", (873)-899-3702, "1995-12-17", "Male", "peterk@gmail.com", "high blood pressure", 107); 
insert into Patient values(8, "Jerry ", "Johnson", (429)-802-2792, "2002-06-10", "Male", "johnsonjerry@gmail.com", "Chronic Pain", 108); 
insert into Patient values(9, "Eliza", "Taylor", (289)-808-8078, "1975-02-02", "Female", "elizataylor@gmail.com", "depression", 109); 
insert into Patient values(10, "Jane", " Walter ", (681)-792-8781, "2011-03-06", "Female", "janewalter@gmail.com", "gynecological Disorder", 110); 
select * from Hospital.patient order by PatientID ;
Create table Nurse(NurseID varchar(4) primary key, FirstName varchar(10) not null, LastName varchar(15) not null);
insert into Nurse values("N1", "Steve", "Carell");
insert into Nurse values("N2", "Jonathan", "Sidwell");
insert into Nurse values("N3", "Ray", "Benghazi");
insert into Nurse values("N4", "Candice", "King");
insert into Nurse values("N5", "Penny", "Badgley");
insert into Nurse values("N6", "Blair", "Blair");
insert into Nurse values("N7", "Nancy", "Miller");
insert into Nurse values("N8", "Kate", "Berry");
insert into Nurse values("N9", "Rory", "Tanner");
insert into Nurse values("N10", "Robin", "Henson");
select * from Hospital.Nurse order by NurseID ;
create table PatientNurse(PatientID int not null, foreign key(PatientID) references Patient(PatientID), NurseID varchar(4) not null, foreign key(NurseID) references Nurse(NurseID));
insert into PatientNurse values(1, "N3");
insert into PatientNurse values(1, "N2");
insert into PatientNurse values(2, "N1");
insert into PatientNurse values(2, "N4");
insert into PatientNurse values(3, "N5");
insert into PatientNurse values(4, "N6");
insert into PatientNurse values(5, "N5");
insert into PatientNurse values(6, "N8");
insert into PatientNurse values(6, "N9");
insert into PatientNurse values(7, "N2");
insert into PatientNurse values(8, "N4");
insert into PatientNurse values(8, "N10");
insert into PatientNurse values(9, "N1");
insert into PatientNurse values(10, "N7");
insert into PatientNurse values(10, "N3");
select * from Hospital.PatientNurse order by PatientID ;
Create table Surgery(SurgeryID varchar(4)Primary key,Surgery varchar(50) NOT NULL);
insert into Surgery values("S1","Neurosurgery");
insert into Surgery values("S2","OrthopedicSurgery");
insert into Surgery values("S3","GynecologicalSurgery");
insert into Surgery values("S4","CarthothoracicSurgery");
insert into  Surgery values("S5","ENTSurgery");
insert into  Surgery values("S6","OphthalmicSurgery");
select * from Hospital.Surgery order by SurgeryID ;
Create table Department(DeptId varchar(4) primary key,Name varchar(50) NOT NULL);
insert into Department values("D001","Neurology");
insert into Department values("D002","Orthopedics");
insert into Department values("D003","Gynecology");
insert into Department values("D004","Cardiology");
insert into Department values("D005","ENT");
insert into Department values("D006","Ophthalmology");
insert into Department values("D007","General");
select * from Hospital.Department order by DeptId  ;
create table Doctor(DoctorID varchar(4) primary key, FirstName varchar(10) not null, LastName varchar(15), Designation varchar(25),SurgeryId varchar(4),
foreign key(SurgeryId) references Surgery(SurgeryID),DeptID varchar(4),foreign key (DeptID) references Department(DeptId));
insert into Doctor values("D1","James", "Brown", "MS.Orthopedic","S2","D002");
insert into Doctor values("D2","Maria", "Stinson", "MS.Gynacologist","S3","D003");
insert into Doctor values("D3","Jamie ", "Anderson", "MD.Cardiothoracic",NULL,"D004");
insert into Doctor values("D4","Anna ", "Wilson", "MD.Gynacologist",NULL,"D003");
insert into Doctor values("D5","Jennifer", "Davis", "MS.Neurologist","S1","D001");
insert into Doctor values("D6","Lily ", "Jackson ", "MS.ENT","S5","D005");
insert into Doctor values("D7","Mike", "Ross ", "MD.Neurologist",NULL,"D001");
insert into Doctor values("D8","Taylor", "Kelly", "MS.Ophthalmic","S6","D006");
insert into Doctor values("D9","Barbara", "Patson", "MS.Neurologist","S1","D001");
insert into Doctor values("D10","Oscar", "Stanley", "MS.Orthopedic",NULL,"D002");
insert into Doctor values("D11","Frankie ", "Heck", "MS.Cardiothoracic","S4","D004");
insert into Doctor values("D12","Ben ", "Nicholas", "MBBS","S3","D007");
select * from Hospital.Doctor order by DoctorID ;
create table DoctorPatient(PatientID int not null, 
foreign key(PatientID) references Patient(PatientID), DoctorID varchar(4) not null, foreign key(DoctorID) references Doctor(DoctorID));
insert into DoctorPatient values(1,"D5");
insert into DoctorPatient values(1,"D7");
insert into DoctorPatient values(2,"D5");
insert into DoctorPatient values(2,"D10");
insert into DoctorPatient values(3,"D11");
insert into DoctorPatient values(4,"D6");
insert into DoctorPatient values(5,"D11");
insert into DoctorPatient values(6,"D9");
insert into DoctorPatient values(6,"D12");
insert into DoctorPatient values(7,"D11");
insert into DoctorPatient values(8,"D8");
insert into DoctorPatient values(8,"D4");
insert into DoctorPatient values(9,"D3");
insert into DoctorPatient values(10,"D2");
insert into DoctorPatient values(10,"D12");
select * from Hospital.DoctorPatient order by PatientID;
create table PatientSurgery(PatientID int not null, foreign key(PatientID) references Patient(PatientID),
SurgeryId varchar(4) NULL,foreign key(SurgeryId) references Surgery(SurgeryID));
insert into PatientSurgery values (1,"S1"); 
insert into PatientSurgery values (2,"S1"); 
insert into PatientSurgery values (2,"S2"); 
insert into PatientSurgery values (3,"S4"); 
insert into PatientSurgery values (4,"S5"); 
insert into PatientSurgery values (5,"S4"); 
insert into PatientSurgery values (6,"S1"); 
insert into PatientSurgery values (7,"S4");
insert into PatientSurgery values (8,"S6"); 
insert into PatientSurgery values (9,NULL);
insert into PatientSurgery values (10,"S3");   
select * from Hospital. PatientSurgery order by PatientID;
#Q2 
SELECT Patient. PatientID, Patient. FirstName, Patient. LastName, Nurse.NurseID, Nurse.FirstName AS NurseFirstName, Nurse. LastName AS NurseLastName FROM Hospital.Patient
INNER JOIN Hospital.PatientNurse ON Patient. PatientID=PatientNurse.PatientID
INNER JOIN Hospital. Nurse ON PatientNurse.NurseID=Nurse.NurseID;
#Q3 
SELECT Patient. PatientID, Patient. FirstName, Patient. LastName, PatientNurse. NurseID FROM Hospital.Patient
LEFT OUTER JOIN PatientNurse ON Patient.PatientID=PatientNurse.PatientID
ORDER BY Patient.PatientID;
#Q4 
SELECT * FROM Hospital.Patient WHERE PatientID=(SELECT MAX(PatientID) FROM Hospital.Patient);
#Q5 
SELECT * FROM Hospital.Patient WHERE PatientID IN (SELECT PatientID FROM Hospital. PatientSurgery);
#Q6
SELECT
P.PatientID,
P.FirstName,
P.LastName,
P.DateOfBirth,
D.FirstName AS DoctorFirstName,
D.LastName AS DoctorLastName,
S.Surgery
FROM Hospital.Patient AS P
LEFT JOIN Hospital. DoctorPatient AS DP ON P.PatientID=DP.PatientID
LEFT JOIN Hospital. Doctor AS D ON DP.DoctorID=D.DoctorID
LEFT JOIN Hospital. PatientSurgery AS PS ON P.PatientID=PS.PatientID
LEFT JOIN Hospital.Surgery AS S ON PS.SurgeryId= S.SurgeryID
GROUP BY P.PatientID, P.FirstName, P.LastName, P.DateOfBirth, D.FirstName, D. LastName, S. Surgery;
#Q7 
SELECT * FROM Hospital. Patient WHERE PatientID NOT IN (SELECT PatientID FROM Hospital.PatientSurgery WHERE SurgeryId IS NOT NULL)
ORDER BY PatientID;
#Q8
SELECT p.PatientID, p.FirstName,p.LastName, p.MedicalHistory,
CASE WHEN P.MedicalHistory IS NULL THEN 'No Medical History' 
WHEN p.MedicalHistory LIKE '%Diabetes%' then 'Diabetes'
WHEN P.MedicalHistory LIKE '%Anemia' then 'Anemia'
WHEN P.MedicalHistory LIKE '%Arthritis%' then 'Arthritis'
WHEN P.MedicalHistory LIKE '%Asthma%' then 'Asthma'
WHEN P.MedicalHistory LIKE '%Chronic Pain%' then 'Chronic Pain'
else 'Other'
END AS MedicalCondition
FROM Hospital.Patient p
ORDER BY p.PatientID;
#Q9 
SELECT P.PatientID, P.FirstName, P.LastName FROM Hospital.Patient P WHERE NOT EXISTS (SELECT 1 FROM Hospital.PatientSurgery PS WHERE PS.PatientID=P.PatientID AND PS.SurgeryID IS NOT NULL)
ORDER BY P.PatientID;
#Q10
SELECT * FROM Hospital.PatientSurgery WHERE SurgeryID IN ( SELECT SurgeryID FROM Hospital.PatientSurgery WHERE SurgeryID IS NOT NULL)
ORDER BY PatientID;








