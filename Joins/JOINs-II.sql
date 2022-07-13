SELECT * FROM employee;
SELECT * FROM manager;
SELECT * FROM department;
SELECT * FROM projects;
SELECT * FROM company;
SELECT * FROM family;

-- FULL OUTER Join/ FULL JOIN
-- 4 + 2 + 2 = 8
SELECT e.emp_name, d.dept_name
FROM employee e
FULL JOIN department d on d.dept_id = e.dept_id;


-- CROSS JOIN
-- 6 x 4 = 24
SELECT e.emp_name, d.dept_name
FROM employee e
CROSS JOIN department d;


-- Write a query to fetch the employee name and their corrresponding department name.
-- Also make sure to display the company name and the company location corresponding to each employee.
SELECT e.emp_name, d.dept_name, c.company_name, c.location 
FROM employee e
JOIN department d ON d.dept_id = e.dept_id
CROSS JOIN company c;



-- NATURAL JOIN
SELECT e.emp_name, d.dept_name
FROM employee e
NATURAL JOIN department d;

ALTER TABLE department RENAME COLUMN dept_id TO id;
-- ALTER TABLE department RENAME COLUMN id TO dept_id;


-- SELF JOIN
SELECT child.name as child_name
, child.age as child_age
, parent.name as parent_name
, parent.age as parent_age
FROM family as child
JOIN family as parent
-- LEFT JOIN family as parent
-- RIGHT JOIN family as parent
ON child.parent_id = parent.member_id;