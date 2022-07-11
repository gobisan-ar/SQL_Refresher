-- Using subquery in SELECT clause.
-- Not optimal
-- Move it into JOIN

-- Fetch all employee details and add remarks to those employees who earn more than the avaerage pay
SELECT * 
, (CASE WHEN salary > (SELECT AVG(salary) FROM employee) THEN 'Higher than average'
   ELSE 'Lesser than average'
   END) AS remarks
FROM employee; 


-- Optimal
SELECT * 
, (CASE WHEN salary > avg_sal.sal THEN 'Higher than average'
   ELSE 'Lesser than average'
   END) AS remarks
FROM employee
CROSS JOIN (SELECT AVG(salary) sal FROM employee) avg_sal; 



-- Using subquery in HAVING clause.

-- Find the stores who have sold more units than the average units sold by all stores.
SELECT store_name, SUM(quantity)
FROM sales
GROUP BY store_name
HAVING SUM(quantity) > (SELECT AVG(quantity) FROM sales);