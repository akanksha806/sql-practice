-- windows function :- set of rows is a window 
-- SQL window function performs calculations across a set of table rows related to the current 
--  row, returning a value for each row without collapsing them 
--  like a standard aggregate function (e.g., SUM, AVG). 

-- window function is used to calculation on a set of rows with reference to current row 
-- windows function are measurely three part 
-- 1 over :- it is apply the function over a window

-- Key Concepts
-- Window: A set of rows related to the current row, defined by the OVER() clause.
-- OVER() Clause: Specifies the window; functions without it are not window functions.
-- PARTITION BY: Divides rows into partitions (groups) within the window.
-- ORDER BY: Sorts rows within each partition.
-- Framing (ROWS/RANGE): Further defines the window 
-- frame (e.g., UNBOUNDED PRECEDING, CURRENT ROW) for
--  more precise calculations like rolling averages. 




use world;
select * from country;
select code,name ,continent,population , ( select sum(population) from country )from country;

--  over :- is a apply of each row
select code , name  continent, population, sum(population) over() from country;

select code , name  continent, population, sum(population) over(),avg(population) over() from country;

-- 2. partition :- same as group by which is used to apply the logic into group 

-- 3705025700 north america:- 482993000
select continent, sum(population) from country group by continent;

-- 3705025700
select code , name , continent, population, sum(population) over(partition by continent) from country;

-- that is fiind out running sum , cummulativve sum
-- use order by
select code, name , continent, population , sum(population) over(order by population) from country;


































































































 




