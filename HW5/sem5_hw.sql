CREATE TABLE cars
(
	id INT NOT NULL PRIMARY KEY,
    name VARCHAR(45),
    cost INT
);

INSERT cars
VALUES
	(1, "Audi", 52642),
    (2, "Mercedes", 57127 ),
    (3, "Skoda", 9000 ),
    (4, "Volvo", 29000),
	(5, "Bentley", 350000),
    (6, "Citroen ", 21000 ), 
    (7, "Hummer", 41400), 
    (8, "Volkswagen ", 21600);
    
SELECT *
FROM cars;

-- 1. Creating a view which includes cars costing up to 25000 dollars.
CREATE VIEW cheap_cars AS 
SELECT *
FROM cars
WHERE cost <= 25000;

-- 2. Modifying the existing view to include cars costing up to 30000 dollars.
CREATE OR REPLACE VIEW cheap_cars AS 
SELECT *
FROM cars
WHERE cost <= 30000;

-- 3. Creating a view which includes only cars of brand "Skoda" and "Audi".
CREATE VIEW skoda_and_audi AS 
SELECT *
FROM cars
WHERE name IN ("Skoda", "Audi");

-- 4. Adding a new column named "time to the next station".
-- Please replace `time_column` with your actual column name and `stations` with your actual table name.
-- This is a placeholder query as there's no actual data provided for this task.
SELECT *,
       LEAD(time_column) OVER (ORDER BY time_column) - time_column AS time_to_next_station
FROM stations;
