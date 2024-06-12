create or replace PROCEDURE REGISTER_CUSTOMER(
customer_username IN CUSTOMER.cust_username%TYPE, 
customer_password IN CUSTOMER.cust_password%TYPE, 
customer_first_name IN CUSTOMER.cust_first_name%TYPE,
customer_last_name IN CUSTOMER.cust_last_name%TYPE, 
customer_phone_no IN CUSTOMER.cust_phone_no%TYPE, 
apt_no IN CUSTOMER.apt_number%TYPE, 
customer_zip_code IN CUSTOMER.zip_code%TYPE, 
customer_street_name IN CUSTOMER.street_name%TYPE)
IS
username_null EXCEPTION;
username_exists EXCEPTION;
username_length_exceeded EXCEPTION;
password_length_null EXCEPTION;
password_length_exceeded EXCEPTION;
customer_first_name_null EXCEPTION;
customer_last_name_null EXCEPTION;
customer_name_length_exceeded EXCEPTION;
customer_first_name_is_number EXCEPTION;
customer_last_name_is_number EXCEPTION;
invalid_phone_number EXCEPTION;
invalid_zip_code EXCEPTION;
cust_username_count number;
BEGIN
--username has spaces
--username length

 select count(cust_username) into cust_username_count from CUSTOMER where cust_username=customer_username;
 IF customer_username IS NULL THEN
    RAISE username_null; 
 ELSIF (cust_username_count>0) THEN
    RAISE username_exists;
 ELSIF length(customer_username)>15 THEN
    RAISE username_length_exceeded;
 ELSIF customer_password IS NULL THEN
    RAISE password_length_null;
 ELSIF length(customer_password)>8 THEN
    RAISE password_length_exceeded;
 ELSIF customer_first_name IS NULL THEN
    RAISE customer_first_name_null;
 ELSIF customer_last_name IS NULL THEN
    RAISE customer_last_name_null;
 ELSIF (numberCheck(customer_first_name)=0) THEN
    RAISE customer_first_name_is_number;
 ELSIF (numberCheck(customer_last_name)=0) THEN
    RAISE customer_last_name_is_number;
 ELSIF length(customer_phone_no)<10 THEN
    RAISE invalid_phone_number;
 ELSIF (length(customer_zip_code)>5 and length(customer_zip_code)<5) THEN
    RAISE invalid_zip_code;
 ELSE
 --encrpyt password
    INSERT INTO CUSTOMER(cust_username, cust_password, cust_first_name, cust_last_name, cust_phone_no, wallet_balance, apt_number, zip_code, street_name) 
    VALUES(customer_username, customer_password, customer_first_name, customer_last_name, customer_phone_no, 0, apt_no, customer_zip_code, customer_street_name); 
 END IF;
EXCEPTION 
 WHEN username_null THEN 
    raise_application_error (-20091,'USERNAME CANNNOT BE NULL OR ZERO LENGTH'); 
 WHEN username_exists THEN 
    raise_application_error (-20092,'THIS USERNAME ALREADY EXISTS! ENTER A NEW USERNAME'); 
 WHEN username_length_exceeded THEN 
    raise_application_error (-20093,'USERNAME LENGTH CANNOT BE GREATER THAN 15'); 
 WHEN customer_first_name_null THEN 
    raise_application_error (-20094,'FIRST NAME CANNNOT BE NULL OR ZERO LENGTH');
 WHEN customer_last_name_null THEN 
    raise_application_error (-20095,'LAST NAME CANNNOT BE NULL OR ZERO LENGTH'); 
 WHEN customer_first_name_is_number THEN
    raise_application_error (-20096, 'FIRST NAME CANNOT BE NUMBER');
 WHEN customer_last_name_is_number THEN
    raise_application_error (-20096, 'LAST NAME CANNOT BE NUMBER');
 WHEN invalid_phone_number THEN
    raise_application_error (-20097, 'INVALID PHONE NUMBER');
 WHEN invalid_zip_code THEN
    raise_application_error (-20097, 'INVALID ZIP CODE');
 WHEN password_length_null THEN
    raise_application_error (-20098, 'PASSWORD CANNOT BE NULL');
 WHEN password_length_exceeded THEN
    raise_application_error (-20099, 'PASSWORD LENGTH CANNOT BE MORE THAN 8');
END;
