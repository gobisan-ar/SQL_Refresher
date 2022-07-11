-- Correlated Subquery
-- A subquery which is related to the outer query
-- For each record in outer table subquery will be processed

-- Find the employees in each department who earn more than the average salary in that department
SELECT * 
FROM employee e1
WHERE e1.salary > (SELECT AVG(salary)
                    FROM employee e2
                    WHERE e2.dept_name = e1.dept_name);
                    
                    
-- Find derpatments who do not have any employees
SELECT *
FROM department d
WHERE NOT EXISTS (SELECT 1 
                  FROM employee e
                  WHERE e.dept_name = d.dept_name);
