USE BloodBankDB;
GO

CREATE TABLE Donor (
    DonorId INT IDENTITY(1,1) PRIMARY KEY,
    Name NVARCHAR(100) NOT NULL,
    BloodGroup NVARCHAR(5) NOT NULL,
    ContactNumber NVARCHAR(15),
    RegisteredDate DATETIME DEFAULT GETDATE()
);

CREATE TABLE Acceptor (
    AcceptorId INT IDENTITY(1,1) PRIMARY KEY,
    Name NVARCHAR(100) NOT NULL,
    BloodGroup NVARCHAR(5) NOT NULL,
    ContactNumber NVARCHAR(15),
    LoginDate DATETIME DEFAULT GETDATE()
);

CREATE TABLE BloodRequests (
    RequestId INT IDENTITY(1,1) PRIMARY KEY,
    AcceptorId INT FOREIGN KEY REFERENCES Acceptor(AcceptorId),
    BloodGroup NVARCHAR(5) NOT NULL,
    Units INT NOT NULL,
    Urgency NVARCHAR(20),
    Status NVARCHAR(20),
    RequestDate DATETIME DEFAULT GETDATE()
);

CREATE TABLE AdminUser (
    AdminId INT IDENTITY(1,1) PRIMARY KEY,
    Username NVARCHAR(50) NOT NULL,
    Password NVARCHAR(50) NOT NULL
);

INSERT INTO AdminUser (Username, Password) VALUES ('admin', 'admin123');

INSERT INTO Donor (Name, BloodGroup, ContactNumber) VALUES
('Ravi Kumar', 'A+', '9876543210'),
('Priya Sharma', 'O+', '9876543211'),
('Amit Verma', 'B+', '9876543212');

INSERT INTO Acceptor (Name, BloodGroup, ContactNumber) VALUES
('Neha Singh', 'A+', '9876543213'),
('Rahul Mehta', 'O-', '9876543214');

INSERT INTO BloodRequests (AcceptorId, BloodGroup, Units, Urgency, Status) VALUES
(1, 'A+', 2, 'High', 'Pending'),
(2, 'O-', 1, 'Medium', 'Approved');


