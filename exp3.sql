-- 01 CREATE STUDENT TABLE

CREATE TABLE STUDENT_NAVYA (
    Roll_No NUMBER(10) PRIMARY KEY,
    Name VARCHAR2(30),
    Branch VARCHAR2(10),
    Semester NUMBER(2),
    CGPA NUMBER(3,2),
    City VARCHAR2(20)
);


-- ============================================================
-- 02 INSERT 10 RECORDS
-- ============================================================
-- Q2. Insert 10 student records
INSERT INTO STUDENT_NAVYA VALUES (101, 'Aarav', 'CSE', 1, 8.50, 'Jaipur');
INSERT INTO STUDENT_NAVYA VALUES (102, 'Diya', 'IT', 2, 7.80, 'Bhopal');
INSERT INTO STUDENT_NAVYA VALUES (103, 'Kabir', 'CSE', 5, 9.10, 'Pune');
INSERT INTO STUDENT_NAVYA VALUES (104, 'Meera', 'IT', 4, 6.50, 'Mumbai');
INSERT INTO STUDENT_NAVYA VALUES (105, 'Ishaan', 'ECE', 5, 8.00, 'Delhi');
INSERT INTO STUDENT_NAVYA VALUES (106, 'Anaya', 'IT', 6, 9.50, 'Noida');
INSERT INTO STUDENT_NAVYA VALUES (107, 'Reyansh', 'CSE', 7, 7.00, 'Kolkata');
INSERT INTO STUDENT_NAVYA VALUES (108, 'Navya', 'IT', 8, 8.20, 'Jaipur');
INSERT INTO STUDENT_NAVYA VALUES (109, 'Kiara', 'ECE', 3, 7.50, 'Jaipur');
INSERT INTO STUDENT_NAVYA VALUES (110, 'Arjun', 'CSE', 2, 8.90, 'Delhi');
COMMIT;


-- ============================================================
-- 03 DISPLAY ALL RECORDS
-- ============================================================
SELECT * FROM STUDENT_NAVYA;


-- ============================================================
-- 04 DISPLAY ROLL NO AND NAME
-- ============================================================
SELECT Roll_No, Name FROM STUDENT_NAVYA;


-- ============================================================
-- 05 DISPLAY CSE STUDENTS
-- ============================================================
SELECT * FROM STUDENT_NAVYA WHERE Branch = 'CSE';


-- ============================================================
-- 06 SEMESTER GREATER THAN 3
-- ============================================================
SELECT * FROM STUDENT_NAVYA WHERE Semester > 3;


-- ============================================================
-- 07 CGPA GREATER THAN 8 5
-- ============================================================
SELECT * FROM STUDENT_NAVYA WHERE CGPA > 8.5;


-- ============================================================
-- 08 STUDENTS FROM JAIPUR
-- ============================================================
SELECT * FROM STUDENT_NAVYA WHERE City = 'Jaipur';


-- ============================================================
-- 09 JAIPUR CGPA OVER 8
-- ============================================================
SELECT * FROM STUDENT_NAVYA WHERE City = 'Jaipur' AND CGPA > 8.0;


-- ============================================================
-- 10 CSE SEMESTER 5
-- ============================================================
SELECT * FROM STUDENT_NAVYA WHERE Branch = 'CSE' AND Semester = 5;


-- ============================================================
-- 11 UPDATE SPECIFIC CGPA
-- ============================================================
UPDATE STUDENT_NAVYA SET CGPA = 8.90 WHERE Roll_No = 101;
COMMIT;


-- ============================================================
-- 12 UPDATE STUDENT CITY
-- ============================================================
UPDATE STUDENT_NAVYA SET City = 'Pune' WHERE Roll_No = 104;
COMMIT;


-- ============================================================
-- 13 UPDATE SEMESTER ALL IT
-- ============================================================
UPDATE STUDENT_NAVYA SET Semester = 6 WHERE Branch = 'IT';
COMMIT;


-- ============================================================
-- 14 CHANGE ECE TO CSE
-- ============================================================
UPDATE STUDENT_NAVYA SET Branch = 'CSE' WHERE Roll_No = 105 AND Branch = 'ECE';
COMMIT;


-- ============================================================
-- 15 DELETE BY ROLL NO
-- ============================================================
DELETE FROM STUDENT_NAVYA WHERE Roll_No = 105;
COMMIT;


-- ============================================================
-- 16 DELETE DELHI STUDENTS
-- ============================================================
DELETE FROM STUDENT_NAVYA WHERE City = 'Delhi';
COMMIT;


-- ============================================================
-- 17 DELETE CGPA BELOW 7 5
-- ============================================================
DELETE FROM STUDENT_NAVYA WHERE CGPA < 7.5;
COMMIT;


-- ============================================================
-- 18 SORT NAME ASCENDING
-- ============================================================
SELECT * FROM STUDENT_NAVYA ORDER BY Name ASC;


-- ============================================================
-- 19 SORT CGPA DESCENDING
-- ============================================================
SELECT * FROM STUDENT_NAVYA ORDER BY CGPA DESC;


-- ============================================================
-- 20 DISTINCT BRANCHES
-- ============================================================
SELECT DISTINCT Branch FROM STUDENT_NAVYA;


-- ============================================================
-- 21 COUNT ALL STUDENTS
-- ============================================================
SELECT COUNT(*) AS Total_Students FROM STUDENT_NAVYA;


-- ============================================================
-- 22 COUNT CSE STUDENTS
-- ============================================================
SELECT COUNT(*) AS CSE_Students FROM STUDENT_NAVYA WHERE Branch = 'CSE';


-- ============================================================
-- 23 MAXIMUM CGPA
-- ============================================================
SELECT MAX(CGPA) AS Maximum_CGPA FROM STUDENT_NAVYA;


-- ============================================================
-- 24 MINIMUM CGPA
-- ============================================================
SELECT MIN(CGPA) AS Minimum_CGPA FROM STUDENT_NAVYA;


-- ============================================================
-- 25 AVERAGE CGPA
-- ============================================================
SELECT AVG(CGPA) AS Average_CGPA FROM STUDENT_NAVYA;


-- ============================================================
-- 26 TOTAL CGPA
-- ============================================================
SELECT SUM(CGPA) AS Total_CGPA FROM STUDENT_NAVYA;


-- ============================================================
-- 27 NAMES STARTING WITH A
-- ============================================================
SELECT * FROM STUDENT_NAVYA WHERE Name LIKE 'A%';


-- ============================================================
-- 28 NAMES ENDING WITH A
-- ============================================================
SELECT * FROM STUDENT_NAVYA WHERE Name LIKE '%a';


-- ============================================================
-- 29 CITY JAIPUR OR DELHI
-- ============================================================
SELECT * FROM STUDENT_NAVYA WHERE City IN ('Jaipur', 'Delhi');


-- ============================================================
-- 30 DELETE ALL RECORDS
-- ============================================================
DELETE FROM STUDENT_NAVYA;
COMMIT;


-- ============================================================
-- 31 INSERT 5 NEW RECORDS
-- ============================================================
INSERT INTO STUDENT_NAVYA VALUES (111, 'Tara', 'CSE', 3, 8.10, 'Jaipur');
INSERT INTO STUDENT_NAVYA VALUES (112, 'Veer', 'IT', 5, 7.90, 'Delhi');
INSERT INTO STUDENT_NAVYA VALUES (113, 'Myra', 'ECE', 1, 6.80, 'Noida');
INSERT INTO STUDENT_NAVYA VALUES (114, 'Nikhil', 'IT', 3, 9.00, 'Kolkata');
INSERT INTO STUDENT_NAVYA VALUES (115, 'Navya', 'CSE', 7, 8.40, 'Noida');
COMMIT;


-- ============================================================
-- 32 TRUNCATE STUDENT
-- ============================================================
TRUNCATE TABLE STUDENT_NAVYA;


-- ============================================================
-- 33 CREATE BACKUP COPY
-- ============================================================
CREATE TABLE BACKUP_STUDENT_NAVYA AS
SELECT * FROM STUDENT_NAVYA;


-- ============================================================
-- 34 DISPLAY BACKUP RECORDS
-- ============================================================
SELECT * FROM BACKUP_STUDENT_NAVYA;


-- ============================================================
-- 35 INCREASE ALL CGPA
-- ============================================================
UPDATE STUDENT_NAVYA SET CGPA = CGPA + 0.5;
COMMIT;


-- ============================================================
-- 36 DELETE SEMESTER BELOW 3
-- ============================================================
DELETE FROM STUDENT_NAVYA WHERE Semester < 3;
COMMIT;


-- ============================================================
-- 37 CGPA BETWEEN 8 AND 9 5
-- ============================================================
SELECT * FROM STUDENT_NAVYA WHERE CGPA BETWEEN 8.0 AND 9.5;


-- ============================================================
-- 38 NAME CONTAINS R
-- ============================================================
SELECT * FROM STUDENT_NAVYA WHERE UPPER(Name) LIKE '%R%';


-- ============================================================
-- 39 SORT BRANCH THEN CGPA DESC
-- ============================================================
SELECT * FROM STUDENT_NAVYA
ORDER BY Branch ASC, CGPA DESC;


-- ============================================================
-- 40 DROP BACKUP TABLE
-- ============================================================
DROP TABLE BACKUP_STUDENT_NAVYA;
