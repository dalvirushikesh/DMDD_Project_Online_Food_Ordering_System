SET SERVEROUTPUT ON;

-- INSERTING DATA INTO DELIVERY_AGENT ENTITY
EXECUTE insert_deliveryagent_data('RAJ', 'RAJ@123', 3.0, 'AVAILABLE');
EXECUTE insert_deliveryagent_data('PUNIT', 'PUNIT_SHETTY@981', 2.6, 'NOT AVAILABLE');
EXECUTE insert_deliveryagent_data('KARTIK', 'KARTIKMOHAN_121', 4.6, 'NOT AVAILABLE');
EXECUTE insert_deliveryagent_data('ADITI', 'ADITI_MISHRA@123', 1.9, 'AVAILABLE');
EXECUTE insert_deliveryagent_data('AHUSHKA', 'MOHANTY_AUSHKA@123', 5.0, 'NOT AVAILABLE');
EXECUTE insert_deliveryagent_data('RAJVEER', 'VEER_RAJ@123', 3.8, 'AVAILABLE');
EXECUTE insert_deliveryagent_data('ADITYA', 'AG_ADI@123', 4.2, 'NOT AVAILABLE');
EXECUTE insert_deliveryagent_data('SARTHAK', 'SARTHAK@1875', 1.5, 'AVAILABLE');
EXECUTE insert_deliveryagent_data('MOHAN', 'MOHAN@RAJ', 2.2, 'NOT AVAILABLE');
EXECUTE insert_deliveryagent_data('JANVHI', 'JANVHI_SHETTY@123', 4.7, 'AVAILABLE');
EXECUTE insert_deliveryagent_data('PRASAD', 'PRASAD@321', 4.1, 'AVAILABLE');
EXECUTE insert_deliveryagent_data('RASHMI', 'RASHMI@123', 3.9, 'NOT AVAILABLE');
EXECUTE insert_deliveryagent_data('KRITIKA', 'KRITIKA@123', 2.9, 'AVAILABLE');
EXECUTE insert_deliveryagent_data('NEHA', 'GUPTA_NEHA@123', 5.0, 'AVAILABLE');
EXECUTE insert_deliveryagent_data('AYAN', 'AYAN@123', 4.4, 'NOT AVAILABLE');


-----------------------------------------------------------------------------------------------

-- INSERTING DATA INTO MANAGER ENTITY
EXECUTE insert_manager_data(1,'PRATHAMESH', 'FAIDO$1231');
EXECUTE insert_manager_data (2,'HIMANI', 'THAKKER@123');


-----------------------------------------------------------------------------------------------

-- INSERTING DATA INTO RESTAURANT ENTITY
EXECUTE insert_restaurant_data (1, 1, 8579814056, 'INDIAN SPICE');
EXECUTE insert_restaurant_data (2, 2, 8163273945, 'TASTY BITES');


-----------------------------------------------------------------------------------------------

-- INSERTING DATA INTO CUSOTMERS ENTITY
EXECUTE insert_customer_data(1, 'maurya_ramteke','ramteke123','Maurya','Ramteke',5677766666,20,166,02115,'st botolph');
EXECUTE insert_customer_data(2, 'sharvika_barapatre','barapatre123','Sharvika','Barapatre',7585583333,300,1567,02120,'Tremont street');
EXECUTE insert_customer_data(3, 'prasad_pathak','pathak123','Prasad','Pathak',7585444333,10,415,02120,'alphonsus street');
EXECUTE insert_customer_data(4, 'aditya_bhabhe','bhabhe123','Aditya','Bhabhe',4444433333,0,507,02120,'alphonsus street');
EXECUTE insert_customer_data(5, 'girish_pillai','pillai123','Girish','Pillai',6666633333,10,908,02120,'smiths street');
EXECUTE insert_customer_data(6, 'sahil_mattoo','mattoo123','Sahil','Mattoo',6667788844,60,76,02122,'bolyston street');
EXECUTE insert_customer_data(7, 'aditya_arvind','arvind123','Aditya','Arvind',1366678112,0,431,02121,'Park Drive');
EXECUTE insert_customer_data(8, 'aditya_sharma','sharma123','Aditya','Sharma',8598315033,0,37,02215,'Downtown');
EXECUTE insert_customer_data(9, 'kartik_mohan','mohan123','Kartik','Mohan',7262924823,0,3,02121,'Park Drive');
EXECUTE insert_customer_data(10, 'pragya_mishra','mishra123','Pragya','Mishra',8938912804,0,19,02215,'Downtown');
EXECUTE insert_customer_data(11, 'vivek_oberio','oberio123','Vivek','Oberio',7948911423,0,5,02115,'st botolph');
EXECUTE insert_customer_data(12, 'shubham_patidar','Patidar123','Shubham','Patidar',8728375092,0,45, 02120, 'Tremont street');
EXECUTE insert_customer_data(13, 'yash_neema','Neema123','Yash','Neema',9827282038,0,14, 02115, 'Sachem Street');
EXECUTE insert_customer_data(14, 'shibhu_verma','Verma123','Shibhu','Verma', 8286379274,0, 11, 02121, 'Park Drive');
EXECUTE insert_customer_data(15, 'dakshit_shetty','Shetty123','Dakshit','Shetty', 8172384092,0, 18, 02115, 'Downtown');


-----------------------------------------------------------------------------------------------

-- INSERTING DATA INTO ORDERS ENTITY


EXECUTE insert_orders_data(1, 1, 2, (TO_TIMESTAMP('2022-01-03 06:14:00', 'YYYY-MM-DD HH24:MI:SS')), 'Preparing', 'PLATINUM', 0, 116.65, 'DEBIT CARD', 'Paid', 'RAJ', 0, 0);
EXECUTE insert_orders_data(2, 3, 1, (TO_TIMESTAMP('2022-02-17 13:34:32', 'YYYY-MM-DD HH24:MI:SS')), 'N/A', 'N/A', 0, 53.03, 'WALLET BALANCE', 'Pending', 'N/A', 0, 0);
EXECUTE insert_orders_data(3, 7, 2, (TO_TIMESTAMP('2022-04-09 12:14:37', 'YYYY-MM-DD HH24:MI:SS')), 'Out for delivery', 'SILVER', 0, 38.64, 'CREDIT CARD', 'Paid', 'SARTHAK', 0, 0);
EXECUTE insert_orders_data(4, 5, 2, (TO_TIMESTAMP('2022-02-27 01:24:00', 'YYYY-MM-DD HH24:MI:SS')), 'Delivered', 'GOLD', 0, 181.8, 'CREDIT CARD', 'Paid', 'JANVHI', 0, 4);
EXECUTE insert_orders_data(5, 2, 2, (TO_TIMESTAMP('2022-01-21 17:18:19', 'YYYY-MM-DD HH24:MI:SS')), 'Refunded', 'SILVER', 0, 23.18, 'DEBIT CARD', 'Paid', 'N/A', 0, 0);
EXECUTE insert_orders_data(6, 1, 1, (TO_TIMESTAMP('2022-03-14 14:17:09', 'YYYY-MM-DD HH24:MI:SS')), 'Placed Successfully', 'N/A', 0, 75.25, 'WALLET BALANCE', 'Paid', 'N/A', 0, 0);
EXECUTE insert_orders_data(7, 3, 1, (TO_TIMESTAMP('2022-04-20 20:56:00', 'YYYY-MM-DD HH24:MI:SS')), 'Delivered', 'SILVER', 0, 43.63, 'DEBIT CARD', 'Paid', 'RAJ', 3.0, 3);
EXECUTE insert_orders_data(8, 6, 2, (TO_TIMESTAMP('2022-03-26 04:13:31', 'YYYY-MM-DD HH24:MI:SS')), 'Out for delivery', 'GOLD', 0, 110.7, 'DEBIT CARD', 'Paid', 'RAJVEER', 0, 0);
EXECUTE insert_orders_data(9, 7, 1, (TO_TIMESTAMP('2022-02-19 22:39:41', 'YYYY-MM-DD HH24:MI:SS')), 'Delay in delivery', 'SILVER', 0, 39.09, 'DEBIT CARD', 'Paid', 'N/A', 0, 0);
EXECUTE insert_orders_data(10, 5, 2, (TO_TIMESTAMP('2022-02-22 17:28:37', 'YYYY-MM-DD HH24:MI:SS')), 'Preparing', 'N/A', 0, 10.1, 'WALLET BALANCE', 'Paid', 'NEHA', 0, 0);
EXECUTE insert_orders_data(11, 5, 2, (TO_TIMESTAMP('2022-01-31 12:15:38', 'YYYY-MM-DD HH24:MI:SS')), 'Delivered', 'PLATINUM', 0, 86.25, 'WALLET BALANCE', 'Paid', 'RAJ', 5, 2);
EXECUTE insert_orders_data(12, 1, 1, (TO_TIMESTAMP('2022-04-15 13:29:13', 'YYYY-MM-DD HH24:MI:SS')), 'Cancelled', 'GOLD', 0, 79.18, 'DEBIT CARD', 'Paid', 'N/A', 0, 0);
EXECUTE insert_orders_data(13, 3, 2, (TO_TIMESTAMP('2022-01-12 03:18:28', 'YYYY-MM-DD HH24:MI:SS')), 'Delivered', 'GOLD', 0, 71.91, 'DEBIT CARD', 'Paid', 'JANVHI', 2, 5);
EXECUTE insert_orders_data(14, 10, 2, (TO_TIMESTAMP('2022-02-14 09:11:08', 'YYYY-MM-DD HH24:MI:SS')), 'Out for delivery', 'N/A', 0, 38.38, 'WALLET BALANCE', 'Paid', 'ADITI', 0, 0);
EXECUTE insert_orders_data(15, 9, 1, (TO_TIMESTAMP('2022-03-04 16:19:00', 'YYYY-MM-DD HH24:MI:SS')), 'Delivered', 'GOLD', 0, 59.79, 'DEBIT CARD', 'Paid', 'RAJVEER', 5, 1);
EXECUTE insert_orders_data(16, 6, 1, (TO_TIMESTAMP('2022-03-18 18:12:49', 'YYYY-MM-DD HH24:MI:SS')), 'Cancelled', 'N/A', 0, 12.12, 'WALLET BALANCE', 'Paid', 'N/A', 0, 0);
EXECUTE insert_orders_data(17, 10, 1, (TO_TIMESTAMP('2022-04-17 08:46:27', 'YYYY-MM-DD HH24:MI:SS')), 'Delivered', 'PLATINUM', 0, 74.23, 'DEBIT CARD', 'Paid', 'RAJVEER', 3, 4);
EXECUTE insert_orders_data(18, 1, 2, (TO_TIMESTAMP('2022-02-16 03:18:58', 'YYYY-MM-DD HH24:MI:SS')), 'Delay in delivery', 'PLATINUM', 0, 102.51, 'WALLET BALANCE', 'Paid', 'N/A', 0, 0);
EXECUTE insert_orders_data(19, 4, 2, (TO_TIMESTAMP('2022-03-26 23:22:15', 'YYYY-MM-DD HH24:MI:SS')), 'Refunded', 'N/A', 0, 51.51, 'DEBIT CARD', 'Paid', 'N/A', 0, 0);
EXECUTE insert_orders_data(20, 10, 1, (TO_TIMESTAMP('2022-02-24 15:45:26', 'YYYY-MM-DD HH24:MI:SS')), 'Delivered', 'SILVER', 0, 35.45, 'WALLET BALANCE', 'Paid', 'RAJ', 3, 4);
EXECUTE insert_orders_data(21, 11, 2, (TO_TIMESTAMP('2022-01-19 16:24:49', 'YYYY-MM-DD HH24:MI:SS')), 'Out for delivery', 'SILVER', 0, 30.91, 'WALLET BALANCE', 'Paid', 'NEHA', 0, 0);
EXECUTE insert_orders_data(22, 12, 1, (TO_TIMESTAMP('2022-02-13 11:12:12', 'YYYY-MM-DD HH24:MI:SS')), 'Delay in delivery', 'N/A', 0, 28.79, 'CREDIT CARD', 'Paid', 'NEHA', 0, 0);
EXECUTE insert_orders_data(23, 13, 1, (TO_TIMESTAMP('2022-04-04 13:40:18', 'YYYY-MM-DD HH24:MI:SS')), 'Confirmed', 'SILVER', 0, 39.09, 'CREDIT CARD', 'Paid', 'ADITI', 0, 0);
EXECUTE insert_orders_data(24, 14, 2, (TO_TIMESTAMP('2022-03-29 21:13:30', 'YYYY-MM-DD HH24:MI:SS')), 'Preparing', 'GOLD', 0, 57.37, 'CREDIT CARD', 'Paid', 'SARTHAK', 0, 0);
EXECUTE insert_orders_data(25, 15, 1, (TO_TIMESTAMP('2022-03-25 06:11:42', 'YYYY-MM-DD HH24:MI:SS')), 'Preparing', 'GOLD', 0, 50.10, 'DEBIT CARD', 'Paid', 'NEHA', 0, 0);
EXECUTE insert_orders_data(26, 12, 2, (TO_TIMESTAMP('2022-02-27 01:42:11', 'YYYY-MM-DD HH24:MI:SS')), 'Confirmed', 'N/A', 2,  10.61, 'DEBIT CARD', 'Paid', 'SARTHAK', 0, 0);


-----------------------------------------------------------------------------------------------

-- INSERTING DATA INTO MENU ENTITY
-- ADDING APPERTIZERS TO THE MENU
EXECUTE insert_menu_data(1,'SMOKED NACHOS','available',4.5,7.50,'Appetizer');
EXECUTE insert_menu_data(2,'BUFFALLO SHRIMP SKEWERS','available',4.1,8.50,'Appetizer');
EXECUTE insert_menu_data(2,'CHILI CHEESE TOTS','available',4.0,9.50,'Appetizer');
EXECUTE insert_menu_data(1,'CHICKEN FINGERS','available',3.5,6.50,'Appetizer');
EXECUTE insert_menu_data(1,'FOUR CHEESE GARLIC BREAD','available',4.5,13,'Appetizer');
EXECUTE insert_menu_data(1,'STUFFED MSHROOMS','available',4.5,12,'Appetizer');

-- ADDING MAIN COURSE TO THE MENU
EXECUTE insert_menu_data(2,'GRILLED SALMON WITH DILL SAUCE','available',4.5,17,'Main Course');
EXECUTE insert_menu_data(1,'ROAST BEEF WITH VEGETABLES','available',4.0,18,'Main Course');
EXECUTE insert_menu_data(1,'CHICKEN AND MUSHROOM PIE','available',3.5,15,'Main Course');
EXECUTE insert_menu_data(1,'MARRAKESH VEGETERIAN CURRY','available',4.7,22,'Main Course');
EXECUTE insert_menu_data(1,'EGGPLANT LASAGNE','not available',4.0,25,'Main Course');
EXECUTE insert_menu_data(2,'RAMEN','available',2,15,'Main Course');

--ADDING DESSERTS TO THE MENU TABLE
EXECUTE insert_menu_data(2,'APPLE PIE WITH CREAM','available',4.8,18,'DESSERT');
EXECUTE insert_menu_data(1,'FRUIT SALAD','available',3,13,'DESSERT');
EXECUTE insert_menu_data(1,'STRAWBERRY PIE','available',4,25,'DESSERT');
EXECUTE insert_menu_data(2,'GULAB JAMUN','available',5,10,'DESSERT');
EXECUTE insert_menu_data(1,'WAFFLE ','available',4,15,'DESSERT');
EXECUTE insert_menu_data(1,'CHOCOLATE CHEESECAKE','not available',4.5,15,'DESSERT');

--ADDING BEVERAGE TO THE MENU TABLE
EXECUTE insert_menu_data(1,'SPARKLING WATER','available',4.2,18,'BEVERAGE');
EXECUTE insert_menu_data(1,'SODA','available',4.8,18,'BEVERAGE');
EXECUTE insert_menu_data(2,'DIET SODA','available',4.8,18,'BEVERAGE');
EXECUTE insert_menu_data(2,'ENERGY DRINK','available',4.8,18,'BEVERAGE');
EXECUTE insert_menu_data(1,'ESPRESSO','available',4.5,20,'BEVERAGE');
EXECUTE insert_menu_data(1,'HOT CHOCOLATE','not available',4.0,8,'BEVERAGE');


-----------------------------------------------------------------------------------------------

-- INSERTING DATA INTO CART ENTITY
EXECUTE insert_cart_data(2, 3, 1, 1, 0, 7.5, 2);
EXECUTE insert_cart_data(5, 2, 2, 2, 0, 8.5, 3);
EXECUTE insert_cart_data(18, 1, 2, 16, 0, 10, 4);
EXECUTE insert_cart_data(1, 1, 2, 7, 0, 17, 1);
EXECUTE insert_cart_data(15, 9, 1, 14, 3, 13, 4);
EXECUTE insert_cart_data(16, 6, 1, 6, 0, 12, 1);
EXECUTE insert_cart_data(17, 10, 1, 20, 5, 18, 5);
EXECUTE insert_cart_data(9, 7, 1, 4, 0, 6.5, 2);
EXECUTE insert_cart_data(7, 3, 1, 6, 4, 12, 1);
EXECUTE insert_cart_data(12, 1, 1, 19, 0, 18, 4);
EXECUTE insert_cart_data(18, 1, 2, 21, 0, 18, 1);
EXECUTE insert_cart_data(8, 6, 2, 16, 0, 10, 3);
EXECUTE insert_cart_data(2, 3, 1, 4, 0, 6.5, 3);
EXECUTE insert_cart_data(18, 1, 2, 13, 0, 18, 2);
EXECUTE insert_cart_data(1, 1, 2, 16, 0, 10, 4);
EXECUTE insert_cart_data(2, 3, 1, 19, 0, 18, 1);
EXECUTE insert_cart_data(3, 7, 2, 2, 0, 8.5, 3);
EXECUTE insert_cart_data(19, 4, 2, 7, 0, 17, 3);
EXECUTE insert_cart_data(17, 10, 1, 1, 4, 7.5, 2);
EXECUTE insert_cart_data(8, 6, 2, 7, 0, 17, 1);
EXECUTE insert_cart_data(11, 5, 2, 22, 2, 18, 3);
EXECUTE insert_cart_data(4, 5, 2, 21, 4, 18, 6);
EXECUTE insert_cart_data(4, 5, 2, 12, 2, 15, 2);
EXECUTE insert_cart_data(8, 6, 2, 22, 0, 18, 5);
EXECUTE insert_cart_data(1, 1, 2, 21, 0, 18, 4);
EXECUTE insert_cart_data(1, 1, 2, 13, 0, 18, 2);
EXECUTE insert_cart_data(13, 3, 2, 21, 5, 18, 4);
EXECUTE insert_cart_data(24, 14, 2, 22, 4, 18, 2);
EXECUTE insert_cart_data(24, 14, 2, 13, 4, 18, 1);
EXECUTE insert_cart_data(14, 10, 2, 3, 0, 9.5, 4);
EXECUTE insert_cart_data(15, 9, 1, 10, 1, 22, 1);
EXECUTE insert_cart_data(12, 1, 1, 14, 0, 13, 2);
EXECUTE insert_cart_data(18, 1, 2, 7, 0, 17, 3);
EXECUTE insert_cart_data(3, 7, 2, 7, 0, 17, 1);
EXECUTE insert_cart_data(6, 1, 1, 1, 0, 7.5, 3);
EXECUTE insert_cart_data(11, 5, 2, 7, 3, 17, 4);
EXECUTE insert_cart_data(4, 5, 2, 7, 4, 17, 3);
EXECUTE insert_cart_data(22, 12, 1, 4, 4, 6.5, 1);
EXECUTE insert_cart_data(23, 13, 1, 15, 3, 15, 2);
EXECUTE insert_cart_data(24, 14, 2, 2, 3, 8.5, 2);
EXECUTE insert_cart_data(6, 1, 1, 14, 0, 13, 4);
EXECUTE insert_cart_data(22, 12, 1, 20, 3, 18, 1);
EXECUTE insert_cart_data(23, 13, 1, 4, 5, 6.5, 2);
EXECUTE insert_cart_data(13, 3, 2, 2, 4, 8.5, 2);
EXECUTE insert_cart_data(25, 15, 1, 14, 4, 13, 1);
EXECUTE insert_cart_data(25, 15, 1, 19, 2, 18, 2);
EXECUTE insert_cart_data(4, 5, 2, 13, 5, 18, 2);
EXECUTE insert_cart_data(9, 7, 1, 17, 0, 15, 2);
EXECUTE insert_cart_data(10, 5, 2, 16, 0, 10, 1);
EXECUTE insert_cart_data(7, 3, 1, 8, 3, 18, 2);
EXECUTE insert_cart_data(20, 10, 1, 5, 3, 13, 3);
EXECUTE insert_cart_data(21, 11, 2, 2, 4, 8.5, 4);
EXECUTE insert_cart_data(25, 15, 1, 5, 3, 13, 1);
EXECUTE insert_cart_data(22, 12, 1, 17, 2, 4, 1);
EXECUTE insert_cart_data(26, 12, 2, 2, 3, 8.5, 1);


-----------------------------------------------------------------------------------------------

-- INSERTING INTO DELIVERY ENTITY
EXECUTE insert_delivery_data(3, 2, 7, 8, 'Out For Delivery');
EXECUTE insert_delivery_data(13, 2, 3, 10, 'Delivered');
EXECUTE insert_delivery_data(11, 2, 5, 1, 'Delivered');
EXECUTE insert_delivery_data(14, 2, 10, 4, 'Out For Delivery');
EXECUTE insert_delivery_data(7, 1, 3, 1, 'Delivered');
EXECUTE insert_delivery_data(8, 2, 6, 6, 'Out For Delivery');
EXECUTE insert_delivery_data(17, 1, 10, 6, 'Delivered');
EXECUTE insert_delivery_data(4, 2, 5, 10, 'Delivered');
EXECUTE insert_delivery_data(15, 1, 9, 6, 'Delivered');
EXECUTE insert_delivery_data(19, 1, 10, 1, 'Delivered');
EXECUTE insert_delivery_data(21, 2, 11, 14, 'Out For Delivery');



-----------------------------------------------------------------------------------------------

-- INSERTING INTO COUPON ENTITY
EXECUTE insert_coupon_data('SILVER', 30, 50, 'ACTIVE', 0.1);
EXECUTE insert_coupon_data('GOLD', 50, 100, 'ACTIVE', 0.2);
EXECUTE insert_coupon_data('PLATINUM', 100, 300, 'ACTIVE', 0.3);


/*
 SELECT * FROM DELIVERY_AGENT;
 SELECT * FROM MANAGER;
 SELECT * FROM RESTAURANT;
 SELECT * FROM CUSTOMER;
 SELECT * FROM ORDERS;
 SELECT * FROM MENU;
 SELECT * FROM CART;
 SELECT * FROM DELIVERY;
 SELECT * FROM COUPON;
*/



/*
select * from vw_dish_sales;
select * from vw_top_10_dishes;
select * from vw_top_10_customers;
select * from vw_monthly_sales;
select * from vw_top_delivery_person;
select * from vw_delivery_agent_ratings;
select * from vw_restaurant_service_ratings;
select * from vw_delivery_agent_status;
select * from vw_active_orders;
select * from vw_completed_orders;
select * from vw_cancelled_orders;
select * from vw_all_orders;
select * from vw_customer_order_address;
select * from vw_menu;
select * from vw_coupons;
select * from vw_restaurants;
*/

