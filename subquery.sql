-- single row subquery 
-- ek query :- 1 rows return
use sakila;
select amount from payment where payment_id=2 ;
select * from payment where amount=0.99;
-- select * from payment where amount =(select amount from payment where payment_id=3 or payment_id=2);
-- multi row subquery ke andar directly greator than or lessthan directly use nhi kr skte comparison opretor
-- subquery ke andar kr skte hai
-- 0.99 ,5.99
select * from payment where amount in  (select amount from payment where payment_id=3 or payment_id=2);
-- multi row subquery ke andar in or not iin use  hoga
select * from payment where amount not in  (select amount from payment where payment_id=3 or payment_id=2);
-- any  ke sath koi comparison operator use kr skte hao
select * from payment where amount =any (select amount from payment where payment_id=3 or payment_id=2);
-- any using kisi se mai bhi
select * from payment where amount >=any (select amount from payment where payment_id=3 or payment_id=2);
select * from payment where amount <any (select amount from payment where payment_id=3 or payment_id=2);
-- all using sb mai se bda

-- >all:- larger value se bda
select * from payment where amount >all (select amount from payment where payment_id=3 or payment_id=2);
select * from payment where amount <all (select amount from payment where payment_id=3 or payment_id=2);

-- que:-get the all peyment info where the month of paymnet sould be same as off payment_id 2 or 3

select * from payment where month(payment_date) in (select MONTH(payment_date) FROM payment WHERE payment_id=2 or payment_id=3);
-- get all the payment info. whose amount is larger then amont all the amount of payment_id 2 to 8
select * from payment where amount <all (select amount from payment where payment_id=2 or payment_id=8);
-- learning assinment
-- what are corelated subquery and how executed
-- what are consentaints in sql
-- what are consentaints in sql