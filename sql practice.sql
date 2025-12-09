select database();
-- change to world database
use world;

-- tables
show tables;

-- to see the structure of table
describe city;
-- print data of table
select * from city;
-- to access column
select name, population from city;


-- column can be print in any order
select population, name, district from city;

select name, population, population+10 from city;

-- query can be written in multiple line
select name, population,
 countrycode,
 population from city;
 -- sql is not case sensitive
 SELECT NAME, population,
 countrycode,
 population FROM city;


select * from country;
-- alias (nickname)
select *, population+12+12-4-5-12-4 as 'newpopulation' from country;