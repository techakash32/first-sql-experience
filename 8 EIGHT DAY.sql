SHOW DATABASES;

CREATE DATABASE Regex;
USE Regex;

-- Customers table
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    city VARCHAR(50)
);

-- Orders table
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    amount DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- Insert customers
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

-- Insert orders (❌ removed invalid customer_id 11,12)
INSERT INTO orders (order_id, customer_id, order_date, amount) VALUES
(101, 1, '2024-01-05', 250.00),
(102, 2, '2024-01-06', 150.00),
(103, 3, '2024-01-07', 300.00),
(104, 1, '2024-01-10', 120.00),
(105, 5, '2024-01-12', 450.00),
(106, 6, '2024-01-15', 200.00),
(107, 2, '2024-01-18', 175.00),
(108, 8, '2024-01-20', 500.00);

-- Show data
SELECT * FROM customers;
SELECT * FROM orders;

-- INNER JOIN
SELECT 
    c.customer_id,
    c.customer_name,
    o.order_id,
    o.amount
FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id;

-- LEFT JOIN
SELECT 
    c.customer_id,
    c.customer_name,
    o.order_id,
    o.amount
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id;

-- RIGHT JOIN
SELECT 
    c.customer_id,
    c.customer_name,
    o.order_id,
    o.amount
FROM customers c
RIGHT JOIN orders o
ON c.customer_id = o.customer_id;

-- FULL OUTER JOIN (MySQL simulation)
SELECT 
    c.customer_id,
    c.customer_name,
    o.order_id,
    o.amount
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id

UNION

SELECT 
    c.customer_id,
    c.customer_name,
    o.order_id,
    o.amount
FROM customers c
RIGHT JOIN orders o
ON c.customer_id = o.customer_id;

-- NATURAL JOIN (NO aliases allowed for common columns)
SELECT 
    customer_id,
    customer_name,
    order_id,
    amount
FROM customers
NATURAL JOIN orders;
