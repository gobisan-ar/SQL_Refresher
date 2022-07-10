CREATE TABLE IF NOT EXISTS random_tab (id int, val decimal);

INSERT INTO random_tab 
SELECT 1, random() FROM generate_series(1, 10000000);

INSERT INTO random_tab 
SELECT 2, random() FROM generate_series(1, 10000000);

SELECT COUNT(1) FROM random_tab;
