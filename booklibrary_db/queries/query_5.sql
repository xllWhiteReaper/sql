/*TASK DESCRIPTION
Nationalities of the least 5 authors that clients borrowed during the years 2015-2017 */

/*Using the current database */
USE `public_library`;

/*Displaying the contents of the queried table */
-- We create a sub query to get just the bottom borrows for years 2015 - 2017
SELECT 
author.nationality AS "Author Nationality"
FROM (
  -- This subQuery will select the book id and counter for 
  -- the bottom 5 author for the years 2015 - 2017
  SELECT 
  book_id, 
  COUNT(book_id) AS counter
  FROM `borrower`
  WHERE YEAR(borrow_date) BETWEEN 2015 AND 2017
  GROUP BY book_id
  ORDER BY counter ASC
  LIMIT 5
) AS top_authors
JOIN `book` ON top_authors.book_id = book.id
JOIN `author` ON book.author_id = author.id; 