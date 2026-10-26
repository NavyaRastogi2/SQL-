-- ==========================================
-- EXERCISE: SQL FUNCTIONS - SOLUTIONS
-- Platform : Oracle FreeSQL (Oracle SQL)
-- Table    : EMPLOYEE
-- ==========================================


-- ==========================================
-- 0. SETUP
-- ==========================================
-- (Ignore the "table does not exist" error from DROP on a first run.)

DROP TABLE EMPLOYEE;

CREATE TABLE EMPLOYEE (
    EMP_ID     NUMBER PRIMARY KEY,
    EMP_NAME   VARCHAR2(30),
    DEPARTMENT VARCHAR2(20),
    SALARY     NUMBER(10,2),
    BONUS      NUMBER(10,2),
    JOIN_DATE  DATE
);

INSERT INTO EMPLOYEE VALUES (101, 'Amit Sharma', 'HR',      45000, 5000,  TO_DATE('15-01-2022','DD-MM-YYYY'));
INSERT INTO EMPLOYEE VALUES (102, 'Neha Gupta',  'IT',      62000, 8000,  TO_DATE('10-03-2021','DD-MM-YYYY'));
INSERT INTO EMPLOYEE VALUES (103, 'Rohit Verma', 'Sales',   38000, 3000,  TO_DATE('20-07-2023','DD-MM-YYYY'));
INSERT INTO EMPLOYEE VALUES (104, 'Priya Singh', 'IT',      71000, 10000, TO_DATE('05-09-2020','DD-MM-YYYY'));
INSERT INTO EMPLOYEE VALUES (105, 'Karan Mehta', 'Finance', 55000, 6000,  TO_DATE('18-11-2022','DD-MM-YYYY'));

COMMIT;

SELECT * FROM EMPLOYEE;


-- ==========================================
-- PART A: NUMBER FUNCTIONS
-- ==========================================

-- 1. Absolute value of -250
SELECT ABS(-250) AS Absolute_Value
FROM DUAL;

-- 2. Salary rounded to the nearest hundred
SELECT emp_name, salary,
       ROUND(salary, -2) AS Rounded_To_Hundred
FROM EMPLOYEE;

-- 3. Salary rounded to two decimal places
SELECT emp_name, salary,
       ROUND(salary, 2) AS Rounded_2_Decimals
FROM EMPLOYEE;

-- 4. Square root of 625
SELECT SQRT(625) AS Square_Root
FROM DUAL;

-- 5. Remainder when 25 is divided by 4
SELECT MOD(25, 4) AS Remainder
FROM DUAL;

-- 6. Salary after applying CEIL() and FLOOR()
SELECT emp_name, salary,
       CEIL(salary)  AS Ceiling_Value,
       FLOOR(salary) AS Floor_Value
FROM EMPLOYEE;


-- ==========================================
-- PART B: AGGREGATE FUNCTIONS
-- ==========================================

-- 1. Total salary of all employees
SELECT SUM(salary) AS Total_Salary
FROM EMPLOYEE;

-- 2. Average salary
SELECT AVG(salary) AS Average_Salary
FROM EMPLOYEE;

-- 3. Highest and lowest salary
SELECT MAX(salary) AS Highest_Salary,
       MIN(salary) AS Lowest_Salary
FROM EMPLOYEE;

-- 4. Total number of employees
SELECT COUNT(*) AS Total_Employees
FROM EMPLOYEE;

-- 5. Average salary department-wise
SELECT department,
       AVG(salary) AS Average_Salary
FROM EMPLOYEE
GROUP BY department;


-- ==========================================
-- PART C: CHARACTER FUNCTIONS
-- ==========================================

-- 1. Employee names in uppercase
SELECT UPPER(emp_name) AS Name_Upper
FROM EMPLOYEE;

-- 2. Employee names in lowercase
SELECT LOWER(emp_name) AS Name_Lower
FROM EMPLOYEE;

-- 3. First five characters of each employee name
SELECT emp_name,
       SUBSTR(emp_name, 1, 5) AS First_Five_Characters
FROM EMPLOYEE;

-- 4. Length of each employee name
SELECT emp_name,
       LENGTH(emp_name) AS Name_Length
FROM EMPLOYEE;

-- 5. Replace the word IT with Information Technology
SELECT emp_name,
       REPLACE(department, 'IT', 'Information Technology') AS Department
FROM EMPLOYEE;

-- 6. Concatenate employee name and department
--    (CONCAT takes only two arguments, so it is nested for the separator)
SELECT CONCAT(CONCAT(emp_name, ' - '), department) AS Employee_Info
FROM EMPLOYEE;


-- ==========================================
-- PART D: CONVERSION FUNCTIONS
-- ==========================================

-- 1. Convert the salary to a character string
SELECT emp_name,
       TO_CHAR(salary) AS Salary_As_Text
FROM EMPLOYEE;

-- 2. Joining date in the format DD-MON-YYYY
SELECT emp_name,
       TO_CHAR(join_date, 'DD-MON-YYYY') AS Joining_Date
FROM EMPLOYEE;

-- 3. Convert the string '25-12-2025' into a DATE
SELECT TO_DATE('25-12-2025', 'DD-MM-YYYY') AS Converted_Date
FROM DUAL;

-- 4. Convert the string '35000' into a NUMBER
SELECT TO_NUMBER('35000') AS Converted_Number
FROM DUAL;

-- 5. Salary with a currency symbol using TO_CHAR()
--    (L = currency symbol; NLS_CURRENCY sets it to Rs.)
SELECT emp_name,
       TO_CHAR(salary, 'L99,999.00', 'NLS_CURRENCY=Rs.') AS Salary_With_Currency
FROM EMPLOYEE;


-- ==========================================
-- PART E: DATE FUNCTIONS
-- ==========================================

-- 1. Current system date
SELECT SYSDATE AS Current_Date
FROM DUAL;

-- 2. Joining date after adding 90 days
SELECT emp_name, join_date,
       join_date + 90 AS After_90_Days
FROM EMPLOYEE;

-- 3. Number of months each employee has worked
SELECT emp_name, join_date,
       ROUND(MONTHS_BETWEEN(SYSDATE, join_date), 2) AS Months_Worked
FROM EMPLOYEE;

-- 4. Last day of the joining month
SELECT emp_name, join_date,
       LAST_DAY(join_date) AS Month_End
FROM EMPLOYEE;

-- 5. Next Friday after the joining date
SELECT emp_name, join_date,
       NEXT_DAY(join_date, 'FRIDAY') AS Next_Friday
FROM EMPLOYEE;

-- 6. Difference in days between the current date and the joining date
SELECT emp_name, join_date,
       TRUNC(SYSDATE) - join_date AS Days_Difference
FROM EMPLOYEE;


-- ==========================================
-- CHALLENGE EXERCISES
-- ==========================================

-- 1. Employees whose salary is greater than the average salary
SELECT emp_name, salary
FROM EMPLOYEE
WHERE salary > (SELECT AVG(salary) FROM EMPLOYEE);

-- 2. Employee with the highest salary
SELECT emp_name, salary
FROM EMPLOYEE
WHERE salary = (SELECT MAX(salary) FROM EMPLOYEE);

-- 3. Names in the format: EMPLOYEE_NAME (DEPARTMENT)
SELECT emp_name || ' (' || department || ')' AS Employee_Details
FROM EMPLOYEE;

-- 4. Joining year of each employee
SELECT emp_name,
       EXTRACT(YEAR FROM join_date) AS Joining_Year
FROM EMPLOYEE;

-- 5. Employees who joined before 01-Jan-2022
SELECT emp_name, join_date
FROM EMPLOYEE
WHERE join_date < TO_DATE('01-01-2022', 'DD-MM-YYYY');


-- ==========================================
-- END OF SOLUTIONS
-- ==========================================
