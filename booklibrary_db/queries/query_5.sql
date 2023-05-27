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
  USE INDEX (borrower_date_index)
  WHERE YEAR(borrow_date) BETWEEN 2015 AND 2017
  GROUP BY book_id
  ORDER BY counter ASC
  LIMIT 5
) AS top_authors
-- then we make joins to get the desired information from other tables 
JOIN `book` USE INDEX (book_id_index) ON top_authors.book_id = book.id
-- note that we have to join books because there is no direct connection
-- between borrower and author
JOIN `author` USE INDEX (author_id_index) ON book.author_id = author.id; 