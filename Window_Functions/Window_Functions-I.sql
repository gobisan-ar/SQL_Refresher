SELECT * FROM employee;

SELECT dept_name, MAX(salary) AS max_salary 
FROM employee
GROUP BY dept_name;

-- Window Functions

--
-- OVER()
-- Treat MAX() as windwow function not aggregate function
SELECT e.*
, MAX(salary) OVER() AS max_salary
FROM employee e;

SELECT e.*
, MAX(salary) OVER(PARTITION BY dept_name) AS max_salary
FROM employee e;

--
-- ROW_NUMBER()
SELECT e.*
, ROW_NUMBER() OVER() AS rn
FROM employee e;

SELECT e.*
, ROW_NUMBER() OVER(PARTITION BY dept_name) AS rn
FROM employee e;


-- Fetch the first 2 employees from each department to join the company.
SELECT * 
FROM (
    SELECT e.*
    , ROW_NUMBER() OVER(PARTITION BY dept_name ORDER BY emp_id) AS rn
    FROM employee e) emp
WHERE emp.rn < 3;


-- RANK()

-- Fetch the top 3 employees in each department earning the max salary.
SELECT *
FROM(
    SELECT e.* 
    , RANK() OVER(PARTITION BY dept_name ORDER BY salary DESC) AS rnk
    FROM employee e) emp
WHERE emp.rnk < 4;


-- DENSE_RANK()
SELECT e.* 
    , RANK() OVER(PARTITION BY dept_name ORDER BY salary DESC) AS rnk
    , DENSE_RANK() OVER(PARTITION BY dept_name ORDER BY salary DESC) AS d_rnk
    , ROW_NUMBER() OVER(PARTITION BY dept_name ORDER BY salary DESC) AS rn
FROM employee e;


-- LAG()

SELECT e.*
, LAG(salary) OVER(PARTITION BY dept_name ORDER BY emp_id) AS prev_emp_salary
FROM employee e;

SELECT e.*
, LAG(salary, 2, 0) OVER(PARTITION BY dept_name ORDER BY emp_id) AS prev_emp_salary
FROM employee e;


-- LEAD()
SELECT e.*
, LAG(salary) OVER(PARTITION BY dept_name ORDER BY emp_id) AS prv_emp_salary
, LEAD(salary) OVER(PARTITION BY dept_name ORDER BY emp_id) AS nxt_emp_salary
FROM employee e;


-- Fetch a query to display if the salary of an employee is higher, lower or equal to the previous employee.
SELECT e.*,
CASE WHEN e.salary > LAG(salary) OVER(PARTITION BY dept_name ORDER BY emp_id) THEN 'Higher'
     WHEN e.salary = LAG(salary) OVER(PARTITION BY dept_name ORDER BY emp_id) THEN 'Equal'
     WHEN e.salary < LAG(salary) OVER(PARTITION BY dept_name ORDER BY emp_id) THEN 'Lesser'
END sal_range
FROM employee e;