create or replace procedure restaurant_service_feedback(custId in VARCHAR2, orderId in VARCHAR2, rating in VARCHAR2)
as
O VARCHAR2(100);
C VARCHAR2(100);
R VARCHAR2(100);
check_rating number;
restId number;
orderStatus varchar2(30);
temp_count number;
wrong_input EXCEPTION;
input_null exception;
rating_not_in_range exception;
cannot_give_rating_now exception;
rating_already_given exception;
not_number exception;
begin
O:=numberCheck(orderId);
C:=numberCheck(custId);
R:=numberCheck(rating);
if (orderId=null or custId=null OR RATING=NULL) then
    raise input_null;
ELSIF (O=1 or C=1 or R=1) then
    raise not_number;
else
    select count(*) into temp_count from orders where order_id=orderid and cust_id=custId;
    if temp_count>0 then
        select order_status, restaurant_id, restaurant_service_rating into orderStatus, restId, check_rating from orders where order_id=orderId;
        if check_rating=0 then
            if orderStatus='Delivered' then
                if (rating>=0 and rating<6) then
                    update orders set restaurant_service_rating=rating where order_id=orderId;
--                    select avg(restaurant_service_rating) into r_rating from orders where order_status='Delivered' and restaurant_id=restId group by restaurant_id;

                else
                    raise rating_not_in_range;
                end if;
            else
                raise cannot_give_rating_now;
            end if;
        else
            raise rating_already_given;
        end if;
    else
        raise wrong_input;
    end if;
end if;
exception
when rating_not_in_range then
raise_application_error(-20191, 'PLEASE ENTER NUMBER INPUT IN RANGE 1 TO 5');
when cannot_give_rating_now then
raise_application_error(-20192, 'YOU CAN PROVIDE RATING ONLY AFTER ORDER IS DELIVERED!');
when wrong_input then
raise_application_error(-20193, 'EITHER ORDER_ID OR CUST_ID IS WRONG!');
when input_null then
raise_application_error(-20194, 'INPUT CANNOT BE NULL! PLEASE ENTER CORRECT ORDER_ID AND CUST_ID');
when rating_already_given then
raise_application_error(-20195, 'RATING FOR THIS ORDER_ID IS ALREADY GIVEN');
when not_number then
raise_application_error(-20199, 'ORDER_ID, CUST_ID, RATING SHOULD BE A NUMBER INPUT');
END;

