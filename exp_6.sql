-- ==========================================
-- EXPERIMENT: SQL JOINS - EXERCISE SOLUTIONS
-- Platform : Oracle FreeSQL (Oracle SQL)
-- Tables   : STUDENT_JK, DEPARTMENT_JK
-- ==========================================


-- ==========================================
-- 0. SETUP
-- ==========================================
-- DEPARTMENT_JK was also used in the earlier Employee_JK
-- experiment, so drop old copies first.
-- (Ignore the "table does not exist" error on a first run.)

DROP TABLE STUDENT_JK;
DROP TABLE DEPARTMENT_JK;

CREATE TABLE STUDENT_JK (
    student_id   NUMBER,
    student_name VARCHAR2(30),
    dept_id      NUMBER,
    marks        NUMBER
);

CREATE TABLE DEPARTMENT_JK (
    dept_id   NUMBER,
    dept_name VARCHAR2(30),
    location  VARCHAR2(30)
);

INSERT INTO STUDENT_JK VALUES (101, 'Anjali', 10, 85);
INSERT INTO STUDENT_JK VALUES (102, 'Priya',  20, 78);
INSERT INTO STUDENT_JK VALUES (103, 'Rahul',  10, 92);
INSERT INTO STUDENT_JK VALUES (104, 'Mohit',  30, 67);
INSERT INTO STUDENT_JK VALUES (105, 'Neha',   20, 88);
INSERT INTO STUDENT_JK VALUES (106, 'Karan',  40, 74);
INSERT INTO STUDENT_JK VALUES (107, 'Riya',   50, 81);

INSERT INTO DEPARTMENT_JK VALUES (10, 'CSE',   'Jaipur');
INSERT INTO DEPARTMENT_JK VALUES (20, 'AIML',  'Delhi');
INSERT INTO DEPARTMENT_JK VALUES (30, 'DS',    'Mumbai');
INSERT INTO DEPARTMENT_JK VALUES (40, 'IT',    'Pune');
INSERT INTO DEPARTMENT_JK VALUES (50, 'ECE',   'Jaipur');
INSERT INTO DEPARTMENT_JK VALUES (60, 'Civil', 'Jaipur');

COMMIT;

SELECT * FROM STUDENT_JK;
SELECT * FROM DEPARTMENT_JK;


-- ==========================================
-- BASIC JOINS
-- ==========================================

-- Q1. Student ID, name, department name and marks (INNER JOIN)
SELECT
    S.student_id,
    S.student_name,
    D.dept_name,
    S.marks
FROM STUDENT_JK S
INNER JOIN DEPARTMENT_JK D
ON S.dept_id = D.dept_id;


-- Q2. All students with their department names (LEFT OUTER JOIN)
SELECT
    S.student_id,
    S.student_name,
    D.dept_name
FROM STUDENT_JK S
LEFT OUTER JOIN DEPARTMENT_JK D
ON S.dept_id = D.dept_id;


-- Q3. All departments with the students in each (RIGHT OUTER JOIN)
SELECT
    D.dept_id,
    D.dept_name,
    S.student_name
FROM STUDENT_JK S
RIGHT OUTER JOIN DEPARTMENT_JK D
ON S.dept_id = D.dept_id;


-- Q4. All students and all departments, matched or not (FULL OUTER JOIN)
SELECT
    S.student_id,
    S.student_name,
    D.dept_id,
    D.dept_name
FROM STUDENT_JK S
FULL OUTER JOIN DEPARTMENT_JK D
ON S.dept_id = D.dept_id;


-- ==========================================
-- JOINS WITH CONDITIONS
-- ==========================================

-- Q5. Students who belong to the CSE department
SELECT
    S.student_name
FROM STUDENT_JK S
INNER JOIN DEPARTMENT_JK D
ON S.dept_id = D.dept_id
WHERE D.dept_name = 'CSE';


-- Q6. Student name, department name and marks for marks > 80
SELECT
    S.student_name,
    D.dept_name,
    S.marks
FROM STUDENT_JK S
INNER JOIN DEPARTMENT_JK D
ON S.dept_id = D.dept_id
WHERE S.marks > 80;


-- Q7. Students belonging to departments located in Jaipur
SELECT
    S.student_name,
    D.dept_name,
    D.location
FROM STUDENT_JK S
INNER JOIN DEPARTMENT_JK D
ON S.dept_id = D.dept_id
WHERE D.location = 'Jaipur';


-- Q8. Student name, department name and marks in descending order of marks
SELECT
    S.student_name,
    D.dept_name,
    S.marks
FROM STUDENT_JK S
INNER JOIN DEPARTMENT_JK D
ON S.dept_id = D.dept_id
ORDER BY S.marks DESC;


-- ==========================================
-- AGGREGATE FUNCTIONS WITH JOINS
-- ==========================================

-- Q9. Average marks department-wise
SELECT
    D.dept_name,
    AVG(S.marks) AS Average_Marks
FROM STUDENT_JK S
INNER JOIN DEPARTMENT_JK D
ON S.dept_id = D.dept_id
GROUP BY D.dept_name;


-- Q10. Maximum marks in each department
SELECT
    D.dept_name,
    MAX(S.marks) AS Maximum_Marks
FROM STUDENT_JK S
INNER JOIN DEPARTMENT_JK D
ON S.dept_id = D.dept_id
GROUP BY D.dept_name;


-- Q11. Number of students in each department
SELECT
    D.dept_name,
    COUNT(S.student_id) AS Total_Students
FROM STUDENT_JK S
INNER JOIN DEPARTMENT_JK D
ON S.dept_id = D.dept_id
GROUP BY D.dept_name;


-- Q12. Departments whose average marks are greater than 80
SELECT
    D.dept_name,
    AVG(S.marks) AS Average_Marks
FROM STUDENT_JK S
INNER JOIN DEPARTMENT_JK D
ON S.dept_id = D.dept_id
GROUP BY D.dept_name
HAVING AVG(S.marks) > 80;


-- ==========================================
-- OUTER JOIN PRACTICE
-- ==========================================

-- Q13. Departments that do not have any students
SELECT
    D.dept_id,
    D.dept_name,
    D.location
FROM DEPARTMENT_JK D
LEFT JOIN STUDENT_JK S
ON D.dept_id = S.dept_id
WHERE S.student_id IS NULL;


-- Q14. All students with their department names
--      (students whose department does not exist are still shown)
SELECT
    S.student_id,
    S.student_name,
    S.dept_id,
    D.dept_name
FROM STUDENT_JK S
LEFT JOIN DEPARTMENT_JK D
ON S.dept_id = D.dept_id;


-- Q15. All departments, with NULL for departments having no students
SELECT
    D.dept_id,
    D.dept_name,
    S.student_name
FROM DEPARTMENT_JK D
LEFT JOIN STUDENT_JK S
ON D.dept_id = S.dept_id;


-- ==========================================
-- ADVANCED JOIN PRACTICE
-- ==========================================

-- Q16. NATURAL JOIN (joins automatically on the common column DEPT_ID)
-- Note: do not put a table alias before dept_id in a NATURAL JOIN.
SELECT
    student_name,
    dept_name
FROM STUDENT_JK
NATURAL JOIN DEPARTMENT_JK;


-- Q17. USING clause on dept_id
SELECT
    S.student_name,
    D.dept_name,
    dept_id
FROM STUDENT_JK S
JOIN DEPARTMENT_JK D
USING (dept_id);


-- Q18. CROSS JOIN: every student combined with every department
--      (7 students x 6 departments = 42 rows)
SELECT
    S.student_name,
    D.dept_name
FROM STUDENT_JK S
CROSS JOIN DEPARTMENT_JK D;


-- Q19. Students who scored above the average marks of all students,
--      with their department names
SELECT
    S.student_name,
    D.dept_name,
    S.marks
FROM STUDENT_JK S
INNER JOIN DEPARTMENT_JK D
ON S.dept_id = D.dept_id
WHERE S.marks > (SELECT AVG(marks) FROM STUDENT_JK);


-- Q20. Department name, number of students, average, highest and
--      lowest marks for every department
--      (LEFT JOIN from DEPARTMENT so empty departments also appear)
SELECT
    D.dept_name,
    COUNT(S.student_id) AS Total_Students,
    AVG(S.marks)        AS Average_Marks,
    MAX(S.marks)        AS Highest_Marks,
    MIN(S.marks)        AS Lowest_Marks
FROM DEPARTMENT_JK D
LEFT JOIN STUDENT_JK S
ON D.dept_id = S.dept_id
GROUP BY D.dept_name;


-- ==========================================
-- CHALLENGE QUESTIONS
-- ==========================================

-- Q21. Department having the highest average marks
SELECT
    D.dept_name,
    AVG(S.marks) AS Average_Marks
FROM STUDENT_JK S
INNER JOIN DEPARTMENT_JK D
ON S.dept_id = D.dept_id
GROUP BY D.dept_name
HAVING AVG(S.marks) = (SELECT MAX(AVG(marks))
                       FROM STUDENT_JK
                       GROUP BY dept_id);


-- Q22. Students who scored the highest marks in their own department
SELECT
    S.student_name,
    D.dept_name,
    S.marks
FROM STUDENT_JK S
INNER JOIN DEPARTMENT_JK D
ON S.dept_id = D.dept_id
WHERE S.marks = (SELECT MAX(marks)
                 FROM STUDENT_JK
                 WHERE dept_id = S.dept_id);


-- Q23. Departments where more than one student is enrolled
SELECT
    D.dept_name,
    COUNT(S.student_id) AS Total_Students
FROM STUDENT_JK S
INNER JOIN DEPARTMENT_JK D
ON S.dept_id = D.dept_id
GROUP BY D.dept_name
HAVING COUNT(S.student_id) > 1;


-- Q24. Student with the second-highest marks, with department name
SELECT
    S.student_name,
    D.dept_name,
    S.marks
FROM STUDENT_JK S
INNER JOIN DEPARTMENT_JK D
ON S.dept_id = D.dept_id
WHERE S.marks = (SELECT MAX(marks)
                 FROM STUDENT_JK
                 WHERE marks < (SELECT MAX(marks) FROM STUDENT_JK));


-- Q25. Departments located in Jaipur with number of students,
--      including departments with zero students
SELECT
    D.dept_name,
    D.location,
    COUNT(S.student_id) AS Total_Students
FROM DEPARTMENT_JK D
LEFT JOIN STUDENT_JK S
ON D.dept_id = S.dept_id
WHERE D.location = 'Jaipur'
GROUP BY D.dept_name, D.location;


-- ==========================================
-- END OF SOLUTIONS
-- ==========================================
