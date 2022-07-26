-- Alternate way of writing SQL query using Window function
SELECT *
, FIRST_VALUE(product_name) OVER w AS most_exp_prod
, LAST_VALUE(product_name) OVER w AS least_exp_prod
FROM product
WINDOW w AS (PARTITION BY product_category ORDER BY price DESC
            RANGE BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING);


-- NTH_VALUE
-- Write query to display the second most expensive product unser each category
SELECT *
, FIRST_VALUE(product_name) OVER w AS most_exp_product
, LAST_VALUE(product_name) OVER w AS least_exp_product
, NTH_VALUE(product_name, 2) OVER w AS second_most_exp_product
FROM product
WINDOW w AS (PARTITION BY product_category ORDER BY price DESC
            RANGE BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING);
            

-- NTILE
-- Write a query to segregate all the expensive phones, mid range phones and cheaper phones.
SELECT *,
CASE WHEN bkt.buckets = 1 THEN 'Expensive'
     WHEN bkt.buckets = 2 THEN 'Mid-range'
     WHEN bkt.buckets = 3 THEN 'Cheaper'
END AS price_lbl
FROM (SELECT *
    , NTILE(3) OVER(ORDER BY price) AS buckets
    FROM product
    WHERE product_category = 'Phone') bkt;
    
    
-- CUME_DIST

-- Query to fetch all products which are constituting the first 30% 
-- of the data in products table based on price.
SELECT *, (cd_percent||'%') AS cd_percent
FROM (
SELECT *
, CUME_DIST() OVER (ORDER BY price DESC) AS cume_distribution
, ROUND(CUME_DIST() OVER (ORDER BY price DESC):: numeric * 100, 2) AS cd_percent
FROM product) cd
WHERE cd.cd_percent <= 30;


-- PERCENT_RANK

-- Query to identify how much percentage more expensive is 'Galaxy Z Fold 3' when compared to all products
SELECT product_name, pcnt_rank_pgt
FROM (
    SELECT *
    , PERCENT_RANK() OVER(ORDER BY price) AS pcnt_rank
    , ROUND(PERCENT_RANK() OVER(ORDER BY price):: numeric * 100, 2) as pcnt_rank_pgt
    FROM product) prk
WHERE prk.product_name = 'Galaxy Z Fold 3';