-- EXPERIMENT 1: DDL
-- EXPERIMENT 8: CONSTRAINTS
-- Run this file first in your own Oracle schema.

-- Clean-up section for re-running the project.
-- Run only if these tables already exist and you are happy to delete their data.
-- DROP TABLE applications CASCADE CONSTRAINTS;
-- DROP TABLE jobs CASCADE CONSTRAINTS;
-- DROP TABLE companies CASCADE CONSTRAINTS;
-- DROP TABLE students CASCADE CONSTRAINTS;

CREATE TABLE students (
    student_id       NUMBER(5) CONSTRAINT pk_students PRIMARY KEY,
    student_name     VARCHAR2(50) NOT NULL,
    email            VARCHAR2(100) CONSTRAINT uq_students_email UNIQUE NOT NULL,
    phone            VARCHAR2(15) UNIQUE,
    branch           VARCHAR2(20) DEFAULT 'CSE',
    cgpa             NUMBER(3,2) CONSTRAINT chk_student_cgpa CHECK (cgpa BETWEEN 0 AND 10),
    graduation_year  NUMBER(4) CHECK (graduation_year BETWEEN 2024 AND 2035),
    city             VARCHAR2(30) DEFAULT 'Jaipur'
);

CREATE TABLE companies (
    company_id       NUMBER(5) CONSTRAINT pk_companies PRIMARY KEY,
    company_name     VARCHAR2(60) NOT NULL UNIQUE,
    industry         VARCHAR2(40),
    location         VARCHAR2(40),
    website          VARCHAR2(100)
);

CREATE TABLE jobs (
    job_id           NUMBER(5) CONSTRAINT pk_jobs PRIMARY KEY,
    company_id       NUMBER(5) NOT NULL,
    job_role         VARCHAR2(60) NOT NULL,
    job_type         VARCHAR2(15) DEFAULT 'FULL-TIME'
                     CHECK (job_type IN ('FULL-TIME', 'INTERNSHIP')),
    package_lpa      NUMBER(5,2) CHECK (package_lpa >= 0),
    min_cgpa         NUMBER(3,2) DEFAULT 6.00 CHECK (min_cgpa BETWEEN 0 AND 10),
    last_date        DATE,
    job_location     VARCHAR2(40),
    CONSTRAINT fk_jobs_company FOREIGN KEY (company_id)
        REFERENCES companies(company_id)
);

CREATE TABLE applications (
    application_id   NUMBER(6) CONSTRAINT pk_applications PRIMARY KEY,
    student_id       NUMBER(5) NOT NULL,
    job_id           NUMBER(5) NOT NULL,
    applied_on       DATE DEFAULT SYSDATE,
    application_status VARCHAR2(20) DEFAULT 'APPLIED'
        CHECK (application_status IN ('APPLIED', 'SHORTLISTED', 'REJECTED', 'SELECTED', 'WITHDRAWN')),
    interview_date   DATE,
    updated_on       DATE DEFAULT SYSDATE,
    CONSTRAINT fk_app_student FOREIGN KEY (student_id)
        REFERENCES students(student_id),
    CONSTRAINT fk_app_job FOREIGN KEY (job_id)
        REFERENCES jobs(job_id),
    CONSTRAINT uq_student_job UNIQUE (student_id, job_id)
);


-- Safe DDL command demonstration on a temporary table.
-- This demonstrates every DDL operation without damaging the project tables.
CREATE TABLE ddl_demo (
    demo_id NUMBER(4),
    demo_name VARCHAR2(20)
);

ALTER TABLE ddl_demo ADD (demo_city VARCHAR2(20));
ALTER TABLE ddl_demo MODIFY (demo_name VARCHAR2(40));
ALTER TABLE ddl_demo RENAME COLUMN demo_city TO city_name;
ALTER TABLE ddl_demo DROP COLUMN city_name;

RENAME ddl_demo TO ddl_demo_renamed;
DROP TABLE ddl_demo_renamed;

-- ALTER TABLE examples (DDL): add, modify and rename a column.
ALTER TABLE students ADD (linkedin_url VARCHAR2(150));
ALTER TABLE students MODIFY (city VARCHAR2(50));
ALTER TABLE students RENAME COLUMN linkedin_url TO profile_url;

-- Demonstrate adding a named constraint after table creation.
ALTER TABLE students ADD CONSTRAINT chk_student_name
    CHECK (LENGTH(TRIM(student_name)) >= 2);

-- Demonstrate dropping a column (kept commented so the useful profile_url remains).
-- ALTER TABLE students DROP COLUMN profile_url;

-- RENAME example (Oracle syntax).
-- RENAME old_table_name TO new_table_name;

-- DROP TABLE example (kept commented; destructive).
-- DROP TABLE table_name;
