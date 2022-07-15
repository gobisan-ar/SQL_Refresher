SELECT * FROM employee;
SELECT * FROM department;
SELECT * FROM manager;
SELECT * FROM projects;


-- INNER JOIN
-- Write a query to fetch the employee name and the depratment they belong to.

-- ANSI
SELECT e.emp_name, d.dept_name
FROM employee e
JOIN department d
ON e.dept_id = d.id;


-- Non ANSI
SELECT e.emp_name, d.dept_name
FROM employee e
,    department d
WHERE e.dept_id = d.id;


-- OUTER JOIN

-- LEFT OUTER JOIN
-- Write a query to fetch ALL the employee name and the depratment they belong to.

-- ANSI
SELECT e.emp_name, d.dept_name
FROM employee e
LEFT JOIN department d
ON e.dept_id = d.id;


-- Non ANSI
-- Oracle
SELECT e.emp_name, d.dept_name
FROM employee e
,    department d
WHERE e.dept_id = d.id(+);


-- Fetch details of ALL emp and ALL manager, their department and the projects they work on

-- ANSI
SELECT e.emp_name, m.manager_name, d.dept_name, p.project_name
FROM employee e
LEFT JOIN department d ON d.id = e.dept_id
RIGHT JOIN manager m ON m.manager_id = e.manager_id
LEFT JOIN projects p ON p.team_member_id = e.emp_id;

-- Non ANSI
-- Oracle
SELECT e.emp_name, m.manager_name, d.dept_name, p.project_name
FROM employee e
,    department d
,    manager m 
,    projects p
WHERE d.id(+) = e.dept_id
AND m.manager_id = e.manager_id(+)
AND p.team_member_id(+) = e.emp_id;


-- Fetch the employees from HR department

-- ANSI
SELECT e.emp_name, d.dept_name
FROM employee e
LEFT JOIN department d 
ON e.dept_id = d.id
WHERE d.dept_name = 'HR';

-- ANSI
SELECT e.emp_name, d.dept_name
FROM employee e
LEFT JOIN department d 
ON e.dept_id = d.id
AND d.dept_name = 'HR';

-- Non ANSI
SELECT e.emp_name, d.dept_name
FROM employee e
,    department d
WHERE e.dept_id = d.id
AND d.dept_name = 'HR';



-- Non ANSI
-- Accidental cross join between emp and mgr
SELECT e.emp_name, m.manager_name, d.dept_name, p.project_name
FROM employee e
,    department d
,    manager m 
,    projects p
WHERE d.id(+) = e.dept_id
-- AND m.manager_id = e.manager_id(+)
AND p.team_member_id(+) = e.emp_id;