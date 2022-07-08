SELECT COUNT(1) FROM staff; --23
SELECT COUNT(1) FROM staff_salary; --24

-- JOIN/ INNER JOIN
-- 21 Records
SELECT COUNT(1)
FROM staff stf
JOIN staff_salary ss ON ss.staff_id = stf.staff_id
ORDER BY 1;

SELECT DISTINCT(stf.first_name || ' ' || stf.last_name) AS full_name, ss.salary
FROM staff stf
INNER JOIN staff_salary ss ON ss.staff_id = stf.staff_id
ORDER BY 2;



-- LEFT JOIN/ LEFT OUTER JOIN
-- 23 Records
SELECT COUNT(1)
FROM staff stf
LEFT JOIN staff_salary ss ON ss.staff_id = stf.staff_id
ORDER BY 1;

SELECT DISTINCT(stf.first_name || ' ' || stf.last_name) AS full_name, ss.salary
FROM staff stf
LEFT OUTER JOIN staff_salary ss ON ss.staff_id = stf.staff_id
ORDER BY 2;


-- RIGHT JOIN/ RIGHT OUTER JOIN
-- 24 Records
SELECT COUNT(1)
FROM staff stf
RIGHT JOIN staff_salary ss ON ss.staff_id = stf.staff_id
ORDER BY 1;

SELECT DISTINCT(stf.first_name || ' ' || stf.last_name) AS full_name, ss.salary
FROM staff stf
RIGHT OUTER JOIN staff_salary ss ON ss.staff_id = stf.staff_id
ORDER BY 2;


-- FULL OUTER JOIN 
-- 26 Records = 21 Matching Records + 2 LT Records + 3 RT Records 
SELECT COUNT(1)
FROM staff stf
FULL OUTER JOIN staff_salary ss ON ss.staff_id = stf.staff_id
ORDER BY 1;

SELECT DISTINCT(stf.first_name || ' ' || stf.last_name) AS full_name, ss.salary
FROM staff stf
FULL OUTER JOIN staff_salary ss ON ss.staff_id = stf.staff_id
ORDER BY 1,2;
