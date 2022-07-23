SELECT * FROM employee;
SELECT * FROM sales;

-- Fetch employees who earn more than average salary of all employees
WITH avarage_salary (avg_sal) AS
        (SELECT CAST(AVG(salary) AS INT) FROM employee)
SELECT e.emp_id, e.emp_name, e.salary, av.avg_sal
FROM employee e, avarage_salary av
WHERE e.salary > av.avg_sal;


-- Find stores who's sales were better than the average sales across all stores
WITH tot_sales (store_id, tot_store_sales) AS
        (SELECT store_id, SUM(price)
         FROM sales
         GROUP BY store_id),
     avg_sales (avg_store_sales) AS
        (SELECT CAST(AVG(tot_store_sales) AS INT) FROM tot_sales)
SELECT *
FROM tot_sales ts
JOIN avg_sales av
ON ts.tot_store_sales > av.avg_store_sales;
