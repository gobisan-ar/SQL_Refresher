-- INNER JOIN

-- Fetch all the class name where Music is taught as a subject
SELECT class_name
FROM classes cls
JOIN subjects sub ON sub.subject_id = cls.subject_id
WHERE sub.subject_name = 'Music';

-- Fetch the full name of all staff who teach mathematics
SELECT DISTINCT (stf.first_name || ' ' || stf.last_name) AS full_name
FROM staff stf
JOIN classes cls ON cls.teacher_id = stf.staff_id
JOIN subjects sub ON sub.subject_id = cls.subject_id
WHERE sub.subject_name = 'Mathematics';

-- Fetch all staff who teach grade 8, 9, 10 and also fetch all the non-taching staff
SELECT stf.staff_type
, (stf.first_name || ' ' || stf.last_name) as full_name
, stf.age
, (CASE WHEN stf.gender = 'M' THEN 'Male'
        WHEN stf.gender = 'F' THEN 'Female'
  END) AS gender
FROM staff stf
JOIN classes cls ON stf.staff_id = cls.teacher_id
WHERE stf.staff_type = 'Teaching'
AND cls.class_name IN ('Grade 8', 'Grade 9', 'Grade 10')
UNION -- removes duplicates
-- UNION ALL -- does not remove duplicates
SELECT staff_type
, (first_name || ' ' || last_name) as full_name
, age
, (CASE WHEN gender = 'M' THEN 'Male'
        WHEN gender = 'F' THEN 'Female'
  END) AS gender
FROM staff 
WHERE staff_type = 'Non-Teaching';