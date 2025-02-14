USE University;

create table Students(

ID int Identity(1,1) Primary key,
Name varchar(50) Not Null,
Age int Check(Age>= 18),
Email varchar(50) Unique,
Course varchar(50) Default 'Not ASSIGNED'
); 


/*Alter Table Students Add phonenumber varchar(50);*/

/*Insert into Students(Name,Age,Email,Course) values 
('Ali',22,'ali12@gmail.com','BSCS'),
('Salman',22,'Salman@gmail.com','BSSE'),
('shuja',22,'shuja@gmail.com','BSME'),
('abid',22,'abid@gmail.com','BSEE')
; */


INSERT INTO Students (Name, Age, Email, Course) VALUES 
('Ahmed', 22, 'ahmed22@gmail.com', 'BSCS'),
('Hassan', 22, 'hassan@gmail.com', 'BSSE'),
('Zubair', 22, 'zubair@gmail.com', 'BSME'),
('Fahad', 22, 'fahad@gmail.com', 'BSEE'),
('Iqra', 21, 'iqra@gmail.com', 'BSCS'),
('Saad', 23, 'saad@gmail.com', 'BSIT'),
('Rabia', 20, 'rabia@gmail.com', 'BSSE'),
('Kashif', 24, 'kashif@gmail.com', 'BBA'),
('Sania', 22, 'sania@gmail.com', 'BSME'),
('Owais', 21, 'owais@gmail.com', 'BSIT'),
('Fatima', 23, 'fatima@gmail.com', 'BSEE'),
('Danish', 22, 'danish@gmail.com', 'BSCS'),
('Junaid', 24, 'junaid@gmail.com', 'BSME'),
('Nimra', 22, 'nimra@gmail.com', 'BSSE'),
('Rehan', 23, 'rehan@gmail.com', 'BBA');




Insert into Students(Name,Age,Email,Course) values 
('Talha',18,'Talha@gmail.com','CA')
; 


/*Truncate Table Students;*/


/*Drop Table Students; */

update Students set Course = 'Software Engineering'
where Name = 'Ali';

select * from Students;

Delete from Students where Age<=18;

select Email from Students where Course = 'Software Engineering';

select * from Students where Course = 'Software Engineering';


select  * from Students where Age Between 22 AND 24
AND Course in ('BSME', 'BBA');

/* SELECT * FROM Students WHERE Name LIKE '%A'; */

SELECT * FROM Students WHERE Name LIKE '%A%';

SELECT * FROM Students WHERE Name LIKE 'A%';

SELECT * FROM Students WHERE Name LIKE '_A%';


create table Cou(

ID int Identity(1,1) Primary key,
Name varchar(50) Not Null,
Age int Check(Age>= 18),
Email varchar(50) Unique,
Course varchar(50) Default 'Not ASSIGNED'
); 


Drop Table Students; 




create table Courses(
CourseID INT IDENTITY(1,1) PRIMARY KEY,
CourseName varchar(50) NOT NULL UNIQUE
); 


-- Inserting data into the Courses table
INSERT INTO Courses (CourseName) VALUES
('Computer Science'),
('Software Engineering'),
('Mechanical Engineering'),
('Electrical Engineering'),
('Information Technology'),
('Business Administration'),
('Civil Engineering'),
('Artificial Intelligence'),
('Cyber Security'),
('Data Science');

SELECT * FROM Courses;




create table Students(

ID int Identity(1,1) Primary key,
Name varchar(50) Not Null,
Age int Check(Age>= 18),
Email varchar(50) Unique,
CourseID int ,

CONSTRAINT FK_Course FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
); 



-- Inserting data into Students table
INSERT INTO Students (Name, Age, Email, CourseID) VALUES 
('Ahmed', 22, 'ahmed22@gmail.com', 1),  -- Computer Science
('Hassan', 23, 'hassan@gmail.com', 2),  -- Software Engineering
('Zubair', 21, 'zubair@gmail.com', 3),  -- Mechanical Engineering
('Fahad', 24, 'fahad@gmail.com', 4),  -- Electrical Engineering
('Iqra', 20, 'iqra@gmail.com', 1),  -- Computer Science
('Saad', 25, 'saad@gmail.com', 5),  -- Information Technology
('Rabia', 22, 'rabia@gmail.com', 2),  -- Software Engineering
('Kashif', 24, 'kashif@gmail.com', 6),  -- Business Administration
('Sania', 23, 'sania@gmail.com', 3),  -- Mechanical Engineering
('Owais', 22, 'owais@gmail.com', 5),  -- Information Technology
('Fatima', 26, 'fatima@gmail.com', 4),  -- Electrical Engineering
('Danish', 22, 'danish@gmail.com', 1),  -- Computer Science
('Junaid', 24, 'junaid@gmail.com', 3),  -- Mechanical Engineering
('Nimra', 23, 'nimra@gmail.com', 2),  -- Software Engineering
('Rehan', 21, 'rehan@gmail.com', 6);  -- Business Administration


SELECT * FROM Students;



Select Students.Name, Courses.CourseName FROM Students INNER JOIN Courses ON 
Students.CourseID = Courses.CourseID;


Select Students.Name,Students.Email, Courses.CourseName FROM Students LEFT JOIN Courses ON 
Students.CourseID = Courses.CourseID;

Select Students.Name,Students.Email, Courses.CourseName FROM Students RIGHT JOIN Courses ON 
Students.CourseID = Courses.CourseID;


Select Students.Name,Students.Email, Courses.CourseName FROM Students Full Outer JOIN Courses ON 
Students.CourseID = Courses.CourseID;