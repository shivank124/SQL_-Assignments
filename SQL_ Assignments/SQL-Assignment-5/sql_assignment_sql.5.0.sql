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
SELECT DISTINCT PNAME, SALARY as 'Salary in prof1', PROF1 FROM PROGRAMMER
WHERE (SALARY) IN (SELECT MAX(SALARY) FROM PROGRAMMER GROUP BY PROF1)

SELECT DISTINCT PNAME, SALARY as 'Salary in prof2', PROF2 FROM PROGRAMMER
WHERE (SALARY) IN (SELECT MAX(SALARY) FROM PROGRAMMER GROUP BY PROF2)

--Ans.2

--Ans.3
select p1.pname, p1.doj from Programmer p1, Programmer p2
where p1.DOJ = p2.DOJ and p1.pname = p2.pname

--Ans.4
select PNAME, PROF2 from programmer
where prof2 in (select prof2 from programmer group by prof2 having count(*) >1);

--Ans.5
select distinct s.pname, s.sold, st.institute from Software s
join Studies st on s.pname = st.pname
where s.scost in (select min(s.scost) from Software s)
