USE [db_6_sql]
GO

INSERT INTO Departments (Id, Name, Building)
VALUES 
    (1, 'Cardiology', 1),
    (2, 'Gastroenterology', 1),
    (3, 'General Surgery', 2),
    (4, 'Neurology', 3),
    (5, 'Oncology', 3);

INSERT INTO Doctors (Id, LastName, DepartmentId)
VALUES 
    (1, 'Smith', 1),
    (2, 'Johnson', 2),
    (3, 'Williams', 1),
    (4, 'Brown', 3),
    (5, 'Jones', 3);

INSERT INTO Donations (Id, Amount, DepartmentId)
VALUES 
    (1, 500, 1),
    (2, 700, 2),
    (3, 300, 3),
    (4, 900, 4),
    (5, 600, 5);

INSERT INTO Wards (Id, Name, Capacity, DepartmentId)
VALUES 
    (1, 'Ward A', 20, 1),
    (2, 'Ward B', 15, 2),
    (3, 'Ward C', 25, 3),
    (4, 'Ward D', 18, 4),
    (5, 'Ward E', 22, 5);

INSERT INTO ExaminationSchedule (Id, DoctorId, ExaminationTime)
VALUES 
    (1, 1, '09:00'),
    (2, 2, '10:30'),
    (3, 3, '11:45'),
    (4, 4, '13:15'),
    (5, 5, '14:45');

INSERT INTO Sponsors (Id, Name)
VALUES 
    (1, 'Sponsor A'),
    (2, 'Sponsor B'),
    (3, 'Sponsor C');

INSERT INTO SponsorDonations (Id, SponsorId, Amount)
VALUES 
    (1, 1, 1000),
    (2, 2, 1500),
    (3, 3, 800);