-- PL/SQL AND TRIGGERS
-- Run in SQL Developer using F5 (Run Script).
SET SERVEROUTPUT ON;

-- Anonymous PL/SQL block: display all students.
BEGIN
    FOR rec IN (SELECT student_id, student_name, cgpa FROM students ORDER BY student_id) LOOP
        DBMS_OUTPUT.PUT_LINE(
            'ID: ' || rec.student_id ||
            ' | Name: ' || rec.student_name ||
            ' | CGPA: ' || rec.cgpa
        );
    END LOOP;
END;
/

-- PL/SQL block with IF/ELSE and SELECT INTO.
DECLARE
    v_cgpa students.cgpa%TYPE;
    v_name students.student_name%TYPE;
BEGIN
    SELECT student_name, cgpa
    INTO v_name, v_cgpa
    FROM students
    WHERE student_id = 101;

    IF v_cgpa >= 8 THEN
        DBMS_OUTPUT.PUT_LINE(v_name || ' is above the 8 CGPA benchmark.');
    ELSE
        DBMS_OUTPUT.PUT_LINE(v_name || ' is below the 8 CGPA benchmark.');
    END IF;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Student ID not found.');
    WHEN TOO_MANY_ROWS THEN
        DBMS_OUTPUT.PUT_LINE('More than one student matched.');
END;
/

-- Trigger: automatically update UPDATED_ON whenever an application row is modified.
CREATE OR REPLACE TRIGGER trg_application_updated
BEFORE UPDATE ON applications
FOR EACH ROW
BEGIN
    :NEW.updated_on := SYSDATE;
END;
/

-- Test the trigger.
UPDATE applications
SET application_status = 'SHORTLISTED'
WHERE application_id = 403;

SELECT application_id, application_status, updated_on
FROM applications
WHERE application_id = 403;

COMMIT;

-- Trigger: prevent applying to a job after its deadline.
CREATE OR REPLACE TRIGGER trg_check_job_deadline
BEFORE INSERT ON applications
FOR EACH ROW
DECLARE
    v_last_date jobs.last_date%TYPE;
BEGIN
    SELECT last_date
    INTO v_last_date
    FROM jobs
    WHERE job_id = :NEW.job_id;

    IF v_last_date IS NOT NULL AND TRUNC(SYSDATE) > TRUNC(v_last_date) THEN
        RAISE_APPLICATION_ERROR(-20001, 'Application deadline has passed.');
    END IF;
END;
/

-- Trigger test (only use a job whose deadline has not passed).
-- INSERT INTO applications (application_id, student_id, job_id)
-- VALUES (450, 102, 301);
-- ROLLBACK;
