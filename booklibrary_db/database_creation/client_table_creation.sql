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
(1, 'Kaiden', 'Hill', 2006, 'Student'),
(2, 'Alina', 'Morton', 2010, 'Student'),
(3, 'Fania', 'Brooks', 1983, 'Food Scientist'),
(4, 'Courtney', 'Jensen', 2006, 'Student'),
(5, 'Brittany', 'Hill', 1983, 'Firefighter'),
(6, 'Max', 'Rogers', 2005, 'Student'),
(7, 'Margaret', 'McCarthy', 1981, 'School Psychologist'),
(8, 'Julie', 'McCarthy', 1973, 'Professor'),
(9, 'Ken', 'McCarthy', 1974, 'Securities Clerk'),
(10, 'Britany', "O'Quinn", 1984, 'Violinist'),
(11, 'Conner', 'Gardner', 1998, 'Licensed Massage Therapist'),
(12, 'Mya', 'Austin', 1960, 'Parquet Floor Layer'),
(13, 'Thierry', 'Rogers', 2004, 'Student'),
(14, 'Eloise', 'Rogers', 1984, 'Computer Security Manager'),
(15, 'Gerard', 'Jackson', 1979, 'Oil Exploration Engineer'),
(16, 'Randy', 'Day', 1986, 'Aircraft Electrician'),
(17, 'Jodie', 'Page', 1990, 'Manufacturing Director'),
(18, 'Coral', 'Rice', 1996, 'Window Washer'),
(19, 'Ayman', 'Austin', 2002, 'Student'),
(20, 'Jaxson', 'Austin', 1999, 'Repair Worker'),
(21, 'Joel', 'Austin', 1973, 'Police Officer'),
(22, 'Alina', 'Austin', 2010, 'Student'),
(23, 'Elin', 'Austin', 1962, 'Payroll Clerk'),
(24, 'Ophelia', 'Wolf', 2004, 'Student'),
(25, 'Eliot', 'McGuire', 1967, 'Dentist'),
(26, 'Peter', 'McKinney', 1968, 'Professor'),
(27, 'Annabella', 'Henry', 1974, 'Nurse'),
(28, 'Anastasia', 'Baker', 2001, 'Student'),
(29, 'Tyler', 'Baker', 1984, 'Police Officer'),
(30, 'Lilian', 'Ross', 1983, 'Insurance Agent'),
(31, 'Thierry', 'Arnold', 1975, 'Bus Driver'),
(32, 'Angelina', 'Rowe', 1979, 'Firefighter'),
(33, 'Marcia', 'Rowe', 1974, 'Health Educator'),
(34, 'Martin', 'Rowe', 1976, 'Ship Engineer'),
(35, 'Adeline', 'Rowe', 2005, 'Student'),
(36, 'Colette', 'Rowe', 1963, 'Professor'),
(37, 'Diane', 'Clark', 1975, 'Payroll Clerk'),
(38, 'Caroline', 'Clark', 1960, 'Dentist'),
(39, 'Dalton', 'Clayton', 1982, 'Police Officer'),
(40, 'Steve', 'Clayton', 1990, 'Bus Driver'),
(41, 'Melanie', 'Clayton', 1987, 'Computer Engineer'),
(42, 'Alana', 'Wilson', 2007, 'Student'),
(43, 'Carson', 'Byrne', 1995, 'Food Scientist'),
(44, 'Conrad', 'Byrne', 2007, 'Student'),
(45, 'Ryan', 'Porter', 2008, 'Student'),
(46, 'Elin', 'Porter', 1978, 'Computer Programmer'),
(47, 'Tyler', 'Harvey', 2007, 'Student'),
(48, 'Arya', 'Harvey', 2008, 'Student'),
(49, 'Serena', 'Harvey', 1978, 'School Teacher'),
(50, 'Lilly', 'Franklin', 1976, 'Doctor'),
(51, 'Mai', 'Franklin', 1994, 'Dentist'),
(52, 'John', 'Franklin', 1999, 'Firefighter'),
(53, 'Judy', 'Franklin', 1995, 'Firefighter'),
(54, 'Katy', 'Lloyd', 1992, 'School Teacher'),
(55, 'Tamara', 'Allen', 1963, 'Ship Engineer'),
(56, 'Maxim', 'Lyons', 1985, 'Police Officer'),
(57, 'Allan', 'Lyons', 1983, 'Computer Engineer'),
(58, 'Marc', 'Harris', 1980, 'School Teacher'),
(59, 'Elin', 'Young', 2009, 'Student'),
(60, 'Diana', 'Young', 2008, 'Student'),
(61, 'Diane', 'Young', 2006, 'Student'),
(62, 'Alana', 'Bird', 2003, 'Student'),
(63, 'Anna', 'Becker', 1979, 'Security Agent'),
(64, 'Katie', 'Grant', 1977, 'Manager'),
(65, 'Joan', 'Grant', 2010, 'Student'),
(66, 'Bryan', 'Bell', 2001, 'Student'),
(67, 'Belle', 'Miller', 1970, 'Professor'),
(68, 'Peggy', 'Stevens', 1990, 'Bus Driver'),
(69, 'Steve', 'Williamson', 1975, 'HR Clerk'),
(70, 'Tyler', 'Williamson', 1999, 'Doctor'),
(71, 'Izabelle', 'Williamson', 1990, 'Systems Analyst'),
(72, 'Annabel', 'Williamson', 1960, 'Cashier'),
(73, 'Mohamed', 'Waters', 1966, 'Insurance Agent'),
(74, 'Marion', 'Newman', 1970, 'Computer Programmer'),
(75, 'Ada', 'Williams', 1986, 'Computer Programmer'),
(76, 'Sean', 'Scott', 1983, 'Bus Driver'),
(77, 'Farrah', 'Scott', 1974, 'Ship Engineer'),
(78, 'Christine', 'Lambert', 1973, 'School Teacher'),
(79, 'Alysha', 'Lambert', 2007, 'Student'),
(80, 'Maia', 'Grant', 1984, 'School Teacher'); 

-- We create an index in the id field because it is often used when joining,
-- also, we create an index for the year of birth because there are several 
-- queries that require age (and therefore the year of birth)
CREATE INDEX client_id_index 
ON `client` (id);

CREATE INDEX client_year_of_birth_index 
ON `client` (year_of_birth);

/*Data retrieval to check if everything is alright */
SELECT * FROM `client`;