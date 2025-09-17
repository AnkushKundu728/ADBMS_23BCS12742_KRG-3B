/*
sub query also defined as nested query
a query inseide other query
Q1(Q2(Q3())
execution order Q3>Q2>Q1
operator used in subquery
1.Arthimetic :<,>,<=,>=(<>)not equal to
return one value
2. In in return mulptple value like list
3.not in
4.any
5.all
Type of subquery
1 Scaler SQ
which retun single output 9,Aman etc
2 Multirow/Valued SQ
which return multplie row or col
3 Self contained SQ
which do not have any dependancy on outer query
4 CO-Related SQ
which have dependacy on outer query
Q1(Q2(Q1))
*/


--Task to find second higest salary
/*
1 find max salary of first table
2 find max salary from table but excluding (62000)
Systax 
select
from
Join
tabl name
where
group by
having
order by

Imp SQ ARE the replacement of joins

Select Max(Salary) 
from MyEmployee 
where salary Not in (Select Max(Salary) from MyEmployee)

--1. scaler Query
Select * from Myemployee where Dept_id in -- in take one by one where = take all at a time
(Select Id from Department
where depatment_name='Account')
--2 Multi-valued SQ
Select* from myEmployee where EMpname in
(Select 
from myEmployees 
where Gender='Male')

--3 Self contained SQ
Select * from Myemployee where Dept_id in -- in take one by one where = take all at a time
(Select Id from Department
where depatment_name='Account')

--Corelated SQ
Select *
from MyEmployees
where DeptId in(Select id from dept where Gender='Male')
*/

create database KrgB;
CREATE TABLE MyEmployees (
    EmpId INT PRIMARY KEY IDENTITY(1,1),
    EmpName VARCHAR(50),
    Gender VARCHAR(10),
    Salary INT,
    City VARCHAR(50),
    Dept_id INT
);
INSERT INTO MyEmployees (EmpName, Gender, Salary, City, Dept_id)
VALUES
('Amit', 'Male', 50000, 'Delhi', 2),
('Priya', 'Female', 60000, 'Mumbai', 1),
('Rajesh', 'Male', 45000, 'Agra', 3),
('Sneha', 'Female', 55000, 'Delhi', 4),
('Anil', 'Male', 52000, 'Agra', 2),
('Sunita', 'Female', 48000, 'Mumbai', 1),
('Vijay', 'Male', 47000, 'Agra', 3),
('Ritu', 'Female', 62000, 'Mumbai', 2),
('Alok', 'Male', 51000, 'Delhi', 1),
('Neha', 'Female', 53000, 'Agra', 4),
('Simran', 'Female', 33000, 'Agra', 3);
create table dept(
	id int unique not null, 
	Dept_Name varchar(20) not null
)

insert into dept values(1, 'Accounts');
insert into dept values(2, 'HR');
insert into dept values(3, 'Admin');
insert into dept values(4, 'Counselling');

Select Max(Salary) from MyEmployees where Salary NOT IN 
(select Max(Salary) from MyEmployees)

Select * from MyEmployees 
where Dept_id=(Select Id from dept where Dept_Name='Accounts')
--Task Duplicate
create table employee(empid int);
insert into employee values(1),(2),(2),(3),(3),(5),(5),(7);
select Max(empid) from employee where empid not in
(select empid 
from employee 
group by empid
having count(empid)>0
)
/* how to table are join
use joins
use subquery
use set operation
*/



