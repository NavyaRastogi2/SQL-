-- EXPERIMENT 7: SUBQUERIES AND VIEWS

-- Single-row subquery: students above the overall average CGPA.
SELECT student_name, cgpa
FROM students
WHERE cgpa > (SELECT AVG(cgpa) FROM students);

-- Multi-row subquery using IN.
SELECT student_name
FROM students
WHERE student_id IN (
    SELECT student_id FROM applications
    WHERE application_status = 'SELECTED'
);

-- ANY and ALL are also demonstrated in 03_functions_operators.sql.

-- Correlated subquery: students whose CGPA is above the average of their own branch.
SELECT s.student_name, s.branch, s.cgpa
FROM students s
WHERE s.cgpa > (
    SELECT AVG(s2.cgpa)
    FROM students s2
    WHERE s2.branch = s.branch
);

-- Subquery in HAVING: branches whose average CGPA is above overall average.
SELECT branch, AVG(cgpa) AS branch_average
FROM students
GROUP BY branch
HAVING AVG(cgpa) > (SELECT AVG(cgpa) FROM students);

-- Create a view combining four tables.
CREATE OR REPLACE VIEW vw_placement_overview AS
SELECT s.student_id, s.student_name, s.branch, s.cgpa,
       c.company_name, j.job_role, j.job_type, j.package_lpa,
       a.application_status, a.applied_on
FROM students s
JOIN applications a ON s.student_id = a.student_id
JOIN jobs j ON a.job_id = j.job_id
JOIN companies c ON j.company_id = c.company_id;

-- Query the view like a table.
SELECT * FROM vw_placement_overview;
SELECT student_name, company_name, job_role
FROM vw_placement_overview
WHERE application_status = 'SELECTED';

-- A second view for placement-cell reporting.
CREATE OR REPLACE VIEW vw_company_application_summary AS
SELECT c.company_name, COUNT(a.application_id) AS total_applications,
       SUM(CASE WHEN a.application_status = 'SELECTED' THEN 1 ELSE 0 END) AS selected_count
FROM companies c
JOIN jobs j ON c.company_id = j.company_id
LEFT JOIN applications a ON j.job_id = a.job_id
GROUP BY c.company_name;

SELECT * FROM vw_company_application_summary;

-- Drop view example (run only when you no longer need it).
-- DROP VIEW vw_company_application_summary;
