SELECT * FROM sales

-- Find stores who's sales where better than the average sales across all stores
SELECT *
FROM (SELECT store_name, SUM(price) AS total_sales
        FROM sales
        GROUP BY store_name) sales
JOIN (SELECT AVG(total_sales) AS sales
        FROM (SELECT store_name, SUM(price) AS total_sales
                FROM sales
                GROUP BY store_name) X) avg_sales
        ON sales.total_sales > avg_sales.sales;
        
        
-- Modified query using WITH clause
WITH sales AS (SELECT store_name, SUM(price) AS total_sales
                FROM sales
                GROUP BY store_name)
SELECT *
FROM sales
JOIN (SELECT AVG(total_sales) AS sales FROM sales) avg_sales
ON sales.total_sales > avg_sales.sales;