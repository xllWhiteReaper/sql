/*TASK DESCRIPTION
First names, last names, ages and occupations of all clients */

/*Using the current database */
USE `public_library`;

/*Displaying the contents of the queried table */
SELECT first_name AS "First Name", 
last_name AS "Last Name",
YEAR(NOW())-year_of_birth AS "Age",
occupation AS "Occupation"
FROM `client` USE INDEX (client_year_of_birth_index);