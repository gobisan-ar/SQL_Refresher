-- Insert Record
INSERT INTO address VALUES
    ('ADR1001','44940 Bluestem Circle','Baton Rouge','Louisiana','United States'),
    ('ADR1002','029 Kropf Point','Richmond','Virginia','United States'),
    ('ADR1003','96 Jay Road','Dallas','Texas','United States'),
    ('ADR1004','15 Harbort Lane','Roanoke','Virginia','United States'),
    ('ADR1005','3 Vermont Plaza','Atlanta','Georgia','United States');
    
INSERT INTO school (school_id, school_name, education_board, address_id)
VALUES ('SCHL1001',  'NOBLE SCHOOL',  'CBSE',  'ADR1001');

INSERT INTO staff (staff_id, staff_type, school_id, first_name, last_name, 
                   age, dob, gender, jin_date, address_id) 
VALUES ('STF2004', 'Non-Teaching', 'SCHL1001', 'Shamala', 'Devi', '56', 
        TO_DATE('03/09/1964', 'DD/MM/YYYY'), 'F', TO_DATE('05/06/2015', 'DD/MM/YYYY'), 'ADR1002');


-- Update Record
UPDATE address
SET country = 'Malaysia'
WHERE address_id = 'ADR1003';

UPDATE address
SET country = 'India', city='Bangalore'
WHERE address_id = 'ADR1005';

-- Delete Record
DELETE FROM address WHERE countRY = 'Malaysia'
DELETE FROM school;
DELETE FROM addresss;

SELECT * FROM address;