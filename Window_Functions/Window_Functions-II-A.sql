SELECT * FROM product;

-- First Value

-- Write query to display the most expensive product under each category (coresponding to each record)
SELECT *
, FIRST_VALUE(product_name) OVER(PARTITION BY product_category ORDER BY price DESC) AS most_exp_prod
FROM product;


-- Last Value
-- Write query to display the least expenive product user each category (corresponding to record)
SELECT *
, LAST_VALUE(product_name) OVER(PARTITION BY product_category ORDER BY price DESC) AS most_exp_prod
FROM product;

SELECT *
, LAST_VALUE(product_name) 
    OVER(PARTITION BY product_category ORDER BY price DESC
        RANGE BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING -- Frame Clause
        ) AS least_exp_prod
FROM product;

-- ROWS vs RANGE
SELECT *
, LAST_VALUE(product_name) 
    OVER(PARTITION BY product_category ORDER BY price DESC
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW -- Frame Clause
        ) AS least_exp_prod_rows
, LAST_VALUE(product_name) 
    OVER(PARTITION BY product_category ORDER BY price DESC
        RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW -- Frame Clause
        ) AS least_exp_prod_range
FROM product
WHERE product_category='Phone';


---
---
SELECT *
, LAST_VALUE(product_name) 
    OVER(PARTITION BY product_category ORDER BY price DESC
        RANGE BETWEEN 2 PRECEDING AND 2 FOLLOWING -- Frame Clause
        ) AS least_exp_prod
FROM product;