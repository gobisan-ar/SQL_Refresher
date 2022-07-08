-- Drop Tables
DROP TABLE IF EXISTS staff CASCADE;
DROP TABLE IF EXISTS school CASCADE;
DROP TABLE IF EXISTS address CASCADE;

-- Create Tables 
CREATE TABLE IF NOT EXISTS address
(
    address_id       VARCHAR(20) PRIMARY KEY
  , street           VARCHAR(250)
  , city             VARCHAR(100)
  , state            VARCHAR(100)
  , country          VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS school
(
    school_id         VARCHAR(20) PRIMARY KEY
  , school_name       VARCHAR(100) NOT NULL
  , education_board   VARCHAR(80)
  , address_id        VARCHAR(20)
  , CONSTRAINT FK_SCHOOL_ADDR FOREIGN KEY(address_id) REFERENCES address(address_id)
);

CREATE TABLE IF NOT EXISTS staff
(
    staff_id         VARCHAR(20)
  , staff_type       VARCHAR(30)
  , school_id        VARCHAR(20)
  , first_name       VARCHAR(100) NOT NULL
  , last_name        VARCHAR(100) NOT NULL
  , age              INT
  , dob              DATE
  , gender           VARCHAR(10) CHECK(GENDER IN ('M', 'F', 'Male', 'Female'))
  , join_date        DATE
  , address_id       VARCHAR(20)
  , CONSTRAINT PK_STAFF PRIMARY KEY(staff_id)
  , CONSTRAINT FK_STAFF_SCHL FOREIGN KEY(school_id) REFERENCES school(school_id)
  , CONSTRAINT FK_STAFF_ADDR FOREIGN KEY(address_id) REFERENCES address(address_id)
);


-- Alter Tables
ALTER TABLE staff DROP COLUMN join_date;
ALTER TABLE staff ALTER COLUMN age TYPE VARCHAR(5);
ALTER TABLE staff RENAME TO staff_new;
ALTER TABLE staff_new RENAME COLUMN last_name TO sur_name;
ALTER TABLE staff_new ADD CONSTRAINT UNQ_STF UNIQUE (staff_type);

SELECT * FROM staff;
SELECT * FROM staff_new;

