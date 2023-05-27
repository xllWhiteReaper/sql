/*TASK DESCRIPTION
Top borrowed genres for client born in years 1970-1980 */
-- IT DOESN'T SAY IT IN THE DESCRIPTION BUT WE WILL ONLY DISPLAY THE
-- TOP 5

/*Using the current database */
USE `public_library`;

/*Displaying the contents of the queried table */

SELECT genre, COUNT(genre) AS genre_counter
FROM (
  -- selecting clients born between 1970 and 1980
  -- and keeping the important columns (We just keep the genres)
  SELECT book.genre
  FROM `borrower`
  USE INDEX (borrower_id_index)
  INNER JOIN `client` USE INDEX (client_id_index, client_year_of_birth_index) ON borrower.client_id = client.id
  INNER JOIN `book` USE INDEX (book_id_index) ON borrower.book_id = book.id
  WHERE client.year_of_birth BETWEEN 1970 AND 1980
) AS sub_query
GROUP BY genre
ORDER BY genre_counter DESC
LIMIT 5;