-- EXPERIMENT 10: USER, ROLE, GRANT, REVOKE, TABLESPACE
-- IMPORTANT: DBA / privileged-account tasks only.
-- Do not execute blindly. Usernames, paths, quotas and privileges depend on your Oracle setup.

-- Create a user (DBA account).
-- CREATE USER placement_user IDENTIFIED BY StrongPassword123;
-- GRANT CREATE SESSION, CREATE TABLE, CREATE VIEW, CREATE SEQUENCE, CREATE TRIGGER
-- TO placement_user;
-- ALTER USER placement_user QUOTA 50M ON USERS;

-- Change password.
-- ALTER USER placement_user IDENTIFIED BY NewStrongPassword123;

-- Object privileges: execute as the owner of the tables.
-- GRANT SELECT, INSERT ON students TO placement_user;
-- GRANT SELECT ON jobs TO placement_user;
-- REVOKE INSERT ON students FROM placement_user;

-- Create and assign a role.
-- CREATE ROLE placement_reader;
-- GRANT SELECT ON students TO placement_reader;
-- GRANT SELECT ON companies TO placement_reader;
-- GRANT placement_reader TO placement_user;
-- REVOKE placement_reader FROM placement_user;

-- Delete user: DBA only. CASCADE also removes the user's schema objects.
-- DROP USER placement_user CASCADE;

-- TABLESPACE: DBA-only, and the datafile path must exist and be writable by Oracle.
-- Example template only; replace the path for your database server.
-- CREATE TABLESPACE placement_ts
-- DATAFILE '/path/valid/on/oracle/server/placement_ts01.dbf'
-- SIZE 50M AUTOEXTEND ON NEXT 10M MAXSIZE 500M;

-- BACKUP AND RECOVERY NOTES:
-- Logical export/import is commonly performed with Oracle Data Pump utilities
-- expdp and impdp from an operating-system terminal, not as ordinary SQL statements.
--
-- Example templates (DBA must configure DIRECTORY object and permissions):
-- CREATE OR REPLACE DIRECTORY placement_backup AS '/path/on/database/server';
-- GRANT READ, WRITE ON DIRECTORY placement_backup TO placement_user;
-- OS terminal example:
-- expdp system@service_name schemas=PLACEMENT_USER directory=PLACEMENT_BACKUP dumpfile=placement_backup.dmp logfile=placement_export.log
-- impdp system@service_name schemas=PLACEMENT_USER directory=PLACEMENT_BACKUP dumpfile=placement_backup.dmp logfile=placement_import.log
--
-- Physical backup and point-in-time recovery are normally managed with RMAN.
-- They require DBA privileges, configured recovery settings and database-specific procedures.
-- Do not run backup commands against a shared college database without instructor/DBA approval.
