-- EXPERIMENT 9: TCL
-- Run this file separately and observe the results after each step.

-- SAVEPOINT and ROLLBACK TO SAVEPOINT example.
UPDATE applications
SET application_status = 'SHORTLISTED'
WHERE application_id = 401;

SAVEPOINT before_second_update;

UPDATE applications
SET application_status = 'SELECTED'
WHERE application_id = 403;

-- Undo only the second update.
ROLLBACK TO before_second_update;

SELECT application_id, application_status
FROM applications
WHERE application_id IN (401, 403);

-- Make the first update permanent.
COMMIT;

-- Full ROLLBACK example using a temporary change.
UPDATE applications
SET application_status = 'WITHDRAWN'
WHERE application_id = 405;

SELECT application_id, application_status
FROM applications
WHERE application_id = 405;

ROLLBACK;

-- Verify the previous committed status remains.
SELECT application_id, application_status
FROM applications
WHERE application_id = 405;

-- COMMIT example.
UPDATE students
SET city = 'Jaipur'
WHERE student_id = 105;
COMMIT;
