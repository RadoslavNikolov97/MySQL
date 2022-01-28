CREATE DATABASE IF NOT EXISTS `hotel`; 
USE `hotel`;

CREATE TABLE departments (
	id INT PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(50)
);

INSERT INTO departments(name) VALUES('Front Office'), ('Support'), ('Kitchen'), ('Other');

CREATE TABLE employees (
	id INT PRIMARY KEY AUTO_INCREMENT,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	job_title VARCHAR(50) NOT NULL,
	department_id INT NOT NULL,
	salary DOUBLE NOT NULL,
	CONSTRAINT `fk_department_id` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`)
);

INSERT INTO `employees` (`first_name`,`last_name`, `job_title`,`department_id`,`salary`) VALUES
	('John', 'Smith', 'Manager',1, 900.00),
	('John', 'Johnson', 'Customer Service',2, 880.00),
	('Smith', 'Johnson', 'Porter', 4, 1100.00),
	('Peter', 'Petrov', 'Front Desk Clerk', 1, 1100.00),
	('Peter', 'Ivanov', 'Sales', 2, 1500.23),
	('Ivan' ,'Petrov', 'Waiter', 3, 990.00),
	('Jack', 'Jackson', 'Executive Chef', 3, 1800.00),
	('Pedro', 'Petrov', 'Front Desk Supervisor', 1, 2100.00),
	('Nikolay', 'Ivanov', 'Housekeeping', 4, 1600.00);
	

	
CREATE TABLE rooms (
	id INT PRIMARY KEY AUTO_INCREMENT,
	`type` VARCHAR(30)
);

INSERT INTO rooms(`type`) VALUES('apartment'), ('single room');

CREATE TABLE clients (
	id INT PRIMARY KEY AUTO_INCREMENT,
	first_name VARCHAR(50),
	last_name VARCHAR(50),
	room_id INT NOT NULL,
    CONSTRAINT fk_clients_rooms
    FOREIGN KEY (room_id)
    REFERENCES rooms(id)
);

INSERT INTO clients(`first_name`,`last_name`,`room_id`) 
VALUES('Pesho','Petrov', 1),('Gosho','Georgiev', 2),
('Mariya','Marieva', 2), ('Katya','Katerinova', 1), ('Nikolay','Nikolaev', 2);

-- -----------------------------------------------------------------

# Problem 1

SELECT `id`,`first_name`,`last_name`,`job_title` FROM `employees` ORDER BY `id`;

# Problem 2

SELECT `id`, concat(first_name, ' ', last_name) AS `full_name`,`job_title`,`salary` 
FROM employees
WHERE salary > 1000
ORDER by id;

# Problem 3
UPDATE `employees`
SET `salary` = `salary` + 100
WHERE `job_title` = 'Manager';
SELECT 
    `salary`
FROM
    employees;
    
    
# Problem 4
SELECT * FROM employees ORDER BY salary DESC LIMIT 1;

# PRoblem 5
SELECT * FROM employees 
WHERE department_id = 4 AND salary >= 1000
ORDER BY id; 

# Problem 6
DELETE FROM employees
WHERE department_id	IN (1,2);
SELECT * FROM employees ORDER BY id ASC;

-- ----------------------------------------------------------------

# Problem Ex 1

SELECT 
    *
FROM
    departments
ORDER BY `department_id` ASC;

# Problem Ex 2


SELECT 
    `name`
FROM
    `departments`
ORDER BY `department_id` ASC;

# Problem Ex 3

SELECT 
    `first_name`, `last_name`, `salary`
FROM
    `employees`
ORDER BY employee_id;

# Problem Ex 4

SELECT 
    `first_name`, `middle_name`, `last_name`
FROM
    `employees`
ORDER BY employee_id;

# Problem Ex 5

SELECT 
    CONCAT(`first_name`,
            '.',
            `last_name`,
            '@softuni.bg') AS `full_email_address`
FROM
    employees;
    
    # Problem Ex 6
    
    SELECT DISTINCT `salary` FROM employees;
    
    # Problem Ex 7
    
    SELECT 
    *
FROM
    employees
WHERE
    `job_title` = 'Sales Representative'
ORDER BY employee_id;

# Problem Ex 8

SELECT 
    `first_name`, `last_name`, `job_title`
FROM
    employees
WHERE
    `salary` BETWEEN 20000 AND 30000
ORDER BY employee_id;

# Problem Ex 9

SELECT 
    CONCAT(`first_name`,
            ' ',
            `middle_name`,
            ' ',
            `last_name`) AS `Full Name`
FROM
    employees
WHERE
    `salary` IN (25000 , 14000, 12500, 23600);
    
    # Problem Ex 10
    
    SELECT 
    `first_name`, `last_name`
FROM
    employees
WHERE
    `manager_id` IS NULL;
    
    # Problem Ex 11
    
    
    SELECT 
    `first_name`, `last_name`, `salary`
FROM
    employees
WHERE
    `salary` > 50000
    ORDER BY `salary` DESC;
    
    # Problem Ex 12

SELECT 
    `first_name`, `last_name`
FROM
    employees
ORDER BY `salary` DESC
LIMIT 5;
    
    # Problem Ex 13
    
    SELECT  `first_name`, `last_name`
FROM
    employees
    WHERE 
    department_id != 4;
    
    # Problem Ex 14
    
    SELECT 
    *
FROM
    employees
ORDER BY `salary` DESC , `first_name` , `last_name` DESC , `middle_name`;

# Problem Ex 15
CREATE VIEW `v_employees_salaries` AS
    SELECT 
        `first_name`, `last_name`, `salary`
    FROM
        `employees`;
        
        
  # Problem Ex 16
  
  CREATE VIEW `v_employees_job_titles` AS
  SELECT  CONCAT(`first_name`,
            ' ',
            `middle_name`,
            ' ',
            `last_name`) AS `Full Name`, `job_title` FROM employees;
            
  # Problem Ex 17
  
SELECT DISTINCT
    `job_title`
FROM
    employees
ORDER BY `job_title` ASC;

# PRoblem Ex 18

SELECT 
    *
FROM
    projects
ORDER BY `start_date` , `name` , `project_id`
LIMIT 10;

# Problem Ex 19

SELECT 
    `first_name`, `last_name`, `hire_date`
FROM
    employees
ORDER BY `hire_date` DESC
LIMIT 7;

# Problem Ex 20
UPDATE `employees` 
SET `salary` = `salary` * 1.12
WHERE `department_id` = 1 OR 2 OR 4 OR 11;
SELECT `salary` FROM employees;

# Problem Ex 21

SELECT 
    `peak_name`
FROM
    peaks
ORDER BY `peak_name` ASC;

# Problem Ex 22

SELECT 
    `country_name`,`population`
FROM
    countries
WHERE
    `continent_code` = 'EU'
ORDER BY `population` DESC,`country_name`
LIMIT 30;

# Problem Ex 23 

SELECT 
    `country_name`,
    `country_code`,
    IF(`currency_code` = 'EUR',
        'Euro',
        'Not Euro')
FROM
    countries
ORDER BY `country_name` ASC;

# Problem Ex 24

SELECT 
    `name`
FROM
    `characters`
ORDER BY `name` ASC;
    
    
    
    
    

