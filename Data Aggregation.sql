# Problem 1

SELECT 
    `department_id`,
    COUNT(`department_id`) AS 'Number of employees'
FROM
    employees
GROUP BY `department_id`
ORDER BY `department_id` , `Number of employees`;

# Problem 2

SELECT 
    `department_id`, ROUND(AVG(`salary`), 2) AS 'Average Salary'
FROM
    employees
GROUP BY `department_id`;

# Problem 3 

SELECT 
    `department_id`, ROUND(MIN(`salary`), 2) AS 'Min Salary'
FROM
    employees
GROUP BY `department_id`
HAVING `Min Salary` > 800;

# Problem 4

SELECT 
    COUNT(`price`) AS `appetizers`
FROM
    `products`
WHERE
    category_id = 2 AND `price` > 8;
    
    # Problem 5
    
    SELECT 
    `category_id`,
    ROUND(AVG(`price`), 2) AS 'Average Price',
    ROUND(MIN(`price`), 2) AS 'Cheapest Product',
    ROUND(MAX(`price`), 2) AS 'Most Expensive Product'
FROM
    `products`
GROUP BY `category_id`;


-- ------------------------------------------

# Problem Ex 1 

SELECT 
    COUNT(`id`) AS 'count'
FROM
    `wizzard_deposits`;
    
 # Problem Ex 2
 
SELECT 
    MAX(`magic_wand_size`) AS 'longest_magic_wand'
FROM
    `wizzard_deposits`;
    
 # Problem Ex 3

SELECT 
    `deposit_group`,
    MAX(`magic_wand_size`) AS 'longest_magic_wand'
FROM
    `wizzard_deposits`
GROUP BY `deposit_group`
ORDER BY `longest_magic_wand` , `deposit_group`;
 
# Problem Ex 4

SELECT 
    `deposit_group`
FROM
    `wizzard_deposits`
GROUP BY `deposit_group`
ORDER BY AVG(`magic_wand_size`)
LIMIT 1;

# Problem Ex 5

SELECT   `deposit_group`, SUM(`deposit_amount`) AS 'total_sum'
FROM
    `wizzard_deposits`
    GROUP BY `deposit_group`
    ORDER BY `total_sum`;

# Problem Ex 6

SELECT 
    `deposit_group`, SUM(`deposit_amount`) AS 'total_sum'
FROM
    `wizzard_deposits`
WHERE
    `magic_wand_creator` = 'Ollivander family'
GROUP BY `deposit_group`
ORDER BY `deposit_group`;

# Problem Ex 7
SELECT 
    `deposit_group`, SUM(`deposit_amount`) AS 'total_sum'
FROM
    `wizzard_deposits`
WHERE
    `magic_wand_creator` = 'Ollivander family'
GROUP BY `deposit_group`
HAVING `total_sum` < 150000
ORDER BY `total_sum` DESC;

# Problem Ex 8

SELECT 
    `deposit_group`,
    `magic_wand_creator`,
    MIN(`deposit_charge`) AS 'min_deposit_charge'
FROM
    `wizzard_deposits`
GROUP BY `deposit_group` , `magic_wand_creator`
ORDER BY `magic_wand_creator` ASC , `deposit_group` ASC;

# Problem Ex 9

SELECT CASE
 WHEN `age` BETWEEN 0 AND 10 THEN '[0-10]'
 WHEN `age` BETWEEN 11 AND 20 THEN '[11-20]'
 WHEN `age` BETWEEN 21 AND 30 THEN '[21-30]'
 WHEN `age` BETWEEN 31 AND 40 THEN '[31-40]'
 WHEN `age` BETWEEN 41 AND 50 THEN '[41-50]'
 WHEN `age` BETWEEN 41 AND 60 THEN '[51-60]'
 ELSE '[61+]'
	END AS 'age_group',
      COUNT(`id`) AS 'wizard_count'
    
FROM
    `wizzard_deposits`
    GROUP BY `age_group`
    ORDER BY `age_group` ASC;
    
    # Problem Ex 10 
    
   SELECT 
    LEFT(`first_name`, 1) AS `first_letter`
FROM
    `wizzard_deposits`
WHERE
    `deposit_group` = 'Troll Chest'
GROUP BY `first_letter`
ORDER BY `first_letter`;

# Problem Ex 11

SELECT 
    `deposit_group`,
    `is_deposit_expired`,
    AVG(`deposit_interest`) AS 'average_interest'
FROM
    `wizzard_deposits`
WHERE
    `deposit_start_date` > '1985 - 01 - 01'
GROUP BY `deposit_group` , `is_deposit_expired`
ORDER BY `deposit_group` DESC , `is_deposit_expired` ASC;

# Problem Ex 12

SELECT 
    `department_id`, ROUND(MIN(`salary`),2) AS 'minimum_salary'
FROM
    `employees`
WHERE
    `department_id` IN (2 , 5, 7)
        AND `hire_date` > '2000-01-01'
GROUP BY `department_id`
ORDER BY `department_id` ASC;

# Problem Ex 13

CREATE TABLE `Highest_Paid_Employees` 
SELECT * FROM `employees`
WHERE `salary` > 30000;

DELETE FROM `Highest_Paid_Employees`
WHERE `manager_id` = 42;
UPDATE `Highest_Paid_Employees`
SET `salary` = `salary` + 5000
WHERE `department_id` = 1;

SELECT 
    `department_id`, AVG(`salary`) AS 'avg_salary'
FROM
    `Highest_Paid_Employees`
GROUP BY `department_id`
ORDER BY `department_id` ASC;

# Problem Ex 14

SELECT `department_id`, 
MAX(`salary`) AS 'max_salary'
 FROM `employees`
 GROUP BY `department_id` 
 HAVING NOT `max_salary` BETWEEN 30000 AND 70000
 ORDER BY `department_id` ASC;

# Problem Ex 15

SELECT COUNT(`salary`) AS 'count'
FROM `employees`
WHERE `manager_id` IS null;

# Problem Ex 16 

SELECT 
    e1.`department_id`,
    (SELECT DISTINCT
            `salary`
        FROM
            `employees` AS e2
        WHERE
            e2.`department_id` = e1.`department_id`
        ORDER BY `salary` DESC
        LIMIT 2 , 1) AS `third_highest_salary`
FROM
    `employees` AS e1
GROUP BY e1.`department_id`
HAVING `third_highest_salary` IS NOT NULL
ORDER BY e1.`department_id`;

# Problem Ex 17

SELECT 
    e1.`first_name`, e1.`last_name`, e1.`department_id`
FROM
    employees AS e1
        INNER JOIN
    (SELECT 
        AVG(salary) AS avg_sal, department_id
    FROM
        employees
    GROUP BY department_id) AS e2 ON e1.department_id = e2.department_id
        AND e1.salary > e2.avg_sal
ORDER BY department_id , employee_id
LIMIT 10;

# Problem Ex 18

SELECT 
    `department_id`, SUM(salary) AS 'total_salary'
FROM
    employees
GROUP BY department_id
ORDER BY department_id;


