-- data types :- int,decimal, tinyint, mediumint, int, digint
-- 1 byte,2byte,3byte,4byte,8byte
-- 1 byte = 8bit 2**8 :- 256 (-128 to 127)
use regex1;
create table yash1(salary tinyint);
insert into yash1 values(127);

create table yash2(salary float ,price double);
insert into yash2 values(100.6781241, 100.6781241);
select * from yash2;

-- implicit type conversion
-- explicit type conversion
-- string values char vs varchar()
-- fixed size/length character
-- variable length character
create table yash3( name varchar(20) , gender char(10));
insert into yash3 values ("akanksha","female"),("aman","male"),("ot","female");
insert into yash3 values('akshu        ','female        ');

select *, length(name),length(gender) from yash3;
-- char will truncate remove all white spaces
-- varchar will have consist white space size of subcolumn

-- ddl statement:- data defination language
-- create(table)
-- drop, truncate,alter
create table akanskha123(col int);

-- create a table using select (CTAS)
create table actor_cp as
select first_name ,last_name from sakila.actor;

select * from actor_cp;
drop table actor_cp;-- table structure and data both are deleted
create table actor_cp AS 
select first_name as fname, last_name as last from sakila.actor
where actor_id between 10 and 14;

select * from actor_cp;
-- changes in structure
-- alter table to add column in my table
alter table actor_cp add column(salary int);
alter table actor_cp add constraint new_key primary key (fname);
desc actor_cp;

alter table actor_cp drop column last; -- column drop
desc actor_cp;
alter table actor_cp rename column salary to newsalary; -- change column name
desc actor_cp;
select * from actor_cp;
 -- DML :- data manipulation language
 -- insert
 -- update
SET SQL_SAFE_UPDATES = 0;
update actor_cp set newsalary=900;
update actor_cp set newsalary=888 where fname='UMA';
select * from actor_cp;






