create database BankDb;
use BankDb;

create table Accounts(
accID int primary key identity(1,1),
name varchar(100),
balance decimal(10,2)
);


INSERT INTO Accounts (name, balance) VALUES
('John Doe', 1000.50),
('Jane Smith', 5000.75),
('Peter Jones', 2500.00),
('Sarah Brown', 10000.25);



begin Transaction;

update Accounts set balance = balance - 1000.0 where name = 'Jane Smith';

update Accounts set balance = balance + 300.0 where name = 'John Doe';

select * from  Accounts;

/* if everything is working fine.*/

commit;



begin Transaction;

update Accounts set balance = balance - 8000.0 where name = 'Sarah Brown';

select * from Accounts;

ROLLBACK;

SELECT * FROM Accounts;


SELECT * FROM Accounts





create table Products(
pID int primary key identity(1,1),
name varchar(100),
stock int not null
);

select * from Products;

INSERT INTO Products (name, stock) VALUES
('Laptop', 50),
('Mouse', 100),
('Keyboard', 75),
('Monitor', 30);

create table Orders(
orderID int primary key identity(1,1),
pID int,
quantity int,
foreign key (pID) references Products(pID)
);



begin Transaction;

update Products set stock = stock - 2 where pID = 1;

insert into Orders(pID, quantity) values(1,2)

select * from  Products where pID = 1;

/* if everything is working fine.*/
commit;






begin Transaction;

update Products set stock = stock - 55 where pID = 1;

insert into Orders(pID, quantity) values(1,20)

select * from  Products where pID = 1;

ROLLBACK;

SELECT * FROM Products;

