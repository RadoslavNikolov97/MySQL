
# Problem 1 
SELECT 
    `title`
FROM
    books
WHERE
	substring(`title`,1,3) = 'The'
ORDER BY `id`;

# Problem 2

UPDATE `books`
SET `title` = replace(`title`,'The','***');
SELECT 
    `title`
FROM
    books
WHERE
	substring(`title`,1,3) = '***'
ORDER BY `id`;

# Problem 3
SELECT format(sum(`cost`),2)
FROM `books`;

# Problem 4

SELECT 
    CONCAT(`first_name`,
            ' ',
            `last_name`) AS `Full Name`,
    TIMESTAMPDIFF(DAY, `born`, `died`) AS 'Days Lived'
FROM
    authors;
    
 # Problem 5
	SELECT 
    `title`
FROM
    books
WHERE
    SUBSTRING(`title`, 1, 12) = 'Harry Potter'
ORDER BY `id`;

-- -------------------------------------------

# Problem Ex 1

SELECT `first_name`,`last_name` FROM `employees` 
WHERE substring(`first_name`,1,2) = 'Sa'
ORDER BY employee_id;

# Problem Ex 2 
SELECT `first_name`,`last_name` FROM `employees`
WHERE locate('ei',`last_name`);

# Problem Ex 3 

SELECT `first_name` FROM `employees`
WHERE (`department_id` IN (3 , 10)) AND (year(`hire_date`) BETWEEN 1995 AND 2005)
ORDER BY employee_id;

# Problem Ex 4

SELECT 
    `first_name`, `last_name`
FROM
    employees
WHERE 
    `job_title` NOT LIKE '%engineer%'
ORDER BY employee_id;

# Problem Ex 5

SELECT `name` FROM `towns` 
WHERE char_length(`name`) IN (5,6)
ORDER BY `name`;

# Problem Ex 6

SELECT `town_id`,`name` FROM `towns` 
WHERE substring(`name`,1,1) IN('M' , 'K' , 'B' , 'E')
ORDER BY `name` ASC;

# Problem Ex 7

SELECT `town_id`,`name` FROM `towns` 
WHERE NOT substring(`name`,1,1) IN('R','B','D')
ORDER BY `name` ASC;


# Problem Ex 8 

CREATE VIEW `v_employees_hired_after_2000` AS
    SELECT 
        `first_name`, `last_name`
    FROM
        employees
    WHERE
        YEAR(hire_date) > 2000;
        
 # Problem Ex 9 
 
 SELECT `first_name`,`last_name` FROM `employees`
 WHERE char_length(`last_name`) = 5;
 
 # Problem Ex 10
 
 SELECT `country_name`,`iso_code` FROM `countries`
 WHERE `country_name` REGEXP  '(.*a.*){3,}'
 ORDER BY `iso_code`;
 
 # Problem Ex 11
 
 
 SELECT p.peak_name, r.river_name, 
    LOWER(CONCAT(p.peak_name, SUBSTRING(r.river_name, 2))) AS 'mix'
FROM `peaks` AS p
JOIN `rivers` AS r
ON RIGHT(p.peak_name, 1) = LEFT(r.river_name, 1)
ORDER BY `mix`;

# Problem Ex 12

SELECT 
    `name`,  DATE_FORMAT(`start`, '%Y-%m-%d') AS 'start'
FROM
    `games`
WHERE
    YEAR(`start`) IN (2011 , 2012)
ORDER BY `start` , `name`
LIMIT 50;


# Problem Ex 13 

SELECT `user_name`, substr(`email`,locate('@' , `email`) + 1) AS `email_provider` 
FROM `users` 
ORDER By `email_provider`,`user_name`;

# Problem Ex 14 

SELECT `user_name`, `ip_address` FROM `users`
WHERE `ip_address` LIKE '___.1%.%.___'
ORDER BY `user_name`;

# Problem Ex 15

SELECT 
    `name` AS `game`,
    (CASE
        WHEN HOUR(`start`) BETWEEN 0 AND 11 THEN 'Morning'
        WHEN HOUR(`start`) BETWEEN 12 AND 17 THEN 'Afternoon'
        ELSE 'Evening'
    END) AS 'Part of the Day',
    (CASE
        WHEN `duration` BETWEEN 0 AND 3 THEN 'Extra Short'
        WHEN `duration` BETWEEN 3 AND 6 THEN 'Short'
        WHEN `duration` BETWEEN 6 AND 10 THEN 'Long'
        ELSE 'Extra Long'
    END) AS 'Duration'
FROM
    `games`
;

# Problem Ex 16

SELECT 
    `product_name`,
    `order_date`,
    TIMESTAMPADD(DAY, 3, `order_date`) AS `pay_due`,
    TIMESTAMPADD(MONTH, 1, `order_date`) AS `deliver_due`
FROM
    `orders`;