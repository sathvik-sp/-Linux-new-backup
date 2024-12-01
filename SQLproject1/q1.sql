CREATE TABLE Employees ( 
    EmployeeID INT PRIMARY KEY, 
    FirstName NVARCHAR(50) NOT NULL, 
    LastName NVARCHAR(50) NOT NULL, 
    Department NVARCHAR(50), 
    HireDate DATE DEFAULT GETDATE(), 
    Email NVARCHAR(100) UNIQUE 
); 

INSERT INTO Employees (EmployeeID, FirstName, LastName, Department, HireDate, Email) 
VALUES 
(1, 'John', 'Doe', 'HR', '2024-01-10', 'john.doe@example.com'),
(2, 'Jane', 'Smith', 'IT', '2023-03-22', 'jane.smith@example.com'),
(3, 'Mike', 'Johnson', 'Sales', '2022-06-30', 'mike.johnson@example.com'),
(4, 'Emily', 'Davis', 'Marketing', '2021-07-15', 'emily.davis@example.com'),
(5, 'David', 'Martinez', 'Finance', '2023-10-05', 'david.martinez@example.com'),
(6, 'Sophia', 'Garcia', 'HR', '2024-02-25', 'sophia.garcia@example.com'),
(7, 'Daniel', 'Rodriguez', 'IT', '2021-09-08', 'daniel.rodriguez@example.com'),
(8, 'Olivia', 'Wilson', 'Sales', '2022-11-14', 'olivia.wilson@example.com'),
(9, 'James', 'Moore', 'Finance', '2023-12-01', 'james.moore@example.com'),
(10, 'Isabella', 'Taylor', 'Marketing', '2024-05-17', 'isabella.taylor@example.com');

select *from Employees;
EXEC sp_help 'Employees';

ALTER TABLE Employees
ADD Salary DECIMAL(10, 2) NOT NULL DEFAULT 0.00;

EXEC sp_help 'Employees';

DROP TABLE Employees;

IF OBJECT_ID('Employees', 'U') IS NOT NULL
BEGIN
    IF EXISTS (SELECT 1 FROM Employees)
    BEGIN
        SELECT * FROM Employees;
    END
    ELSE
    BEGIN
        PRINT 'The table exists, but it is empty.';
    END
END
ELSE
BEGIN
    PRINT 'The Employees table does not exist.';
END

