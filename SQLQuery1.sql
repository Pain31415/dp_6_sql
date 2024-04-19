USE [db_6_sql]
GO

INSERT INTO Teachers (IsProfessor, Name, Salary, Surname) 
VALUES 
    (1, 'Professor', 60000, 'Anderson'),
    (0, 'John', 50000, 'Smith'),
    (0, 'Emily', 55000, 'Johnson');

INSERT INTO Lectures (Date, SubjectId, TeacherId) 
VALUES 
    ('2024-04-01', 1, 1),
    ('2024-04-02', 2, 2),
    ('2024-04-03', 3, 3);

INSERT INTO GroupsStudents (GroupId, StudentId) 
VALUES 
    (1, 1),
    (1, 2),
    (2, 3),
    (2, 4);

INSERT INTO GroupsLectures (GroupId, LectureId) 
VALUES 
    (1, 1),
    (2, 1),
    (3, 2),
    (4, 2);

INSERT INTO GroupsCurators (CuratorId, GroupId) 
VALUES 
    (1, 1),
    (2, 2),
    (3, 3);