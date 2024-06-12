SET SERVEROUTPUT ON;
DECLARE
table_count NUMBER(10);
sequence_count NUMBER(10);
trigger_count NUMBER(10);
BEGIN 
    SELECT count(*) into table_count FROM user_tables where table_name = 'TABLE_TRACKER';
    select count(*) into trigger_count from user_tables where table_name='TRIGGER_TRACKER';
    select count(*) into sequence_count from user_tables where table_name='SEQUENCE_TRACKER';
    
    IF(table_count > 0)
    THEN
        DBMS_OUTPUT.PUT_LINE('TABLE TABLE_TRACKER ALREADY EXISTS!');
    ELSE
        EXECUTE IMMEDIATE 'CREATE TABLE TABLE_TRACKER
    (
       TABLE_NAME varchar2(100), 
       TABLE_QUERY varchar2(5000) NOT NULL, 
       CONSTRAINT TRACKER_TABLE_PK PRIMARY KEY(TABLE_NAME)
    )
    ';
    DBMS_OUTPUT.PUT_LINE('TABLE TABLE_TRACKER CREATED SUCCESSFULLY');
    
    EXECUTE IMMEDIATE q'[INSERT INTO TABLE_TRACKER VALUES('CUSTOMER','CREATE TABLE CUSTOMER(
    CUST_ID NUMBER NOT NULL PRIMARY KEY, 
    CUST_USERNAME VARCHAR(50) NOT NULL, 
    CUST_PASSWORD VARCHAR(20) NOT NULL, 
    CUST_FIRST_NAME VARCHAR(50) NOT NULL, 
    CUST_LAST_NAME VARCHAR(50) NOT NULL, 
    CUST_PHONE_NO NUMBER NOT NULL, 
    WALLET_BALANCE NUMBER NOT NULL, 
    APT_NUMBER NUMBER NOT NULL, 
    ZIP_CODE NUMBER NOT NULL,
    STREET_NAME VARCHAR(50)NOT NULL)')]';

    
    EXECUTE IMMEDIATE q'[INSERT INTO TABLE_TRACKER VALUES('DELIVERY_AGENT','CREATE TABLE DELIVERY_AGENT(
    AGENT_ID NUMBER NOT NULL PRIMARY KEY,
    AGENT_USERNAME VARCHAR(50) NOT NULL,
    AGENT_PASSWORD VARCHAR(50) NOT NULL,
    AGENT_RATING DECIMAL(10,2) NOT NULL,
    AGENT_STATUS VARCHAR(30) NOT NULL)')]';
     
    EXECUTE IMMEDIATE q'[INSERT INTO TABLE_TRACKER VALUES('MANAGER','CREATE TABLE MANAGER(
    MANAGER_ID NUMBER NOT NULL PRIMARY KEY,
    MANAGER_USERNAME VARCHAR(50) NOT NULL,
    MANAGER_PASSWORD VARCHAR(50) NOT NULL)')]';
     
    EXECUTE IMMEDIATE q'[INSERT INTO TABLE_TRACKER VALUES('RESTAURANT','CREATE TABLE RESTAURANT(
    RESTAURANT_ID NUMBER NOT NULL PRIMARY KEY,
    MANAGER_ID NUMBER NOT NULL,
    RESTAURANT_CONTACT NUMBER(10) NOT NULL,
    RESTAURANT_NAME VARCHAR(50) NOT NULL,
    CONSTRAINT MANAGER_ID FOREIGN KEY (MANAGER_ID) REFERENCES MANAGER(MANAGER_ID))')]';
     
    EXECUTE IMMEDIATE q'[INSERT INTO TABLE_TRACKER VALUES('ORDERS','CREATE TABLE ORDERS(
    ORDER_ID NUMBER NOT NULL PRIMARY KEY,
    CUST_ID NUMBER NOT NULL,
    RESTAURANT_ID NUMBER NOT NULL,
    ORDER_DATE TIMESTAMP,
    ORDER_STATUS VARCHAR(50) NOT NULL,
    COUPON_NAME VARCHAR(20) NOT NULL,
    DELIVERY_CHARGE NUMBER NOT NULL,
    AMOUNT DECIMAL(10,2) NOT NULL,
    PAYMENT_METHOD VARCHAR(20) NOT NULL,
    PAYMENT_STATUS VARCHAR(20) NOT NULL,
    DELIVERY_AGENT_NAME VARCHAR(50) NOT NULL ,
    DELIVERY_SERVICE_RATING NUMBER NOT NULL,
    RESTAURANT_SERVICE_RATING NUMBER NOT NULL,
    CONSTRAINT CUST_ID FOREIGN KEY (CUST_ID) REFERENCES CUSTOMER(CUST_ID),
    CONSTRAINT RESTAURANT_ID FOREIGN KEY(RESTAURANT_ID) REFERENCES RESTAURANT(RESTAURANT_ID))')]';
    
    EXECUTE IMMEDIATE q'[INSERT INTO TABLE_TRACKER VALUES('DELIVERY','CREATE TABLE DELIVERY(
    ORDER_ID NUMBER NOT NULL,
    RESTAURANT_ID NUMBER NOT NULL,
    CUST_ID NUMBER NOT NULL,
    AGENT_ID NUMBER NOT NULL,
    DELIVERY_STATUS VARCHAR(30) NOT NULL,
    CONSTRAINT ORDER_ID_FK FOREIGN KEY(ORDER_ID) REFERENCES ORDERS(ORDER_ID),
    CONSTRAINT RESTAURANT_ID_FK FOREIGN KEY(RESTAURANT_ID) REFERENCES RESTAURANT(RESTAURANT_ID),
    CONSTRAINT CUST_ID_FK FOREIGN KEY(CUST_ID) REFERENCES CUSTOMER(CUST_ID),
    CONSTRAINT AGENT_ID_FK FOREIGN KEY(AGENT_ID) REFERENCES DELIVERY_AGENT(AGENT_ID))')]';
    
    EXECUTE IMMEDIATE q'[INSERT INTO TABLE_TRACKER VALUES('MENU','CREATE TABLE MENU(
    DISH_ID NUMBER NOT NULL PRIMARY KEY,
    RESTAURANT_ID NUMBER NOT NULL,
    DISH_NAME VARCHAR(30) NOT NULL,
    DISH_STATUS VARCHAR(30) NOT NULL,
    DISH_RATING DECIMAL(10,2) NOT NULL,
    PRICE DECIMAL (10,2) NOT NULL,
    DISH_CATEGORY VARCHAR(30) NOT NULL,
    CONSTRAINT RESTAURANT_IDFK FOREIGN KEY(RESTAURANT_ID) REFERENCES RESTAURANT(RESTAURANT_ID))')]';
     
    EXECUTE IMMEDIATE q'[INSERT INTO TABLE_TRACKER VALUES('COUPON','CREATE TABLE COUPON(
    COUPON_ID NUMBER NOT NULL PRIMARY KEY,
    COUPON_NAME VARCHAR(30) NOT NULL,
    LOWER_RANGE NUMBER NOT NULL,
    UPPER_RANGE NUMBER NOT NULL,
    ACTIVITY_STATUS VARCHAR(30) NOT NULL,
    DISCOUNT DECIMAL(10,2) NOT NULL)')]';
     
    EXECUTE IMMEDIATE q'[INSERT INTO TABLE_TRACKER VALUES ('CART','CREATE TABLE CART(
    LINE_ID NUMBER NOT NULL PRIMARY KEY,
    ORDER_ID NUMBER NOT NULL,
    CUST_ID NUMBER NOT NULL,
    RESTAURANT_ID NUMBER NOT NULL,
    DISH_ID NUMBER NOT NULL,
    DISH_RATING NUMBER,
    UNIT_PRICE DECIMAL(10,2) NOT NULL,
    QUANTITY NUMBER NOT NULL,
    CONSTRAINT ORDERID_FK FOREIGN KEY(ORDER_ID) REFERENCES ORDERS(ORDER_ID),
    CONSTRAINT CUSTID_FK FOREIGN KEY(CUST_ID) REFERENCES CUSTOMER(CUST_ID),
    CONSTRAINT RESTAURANTID_FK FOREIGN KEY(RESTAURANT_ID) REFERENCES RESTAURANT(RESTAURANT_ID),
    CONSTRAINT DISHID_FK FOREIGN KEY(DISH_ID) REFERENCES MENU(DISH_ID))')]';
    END IF;

    IF sequence_count>0 THEN
        DBMS_OUTPUT.PUT_LINE('TABLE SEQUENCE_TRACKER ALREADY EXISTS!');
    ELSE
    EXECUTE IMMEDIATE 'CREATE TABLE SEQUENCE_TRACKER
    (
       SEQUENCE_NAME varchar2(100), 
       SEQUENCE_QUERY varchar2(5000) NOT NULL, 
       CONSTRAINT SEQUENCE_TABLE_PK PRIMARY KEY(SEQUENCE_NAME)
    )
    ';    
    
    DBMS_OUTPUT.PUT_LINE('TABLE SEQUENCE_TRACKER CREATED SUCCESSFULLY');
    
    EXECUTE IMMEDIATE q'[INSERT INTO SEQUENCE_TRACKER VALUES('DELIVERY_AGENT_SEQ','CREATE SEQUENCE  DELIVERY_AGENT_SEQ  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ')]';
    
    EXECUTE IMMEDIATE q'[INSERT INTO SEQUENCE_TRACKER VALUES('MANAGER_SEQ','CREATE SEQUENCE  MANAGER_SEQ  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ')]';
    
    EXECUTE IMMEDIATE q'[INSERT INTO SEQUENCE_TRACKER VALUES('RESTAURANT_SEQ','CREATE SEQUENCE  RESTAURANT_SEQ  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ')]';
    
    EXECUTE IMMEDIATE q'[INSERT INTO SEQUENCE_TRACKER VALUES('CUSTOMER_SEQ','CREATE SEQUENCE  CUSTOMER_SEQ  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ')]';
    
    EXECUTE IMMEDIATE q'[INSERT INTO SEQUENCE_TRACKER VALUES('ORDERS_SEQ','CREATE SEQUENCE  ORDERS_SEQ  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ')]';
    
    EXECUTE IMMEDIATE q'[INSERT INTO SEQUENCE_TRACKER VALUES('MENU_SEQ','CREATE SEQUENCE  MENU_SEQ  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ')]';
    
    EXECUTE IMMEDIATE q'[INSERT INTO SEQUENCE_TRACKER VALUES('CART_SEQ','CREATE SEQUENCE  CART_SEQ  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ')]';
    
    EXECUTE IMMEDIATE q'[INSERT INTO SEQUENCE_TRACKER VALUES('COUPON_SEQ','CREATE SEQUENCE  COUPON_SEQ  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ')]';
    
    END IF;
    
    IF trigger_count>0 THEN
        DBMS_OUTPUT.PUT_LINE('TABLE TRIGGER_TRACKER ALREADY EXISTS!');
    ELSE
    EXECUTE IMMEDIATE 'CREATE TABLE TRIGGER_TRACKER
    (
       TRIGGER_NAME varchar2(100), 
       TRIGGER_QUERY varchar2(5000) NOT NULL, 
       CONSTRAINT TRIGGER_TABLE_PK PRIMARY KEY(TRIGGER_NAME)
    )
    ';    
    
    DBMS_OUTPUT.PUT_LINE('TABLE TRIGGER_TRACKER CREATED SUCCESSFULLY');
    
    EXECUTE IMMEDIATE q'[INSERT INTO TRIGGER_TRACKER VALUES('DELIVERY_AGENT_TRG','create or replace TRIGGER DELIVERY_AGENT_TRG 
    BEFORE INSERT ON DELIVERY_AGENT 
    FOR EACH ROW 
    BEGIN
    <<COLUMN_SEQUENCES>>
    BEGIN
        IF INSERTING AND :NEW.AGENT_ID IS NULL THEN
            SELECT DELIVERY_AGENT_SEQ.NEXTVAL INTO :NEW.AGENT_ID FROM SYS.DUAL;
        END IF;
    END COLUMN_SEQUENCES;
    END;')]';
    
    EXECUTE IMMEDIATE q'[INSERT INTO TRIGGER_TRACKER VALUES('MANAGER_TRG','create or replace TRIGGER MANAGER_TRG 
    BEFORE INSERT ON MANAGER 
    FOR EACH ROW 
    BEGIN
    <<COLUMN_SEQUENCES>>
    BEGIN
        IF INSERTING AND :NEW.MANAGER_ID IS NULL THEN
            SELECT MANAGER_SEQ.NEXTVAL INTO :NEW.MANAGER_ID FROM SYS.DUAL;
        END IF;
    END COLUMN_SEQUENCES;
    END;')]';
    
    EXECUTE IMMEDIATE q'[INSERT INTO TRIGGER_TRACKER VALUES('RESTAURANT_TRG','create or replace TRIGGER RESTAURANT_TRG 
    BEFORE INSERT ON RESTAURANT 
    FOR EACH ROW 
    BEGIN
    <<COLUMN_SEQUENCES>>
    BEGIN
    IF INSERTING AND :NEW.RESTAURANT_ID IS NULL THEN
      SELECT RESTAURANT_SEQ.NEXTVAL INTO :NEW.RESTAURANT_ID FROM SYS.DUAL;
    END IF;
    END COLUMN_SEQUENCES;
    END;')]';
    
    EXECUTE IMMEDIATE q'[INSERT INTO TRIGGER_TRACKER VALUES('CUSTOMER_TRG','create or replace TRIGGER CUSTOMER_TRG 
    BEFORE INSERT ON CUSTOMER 
    FOR EACH ROW 
    BEGIN
    <<COLUMN_SEQUENCES>>
    BEGIN
    IF INSERTING AND :NEW.CUST_ID IS NULL THEN
        SELECT CUSTOMER_SEQ.NEXTVAL INTO :NEW.CUST_ID FROM SYS.DUAL;
    END IF;
    END COLUMN_SEQUENCES;
    END;')]';
    
    EXECUTE IMMEDIATE q'[INSERT INTO TRIGGER_TRACKER VALUES('ORDERS_TRG','create or replace TRIGGER ORDERS_TRG 
    BEFORE INSERT ON ORDERS 
    FOR EACH ROW 
    BEGIN
    <<COLUMN_SEQUENCES>>
    BEGIN
    IF INSERTING AND :NEW.ORDER_ID IS NULL THEN
        SELECT ORDERS_SEQ.NEXTVAL INTO :NEW.ORDER_ID FROM SYS.DUAL;
    END IF;
    END COLUMN_SEQUENCES;
    END;')]';
    
    EXECUTE IMMEDIATE q'[INSERT INTO TRIGGER_TRACKER VALUES('MENU_TRG','create or replace TRIGGER MENU_TRG 
    BEFORE INSERT ON MENU 
    FOR EACH ROW 
    BEGIN
    <<COLUMN_SEQUENCES>>
    BEGIN
    IF INSERTING AND :NEW.DISH_ID IS NULL THEN
        SELECT MENU_SEQ.NEXTVAL INTO :NEW.DISH_ID FROM SYS.DUAL;
    END IF;
    END COLUMN_SEQUENCES;
    END;')]';
    
    EXECUTE IMMEDIATE q'[INSERT INTO TRIGGER_TRACKER VALUES('CART_TRG','create or replace TRIGGER CART_TRG 
    BEFORE INSERT ON CART 
    FOR EACH ROW 
    BEGIN
    <<COLUMN_SEQUENCES>>
    BEGIN
    IF INSERTING AND :NEW.LINE_ID IS NULL THEN
        SELECT CART_SEQ.NEXTVAL INTO :NEW.LINE_ID FROM SYS.DUAL;
    END IF;
    END COLUMN_SEQUENCES;
    END;')]';
    
    EXECUTE IMMEDIATE q'[INSERT INTO TRIGGER_TRACKER VALUES('COUPON_TRG','create or replace TRIGGER COUPON_TRG 
    BEFORE INSERT ON COUPON 
    FOR EACH ROW 
    BEGIN
    <<COLUMN_SEQUENCES>>
    BEGIN
    IF INSERTING AND :NEW.COUPON_ID IS NULL THEN
      SELECT COUPON_SEQ.NEXTVAL INTO :NEW.COUPON_ID FROM SYS.DUAL;
    END IF;
    END COLUMN_SEQUENCES;
    END;')]';
    
    END IF;
END;
/

DECLARE
tableName varchar2(100);
tableQuery varchar2(5000);
check_name number;
CURSOR create_table_cursor IS select TABLE_NAME, TABLE_QUERY from TABLE_TRACKER;
BEGIN
    OPEN create_table_cursor;
    LOOP
        FETCH create_table_cursor into tableName, tableQuery;
        EXIT WHEN create_table_cursor%NOTFOUND;
            select count(*) into check_name from user_tables where TABLE_NAME=tableName;
    
            IF check_name>0 THEN
                dbms_output.put_line(tableName||' Table exists');
            ELSE
                dbms_output.put_line(tableName||' Table does not exist');
                EXECUTE IMMEDIATE tableQuery;
                dbms_output.put_line(tableName||' Table created successfully');
            END IF;
        END LOOP;
    CLOSE create_table_cursor;
END;

/

DECLARE
sequenceName varchar2(100);
sequenceQuery varchar2(5000);
check_name number;
CURSOR create_sequence_cursor IS select SEQUENCE_NAME, SEQUENCE_QUERY from SEQUENCE_TRACKER;
BEGIN
    OPEN create_sequence_cursor;
    LOOP
        FETCH create_sequence_cursor into sequenceName, sequenceQuery;
        EXIT WHEN create_sequence_cursor%NOTFOUND;
            select count(*) into check_name from user_sequences where SEQUENCE_NAME=sequenceName;
    
            IF check_name>0 THEN
                dbms_output.put_line(sequenceName||' Sequence exists');
            ELSE
                dbms_output.put_line(sequenceName||' Sequence does not exist');
                EXECUTE IMMEDIATE sequenceQuery;
                dbms_output.put_line(sequenceName||' Sequence created successfully');
            END IF;
        END LOOP;
    CLOSE create_sequence_cursor;
END;

/

DECLARE
triggerName varchar2(100);
triggerQuery varchar2(5000);
check_name number;
CURSOR create_trigger_cursor IS select TRIGGER_NAME, TRIGGER_QUERY from TRIGGER_TRACKER;
BEGIN
    OPEN create_trigger_cursor;
    LOOP
        FETCH create_trigger_cursor into triggerName, triggerQuery;
        EXIT WHEN create_trigger_cursor%NOTFOUND;
            select count(*) into check_name from user_triggers where TRIGGER_NAME=triggerName;
    
            IF check_name>0 THEN
                dbms_output.put_line(triggerName||' Trigger exists');
            ELSE
                dbms_output.put_line(triggerName||' Trigger does not exist');
                EXECUTE IMMEDIATE triggerQuery;
                dbms_output.put_line(triggerName||' Trigger created successfully');
            END IF;
        END LOOP;
    CLOSE create_trigger_cursor;
END;


/


------------------------------------
--STORED PROCEDURES TO INSERT DATA
------------------------------------

--store procedure to insert data into DELIVERY_AGENT table
create or replace procedure insert_deliveryagent_data(
agentUsername in delivery_agent.agent_username%type,
agentPassword in delivery_agent.agent_password%type,
agentRating in delivery_agent.agent_rating%type,
agentStatus in delivery_agent.agent_status%type
)
IS
BEGIN
dbms_output.put_line('entered procedure');
MERGE INTO DELIVERY_AGENT D
USING (select agentUsername as agent_username, agentPassword as agent_password , agentRating as agent_rating,agentStatus as agent_status from dual) s
ON (D.agent_username = s.agent_username)
WHEN MATCHED THEN
UPDATE SET
D.agent_password = s.agent_password,
D.agent_rating = s.agent_rating,
D.agent_status = s. agent_status
WHEN NOT MATCHED THEN
INSERT(D.agent_username,D.agent_password,D.agent_rating,D.agent_status) VALUES(s.agent_username, s.agent_password, s.agent_rating ,s.agent_status);
END insert_deliveryagent_data;

/

--stored procedure to insert data in MANAGER table
create or replace procedure insert_manager_data(
managerId in Manager.manager_id%type,
managerUsername in Manager.manager_username%type,
managerPassword in Manager.manager_password%type)
AS
BEGIN
MERGE INTO Manager m
USING (select managerId as manager_id, managerUsername as manager_username, managerPassword as manager_password from dual) s
ON (m.manager_id = s.manager_id)
WHEN MATCHED THEN
UPDATE SET
m.manager_username = s.manager_username,
m.manager_password = s.manager_password
WHEN NOT MATCHED THEN
INSERT(m.manager_username, m.manager_password) VALUES(s.manager_username, s.manager_password);
END insert_manager_data;

/

--stored procedure to insert data in RESTAURANT table
create or replace procedure insert_restaurant_data(
restaurantId in RESTAURANT.restaurant_id%type,
managerId in RESTAURANT.manager_id%type,
restaurantContact in RESTAURANT.restaurant_contact%type,
restaurantName in RESTAURANT.restaurant_name%type)
AS
BEGIN
MERGE INTO RESTAURANT r
USING (select restaurantId as restaurant_id, managerId as manager_id, restaurantContact as restaurant_contact, restaurantName as restaurant_name
from dual) s
ON (r.restaurant_id = s.restaurant_id)
WHEN MATCHED THEN
UPDATE SET
r.manager_id = s.manager_id,
r.restaurant_contact = s.restaurant_contact,
r.restaurant_name = s.restaurant_name
WHEN NOT MATCHED THEN
INSERT(r.manager_id, r.restaurant_contact, r.restaurant_name) 
VALUES(s.manager_id, s.restaurant_contact, s.restaurant_name);
END insert_restaurant_data;

/

--stored procedure to insert data into CUSTOMER table
create or replace procedure insert_customer_data(
custId in CUSTOMER.cust_id%type,
custUsername in CUSTOMER.cust_username%type,
custPassword in CUSTOMER.cust_password%type,
custFirstName in CUSTOMER.cust_first_name%type,
custLastName in CUSTOMER.cust_last_name%type,
custPhone in CUSTOMER.cust_phone_no%type,
custWalletBalance in CUSTOMER.wallet_balance%type,
custAptNumber in CUSTOMER.apt_number%type,
custZipCode in CUSTOMER.zip_code%type,
custStreet in CUSTOMER.street_name%type)
AS
BEGIN
MERGE INTO CUSTOMER c
USING (select custId as cust_id, custUsername as cust_username, custPassword as cust_password, custFirstName as cust_first_name,
custLastName as cust_last_name, custPhone as cust_phone_no, custWalletBalance as wallet_balance, custAptNumber as apt_number, 
custZipCode as zip_code, custStreet as street_name from dual) s
ON (c.cust_id = s.cust_id)
WHEN MATCHED THEN
UPDATE SET
c.cust_username = s.cust_username,
c.cust_password = s.cust_password,
c.cust_first_name = s.cust_first_name,
c.cust_last_name = s.cust_last_name,
c.cust_phone_no = s.cust_phone_no,
c.wallet_balance= s.wallet_balance,
c.apt_number= s.apt_number,
c.zip_code = s.zip_code,
c.street_name = s.street_name
WHEN NOT MATCHED THEN
INSERT(c.cust_username, c.cust_password, c.cust_first_name, c.cust_last_name, c.cust_phone_no, c.wallet_balance, c.apt_number, c.zip_code, c.street_name) 
VALUES(s.cust_username, s.cust_password, s.cust_first_name, s.cust_last_name, s.cust_phone_no, s.wallet_balance, s.apt_number, s.zip_code, s.street_name);
END insert_customer_data;

/

--stored procedure to insert data in ORDERS table
create or replace procedure insert_orders_data(
orderId in ORDERS.order_id%type,
custId in ORDERS.cust_id%type,
restaurantId in ORDERS.restaurant_id%type,
orderDate in ORDERS.order_date%type,
orderStatus in ORDERS.order_status%type,
couponName in ORDERS.coupon_name%type,
deliveryCharge in ORDERS.delivery_charge%type,
orderAmount in ORDERS.amount%type,
paymentMethod in ORDERS.payment_method%type,
paymentStatus in ORDERS.payment_status%type,
deliveryAgentName in ORDERS.delivery_agent_name%type,
deliveryServiceRating in ORDERS.delivery_service_rating%type,
restaurantServiceRating in ORDERS.restaurant_service_rating%type)
AS
BEGIN
MERGE INTO ORDERS o
USING (select orderId as order_id, custId as cust_id, restaurantId as restaurant_id, orderDate as order_date, orderStatus as order_status,
couponName as coupon_name, deliveryCharge as delivery_charge, orderAmount as amount, paymentMethod as payment_method, paymentStatus as payment_status,
deliveryAgentName as delivery_agent_name, deliveryServiceRating as delivery_service_rating, restaurantServiceRating as restaurant_service_rating from dual) s
ON (o.order_id = s.order_id)
WHEN MATCHED THEN
UPDATE SET
o.cust_id = s.cust_id,
o.restaurant_id = s.restaurant_id,
o.order_date = s.order_date,
o.order_status = s.order_status,
o.coupon_name = s.coupon_name,
o.delivery_charge = s.delivery_charge,
o.amount = s.amount,
o.payment_method = s.payment_method,
o.payment_status = s.payment_status,
o.delivery_agent_name = s.delivery_agent_name,
o.delivery_service_rating = s.delivery_service_rating,
o.restaurant_service_rating = s.restaurant_service_rating
WHEN NOT MATCHED THEN
INSERT(o.cust_id, o.restaurant_id, o.order_date, o.order_status, o.coupon_name, o.delivery_charge, o.amount, o.payment_method, o.payment_status, o.delivery_agent_name, o.delivery_service_rating, o.restaurant_service_rating) 
VALUES(s.cust_id, s.restaurant_id, s.order_date, s.order_status, s.coupon_name, s.delivery_charge, s.amount, s.payment_method, s.payment_status, s.delivery_agent_name, s.delivery_service_rating, s.restaurant_service_rating);
END insert_orders_data;

/

--store procedure to insert data into MENU table
create or replace procedure insert_menu_data(
restaurantID in menu.restaurant_id%type,
dishName in menu.dish_name%type,
dishStatus in menu.dish_status%type,
dishRating in menu.dish_rating%type,
dishPrice in menu.price%type,
dishCategory in menu.dish_category%type
)
IS
BEGIN
dbms_output.put_line('entered procedure');
MERGE INTO MENU D
USING (select restaurantID as restaurant_id, dishName as dish_name , dishStatus as dish_status,dishRating as dish_rating , dishPrice as price , dishCategory as dish_category from dual) s
ON (D.dish_name = s.dish_name)
WHEN MATCHED THEN
UPDATE SET
D.restaurant_id = s.restaurant_id,
D.dish_status = s.dish_status,
D.dish_rating = s.dish_rating,
D.price = s.price,
D.dish_category=s.dish_category
WHEN NOT MATCHED THEN
INSERT(D.restaurant_id,D.dish_name,D.dish_status,D.dish_rating ,D.price, D.dish_category) VALUES(s.restaurant_id,s.dish_name,s.dish_status,s.dish_rating ,s.price, s.dish_category);
END insert_menu_data;

/

--store procedure to insert data into CART table
create or replace procedure insert_cart_data(
orderID in cart.order_id%type,
custID in cart.cust_id%type,
restaurant_ID in cart.restaurant_id%type,
dish_ID in cart.dish_id%type,
dish_Rating in cart.dish_rating%type,
unit_Price in cart.unit_price%type,
quantityValue in cart.quantity%type
)
IS
BEGIN
dbms_output.put_line('entered proc');
MERGE INTO CART C
USING (select orderID as order_id, custID as cust_id , restaurant_ID as restaurant_id,dish_ID as dish_id, dish_Rating as dish_rating , unit_Price as unit_price ,quantityValue as quantity from dual) s
ON (C.order_id = s.order_id and C.dish_id = s.dish_id)
WHEN MATCHED THEN
UPDATE SET
C.cust_id = s.cust_id,
C.restaurant_id = s.restaurant_id,
C.dish_rating = s.dish_rating,
C.unit_price = s.unit_price,
C.quantity = s.quantity
WHEN NOT MATCHED THEN
INSERT(C.order_id,C.cust_id,C.restaurant_id,C.dish_id,C.dish_rating,C.unit_price,C.quantity) VALUES( s.order_id, s.cust_id, s.restaurant_id , s.dish_id,s.dish_rating,s.unit_price,s.quantity);
END insert_cart_data;

/

--store procedure to insert data into DELIVERY table
create or replace procedure insert_delivery_data(
orderID in delivery.order_id%type,
restaurantID in delivery.restaurant_id%type,
custID in delivery.cust_id%type,
agentID in delivery.agent_id%type,
deliveryStatus in delivery.delivery_status%type
)
IS
BEGIN
dbms_output.put_line('entered procedure');
MERGE INTO DELIVERY D
USING (select orderID as order_id, restaurantID as restaurant_id, custID as cust_id , agentID as agent_id,deliveryStatus as delivery_status from dual) s
ON (D.order_id = s.order_id)
WHEN MATCHED THEN
UPDATE SET
D.restaurant_id = s.restaurant_id,
D.cust_id = s.cust_id,
D.agent_id = s.agent_id,
D.delivery_status = s.delivery_status
WHEN NOT MATCHED THEN
INSERT(D.order_id, D.restaurant_id,D.cust_id,D.agent_id,D.delivery_status) VALUES(s.order_id, s.restaurant_id, s.cust_id, s.agent_id ,s.delivery_status);
END insert_delivery_data;

/

--store procedure to insert data into COUPON table
create or replace procedure insert_coupon_data(
couponName in Coupon.coupon_name%type,
lowerRange in Coupon.lower_range%type,
upperRange in Coupon.upper_range%type,
activityStatus in Coupon.activity_status%type,
discountValue in coupon.discount%type
)
IS
BEGIN
dbms_output.put_line('entered proc');
MERGE INTO COUPON C
USING (select couponName as coupon_name, lowerRange as lower_range , upperRange as upper_range,activityStatus as activity_status, discountValue as discount from dual) s
ON (C.coupon_name = s.coupon_name)
WHEN MATCHED THEN
UPDATE SET
C.lower_range = s.lower_range,
C.upper_range = s.upper_range,
C.activity_status = s. activity_status,
C.discount = s.discount
WHEN NOT MATCHED THEN
INSERT(C.coupon_name,C.lower_range,C.upper_range,C.activity_status,C.discount) VALUES( s.coupon_name, s.lower_range, s.upper_range , s.activity_status,s.discount);
END insert_coupon_data;

/

----------------------------
--REPORTS & VIEWS
----------------------------

CREATE OR REPLACE VIEW vw_dish_sales AS
SELECT m.restaurant_id,
(select restaurant_name from restaurant where restaurant_id=m.restaurant_id) as RESTAURANT_NAME,
m.dish_id,m.dish_name  as DISH_NAME,m.dish_category, COALESCE(SUM(c.Quantity),0) AS Sales_Qty,(COALESCE(SUM(c.Unit_Price * c.Quantity),0)||' $') AS Sales_amount
FROM orders o
JOIN cart c
ON o.order_id = c.order_id and o.order_status IN ('Delivered')
RIGHT JOIN menu m
ON m.restaurant_id=o.restaurant_id AND c.dish_id = m.dish_id
GROUP BY m.dish_id, m.restaurant_id, m.dish_name,m.dish_category
order by m.restaurant_id,m.dish_id;

/

CREATE OR REPLACE VIEW vw_top_10_dishes AS
SELECT * FROM(
SELECT restaurant_id,restaurant_name,dish_id,dish_name,dish_category,sales_qty,(sales_amount || ' $') AS sales_amount, dense_rank() over(partition by restaurant_id order by sales_amount desc) as dish_rank 
FROM(SELECT m.restaurant_id,
(SELECT restaurant_name from restaurant where restaurant_id=m.restaurant_id) as RESTAURANT_NAME,
m.dish_id,
m.dish_name  as DISH_NAME,
m.dish_category, 
COALESCE(SUM(c.Quantity),0) AS Sales_Qty,
(COALESCE(SUM(c.Unit_Price * c.Quantity),0)) AS Sales_amount
FROM orders o
JOIN cart c
ON o.order_id = c.order_id and o.order_status IN ('Delivered')
RIGHT JOIN menu m
ON m.restaurant_id=o.restaurant_id AND c.dish_id = m.dish_id
GROUP BY m.dish_id, m.restaurant_id, m.dish_name,m.dish_category))
WHERE dish_rank<11 AND sales_qty<>0;

/

CREATE OR REPLACE VIEW vw_top_10_customers AS
SELECT * FROM(
SELECT c.cust_id, DENSE_RANK() OVER(ORDER BY COUNT(o.order_id) DESC) AS Cust_Rank,c.cust_first_name, c.cust_last_name, COUNT(o.order_id) AS number_of_orders, (sum(amount)||' $') as sales_amount
FROM customer c
JOIN orders o
ON c.cust_id = o.cust_id and o.order_status='Delivered'
GROUP BY c.cust_id, c.cust_first_name, c.cust_last_name);

/

CREATE OR REPLACE VIEW vw_monthly_sales AS
SELECT restaurant_id,
(select restaurant_name from restaurant where restaurant_id=orders.restaurant_id) Restuarant_Name,
TO_CHAR(ORDER_DATE,'MM-YY') AS Month, 
(SUM(amount)||' $') AS Sales,
count(restaurant_id) as total_orders 
FROM orders 
where order_status='Delivered'
GROUP BY TO_CHAR(ORDER_DATE,'MM-YY'), restaurant_id
order by TO_CHAR(ORDER_DATE,'MM-YY');

/

CREATE OR REPLACE VIEW vw_top_delivery_person AS
SELECT agent_id, agent_name, average_rating, total_orders_delivered, AGENT_RANK FROM(
SELECT d.agent_id, (select agent_username from delivery_agent where agent_id=d.agent_id) as Agent_Name,
ROUND(AVG(o.delivery_service_rating),2) AS Average_Rating,
(select count(delivery_agent_name) from orders where delivery_agent_name=(select agent_username from delivery_agent where agent_id=d.agent_id))Total_orders_delivered,
DENSE_RANK() over(order by ROUND(AVG(o.delivery_service_rating),2) DESC) as AGENT_RANK
FROM delivery d
JOIN orders o
ON d.order_id = o.order_id and o.order_status='Delivered'
GROUP BY d.agent_id)
WHERE AGENT_RANK=1
ORDER BY total_orders_delivered desc;

/

CREATE OR REPLACE VIEW vw_delivery_agent_ratings AS
select agent_id, agent_username, agent_rating,
(select count(agent_id) from delivery where agent_id=delivery_agent.agent_id and delivery_status='Delivered') as delivery_count
from delivery_agent;

/

CREATE OR REPLACE VIEW vw_restaurant_service_ratings AS
SELECT r.restaurant_id, r.RESTAURANT_NAME, ROUND(AVG(o.RESTAURANT_SERVICE_RATING),2) AS Average_service_rating
FROM orders o
JOIN RESTAURANT r
ON r.restaurant_id = o.restaurant_id and o.order_status='Delivered'
GROUP BY r.RESTAURANT_ID, r.restaurant_name;

/

CREATE OR REPLACE VIEW vw_menu AS
SELECT * FROM MENU;

/

CREATE OR REPLACE VIEW vw_coupons AS
SELECT coupon_name, lower_range, upper_range
From coupon
Where activity_status = 'ACTIVE';

/

CREATE OR REPLACE VIEW vw_restaurants AS
SELECT *
FROM restaurant;

/

CREATE OR REPLACE VIEW vw_cancelled_orders AS
SELECT cust_id, order_id, amount, to_char(order_date, 'DD-MON-YY') as order_date, payment_method, payment_status, order_status
FROM orders
WHERE order_status = 'Cancelled';

/

CREATE OR REPLACE VIEW vw_all_orders AS
SELECT order_id,cust_id,  restaurant_id, amount, payment_method, payment_status, order_date, order_status, delivery_agent_name
FROM orders
WHERE order_status NOT IN ('N/A');

/

CREATE OR REPLACE VIEW vw_customer_order_address AS
SELECT CUST_ID, CUST_FIRST_NAME, CUST_LAST_NAME, 
(STREET_NAME || ', '|| ZIP_CODE || ', ' || APT_NUMBER) AS ADDRESS
FROM CUSTOMER;

/

CREATE OR REPLACE VIEW vw_delivery_agent_status AS
SELECT agent_id, agent_username, agent_status
FROM delivery_agent;

/

CREATE OR REPLACE VIEW vw_completed_orders AS
SELECT *
FROM orders
WHERE order_status = 'Delivered';

/

CREATE OR REPLACE VIEW vw_active_orders AS
SELECT *
FROM orders
WHERE order_status IN ('Placed Successfully','Confirmed','Preparing','Out for delivery','Delay In Delivery');

