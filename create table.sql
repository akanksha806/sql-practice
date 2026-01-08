-- table
-- DDL (data defination language)
-- create , alter, drop,truncate
-- creating a database
create database regex1;
use regex1;
-- table create (sno column name)
create table test1 (sno int);
describe test1;
-- DML (data manipulation language)
-- use insert statement
insert into test1 values(10);
select* from test1;
desc test1;
create table test2(sno int not null ,salary int);
insert into test2(sno,salary) values(20,10000);
insert into test2(sno,salary) values(20, null);
insert into test2(sno,salary) values(null,1000); -- we have set constraint (error)
insert into test2(sno) values(1000);
insert into test2(salary) values(5000000);-- error (because no null and no default set)

