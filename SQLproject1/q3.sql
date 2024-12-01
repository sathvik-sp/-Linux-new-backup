-- Create the CompanyDB database
CREATE DATABASE CompanyDB;

-- Use the created database
USE CompanyDB;

CREATE TABLE Departments (
    DepartmentID INT IDENTITY(1,1) PRIMARY KEY,
    DepartmentName VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE Employees (
    EmployeeID INT IDENTITY(1,1) PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    DepartmentID INT,
    HireDate DATE DEFAULT GETDATE(),
    Email VARCHAR(100) UNIQUE,
    Salary DECIMAL(10, 2) NOT NULL DEFAULT 0.00,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

EXEC sp_help 'Departments';
EXEC sp_help 'Employees';

ALTER TABLE Employees
ADD JobTitle VARCHAR(50);

ALTER TABLE Employees
DROP COLUMN JobTitle;

-- EXEC sp_help 'Departments';
EXEC sp_help 'Employees';

