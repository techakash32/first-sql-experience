use regex;
CREATE TABLE drivers (
  driver_id   INT PRIMARY KEY,
  driver_name VARCHAR(50) NOT NULL,
  base_area   VARCHAR(50) NOT NULL
);

-- -------------------------
-- Create table: trips  (DATE column included)
-- -------------------------
CREATE TABLE trips (
  trip_id      INT PRIMARY KEY,
  driver_id    INT NOT NULL,
  trip_date    DATE NOT NULL,
  distance_km  DECIMAL(5,1) NOT NULL,
  fare         INT NOT NULL,
  rating       DECIMAL(3,1) NOT NULL,
  CONSTRAINT fk_trips_driver
    FOREIGN KEY (driver_id) REFERENCES drivers(driver_id)
);

-- -------------------------
-- Insert data: drivers (4 rows)
-- -------------------------
INSERT INTO drivers (driver_id, driver_name, base_area) VALUES
(1, 'Asha',  'Indiranagar'),
(2, 'Ravi',  'Koramangala'),
(3, 'Meera', 'Whitefield'),
(4, 'Kabir', 'HSR Layout');

-- -------------------------
-- Insert data: trips (10 rows)
-- -------------------------
INSERT INTO trips (trip_id, driver_id, trip_date, distance_km, fare, rating) VALUES
(101, 1, '2025-11-01', 12.0, 350, 4.8),
(102, 1, '2025-11-02',  5.5, 180, 4.6),
(103, 2, '2025-11-01',  8.0, 260, 4.9),
(104, 2, '2025-11-03', 15.0, 500, 4.7),
(105, 3, '2025-11-02',  3.0, 120, 4.2),
(106, 3, '2025-11-04', 22.0, 780, 4.9),
(107, 4, '2025-11-01',  6.0, 210, 4.5),
(108, 4, '2025-11-03',  9.0, 300, 4.4),
(109, 4, '2025-11-04',  4.0, 150, 4.8),
(110, 1, '2025-11-04', 18.0, 620, 4.9);

select * from drivers;
select * from trips;

-- 1.For each trip_date, show number of trips, total fare, and average rating.
select trip_date, count(*), sum(fare), avg(rating) from trips group by trip_date;


-- 2.By base_area, show total trips, total fare, and average distance. 
select d.base_area, count(*), sum(t.fare), avg(t.distance_km) from drivers as d join trips as t on d.driver_id=t.driver_id group by d.base_area;


-- 3.Rating buckets count (>=4.8 as “High”, else “Other”) 
select  
case when rating >= 4.8 then 'high' else 'other' end as rating_bucket, count(*) from trips group by case when rating >= 4.8 then 'high' else 'other' end;

-- 4.Days where total fare >= 800 (GROUP BY + HAVING) 
select trip_date, sum(fare) from trips group by trip_date having sum(fare) >= 800;


-- 5.Base-area average rating, only areas with avg rating >= 4.7 (HAVING) 
select d.base_area, avg(t.rating) from drivers as d
join trips as t on 
d.driver_id = t.driver_id
group by d.base_area
having avg(t.rating) >= 4.7;


-- 6.Trips with fare greater than the overall average fare (single-rowsubquery) 
select trip_id, driver_id, fare from trips where fare > (select avg(fare) from trips );


-- 7. Drivers who have at least one trip rated 4.9 (multi-row INsubquery)
select d.driver_id, d.driver_name from drivers as d 
join trips as t on 
d.driver_id = t.driver_id
where t.rating in (select rating from trips where rating = 4.9);


-- 8.Drivers whose total fare is greater than the average total fare per driver --- nahi huva ----
select d.driver_id, d.driver_name, sum(t.fare) from drivers as d
join trips as t on 
d.driver_id = t.driver_id
group by d.driver_id, d.driver_name
having sum(t.fare) > (select avg(t.fare) from trips as t group by driver_id);


-- 9.Latest trip per driver --- nahi huva ye bii
select driver_id, trip_id, trip_date, fare from trips order by trip_date desc;


-- 10.Row number of trips per driver ordered by date (then trip_id)
select driver_id, trip_id, trip_date, row_number() over(partition by driver_id order by trip_date) from trips;


-- 11.Running total fare per driver over time
select driver_id, trip_id, trip_date, sum(fare) over(partition by driver_id order by trip_date) from trips
order by driver_id, trip_date;


-- 12.Rank trips by fare within each driver (highest fare rank 1) 
select driver_id, trip_id, fare, RANK() over(partition by driver_id order by fare desc) from trips; 


-- 13.Show each trip’s fare minus the driver’s average fare (window AVG)
select driver_id, trip_id, fare, avg(fare) over(partition by driver_id),
fare - avg(fare) over(partition by driver_id) from trips;


-- 14.For each driver, show the previous trip’s fare (LAG) ordered by date
select driver_id, trip_id, trip_date, fare,  lag(fare, 1) over(partition by driver_id) from trips;




