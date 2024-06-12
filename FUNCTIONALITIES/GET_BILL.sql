CREATE OR REPLACE PROCEDURE get_bill(orderId in ORDERS.order_id%TYPE)
IS
temp_order_cost decimal(10,2):=0;
temp_dish_cost decimal(10,2);
dish_name VARCHAR(30);
dish_price DECIMAL(10,2);
dish_quantity NUMBER;
DELIVERY_CHARGE NUMBER;
COUPON VARCHAR(30);
DISCOUNT DECIMAL(10,2);
COUPON_DISCOUNT DECIMAL(10,2);
TAX DECIMAL(10,2);
CURSOR bill_cursor IS SELECT b.dish_name, a.unit_price, a.quantity from cart a, menu b where
a.dish_id=b.dish_id and a.order_id=orderId;

BEGIN
SELECT COUPON_NAME INTO COUPON FROM ORDERS WHERE ORDER_ID=orderId;
DBMS_OUTPUT.PUT_LINE('---------------------------------------------------------------');
DBMS_OUTPUT.PUT_LINE(RPAD('DISH',25) || ' | ' || RPAD('UNIT PRICE',10) || ' | ' || RPAD('QUANTITY',8)|| ' | ' || 'DISH_TOTAL');
DBMS_OUTPUT.PUT_LINE('---------------------------------------------------------------');
OPEN bill_cursor;
LOOP
FETCH bill_cursor INTO  dish_name, dish_price, dish_quantity;
EXIT WHEN bill_cursor%NOTFOUND;
temp_dish_cost:=dish_price*dish_quantity;
temp_order_cost:=temp_order_cost+temp_dish_cost;
DBMS_OUTPUT.PUT_LINE(RPAD(dish_name,25) || ' | ' || RPAD(dish_price,10) || ' | ' || RPAD(dish_quantity,8) || ' | ' ||  temp_dish_cost);
END LOOP;
DBMS_OUTPUT.PUT_LINE('---------------------------------------------------------------');

CLOSE bill_cursor;
DBMS_OUTPUT.PUT_LINE(RPAD(' ',43) || 'TOTAL  | ' || temp_order_cost||' $');
DBMS_OUTPUT.PUT_LINE('---------------------------------------------------------------');

TAX:=temp_order_cost*0.01;
temp_order_cost:=temp_order_cost+tax;

IF COUPON!='N/A' THEN
SELECT DISCOUNT INTO DISCOUNT FROM COUPON WHERE COUPON_NAME=COUPON AND ACTIVITY_STATUS='ACTIVE';
COUPON_DISCOUNT:=DISCOUNT*temp_order_cost;
temp_order_cost:=temp_order_cost-COUPON_DISCOUNT;
ELSE
COUPON_DISCOUNT:=0;
END IF;

IF temp_order_cost>10 THEN
DELIVERY_CHARGE:=0;
ELSE
DELIVERY_CHARGE:=2;
temp_order_cost:=temp_order_cost+DELIVERY_CHARGE;
END IF;


DBMS_OUTPUT.PUT_LINE(RPAD(' ', 34)||'COUPON APPLIED  | -' || COUPON_DISCOUNT||' $');
DBMS_OUTPUT.PUT_LINE(RPAD(' ', 34)||'DELIVERY CHARGE | +' || DELIVERY_CHARGE||' $');
DBMS_OUTPUT.PUT_LINE(RPAD(' ', 34)||'TAX             | +' || TAX||' $');
DBMS_OUTPUT.PUT_LINE('---------------------------------------------------------------');
DBMS_OUTPUT.PUT_LINE(RPAD(' ', 34)||'TOTAL BILL      |  ' || temp_order_cost||' $');

END get_bill;
