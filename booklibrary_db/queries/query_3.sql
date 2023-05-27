/*TASK DESCRIPTION
First and last names of clients that borrowed books in March 2018 */

/*Using the current database */
USE `public_library`;

/*Displaying the contents of the queried table */
-- First we create the subQuery, that i like to have as a 
-- CTE because is easier to read and understand
WITH borrowers_for_specific_date AS (
  SELECT client_id 
  FROM `borrower`
  USE INDEX (borrower_date_index)
  WHERE YEAR(borrow_date) = 2018 AND MONTH(borrow_date) = 3
)
SELECT first_name AS "First Name", 
last_name AS "Last Name"
FROM `client`
USE INDEX (client_id_index)
WHERE id IN (SELECT client_id FROM borrowers_for_specific_date);