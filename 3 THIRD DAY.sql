show databases;
use world;
show tables;
select name, upper(name),lower(name) from country;

-- concat() to sperate value
select name, code, continent, concat(continent,'-',code,'regex') from country;

-- concat with a seperater
select name, continent, concat_ws('-',continent, code, 'regex') from country;

-- substr. (name,3)--> means it will be start with index position
-- give index and we can print the character 
-- if we give -5 then it will print from end 
select name, substr(name,1), substr(name,-5) from country;

select name, continent, substr(name,1,1), substr(continent,1,1) from country
where substr(name,1,1)= substr(continent,1,1);

-- by substr()
select name, continent, substr(name,1,3) from country
where substr(name,1,3)= 'Alg';

-- by like operator 
select name, continent from country
where name like 'Alg%';

-- instr()
-- to find spefic character
select name, instr(name,'e') from country;

select 'gaurav';
-- length ( kitna bytes use hova store hone me)
select length('yash')

-- to get total character use char_length()
use world;
select name, char_length(name) from country;

-- trim()
-- reomove right and left data 
select char_length('   gaurav  ');
select trim('gauravnnnnn');

-- if we remove specific data from table 
select trim( both 'n' from 'gauravnnnnn');
select name, trim( both 'a' from name) from country;

use world;
-- lpad and rpad 
select name, population, lpad(population, 9, '0') from country;


