SELECT * FROM employee;


-- Fetch employees who earn more than average salary of all employees
WITH avarage_salary (avg_sal) AS
        (SELECT CAST(AVG(salary) AS INT) FROM employee)
SELECT e.emp_id, e.emp_name, e.salary, av.avg_sal
FROM employee e, avarage_salary av
WHERE e.salary > av.avg_sal;