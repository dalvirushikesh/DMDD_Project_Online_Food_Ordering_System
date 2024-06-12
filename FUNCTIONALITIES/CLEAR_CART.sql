-- check order id for cust id
-- check order status na
-- if na then proceed
-- if dishes exist then only clear
SET SERVEROUTPUT ON;
CREATE OR REPLACE PROCEDURE CLEAR_CART(ORDID IN NUMBER, CUSTID IN NUMBER) IS
ORDID_TEMP NUMBER;
orderid_null EXCEPTION;
custid_null EXCEPTION;
OSTAT VARCHAR(30);
no_edit_cart EXCEPTION;
CART_COUNT NUMBER;
no_items EXCEPTION;
incorrect_oid EXCEPTION;
BEGIN
    SELECT COUNT(ORDER_ID) INTO ORDID_TEMP FROM ORDERS WHERE CUST_ID=CUSTID AND ORDER_ID=ORDID;
    IF ORDID IS NULL THEN
        RAISE orderid_null;
    ELSIF CUSTID IS NULL THEN
        RAISE custid_null;
    ELSE
        IF ORDID_TEMP>0 THEN
            SELECT ORDER_STATUS INTO OSTAT FROM ORDERS WHERE CUST_ID=CUSTID AND ORDER_ID=ORDID;
            IF ostat != 'N/A' THEN
                RAISE no_edit_cart;
            ELSE
                SELECT COUNT(*) INTO CART_COUNT FROM CART WHERE ORDER_ID=ORDID AND CUST_ID=CUSTID;
                IF CART_COUNT = 0 THEN
                    RAISE no_items;
                ELSE
                    DELETE FROM CART WHERE ORDER_ID=ORDID;
                    DBMS_OUTPUT.PUT_LINE('Cart cleared sucessfully!');
                END IF;
            END IF;
        ELSE    
            RAISE incorrect_oid;
        END IF;  
    END IF;
EXCEPTION
WHEN orderid_null
THEN
    raise_application_error(-20091,'ORDER ID cannot be null.');
WHEN custid_null
THEN
    raise_application_error(-20091,'CUSTOMER ID cannot be null.');
WHEN no_edit_cart
THEN 
    raise_application_error(-20091,'Cart cannot be emptied for this order.');
WHEN no_items
THEN 
    raise_application_error(-20091,'There are no items for this order in your cart.');
WHEN incorrect_oid
THEN
    raise_application_error(-20091,'This ORDER ID is incorrect. Please enter valid ORDER ID.');
END;

