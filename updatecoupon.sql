--store procedure for update coupon b manager 

CREATE or REPLACE PROCEDURE update_coupon(
COUPONID IN coupon.coupon_id%TYPE,
COUPONNAME IN coupon.coupon_name%TYPE,
LOWERRANGE IN coupon.lower_range%TYPE,
UPPERRANGE IN coupon.upper_range%TYPE,
ACTIVITYSTATUS IN  coupon.activity_status%TYPE,
DISCOUNTVALUE IN coupon.discount%TYPE
)

IS

invalid_couponid EXCEPTION;
invalid_couponname EXCEPTION;

BEGIN

IF COUPONID is null THEN
    RAISE invalid_couponid; 
    
 ELSE IF  COUPONNAME is null THEN
    RAISE invalid_couponname; 
 
 ELSE    
MERGE INTO COUPON C
USING (select COUPONID as coupon_id, COUPONNAME as coupon_name, LOWERRANGE as lower_range , 
UPPERRANGE as upper_range, ACTIVITYSTATUS as activity_status, DISCOUNTVALUE as discount from dual) s

ON(C.coupon_id= s.coupon_id)
WHEN MATCHED THEN
UPDATE SET
 C.coupon_name =s.coupon_name,
 C.lower_range =s.lower_range,
 C.upper_range =s.upper_range,
 C.activity_status =s.activity_status,
 C.discount =s.discount

WHEN NOT MATCHED THEN
INSERT( C.coupon_name, C.lower_range, C.upper_range,C.activity_status,
 C.discount)
VALUES (s.coupon_name, s.lower_range, s.upper_range,s.activity_status,
 s.discount);
 END IF;
END IF;

 EXCEPTION 
 WHEN invalid_couponid THEN 
    raise_application_error (-20091,'couponID cannot be null !!!'); 
    
WHEN invalid_couponname THEN 
    raise_application_error (-20091,'coupon name cannot be null !!!'); 
    
    
 
END update_coupon;

--execute statement for update coupon by manager 

execute update_coupon(1,null,10,50,'Active',0.4);


