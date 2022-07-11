-- Subquery in INSERT statement

-- Insert data to employee history table.
-- Make sure not to insert duplicate records.
SELECT * FROM employee_history;

INSERT INTO employee_history
SELECT e.emp_id, e.emp_name, d.dept_name, e.salary, d.location
FROM employee e
JOIN department d ON d.dept_name = e.dept_name
WHERE NOT EXISTS (SELECT 1
                 FROM employee_history eh
                 WHERE eh.emp_id = e.emp_id);
                 
                 
-- Subquery in UPDATE statement

-- Give 10% increment to all employees in bangalore location 
-- based on the maximum salary earned by an emp in each dept.

-- Only consider employees in employee_history table

UPDATE employee e
SET salary = (SELECT MAX(salary) * 1.1
              FROM employee_history eh
              WHERE eh.dept_name = e.dept_name)
WHERE e.dept_name IN (SELECT dept_name 
                      FROM employee_history 
                      WHERE location = 'Bangalore')
AND e.emp_id IN (SELECT emp_id 
                 FROM employee_history);



-- Subquery in UPDATE statement

-- Delete all departments who do not have any employees
DELETE FROM department d
WHERE dept_name IN (SELECT dept_name
                    FROM department d
                    WHERE NOT EXISTS (SELECT 1 
                                      FROM employee e
                                      WHERE e.dept_name = d.dept_name)
                   );

