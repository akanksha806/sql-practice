-- ddl
-- dml
-- tcl
-- dql
-- dcl
-- permission which user can accessibility
-- authentatication and authorization
-- user :- createpermission

-- ddl statement
-- my SQl
create user regex identified by 'regex';
select * from mysql.user;

create database akankshadb;
create table akankshadb.actor1 as select actor_id,first_name from  sakila.actor
where actor_id between 3 and 7;

show grants for regex; -- given permission


-- grant permission on database to username
grant select on akankshadb.actor1 to regex;
grant  select on akanksha.* to regex;

grant all privileges on akankshadb.actor1 to regex;
show grants for regex;
select * from akankshadb.actor2;