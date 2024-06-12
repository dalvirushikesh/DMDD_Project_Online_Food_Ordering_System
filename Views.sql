CREATE VIEW vw_dish_sales AS
SELECT c.dish_id, SUM(c.Unit_Price * c.Quantity) AS sales
FROM orders o
RIGHT JOIN cart c
ON o.order_id = c.order_id
WHERE o.order_status IN ('Delivered')
GROUP BY c.dish_id;
CREATE VIEW vw_top_10_dishes AS
SELECT * FROM(
SELECT c.dish_id, SUM(c.Unit_Price * c.Quantity) AS sales
FROM orders o
JOIN cart c
ON o.order_id = c.order_id
WHERE order_status IN ('Delivered')
GROUP BY c.dish_id
ORDER BY sales DESC)
WHERE ROWNUM<=10;CREATE VIEW vw_top_10_customers AS
SELECT * FROM(
SELECT c.cust_id, c.cust_first_name, c.cust_last_name, COUNT(o.order_id) AS num_orders
FROM customer c
JOIN orders o
ON c.cust_id = o.cust_id
GROUP BY c.cust_id, c.cust_first_name, c.cust_last_name
ORDER BY num_orders DESC)
WHERE ROWNUM<=10;CREATE VIEW vw_monthly_sales AS
SELECT TO_CHAR(ORDER_DATE,'mm-yyyy') AS Month, SUM(amount) AS Sales
FROM orders
GROUP BY TO_CHAR(ORDER_DATE,'mm-yyyy');CREATE VIEW vw_top_delivery_person AS
SELECT agent_id, avg_rating FROM(
SELECT d.agent_id, ROUND(AVG(o.delivery_service_rating),2) AS avg_rating, DENSE_RANK() over(PARTITION BY d.agent_id order by ROUND(AVG(o.delivery_service_rating),2) DESC) as rnk
FROM delivery d
JOIN orders o
ON d.order_id = o.order_id
GROUP BY d.agent_id)
WHERE rnk=1;
CREATE VIEW vw_delivery_agent_ratings AS
SELECT d.agent_id, ROUND(AVG(o.delivery_service_rating),2) AS avg_rating
FROM delivery d
JOIN orders o
ON d.order_id = o.order_id
GROUP BY d.agent_idCREATE VIEW vw_restaurant_service_ratings AS
SELECT r.restaurant_id, r.RESTAURANT_NAME, ROUND(AVG(o.RESTAURANT_SERVICE_RATING),2) AS avg_service_rating
FROM orders o
JOIN RESTAURANT r
ON r.restaurant_id = o.restaurant_id
GROUP BY r.RESTAURANT_ID, r.restaurant_name;CREATE VIEW vw_menu AS
SELECT * FROM MENUCREATE VIEW vw_coupons AS
SELECT coupon_name, lower_range, upper_range
From coupon
Where activity_status = 'Active';CREATE VIEW vw_restaurants AS
SELECT *
FROM restaurantCREATE VIEW vw_cancelled_orders AS
SELECT order_id, cust_id, order_date
FROM orders
WHERE order_status = 'Cancelled';CREATE VIEW vw_all_orders AS
SELECT * FROM ordersCREATE VIEW vw_customer_order_address AS
SELECT CUST_ID,CUST_FIRST_NAME, CUST_LAST_NAME, (STREET_NAME || ', '|| ZIP_CODE || ', ' || APT_NUMBER) AS ADDRESS--,CONCAT(APT_NUMBER, ZIP_CODE, STREET_NAME) AS ADDRESS
FROM CUSTOMER;CREATE VIEW vw_completed_orders AS
SELECT order_id, cust_id
FROM orders
WHERE order_status = 'Delivered'CREATE VIEW vw_delivery_agent_status AS
SELECT agent_id, agent_status
FROM delivery_agentCREATE VIEW vw_active_orders AS
SELECT order_id, cust_id, order_status, order_date
FROM orders
WHERE order_status IN ('Placed Successfully','Confirmed','Preparing','Out for delivery','Delay In Delivery')

[Sunday 5:22 PM] Aishwarya Ankush Katkar
Thanks!

