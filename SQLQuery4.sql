create database Company;
use Company;


CREATE TABLE Employee (
    EmpId INT PRIMARY KEY,
    Name VARCHAR(255),
    DepartmentId INT,
    Salary DECIMAL(10, 2)
);


INSERT INTO Employee (EmpId, Name, DepartmentId, Salary) VALUES
(1, 'John Doe', 101, 50000.00),
(2, 'Jane Smith', 102, 60000.00),
(3, 'Peter Jones', 101, 55000.00),
(4, 'Mary Brown', 103, 70000.00),
(5, 'David Lee', 102, 65000.00),
(6, 'Lisa Kim', 101, 52000.00),
(7, 'Paul Garcia', 103, 72000.00),
(8, 'Sarah Chen', 102, 63000.00),
(9, 'Michael Rodriguez', 101, 58000.00),
(10, 'Jennifer Wilson', 104, 80000.00);


CREATE TABLE Department (
    DepartmentId INT PRIMARY KEY,
    DepartmentName VARCHAR(255)
);


INSERT INTO Department (DepartmentId, DepartmentName) VALUES
(101, 'Sales'),
(102, 'Marketing'),
(103, 'Engineering'),
(104, 'Human Resources'),
(105, 'Finance'),
(106, 'IT'),
(107, 'Research and Development'),
(108, 'Customer Service'),
(109, 'Operations'),
(110, 'Administration');


/* Scalar SubQuery */

select Name, Salary  from Employee where Salary > (select avg(Salary) from Employee);

/* Multi Row SubQuery */

Select Name from Employee where DepartmentId = (select DepartmentId from Employee where Name = 'Lisa Kim');

Select Name from Employee where DepartmentId = (select DepartmentId from Employee where Name = 'Jennifer Wilson');



/* SubQuery Form Clause */

Select DepartmentId , avg(Salary) as AvgSalary from Employee group by DepartmentId;

select Name,Salary, DepartmentId from Employee E where Salary > 
(select avg(Salary) from Employee where DepartmentId = E.DepartmentId);

/* Corelated SubQuery */

select Name,Salary, DepartmentId from Employee E1 where Salary = 
(select Max(Salary) from Employee E2 where E1.DepartmentId = E2.DepartmentId );

/*  SubQuery with Exists */

select DepartmentName from Department D where EXISTS 
(select 1 from Employee E where E.DepartmentId = D.DepartmentId);