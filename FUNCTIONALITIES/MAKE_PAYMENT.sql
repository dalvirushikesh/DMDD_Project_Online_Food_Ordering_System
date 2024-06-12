create or replace PROCEDURE make_payment(orderId IN Orders.order_id%TYPE, mode_of_payment Orders.payment_method%TYPE)
IS
order_id_does_not_exist EXCEPTION;
order_id_null EXCEPTION;
payment_already_done EXCEPTION;
insufficient_wallet_balance EXCEPTION;
invalid_mode_of_payment EXCEPTION;
o_id number;
walletBalance decimal(10,2);
order_amount decimal(10,2);
pay_status varchar(20);
custId number;
cust_username_count number;
BEGIN
 select count(*) into o_id from orders where order_id=OrderId;
 IF o_id=0 then
    raise order_id_does_not_exist;
 ELSE
    select payment_status into pay_status from Orders where order_id=orderId;
    if pay_status='PAID' THEN
        raise payment_already_done;
    else
        calculate_bill(orderId);
        if mode_of_payment='WALLET' then
            select cust_id into custId from Orders where order_id=orderId;
            select wallet_balance into walletBalance from customer where cust_id=custId;
            select amount into order_amount from orders where order_id=orderId;
            if walletBalance>=order_amount then
                walletBalance:=walletBalance-order_amount;
                update customer set wallet_balance=walletBalance where cust_id=custId;
                update orders set payment_method='WALLET', payment_status='PAID', order_status='PLACED SUCCESSFULLY' where order_id=orderId;               
            else
                raise insufficient_wallet_balance;
            end if;
        elsif mode_of_payment in ('CREDIT CARD', 'DEBIT CARD') then
            update orders set payment_method='WALLET', payment_status='PAID', order_status='PLACED SUCCESSFULLY' where order_id=orderId;
        else
            raise invalid_mode_of_payment;
        end if;
    end if;
 END IF;
 EXCEPTION
 WHEN order_id_does_not_exist THEN
    raise_application_error(-20083, 'ORDER ID DOES NOT EXIST!');
 when payment_already_done then
    raise_application_error(-20084, 'PAYMENT ALREADY DONE FOR THIS ORDER');
 when insufficient_wallet_balance then
    raise_application_error(-20085, 'WALLET BALANCE NOT SUFFICIENT! TRY ANOTHER MODE OF PAYMENT');
 when invalid_mode_of_payment then
    raise_application_error(-20085, 'INAVLID MODE OF PAYMENT. SELECT FROM FOLLOWING (WALLET, CREDIT CARD, DEBIT CARD)');
END make_payment;
