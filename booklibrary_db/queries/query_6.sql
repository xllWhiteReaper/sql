/*TASK DESCRIPTION
The book that was most borrowed during the years 2015-2017 */

/*Using the current database */
USE `public_library`;

/*Displaying the contents of the queried table */
SELECT  
id AS "Book Id",
title AS "Book Title",
author_id AS "Author Id",
genre AS "Book Genre"
FROM `book`
WHERE book.id IN (
  -- We create a sub query to get the book id of the most borrowed one in the period
  -- 2015 - 2017
  WITH top_books AS (
    SELECT *
      FROM (
        -- This will count the books read from 2015 - 2017
        SELECT 
        book_id, 
        COUNT(book_id) AS counter
        FROM `borrower`
        WHERE YEAR(borrow_date) BETWEEN 2015 AND 2017
        GROUP BY book_id
      ) AS top_books
  )
  SELECT book_id
  -- we select the rows that have the max count, as some
  -- books might've been borrowed thew same quantity of times
  FROM top_books
  WHERE top_books.counter =  (
    SELECT MAX(top_books.counter)
    FROM top_books
  )
);