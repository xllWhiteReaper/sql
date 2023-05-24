/*Using the current database */
USE `public_library`;

/*Dropping for every change we might want to make in the table */
DROP TABLE IF EXISTS `client`;

/*Table structure for table `client` */
CREATE TABLE `client` (
	id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name varchar(50),
    year_of_birth INT,
    occupation VARCHAR(100)
);

/*Data insertion into the table */
INSERT INTO `client` (`id`,`first_name`,`last_name`,`year_of_birth`,`occupation`) values
(1, 'Kaiden', 'Hill', 2006, 'Student'); 

/*Data retrieval to check if everthing is alright */
SELECT * FROM `client`;