SELECT * FROM employee;
SELECT * FROM department;
SELECT * FROM manager;
SELECT * FROM projects;


-- INNER JOIN / JOIN
-- Fetch the employee name and the department name they belong to.
SELECT e.emp_name, d.dept_name
FROM employee e
JOIN department d
ON e.dept_id = d.dept_id;


-- LEFT OUTER JOIN/ LEFT JOIN
-- Fetch ALL the employee name and their department name they belong to.
SELECT e.emp_name, d.dept_name
FROM employee e
LEFT JOIN department d
ON e.dept_id = d.dept_id;


-- RIGHT OUTER JOIN/ RIGHT JOIN
-- Fetch ALL the department name and name of the rmployess working on that depratment.
SELECT e.emp_name, d.dept_name
FROM employee e
RIGHT JOIN department d
ON e.dept_id = d.dept_id;



-- Q: Fetch details of ALL employees, their managers, their department and the projects they work on.
SELECT e.emp_name, m.manager_name, d.dept_name, p.project_name
FROM employee e
LEFT JOIN manager m ON e.manager_id = m.manager_id
LEFT JOIN department d ON e.dept_id = d.dept_id
LEFT JOIN projects p ON e.emp_id = p.team_member_id;