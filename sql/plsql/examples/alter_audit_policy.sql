ALTER AUDIT POLICY hr_audit_policy ADD ONLY TOPLEVEL;
ALTER AUDIT POLICY hr_audit_policy DROP ONLY TOPLEVEL;
ALTER AUDIT POLICY dml_pol
  ADD PRIVILEGES CREATE ANY TABLE, DROP ANY TABLE;
ALTER AUDIT POLICY java_pol
  ADD ACTIONS CREATE JAVA, ALTER JAVA, DROP JAVA;
ALTER AUDIT POLICY table_pol
  ADD ROLES dba;
ALTER AUDIT POLICY security_pol
  ADD PRIVILEGES CREATE ANY LIBRARY, DROP ANY LIBRARY
      ACTIONS DELETE on hr.employees,
INSERT on hr.employees,
UPDATE on hr.employees,
    ALL on hr.departments
    ROLES dba, connect;
ALTER AUDIT POLICY table_pol
  DROP PRIVILEGES CREATE ANY TABLE;
ALTER AUDIT POLICY dml_pol
  DROP ACTIONS INSERT on hr.employees,
UPDATE on hr.employees;
ALTER AUDIT POLICY java_pol
  DROP ROLES java_deploy;
ALTER AUDIT POLICY hr_admin_pol
  DROP PRIVILEGES CREATE ANY TABLE
       ACTIONS LOCK TABLE
       ROLES audit_viewer;
ALTER AUDIT POLICY dp_actions_pol
  ADD ACTIONS COMPONENT = datapump EXPORT
  DROP ACTIONS COMPONENT = datapump IMPORT;
ALTER AUDIT POLICY order_updates_pol
  CONDITION DROP;
ALTER AUDIT POLICY emp_updates_pol
  CONDITION 'UID = 102'
  EVALUATE PER STATEMENT;
