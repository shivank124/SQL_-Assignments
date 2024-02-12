create database New_assignment_sql_3_0
use New_assignment_sql_3_0
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
select count(pname) as'no pascal and c' from Programmer
where prof1 not in ('pascal','c') and prof2 not in('pascal','c');

--Ans.2
select*from Programmer
where prof1 not in ('pascal','clipper','cobol') and prof2 not in('pascal','clipper','cobol');

--Ans.3
select developin, avg(dcost) as 'avg dcost', avg(scost) as 'avg scost', avg(scost) as 'avg price per copy' from Software
group by developin;

--Ans.4
select s.pname, count(developin) as 'no.of packages' from Programmer p, Software s
where s.pname = p.pname
group by s.pname;

--Ans.5
select count(*) as 'no. of packages'  ,sum((scost*sold)-dcost) as 'PROFIT' from software
where developin in (select prof1 from programmer)
group by developin
union
select count(*) as 'no. of packages'  ,sum((scost*sold)-dcost) as 'PROFIT' from software
where developin in (select prof2 from programmer)
group by developin;

--Ans.6
with cte1 as
(select s.pname, count(s.pname) as 'no.of packages', max(datediff(yyyy,doj,getdate())) as 'experience' from Software s
left join Programmer p on s.pname = p.pname group by s.pname)

select*from cte1
join Studies st on cte1.pname = st.pname
where st.INSTITUTE = 'bdps';

--Ans.7
select count(developin) as 'packages developed' from software s 
left join programmer p  on s.pname = p.pname
where gender = 'f' and salary > (select max(salary) from Programmer p where p.gender = 'm');

--Ans.8
select s.pname, p.salary, st.course from Software s, Programmer p, Studies st
where s.pname = p.pname and s.pname = st.pname and s.scost = (select max(s.scost) from Software s)
group by s.pname, p.salary, st.course;

--Ans.9
select st.pname, st.institute, s.dcost from Studies st, Software s
where s.dcost = (select max(s.dcost) from software s)
group by st.pname, st.institute, s.dcost;

--Ans.10
select p.pname from Programmer p
where p.pname not in (select s.pname from Software s);

--Ans.11
select s.pname, s.title, s.DEVELOPIN, s.scost, s.dcost, s.sold from Software s left join Programmer p on s.pname = p.pname and
 (s.DEVELOPIN not in (p.prof1) and s.DEVELOPIN not in (p.prof2))
group by s.pname, s.title, s.DEVELOPIN, s.scost, s.dcost, s.sold

--Ans.12
select distinct s.* from Software s, Programmer p where
p.gender = 'm' and p.dob < '1965-01-01' union
select distinct s.* from Software s, Programmer p where
p.gender = 'f' and p.dob > '1975-12-31';


--Ans.13
Select st.pname, count(s.developin) as 'no pf packages', count(s.sold) as 'no of copies sold', sum(s.sold*s.scost) as' sales value' from software s,studies st 
where s.pname=st.pname 
group by st.pname;

--Ans.14
select s.pname, s.title, s.DEVELOPIN, s.SCOST, s.DCOST, s.SOLD, p.salary from Software s, Programmer p 
where s.pname = p.pname and p.salary > 3000
group by s.pname, s.title, s.DEVELOPIN, s.SCOST, s.DCOST, s.SOLD, p.salary;

--Ans.15
select p.pname from Programmer p
where p.gender = 'f' and salary > (select max(salary) from Programmer p where p.gender = 'm');

--Ans.16
select p.pname from Programmer p
where p.gender = 'm' and salary < (select avg(salary) from Programmer p where p.gender = 'f');

--Ans.17
select pname, developin from Software where sold in (select max(sold) from Software group by pname)
union
select pname, developin from Softwarewhere sold in (select min(sold) from Software group by pname);

--Ans.18
select title from Software where sold < (select avg(sold) from Software);

--Ans.19
select title from Software where dcost = (select max(dcost) from Software where DEVELOPIN = 'pascal')
group by title;

--Ans.20
select s.title, s.sold, min(dcost-scost) from Software s
group by s.title, s.sold;-- I tried this one but I doubted this might not be the correct ans. pls send your feed back regarding this question. Thankyou 

--Ans.21
select distinct developin, scost from Software 
where scost = (select max(scost) from Software);

--Ans.22
select distinct pname from Software 
where sold = (select min(sold) from Software);

--Ans.23
select distinct course from Studies 
where course_fee < (select avg(course_fee)+1000 from Studies) 
union 
select distinct course from studies 
where course_fee > (select avg(course_fee)-1000 from Studies);

--Ans.24
select distinct institute, course from Studies
where course_fee < (select avg(course_fee) from Studies);

--Ans.25
select distinct institute from Studies
where COURSE_FEE = (select max(course_fee) from Studies);

--Ans.26
select distinct course from Studies where course_fee = (select max(course_fee) from Studies);