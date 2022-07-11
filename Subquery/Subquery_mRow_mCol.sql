-- Multiple column, multiple row subquery

-- Find the employees who earn the highest salary in each department

-- M1
SELECT *
FROM employee 
WHERE (dept_name, salary) IN (SELECT dept_name, MAX(salary)
                             FROM employee
                             GROUP BY dept_name);

-- M2
SELECT emp.*
FROM employee emp
JOIN (SELECT dept_name, MAX(salary) AS max_sal -- multiple row, multiplle column subquery
      FROM employee 
      GROUP BY dept_name) AS msal
ON emp.dept_name = msal.dept_name AND emp.salary = msal.max_sal;
