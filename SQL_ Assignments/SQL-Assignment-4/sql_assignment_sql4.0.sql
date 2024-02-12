create database sql_assignment_sql_4_0
use sql_assignment_sql_4_0

create table Studies
(
PNAME varchar(100),
INSTITUTE varchar(100),
COURSE varchar(100),
COURSE_FEE int,
);

insert into Studies values
('ANAND','SABHARI','PGDCA',4500),
('ALTAF','COIT','DCA',7200),
('JULIANA','BDPS','MCA',22000),
('KAMALA','PRAGATHI','DCA',5000),
('MARY','SABHARI','PGDCA',4500),
('NELSON','PRAGATHI','DAP',6200),
('PATRICK','PRAGATHI','DCAP',5200),
('QADIR','APPLE','HDCA',14000),
('RAMESH','SABHARI','PGDCA',4500),
('REBECCA','BRILLIANT','DCAP',11000),
('REMITHA','BDPS','DCS',6000),
('REVATHI','SABHARI','DAP',5000),
('VIJAYA','BDPS','DCA',48000);

create table Software
(
PNAME varchar(100),
TITLE varchar(100),
DEVELOPIN varchar(100),
SCOST float,
DCOST float,
SOLD int);

insert into Software values
('MARY','README','CPP',300,1200,84),
('ANAND','PARACHUTES','BASIC',399.95,6000,43),
('ANAND','VIDEO TITLING','PASCAL',7500,16000,9),
('JULIANA','INVENTORY','COBOL',3000,3500,0),
('KAMALA','PAYROLL PKG.','DBASE',9000,20000,7),
('MARY','FINANCIAL ACCT.','ORACLE',18000,85000,4),
('MARY','CODE GENERATOR','C',4500,20000,23),
('PATTRICK','README','CPP',300,1200,84),
('QADIR','BOMBS AWAY','ASSEMBLY',750,3000,11),
('QADIR','VACCINES','C',1900,3100,21),
('RAMESH','HOTEL MGMT.','DBASE',13000,35000,4),
('RAMESH','DEAD LEE','PASCAL',599.95,4500,73),
('REMITHA','PC UTILITIES','C',725,5000,51),
('REMITHA','TSR HELP PKG','ASSEMBLY',2500,6000,7),
('REVATHI','HOSPITAL MGMT.','PASCAL',1100,75000,2),
('VIJAYA','TSR EDITOR','C',900,700,6);

create table Programmer
(
PNAME varchar(100),
DOB date,
DOJ date,
GENDER varchar(100),
PROF1 varchar(100),
PROF2 varchar(100),
SALARY int
);

insert into Programmer values
('ANAND','12-Apr-66','21-Apr-92','M','PASCAL','BASIC',3200),
('ALTAF','02-Jul-64','13-Nov-90','M','CLIPPER','COBOL',2800),
('JULIANA','31-Jan-60','21-Apr-90','F','COBOL','DBASE',3000),
('KAMALA','30-Oct-68','02-Jan-92','F','C','DBASE',2900),
('MARY','24-Jun-70','01-Feb-91','F','CPP','ORACALE',4500),
('NELSON','11-Sep-85','11-Oct-89','M','COBOL','DBASE',2500),
('PATTRICK','10-Nov-65','21-Apr-90','M','PASCAL','CLIPPER',2800),
('QADIR','31-Aug-65','21-Apr-91','M','ASSEMBLY','C',3000),
('RAMESH','03-May-67','28-Feb-91','M','PASCAL','DBASE',3200),
('REBECCA','01-Jan-67','01-Dec-90','F','BASIC','COBOL',2500),
('REMITHA','19-Apr-70','20-Apr-93','F','C','ASSEMBLY',3600),
('REVATHI','02-Dec-69','02-Jan-92','F','PASCAL','BASIC',3700),
('VIJAYA','14-Dec-65','02-May-92','F','FOXPRO','C',3500);

select*from Studies;
select*from Software;
select*from Programmer;

--Ans.1
select distinct scost as 'cost' from Software
where dcost = (select max(dcost) from Software);

--Ans.2
select*from software
where (scost*sold) > 2000;

--Ans.3
select distinct pname from Programmer
where month(dob) = month(getdate());

--Ans.4
select pname, sum(dcost) as'cost' from Software
group by pname;

--Ans.5
select pname, sum(scost*sold) as 'sales' from Software
group by pname;

--Ans.6
select pname, sum(sold) as'no of packages' from software
group by pname;

--Ans.7
select pname, max(dcost) as'max dcost', min(dcost) as'min dcost' from Software
group by pname;

--Ans.8
select institute, count(course) as'no. of courses',avg(course_fee) as'avg cost per course' from Studies
group by institute;

--Ans.9
select INSTITUTE, count(pname) as'no. of student' from Studies
group by institute;

--Ans.10
select distinct s.pname, st.institute from Software s
inner join Studies st on s.pname = st.pname;

--Ans.11
select st.COURSE_FEE, count(s.title) as'no. of package' from Software s
inner join Studies st on s.pname = st.pname
where st.COURSE_FEE = (select min(course_fee) from Studies) 
group by st.COURSE_FEE;

--Ans.12
select p.pname,(s.scost*s.sold) as'sales', avg(p.salary) as'avg salary' from Programmer p
inner join Software s on p.pname = s.pname
where (s.scost*s.sold) > 50000 
group by p.pname, (s.scost*s.sold);

--Ans.13
select distinct p.prof1 as'language not used' from Programmer p
inner join Software s on p.pname = s.pname
where p.prof1 not in (select DEVELOPIN from Software)
union
select distinct p.prof2 as'language not used' from Programmer p
inner join Software s on p.pname = s.pname
where p.PROF2 not in (select DEVELOPIN from Software);

--Ans.14
select s.title as'software', st.institute, sum(s.scost*s.sold) as'total sales' from Software s
inner join Studies st on s.pname = st.pname
group by st.INSTITUTE, s.title
order by st.INSTITUTE; 

--Ans.15
select s.pname, s.title, s.DEVELOPIN, s.SCOST, s.DCOST, s.SOLD from Software s
inner join Programmer p on s.pname = p.pname 
inner join Studies st on s.pname = st.pname
where s.DEVELOPIN = 'c' and p.GENDER = 'f' and st.INSTITUTE = 'pragathi';

--Ans.16
select distinct s.pname, s.title, s.DEVELOPIN, s.SCOST, s.DCOST, s.SOLD from Software s
inner join Programmer p on s.pname = p.pname
where s.DEVELOPIN = 'pascal' and p.gender = 'f';

--Ans.17
select max(prof1) as'languages', count(prof1) as'preferences' from Programmer 
union
select max(prof2) as'languages', count(prof2) as'preferences' from Programmer;

--Ans.18
select top(1) max(s.scost) as'max cost', s.pname from Software s
group by s.pname;

--Ans.19
select top(1) max(s.dcost) as'max dcost', s.title from Software s 
group  by s.title
order by max(s.dcost) desc;

--Ans.20
select top(1) max(p.salary) as'salary', p.pname from Programmer p
where p.GENDER = 'f'
group by p.pname
order by max(p.salary) desc;

--Ans.21
select distinct p.pname, s.title from Programmer p
inner join Software s on p.pname = s.pname;

--Ans.22
select s.title, s.developin from Software s
where s.DEVELOPIN not in ('c', 'c++');

--Ans.23
select s.title, avg(s.dcost-s.scost) as'avg difference' from Software s
group by s.title;

--Ans.24
select pname, sum(scost) as'total scost', sum(dcost) as'total dcost', sum(dcost-(sold*scost)) as'amount to be recovered' from Software
group by pname
having sum(dcost) > sum(sold*scost);

--Ans.25
select top(1) p.salary, p.pname from Programmer p
where prof1 = 'c' or prof2 = 'c'
group by p.pname,p.salary
order by p.salary desc;

--Ans.26
select top(1) p.salary, p.pname from Programmer p
where p.GENDER = 'f' 
group by p.pname, p.salary
order by p.salary desc;


