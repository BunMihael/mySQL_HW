-- Create the database if it doesn't exist
CREATE DATABASE IF NOT EXISTS PRODUCT;

-- Use the PRODUCT database
USE PRODUCT;

-- Create the orders table if it doesn't exist
CREATE TABLE IF NOT EXISTS orders (
    id INT PRIMARY KEY AUTO_INCREMENT,
    employee_id VARCHAR(10) NOT NULL,
    amount DECIMAL(10, 2),
    order_status VARCHAR(25)
);

-- Insert data into the orders table
INSERT INTO orders (employee_id, amount, order_status)
VALUES
    ('e05', 100.50, 'OPEN'), -- Order 1
    ('e02', 250.75, 'CLOSED'), -- Order 2
    ('e07', 50.25, 'CANCELLED'), -- Order 3
    ('e03', 300.00, 'OPEN'), -- Order 4
    ('e01', 150.50, 'CLOSED'), -- Order 5
    ('e06', 75.25, 'CANCELLED'), -- Order 6
    ('e04', 200.00, 'OPEN'), -- Order 7
    ('e08', 180.50, 'CLOSED'), -- Order 8
    ('e09', 90.25, 'CANCELLED'), -- Order 9
    ('e10', 400.00, 'OPEN'); -- Order 10

-- Select all orders with full_order_status based on order_status
SELECT
    *,
    CASE
        WHEN order_status = 'OPEN' THEN 'Order is in open state'
        WHEN order_status = 'CLOSED' THEN 'Order is closed'
        WHEN order_status = 'CANCELLED' THEN 'Order is canceled'
        ELSE 'Unknown status'
    END AS full_order_status
FROM orders;
