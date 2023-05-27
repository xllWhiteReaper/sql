/*TASK DESCRIPTION
Average number of borrowed books by job title */

/*Using the current database */
USE `public_library`;

/*Displaying the contents of the queried table */
-- FIRST we create a CTE called frequency_table that will count the 
-- number of borrowed books by customer id.
-- Then, we will find the average by replacing client_id by
-- occupation
WITH frequency_table AS (
  SELECT occupation, borrow_count 
  FROM
  (
    SELECT client_id, COUNT(*) AS borrow_count
    FROM `borrower`
    GROUP BY client_id
  ) AS borrower_count
  JOIN `client` USE INDEX (client_id_index) ON borrower_count.client_id = client.id
)
SELECT occupation AS "Occupation", 
ROUND(AVG(borrow_count), 3) AS "Average"
FROM frequency_table
GROUP BY occupation;