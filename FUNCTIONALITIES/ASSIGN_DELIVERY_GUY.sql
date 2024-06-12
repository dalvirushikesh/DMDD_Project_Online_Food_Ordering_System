create or replace procedure assign_delivery_guy(managerId in Manager.manager_id%type, orderId in Orders.order_id%type)
is
o_count number;
delivery_check varchar2(30);
manager_check number;
agentId number;
agentName varchar(30);
agentCount number;
order_check varchar2(30);
restaurantId number;
custId number;
invalid_order_id exception;
order_id_null exception;
wrong_manager exception;
delivery_cannot_be_assigned_now exception;
delivery_guy_already_assigned exception;
order_not_placed_yet exception;
no_agent_available exception;
begin

IF orderId=null then
    raise order_id_null;
ELSE
    select count(*) into o_count from orders where order_id=orderId;
    if (o_count=0) then
        raise invalid_order_id;
    else
        select manager_id into manager_check from restaurant where restaurant_id in(select restaurant_id from orders where order_id=orderId);
        if manager_check=managerId then
            select delivery_agent_name into delivery_check from orders where order_id=orderId;
            if delivery_check='N/A' then
                --assign guy
                select order_status into order_check from orders where order_id=orderId;
                if order_check='N/A' then
                    raise order_not_placed_yet;
                elsif initcap(order_check) in ('Placed Successfully', 'Confirmed', 'Delivered', 'Out For Delivery', 'Cancelled', 'Refunded') then
                    raise delivery_cannot_be_assigned_now;
                elsif initcap(order_check) in ('Preparing', 'Delay In Delivery') then
                    select count(*) into agentCount from delivery_agent where agent_status='AVAILABLE';
                    if agentCount>0 then
                        select agent_id into agentId from delivery_agent where agent_status='AVAILABLE' fetch first 1 row only;
                        select agent_username into agentName from delivery_agent where agent_id=agentId;
                        update delivery_agent set agent_status='NOT AVAILABLE' where agent_id=agentId;
                        update orders set delivery_agent_name=agentName where order_id=orderId;
                        select restaurant_id, cust_id into restaurantId, custId from orders where order_id=orderId;
                        insert_delivery_data(orderId, restaurantId, custId, agentId,'N/A');
--                        merge into delivery d
--                        using orders o
--                        on(d.order_id = orderId)
--                        when matched then
--                        update set
--                        d.restaurant_id=o.restaurant_id,
--                        d.cust_id=o.cust_id,
--                        d.agent_id=agentId
--                        when not matched then
--                        insert values(orderId, o.restaurant_id, o.cust_id, agentId, 'N/A');
                    else
                        raise no_agent_available;
                    end if;
                end if;
            else
                raise delivery_guy_already_assigned;
            end if;

        else
            raise wrong_manager;
        end if;
    end if;
end if;
exception
when invalid_order_id then
raise_application_error(-20099, 'PLEASE RE-ENTER ORDERID. THIS ORDERID DOES NOT EXIST');
when order_id_null then
raise_application_error(-20001, 'PLEASE RE-ENTER ORDERID. ORDERID CANNOT BE NULL');
when order_not_placed_yet then
raise_application_error(-20092, 'ORDER IS NOT YET PLACED. CANNOT ASSIGN DELIVERY AGENT TO THIS ORDER ID');
when delivery_cannot_be_assigned_now then
raise_application_error(-20093, 'ORDER STATUS SHOULD BE PREPARING OR DELAY IN DELIVERY TO ASSIGN DELIVERY AGENT');
when no_agent_available then
raise_application_error(-20094, 'NO DELIVERY AGENT AVAILABLE AT THE MOMENT');
WHEN delivery_guy_already_assigned THEN
raise_application_error(-20098,'DELIVERY GUY ALREADY ASSIGNED TO THIS ORDER. RE-ENTER CORRECT ORDERID');
WHEN wrong_manager THEN
raise_application_error(-20096,'INCORRECT MANAGER ID');
END;