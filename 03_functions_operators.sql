-- EXPERIMENT 3: FUNCTIONS
-- EXPERIMENT 4: OPERATORS

-- Number functions
SELECT student_name, ABS(cgpa - 8) AS distance_from_8 FROM students;
SELECT POWER(2, 3) AS power_value FROM dual;
SELECT MOD(17, 5) AS remainder FROM dual;
SELECT ROUND(8.567, 2) AS rounded_value FROM dual;
SELECT TRUNC(8.567, 1) AS truncated_value FROM dual;
SELECT SQRT(81) AS square_root FROM dual;

-- Aggregate functions
SELECT COUNT(*) AS total_students FROM students;
SELECT AVG(cgpa) AS average_cgpa, MIN(cgpa) AS lowest_cgpa, MAX(cgpa) AS highest_cgpa
FROM students;
SELECT SUM(package_lpa) AS total_package_sum FROM jobs;

-- Character functions
SELECT UPPER(student_name), LOWER(branch), INITCAP(city) FROM students;
SELECT student_name, LENGTH(student_name), SUBSTR(student_name, 1, 5) FROM students;
SELECT CONCAT(student_name, ' - CANDIDATE') AS label FROM students;
SELECT REPLACE(company_name, 'a', '@') AS modified_name FROM companies;
SELECT LPAD(student_id, 6, '0'), RPAD(branch, 8, '*') FROM students;
SELECT LTRIM('   ORACLE') AS left_trimmed, RTRIM('DBMS   ') AS right_trimmed FROM dual;
SELECT INSTR('CAMPUS PLACEMENT', 'PLACE') AS position_value FROM dual;

-- Conversion functions
SELECT TO_CHAR(SYSDATE, 'DD-MON-YYYY') AS today FROM dual;
SELECT TO_CHAR(125000, '999,999') AS formatted_number FROM dual;
SELECT TO_NUMBER('1234.50') AS converted_number FROM dual;
SELECT TO_DATE('15-DEC-2026', 'DD-MON-YYYY') AS converted_date FROM dual;

-- Date functions
SELECT SYSDATE FROM dual;
SELECT ADD_MONTHS(SYSDATE, 3) AS after_three_months FROM dual;
SELECT LAST_DAY(SYSDATE) AS month_end FROM dual;
SELECT MONTHS_BETWEEN(SYSDATE, DATE '2026-08-01') AS months_since_august FROM dual;
SELECT NEXT_DAY(SYSDATE, 'MONDAY') AS next_monday FROM dual;

-- Arithmetic operators
SELECT job_role, package_lpa, package_lpa * 100000 AS annual_package_rupees,
       package_lpa / 12 AS monthly_lpa_equivalent
FROM jobs;

-- Comparison and logical operators
SELECT * FROM students WHERE cgpa >= 8;
SELECT * FROM students WHERE branch = 'CSE' AND cgpa > 7;
SELECT * FROM students WHERE branch = 'CSE' OR branch = 'IT';
SELECT * FROM students WHERE NOT city = 'Jaipur';
SELECT * FROM jobs WHERE package_lpa <> 5;

-- Special operators
SELECT * FROM students WHERE cgpa BETWEEN 7 AND 9;
SELECT * FROM students WHERE branch IN ('CSE', 'IT');
SELECT * FROM students WHERE student_name LIKE 'S%';
SELECT * FROM students WHERE profile_url IS NULL;
SELECT * FROM jobs WHERE package_lpa > ANY (SELECT package_lpa FROM jobs WHERE job_type = 'INTERNSHIP');
SELECT * FROM jobs WHERE package_lpa > ALL (SELECT package_lpa FROM jobs WHERE job_type = 'INTERNSHIP');
SELECT s.student_name
FROM students s
WHERE EXISTS (
    SELECT 1 FROM applications a WHERE a.student_id = s.student_id
);

-- Set operators: each query must return the same number of compatible columns.
SELECT student_id FROM applications
UNION
SELECT student_id FROM students WHERE cgpa >= 9;

SELECT student_id FROM applications
UNION ALL
SELECT student_id FROM students WHERE cgpa >= 9;

SELECT student_id FROM applications
INTERSECT
SELECT student_id FROM students WHERE cgpa >= 9;

SELECT student_id FROM students
MINUS
SELECT student_id FROM applications;
