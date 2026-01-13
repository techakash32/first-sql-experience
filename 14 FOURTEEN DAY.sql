-- DDL = DATA DEFINATION LANGUAGE
-- CREATE (TABLE),DROP,TURNCATE,ALTER

-- 1. CREATE
use regex;
create table raj123(col int);

-- create table using select ( CTAS )

create table actor_cp as
select first_name AS FNAME ,last_name AS LNAME from sakila.actor;

select * from actor_cp;

 -- 2.DROP
 -- drop is delete the table sturucture and ita data both
 DROP TABLE actor_cp;
 select * from actor_cp;
 
create table actor_cp as
select first_name AS FNAME ,last_name AS LNAME from sakila.actor
where actor_id between 10 and 14;

select * from actor_cp;

-- 3.ALTER

alter table actor_cp add column (salary int);

alter table actor_cp add constraint new_key primary key(fname); -- primary key set

alter table actor_cp drop column lname; -- column drop last

alter table actor_cp rename column salary to newsalaryp; -- rename column

desc actor_cp;
select * from actor_cp;


 

