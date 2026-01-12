SHOW DATABASES;
-- data types in sql
-- INT,FLOAT,DECIMAL
-- TINYINT,MEDIUM,BIG INT,SMALL,INT
-- 1BYTE,SMALL=>2 Byte, medium=> 3. int=>4 long 8 byte 

use regex;
create table test10(id tinyint);
insert into test10 values(1),(-128),(127);
insert into test10 values(128); -- error  -128<size<128
select * from test10;

create table test11(id tinyint unsigned);
insert into test11 values(255),(154);
select * from test11;

create table test12(price float);
insert into test12 values(255.546540),(154.4578);
select * from test12;

create table test13(price double);
insert into test13 values(255.546540),(154.4578);
insert into test13 values(255.546540789765432),(154.45786564643121);
select * from test13;

create table test14(price2 double(5,2));
insert into test14 values(255.546540),(154.4578);
insert into test14 values(195.114564);
insert into test14 values(1955.11456); -- error
select * from test14;

-- varchar and char
-- varchar is datatypes => string/character values
-- char => character but of fix length of character

create table test15(name char(10));
insert into test15 values('abc'),('defgi'),('akashnagar'),('ж'),('жжжжжж'),('жжжжжжж');
select * from test15;





