DECLARE
c number;
BEGIN

select count(*) into c from user_views where view_name='VW_DISH_SALES';
IF c>0 then
EXECUTE IMMEDIATE 'DROP VIEW VW_DISH_SALES';
dbms_output.put_line('Deleted VW_DISH_SALES');
ELSE
dbms_output.put_line('VW_DISH_SALES already deleted');
END IF;


select count(*) into c from user_views where view_name='VW_TOP_10_DISHES';
IF c>0 then
EXECUTE IMMEDIATE 'DROP VIEW VW_TOP_10_DISHES';
dbms_output.put_line('Deleted VW_TOP_10_DISHES');
ELSE
dbms_output.put_line('VW_TOP_10_DISHES already deleted');
END IF;


select count(*) into c from user_views where view_name='VW_TOP_10_CUSTOMERS';
IF c>0 then
EXECUTE IMMEDIATE 'DROP VIEW VW_TOP_10_CUSTOMERS';
dbms_output.put_line('Deleted VW_TOP_10_CUSTOMERS');
ELSE
dbms_output.put_line('VW_TOP_10_CUSTOMERS already deleted');
END IF;


select count(*) into c from user_views where view_name='VW_MONTHLY_SALES';
IF c>0 then
EXECUTE IMMEDIATE 'DROP VIEW VW_MONTHLY_SALES';
dbms_output.put_line('Deleted VW_MONTHLY_SALES');
ELSE
dbms_output.put_line('VW_MONTHLY_SALES already deleted');
END IF;


select count(*) into c from user_views where view_name='VW_TOP_DELIVERY_PERSON';
IF c>0 then
EXECUTE IMMEDIATE 'DROP VIEW VW_TOP_DELIVERY_PERSON';
dbms_output.put_line('Deleted VW_TOP_DELIVERY_PERSON');
ELSE
dbms_output.put_line('VW_TOP_DELIVERY_PERSON already deleted');
END IF;

select count(*) into c from user_views where view_name='VW_DELIVERY_AGENT_RATINGS';
IF c>0 then
EXECUTE IMMEDIATE 'DROP VIEW VW_DELIVERY_AGENT_RATINGS';
dbms_output.put_line('Deleted VW_DELIVERY_AGENT_RATINGS');
ELSE
dbms_output.put_line('VW_DELIVERY_AGENT_RATINGS already deleted');
END IF;


select count(*) into c from user_views where view_name='VW_RESTAURANT_SERVICE_RATINGS';
IF c>0 then
EXECUTE IMMEDIATE 'DROP VIEW VW_RESTAURANT_SERVICE_RATINGS';
dbms_output.put_line('Deleted VW_RESTAURANT_SERVICE_RATINGS');
ELSE
dbms_output.put_line('VW_RESTAURANT_SERVICE_RATINGS already deleted');
END IF;


select count(*) into c from user_views where view_name='VW_MENU';
IF c>0 then
EXECUTE IMMEDIATE 'DROP VIEW VW_MENU';
dbms_output.put_line('Deleted VW_MENU');
ELSE
dbms_output.put_line('VW_MENU already deleted');
END IF;


select count(*) into c from user_views where view_name='VW_COUPONS';
if c>0 then
EXECUTE IMMEDIATE 'DROP VIEW VW_COUPONS';
dbms_output.put_line('VW_COUPONS view deleted successfully');
ELSE
dbms_output.put_line('VW_COUPONS view already deleted');
END IF;


select count(*) into c from user_views where view_name='VW_RESTAURANTS';
if c>0 then
EXECUTE IMMEDIATE 'DROP VIEW VW_RESTAURANTS';
dbms_output.put_line('VW_RESTAURANTS view deleted successfully');
ELSE
dbms_output.put_line('VW_RESTAURANTS view already deleted');
END IF;


select count(*) into c from user_views where view_name='VW_CANCELLED_ORDERS';
if c>0 then
EXECUTE IMMEDIATE 'DROP VIEW VW_CANCELLED_ORDERS';
dbms_output.put_line('VW_CANCELLED_ORDERS view deleted successfully');
ELSE
dbms_output.put_line('VW_CANCELLED_ORDERS view already deleted');
END IF;


select count(*) into c from user_views where view_name='VW_ALL_ORDERS';
if c>0 then
EXECUTE IMMEDIATE 'DROP VIEW VW_ALL_ORDERS';
dbms_output.put_line('VW_ALL_ORDERS view deleted successfully');
ELSE
dbms_output.put_line('VW_ALL_ORDERS view already deleted');
END IF;

select count(*) into c from user_views where view_name='VW_CUSTOMER_ORDER_ADDRESS';
if c>0 then
EXECUTE IMMEDIATE 'DROP VIEW VW_CUSTOMER_ORDER_ADDRESS';
dbms_output.put_line('VW_CUSTOMER_ORDER_ADDRESS view deleted successfully');
ELSE
dbms_output.put_line('VW_CUSTOMER_ORDER_ADDRESS view already deleted');
END IF;

select count(*) into c from user_views where view_name='VW_DELIVERY_AGENT_STATUS';
if c>0 then
EXECUTE IMMEDIATE 'DROP VIEW VW_DELIVERY_AGENT_STATUS';
dbms_output.put_line('VW_DELIVERY_AGENT_STATUS view deleted successfully');
ELSE
dbms_output.put_line('VW_DELIVERY_AGENT_STATUS view already deleted');
END IF;

select count(*) into c from user_views where view_name='VW_COMPLETED_ORDERS';
if c>0 then
EXECUTE IMMEDIATE 'DROP VIEW VW_COMPLETED_ORDERS';
dbms_output.put_line('VW_COMPLETED_ORDERS view deleted successfully');
ELSE
dbms_output.put_line('VW_COMPLETED_ORDERS view already deleted');
END IF;

select count(*) into c from user_views where view_name='VW_ACTIVE_ORDERS';
if c>0 then
EXECUTE IMMEDIATE 'DROP VIEW VW_ACTIVE_ORDERS';
dbms_output.put_line('VW_ACTIVE_ORDERS view deleted successfully');
ELSE
dbms_output.put_line('VW_ACTIVE_ORDERS view already deleted');
END IF;

select count(*) into c from user_tables where table_name='COUPON';
if c>0 then
EXECUTE IMMEDIATE 'DROP TABLE COUPON';
dbms_output.put_line('COUPON table deleted successfully');
ELSE
dbms_output.put_line('COUPON table already deleted');
END IF;

select count(*) into c from user_tables where table_name='CART';
if c>0 then
EXECUTE IMMEDIATE 'DROP TABLE CART';
dbms_output.put_line('CART table deleted successfully');
ELSE
dbms_output.put_line('CART table already deleted');
END IF;

select count(*) into c from user_tables where table_name='MENU';
if c>0 then
EXECUTE IMMEDIATE 'DROP TABLE MENU';
dbms_output.put_line('MENU table deleted successfully');
ELSE
dbms_output.put_line('MENU table already deleted');
END IF;

select count(*) into c from user_tables where table_name='DELIVERY';
if c>0 then
EXECUTE IMMEDIATE 'DROP TABLE DELIVERY';
dbms_output.put_line('DELIVERY table deleted successfully');
ELSE
dbms_output.put_line('DELIVERY table already deleted');
END IF;

select count(*) into c from user_tables where table_name='ORDERS';
if c>0 then
EXECUTE IMMEDIATE 'DROP TABLE ORDERS';
dbms_output.put_line('ORDERS table deleted successfully');
ELSE
dbms_output.put_line('ORDERS table already deleted');
END IF;

select count(*) into c from user_tables where table_name='DELIVERY_AGENT';
if c>0 then
EXECUTE IMMEDIATE 'DROP TABLE DELIVERY_AGENT';
dbms_output.put_line('DELIVERY_AGENT table deleted successfully');
ELSE
dbms_output.put_line('DELIVERY_AGENT table already deleted');
END IF;

select count(*) into c from user_tables where table_name='RESTAURANT';
if c>0 then
EXECUTE IMMEDIATE 'DROP TABLE RESTAURANT';
dbms_output.put_line('RESTAURANTtable deleted successfully');
ELSE
dbms_output.put_line('RESTAURANT table already deleted');
END IF;

select count(*) into c from user_tables where table_name='MANAGER';
if c>0 then
EXECUTE IMMEDIATE 'DROP TABLE MANAGER';
dbms_output.put_line('MANAGER table deleted successfully');
ELSE
dbms_output.put_line('MANAGER table already deleted');
END IF;

select count(*) into c from user_tables where table_name='CUSTOMER';
if c>0 then
EXECUTE IMMEDIATE 'DROP TABLE CUSTOMER';
dbms_output.put_line('CUSTOMER table deleted successfully');
ELSE
dbms_output.put_line('CUSTOMER table already deleted');
END IF;

select count(*) into c from user_tables where table_name='TABLE_TRACKER';
if c>0 then
EXECUTE IMMEDIATE 'DROP TABLE TABLE_TRACKER';
dbms_output.put_line('TABLE_TRACKER table deleted successfully');
ELSE
dbms_output.put_line('TABLE_TRACKER table already deleted');
END IF;

select count(*) into c from user_tables where table_name='SEQUENCE_TRACKER';
if c>0 then
EXECUTE IMMEDIATE 'DROP TABLE SEQUENCE_TRACKER';
dbms_output.put_line('SEQUENCE_TRACKER table deleted successfully');
ELSE
dbms_output.put_line('SEQUENCE_TRACKER table already deleted');
END IF;

select count(*) into c from user_tables where table_name='TRIGGER_TRACKER';
if c>0 then
EXECUTE IMMEDIATE 'DROP TABLE TRIGGER_TRACKER';
dbms_output.put_line('TRIGGER_TRACKER table deleted successfully');
ELSE
dbms_output.put_line('TRIGGER_TRACKER table already deleted');
END IF;

select count(*) into c from user_procedures where object_name='INSERT_DELIVERYAGENT_DATA';
if c>0 then
EXECUTE IMMEDIATE 'DROP PROCEDURE INSERT_DELIVERYAGENT_DATA';
dbms_output.put_line('INSERT_DELIVERYAGENT_DATA deleted');
ELSE
dbms_output.put_line('Already deleted INSERT_DELIVERYAGENT_DATA');
END IF;

select count(*) into c from user_procedures where object_name='INSERT_MANAGER_DATA';
if c>0 then
EXECUTE IMMEDIATE 'DROP PROCEDURE INSERT_MANAGER_DATA';
dbms_output.put_line('INSERT_AGENT_DATA deleted');
ELSE
dbms_output.put_line('Already deleted INSERT_MANAGER_DATA');
END IF;

select count(*) into c from user_procedures where object_name='INSERT_RESTAURANT_DATA';
if c>0 then
EXECUTE IMMEDIATE 'DROP PROCEDURE INSERT_RESTAURANT_DATA';
dbms_output.put_line('INSERT_RESTAURANT_DATA deleted');
ELSE
dbms_output.put_line('Already deleted INSERT_RESTAURANT_DATA');
END IF;

select count(*) into c from user_procedures where object_name='INSERT_CUSTOMER_DATA';
if c>0 then
EXECUTE IMMEDIATE 'DROP PROCEDURE INSERT_CUSTOMER_DATA';
dbms_output.put_line('INSERT_CUSTOMER_DATA deleted');
ELSE
dbms_output.put_line('Already deleted INSERT_CUSTOMER_DATA');
END IF;

select count(*) into c from user_procedures where object_name='INSERT_ORDERS_DATA';
if c>0 then
EXECUTE IMMEDIATE 'DROP PROCEDURE INSERT_ORDERS_DATA';
dbms_output.put_line('INSERT_ORDERS_DATA deleted');
ELSE
dbms_output.put_line('Already deleted INSERT_ORDERS_DATA');
END IF;

select count(*) into c from user_procedures where object_name='INSERT_MENU_DATA';
if c>0 then
EXECUTE IMMEDIATE 'DROP PROCEDURE INSERT_MENU_DATA';
dbms_output.put_line('INSERT_MENU_DATA deleted');
ELSE
dbms_output.put_line('Already deleted INSERT_MENU_DATA');
END IF;

select count(*) into c from user_procedures where object_name='INSERT_CART_DATA';
if c>0 then
EXECUTE IMMEDIATE 'DROP PROCEDURE INSERT_CART_DATA';
dbms_output.put_line('INSERT_CART_DATA deleted');
ELSE
dbms_output.put_line('Already deleted INSERT_CART_DATA');
END IF;

select count(*) into c from user_procedures where object_name='INSERT_DELIVERY_DATA';
if c>0 then
EXECUTE IMMEDIATE 'DROP PROCEDURE INSERT_DELIVERY_DATA';
dbms_output.put_line('INSERT_DELIVERY_DATA deleted');
ELSE
dbms_output.put_line('Already deleted INSERT_DELIVERY_DATA');
END IF;

select count(*) into c from user_procedures where object_name='INSERT_COUPON_DATA';
IF c>0 then
EXECUTE IMMEDIATE 'DROP PROCEDURE INSERT_COUPON_DATA';
dbms_output.put_line('INSERT_COUPON_DATA deleted');
ELSE
dbms_output.put_line('Already deleted INSERT_COUPON_DATA');
END IF;


select count(*) into c from user_sequences where sequence_name='CUSTOMER_SEQ';
IF c>0 then
EXECUTE IMMEDIATE 'DROP SEQUENCE CUSTOMER_SEQ';
dbms_output.put_line('Deleted CUSTOMER_SEQ');
ELSE
dbms_output.put_line('CUSTOMER_SEQ already deleted');
END IF;

select count(*) into c from user_sequences where sequence_name='DELIVERY_AGENT_SEQ';
IF c>0 then
EXECUTE IMMEDIATE 'DROP SEQUENCE DELIVERY_AGENT_SEQ';
dbms_output.put_line('Deleted DELIVERY_AGENT_SEQ');
ELSE
dbms_output.put_line('DELIVERY_AGENT_SEQ already deleted');
END IF;

select count(*) into c from user_sequences where sequence_name='MANAGER_SEQ';
IF c>0 then
EXECUTE IMMEDIATE 'DROP SEQUENCE MANAGER_SEQ';
dbms_output.put_line('Deleted MANAGER_SEQ');
ELSE
dbms_output.put_line('MANAGER_SEQ already deleted');
END IF;

select count(*) into c from user_sequences where sequence_name='ORDERS_SEQ';
IF c>0 then
EXECUTE IMMEDIATE 'DROP SEQUENCE ORDERS_SEQ';
dbms_output.put_line('Deleted ORDERS_SEQ');
ELSE
dbms_output.put_line('ORDERS_SEQ already deleted');
END IF;

select count(*) into c from user_sequences where sequence_name='CART_SEQ';
IF c>0 then
EXECUTE IMMEDIATE 'DROP SEQUENCE CART_SEQ';
dbms_output.put_line('Deleted CART_SEQ');
ELSE
dbms_output.put_line('CART_SEQ already deleted');
END IF;

select count(*) into c from user_sequences where sequence_name='COUPON_SEQ';
IF c>0 then
EXECUTE IMMEDIATE 'DROP SEQUENCE COUPON_SEQ';
dbms_output.put_line('Deleted COUPON_SEQ');
ELSE
dbms_output.put_line('COUPON_SEQ already deleted');
END IF;

select count(*) into c from user_sequences where sequence_name='RESTAURANT_SEQ';
IF c>0 then
EXECUTE IMMEDIATE 'DROP SEQUENCE RESTAURANT_SEQ';
dbms_output.put_line('Deleted RESTAURANT_SEQ');
ELSE
dbms_output.put_line('RESTAURANT_SEQ already deleted');
END IF;

select count(*) into c from user_sequences where sequence_name='MENU_SEQ';
IF c>0 then
EXECUTE IMMEDIATE 'DROP SEQUENCE MENU_SEQ';
dbms_output.put_line('Deleted MENU_SEQ');
ELSE
dbms_output.put_line('MENU_SEQ already deleted');
END IF;

END;
