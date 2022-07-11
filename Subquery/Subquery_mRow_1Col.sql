-- Single column, multiple row subquery

-- Find department who do not have any employees

-- M1
SELECT * 
FROM department
WHERE dept_name NOT IN (SELECT DISTINCT dept_name
                        FROM employee);

-- M2
SELECT dept.* 
FROM department dept
LEFT JOIN (SELECT DISTINCT dept_name FROM employee) AS edep
ON dept.dept_name = edep.dept_name
WHERE edep.dept_name IS NULL;
                   