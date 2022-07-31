SELECT * FROM products;
SELECT * FROM sales;

-- For every given product and the quantitiy,
-- check if product is available based on the required quantity
-- If available then modify database tables accordingly

CREATE OR REPLACE PROCEDURE pr_product_sales(IN p_product_name varchar, IN p_quantity int)
LANGUAGE plpgsql
AS $$
DECLARE
    v_product_code varchar(20);
    v_price float;
    v_cnt int;
BEGIN
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
        VALUES(CURRENT_DATE, v_product_code, p_quantity, (v_price * p_quantity));

        UPDATE products
        SET quantity_remaining = (quantity_remaining - p_quantity)
            , quantity_sold = (quantity_sold + p_quantity)
        WHERE product_code = v_product_code;

        RAISE NOTICE 'Product Sold!';
    ELSE
        RAISE NOTICE 'Insuffecient Quantity!';
    END IF;
END;
$$


CALL pr_product_sales('iPad Air', 1);