-- Creating a User-Defined Function to format seconds into 'days hours minutes seconds'
-- This function takes an integer as input and returns a string
CREATE FUNCTION format_seconds(seconds INT)
RETURNS VARCHAR(50)
BEGIN
    -- Declaring the variables
    DECLARE days INT;
    DECLARE hours INT;
    DECLARE minutes INT;
    
    -- Calculating the days, hours, minutes, and remaining seconds
    SET days = seconds DIV (60*60*24);
    SET seconds = seconds MOD (60*60*24);
    SET hours = seconds DIV (60*60);
    SET seconds = seconds MOD (60*60);
    SET minutes = seconds DIV 60;
    SET seconds = seconds MOD 60;
    
    -- Returning the formatted string
    RETURN CONCAT(days, ' days ', hours, ' hours ', minutes, ' minutes ', seconds, ' seconds');
END;

-- Testing the function
SELECT format_seconds(123456) AS FormattedTime;

-- Creating a Stored Procedure to print even numbers from 1 to 10
-- This procedure does not take any input
DELIMITER $$
CREATE PROCEDURE print_even_numbers()
BEGIN
    -- Declaring the iterator variable
    DECLARE i INT DEFAULT 1;
    -- Looping from 1 to 10
    WHILE i <= 10 DO
        -- If the number is even, print it
        IF i MOD 2 = 0 THEN
            SELECT i AS EvenNumber;
        END IF;
        -- Moving to the next number
        SET i = i + 1;
    END WHILE;
END $$
DELIMITER ;

-- Calling the procedure to print even numbers
CALL print_even_numbers();
