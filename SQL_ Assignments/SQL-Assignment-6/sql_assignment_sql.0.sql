create database New_assignment_sql_0;

create table Employee
(
Employee_id int primary key,
first_name varchar(100),
last_name varchar(100),
salary int,
joining_date datetime,
department varchar(100),
);

insert into Employee values
(1,'Anika','Arora',100000,'2020-02-14 9:00:00','HR'),
(2,'Veena','Verma',80000,'2011-06-15 9:00:00','Admin'),
(3,'Vishal','Singhal',300000,'2020-02-16 9:00:00','HR'),
(4,'Sushanth','Singh',500000,'2020-02-17 9:00:00','Admin'),
(5,'Bhupal','Bhati',500000,'2011-06-18 9:00:00','Admin'),
(6,'Dheeraj','Diwan',200000,'2011-01-14 9:00:00','Account'),
(7,'Karan','Kumar',75000,'2020-01-14 9:00:00','Account'),
(8,'Chandrika','Chauhan',90000,'2011-04-15 9:00:00','Admin');

create table Employee_bonus
(
Employee_ref_id int,
bonus_amount int,
bonus_date datetime);

insert into Employee_bonus values
(1,5000'2020-02-16 0:00:00'),
(2,3000,'2011-06-16 0:00:00'),
(3,4000,'2020-02-16 0:00:00'),
(1,4500,'2020-02-16 0:00:00'),
(2,3500,'2011-06-16 0:00:00');

create table Employee_title
(
Employee_ref_id int,
Employee_title varchar(100),
Affective_date date);

insert into Employee_title values
(1,'Manager','2016-02-20'),
(2,'Executive','2016-06-11'),
(8,'Executive','2016-06-11'),
(5,'Manager','2016-06-11'),
(4,'Asst.Manager','2016-06-11'),
(7,'Executive','2016-06-11'),
(6,'Lead','2016-06-11 0:00:00'),
(3,'Lead','20165-06-11 0:00:00');

select*from Employee;
select*from Employee_bonus;
select*from Employee_title;

-- Ans.1
select first_name as Employee_name from Employee;

-- Ans.2
select upper(last_name) as last_name from Employee;

--Ans.3
select distinct department from Employee;

--Ans.4
select substring(last_name,1,3) from Employee;

--Ans.5
select distinct department, len(department) as length from Employee;

--Ans.6
select concat(first_name,' ',last_name) as full_name from Employee;

--Ans.7
select * from Employee
order by first_name asc;

--Ans.8
select * from Employee
order by first_name, department desc;

--Ans.9
select *from Employee
where first_name = 'Veena' or first_name = 'Karan';

--Ans.10
select *from Employee
where department = 'Admin';

--Ans.11
select *from Employee
where first_name like '%v%';

--Ans.12
select * from Employee
where salary between 100000 and 500000;

--Ans.13
select * from Employee
where joining_date between '2020-02-01 9:00:00' and '2020-02-28 9:00:00';

--Ans.14
select first_name, last_name from Employee
where salary between 50000 and 100000;

--Ans.15
select department, count(employee_id) as'no.of worker' from Employee
group by department 
order by department desc;

--Ans.16
select * from Employee e
inner join Employee_title et on e.Employee_id = et.Employee_ref_id
where et.Employee_title = 'Manager';

--Ans.17

--Ans.18

--Ans.19

--Ans.20
select top(2) salary from Employee;

--Ans.21
select first_name, last_name from Employee
where salary in
( select salary from Employee
group by salary
having count(*) > 1
);

--Ans.22
select max(salary)  as 'second highest salary' from Employee
where salary < (select max(salary) from Employee);

--Ans.23
select top 50 percent * from Employee;

--Ans.24
select distinct department, count(Employee_id) as 'no. of people' from Employee
group by department
having count(*) < 4;

--Ans.25
select distinct department, count(Employee_id) as 'no. of people' from Employee
group by department;

--Ans.26
select distinct department, concat(first_name,' ',last_name) as'full name' from Employee
where salary in

--Ans.27
select top(1) concat(first_name,' ',last_name) as 'full name' from Employee
where salary = ( select max(salary) from employee);

--Ans.28
select avg(salary) as 'average salary', department from Employee
group by department;

--Ans.29
select e.first_name, e.last_name from Employee e, Employee_bonus eb
where e.Employee_id = eb.Employee_ref_id and eb.bonus_amount = (select max(eb.bonus_amount) from Employee_bonus eb) 

--Ans.30 
select e.first_name, et.employee_title from Employee e
inner join Employee_title et on e.Employee_id = et.Employee_ref_id



