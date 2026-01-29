 -- TCL : transtion control language
-- set of logical satement( jo permanent nhi hai )

-- TCL (Transaction Control Language) is a part of SQL used to manage database transactions.
-- It helps you save changes permanently, undo changes, or control when changes are applied to the database.

use sakila;

create table actor_cp as select actor_id,first_name from sakila.actor
where actor_id between 1 and 5;
select * from actor_cp;

insert into actor_cp values(6,'tushar');
select * from actor_cp;

set @@autocommit=0;
select @@autocommit;
insert into actor_cp values(7,'akash');
update actor_cp set actor_id=10000;
rollback;
select * from actor_cp;

insert into actor_cp values(7,'akash');
update actor_cp set actor_id=10000;
commit;
select * from actor_cp;

start transaction;
insert into actor_cp values(8,'yash');
select * from actor_cp;
commit;

start transaction;
insert into actor_cp values(10000,'gaurav');
select * from actor_cp;
rollback;
select * from actor_cp;
create table test2(id int);


start transaction;
insert into actor_cp values(11000,'mahipalm');
savepoint db_actor_cp_sv1;
delete from actor_cp where actor_id=8;
Rollback to db_actor_cp_sv1;
select * from actor_cp;


-- when the transaction start = if you execute any dml or start transtion then the transaction will br started;
-- when my transaction be shut = if i use any tcl command like commit and roll back then my tranasction will be stop
-- in case i run any ddl opration then also my transction will be stop;
-- commit 


