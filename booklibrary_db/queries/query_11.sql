/*TASK DESCRIPTION
The top month of borrows in 2017  */

/*Using the current database */
USE `public_library`;

/*Displaying the contents of the queried table */
-- We create a cte to make things more readable and organized
WITH frequency_table AS (
  -- first we query the month names by using the 'MONTHNAME' function
  -- if you are't using MySQL, then you might need a different one
  SELECT month_name, 
  COUNT(month_name) AS month_counter
  -- Then we find the counter for each month 
  FROM (
    SELECT MONTHNAME(borrow_date) AS month_name
    FROM `borrower`
    WHERE YEAR(borrow_date) = 2017
  ) AS sub_query
  GROUP BY month_name
)
-- finally, we select just the months that have the max borrows s
SELECT month_name AS "Month Name"
FROM frequency_table
WHERE month_counter = (
  -- we compare because there might be several months that get the same 
  -- quantity of borrows
  SELECT MAX(month_counter)
  FROM frequency_table
);
