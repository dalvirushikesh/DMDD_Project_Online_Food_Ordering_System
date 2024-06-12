--even dishes with 0 sales should be present in table
CREATE VIEW vw_dish_sales AS
SELECT o.restaurant_id,
(select restaurant_name from restaurant where restaurant_id=o.restaurant_id) as RESTAURANT_NAME,
c.dish_id,
(select dish_name from menu where dish_id=c.dish_id) as DISH_NAME,
(select dish_category from menu where dish_id=c.dish_id) as dish_category,
SUM(c.Quantity) AS Sales_Qty,
(SUM(c.Unit_Price * c.Quantity)||' $') AS Sales_amount
FROM orders o
JOIN cart c
ON o.order_id = c.order_id and o.order_status IN ('Delivered')
GROUP BY c.dish_id, o.restaurant_id
order by c.dish_id;

--select * from cart where dish_id=2;

--looks good. should we include sales? because sales also includes tax n discounts n all so
CREATE VIEW vw_top_10_dishes AS
SELECT * FROM(
SELECT  o.restaurant_id,
(select restaurant_name from restaurant where restaurant_id=o.restaurant_id) as RESTAURANT_NAME,
c.dish_id,(select dish_name from menu where dish_id=c.dish_id) as DISH_NAME,
(select dish_category from menu where dish_id=c.dish_id) as dish_category,
(SUM(c.Unit_Price * c.Quantity)||' $') AS Sales_amount, SUM(c.Quantity) AS Sales_Qty
FROM orders o
JOIN cart c
ON o.order_id = c.order_id
WHERE order_status IN ('Delivered')
GROUP BY c.dish_id, o.restaurant_id
ORDER BY Sales_amount DESC, Sales_Qty DESC )
WHERE ROWNUM<=10;

 
--can you add rank field as well to this view?
CREATE VIEW vw_top_10_customers AS
SELECT * FROM(
SELECT c.cust_id, c.cust_first_name, c.cust_last_name, COUNT(o.order_id) AS number_of_orders, (sum(amount)||' $') as sales_amount
FROM customer c
JOIN orders o
ON c.cust_id = o.cust_id and o.order_status='Delivered'
GROUP BY c.cust_id, c.cust_first_name, c.cust_last_name
ORDER BY number_of_orders DESC, sales_amount desc)
WHERE ROWNUM<=10;

--select * from orders where order_status='Delivered';

--looks good
CREATE VIEW vw_monthly_sales AS
SELECT restaurant_id,
(select restaurant_name from restaurant where restaurant_id=orders.restaurant_id) Restuarant_Name,
TO_CHAR(ORDER_DATE,'MM-YYYY') AS Month, 
(SUM(amount)||' $') AS Sales,
count(restaurant_id) as total_orders 
FROM orders 
where order_status='Delivered'
GROUP BY TO_CHAR(ORDER_DATE,'MM-YYYY'), restaurant_id
order by TO_CHAR(ORDER_DATE,'MM-YYYY');


--looks good
CREATE VIEW vw_top_delivery_person AS
SELECT * FROM(
SELECT d.agent_id, (select agent_username from delivery_agent where agent_id=d.agent_id) as Agent_Name,
ROUND(AVG(o.delivery_service_rating),2) AS Average_Rating,
(select count(delivery_agent_name) from orders where delivery_agent_name=(select agent_username from delivery_agent where agent_id=d.agent_id))Total_orders_delivered,
DENSE_RANK() over(PARTITION BY d.agent_id order by ROUND(AVG(o.delivery_service_rating),2) DESC) as AGENT_RANK
FROM delivery d
JOIN orders o
ON d.order_id = o.order_id and o.order_status='Delivered'
GROUP BY d.agent_id)
WHERE AGENT_RANK=1;


--view not required. we can have direct view on delivery_agent table. review new view given below
CREATE VIEW vw_delivery_agent_ratings AS
select agent_id, agent_username, agent_rating,
(select count(agent_id) from delivery where agent_id=delivery_agent.agent_id and delivery_status='Delivered') as delivery_count
from delivery_agent;

--SELECT d.agent_id, (select agent_username from delivery_agent where agent_id=d.agent_id) as Agent_Name,
--(ROUND(AVG(o.delivery_service_rating),2)) AS Average_Rating
--FROM delivery d
--JOIN orders o
--ON d.order_id = o.order_id and o.order_status='Delivered'
--GROUP BY d.agent_id;

--select * from delivery;

--looks good
CREATE VIEW vw_restaurant_service_ratings AS
SELECT r.restaurant_id, r.RESTAURANT_NAME, ROUND(AVG(o.RESTAURANT_SERVICE_RATING),2) AS Average_service_rating
FROM orders o
JOIN RESTAURANT r
ON r.restaurant_id = o.restaurant_id and o.order_status='Delivered'
GROUP BY r.RESTAURANT_ID, r.restaurant_name;
--select * from orders;

--looks good
CREATE VIEW vw_menu AS
SELECT * FROM MENU;


--looks good
CREATE VIEW vw_coupons AS
SELECT coupon_name, lower_range, upper_range
From coupon
Where activity_status = 'Active';


--looks good
CREATE VIEW vw_restaurants AS
SELECT *
FROM restaurant;


--looks good
CREATE VIEW vw_cancelled_orders AS
SELECT cust_id, order_id, amount, to_char(order_date, 'DD-MON-YYYY') as order_date, payment_method, payment_status, order_status
FROM orders
WHERE order_status = 'Cancelled';


--looks good
CREATE VIEW vw_all_orders AS
SELECT * FROM orders;


--looks good
CREATE VIEW vw_customer_order_address AS
SELECT CUST_ID, CUST_FIRST_NAME, CUST_LAST_NAME, 
(STREET_NAME || ', '|| ZIP_CODE || ', ' || APT_NUMBER) AS ADDRESS--,CONCAT(APT_NUMBER, ZIP_CODE, STREET_NAME) AS ADDRESS
FROM CUSTOMER;


--looks good
CREATE VIEW vw_delivery_agent_status AS
SELECT agent_id, agent_username, agent_status
FROM delivery_agent;

select * from delivery_agent;


--need to discuss on this one
CREATE VIEW vw_completed_orders AS
SELECT *
--cust_id, order_id, restaurant_id, amount, payment_method, payment_status, to_char(order_date,'DD-MM-YYYY'), order_status, delivery_agent_name
FROM orders
WHERE order_status = 'Delivered';


--looks good
CREATE VIEW vw_active_orders AS
SELECT cust_id, order_id, restaurant_id, amount, payment_method, payment_status, order_date, order_status, delivery_agent_name
FROM orders
WHERE order_status IN ('N/A','Placed Successfully','Confirmed','Preparing','Out for delivery','Delay In Delivery');