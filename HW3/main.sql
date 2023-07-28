-- Create the database and table
CREATE DATABASE IF NOT EXISTS Company;
USE Company;

CREATE TABLE IF NOT EXISTS staff
(
    id INT AUTO_INCREMENT PRIMARY KEY,
    firstname VARCHAR(255),
    lastname VARCHAR(255),
    post VARCHAR(255),
    seniority INT,
    salary DECIMAL(10, 2),
    age INT
);

-- Insert data into the table
INSERT INTO staff (firstname, lastname, post, seniority, salary, age) VALUES 
('Maurice', 'Thomas', 'Clerk', 9, 3557.69, 50),
('Thomas', 'Cox', 'Worker', 19, 6931.95, 23),
('Eric', 'Vasquez', 'Engineer', 12, 7015.07, 44),
('Nicole', 'Newton', 'Developer', 13, 7036.61, 24),
('Pamela', 'Lucas', 'Engineer', 1, 3668.05, 58),
('Keith', 'Summers', 'Manager', 1, 3834.84, 39),
('Karen', 'Hays', 'Manager', 20, 7942.14, 55),
('Patrick', 'Nelson', 'Clerk', 20, 7020.01, 43),
('Brooke', 'Weiss', 'Clerk', 7, 5924.73, 39),
('William', 'Mclean', 'Manager', 14, 9055.62, 39),
('Brandi', 'Wright', 'Engineer', 6, 3711.06, 29),
('Garrett', 'Smith', 'Developer', 18, 7387.22, 52);

-- Query 1: Sort the data by salary in descending order
SELECT * FROM staff ORDER BY salary DESC;

-- Query 2: Sort the data by salary in ascending order
SELECT * FROM staff ORDER BY salary ASC;

-- Query 3: Get the top 5 salaries
SELECT salary FROM staff ORDER BY salary DESC LIMIT 5;

-- Query 4: Calculate the total salary for each post
SELECT post, SUM(salary) as total_salary FROM staff GROUP BY post;

-- Query 5: Count the number of employees with the post 'Worker' aged between 24 and 49 inclusive
SELECT COUNT(*) FROM staff WHERE post = 'Worker' AND age BETWEEN 24 AND 49;

-- Query 6: Find the number of different posts
SELECT COUNT(DISTINCT post) FROM staff;

-- Query 7: Display the posts where the average age of employees is less than or equal to 30
SELECT post FROM staff GROUP BY post HAVING AVG(age) <= 30;
