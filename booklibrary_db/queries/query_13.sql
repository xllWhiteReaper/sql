/*TASK DESCRIPTION
The oldest and the youngest clients of the library  */

/*Using the current database */
USE `public_library`;

/*Displaying the contents of the queried table */
/*First, we create a CTE*/
WITH 
min_year AS (
  SELECT MIN(year_of_birth) AS min_year FROM client
),
max_year AS (
  SELECT MAX(year_of_birth) AS max_year FROM client
)
SELECT CONCAT(first_name, ' ', last_name) AS "Full Client Name",
YEAR(NOW())-year_of_birth AS "Age",
"OLDEST" AS "Type of Client"
FROM client, min_year
WHERE year_of_birth = min_year.min_year
UNION
-- we no longer need aliases, because the one above has them
SELECT CONCAT(first_name, ' ', last_name),
YEAR(NOW())-year_of_birth,
"YOUNGEST"
FROM client, max_year
WHERE year_of_birth = max_year.max_year
;