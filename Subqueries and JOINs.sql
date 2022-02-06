
# Problem 1

SELECT 
    e.employee_id,
    CONCAT_WS(' ', e.first_name, e.last_name) AS 'full_name',
    d.department_id,
    d.name
FROM
    `employees` AS e
        JOIN
    `departments` AS d ON e.employee_id = d.manager_id
ORDER BY e.employee_id ASC
LIMIT 5;

# Problem 2
SELECT 
    t.town_id, t.name, a.address_text
FROM
    `towns` AS t
        JOIN
    `addresses` AS a ON t.town_id = a.town_id
WHERE
    a.town_id IN (9 , 15, 32)
ORDER BY a.town_id , address_text;

# Problem 3

SELECT 
    e.employee_id,
    e.first_name,
    e.last_name,
    e.department_id,
    e.salary
FROM
    employees AS e
WHERE
    e.manager_id IS NULL;
    
    
    
    # Problem 4

SELECT 
    COUNT(salary) AS count
FROM
    employees AS e
WHERE
    e.salary > (SELECT 
            AVG(salary)
        FROM
            employees);
            
-- ----------------------------------------------------------

# Problem Ex 1

SELECT 
    e.employee_id, e.job_title, a.address_id, a.address_text
FROM
    employees AS e
        JOIN
    addresses AS a ON e.address_id = a.address_id
ORDER BY a.address_id ASC
LIMIT 5;

# Problem Ex 2

SELECT e.first_name, e.last_name, t.name AS town, a.address_text FROM employees AS e
JOIN addresses AS a ON e.address_id = a.address_id
JOIN towns AS t ON t.town_id = a.town_id
ORDER BY e.first_name ASC, e.last_name ASC
LIMIT 5;

# Problem Ex 3

SELECT e.employee_id,e.first_name,e.last_name,d.name AS department_name FROM employees AS e
LEFT JOIN departments AS d USING (department_id)
WHERE d.department_id = 3
ORDER BY e.employee_id DESC;


# Problem Ex 4

SELECT e.employee_id,e.first_name,e.salary,d.name FROM employees AS e
JOIN departments AS d ON e.department_id = d.department_id
WHERE e.salary > 15000
ORDER BY e.department_id DESC, e.salary DESC
LIMIT 5;

# Problem Ex 5

SELECT   e.`employee_id`, e.`first_name` FROM employees AS e 

LEFT JOIN employees_projects as ep USING (`employee_id`)
WHERE ep.project_id IS NULL 
ORDER BY e.employee_id DESC
LIMIT 3;

# Problem Ex 6

SELECT 
    e.first_name,
    e.last_name,
    e.hire_date,
    d.name AS department_name
FROM
    employees AS e
        LEFT JOIN
    departments AS d USING (department_id)
WHERE
    (e.hire_date > '1999-1-1')
        AND (d.name IN ('Sales' , 'Finance'))
ORDER BY e.hire_date ASC
;

# Problem Ex 7

SELECT 
    e.`employee_id`, e.`first_name`, p.name AS project_name
FROM
    employees AS e
        LEFT JOIN
    employees_projects AS ep USING (`employee_id`)
        JOIN
    projects AS p USING (`project_id`)
WHERE
    (DATE(p.start_date) > '2002-08-13'
        AND p.end_date IS NULL)
ORDER BY e.first_name ASC , p.name ASC
LIMIT 5;

# Problem Ex 8

SELECT 
    e.employee_id,
    e.first_name,
    IF(YEAR(p.start_date) >= 2005,
        NULL,
        p.name) AS project_name
FROM
    employees AS e
        JOIN
    employees_projects AS ep USING (`employee_id`)
        JOIN
    projects AS p USING (`project_id`)
WHERE
    e.employee_id = 24
ORDER BY project_name
;

# Problem Ex 9

SELECT e.employee_id, e.first_name, e.manager_id, e2.first_name  FROM employees AS e
JOIN employees AS e2 ON e2.employee_id = e.manager_id
WHERE e.manager_id IN (3,7)
ORDER BY e.first_name ASC;


# Problem Ex 10

SELECT e.employee_id, 
concat_ws(' ',e.first_name,e.last_name) AS employee_name,
concat_ws(' ',m.first_name,m.last_name) AS manager_name, 
d.name  
FROM employees AS e 
JOIN employees AS m ON m.employee_id = e.manager_id
JOIN departments AS d ON e.department_id = d.department_id
ORDER BY e.employee_id
LIMIT 5;

# Problem Ex 11 

SELECT 
    AVG(`salary`) AS `min_avg_salary`
FROM
    `employees`
GROUP BY `department_id`
ORDER BY `min_avg_salary`
LIMIT 1;

# Problem Ex 12

SELECT 
    c.country_code, m.mountain_range, p.peak_name, p.elevation
FROM
    countries AS c
        JOIN
    mountains_countries AS mc USING (country_code)
        JOIN
    mountains AS m ON mc.mountain_id = m.id
        JOIN
    peaks AS p ON p.mountain_id = m.id
WHERE
    p.elevation > 2835
        AND c.country_code = 'BG'
ORDER BY p.elevation DESC;

# Problem Ex 13

SELECT 
    c.country_code, COUNT(mountain_range)
FROM
    countries AS c
        JOIN
    mountains_countries AS mc USING (country_code)
        JOIN
    mountains AS m ON mc.mountain_id = m.id
WHERE
    c.country_code IN ('RU' , 'BG', 'US')
GROUP BY c.country_code;

SELECT 
    c.country_code, COUNT(mountain_range) AS `mountain_range`
FROM
    countries AS c
        JOIN
    mountains_countries AS mc USING (country_code)
        JOIN
    mountains AS m ON mc.mountain_id = m.id
WHERE
    c.country_code IN ('RU' , 'BG', 'US')
GROUP BY c.country_code
ORDER BY `mountain_range` DESC;

# Problem Ex 14

SELECT 
    c.country_name,
    IF(c.country_code IN (cr.country_code),
        r.river_name,
        NULL) AS river_name
FROM
    countries AS c
       LEFT JOIN
    countries_rivers AS cr USING (country_code)
      LEFT  JOIN
    rivers AS r ON cr.river_id = r.id
WHERE
    c.continent_code = 'AF'
ORDER BY c.country_name ASC
LIMIT 5;


# Problem Ex 15 

SELECT 
    c.continent_code,
    c.currency_code,
    COUNT(c.currency_code) AS currency_usage
FROM
    countries AS c
GROUP BY c.continent_code , c.currency_code
HAVING currency_usage > 1
    AND currency_usage = (SELECT 
        COUNT(*) AS most_used_curr
    FROM
        countries AS c2
    WHERE
        c2.continent_code = c.continent_code
    GROUP BY c2.currency_code
    ORDER BY most_used_curr DESC
    LIMIT 1)
ORDER BY c.continent_code , c.currency_code
;

# Problem Ex 16

SELECT 
    COUNT(*) AS country_count
FROM
    countries AS c
        LEFT JOIN
    mountains_countries AS mc ON c.country_code = mc.country_code
    WHERE
    mc.`mountain_id` IS NULL;
    ;
    
    # Problem Ex 17
    
    SELECT 
    c.country_name, MAX(p.elevation) AS highest_peak_elevation , MAX(r.length) AS longest_river_length
FROM
    countries AS c
         JOIN
    mountains_countries AS mc ON c.country_code = mc.country_code
         JOIN
    countries_rivers AS cr ON c.country_code = cr.country_code
        JOIN
    peaks AS p ON mc.mountain_id = p.mountain_id
        JOIN
    rivers AS r ON r.id = cr.river_id
GROUP BY c.country_name
ORDER BY p.elevation DESC , r.length DESC , c.country_name ASC
LIMIT 5;
    


    
    
 




