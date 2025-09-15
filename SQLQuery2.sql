--SELECT * FROM Acceptor;

/*SELECT BloodGroup, COUNT(*) AS TotalDonors
FROM Donor
GROUP BY BloodGroup*/

--SELECT * FROM Donor WHERE BloodGroup = @BloodGroup

--ALTER TABLE Donor ADD Age INT;

/*ALTER TABLE Donor ADD 
    Gender NVARCHAR(10),
    Email NVARCHAR(100),
    Address NVARCHAR(255),
    AvailabilityStatus NVARCHAR(20) DEFAULT 'Active';*/

--DELETE FROM Donor
--WHERE Name IN ('Ravi Kumar', 'Priya Sharma', 'Amit Verma');

--DELETE FROM Donor
--WHERE Name IN ('Richa', 'Ritika');

INSERT INTO Donor 
(Name, Age, Gender, BloodGroup, ContactNumber, Email, Address, AvailabilityStatus)
VALUES
('Ravi Kumar', 29, 'Male', 'A+', '9876543210', 'ravi.kumar@example.com', 'Bhopal, MP', 'Active'),
('Priya Sharma', 32, 'Female', 'O+', '9876543211', 'priya.sharma@example.com', 'Indore, MP', 'Active'),
('Amit Verma', 27, 'Male', 'B+', '9876543212', 'amit.verma@example.com', 'Gwalior, MP', 'Active');







