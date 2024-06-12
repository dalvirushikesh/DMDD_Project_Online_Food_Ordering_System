CREATE USER FOOD_ORDERING_ADMIN IDENTIFIED BY Foodadmin1234;

GRANT CREATE USER, DROP USER, EXECUTE ANY TYPE, EXECUTE ANY PROCEDURE, ALTER ANY PROCEDURE, CREATE ANY TABLE, UNLIMITED TABLESPACE, DROP ANY TRIGGER, CREATE ANY PROCEDURE, ALTER ANY INDEX, CREATE ANY INDEX, CREATE TABLE, CREATE SESSION, DROP ANY TYPE, CREATE ANY TRIGGER, CREATE SEQUENCE, DROP ANY INDEX, SELECT ANY TABLE, DROP ANY TABLE, CREATE ANY TYPE, ALTER ANY TRIGGER, ALTER ANY SEQUENCE, CREATE ANY SEQUENCE, UPDATE ANY TABLE, CREATE TRIGGER, DROP ANY PROCEDURE, DROP ANY SEQUENCE, CREATE ANY VIEW, DELETE ANY TABLE, INSERT ANY TABLE, ALTER ANY TABLE, READ ANY TABLE, DEBUG CONNECT SESSION, MERGE ANY VIEW, ALTER ANY TYPE, CREATE PROCEDURE, SELECT ANY SEQUENCE, DROP ANY VIEW, CREATE VIEW to FOOD_ORDERING_ADMIN;

/
CREATE OR REPLACE PACKAGE INITIALIZE
AS
PROCEDURE CREATE_USERS;
END;

/
CREATE OR REPLACE PACKAGE BODY INITIALIZE
AS
PROCEDURE CREATE_USERS
AS
customer_count NUMBER(10);
manager_count NUMBER(10);
delivery_agent_count NUMBER(10);
BEGIN
select count(*) into customer_count from all_users where USERNAME='CUSTOMER_USER';
select count(*) into manager_count from all_users where USERNAME='MANAGER_USER';
select count(*) into delivery_agent_count from all_users where USERNAME='DELIVERY_AGENT_USER';

IF customer_count>0 THEN
    DBMS_OUTPUT.PUT_LINE('CUSTOMER_USER EXISTS!');
ELSE
    EXECUTE IMMEDIATE 'CREATE USER CUSTOMER_USER IDENTIFIED BY Custpass1234';
    DBMS_OUTPUT.PUT_LINE('CUSTOMER_USER CREATED SUCCESSFULLY');
END IF;


IF manager_count>0 THEN
    DBMS_OUTPUT.PUT_LINE('MANAGER_USER EXISTS!');
ELSE
    EXECUTE IMMEDIATE 'CREATE USER MANAGER_USER IDENTIFIED BY Managepass123';
    DBMS_OUTPUT.PUT_LINE('MANAGER_USER CREATED SUCCESSFULLY');
END IF;

IF delivery_agent_count>0 THEN
    DBMS_OUTPUT.PUT_LINE('DELIVERY_AGENT_USER EXISTS!');
ELSE
    EXECUTE IMMEDIATE 'CREATE USER DELIVERY_AGENT_USER IDENTIFIED BY Deliverpass1';
    DBMS_OUTPUT.PUT_LINE('DELIVERY_AGENT_USER CREATED SUCCESSFULLY');   
END IF;
END CREATE_USERS;

END INITIALIZE;

/

EXECUTE INITIALIZE.CREATE_USERS;

grant create session to CUSTOMER_USER;
grant create session to MANAGER_USER;
grant create session to DELIVERY_AGENT_USER;