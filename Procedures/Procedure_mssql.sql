SELECT * FROM products;
SELECT * FROM sales;

-- For every given product and the quantitiy,
-- check if product is available based on the required quantity
-- If available then modify database tables accordingly

CREATE OR ALTER PROCEDURE pr_product_sales(@p_product_name varchar(20), @p_quantity int)
AS
    DECLARE @v_product_code varchar(20),
            @v_price float;
            @v_cnt int;
BEGIN
    SELECT @v_cnt = COUNT(1)
    FROM products
    WHERE product_name = @p_product_name
    AND quantity_remaining >= @p_quantity;

    IF @v_cnt > 0
    BEGIN
        SELECT @v_product_code = product_code, @v_price = price
        FROM products
        WHERE product_name = @p_product_name;

        INSERT INTO sales(order_date, product_code, quantity_ordered, sale_price)
        VALUES(CAST(GETDATE() AS DATE), @v_product_code,  @p_quantity, (@v_price *  @p_quantity));

        UPDATE products
        SET quantity_remaining = (quantity_remaining - @p_quantity)
            , quantity_sold = (quantity_sold + @p_quantity)
        WHERE product_code = @v_product_code;

        PRINT('Product Sold!');
    END
    ELSE
        RINT('Insuffecient Quantity!!');
END;


EXEC pr_product_sales 'AirPods Pro', 8;