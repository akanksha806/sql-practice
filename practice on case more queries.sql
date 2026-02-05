use sakila;
select * from customer;
select first_name,active,
  case 
      when active=1 then 'active austomer'
      when active=0 then 'inactive customer'
  end as active_case
from customer;
-- Q2 film length category
select length , film_id,
  case 
    when length >60 then 'sort'
    when length <60 then 'medium'
    else 'perfect'
  end as film_length  from film ;
  
  -- 
  select rating ,count(*) as total ,
  case
      when count(*)<200 then 'low count'
      when count(*) between 200 and 400 then 'medium count'
      else 'high count'
  end as rating_count from film group by rating;
  
  -- Q calculate total payment per customer and classify
  
select * from payment;
select * from customer;
-- customer_id , customer_name ,total_amount,spending_level
select c.customer_id ,first_name ,sum(amount) ,
case
    when sum(amount) < 90 then 'low spend'
    else 'high spend'
end  as spend_rating from payment as p
join customer as c 
where p.customer_id = c.customer_id
group by c.customer_id ,c.first_name;
 
 

 -- Q find how many times each film has been rented
 -- table film, inventary, rental
select * from rental;
select f.film_id ,f.title, count(r.rental_id)  from film f join inventory i on f.film_id = i.film_id
join rental r on i.inventory_id = r.inventory_id  group by f.film_id ,f.title order by f.title;

select * from inventory;
select * from rental;

-- Q list pairsof customers who being to the same store . avoid duplicate and mirror pairs
-- table customer (self join)
select c1.customer_id ,c1.first_name ,c1.store_id,c2.store_id 
,c2.customer_id,c2.first_name  from customer c1 
join customer as c2
where c1.store_id = c2.store_id ;

-- QQ find customer whose total payment is greator than the avg toytal payment of all customers.
select * from customer ;
select * from payment ;
select c.customer_id ,first_name ,sum(amount)from payment
 group by customer_id having sum(amount) >= (select avg(amount) from payment);
-- Q find the whose rental count is gretor than the avg rentals per filmmm...
SELECT 
    f.film_id,
    f.title,
    COUNT(r.rental_id) AS rental_count

FROM film f
JOIN inventory i 
ON f.film_id = i.film_id

JOIN rental r 
ON i.inventory_id = r.inventory_id

GROUP BY 
    f.film_id,
    f.title

HAVING COUNT(r.rental_id) > (
    SELECT AVG(rental_count)
    FROM (
        SELECT COUNT(r2.rental_id) AS rental_count
        FROM inventory i2
        JOIN rental r2 
        ON i2.inventory_id = r2.inventory_id
        GROUP BY i2.film_id
    ) t
);

