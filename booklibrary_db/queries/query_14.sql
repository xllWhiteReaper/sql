/*TASK DESCRIPTION
First and last names of authors that wrote books in more than one genre  */

/*Using the current database */
USE `public_library`;

/*Displaying the contents of the queried table */
-- We start by creating a cte that will help 
-- with legibility, avoiding nesting and workability
WITH author_genres AS (
  -- we select the counter for each different genre and group
  -- by author id 
  SELECT distinct_author_genres.author_id,
  COUNT(distinct_author_genres.genre) AS number_of_genres FROM(
    -- we select the author ids and genres
    -- for each different combination of author_id-genre
    SELECT DISTINCT author_id, genre
    FROM `book`
  ) AS distinct_author_genres
  GROUP BY author_id
)
-- we then select the first and last name from the authors 
-- that pass the conditional of having more than 1 genre
SELECT 
first_name AS "First Name",
last_name AS "Last Name"
FROM `author` USE INDEX (author_id_index)
JOIN `author_genres` ON author_genres.author_id = author.id
WHERE author_genres.number_of_genres > 1;
