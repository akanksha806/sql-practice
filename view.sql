--  view is a virtual table based on th result of an SQL
-- view do not store the data physically but will access the data fom the existing dta
-- it will e make your complex query easy
-- it will hwlp in security
-- views are two types 1. simple and 2. complex

use world;
create table newactor as
select actor_id ,first_name from sakila.actor where actor_id between 1 and 3;
 select * from newactor;
 
create view actor_v as -- created view here for the query
select *, substr(first_name,2) from newactor;

select * from newactor ; -- 3 rows 2 columns
insert into newactor values(4,'riya'); -- 4 rows table

select * from newactor;
select * from actor_v;

-- view insert

-- simple view :-any dml change will be visible on original table
-- where view is created

create view actor_v2 as -- created view here for the query
select * from newactor where actor_id in (1,2);

select * from newactor;
insert into newactor values(5,'sakshi'); -- 4 row table

select * from actor_v2;

-- JOIN conditions, aggregate functions (e.g., COUNT(), SUM(), AVG()), GROUP BY, or ORDER BY clauses. Unlike a simple view, which is based on a single table and generally allows DML operations (INSERT, UPDATE, DELETE), a complex view is primarily used for a
-- advanced data retrieval, reporting,
-- and abstraction of complicated logic, and is typically not updatable. 

create table newpayment as 
select payment_id,amount from sakila.payment where payment_id between 1 and 7;

select * from newpayment;

create view payment_v as 
select count(*) from newpayment;

select * from payment_v;

insert into payment_v values(10); -- given error
