/*Using the current database */
USE `public_library`;

/*Dropping for every change we might want to make in the table */
DROP TABLE IF EXISTS `book`;

/*Table structure for table `book` */
CREATE TABLE `book` (
	id INT PRIMARY KEY,
  title VARCHAR(255),
  author_id INT,
  FOREIGN KEY (author_id) REFERENCES author(id) ON DELETE CASCADE,
  genre VARCHAR(50)
);

/*Data insertion into the table */
INSERT INTO `book` (`id`,`title`,`author_id`,`genre`) values
	(1, 'Build your database system', 1, 'Science'),
	(2, 'The red wall', 2, 'Fiction'),
	(3, 'The perfect match', 3, 'Fiction'),
	(4, 'Digital Logic', 4, 'Science'),
	(5, 'How to be a great lawyer', 5, 'Law'),
	(6, 'Manage successful negotiations', 6, 'Society'),
	(7, 'Pollution today', 7, 'Science'),
	(8, 'A gray park', 2, 'Fiction'),
	(9, 'How to be rich in one year', 8, 'Humor'),
	(10, 'Their bright fate', 9, 'Fiction'),
	(11, 'Black lines', 10, 'Fiction'),
	(12, 'History of theater', 11, 'Literature'),
	(13, 'Electrical transformers', 12, 'Science'),
	(14, 'Build your big data system', 1, 'Science'),
	(15, 'Right and left', 13, 'Children'),
	(16, 'Programming using Python', 1, 'Science'),
	(17, 'Computer networks', 14, 'Science'),
	(18, 'Performance evaluation', 15, 'Science'),
	(19, 'Daily exercise', 16, 'Well being'),
	(20, 'The silver uniform', 17, 'Fiction'),
	(21, 'Industrial revolution', 18, 'History'),
	(22, 'Green nature', 19, 'Well being'),
	(23, 'Perfect football', 20, 'Well being'),
	(24, 'The chocolate love', 21, 'Humor'),
	(25, 'Director and leader', 22, 'Society'),
	(26, 'Play football every week', 20, 'well being'),
	(27, 'Maya the bee', 13, 'Children'),
	(28, 'Perfect rugby', 20, 'Well being'),
	(29, 'The end', 23, 'Fiction'),
	(30, 'Computer security', 1, 'Science'),
	(31, 'Participate', 22, 'Society'),
	(32, 'Positive figures', 3, 'Fiction'); 

-- We create an index in the id field because it is often used when joining 
CREATE INDEX book_id_index 
ON `book` (id);

/*Data retrieval to check if everything is alright */
SELECT * FROM `book`;