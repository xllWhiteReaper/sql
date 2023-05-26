/*TASK DESCRIPTION
Create a VIEW and display the titles that were borrowed by at least 20% of clients  */

/*Using the current database */
USE `public_library`;

DROP VIEW IF EXISTS `books_borrowed_by_more_than_20_percent`;
/*Displaying the contents of the queried table */
-- creating the view
CREATE VIEW books_borrowed_by_more_than_20_percent AS
SELECT title AS "Book title"
FROM `book`
WHERE id IN (
  -- we create a cte table to help us count the percentage of clients that 
  -- borrowed the book
  WITH frequency_table AS (
    SELECT book_id, COUNT(DISTINCT client_id) / (SELECT COUNT(*) FROM client) AS percentage_of_clients_read
    FROM `borrower`
    GROUP BY book_id
  )
  -- then we select just the ones that have a higher percentage than 0.2
  SELECT book_id FROM frequency_table
  WHERE frequency_table.percentage_of_clients_read >= 0.2
);

-- Theoretically, the user (developer, or not high range) querying the table
-- doesn't have access to the previous code where the view is created, he/she
-- just has access to the view; therefore, the previous code has to be 
-- executed before accessing the view 
SELECT * FROM books_borrowed_by_more_than_20_percent;