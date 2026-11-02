-- FIVE COMPLEX QUERIES
-- Each combines multiple DBMS concepts. These are good queries to explain in a demo/viva.

-- COMPLEX QUERY 1:
-- Four-table JOIN + WHERE + ORDER BY.
-- Show students who applied to jobs paying at least 6 LPA, with company and status.
SELECT s.student_name, s.branch, c.company_name, j.job_role,
       j.package_lpa, a.application_status
FROM students s
JOIN applications a ON s.student_id = a.student_id
JOIN jobs j ON a.job_id = j.job_id
JOIN companies c ON j.company_id = c.company_id
WHERE j.package_lpa >= 6
  AND a.application_status <> 'WITHDRAWN'
ORDER BY j.package_lpa DESC, s.student_name;

-- COMPLEX QUERY 2:
-- JOIN + GROUP BY + HAVING + aggregate functions.
-- Companies with at least two applications and their average offered package.
SELECT c.company_name,
       COUNT(a.application_id) AS total_applications,
       ROUND(AVG(j.package_lpa), 2) AS average_package
FROM companies c
JOIN jobs j ON c.company_id = j.company_id
JOIN applications a ON j.job_id = a.job_id
GROUP BY c.company_name
HAVING COUNT(a.application_id) >= 2
ORDER BY average_package DESC;

-- COMPLEX QUERY 3:
-- Correlated subquery + aggregate + JOIN.
-- List students whose CGPA is higher than their branch average and who have applied.
SELECT s.student_name, s.branch, s.cgpa, COUNT(a.application_id) AS applications
FROM students s
JOIN applications a ON s.student_id = a.student_id
WHERE s.cgpa > (
    SELECT AVG(s2.cgpa)
    FROM students s2
    WHERE s2.branch = s.branch
)
GROUP BY s.student_name, s.branch, s.cgpa
ORDER BY s.cgpa DESC;

-- COMPLEX QUERY 4:
-- EXISTS + nested subquery + JOIN.
-- Find companies that have at least one selected candidate.
SELECT DISTINCT c.company_name, j.job_role
FROM companies c
JOIN jobs j ON c.company_id = j.company_id
WHERE EXISTS (
    SELECT 1
    FROM applications a
    WHERE a.job_id = j.job_id
      AND a.application_status = 'SELECTED'
);

-- COMPLEX QUERY 5:
-- CASE expression + LEFT JOIN + GROUP BY + ORDER BY.
-- Placement funnel: count applications in each status for each company.
SELECT c.company_name,
       SUM(CASE WHEN a.application_status = 'APPLIED' THEN 1 ELSE 0 END) AS applied_count,
       SUM(CASE WHEN a.application_status = 'SHORTLISTED' THEN 1 ELSE 0 END) AS shortlisted_count,
       SUM(CASE WHEN a.application_status = 'SELECTED' THEN 1 ELSE 0 END) AS selected_count,
       COUNT(a.application_id) AS total_applications
FROM companies c
JOIN jobs j ON c.company_id = j.company_id
LEFT JOIN applications a ON j.job_id = a.job_id
GROUP BY c.company_name
ORDER BY selected_count DESC, total_applications DESC;
