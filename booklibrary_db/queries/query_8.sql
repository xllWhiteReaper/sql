/*TASK DESCRIPTION
Top 5 occupations that borrowed the most in 2016 */

/*Using the current database */
USE `public_library`;

/*Displaying the contents of the queried table */
WITH occupations AS (
  -- selecting the occupations for borrowers 
  -- on the year 2016
  SELECT occupation
  FROM `borrower`
  USE INDEX (borrower_date_index)
  INNER JOIN `client` ON borrower.client_id = client.id
  WHERE YEAR(borrow_date) = 2016
)
-- ordering in descendent way to get the top 5 
SELECT 
occupation AS "Occupation", 
COUNT(occupation) AS "Counter"
FROM occupations
GROUP BY occupation
ORDER BY COUNT(occupation) DESC
LIMIT 5;