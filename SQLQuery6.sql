create database Organization;

use Organization;



create table Employee(

empId int primary key identity(1,1),
name varchar(50),
age int,
department varchar(50)
);

INSERT INTO Employee (name, age, department)
VALUES 
  ('Alice Smith', 30, 'HR'),
  ('Bob Johnson', 45, 'Finance'),
  ('Charlie Davis', 38, 'Engineering'),
  ('Dana White', 29, 'Marketing'),
  ('Evan Black', 40, 'Sales');

create table Salaries(

salaryId int primary key identity(1,1),
empId int,
salary Decimal(10,2),
bonus decimal(10,2)
Foreign key (empId) References Employee(empId)
);


INSERT INTO Salaries (empId, salary, bonus)
VALUES
  (1, 55000.00, 5000.00),  -- Alice Smith
  (2, 70000.00, 7000.00),  -- Bob Johnson
  (3, 80000.00, 8000.00),  -- Charlie Davis
  (4, 60000.00, 6000.00),  -- Dana White
  (5, 75000.00, 7500.00);  -- Evan Black



-- other SQL statements or commands (if any)
GO

CREATE PROCEDURE GetAllEmployees
AS
BEGIN
   SELECT * FROM Employee;
END;

GO


exec GetAllEmployees;


-- other SQL statements or commands (if any)
GO

CREATE PROCEDURE GetEmployeeId @EmpId int
AS
BEGIN
   SELECT * FROM Employee where empId =  @EmpId;
END;

GO

exec GetEmployeeId @EmpId = 3;




-- other SQL statements or commands (if any)
GO

CREATE PROCEDURE AddEmployee @name varchar(50), @age int , @department varchar(50)
AS
BEGIN
   insert into Employee(name,age,department)  values (@name,@age,@department)

   print('Data Insert Successfully');
END;

GO

exec AddEmployee @name = 'Aman', @age = 23, @department = 'Petroleum' ;




-- other SQL statements or commands (if any)
GO

CREATE PROCEDURE UpdateEmployeeDepartment @empId int, @newDepartment varchar(50)
AS
BEGIN
  update Employee set department = @newDepartment where empId = @empId;

   print('Data Updated Successfully');
END;

GO



exec UpdateEmployeeDepartment @empId = 6, @newDepartment = 'BSCS' ;


-- other SQL statements or commands (if any)
GO

CREATE PROCEDURE DeleteEmployeeee 
    @empId INT
AS
BEGIN
    -- Delete related records from Salaries table first
    DELETE FROM Salaries WHERE empId = @empId;

    -- Then, delete the employee record
    DELETE FROM Employee WHERE empId = @empId;

    PRINT('Data Deleted Successfully');
END;
GO



exec DeleteEmployeeee @empId = 1;












