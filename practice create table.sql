


use regex1;
drop table customer9;
create table customer9(cid int primary key, cname varchar(20));
insert into customer9 values(10,'aman'),(11,'shubham');
drop table orders9;
create table orders9(oid int primary key,city varchar(20),cid int,
foreign key (cid) references customer9(cid));
insert into orders9 values(1009,'jaipur',10),(1010,'goa',11),(1011,'JK',10);
insert into orders9 values (9123,'japan',90);

select * from customer9;
select * from orders9;

