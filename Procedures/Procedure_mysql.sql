SELECT * FROM products;
SELECT * FROM sales;

-- For every given product and the quantitiy,
-- check if product is available based on the required quantity
-- If available then modify database tables accordingly

DELIMITER $$

DROP PROCEDURE IF EXISTS pr_product_sales(p_product_name varchar(20), p_quantity int);

CREATE PROCEDURE pr_product_sales()
BEGIN
    DECLARE v_product_code varchar(20);
    DECLARE v_price float;
    DECLARE v_cnt int;
    
    SELECT COUNT(1)
    INTO v_cnt
    FROM products
    WHERE product_name = p_product_name
    AND quantity_remaining >= p_quantity;
    
    IF v_cnt > 0 THEN
        SELECT product_code, price
        INTO v_product_code, v_price
        FROM products
        WHERE product_name = p_product_name;

        INSERT INTO sales(order_date, product_code, quantity_ordered, sale_price)
        VALUES(, v_product_code, p_quantity, (v_price * p_quantity));

        UPDATE products
        SET quantity_remaining = (quantity_remaining - p_quantity)
            , quantity_sold = (quantity_sold + p_quantity)
        WHERE product_code = v_product_code;

        SELECT 'Product Sold!';
    ELSE
        SELECT 'Insuffecient Quantity!';
    END IF;
END $$


CALL pr_product_sales('AirPods Pro', 5);