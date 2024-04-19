USE [db_6_sql]
GO

SELECT d.Name AS DepartmentName
FROM Departments d
JOIN Buildings b ON d.BuildingId = b.Id
JOIN Departments cardiology ON cardiology.Name = 'Cardiology'
WHERE b.Name = (SELECT Name FROM Buildings WHERE Id = cardiology.BuildingId);

SELECT d.Name AS DepartmentName
FROM Departments d
JOIN Buildings b ON d.BuildingId = b.Id
JOIN Departments gastroenterology ON gastroenterology.Name = 'Gastroenterology'
JOIN Departments general_surgery ON general_surgery.Name = 'General Surgery'
WHERE b.Name = (SELECT Name FROM Buildings WHERE Id = gastroenterology.BuildingId)
    AND b.Name = (SELECT Name FROM Buildings WHERE Id = general_surgery.BuildingId);

SELECT TOP 1 d.Name AS DepartmentName
FROM Departments d
LEFT JOIN Donations don ON d.Id = don.DepartmentId
GROUP BY d.Name
ORDER BY COUNT(don.Id);

SELECT LastName
FROM Doctors
WHERE Salary > (SELECT Salary FROM Doctors WHERE LastName = 'Thomas Gerada');

-- 5. ������� ����� �����, ������� ���� �����, �� ������� ������� � ������� �������� "Microbiology".
SELECT Name AS WardName
FROM Wards
WHERE Capacity > (SELECT AVG(Capacity) FROM Wards WHERE DepartmentId = (SELECT Id FROM Departments WHERE Name = 'Microbiology'));

-- 6. ������� ���� ����� �����, �������� ���� (���� ������ �� ��������) ����������� ���� �� �� 100 �������� ����� Anthony Davis.
SELECT FirstName + ' ' + LastName AS FullName
FROM Doctors
WHERE (Salary + Premium) > (SELECT (Salary + Premium) * 100 FROM Doctors WHERE LastName = 'Anthony Davis');

SELECT d.Name AS DepartmentName
FROM Departments d
JOIN Doctors doc ON d.Id = doc.DepartmentId
JOIN ExaminationSchedule es ON doc.Id = es.DoctorId
WHERE doc.LastName = 'Bell' AND doc.FirstName = 'Joshua';

-- 8. ������� ����� ��������, �� �� ������ ������������� ��������� �Neurology� �� �Oncology�.
SELECT s.Name AS SponsorName
FROM Sponsors s
WHERE s.Id NOT IN (SELECT SponsorId FROM SponsorDonations WHERE DepartmentId IN (SELECT Id FROM Departments WHERE Name IN ('Neurology', 'Oncology')));

-- 9. ������� ������� �����, �� ��������� ���������� � ����� � 12:00 �� 15:00.
SELECT d.LastName
FROM Doctors d
JOIN ExaminationSchedule es ON d.Id = es.DoctorId
WHERE es.ExaminationTime BETWEEN '12:00' AND '15:00';