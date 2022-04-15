-- Returns non matching records
SELECT *
FROM EMPLOYEES E
         LEFT OUTER JOIN JOBS J ON E.JOB_ID = J.JOB_ID
WHERE E.JOB_ID IS NULL;
-- Returns non matching full outer
SELECT *
FROM EMPLOYEES E
FULL OUTER JOIN JOBS J ON E.JOB_ID = J.JOB_ID
WHERE E.JOB_ID IS NULL
   OR J.JOB_ID IS NULL;
-- Self join
SELECT E2.FIRST_NAME || ' ' || E2.LAST_NAME AS "Manager FullName"
FROM EMPLOYEES E
         JOIN EMPLOYEES E2 ON E.EMPLOYEE_ID = E2.EMPLOYEE_ID
GROUP BY E2.FIRST_NAME || ' ' || E2.LAST_NAME;

-- Set Operators: Union, Union All, Intersect, Minus
-- UNION EXCLUDES DUPLICATES
SELECT JOB_ID
FROM EMPLOYEES
UNION
SELECT JOB_ID
FROM JOBS;
-- UNION ALL DOES NOT EXCLUDE DUPLICATES
SELECT JOB_ID
FROM EMPLOYEES
UNION ALL
SELECT JOB_ID
FROM JOBS;
-- MINUS OPERATOR-RETURNS RWOS FROM 1ST QUERY THAT ARE NOT MATCHING
SELECT JOB_ID
FROM EMPLOYEES
MINUS;
SELECT JOB_ID
FROM JOBS;
-- INTERSECT -SORTS AND REMOVES NON MATCHING-RETURNS MATCHING ONES
SELECT JOB_ID
FROM EMPLOYEES
INTERSECT;
SELECT JOB_ID
FROM JOBS;

-- Create view
CREATE VIEW EmployeeInformation AS
SELECT FIRST_NAME || ' ' || EMPLOYEES.LAST_NAME AS "FullName"
FROM EMPLOYEES;
SELECT *
FROM EmployeeInformation;

-- replace view
SELECT LAST_NAME || ' ' || FIRST_NAME AS FullName, LOWER(EMAIL || '@ggmail.com') AS Email
FROM EMPLOYEES;

CREATE OR REPLACE VIEW EmployeeInformation AS
SELECT LAST_NAME || ' ' || FIRST_NAME AS FullName, LOWER(EMAIL || '@ggmail.com') AS Email
FROM EMPLOYEES;

SELECT * FROM EmployeeInformation;

-- Drop view
DROP VIEW EmployeeInformation;
-- It is gonna show that view does not exist;
SELECT * FROM EmployeeInformation;

-- Create Table
CREATE TABLE address(
    address_id INTEGER PRIMARY KEY ,
    address varchar(50) NOT NULL ,
    phone INTEGER);
-- Insert data into table
INSERT INTO address (address_id,address,phone)VALUES (10,'Lee High Way',123456
);
INSERT INTO address (address_id,address,phone)VALUES (15,'Seminary Road',223456
                                                     );


-- Update data
UPDATE address SET phone=22311 WHERE phone=223456;
SELECT * FROM address;

DELETE FROM address WHERE phone=123456;

INSERT INTO address (address_id,address,phone)VALUES (10,'King St',223433 );

-- Commit
COMMIT WORK;
-- Alter work -- ADD COLUMNS
ALTER TABLE address ADD CITY VARCHAR(20);

-- RENAME COLUMNS
ALTER TABLE address RENAME COLUMN CITY TO COUNTRY;

-- UPDATE Columns
UPDATE address SET COUNTRY='UNITED STATES' WHERE phone=22311;

UPDATE address SET COUNTRY='CANADA' WHERE ADDRESS='King St';

-- Drop column
ALTER TABLE address DROP COLUMN PHONE;

-- Rename Table
ALTER TABLE address RENAME TO addresses;


COMMit;

-- DROP TABLE
DROP TABLE addresses;
SELECT * FROM address;

-- Truncate table--means clear table but do not delete.
TRUNCATE TABLE address;



