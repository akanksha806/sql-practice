-- aggregate function:- multiple rows ke data ko combine karke ek single value return karte hain.
-- { multi line function} will give you some result
-- distinct:- dupticate value remove given unique value 

use world;
select distinct continent from country;
select distinct continent, region from country; 


-- aggregate function:- to apply some calculation over set of rows
-- count(col) :- only data present will be counted
select count(indepyear) from country;
-- * all col value
select count(*) from country;
select count(population) from country;
-- sum , avg, max, min
select count(population), sum(population), avg(population), max(population),
min(population) from country;
-- count :- duplicates values count but with distinct given unique values/ null values dont count
select count(continent),count(distinct continent) from country;


select count( indepyear), count(*) from country where continent = 'asia';

-- Q. get the total  country name the total region along with avg lifeexpectancy and the total population for the countries who have 
-- indepence after 1947 and before 1998
select count(name), count(region), avg(lifeexpectancy), sum(population) 
from country where indepyear > 1947 and indepyear < 1998; 
-- Q. get the total number of countries the unique regions alon with the total population of the higg  lifeexpectancy rate with the 
-- total capitals for the countries starting with the letter a and d
select count(name), count(distinct region), sum(population), max(lifeexpectancy),
 sum(capital) from country where name like 'a%' or name like 'd%';
 select * from country;
 -- group by :- similar values ko collect karna in a group
 select continent from country group by continent;
select continent, count(name) from country group by continent;
-- jis bhi column mai group by krte hai vhi select mai kr skte hai koi or

-- Q. you nedd to find out the total countris and the total population or each independent year
select me), sum(population) from  country group by indepyear;

