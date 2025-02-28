create database SchoolDB;

USE SchoolDB;

CREATE TABLE Students(

stdID int primary key identity(1,1),
name varchar(50),
age int,
grade varchar(100)
);


INSERT INTO Students (name, age, grade)
VALUES
    ('John Doe', 20, 'A'),
    ('Jane Smith', 22, 'B'),
    ('Emily Johnson', 19, 'A'),
    ('Michael Brown', 21, 'C');


CREATE TABLE StudentLogs(

LogID int primary key identity(1,1),
stdname varchar(50),
actionType varchar(50),
grade varchar(100),

);




CREATE TRIGGER after_student_insert
ON Students
AFTER INSERT
AS
BEGIN
    INSERT INTO StudentLogs (stdname, actionType)
    SELECT name, 'Insert' FROM INSERTED;
END;



insert into Students(name,age,grade) values ('ahmed',22,'A' );


select * from StudentLogs;
select * from Students;




/* before_student_insert   it is not allowd in sql but we acieve this thorugh this keyword ...>  INSTEAD OF INSERT*/ 


CREATE TRIGGER before_student_insert
ON Students
INSTEAD OF INSERT
AS
BEGIN
    -- Insert the data with the name converted to uppercase
    INSERT INTO Students (name, age, grade)
    SELECT UPPER(name), age, grade
    FROM INSERTED;
END;


CREATE TRIGGER after_student_update
ON Students
AFTER Update
AS
BEGIN
    INSERT INTO StudentLogs (stdname, actionType)
    SELECT name, 'Updated' FROM INSERTED;
END;


SELECT * FROM sys.triggers WHERE name = 'after_student_update';


-- Assuming you already have data in the Students table
UPDATE Students
SET name = 'Saad'
WHERE stdID = 1;




CREATE TRIGGER after_Employee_update
ON Students
AFTER Update
AS
BEGIN
    INSERT INTO StudentLogs (stdname, actionType)
    SELECT name, 'Updated' FROM INSERTED;
END;


drop trigger trg_student_delete;




CREATE TRIGGER trg_student_delete
ON Students
AFTER DELETE
AS
BEGIN
    INSERT INTO StudentLogs (stdname, actionType)
    SELECT name, 'Deleted' FROM DELETED;
END;

delete from Students where stdID = 1;