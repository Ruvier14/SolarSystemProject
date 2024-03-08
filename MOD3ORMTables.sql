USE IFT300TEST
GO

Create Table Employee (
FName Varchar(30) Not Null,
LName Varchar(30) Not Null,
IDNo Int,
Height decimal(6,2),
DateJoined Date,
AddressLoc VarChar(40),
CONSTRAINT PK_Person PRIMARY KEY (Lname, IDNo)
);



INSERT INTO Employee (Fname, Lname, IDNo, DateJoined, Height, AddressLoc)
VALUES 
('Rowe', 'Tampus', '1', '2024-02-18', 166.0, 'Sunny Hills'),
('John','Doe','2', '2024-02-18', 167.0, 'Happy Hills'),
('Bob', 'Marley','3', '2024-02-18', 169.5, 'High Street'),
('Bear', 'Grylls', '4', '2024-02-18',181.6, 'Mountains Street'),
('Anita', 'Pea', '5', '2024-02-18', 160.5, 'Side Avenue');

Select * FROM Employee
ORDER BY IDNo;

DROP TABLE Employee;
