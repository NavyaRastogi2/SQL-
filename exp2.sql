
-- Q1. Create Student table
CREATE TABLE STUDENT_NAVYA (
    S_no NUMBER(5) PRIMARY KEY,
    Roll_No NUMBER(10) UNIQUE,
    Name VARCHAR2(30),
    Branch VARCHAR2(10),
    Semester NUMBER(2),
    CGPA NUMBER(3,2),
    City VARCHAR2(20)
);


-- Q2. Insert 10 student records
INSERT INTO STUDENT_NAVYA VALUES (1, 101, 'Aarav', 'CSE', 1, 8.50, 'Jaipur');
INSERT INTO STUDENT_NAVYA VALUES (2, 102, 'Diya', 'IT', 2, 7.80, 'Bhopal');
INSERT INTO STUDENT_NAVYA VALUES (3, 103, 'Kabir', 'CSE', 3, 9.10, 'Pune');
INSERT INTO STUDENT_NAVYA VALUES (4, 104, 'Meera', 'IT', 4, 6.50, 'Mumbai');
INSERT INTO STUDENT_NAVYA VALUES (5, 105, 'Ishaan', 'CSE', 5, 8.00, 'Delhi');
INSERT INTO STUDENT_NAVYA VALUES (6, 106, 'Anaya', 'IT', 6, 9.50, 'Noida');
INSERT INTO STUDENT_NAVYA VALUES (7, 107, 'Reyansh', 'CSE', 7, 7.00, 'Kolkata');
INSERT INTO STUDENT_NAVYA VALUES (8, 108, 'Navya', 'IT', 8, 8.20, 'Jaipur');
INSERT INTO STUDENT_NAVYA VALUES (9, 109, 'Kiara', 'CSE', 1, 7.50, 'Jaipur');
INSERT INTO STUDENT_NAVYA VALUES (10, 110, 'Arjun', 'IT', 2, 8.90, NULL);
COMMIT;


-- Q3. Display all records
SELECT * FROM STUDENT_NAVYA;


-- Q4. Display students belonging to CSE
SELECT * FROM STUDENT_NAVYA
WHERE Branch = 'CSE';


-- Q5. Display students who belong to Jaipur
SELECT * FROM STUDENT_NAVYA
WHERE City = 'Jaipur';
-- Q6. Update CGPA of a specific student
UPDATE STUDENT_NAVYA
SET CGPA = 8.90
WHERE Roll_No = 101;
COMMIT;


-- Q7. Update the city of a student
UPDATE STUDENT_NAVYA
SET City = 'Pune'
WHERE Roll_No = 104;
COMMIT;


-- Q8. Update semester of all IT students
UPDATE STUDENT_NAVYA
SET Semester = 6
WHERE Branch = 'IT';
COMMIT;

-- Q9. Change a student's branch from ECE to CSE
UPDATE STUDENT_NAVYA
SET Branch = 'CSE'
WHERE Roll_No = 108 AND Branch = 'ECE';
COMMIT;

-- Q10. Delete a student using Roll_No
DELETE FROM STUDENT_NAVYA
WHERE Roll_No = 105;
COMMIT;

-- Q11. Delete all students belonging to Delhi
DELETE FROM STUDENT_NAVYA
WHERE City = 'Delhi';
COMMIT;

-- Q12. Delete all records using DELETE
DELETE FROM STUDENT_NAVYA;
COMMIT;


-- Q13. Insert 5 new records
INSERT INTO STUDENT_NAVYA VALUES (11, 111, 'Tara', 'CSE', 3, 8.10, 'Jaipur');
INSERT INTO STUDENT_NAVYA VALUES (12, 112, 'Veer', 'IT', 5, 7.90, 'Delhi');
INSERT INTO STUDENT_NAVYA VALUES (13, 113, 'Myra', 'CSE', 1, 6.80, 'Noida');
INSERT INTO STUDENT_NAVYA VALUES (14, 114, 'Nikhil', 'IT', 3, 9.00, 'Kolkata');
INSERT INTO STUDENT_NAVYA VALUES (15, 115, 'Navya', 'CSE', 7, 8.40, 'Noida');
COMMIT;


-- Q14. Remove all records permanently using TRUNCATE
TRUNCATE TABLE STUDENT_NAVYA;

============================================================
-- Q15. Create Backup_Student and copy all current records
CREATE TABLE BACKUP_STUDENT_NAVYA AS
SELECT * FROM STUDENT_NAVYA;


============================================================
-- Q16. Display all records from backup table
SELECT * FROM BACKUP_STUDENT_NAVYA;

============================================================
-- Q17. Drop backup table after verifying copied records
DROP TABLE BACKUP_STUDENT_NAVYA;
