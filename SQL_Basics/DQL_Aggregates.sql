-- Aggregate Functions (AVG, MIN, MAX, SUM, COUNT)
-- Aggregate functions are used to perform calculations on a set of values.

-- AVG
SELECT AVG(SS.salary) AS avg_salary
FROM staff_salary SS
JOIN staff STF ON STF.staff_id = SS.staff_id
WHERE STF.staff_type = 'Non-Teaching';

-- SUM
SELECT STF.staff_type, SUM(SS.salary) AS sum_salary
FROM staff_salary SS
JOIN staff STF ON STF.staff_id = SS.staff_id
GROUP BY STF.staff_type;

-- MIN
SELECT STF.staff_type, MIN(SS.salary) AS min_salary
FROM staff_salary SS
JOIN staff STF ON STF.staff_id = SS.staff_id
GROUP BY STF.staff_type;

-- MIN
SELECT STF.staff_type, MAX(SS.salary) AS max_salary
FROM staff_salary SS
JOIN staff STF ON STF.staff_id = SS.staff_id
GROUP BY STF.staff_type;