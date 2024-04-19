CREATE DATABASE [dp_6_sql]
GO
USE [db_6_sql]
GO

CREATE TABLE Departments (
    Id INT PRIMARY KEY,
    Name NVARCHAR(100) NOT NULL,
    Building INT NOT NULL,
    CONSTRAINT FK_Departments_Buildings FOREIGN KEY (Building) REFERENCES Buildings(Id)
);

CREATE TABLE Doctors (
    Id INT PRIMARY KEY,
    LastName NVARCHAR(100) NOT NULL,
    DepartmentId INT NOT NULL,
    CONSTRAINT FK_Doctors_Departments FOREIGN KEY (DepartmentId) REFERENCES Departments(Id)
);

CREATE TABLE Donations (
    Id INT PRIMARY KEY,
    Amount DECIMAL(10, 2) NOT NULL,
    DepartmentId INT NOT NULL,
    CONSTRAINT FK_Donations_Departments FOREIGN KEY (DepartmentId) REFERENCES Departments(Id)
);

CREATE TABLE Wards (
    Id INT PRIMARY KEY,
    Name NVARCHAR(100) NOT NULL,
    Capacity INT NOT NULL,
    DepartmentId INT NOT NULL,
    CONSTRAINT FK_Wards_Departments FOREIGN KEY (DepartmentId) REFERENCES Departments(Id)
);

CREATE TABLE ExaminationSchedule (
    Id INT PRIMARY KEY,
    DoctorId INT NOT NULL,
    ExaminationTime TIME NOT NULL,
    CONSTRAINT FK_ExaminationSchedule_Doctors FOREIGN KEY (DoctorId) REFERENCES Doctors(Id)
);

CREATE TABLE Sponsors (
    Id INT PRIMARY KEY,
    Name NVARCHAR(100) NOT NULL
);

CREATE TABLE SponsorDonations (
    Id INT PRIMARY KEY,
    SponsorId INT NOT NULL,
    Amount DECIMAL(10, 2) NOT NULL,
    CONSTRAINT FK_SponsorDonations_Sponsors FOREIGN KEY (SponsorId) REFERENCES Sponsors(Id)
);