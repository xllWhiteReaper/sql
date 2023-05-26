/*TASK DESCRIPTION
First and last names of the top 5 authors clients borrowed in 2017 */

/*Using the current database */
USE `public_library`;

/*Displaying the contents of the queried table */
-- First we create the subQuery, that i like to have as a 
-- CTE because is easier to read and understand
SELECT *
FROM `borrower`
JOIN `book` ON borrower.book_id = book.id
WHERE YEAR(borrow_date) = 2017
LIMIT 20;