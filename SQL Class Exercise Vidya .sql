show databases;
create database Practicedb10;
use practicedb10;
show tables;
create table Students (sid int, Sname char(30), Age int, Course char(20));
desc students;
-- Comment
describe students;
insert into students values (1, "Ram", 27, "Mysql");
insert into students values (2, "John", 28, "DA");
select * from students;
create table Patients (Pid int, Pname varchar(30), DOB date, TOA datetime);
insert into patients values (1, "XYZ", "1996-05-08", "2024-04-15 16:50:00");
insert into patients values (2, "ABC", "1999-09-15", now());
select * from patients;
select year(DOB) from Patients;
select monthname(dob) as Month_Name from patients;
select now();
select 2+3;
select 2 > 3;
select 2 < 3 as Result;
-- DDL Data Definition Language
desc students;
-- Alter
alter table students add column Marks int;
alter table students drop column Age;
alter table students modify column Sname varchar(30);
alter table students change column sid std_id int;
alter table students rename to Mystudents;
desc mystudents;
-- Drop
create table sample (sid varchar(60));
drop table sample;
-- Rename
Rename table mystudents to students;
-- DML Data Manipulation Language
-- Insert
select * from students;
insert into students (std_id, sname, marks) values (3, "Siri", 90) , (4, "Tom", 70);

-- Update
set sql_safe_updates = 0;
update students set sname = "Johnson" where std_id = 2;
-- Null
select 2 = 2 as Result;
select 2>3 as Result;
select 2 = null as Result;
select 2 is null as Result;
select 2 is not null as Result;
-- Update
update students set marks = 0 where marks is null;
select * from students;
update students set course = "MySql" where sname = "siri" and marks = 90;
update students set sname = "John", marks = 70 where std_id = 2;
update students set course = "Sql";
update students set marks = null where std_id = 1;
-- Delete
delete from students where std_id = 4;
select * from students;
delete from students where marks is null;
delete from students;
-- Truncate
select * from patients;
truncate table patients;
-- DQL Data Query Language
select * from myemp;
select * from myemp limit 5;
select * from myemp limit 50,5;
select emp_id, first_name, last_name, salary, salary * 0.2 as Bonus from myemp;
select emp_id, first_name, last_name, salary + salary * 0.2 as Total_Salary from myemp;
select emp_id, salary + (salary * 0.2) as Total from myemp;
-- Distinct
select distinct dep_id from myemp;
select distinct dep_id,mgr_id from myemp;
select distinct dep_id from myemp;
select distinct dep_id from myemp order by dep_id;
select distinct dep_id from myemp order by dep_id desc;
select * from myemp;
select * from myemp order by salary desc;
-- Operators
select * from myemp where dep_id = 60;
select * from myemp where salary > 15000;
select * from myemp where emp_id = 103;
select * from myemp where dep_id != 50;
-- Like Operator
select * from myemp where first_name like "a%";
select * from myemp where first_name like "%a";
select * from myemp where first_name like "%a%";
select * from myemp where first_name like "a____";
select * from myemp where first_name like "___a%";

select * from myemp where first_name not like "%a%";
select * from myemp where dep_id = 90 and salary > 10000;
select * from myemp where dep_id = 90 or salary > 10000;
select * from myemp where dep_id = 50 and first_name like "a%";
select * from myemp where first_name like "a%" or first_name like "b%";
select * from myemp where dep_id in (10,20,30,40) order by dep_id;
select * from myemp where dep_id not in (10,20,30,40) order by dep_id;
select * from myemp where salary between 5000 and 10000 order by salary;
-- Coalesce
select coalesce(null, null, "1", "2", null) as Result;
select coalesce("Hello", "World" , null, null) as Output;
-- Case Statment
select * from myemp;
select emp_id, first_name, last_name, salary,job_id, case
when job_id = "Ad_pres" then "President"
when job_id = "ad_vp" then "Vice President"
when job_id like "%PROG%" then "Programmer"
when job_id like "%fi%" then "Finance Dept"
else "Employee"
end as Job_title from myemp;
-- Aggregations
select avg(salary) from myemp;
select sum(salary), min(salary), max(salary) from myemp; 
select first_name, avg(salary) from myemp; -- Error code
select * from myemp;
select count(*) from myemp;
select count(*) from myemp where salary > 10000;
select count(*) from myemp where dep_id = 50;
select dep_id, round(avg(salary),1) as Avg_Salary from myemp group by dep_id order by dep_id;
select dep_id, mgr_id, avg(salary) from myemp group by dep_id, mgr_id order by dep_id;
select dep_id, avg(salary) from myemp where dep_id in (10,20,30,40) group by dep_id order by dep_id;
select dep_id, avg(salary) from myemp group by dep_id having dep_id in (10,20,30,40) order by dep_id;

select dep_id, count(*) as depwise_count from myemp group by dep_id order by depwise_count desc;

select dep_id, count(*) from myemp where salary > 10000 group by dep_id order by count(*) desc;
-- Constraints
create table student (sid int unique,
                      Sname varchar(30) NOT NULL,
                      Age int check (Age>21),
                      Course Varchar(20) Default "MySql",
                      Gender Enum ("Male","Female"));
desc student;
insert into student (sid, sname, age, gender) values (1, "Siri", 27, "Female");
select * from student;
insert into student (sid, sname, age, gender) values (2,null, 28, "Male"); -- NOT NULL error
insert into student (sid, sname, age, gender) values (2, "TOM", 20, "Male"); -- Check Error
insert into student (sid, sname, age, gender) values (2, "Harry", 29, "Boy"); -- ENUM Error
insert into student (sid, sname, age, gender) values (null, "Siri", 27, "Female");
-- Primary Key
create table sample (sid int primary key, sname varchar(30));
desc sample;
insert into sample values (1, "Tom");
insert into sample values (null, "Tom"); -- Error code
select * from sample;

drop table sample2;
create table sample2 (sid int);
desc sample2;
alter table sample2 modify sid int unique not null default "0";
alter table sample2 drop index sid;
alter table sample2 alter column sid drop default;
alter table sample2 modify column sid int null;
-- alter table <Table_name> drop primary key
select * from authors;
select * from books;
delete from authors where authorid = 1;
update authors set authorid = 80 where authorid = 8;
-- Auto_increment
create table sample3 (sid int primary key auto_increment, 
                      sname varchar(20), 
                      Age int, 
                      Course Varchar(20));
insert into sample3 (sname, age, course) values ("Tom", 28, "Mysql"), ("Harry", 27, "Da");
select * from sample3;
alter table sample3 auto_increment = 100;
insert into sample3 (sname, age, course) values ("John", 28, "Mysql"), ("Ram", 27, "Da");
set sql_safe_updates = 0;
delete from sample3;
insert into sample3 (sname, age, course) values ("John", 28, "Mysql"), ("Ram", 27, "Da");
select * from sample3;
Truncate table sample3;
insert into sample3 (sname, age, course) values ("John", 28, "Mysql"), ("Ram", 27, "Da");
select * from sample3;
insert into sample3 values (5, "Siri", 27, "MySql");
insert into sample3 (sname, age, course) values ("John", 28, "Mysql"), ("Ram", 27, "Da");
insert into sample3 values (3, "Ramesh", 27, "MySql");
-- Joins
select * from movies;
select * from members;
select * from members inner join movies on members.movieid = movies.id;
select * from members join movies on id = movieid;
-- Left Join
select * from members left join movies on id = movieid;
-- Right Join
select * from members right join movies on id = movieid;
-- Cross Join
select * from meals;
select * from drinks;
select * from meals cross join drinks;
select mealname, drinkname, meals.rate from meals cross join drinks;
select mealname, drinkname, meals.rate + drinks.rate as Total from meals cross join drinks;
select mealname, drinkname, m.rate + d.rate as Total from meals as m cross join drinks as d;
-- Self Join
select emp.emp_id, emp.first_name, emp.last_name, emp.mgr_id, mgr.emp_id, mgr.first_name, mgr.last_name 
from myemp as emp join myemp as mgr on emp.mgr_id = mgr.emp_id;
-- Full Outer Join
select * from members left join movies on id = movieid union select * from members right join movies on id = movieid;
select first_name from myemp union select last_name from myemp;
select concat(first_name," ", last_name) as Full_name from myemp;
-- TCL Transaction Control Language
create table sample4 (sid int, sname varchar(30));
insert into sample4 values (1, "Ram");
select * from sample4;
start transaction;
insert into sample4 values (2, "Tom"), (3, "John"), (4, "Harry");
rollback;
start transaction;
insert into sample4 values (2, "Tom"), (3, "John"), (4, "Harry");
commit;
start transaction;
update sample4 set sname = "Johnson";
delete from sample4 where sid = 4;
rollback;
select * from sample4;

start transaction;
insert into sample4 values (5, "A"), (6, "B");
savepoint sb;
insert into sample4 values (7,"C"), (8, "D");
savepoint sd;
insert into sample4 values (9, "E"), (10, "F");
rollback to sb;
commit;
-- Views
select emp_id, first_name, last_name, salary, salary * 0.2 as Bonus from myemp;
create view Emp_Bonus as select emp_id, first_name, last_name, salary, salary * 0.2 as Bonus from myemp;
select * from emp_bonus;
select emp_id, bonus * 100 from emp_bonus;
select * from myemp;
create view dep_50 as select * from myemp where dep_id = 50;
select * from dep_50;

select * from members left join movies on id = movieid union select * from members right join movies on id = movieid;
create view ABC as select * from members left join movies on id = movieid union 
select * from members right join movies on id = movieid;
select * from abc;

select * from authors;
create view authorview as select * from authors where authorid < 10;
select * from authorview;
insert into authorview values (1, "Siri");
insert into authorview values (12, "Harry");
drop view authorview;
create view authorview as select * from authors where authorid < 10 with check option;
insert into authorview values (25, "John"); -- Error will not allow the entry due to check option
-- Index Btree and Hash improve search query of select function
select * from myemp where hire_date >= "2000-01-01";
create index sample using btree on myemp (hire_date);
show indexes from myemp;
-- Unique index using B tree to avoid dupicates combinational data 
create table sample5 (sid int Primary key, sname varchar(30), Phone_number int);
show indexes from sample5;
create unique index testing using btree on sample5 (sname, Phone_number); -- unique index on 2 cols
insert into sample5 values (1, "Siri", 9550);
select * from sample5;
insert into sample5 values (2, "Siri", 9550);
-- Stored Procedures - Variables
call proc_variable(); -- 1st result from stored procedure
call proc_variable(); -- 2 results from stored proc variables
call proc_author();
-- Stored Procedure - Parameters
call proc_Param_in(5); -- IN parameter added in stored procedure
call  proc_param_out(@Avg); -- OUT ParameterProc_Variable
select @avg;
--  Stored Procedures IF Else Parameters
call proc_elseif(-23);
call proc_elseif(55);
--  Stored Procedures Loops 
call proc_simpleloop(3);
select * from payments;
select * from fraud;
call proc_exceptionhandling(1,1000);
call proc_exceptionhandling(2,null);
select * from payments;
select * from fraud;
call proc_exceptionhandling(3,null);
select * from fraud;
-- Cursor . can hold the complete data of a table
call proc_cursor;
select * from orders;
-- User Defined Functions to check the exp of emp 
select * from myemp;
SET GLOBAL log_bin_trust_function_creators = 1; 
select emp_id, first_name, last_name, hire_date, Func_experience(emp_id) from myemp;

-- Sub Query
select max(salary) from myemp;
select * from myemp where salary = 24000;
select * from myemp where salary = (select max(salary) from myemp); -- single value sub query
select avg(salary) from myemp;
select * from myemp where salary > (select avg(salary) from myemp) order by salary; -- multiple value sub query
select * from myemp as e where salary > (select avg(salary) from myemp where dep_id=e.dep_id group by dep_id)order by dep_id; -- Correlated sub query	
select * from myemp where dep_id =30;
select dep_id, avg(salary) from myemp group by dep_id order by dep_id; -- Avg Slalry for dep_id

-- Triggers , 6 types before & after of insert,update & delete
select * from books;
select * from book_sales;
desc book_sales;
-- After update Triggers
alter table books add column Sales int default 0;
update books set sales = sales + 3 where bookid=5;
select * from books;
select * from book_sales;
update books set sales = sales + 5 where bookid=5;
update books set sales = sales + 2 where bookid=1;
update books set sales = sales + 1 where bookid=2;
-- before insert Triggers
create table workingemp(empid int, ename varchar(20), working_hrs int);
insert into workingemp values(1, "Tom", 25),(2, "Harry", -30);
select * from workingemp;
insert into workingemp values(3, "Siri", -32), (4, "John", -2);
-- Windows Functions basic aggregation
select first_name, Last_name,salary,dep_id,avg(salary) over (partition by dep_id) as avg_salary from myemp;
-- Windows function Rank
select * from t;
select val, rank() over (order by val desc) as Rank1 from t;
-- Winodws function Dense rank
select val, dense_rank() over (order by val desc) as Rank1 from t;
select * from sales;
select sales_employee, fiscal_year, sale, dense_rank() over (partition by fiscal_year order by sale desc) as ranking from sales;
-- Winodws function First Value
select emp_id, first_name, last_name, salary, first_value(first_name) over (order by Salary desc) as Highest_paid from myemp;
-- Winodws function Nth Value
select emp_id, first_name, last_name, salary, nth_value(first_name, 2) over (order by Salary desc) as Highest_paid from myemp;
select emp_id, first_name, last_name, salary, nth_value(first_name, 5) over (order by Salary desc) as Highest_paid from myemp;
-- CTE Common Table Expression
select * from myemp;
with bonus_cte as (select emp_id, first_name, last_name,salary, salary*0.2 as Bonus from myemp) 
select emp_id, first_name,salary, bonus from bonus_cte;
-- Lead analyze with next record
Select * from trains;
select train_id, station, time, lead(time,1) over (partition by train_id order by time) as next_station_time from trains;
with trains_cte as (select train_id, station, time, lead(time,1) over (partition by train_id order by time) 
as next_station_time from trains) select train_id, station, time, next_station_time, subtime(next_station_time,time)
as Transit_time from trains_cte;
-- Lag analyze with previous record
select train_id, station, time, lag(time,1) over (partition by train_id order by time) as previous_station_time from trains;
with trains_lag_cte as (select train_id, station, time, lag(time,1) over (partition by train_id order by time) 
as previous_station_time from trains) select train_id, station, time, previous_station_time, subtime(previous_station_time,time)
as Transit_time from trains_lag_cte;