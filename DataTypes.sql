CREATE SCHEMA `minions`;

USE `minions`;

CREATE TABLE `minions` (`id` INT AUTO_INCREMENT NOT NULL PRIMARY KEY, `name` VARCHAR(30) NOT NULL, `age` INT UNSIGNED);
CREATE TABLE `towns` (`town_id` INT AUTO_INCREMENT NOT NULL PRIMARY KEY, `name` VARCHAR(30) NOT NULL);

ALTER TABLE `towns` CHANGE COLUMN `town_id` `id` INT NOT NULL AUTO_INCREMENT ;

ALTER TABLE `minions` ADD COLUMN `town_id` INT NOT NULL;
ALTER TABLE `minions` ADD CONSTRAINT `town_id` FOREIGN KEY `minions`(`town_id`) REFERENCES `towns` (`id`);


INSERT INTO `towns` VALUES ('1', 'Sofia'),('2','Plovdiv'),('3','Varna');
INSERT INTO `minions` VALUES ('1','Kevin','22','1'),('2','Bob','15','3'),('3','Steward',NULL,'2');

TRUNCATE `minions`;

DROP TABLE `minions`;
DROP TABLE `towns`;



CREATE TABLE `people` (`id` INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
`name` VARCHAR (200) NOT NULL , `picture` BLOB , `height` DOUBLE (10,2), 
`weight` DOUBLE (10,2) , `gender` CHAR (1) NOT NULL, `birthdate` DATE NOT NULL,
`biography` TEXT );
INSERT INTO `people` (`name`, `gender`, `birthdate`)
VALUES 
('Test', 'M', DATE(NOW())),
('Test', 'M', DATE(NOW())),
('Test', 'M', DATE(NOW())),
('Test', 'M', DATE(NOW())),
('Test', 'M', DATE(NOW()));

CREATE TABLE `users` (`id` INT AUTO_INCREMENT NOT NULL PRIMARY KEY, `username` VARCHAR (30) NOT NULL,
`password` VARCHAR (30) NOT NULL, `profile_picture` BLOB, `last_login_time` TIME, `is_deldeted` BOOLEAN );

INSERT INTO `users` (`username`, `password`)
VALUES 
('Test1', 'Pass'),
('Test2', 'Pass'),
('Test3', 'Pass'),
('Test4', 'Pass'),
('Test5', 'Pass');

ALTER TABLE `users`
DROP PRIMARY KEY,
ADD CONSTRAINT `pk_users` PRIMARY KEY `users` (`id`,`username`);
;

ALTER TABLE `users`
CHANGE COLUMN `last_login_time` `last_login_time` DATETIME DEFAULT NOW(); 

ALTER TABLE `users` DROP PRIMARY KEY,
ADD CONSTRAINT `pk_users` PRIMARY KEY (`id`),
CHANGE COLUMN `username` `username` VARCHAR(30) UNIQUE;


CREATE SCHEMA `Movies`;
USE `movies`;


CREATE TABLE `directors` (`id` INT PRIMARY KEY AUTO_INCREMENT, `director_name` VARCHAR (30) NOT NULL, `notes` TEXT);

INSERT INTO `directors` (`director_name`, `notes`)
VALUES 
('Test', 'test notes'),
('Test', 'test notes'),
('Test', 'test notes'),
('Test', 'test notes'),
('Test', 'test notes');

CREATE TABLE `genres` (`id` INT PRIMARY KEY AUTO_INCREMENT, `genre_name` VARCHAR (30) NOT NULL, `notes` TEXT);

INSERT INTO `genres` (`genre_name`, `notes`)
VALUES 
('test', 'test notes'),
('test', 'test notes'),
('test', 'test notes'),
('test', 'test notes'),
('test', 'test notes');

CREATE TABLE `categories` (
`id` INT PRIMARY KEY AUTO_INCREMENT,
`category_name` VARCHAR(20) NOT NULL,
`notes` TEXT);

INSERT INTO `categories` (`category_name`, `notes`)
VALUES
('test', 'test notes'),
('test', 'test notes'),
('test', 'test notes'),
('test', 'test notes'),
('test', 'test notes');

CREATE TABLE `movies` (`id` INT PRIMARY KEY AUTO_INCREMENT, `title` VARCHAR (30) NOT NULL,`director_id` INT NOT NULL ,
 `copyright_year` YEAR NOT NULL, `length` INT , `genre_id` INT NOT NULL, `category_id` INT NOT NULL,
`rating` DOUBLE (2,1), `notes` TEXT  );





INSERT INTO `movies` (`title`, `director_id`, `copyright_year`, `length`, `genre_id`, `category_id`, `rating`, `notes`)
VALUES
('test title', 1, 1, 2020, 1, 1, 5.7, 'some notes'),
('test title', 1, 1, 2022, 1, 1, 5.7, 'some notes'),
('test title', 1, 1, 2022, 1, 1, 5.7, 'some notes'),
('test title', 1, 1, 2022, 1, 1, 5.7, 'some notes'),
('test title', 1, 1, 2022, 1, 1, 5.7, 'some notes');


CREATE SCHEMA `car_rental`;
use `car_rental`;
CREATE TABLE `categories` (id INT PRIMARY KEY AUTO_INCREMENT, category VARCHAR(30) NOT NULL, daily_rate DOUBLE (4,2), weekly_rate DOUBLE (5,2), monthly_rate DOUBLE (6,2), weekend_rate DOUBLE (4,2));
CREATE TABLE `cars` (id INT PRIMARY KEY AUTO_INCREMENT, plate_number VARCHAR(30) NOT NULL , make VARCHAR (20) NOT NULL, model VARCHAR (20) NOT NULL , car_year YEAR, category_id INT, doors INT, picture BLOB, car_condition VARCHAR (50), available BOOLEAN);
CREATE TABLE `employees` (id INT PRIMARY KEY AUTO_INCREMENT,first_name VARCHAR (30) NOT NULL, last_name VARCHAR (30) NOT NULL, title VARCHAR (30) NOT NULL , notes TEXT);
CREATE TABLE `customers` (id INT PRIMARY KEY AUTO_INCREMENT, driver_licence_number VARCHAR (20), full_name VARCHAR (60), address VARCHAR (50), city VARCHAR (20), zip_code INT (10), notes TEXT);
CREATE TABLE `rental_orders` (id INT PRIMARY KEY AUTO_INCREMENT, employee_id INT, customer_id INT, car_id INT, car_condition VARCHAR (40), tank_level DOUBLE, kilometrage_start DOUBLE, kilometrage_end DOUBLE, total_kilometrage DOUBLE, start_date DATETIME, end_date DATETIME, total_days INT, rate_applied DOUBLE, tax_rate DOUBLE, order_status VARCHAR (20), notes TEXT);

INSERT INTO `categories` (`category`, `daily_rate`, `weekly_rate`, `weekend_rate`)
VALUES
('test', 1, 1, 1),
('test', 1, 1, 1),
('test', 1, 1, 1);

INSERT INTO `cars` (`plate_number`, `make`, `model`, `doors`, `available`)
VALUES
('TX1000TX', 'Toyota', 'Avensis', 4, TRUE),
('TX1000TX', 'Toyota', 'Avensis', 4, TRUE),
('TX1000TX', 'Toyota', 'Avensis', 4, TRUE);


INSERT INTO `employees` (`first_name`, `last_name`, `title`)
VALUES
('test', 'test', 'test'),
('test', 'test', 'test'),
('test', 'test', 'test');

INSERT INTO `customers` (`driver_licence_number`, `full_name`, `city`, `zip_code`)
VALUES
('123123JH', 'test name', 'test city', 1000),
('123123JH', 'test name', 'test city', 1000),
('123123JH', 'test name', 'test city', 1000);

INSERT INTO `rental_orders` (`employee_id`, `customer_id`, `car_id`, `total_days`)
VALUES
(1, 1, 1, 10),
(1, 1, 1, 10),
(1, 1, 1, 10);


CREATE SCHEMA `soft_uni`;
USE `soft_uni`;

CREATE TABLE `towns` (id INT PRIMARY KEY AUTO_INCREMENT, `name` VARCHAR (30) NOT NULL);
CREATE TABLE `addresses` (id INT PRIMARY KEY AUTO_INCREMENT, address_text VARCHAR (30), town_id INT);
CREATE TABLE `departments` (id INT PRIMARY KEY AUTO_INCREMENT, `name` VARCHAR (30) NOT NULL );
CREATE TABLE `employees` (id INT PRIMARY KEY AUTO_INCREMENT, first_name VARCHAR(30), middle_name VARCHAR (30), last_name VARCHAR (30), job_title VARCHAR (20), department_id INT, hire_date DATETIME , salary DOUBLE, address_id INT);
INSERT INTO `towns` (`name`)
VALUES
('Sofia'),
('Plovdiv'),
('Varna'),
('Burgas');

INSERT INTO `departments` (`name`)
VALUES
('Engineering'),
('Sales'),
('Marketing'),
('Software Development'),
('Quality Assurance');

INSERT INTO `employees` (`first_name`, `middle_name`, `last_name`, `job_title`, `department_id`, `hire_date`, `salary`)
VALUES
('Ivan', 'Ivanov', 'Ivanov', '.NET Developer', 4, '2013-02-01', '3500.00'),
('Petar', 'Petrov', 'Petrov',	'Senior Engineer', 1, '2004-03-02', '4000.00'),
('Maria', 'Petrova', 'Ivanova', 'Intern', 5, '2016-08-28', '525.25'),
('Georgi', 'Terziev', 'Ivanov', 'CEO', 2, '2007-12-09', '3000.00'),
('Peter', 'Pan','Pan', 'Intern', 3, '2016-08-28', '599.88');


SELECT * FROM `towns` ORDER BY `name` ASC;
SELECT * FROM `departments` ORDER BY `name` ASC;
SELECT * FROM `employees` ORDER BY `salary` DESC;

SELECT `name` FROM `towns` ORDER BY `name` ASC;
SELECT `name` FROM `departments` ORDER BY `name` ASC;
SELECT `first_name`,`last_name`,`job_title`,`salary` FROM `employees` ORDER BY `salary` DESC;


UPDATE `employees`
SET `salary` = `salary` * 1.1;
SELECT `salary` FROM `employees`;


 TRUNCATE `occupancies`;
 