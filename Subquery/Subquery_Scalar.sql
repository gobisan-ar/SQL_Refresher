SELECT * FROM employee;
SELECT * FROM department;

-- Scalar Subquery

-- Find employee's who's salary is more than the average salary earned by all employees

-- M1
SELECT *
FROM employee
WHERE salary > (SELECT AVG(salary) -- scalar Subquery
                FROM employee); 
 
               
-- M2
SELECT emp.*
FROM employee emp
JOIN (SELECT AVG(salary) AS avg_sal  -- scalar Subquery
      FROM employee) AS asal
ON  emp.salary > asal.avg_sal;
