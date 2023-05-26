/*TASK DESCRIPTION
Average number of borrows by age  */

/*Using the current database */
USE `public_library`;

/*Displaying the contents of the queried table */
-- first we create a cte for clarity an easiness to read 
-- where we select the ages of clients that borrowed 
-- also, we keep the borrow count for each client
WITH frequency_table AS (
  SELECT YEAR(NOW())-year_of_birth AS age,
  borrow_count
  FROM
  (
    SELECT client_id, COUNT(*) AS borrow_count
    FROM `borrower`
    GROUP BY client_id
  ) AS borrower_count
  JOIN `client` ON borrower_count.client_id = client.id
)
-- Then we find the average by grouping by ages 
SELECT age AS "Age",
ROUND(AVG(borrow_count), 3) as "Average Borrows"
FROM frequency_table
GROUP BY age;
