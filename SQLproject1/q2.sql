CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName NVARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName NVARCHAR(50) NOT NULL,
    LastName NVARCHAR(50),
    DepartmentID INT,
    Salary DECIMAL(18, 2),  -- Assuming Salary field is added
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

ALTER TABLE Employees
ADD CONSTRAINT Default_DepartmentID DEFAULT 1 FOR DepartmentID;

ALTER TABLE Employees
ADD CONSTRAINT Salary_Check CHECK (Salary >= 0);

-- Insert values into Departments
INSERT INTO Departments (DepartmentID, DepartmentName)
VALUES 
(1, 'Human Resources'),
(2, 'IT'),
(3, 'Finance');

-- Insert valid employees
INSERT INTO Employees (EmployeeID, FirstName, LastName, DepartmentID, Salary)
VALUES
(101, 'John', 'Doe', 1, 50000.00),    -- HR Department
(102, 'Jane', 'Smith', 2, 70000.00),  -- IT Department
(103, 'Emily', 'Johnson', 3, 60000.00);-- Finance Department

-- Insert an employee with a default DepartmentID (will be set to 1 by default)
INSERT INTO Employees (EmployeeID, FirstName, LastName, Salary)
VALUES
(104, 'Michael', 'Brown', 45000.00);  -- DepartmentID will default to 1 (HR)

-- Insert an employee with a negative salary (this will fail due to the CHECK constraint)
INSERT INTO Employees (EmployeeID, FirstName, LastName, DepartmentID, Salary)
VALUES
(105, 'Sarah', 'Davis', 2, -10000.00);  -- This will throw an error due to the CHECK constraint

select *from Departments;
select *from Employees;

DROP TABLE Departments;
DROP TABLE Employees;

DROP TABLE Employees;
DROP TABLE Departments;