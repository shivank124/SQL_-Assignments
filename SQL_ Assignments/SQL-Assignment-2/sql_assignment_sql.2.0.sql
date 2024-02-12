create database New_assignment_sql_2_0
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
select max(sold) as 'highest no. of copies' from Software;

--Ans.2
select min(course_fee) as 'lowest corse fee' from Studies;

--Ans.3
select max(datediff(yyyy,dob,getdate())) as 'age of the olderst programmer' from Programmer;

--Ans.4
select avg(datediff(yyyy,dob,getdate())) as 'avg age of female progrramer' from Programmer
where gender = 'f';

--Ans.5
select distinct pname, datediff(yyyy,doj,getdate()) as 'experience in years' from programmer
order by pname desc;

--Ans.6
select count(pname) as 'no. of programmer done pgdca' from Studies
where COURSE = 'pgdca';

--Ans.7
select sum(scost*sold) as 'revenue of package developed in c' from Software
where DEVELOPIN = 'c';

--Ans.8
select count(pname) as 'no. of programmer studied at sabhari' from Studies
where INSTITUTE = 'sabhari';

--Ans.9
select count(developin) as 'Packages Developed in DBASE' from Software
where DEVELOPIN = 'dbase';

--Ans.10
select count(pname) as 'no. of programmer studied at pragathi' from Studies
where INSTITUTE = 'pragathi';

--Ans.11
select count(pname) as 'no. of programmer' from Studies
where COURSE_FEE between 5000 and 10000;

--Ans.12
select count(pname) as 'no. of programmer' from Programmer
where prof1 = 'cobol' or prof2 = 'pascal'; 

--Ans.13
select count(gender) as 'no. of female programmer' from programmer
where gender = 'f';

--Ans.14
select avg(salary) as 'average salary' from Programmer;

--Ans.15
select count(salary) as'no. of people' from Programmer
where salary between 2000 and 4000;

--Ans.16
select DEVELOPIN, sum(scost) as 'sales cost' from Software
group by DEVELOPIN;

--Ans.17 
with cte1 as
(select s.pname, s.title, s.developin, s.scost, s.dcost, s.sold from Software s
left join Studies st on s.pname = st.pname
where st.INSTITUTE = 'sabhari'),
cte2 as
(select s.pname, s.title, s.developin, s.scost, s.dcost, s.sold from Software s
left join Programmer p on s.pname = p.pname
where p.gender = 'm')

select *from cte1 inner join cte2 on
cte1.pname = cte2.pname;


--Ans.18
select pname from Programmer
where doj = (select min(doj)from Programmer
			 where datepart(yyyy,doj) like '1992');

--Ans.19
select distinct pname from Programmer
where dob = (select max(dob) from Programmer
			where datepart(yyyy,dob) like '1965');

--Ans.20
select min(scost) as 'lowest selling cost' from Software;

--Ans.21
select pname from Programmer
where salary > 3000 and gender = 'f' and
(prof1 not in ('c','c++','oracle','dbase') or 
prof2 not in ('c','c++','oracle','dbase'));

--Ans.22
select distinct pname from Programmer
where dob = (select max(dob) from Programmer) and
(prof1 like 'dbase' or prof2 like 'dbase');

--Ans.23
select prof1 from Programmer 
group by prof1
having prof1 not in (select prof2 from Programmer)
and count(prof1) = 1
union
select prof2 from Programmer
group by prof2
having prof2 not in (select prof1 from Programmer)
and count(prof2) = 1;

--Ans.24
select distinct pname from Programmer
where doj = (select min(doj) from Programmer)
and gender = 'm';

--Ans.25
select distinct pname from Programmer
where doj = (select max(doj) from Programmer);

--Ans.26
select title as 'no.of packages', developin from Software
where dcost < 1000 
group by title, DEVELOPIN;

--Ans.27
select max(salary) as ' highest salary', min(salary) as 'lowest salary', avg(salary) as 'avg salary' from Programmer
where salary > 2000;