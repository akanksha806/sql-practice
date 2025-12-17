use sakila;
show tables;
select count(*) from payment where amount = 2.99;
select amount ,count(*) from payment group by amount;
select customer_id, sum(amount) from payment group by customer_id;
select customer_id, sum(amount) from payment where amount>3 group by customer_id;
-- you need to find the tolat amount of transaction in the month of may
select customer_id, count(amount) from payment where month(payment_date) =5  group by customer_id;
 -- you need to find out the max amount of transaction the avg transaction amunt and the total transavction amount done throw each staff
 select *  from payment;
 select staff_id, max(amount),avg(amount),sum(amount) from payment group by staff_id; 
-- which only for the even number of cuctomer
select staff_id, max(amount), avg(amount),sum(amount)from payment where customer_id%2=0 group by staff_id;
-- get the amount and the total transaction of each amount only for the payments done throw staff id 1 and the total noumber of transcation should be > 30
select  staff_id, amount,count(amount), sum(amount) from payment where staff_id =1 group by amount having count(amount)>30;

-- find out the number of customer serve avg amount and the total amoiunt of spend in each month for staff id 1 and 2 
--  for each month and each year
select customer_id ,avg(amount), count(amount),sum(amount) ,month(payment_date) from payment where staff_id in (1,2) group by customer_id, month(payment_date);
select * from payment;
--select extract(year from payment_date), extract(month from payment_date ), count(customer_id), avg(amount),sum(count) from  payment where staff_id =1 or staff_id =2
--group by extract (year from payment_date),extract(month from payment_date );

-- order by :- order mai arrane krna
select * from payment order by customer_id, amount;
-- desc :- amount bde se chota
select * from payment order by customer_id desc,amount;
-- asc:- chote se bda

