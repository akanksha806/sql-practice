-- -------------------------
-- Create table: events
-- -------------------------
use world;

CREATE TABLE events (
  event_id   INT PRIMARY KEY,
  event_name VARCHAR(100) NOT NULL,
  city       VARCHAR(50)  NOT NULL
);

-- -------------------------
-- Create table: ticket_sales
-- -------------------------
CREATE TABLE ticket_sales (
  sale_id          INT PRIMARY KEY,
  event_id         INT NOT NULL,
  sale_date        DATE NOT NULL,
  ticket_type      VARCHAR(20) NOT NULL,
  qty              INT NOT NULL,
  price_per_ticket INT NOT NULL,
  CONSTRAINT fk_ticket_sales_event
    FOREIGN KEY (event_id) REFERENCES events(event_id)
);

-- -------------------------
-- Insert data: events
-- -------------------------
INSERT INTO events (event_id, event_name, city) VALUES
(1, 'Music Fest', 'Mumbai'),
(2, 'Tech Summit', 'Bengaluru'),
(3, 'Food Carnival', 'Delhi'),
(4, 'Startup Meetup', 'Mumbai');

-- -------------------------
-- Insert data: ticket_sales
-- -------------------------
INSERT INTO ticket_sales (sale_id, event_id, sale_date, ticket_type, qty, price_per_ticket) VALUES
(101, 1, '2025-01-05', 'Regular', 2, 1500),
(102, 1, '2025-01-10', 'VIP',     1, 5000),
(103, 2, '2025-02-03', 'Regular', 3, 2000),
(104, 2, '2025-02-10', 'VIP',     1, 6000),
(105, 3, '2025-03-01', 'Regular', 5,  800),
(106, 3, '2025-03-15', 'VIP',     2, 2500),
(107, 4, '2025-01-20', 'Regular', 4, 1200),
(108, 4, '2025-02-05', 'Regular', 1, 1200);

-- Quick check
SELECT * FROM events;
select * from ticket_sales;

-- q1 Find the total quantity sold per event_id.
SELECT event_id,SUM(qty) FROM ticket_sales GROUP BY event_id;

-- q2 Find the total revenue per event_id. event_id total_revenue
SELECT event_id,SUM(qty * price_per_ticket) FROM ticket_sales GROUP BY event_id;


-- q3 Find monthly total revenue (group by month of sale_date). sale_month total_revenue


SELECT MONTH(sale_date) ,SUM(qty * price_per_ticket) FROM ticket_sales GROUP BY MONTH(sale_date);
 
-- q4 Find the maximum price_per_ticket per event_id. event_id max_price
SELECT event_id,MAX(price_per_ticket) FROM ticket_sales GROUP BY event_id;


-- q5 Find total revenue per month and ticket_type. sale_month ticket_type total_revenue
SELECT MONTH(sale_date) ,ticket_type,SUM(qty * price_per_ticket) FROM ticket_sales GROUP BY MONTH(sale_date), ticket_type;
-- q6 List all sales with event_name and sale_date. sale_id event_name sale_date
select t.sale_id, e.event_name, t.sale_date from ticket_sales t join events e on t.event_id = e.event_id ;

SELECT * FROM events;
select * from ticket_sales;
-- q7 Show event_name, ticket_type, qty for each sale. event_name ticket_type qty
SELECT e.event_name, s.ticket_type, s.qty FROM ticket_sales s JOIN events e ON s.event_id = e.event_id;



-- q8 Show sales where the event city is Mumbai. sale_id event_name city sale_date
select s.sale_id, e.event_name , e.city , s.sale_date
 from ticket_sales s join events e on e.event_id = s.event_id where e.city = 'Mumbai';

-- q9 Show all events and matching sales
select e.event_name , s.sale_id , s.sale_date from ticket_sales s join events e on e.event_id = s.event_id;

-- q10 Show distinct event names that have at least one sale. event_name
select distinct e.event_name  from events e join ticket_sales
 s on e.event_id = s.event_id and sale_id is not null;

-- q11 Show each sale’s computed revenue with event name. sale_id event_name revenue
select s.sale_id, e.event_name, s.qty*price_per_ticket FROM ticket_sales s
JOIN events e ON s.event_id = e.event_id;


-- q12 Find total quantity per event_name. event_name total_qty
select e.event_name,sum(s.qty) from ticket_sales s 
join events e on s.event_id = e.event_id group by e.event_name;

select * from ticket_sales;

-- q13 Find total VIP revenue per event_name. event_name vip_revenue
select e.event_name, sum(s.qty*s.price_per_ticket) from ticket_sales s 
join events e on s.event_id = e.event_id
 where ticket_type = 'VIP' group by e.event_name order by e.event_name;

-- q14 Find monthly revenue per city. city sale_month total_revenue
select e.city, month(s.sale_Date),sum(s.qty*s.price_per_ticket) from ticket_sales s join events e
on s.event_id = e.event_id group by city, month(s.sale_date) order by city;


-- q15 Find total quantity per city and ticket_type. 
select e.city, s.ticket_type,sum(s.qty) from ticket_sales s join events e
on s.event_id = e.event_id group by e.city, s.ticket_type order by e.city;


-- q16 Find sales that happened on the latest sale_date in the table.
select * from ticket_sales where sale_date = (select max(sale_date) from ticket_sales);

-- q17 Find sales where revenue is greater than the overall average sale revenue. 
select sale_id , event_id ,qty * price_per_ticket from ticket_sales 
where qty * price_per_ticket > (select avg(qty * price_per_ticket) from ticket_sales);

-- q18 Find events that have at least one VIP sale. event_id event_name
select e.event_id , e.event_name from events e join ticket_sales s on
e.event_id = s.event_id where s.ticket_type = 'VIP';


-- q19 Find events in cities that have at least one VIP sale. Hint: subquery will use the joins
SELECT  event_id, event_name, city FROM events ;

-- q20 Find events that have at least one sale in February 2025. event_id event_name city
select e.event_id , e.event_name,e.city from events e join ticket_sales s
on e.event_id = s.event_id where month(s.sale_date) = 2 and
year(s.sale_date) = 2025;

-- q21 For each event, return the highest price_per_ticket sale row. Hint: read the question twice
sale_id event_id sale_date ticket_type qty price_per_ticket
102 1 2025-01-10 VIP 1 5000
104 2 2025-02-10 VIP 1 6000
106 3 2025-03-15 VIP 2 2500
107 4 2025-01-20 Regular 4 1200
108 4 2025-02-05 Regular 1 1200

-- q22 Show monthly total revenue and monthly total quantity, but only include months
where total revenue is at least 10,000. sale_month total_qty total_revenue
1 7 18800
2 5 13200

-- q23 Show month-wise count of sales rows, but only include months that have at least 3
sales rows. sale_month sales_rows
2 3

-- q24 Show average revenue per sale row per month, but only include months where
average sale revenue is above 4000. sale_month avg_sale_revenue

sale_month avg_sale_revenue
1 6266.6667
2 4400

-- q 25 Show revenue per month and ticket_type, but only include groups where total
revenue is at least 5000. sale_month ticket_type total_revenue
1 Regular 7800
1 VIP 11000
2 Regular 7200
2 VIP 6000
3 VIP 5000