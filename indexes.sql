use sakila;
drop table test100;
create table test100 as select actor_id , first_name from actor where actor_id between 1 and 10;

insert into test100 values(14,'abc'),(13,'def'),(11,'aman'),(12,'shubham');
insert into test100 values(16,'nickkky'),(17,'EDek'),(18,'johlly'),(19,'grakky');
-- alter statement
alter table test100 add primary key(actor_id);
alter table test100 drop primary key;


select * from test100;

desc test100; -- no primary key

explain select * from test100 where actor_id = 5;
explain select * from test100 where first_name= 'nick'; -- is pr clustered filter nhi lga hai


-- index :- they are used to optimize the queries,they are make queries fast
-- indexes is like a data structure which is used access your data in a faster way 
-- two types of indexs

-- clustered index:-A clustered index decides the physical order of data in the table.
-- The table data is actually stored in sorted order based on this index
-- there are one clusterd index in the table
-- 
 -- 2. non-clustered index :-  A non-clustered index is separate from actual table data.
-- It stores index + pointer to actual row location.
 
 create index index1 on test100(actor_id);
 
 drop index index1 on test100;
 show index from test100;
 -- multi column index
 -- index on 2 column
 create index indx_composite on test100(actor_id,first_name);
 show index from test100;
 
 explain select * from test100  where actor_id >3 and first_name = 'abc';
 explain select * from test100 where actor_id > 5;
 -- it will first apply filter on the actor_id than first_name
 
 
 select * from test100;
 explain select *  from test100 where actor_id=5;
explain select * from test100 where first_name='aman';
insert into test100 values(12,'abc');
insert into test100 values(15,'abc');

show index from test100;
explain select * from test100 where actor_id=12;
drop index indx_composite on test100;


create index index_3_chr on test100(first_name(3) );
show index from test100;

explain select * from test100 where first_name = 'johnny';
select * from test100;
explain select * from test100 where first_name like 'joh%';

-- partial index :- A partial index is an index that is created only on some rows of a table, not all rows.


-- indexes ke bare mai pdna.

