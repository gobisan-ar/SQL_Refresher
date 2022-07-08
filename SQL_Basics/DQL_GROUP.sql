-- Count no of students in each class
SELECT class_id, COUNT(1) AS "no_of_students"
FROM student_classes
GROUP BY class_id
ORDER BY class_id;

-- More than 100 students in each class
SELECT class_id, COUNT(1) AS "no_of_students"
FROM student_classes
GROUP BY class_id
HAVING COUNT(1) > 100
ORDER BY class_id;

-- Parents with more than one kid in school
SELECT parent_id, COUNT(1) AS "no_of_kids"
FROM student_parent
GROUP BY parent_id
HAVING COUNT(1) > 1;