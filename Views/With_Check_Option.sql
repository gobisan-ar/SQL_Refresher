-- WITH CHECK OPTION

CREATE OR REPLACE VIEW apple_products
AS
SELECT *
FROM tb_product_info
WHERE brand = 'Apple'
WITH CHECK OPTION;

SELECT * FROM apple_products;
SELECT * FROM tb_product_info;

INSERT INTO apple_products
VALUES('P20', 'Note 20', 'Samsung', 2500, null);

INSERT INTO apple_products
VALUES('P22', 'Apple Watch', 'Apple', 2500, null);