---To drop this user run below query in DBA Admin
SET SERVEROUTPUT ON;
DECLARE
c number;
BEGIN
select count(*) into c from all_users where username='FOOD_ORDERING_ADMIN';
IF c>0 then
EXECUTE IMMEDIATE 'DROP USER FOOD_ORDERING_ADMIN CASCADE';
dbms_output.put_line('Dropped USER FOOD_ORDERING_ADMIN');
ELSE
dbms_output.put_line('FOOD_ORDERING_ADMIN already dropped');
END IF;
END;