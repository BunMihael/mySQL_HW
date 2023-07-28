-- Select the analysis name and price from the Analysis table
SELECT 
    Analysis.an_name,  -- Select the name of the analysis
    Analysis.an_price  -- Select the price of the analysis
FROM 
    Analysis  -- From the Analysis table
JOIN 
    Orders  -- Join with the Orders table
ON 
    Analysis.an_id = Orders.ord_an  -- The join condition is that the analysis ID in the Analysis table matches the analysis ID in the Orders table
WHERE 
    Orders.ord_datetime BETWEEN '2020-02-05' AND '2020-02-12';  -- Only select the rows where the order date and time are between February 5, 2020, and February 12, 2020
