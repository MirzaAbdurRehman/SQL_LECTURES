create database School;
use School;

create table Students(
StudentId int primary key,
Name varchar(50) Not Null,
Age int,
Grade varchar(10),
Marks int
);



INSERT INTO Students (StudentId, Name, Age, Grade, Marks) VALUES
(1, 'Alice', 18, 'A', 90),
(2, 'Bob', 17, 'B', 80),
(3, 'Charlie', 19, 'A', 95),
(4, 'David', 18, 'C', 70),
(5, 'Eve', 17, 'B', 85),
(6, 'Jona', 19, 'A', 92),
(7, 'Ken', 18, 'B', 88),
(8, 'Linda', 17, 'C', 75),
(9, 'Mike', 19, 'A', 98),
(10, 'Nancy', 18, 'B', 83);




select MIN(Marks) AS LowestMarks from Students;

select MAX(Marks) AS HighestMarks from Students;

select avg(Marks) AS AvgMarks from Students;

select count(*) AS TotalStudents from Students;

select sum(Marks) AS SumMarks from Students;



/* Group by*/

Select Grade, avg(Marks) AS AvgMarks from Students Group by Grade;

/* Having*/

Select Grade, avg(Marks) AS AvgMarks from Students Group by Grade HAVING avg(Marks) > 78;


/* SYSTEM Functions*/

select GETDATE();

select USER_NAME();


/* Scalar Functions*/

select Upper(Name) as UpperCaseName from Students;

select Lower(Name) as LowerCaseName from Students;

select Len(Name) as NameLength from Students;




/*  Queries  */

create table Employees(
EmpId int primary key,
Name varchar(50) Not Null,
Department varchar(50) Not Null,
Salary int,
joinDate DATE
);


INSERT INTO Employees (EmpId, Name, Department, Salary, joinDate) VALUES
(1, 'John Smith', 'Sales', 60000, '2022-01-15'),
(2, 'Alice Johnson', 'Marketing', 75000, '2021-05-20'),
(3, 'Bob Williams', 'Engineering', 90000, '2020-09-10'),
(4, 'Eva Garcia', 'Human Resources', 65000, '2023-03-01'),
(5, 'Michael Brown', 'Finance', 80000, '2022-07-05'),
(6, 'Sophia Davis', 'Sales', 70000, '2021-11-18'),
(7, 'David Rodriguez', 'Engineering', 100000, '2020-04-25'),
(8, 'Olivia Wilson', 'Marketing', 85000, '2023-06-12'),
(9, 'Daniel Martinez', 'Human Resources', 72000, '2022-12-08'),
(10, 'Mia Anderson', 'Finance', 95000, '2021-02-19');


select max(Salary) As HigestSalary, min(Salary) As LowestSalary from Employees;

select count(*) As TotalEmployees from Employees;

select sum(Salary) As TotalSalary from Employees;

select avg(Salary) As AVGSalary from Employees;




select Department, sum(Salary) As TotalSalary from Employees Group by Department;

select Department, COUNT(*) As TotalEmployees from Employees Group by Department;

select Department,max(Salary) As HigestSalary from Employees Group by Department;


select Department, sum(Salary) As TotalSalary from Employees Group by Department Having  sum(Salary) > 150000;


select Department, avg(Salary) As AvgSalary from Employees Group by Department Having  avg(Salary) > 60000;

select GETDATE() as CurrentDateandTIME;



SELECT Name, YEAR(joinDate) as JoinYear from Employees;

SELECT Name, Datename(MONTH, joinDate) as JoinMonth from Employees;