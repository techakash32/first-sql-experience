use world;
select database();
show tables;
describe city;
select*from city;
select population, name, district from city;
select name, population, population+10 from city;
select name, population, countrycode,
	population from city;
-- multiline can be used

select NAME, population, countrycode,
population from city;
SELECT name, population
FROM city;

-- use uppercase for variable
-- alias (nickname)
select *, population*2 as new_population from country;
