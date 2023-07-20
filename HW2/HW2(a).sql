-- Create the database if it doesn't exist
CREATE DATABASE IF NOT EXISTS PRODUCT;

-- Use the PRODUCT database
USE PRODUCT;

-- Create the sales table if it doesn't exist
CREATE TABLE IF NOT EXISTS sales (
    id INT PRIMARY KEY AUTO_INCREMENT,
    product VARCHAR(45) NOT NULL,
    order_date DATE,
    quantity INT NOT NULL
);

-- Insert data into the sales table
INSERT INTO sales (product, order_date, quantity)
VALUES
    ('Product A', '2023-07-01', 50), -- Sale 1
    ('Product B', '2023-07-02', 200), -- Sale 2
    ('Product C', '2023-07-03', 150), -- Sale 3
    ('Product D', '2023-07-04', 350), -- Sale 4
    ('Product E', '2023-07-05', 100), -- Sale 5
    ('Product F', '2023-07-06', 500); -- Sale 6

-- Grouping the quantity values into segments
SELECT
    id,
    (CASE
        WHEN quantity < 100 THEN 'Small order'
        WHEN quantity >= 100 AND quantity <= 300 THEN 'Medium order'
        ELSE 'Large order'
    END) AS `Order Type`
FROM sales;

