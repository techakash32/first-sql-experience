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
SELECT * FROM events ORDER BY event_id;
SELECT * FROM ticket_sales ORDER BY sale_id;

-- 1. total quan sold per event id
select event_id,sum(qty) from ticket_sales group by event_id;

-- 2.total revenue per event id
select event_id,sum(price_per_ticket*qty) from ticket_sales group by event_id;

-- 3.total value group by month_sale_date
select month(sale_date),sum(price_per_ticket*qty) from ticket_sales group by month(sale_date);

-- 4.maximum price per ticket
select event_id,max(price_per_ticket) from ticket_sales group by event_id;

-- 5.total revenue per month and ticket type
select month(sale_date),ticket_type ,sum(price_per_ticket*qty) from ticket_sales group by month(sale_date),ticket_type;

-- 6.List all sales with event_name and sale_date.
select sale_id,event_name,sale_date from ticket_sales join events on ticket_sales.event_id=events.event_id;

-- 7.event name tickettype and qty
select event_name,ticket_type,qty from ticket_sales join events on ticket_sales.event_id=events.event_id;

-- 8.Show sales where the event city is Mumbai.
select sale_id,event_name,city,sale_date from ticket_sales join events on (ticket_sales.event_id=events.event_id) where city='Mumbai';

-- 9.Show all events and matching sales
select event_name,sale_id,sale_date from ticket_sales join events on (ticket_sales.event_id=events.event_id);

-- 10 Show distinct event names that have at least one sale. event_name
select distinct event_name from ticket_sales join events on (ticket_sales.event_id=events.event_id);

-- 11.Show each sale’s computed revenue with event name. sale_id event_name revenue
select distinct sale_id,event_name,sum(price_per_ticket*qty) from ticket_sales join events on (ticket_sales.event_id=events.event_id) group by sale_id;

-- 12.Find total quantity per event_name
select distinct event_name,sum(qty) from ticket_sales join events on (ticket_sales.event_id=events.event_id) group by event_name;

-- 13.Find total VIP revenue per event_name.
select event_name,sum(price_per_ticket*qty) from ticket_sales join events on (ticket_sales.event_id=events.event_id) where ticket_type='VIP' group by event_name;

-- 14.Find monthly revenue per city. city sale_month total_revenue
select city,month(sale_date),sum(price_per_ticket*qty) from ticket_sales join events on (ticket_sales.event_id=events.event_id) group by city,(month(sale_date));

-- 15.Find total quantity per city and ticket_type.
select city,ticket_type,sum(qty) from ticket_sales join events on (ticket_sales.event_id=events.event_id) group by city,ticket_type;

-- 16.Find sales that happened on the latest sale_date in the table.
select * from ticket_sales where sale_date =(select max(sale_date) from ticket_sales);

-- 17.Find sales where revenue is greater than the overall average sale revenue. sale_id event_id revenue
select sale_id,event_id ,sum(qty*price_per_ticket) from ticket_sales group by sale_id,event_id having  sum(qty*price_per_ticket) >(select avg(qty*price_per_ticket) from ticket_sales);

-- que 18 Find events that have at least one VIP sale.
select event_id,event_name from ticket_sales join events on (ticket_sales.event_id=events.event_id) where ticket_type='VIP';

-- que 19.Find events in cities that have at least one VIP sale. Hint: subquery will use the joins
select event_id,event_name,city from ticket_sales join events on (ticket_sales.event_id=events.event_id) group by event_id;

-- 20.Find events that have at least one sale in February 2025. event_id event_name city
-- select distinct event_id,event_name,city from events join ticket_sales on events.event_id=ticket_sales.event_id where month(ticket_sales.sale_date)=2;
select distinct e.event_id,e.event_name,e.city from events as e join ticket_sales as t on e.event_id= t.event_id where month(t.sale_date)=2;

-- que 21.For each event, return the highest price_per_ticket sale row.
select * from ticket_sales where (select event_id,max(price_per_ticket) from ticket_sales group by event_id);

-- 22.Show monthly total revenue and monthly total quantity, but only include months where total revenue is at least 10,000.
select month(sale_date),sum(qty),sum(price_per_ticket*qty) from ticket_sales group by month(sale_date) having sum(price_per_ticket*qty) > 10000;

-- 23 Show month-wise count of sales rows, but only include months that have at least 3 sales rows. sale_month
select month(sale_date),count(*) from ticket_sales group by month(sale_date) having count(*)>=3 order by month(sale_date);

-- 24 Show average revenue per sale row per month, but only include months where average sale revenue is above 4000. sale_month avg_sale_revenue
SELECT month(sale_date),avg(price_per_ticket*qty) FROM ticket_sales group by month(sale_date) having avg(price_per_ticket*qty) > 4000;

-- 25 