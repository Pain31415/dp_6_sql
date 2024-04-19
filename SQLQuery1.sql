USE [db_6_sql]
GO

SELECT Building
FROM Departments
GROUP BY Building
HAVING SUM(Financing) > 100000;

SELECT G.Name
FROM Groups G
JOIN Departments D ON G.DepartmentId = D.Id
JOIN Lectures L ON G.Id = L.GroupId
WHERE D.Name = 'Software Development' AND YEAR(L.Date) = 2024 AND WEEKDAY(L.Date) < 5
GROUP BY G.Name
HAVING COUNT(*) > 10;

SELECT G.Name
FROM Groups G
JOIN Students S ON G.Id = S.GroupId
GROUP BY G.Name
HAVING AVG(S.Rating) > (SELECT AVG(Rating) FROM Students WHERE GroupId = 'D221');

SELECT Name, Surname
FROM Teachers
WHERE Salary > (SELECT AVG(Salary) FROM Teachers WHERE IsProfessor = 1);

SELECT G.Name
FROM Groups G
JOIN GroupsCurators GC ON G.Id = GC.GroupId
GROUP BY G.Name
HAVING COUNT(*) > 1;

SELECT G.Name
FROM Groups G
JOIN Students S ON G.Id = S.GroupId
WHERE G.Year = 5
GROUP BY G.Name
HAVING AVG(S.Rating) < (SELECT MIN(AvgRating) FROM (SELECT AVG(Rating) AS AvgRating FROM Students GROUP BY GroupId) AS SubQuery);

SELECT F.Name
FROM Departments D
JOIN Faculty F ON D.FacultyId = F.Id
GROUP BY F.Name
HAVING SUM(D.Financing) > (SELECT SUM(Financing) FROM Departments WHERE FacultyId = (SELECT Id FROM Faculty WHERE Name = 'Computer Science'));

SELECT S.Name AS Subject, T.Name + ' ' + T.Surname AS Teacher
FROM Subjects S
JOIN Lectures L ON S.Id = L.SubjectId
JOIN Teachers T ON L.TeacherId = T.Id
GROUP BY S.Name, T.Name, T.Surname
HAVING COUNT(*) = (SELECT TOP 1 COUNT(*) FROM Lectures GROUP BY SubjectId ORDER BY COUNT(*) DESC);

SELECT S.Name AS Subject
FROM Subjects S
JOIN Lectures L ON S.Id = L.SubjectId
GROUP BY S.Name
HAVING COUNT(*) = (SELECT TOP 1 COUNT(*) FROM Lectures GROUP BY SubjectId ORDER BY COUNT(*));

SELECT COUNT(DISTINCT S.Id) AS NumberOfStudents, COUNT(DISTINCT Sj.Id) AS NumberOfSubjects
FROM Students S
JOIN Groups G ON S.GroupId = G.Id
JOIN Departments D ON G.DepartmentId = D.Id
JOIN Subjects Sj ON D.Id = Sj.DepartmentId
WHERE D.Name = 'Software Development';