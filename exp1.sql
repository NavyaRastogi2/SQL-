01 CREATE EMPLOYEE TABLE
-- ============================================================
-- Q1. Create EMPLOYEE table
CREATE TABLE EMPLOYEE_NAVYA (
    Emp_no NUMBER(10),
    E_name VARCHAR2(50),
    E_address VARCHAR2(100),
    E_ph_no VARCHAR2(15),
    Dept_no NUMBER(10),
    Dept_name VARCHAR2(50),
    Job_id CHAR(10),
    Salary NUMBER(10,2)
);
-- ============================================================
-- 02 ADD HIREDATE
-- ============================================================
-- Q2. Add HIREDATE column
ALTER TABLE EMPLOYEE_NAVYA
ADD (HireDate DATE);


-- ============================================================
-- 03 MODIFY JOB ID DATATYPE
-- ============================================================
-- Q3. Change JOB_ID from CHAR to VARCHAR2
ALTER TABLE EMPLOYEE_NAVYA
MODIFY (Job_id VARCHAR2(10));


-- ============================================================
-- 04 RENAME EMP NO
-- ============================================================
-- Q4. Rename Emp_no to E_no
ALTER TABLE EMPLOYEE_NAVYA
RENAME COLUMN Emp_no TO E_no;


-- ============================================================
-- 05 MODIFY JOB ID WIDTH
-- ============================================================
-- Q5. Modify the width of the job field
ALTER TABLE EMPLOYEE_NAVYA
MODIFY (Job_id VARCHAR2(20));
