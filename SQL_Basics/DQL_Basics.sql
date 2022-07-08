-- Bascis

SELECT * FROM students;
SELECT id, first_name FROM students;
SELECT staff_type FROM staff;
SELECT DISTINCT staff_type FROM staff;
SELECT staff_type FROM staff LIMIT 5;

-- Operators

-- Comparison Operators: =, <>, !=, >, <, >=, <=
SELECT * FROM subjects WHERE subject_name = 'Mathematics';
SELECT * FROM subjects WHERE subject_name <> 'Mathematics';
SELECT * FROM staff_salary WHERE salary <= 10000 ORDER BY salary DESC;

-- Logical Operators: AND, OR, NOT, IN, BETWEEN, LIKE etc.
SELECT * FROM staff_salary WHERE salary BETWEEN 5000 AND 10000 ORDER BY salary; -- 5000 <= sal <= 10000

SELECT * FROM subjects WHERE subject_name IN ('Mathematics', 'Science', 'Arts');
SELECT * FROM subjects WHERE subject_name NOT IN ('Mathematics', 'Science', 'Arts');

SELECT * FROM subjects WHERE subject_name LIKE 'S%';
SELECT * FROM subjects WHERE subject_name LIKE '%c';

SELECT * FROM staff WHERE age > 50 AND gender = 'F';
SELECT * FROM staff WHERE age > 50 OR gender = 'F';

-- Arithmetic Operators: +, -, *, /, %
SELECT (5+2) as total; -- FROM dual => MySQL, Oracle


-- CASE WHEN Statement (if..else)
SELECT staff_id, salary
, CASE WHEN salary >= 10000 THEN 'High'
       WHEN salary BETWEEN 5000 AND 10000 THEN 'Average'
       WHEN salary < 5000 THEN 'Low'
  END AS RANGE
FROM staff_salary
ORDER BY 2 DESC;
