-- Query complete 03 sec 200 msec
SELECT id, avg(val), count(*)
FROM random_tab
GROUP BY id;


-- Create materialized view
CREATE MATERIALIZED VIEW mv_random_tab
AS
SELECT id, avg(val), count(*)
FROM random_tab
GROUP BY id;

-- Create view
CREATE VIEW vw_random_tab
AS
SELECT id, avg(val), count(*)
FROM random_tab
GROUP BY id;

-- Query complete 96 msec
SELECT * FROM mv_random_tab;

-- Query complete 03 sec 200 msec
SELECT * FROM vw_random_tab;

DELETE FROM random_tab WHERE id = 1;

-- Refresh materilized view
REFRESH MATERIALIZED VIEW mv_random_tab;