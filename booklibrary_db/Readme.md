# SQL Project Readme

This project was created for the 'Database Programming' course at study.com. The project consists of a SQL database for a book library, with tables for clients, authors, books, and borrowers. The database is designed specifically for MySQL, so some queries may not work with other DBMS.

## Usage Instructions

To use this project, follow these steps:

1. Clone the project from the GitHub repository at https://github.com/xllWhiteReaper/sql/tree/develop.
2. Open the `booklibrary_db` folder and find the relevant files.
3. Use the scripts in the `database_creation` folder to create the database and tables in the correct order. The scripts should be run in the following order:

   - `database_creation.sql`
   - `client_table_creation.sql`
   - `author_table_creation.sql`
   - `book_table_creation.sql`
   - `borrower_table_creation.sql`

   It's important to follow this order because of the relationships between the tables. For instance, the `borrower` table has foreign keys that reference the `client` and `book` tables, so those tables must be created first to ensure that the foreign key constraints can be set up properly. Additionally, the `book` table has a foreign key that references the `author` table, so the `author` table must be created before the `book` table.By following this order,you can ensure that the tables are created and related to each other correctly.

4. After all the tables are created, run the queries in the `queries` folder to test the database.

## Query Usage

The queries in the `queries` folder can be customized to your needs or executed in any order that makes sense for your use case. Here's a brief description of each query:

1. **Display all contents of the Clients table**: This query selects all columns from the `client` table.

2. **First names, last names, ages and occupations of all clients**: This query selects the first name, last name, age, and occupation columns from the `client` table and calculates the age based on the birth year.

3. **First and last names of clients that borrowed books in March 2018**: This query selects the first and last names of clients who borrowed books in March 2018 from the `borrower` and `book` tables.

4. **First and last names of the top 5 authors clients borrowed in 2017**: This query selects the first and last names of the top 5 authors whose books were borrowed the most in 2017 from the `borrower`, `book`, and `author` tables.

5. **Nationalities of the least 5 authors that clients borrowed during the years 2015-2017**: This query selects the nationalities of the least 5 authors whose books were borrowedthe most during the years 2015-2017 from the `borrower`, `book`, and `author` tables.

6. **The book that was most borrowed during the years 2015-2017**: This query selects the title of the book that was borrowed the most during the years 2015-2017 from the `borrower` and `book` tables.

7. **Top borrowed genres for clients born in years 1970-1980**: This query selects the top 3 genres that were borrowed the most by clients born between 1970 and 1980 from the `borrower`, `book`, and `client` tables.

8. **Top 5 occupations that borrowed the most in 2016**: This query selects the top 5 occupations whose members borrowed the most books in 2016 from the `borrower` and `client` tables.

9. **Average number of borrowed books by job title**: This query calculates the average number of books borrowed by clients in each job title from the `borrower` and `client` tables.

10. **Create a VIEW and display the titles that were borrowed by at least 20% of clients**: This query creates a view that shows the titles of the books that were borrowed by at least 20% of clients and selects the data from the view.

11. **The top month of borrows in 2017**: This query selects the month in 2017 when the mostbooks were borrowed from the `borrower` table.

12. **Average number of borrows by age**: This query calculates the average number of books borrowed by clients in each age group from the `borrower` and `client` tables.

13. **The oldest and the youngest clients of the library**: This query selects the first and last names of the oldest and youngest clients of the library from the `client` table.

14. **First and last names of authors that wrote books in more than one genre**: This query selects the first and last names of authors who wrote books in more than one genre from the `book` and `author` tables.

You can customize the queries to your needs or execute them in any order that makes sense for your use case. However, it's important to test each query thoroughly to ensure that it returns the expected results and does not have any errors. Additionally, it's best practice to follow standard database design and development guidelines, such as normalizing your data, choosing appropriate data types and indices, and securing your database to prevent unauthorized access or modification.
