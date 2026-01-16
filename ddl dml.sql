create table actor_cp AS 
select first_name as fname, last_name as last from sakila.actor
where actor_id between 10 and 14;
select * from actor_cp;
-- delete is a DML operation :- if you know no any condition or delete chla di to sari rows delete ho jayegi
-- isliye delete where ke sath lgate hai
delete from actor_cp; -- delete only delete data but not structure or drop delete is a full structure
-- ddl (truncate)
-- truncate is a ddl statement and delete is a dml statement 
-- and truncate koi condition nhi dete or delete mai condition dete hai
-- truncate mai data ko revert (rollback nhi kr skte)undo but delete we can rollback use hum undo kr skte hai
-- *** in case if you execute ddl statement chla diya to uske baad hum rollback nhi kr skte
truncate actor_cp;
-- object :- is a sturcture that can we use which data can store , manage refer the data
 -- drop vs delete vs truncate is most imp 