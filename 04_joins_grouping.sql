-- EXPERIMENT 5: JOINS
-- EXPERIMENT 6: GROUP BY, HAVING, ORDER BY, INDEXING

-- INNER JOIN: applications with student names.
SELECT s.student_name, a.application_id, a.application_status
FROM students s
INNER JOIN applications a ON s.student_id = a.student_id;

-- THREE-TABLE JOIN: student + application + job.
SELECT s.student_name, j.job_role, a.application_status
FROM students s
JOIN applications a ON s.student_id = a.student_id
JOIN jobs j ON a.job_id = j.job_id;

-- FOUR-TABLE JOIN: student + application + job + company.
SELECT s.student_name, c.company_name, j.job_role,
       j.package_lpa, a.application_status
FROM students s
JOIN applications a ON s.student_id = a.student_id
JOIN jobs j ON a.job_id = j.job_id
JOIN companies c ON j.company_id = c.company_id;

-- LEFT OUTER JOIN: include students who have not applied.
SELECT s.student_name, a.application_id
FROM students s
LEFT JOIN applications a ON s.student_id = a.student_id;

-- RIGHT OUTER JOIN: include all jobs, even jobs with no applications.
SELECT j.job_role, a.application_id
FROM applications a
RIGHT JOIN jobs j ON a.job_id = j.job_id;

-- FULL OUTER JOIN example.
SELECT s.student_name, a.application_id
FROM students s
FULL OUTER JOIN applications a ON s.student_id = a.student_id;

-- NATURAL JOIN: both tables share COMPANY_ID.
SELECT company_id, company_name, job_role
FROM companies NATURAL JOIN jobs;

-- SELF JOIN: compare students in the same branch.
SELECT s1.student_name AS student_one, s2.student_name AS student_two, s1.branch
FROM students s1
JOIN students s2
  ON s1.branch = s2.branch
 AND s1.student_id < s2.student_id;

-- GROUP BY and aggregate functions.
SELECT branch, COUNT(*) AS student_count, ROUND(AVG(cgpa), 2) AS average_cgpa
FROM students
GROUP BY branch;

-- HAVING filters groups after aggregation.
SELECT c.company_name, COUNT(a.application_id) AS applications_received
FROM companies c
JOIN jobs j ON c.company_id = j.company_id
JOIN applications a ON j.job_id = a.job_id
GROUP BY c.company_name
HAVING COUNT(a.application_id) >= 2
ORDER BY applications_received DESC;

-- ORDER BY examples.
SELECT student_name, cgpa FROM students ORDER BY cgpa DESC;
SELECT job_role, package_lpa FROM jobs ORDER BY package_lpa ASC;

-- Indexes.
CREATE INDEX idx_students_branch ON students(branch);
CREATE INDEX idx_jobs_company ON jobs(company_id);
CREATE INDEX idx_applications_status ON applications(application_status);
