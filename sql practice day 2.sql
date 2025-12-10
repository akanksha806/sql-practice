-- where cluse 
use world;

show tables;

select * from country;

select * from country where continent = 'asia';

select * from country where indepyear = 1991;
select name,continent from country where indepyear=1991;

select * from country where continent = 'africa' ;

select * from country where continent in ('africa', 'asia'); 

select * from country where indepyear in (1960,1961);

select *from country where indepyear between 1960 and 1961;
select * from country where indepyear not between 1960 and 1961;
-- not in -->
select * from country where  indepyear not in (1960, 1961);
-- get the country name where the region is not south euro
SELECT * from country where region not in ('south euro');

-- get the contry name , continent , pupulation along with the 10% increment in the population 
SELECT country_name,continent,population,population * 1.10 AS increased_population FROM countries;
select name , population , population * 0.1+ population from country;
select name , population*1.1 from country ;
 
-- get the all the column wher the life expectanct is either 75.1 or 77.8,63.7
select * from country where lifeexpectancy between 75.1 and 77.8 and 63.7;
-- get the country name population , region where the population should not be from 5000 to 300000
select country,population,region FROM countries WHERE population NOT BETWEEN 5000 and 300000;

-- like operator -->  this is used to match a pattern
-- name --> letter staRT , letter include , letter end.
-- used % :- special character / wildcard character 
-- % :- zero or more character 
-- 'A'
select * from country where name like 'B%';

-- %A ---> end a
select * from country where name like '%A';

-- %a% :- in between / strat / end / betwwen
select * from country where name like '%a%' ;

-- not like :- 
select * from country where name not like '%a' ;
 -- (_) underscore : only 1 character
 select * from country where name like 'ira_' ;
 
select * from country where name like '____' ;

select * from country where name like '_u%' ;
select * from country where name like '_u_%' ;

-- get the country name continent where the continent start with the letter n
select name, continent from country where continent like 'n%' ;
-- get the country name continent where the continent second last letter p 
select name, continent from country where continent like '%p_' ;

-- get the coutry where the continent have minimum 4 character
select name, continent from country where continent like '____%' ;
-- get the name continent the second letter is a second last letter a is a region column
SELECT name, continent, region FROM countries WHERE region LIKE '_a%a_';

-- get get the nname continent the third  letter is c last 3  letter sia is a region column
__c%sia;
-- get the name and region where the continent is north america or south america 
continent in ( north america , south america)