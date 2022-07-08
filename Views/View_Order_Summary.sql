select * from tb_customer_data;
select * from tb_product_info;
select * from tb_order_details;

-- Fetch the order summary (to be given to client/ vendor)
CREATE OR REPLACE VIEW order_summary
AS
SELECT o.ord_id, o.date, p.prod_name, c.cust_name,
    ((p.price * o.quantity) * (100 - o.disc_percent)::float/100) as cost
FROM tb_customer_data c
JOIN tb_order_details o on o.cust_id = c.cust_id
JOIN tb_product_info p on p.prod_id = o.prod_id


SELECT * from order_summary;


-- Create user/ role
-- Read access
CREATE ROLE vendor -- username
login -- user role
PASSWORD 'vendor';

GRANT SELECT ON order_summary TO vendor;


-- Modify View
ALTER VIEW order_summary RENAME COLUMN date to order_date;
ALTER VIEW order_summary RENAME TO order_summary_2;

SELECT * from order_summary;
SELECT * from order_summary_2;


-- Drop View
DROP VIEW order_summary_2;