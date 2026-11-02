-- EXPERIMENT 2: DML and basic data retrieval
-- Run after 01_schema_ddl_constraints.sql

INSERT INTO students (student_id, student_name, email, phone, branch, cgpa, graduation_year, city)
VALUES (101, 'Aarav Sharma', 'aarav@example.com', '9000000101', 'CSE', 8.60, 2027, 'Jaipur');

INSERT INTO students VALUES (102, 'Meera Kapoor', 'meera@example.com', '9000000102', 'IT', 9.10, 2027, 'Delhi', NULL);

INSERT INTO students (student_id, student_name, email, phone, branch, cgpa, graduation_year, city)
VALUES (103, 'Kabir Singh', 'kabir@example.com', '9000000103', 'CSE', 7.40, 2027, 'Jaipur');

INSERT INTO students (student_id, student_name, email, phone, branch, cgpa, graduation_year, city)
VALUES (104, 'Isha Verma', 'isha@example.com', '9000000104', 'ECE', 8.20, 2027, 'Pune');

INSERT INTO students (student_id, student_name, email, phone, branch, cgpa, graduation_year, city)
VALUES (105, 'Rohan Mehta', 'rohan@example.com', '9000000105', 'CSE', 6.80, 2028, 'Mumbai');

INSERT INTO students (student_id, student_name, email, phone, branch, cgpa, graduation_year, city)
VALUES (106, 'Sara Khan', 'sara@example.com', '9000000106', 'IT', 9.30, 2027, 'Jaipur');

INSERT INTO companies VALUES (201, 'Infosys', 'IT Services', 'Pune', 'https://www.infosys.com');
INSERT INTO companies VALUES (202, 'TCS', 'IT Services', 'Mumbai', 'https://www.tcs.com');
INSERT INTO companies VALUES (203, 'Deloitte', 'Consulting', 'Jaipur', 'https://www.deloitte.com');
INSERT INTO companies VALUES (204, 'Razorpay', 'FinTech', 'Bengaluru', 'https://razorpay.com');

INSERT INTO jobs VALUES (301, 201, 'Systems Engineer', 'FULL-TIME', 6.50, 6.50, DATE '2027-02-28', 'Pune');
INSERT INTO jobs VALUES (302, 202, 'Data Analyst Intern', 'INTERNSHIP', 3.00, 7.00, DATE '2027-01-31', 'Mumbai');
INSERT INTO jobs VALUES (303, 203, 'Technology Analyst', 'FULL-TIME', 8.00, 7.50, DATE '2027-03-15', 'Jaipur');
INSERT INTO jobs VALUES (304, 204, 'Product Analytics Intern', 'INTERNSHIP', 5.00, 8.00, DATE '2027-02-15', 'Bengaluru');
INSERT INTO jobs VALUES (305, 201, 'Cloud Support Associate', 'FULL-TIME', 7.20, 6.80, DATE '2027-03-01', 'Pune');
INSERT INTO jobs VALUES (306, 204, 'Junior Data Engineer', 'FULL-TIME', 10.00, 8.50, DATE '2027-03-20', 'Bengaluru');

INSERT INTO applications (application_id, student_id, job_id, applied_on, application_status, interview_date)
VALUES (401, 101, 301, DATE '2026-10-01', 'SHORTLISTED', DATE '2026-11-10');

INSERT INTO applications (application_id, student_id, job_id, applied_on, application_status)
VALUES (402, 102, 303, DATE '2026-10-02', 'SELECTED');

INSERT INTO applications (application_id, student_id, job_id, applied_on, application_status, interview_date)
VALUES (403, 103, 302, DATE '2026-10-03', 'APPLIED', DATE '2026-11-15');

INSERT INTO applications (application_id, student_id, job_id, applied_on, application_status)
VALUES (404, 104, 304, DATE '2026-10-04', 'REJECTED');

INSERT INTO applications (application_id, student_id, job_id, applied_on, application_status)
VALUES (405, 105, 301, DATE '2026-10-05', 'APPLIED');

INSERT INTO applications (application_id, student_id, job_id, applied_on, application_status)
VALUES (406, 106, 306, DATE '2026-10-06', 'SHORTLISTED');

INSERT INTO applications (application_id, student_id, job_id, applied_on, application_status)
VALUES (407, 101, 305, DATE '2026-10-07', 'APPLIED');

INSERT INTO applications (application_id, student_id, job_id, applied_on, application_status)
VALUES (408, 103, 303, DATE '2026-10-08', 'WITHDRAWN');

COMMIT;

-- Basic SELECT examples.
SELECT * FROM students;
SELECT student_id, student_name, cgpa FROM students;
SELECT * FROM students WHERE branch = 'CSE';

-- UPDATE example.
UPDATE applications
SET application_status = 'SHORTLISTED'
WHERE application_id = 405;

-- DELETE selected row example. This row is a demonstration record.
INSERT INTO applications (application_id, student_id, job_id, application_status)
VALUES (499, 105, 305, 'APPLIED');

DELETE FROM applications WHERE application_id = 499;

COMMIT;

-- DELETE all rows example: structure remains, but do NOT run on project tables.
-- DELETE FROM table_name;

-- TRUNCATE example: DDL, removes every row and cannot be rolled back.
-- TRUNCATE TABLE table_name;

-- INSERT INTO ... SELECT example.
-- Creates a temporary copy table from a query result.
-- CREATE TABLE cse_student_copy AS
-- SELECT student_id, student_name, email FROM students WHERE branch = 'CSE';
-- INSERT INTO cse_student_copy (student_id, student_name, email)
-- SELECT student_id + 1000, student_name, email FROM students WHERE branch = 'CSE';
-- DROP TABLE cse_student_copy;
