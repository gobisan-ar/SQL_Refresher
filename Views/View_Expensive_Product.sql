-- View does not automatically captures 
-- changes in the original table structure (column name, data type)

CREATE OR REPLACE VIEW expensive_products
AS
SELECT * FROM tb_product_info
WHERE price > 1000;

SELECT * FROM expensive_products;
SELECT * FROM tb_product_info;

ALTER TABLE tb_product_info ADD COLUMN prod_config VARCHAR(100);

INSERT INTO tb_product_info
VALUES('P10', 'Test', 'Test', 1200, null);