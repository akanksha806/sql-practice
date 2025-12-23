CREATE DATABASE REGEX;
USE REGEX;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    city VARCHAR(50)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    amount DECIMAL(10,2)
);



INSERT INTO customers (customer_id, customer_name, city) VALUES
(1, 'Alice', 'New York'),
(2, 'Bob', 'Los Angeles'),
(3, 'Charlie', 'Chicago'),
(4, 'David', 'Houston'),
(5, 'Eva', 'Phoenix'),
(6, 'Frank', 'Philadelphia'),
(7, 'Grace', 'San Antonio'),
(8, 'Henry', 'San Diego'),
(9, 'Ivy', 'Dallas'),
(10, 'Jack', 'San Jose');


INSERT INTO orders (order_id, customer_id, order_date, amount) VALUES
(101, 1, '2024-01-05', 250.00),
(102, 2, '2024-01-06', 150.00),
(103, 3, '2024-01-07', 300.00),
(104, 1, '2024-01-10', 120.00),
(105, 5, '2024-01-12', 450.00),
(106, 6, '2024-01-15', 200.00),
(107, 2, '2024-01-18', 175.00),
(108, 8, '2024-01-20', 500.00),
(109, 11, '2024-01-22', 90.00),
(110, 12, '2024-01-25', 60.00);

select * from customers;
describe customers; -- customer_id
select * from orders;
describe orders; -- order_id
-- join
SELECT ca.customer_id, ca.customer_name, o.order_id, o.amount fROM customers AS ca JOIN orders AS o
ON ca.customer_id = o.customer_id;

-- inner join
SELECT 
    ca.customer_id,
    ca.customer_name,
    o.order_id,
    o.customer_id,
    o.amount
FROM customers AS ca
INNER JOIN orders AS o
ON ca.customer_id = o.customer_id;

-- outer join:- three types of outer loop 
-- 1. left outer join
-- 2.
select ca.customer_id , ca.customer_name, o.order_id,o.customer_id ,o.amount 
from customers as ca left join orders as o on ca.customer_id = o.customer_id;
-- right outer join
select ca.customer_id , ca.customer_name, o.order_id,o.customer_id ,o.amount 
from customers as ca right join orders as o on ca.customer_id = o.customer_id;

-- natural join :- common column pr lgta koi condition nhi lgate
SELECT 
    ca.cid,
    ca.customer_name,
    o.order_id,
    o.customer_id,
    o.amount
FROM customers AS ca
natural JOIN orders AS o;

-- column ka name change
alter table customers rename column customer_id to cid;
desc customers;
-- many to many ralation( cross join / cartesian join)
SELECT ca.cid, ca.customer_name, o.order_id , o.customer_id, o.amount
FROM customers AS ca
cross JOIN orders AS o;

-- not use in sql :- because if have common column then it use natural join otherwise uses a cross join

select c.cid, sum(amount) from customers group by c.cid;

SELECT customer_name, sum(amount)
FROM customers AS ca
cross JOIN orders AS o
where ca.cid= o.customer_id group by customer_name;
-- join ko group by ke sath add

use sakila;
-- actor id actor name or kitni movies mai kaam kiya
select * from actor;
describe actor;-- actor id
select * from film;
describe film; -- film_id
select a.actor_id , a.first_name,count(fa.film_id) from actor as a join film_actor as fa
where a.actor_id=fa.actor_id group by a.actor_id;

-- learning assignment:-
-- what is normalization in sql(super key ,canidate key)
-- what is 1Nf,2NF,3NF(partial dependency -- non key attribute)
-- what are outer join and self join


