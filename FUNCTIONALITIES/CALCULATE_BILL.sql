create or replace PROCEDURE calculate_bill(orderId in ORDERS.order_id%TYPE)
IS
temp_order_cost DECIMAL(10,2):=0;
temp_dish_cost DECIMAL(10,2);
dish_name VARCHAR(30);
orderStatus VARCHAR(20);
dish_price DECIMAL(10,2);
dish_quantity NUMBER;
DELIVERY_CHARGE NUMBER;
COUPON VARCHAR(30);
DISCOUNT DECIMAL(10,2);
COUPON_DISCOUNT DECIMAL(10,2);
TAX DECIMAL(10,2);
order_count NUMBER;
order_id_does_not_exist EXCEPTION;
CURSOR calculate_bill_cursor IS SELECT b.dish_name, a.unit_price, a.quantity FROM cart a, menu b WHERE
a.dish_id=b.dish_id AND a.order_id=orderId;

BEGIN
    SELECT order_status INTO orderStatus FROM orders WHERE order_id=orderId;
    SELECT COUPON_NAME INTO COUPON FROM ORDERS WHERE ORDER_ID=orderId;
    OPEN calculate_bill_cursor;
        LOOP
            FETCH calculate_bill_cursor INTO  dish_name, dish_price, dish_quantity;
            EXIT WHEN calculate_bill_cursor%NOTFOUND;
            temp_dish_cost:=dish_price*dish_quantity;
            temp_order_cost:=temp_order_cost+temp_dish_cost;
        END LOOP;
    CLOSE calculate_bill_cursor;
    TAX:=temp_order_cost*0.01;
    temp_order_cost:=temp_order_cost+TAX;

    IF COUPON!='N/A' THEN
        SELECT DISCOUNT INTO DISCOUNT FROM COUPON WHERE COUPON_NAME=COUPON AND ACTIVITY_STATUS='ACTIVE';
        COUPON_DISCOUNT:=DISCOUNT*temp_order_cost;
        temp_order_cost:=temp_order_cost-COUPON_DISCOUNT;
    ELSE
        COUPON_DISCOUNT:=0;
    END IF;

    IF temp_order_cost>10 THEN
        DELIVERY_CHARGE:=0;
	  update orders set delivery_charge=0 where order_id=orderId;
    ELSE
        DELIVERY_CHARGE:=2;
        temp_order_cost:=temp_order_cost+DELIVERY_CHARGE;
    END IF;

    UPDATE orders SET amount=temp_order_cost WHERE order_id=OrderId;

END calculate_bill;