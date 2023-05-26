/*TASK DESCRIPTION
First and last names of the top 5 authors clients borrowed in 2017 */

/*Using the current database */
USE `public_library`;

/*Displaying the contents of the queried table */
-- First we create the subQuery
-- Then, we join to be able to get the Author's name and last name
-- This is done because we don't want to waste resources for joining before 
-- searching for the top 5 most borrowed books
SELECT
author.first_name AS "First Name", 
author.last_name AS "Last Name"
FROM (
  -- This subQuery will select the book id and counter for 
  -- the top 5 author for the year 2017
  SELECT 
  book_id, 
  COUNT(book_id) AS counter
  FROM `borrower`
  WHERE YEAR(borrow_date) = 2017
  GROUP BY book_id
  ORDER BY counter DESC
  LIMIT 5
) AS top_authors
JOIN `book` ON top_authors.book_id = book.id
JOIN `author` ON book.author_id = author.id; 