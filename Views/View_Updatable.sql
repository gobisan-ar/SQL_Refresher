-- Automatically Updatable Views
UPDATE expensive_products
SET prod_name = 'Airpods Pro', brand = 'Apple'
WHERE prod_id = 'P10'

SELECT * FROM expensive_products;
SELECT * FROM tb_product_info


-- Non Updatable Views

-- Multiple underlying tables/ views : Not automatically updatable
UPDATE order_summary
SET cost = 10
WHERE ord_id = 1;


-- DISTINCT Clause : Not automatically updatable
CREATE OR REPLACE VIEW expensive_products
AS
SELECT DISTINCT * FROM tb_product_info
WHERE price > 1000;

SELECT * FROM expensive_products;

UPDATE expensive_products
SET prod_name = 'AirTag', brand = 'Apple'
WHERE prod_id = 'P10';


-- GROUP BY Clause : Not automatically updatable
CREATE VIEW order_count
AS
SELECT date, COUNT(1) AS no_of_orders
FROM tb_order_details
GROUP BY date;

SELECT * FROM order_count;

UPDATE order_count
SET no_of_orders = 0
WHERE date = '2020-06-01';


-- WITH Clause : Not automatically updatable

-- Window functions : Not automatically updatable