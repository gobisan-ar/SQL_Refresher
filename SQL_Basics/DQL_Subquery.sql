-- SUBQUERY: Query Written inside a query
-- Fetch the details of paents having more than 1 kids going to this school

SELECT (P.first_name || ' ' || P.last_name) AS parent_name
,   (S.first_name || ' ' || S.last_name) AS student_name
,   S.age AS student_age
,   S.gender  AS student_gender
,   (ADR.street || ', ' || ADR.city || ', ' || ADR.state || ', ' || ADR.country) AS address
FROM parents P
JOIN student_parent SP ON SP.parent_id = P.id
JOIN students S ON S.id = SP.student_id
JOIN address ADR ON ADR.address_id = P.address_id
WHERE P.id IN (SELECT parent_id
              FROM student_parent
              GROUP BY parent_id
              HAVING COUNT(1) > 1)
ORDER BY 1;