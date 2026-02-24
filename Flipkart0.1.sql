use flipkart;

	create table customers (
		customer_id int primary key auto_increment,
		name varchar(100) not null,
		mobile_no varchar(15) not null unique,
		email varchar(100) not null unique, 
		address varchar(200) not null,
		signup_date datetime default current_timestamp
		);
		
		
	insert into customers(name, mobile_no, email, address) values
	("Meet Patel", 7990657271, "meet.p@gmail.com", "Shyamal Char Rasta, Ahmedabad"),
	("Deep Patel", 7990657272, "deep.p@gmail.com", "Memnager, Ahmedabad"),
	("Meet Joshi", 7990657273, "meet.j@gmail.com", "Taltej, Ahmedabad"),
	("Kaushal Patel", 7990657274, "kap11@gmail.com", "Gota, Ahmedabad"),
	("Neel Patel", 7990657275, "neel.p@gmail.com", "Gatlodiya, Ahmedabad"),
	("Shayam Patel", 7990657276, "shayam.p@gmail.com", "Bopal, Ahmedabad"),
	("Jaimil Panchal", 7990657277, "jp@gmail.com", "Maninager, Ahmedabad"),
	("Daksha Dayma", 7990657278, "dd@gmail.com", "Commers six road, Ahmedabad"),
	("Harshit Dhabi", 7990657279, "hd@gmail.com", "Iskon, Ahmedabad"),
	("Luv Patel", 7990657211, "luv.p@gmail.com", "Shilaj, Ahmedabad"),
	("Khush Soni", 7990657222, "khush.s@gmail.com", "Science city, Ahmedabad");

	select * from customers;



	CREATE TABLE sellers (
		seller_id INT PRIMARY KEY,
		seller_name VARCHAR(50),
		seller_city VARCHAR(30),
		seller_rating DECIMAL(2,1),
		seller_active BOOLEAN
	);

	INSERT INTO sellers VALUES
	(1,'CloudRetail','Mumbai',4.5,1),
	(2,'TechWorld','Bangalore',4.3,1),
	(3,'HomeEssentials','Delhi',4.1,1),
	(4,'FashionHub','Surat',4.2,1),
	(5,'ElectroMart','Chennai',4.6,1),
	(6,'BookPlanet','Pune',4.0,1),
	(7,'GadgetZone','Noida',4.4,1),
	(8,'KitchenKart','Ahmedabad',4.2,1),
	(9,'StyleStreet','Jaipur',3.9,1),
	(10,'BabyCare','Kolkata',4.1,1),
	(11,'SportsArena','Indore',4.3,1),
	(12,'OfficeStore','Gurgaon',4.0,1),
	(13,'AutoNeeds','Chandigarh',4.2,1),
	(14,'PetWorld','Delhi',4.1,1),
	(15,'LuxuryLane','Mumbai',4.7,1),
	(16,'DailyNeeds','Pune',3.8,1);

	select * from sellers;

	CREATE TABLE products (
		product_id INT PRIMARY KEY,
		product_name VARCHAR(100),
		category VARCHAR(50),
		price DECIMAL(10,2),
		stock INT CHECK (stock >= 0),
		seller_id INT,
		FOREIGN KEY (seller_id) REFERENCES sellers(seller_id)
	);

	INSERT INTO products VALUES
	(1,'iPhone 14','Electronics',69999,50,2),
	(2,'Samsung TV','Electronics',45999,30,5),
	(3,'Nike Shoes','Fashion',4999,100,4),
	(4,'Wooden Table','Furniture',8999,20,3),
	(5,'Laptop Bag','Accessories',1499,150,7),
	(6,'Mixer Grinder','Appliances',2999,40,8),
	(7,'Washing Machine','Appliances',18999,15,5),
	(8,'Cotton Shirt','Fashion',999,200,9),
	(9,'Office Chair','Furniture',5999,25,12),
	(10,'Children Toys','Kids',1299,300,10),
	(11,'Football','Sports',799,120,11),
	(12,'Notebook Set','Stationery',499,400,6),
	(13,'Car Vacuum','Automobile',1999,60,13),
	(14,'Pet Food','Pet Supplies',2499,80,14),
	(15,'Gold Watch','Luxury',25999,10,15),
	(16,'Daily Grocery Pack','Grocery',899,500,16);

	select * from products;

	CREATE TABLE orders (
		order_id INT PRIMARY KEY,
		customer_id INT,
		order_date DATE,
		payment_method VARCHAR(30),
		order_status VARCHAR(30),
		FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
	);

	INSERT INTO orders VALUES
	(1001,1,'2024-01-05','UPI','Delivered'),
	(1002,2,'2024-01-06','Credit Card','Delivered'),
	(1003,3,'2024-01-07','COD','Shipped'),
	(1004,4,'2024-01-08','Debit Card','Delivered'),
	(1005,5,'2024-01-09','UPI','Cancelled'),
	(1006,6,'2024-01-10','UPI','Delivered'),
	(1007,7,'2024-01-11','Credit Card','Delivered'),
	(1008,8,'2024-01-12','COD','Returned'),
	(1009,9,'2024-01-13','Debit Card','Delivered'),
	(1010,10,'2024-01-14','UPI','Delivered');

	select * from orders;

	CREATE TABLE deliveries (
		delivery_id INT PRIMARY KEY,
		order_id INT,
		delivery_partner VARCHAR(50),
		shipment_mode VARCHAR(30),
		delivery_days INT,
		delivery_status VARCHAR(30),
		FOREIGN KEY (order_id) REFERENCES orders(order_id)
	);


	INSERT INTO deliveries VALUES
	(1,1001,'Ekart','Standard',5,'Delivered'),
	(2,1002,'Delhivery','Express',3,'Delivered'),
	(3,1003,'Ekart','Standard',6,'In Transit'),
	(4,1004,'BlueDart','Express',2,'Delivered'),
	(5,1005,'Ekart','Standard',0,'Cancelled'),
	(6,1006,'Delhivery','Express',4,'Delivered'),
	(7,1007,'BlueDart','Express',2,'Delivered'),
	(8,1008,'Ekart','Standard',7,'Returned'),
	(9,1009,'Delhivery','Standard',5,'Delivered'),
	(10,1010,'Ekart','Standard',6,'Delivered');

	select * from deliveries;

	CREATE TABLE reviews (
		review_id INT PRIMARY KEY,
		product_id INT,
		customer_id INT,
		rating INT CHECK (rating BETWEEN 1 AND 5),
		review_text VARCHAR(255),
		review_date DATE,
		FOREIGN KEY (product_id) REFERENCES products(product_id),
		FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
	);

	INSERT INTO reviews VALUES
	(1,1,1,5,'Excellent product','2024-01-10'),
	(2,2,2,4,'Good quality','2024-01-11'),
	(3,3,3,4,'Comfortable','2024-01-12'),
	(4,4,4,3,'Average build','2024-01-13'),
	(5,5,5,5,'Very useful','2024-01-14'),
	(6,6,6,4,'Works well','2024-01-15'),
	(7,7,7,5,'Great performance','2024-01-16'),
	(8,8,8,3,'Fabric ok','2024-01-17'),
	(9,9,9,4,'Comfortable chair','2024-01-18'),
	(10,10,10,5,'Kids loved it','2024-01-19');

	select * from reviews;

-- Find customers whose name starts with ‘R’
select * from customers
where name like "K%" ;

-- Fetch products priced between 5000–20000
select * from products
where price between 5000 and 20000;

-- Find orders paid using UPI or COD
select * from orders
where payment_method in ('UPI','COD');

-- Find deliveries handled by Ekart
select * from deliveries
where delivery_partner = 'Ekart';

-- Find products with word ‘Shirt’
SELECT * FROM products
WHERE product_name LIKE '%Shirt%';

-- Find customers using gmail
select * from customers
where email like '%@gmail.com%';

-- Combine multiple filters in one query
select * from customers
where email like '%@gmail.com%'
and address like '%Gota%' or '%Memnager%';

-- Show unique payment methods
SELECT DISTINCT payment_method FROM orders;

-- Show unique product categories
select distinct product_name from products;

-- Show top 5 expensive products
select * from products
order by price desc limit 5;

-- Show latest 3 orders
SELECT * FROM orders ORDER BY order_date DESC LIMIT 3;

-- Sort sellers by rating
select * from sellers
order by seller_rating desc;

-- Show cheapest 5 products
SELECT *FROM products 
ORDER BY price ASC LIMIT 5;
	
-- 1.What is GROUP BY? 
-- GROUP BY is used to group rows that have the same values in a column so you can apply aggregate functions on each group. 
    
-- 2.Why HAVING is required?
-- HAVING is required to filter grouped results after aggregate functions are applied.

-- 3.Difference between WHERE and HAVING
-- WHERE filters rows before grouping,HAVING filters groups after aggregation.

-- 4.SQL execution order
-- FROM → JOIN → WHERE → GROUP BY → HAVING → SELECT → ORDER BY → LIMIT

-- 5.Can GROUP BY work without aggregate?
-- Yes, it groups rows by unique column values even without aggregate functions.

-- 6.Can HAVING exist without GROUP BY?
-- Yes, a HAVING clause can exist without a GROUP BY clause. While it is most commonly used to filter grouped data, SQL allows it to be used independently. 

-- Count products per category
SELECT category, COUNT(*) AS total_products FROM products
GROUP BY category;

-- Average price per category
SELECT category, AVG(price) AS avg_price FROM products
GROUP BY category;

-- Orders per payment method
SELECT payment_method, COUNT(*) AS total_orders FROM orders
GROUP BY payment_method;

-- Delivered orders per payment method
SELECT payment_method, COUNT(*) AS delivered_orders FROM orders
WHERE order_status = 'Delivered'
GROUP BY payment_method;

-- Categories with more than 1 product
SELECT category, COUNT(*) AS product_count FROM products
GROUP BY category
HAVING COUNT(*) > 1;

-- Payment methods with more than 2 orders
SELECT payment_method, COUNT(*) AS total_orders FROM orders
GROUP BY payment_method
HAVING COUNT(*) > 2;

/*Project: Flipkart Business Summary Report
Objective:
Provide insights to management.
*/

-- Product distribution by category
SELECT category, COUNT(*) AS total_products FROM products
GROUP BY category;

-- Average price per category
SELECT category, AVG(price) AS avg_price FROM products
GROUP BY category;

-- Most used payment method
SELECT payment_method, COUNT(*) AS usage_count FROM orders
GROUP BY payment_method
ORDER BY usage_count DESC
LIMIT 1;

-- Categories with high average price
SELECT category, AVG(price) AS avg_price FROM products
GROUP BY category
HAVING AVG(price) > 10000;

-- Order distribution analysis
SELECT order_status, COUNT(*) AS total_orders FROM orders
GROUP BY order_status;

select s.seller_name, count(p.product_id) as product_count
from sellers s
left join products as p
on s.seller_id = p.seller_id
group by s.seller_name;

select o.customer_id, c.customer_id, c.name, o.order_id, o.order_status
from customers c
left join orders o
on c.customer_id = o,customer_id;

select 
delivery_partner,
shipment_mode,
delivery_days,
round(avg(delivery_days) over (partition by delivery_partner),2) as avg_delivery_days
from deliveries;
/*

-- SQL: Joins, CTEs, Window Functions & Ranking Explained --

-- What is JOIN?
-- JOIN is used to combine rows from two or more tables based on a related column between them.

-- Difference between INNER and LEFT JOIN
-- INNER JOIN returns only matching rows from both tables, while LEFT JOIN returns all rows from the left table and matching rows from the right table.

-- When to use LEFT JOIN?
-- Use LEFT JOIN when you want all records from the main (left) table even if there is no match in the other table.

-- Can RIGHT JOIN be replaced?
-- Yes, RIGHT JOIN can be replaced by switching table order and using LEFT JOIN.
-- What happens if no match in JOIN?
-- In INNER JOIN the row is removed, but in LEFT JOIN the right table columns return NULL.

-- Difference between ON and WHERE
-- ON defines the join condition between tables, while WHERE filters the result after the join

-- What is FULL OUTER JOIN?
-- FULL OUTER JOIN returns all rows from both tables, showing matched rows and filling NULL where there is no match.

-- Does MySQL support FULL JOIN?
-- No, MySQL does not directly support FULL OUTER JOIN.

-- How do you simulate FULL OUTER JOIN in MySQL?
-- By using LEFT JOIN UNION RIGHT JOIN to combine results from both sides.

-- What is SELF JOIN?
-- SELF JOIN is when a table is joined with itself.

-- When is SELF JOIN used?
-- It is used when a table has related data within itself, like employee–manager relationships.

-- What is CROSS JOIN?
-- CROSS JOIN returns the Cartesian product of two tables (every row from first × every row from second).

-- Why CROSS JOIN is dangerous?
-- Because it can generate a huge number of rows and slow down the system.

-- Difference between INNER & FULL JOIN
-- INNER JOIN returns only matching rows, while FULL JOIN returns all rows from both tables including non-matching ones.

-- What happens when no match in LEFT JOIN?
-- The left table row appears, and the right table columns show NULL.

-- Can SELF JOIN use same column?
--Yes, SELF JOIN can compare the same column or different columns of the same table.

-- How many rows does CROSS JOIN return?
-- Number of rows = rows in first table × rows in second table.

-- Real-world use case of SELF JOIN
-- Finding employee and their manager from the same employee table.

-- What is UNION in SQL?
-- UNION combines the result sets of two or more SELECT queries into a single result.

-- Difference between UNION and UNION ALL
-- UNION removes duplicate rows, while UNION ALL keeps all rows including duplicates.

-- Why UNION removes duplicates?
-- Because it automatically applies DISTINCT to eliminate repeated records.

-- Which is faster: UNION or UNION ALL?
-- UNION ALL is faster since it does not check for duplicates.

-- Can UNION combine different tables?
-- Yes, if the selected columns match in number and compatible data types.

-- Column rules for UNION
-- Each SELECT must have the same number of columns, in the same order, with compatible data types.

-- Can ORDER BY be used inside UNION queries?
-- ORDER BY can be used only once at the end of the final combined result.

-- UNION vs JOIN difference
-- UNION combines rows vertically, while JOIN combines tables horizontally based on related columns.

-- What is a subquery?
-- A subquery is a query written inside another SQL query.

-- Types of subqueries
-- Single-row, Multiple-row, Multiple-column, and Correlated subqueries.

-- What is scalar subquery?
-- A scalar subquery returns only one value (one row and one column).

-- Difference between IN and EXISTS
-- IN compares values and checks a list, while EXISTS checks whether any matching row exists.

--What is correlated subquery?
-- A correlated subquery depends on the outer query and runs once for each outer row.

-- Subquery vs JOIN difference
-- Subquery is a nested query inside another query, while JOIN combines tables directly in one query.

-- Can subquery be used in SELECT?
-- Yes, a subquery can be used in SELECT to return a calculated value.

-- Execution order of subqueries
-- The subquery executes first, then the outer query uses its result.

-- Performance issue with correlated subquery
-- It can be slow because it executes repeatedly for each row of the outer query.

-- Can subquery return multiple columns?
-- Yes, but only in specific cases like multi-column comparisons.

-- Can we nest subqueries?
-- Yes, subqueries can be nested inside other subqueries multiple levels deep.

-- What is a CTE?
-- A CTE (Common Table Expression) is a temporary named result set defined using WITH that can be used within a query.

-- Why use CTE instead of subquery?
-- CTE improves readability and allows reuse of the same result set multiple times in the query.

-- Is CTE faster than subquery?
-- Not necessarily; performance depends on the query and optimizer, not just CTE usage.

-- Difference between CTE and VIEW
-- CTE is temporary and exists only during query execution, while VIEW is permanently stored in the database.

-- What is recursive CTE?
-- A recursive CTE references itself to handle hierarchical or tree-structured data.

-- When should CTE be avoided?
-- Avoid it in very large queries if it causes performance issues or repeated execution.

-- Can we use JOIN inside CTE?
-- Yes, CTE can contain JOINs, GROUP BY, subqueries, and other SQL logic.

-- Can multiple CTEs exist in one query?
-- Yes, multiple CTEs can be defined by separating them with commas in a single WITH clause.

-- Scope of CTE
-- CTE is valid only for the single query immediately following it.

-- Can CTE be indexed?
-- No, CTE cannot be indexed because it is not a physical stored object.

-- CTE vs temporary table
-- CTE is temporary for one query only, while a temporary table is physically created and can be reused in multiple queries within a session.

-- What is a window function?
-- A window function performs calculations across a set of rows related to the current row without collapsing the result.

-- Difference between GROUP BY and window function
-- GROUP BY reduces rows into one per group, while window functions keep all rows and just add calculated values.

-- What does OVER() do?
-- OVER() defines the window (set of rows) on which the function operates.

-- Purpose of PARTITION BY
-- PARTITION BY divides rows into groups within the window for separate calculations.

-- Can window functions reduce rows?
-- No, window functions do not reduce rows; they return one result per row.

-- Can WHERE use window functions?
-- No, window functions cannot be used directly in WHERE because WHERE executes before them.

-- Window function vs subquery
-- Window functions calculate values across rows in one query, while subqueries run separate queries inside another query.

-- When to use window functions?
-- Use them for ranking, running totals, moving averages, and comparing row values within groups.

-- Can we use aggregate functions as window functions?
-- Yes, functions like SUM, AVG, COUNT can be used with OVER() as window functions.

-- Is PARTITION BY mandatory?
-- No, PARTITION BY is optional; without it, the function works on the entire result set.

-- Can window functions be nested?
-- No, window functions cannot be directly nested inside another window function.

-- What is ROW_NUMBER?
-- ROW_NUMBER() assigns a unique sequential number to each row based on the ORDER BY clause.

-- Difference between RANK and DENSE_RANK
-- RANK skips numbers after ties, while DENSE_RANK does not skip numbers.

-- When to use ROW_NUMBER?
-- Use it when you need a unique row sequence, like removing duplicates or selecting top records.

-- What happens in RANK when values tie?
-- Tied rows get the same rank, and the next rank number is skipped.

-- Does DENSE_RANK skip numbers?
-- No, DENSE_RANK does not skip numbers after ties.

-- Can ranking be used without ORDER BY?
-- No, ORDER BY is required because ranking depends on row order.

-- Difference between LIMIT and ranking
-- LIMIT restricts total rows returned, while ranking assigns positions to rows.

-- What is Top-N per group?
-- It means selecting the top N rows within each category or group using ranking functions.

-- Can ranking work with JOIN?
-- Yes, ranking functions can be used on joined table results.

-- Ranking vs GROUP BY
-- GROUP BY reduces rows into groups, while ranking keeps all rows and assigns positions.

-- Can ranking functions be nested?
-- No, ranking functions cannot be directly nested inside another window function.

-- Real-world use cases of ranking
-- Finding top 3 highest-selling products per category or ranking employees by salary within departments.
*/

-- Customer order report

SELECT 
    c.customer_id,
    c.name,
    o.order_id,
    o.order_date,
    o.payment_method,
    o.order_status
FROM customers c
INNER JOIN orders o 
    ON c.customer_id = o.customer_id;

-- Product–seller mapping

SELECT 
    p.product_id,
    p.product_name,
    p.category,
    p.price,
    s.seller_name,
    s.seller_city,
    s.seller_rating
FROM products p	
INNER JOIN sellers s 
    ON p.seller_id = s.seller_id;

select
   p.product_id,
   p.product_name,
   p.category,
   p.price,
   s.seller_name,
   s.seller_rating
   from products p
   inner join sellers s
      on p.seller_id = s.seller_id;
   
-- Delivery performance report
    
    select
    o.order_id,
	o.order_date,
    d.delivery_partner,
    d.shipment_mode,
    d.delivery_days,
    delivery_status
    from orders o
    inner join deliveries d
     on o.order_id=d.order_id;
  
-- Customers with no orders
  
    select
    c.customer_id,
    c.name,
    c.email
    from customers c
    left join orders o
    on c.customer_id=o.customer_id
    where order_id is null;
    
   -- Order count per customer 
   
   select
   c.customer_id,
   c.name,
   count(o.order_id) as total_order
   from customers c
left join orders o
on c.customer_id=o.customer_id
group by c.customer_id, c.name
order by total_order desc;   
   
-- Show all customers & orders (FULL JOIN logic)

SELECT c.customer_id, c.name, o.order_id, o.order_date
FROM customers c
LEFT JOIN orders o 
    ON c.customer_id = o.customer_id

UNION

SELECT c.customer_id, c.name, o.order_id, o.order_date
FROM customers c
RIGHT JOIN orders o 
    ON c.customer_id = o.customer_id;

-- Find customers without orders

SELECT c.*
FROM customers c
LEFT JOIN orders o 
    ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;

-- Find orders without delivery

SELECT o.*
FROM orders o
LEFT JOIN deliveries d 
    ON o.order_id = d.order_id
WHERE d.delivery_id IS NULL;

-- Find products without reviews

SELECT p.*
FROM products p
LEFT JOIN reviews r 
    ON p.product_id = r.product_id
WHERE r.review_id IS NULL;

-- Compare products in same category (SELF JOIN)

SELECT p1.product_name AS product1,
       p2.product_name AS product2,
       p1.category
FROM products p1
JOIN products p2
    ON p1.category = p2.category
   AND p1.product_id < p2.product_id;

-- Create customer city comparison (SELF JOIN)

SELECT c1.name AS customer1,
       c2.name AS customer2,
       c1.address
FROM customers c1
JOIN customers c2
    ON c1.address = c2.address
   AND c1.customer_id < c2.customer_id;

-- Create product × seller combinations (CROSS JOIN)

SELECT p.product_name, s.seller_name
FROM products p
CROSS JOIN sellers s;

-- Count unmatched rows in JOIN (customers without orders)

SELECT COUNT(*) AS unmatched_customers
FROM customers c
LEFT JOIN orders o 
    ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;

-- Find delivery records without orders (orphan delivery)

SELECT d.*
FROM deliveries d
LEFT JOIN orders o 
    ON d.order_id = o.order_id
WHERE o.order_id IS NULL;

-- Show cross join output count

SELECT COUNT(*) AS total_rows
FROM products
CROSS JOIN sellers;

-- Replace RIGHT JOIN with LEFT JOIN





SELECT *
FROM customers c
RIGHT JOIN orders o
ON c.customer_id = o.customer_id;

-- Identify orphan records (general example – products without seller) 

SELECT p.*
FROM products p
LEFT JOIN sellers s
    ON p.seller_id = s.seller_id
WHERE s.seller_id IS NULL;

-- Mini Project 1: Data Quality Audit

-- Find missing orders

SELECT c.customer_id, c.name
FROM customers c
LEFT JOIN orders o
    ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;

-- Missing deliveries

SELECT o.order_id, o.order_date
FROM orders o
LEFT JOIN deliveries d
    ON o.order_id = d.order_id
WHERE d.delivery_id IS NULL;

-- Missing reviews

SELECT p.product_id, p.product_name
FROM products p
LEFT JOIN reviews r
    ON p.product_id = r.product_id
WHERE r.review_id IS NULL;

-- Mini Project 2: Customer Coverage Report

SELECT DISTINCT c.customer_id, c.name
FROM customers c
INNER JOIN orders o
    ON c.customer_id = o.customer_id;


SELECT c.customer_id, c.name
FROM customers c
LEFT JOIN orders o
    ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;


SELECT 
    (COUNT(DISTINCT o.customer_id) * 100.0 / COUNT(DISTINCT c.customer_id)) 
    AS conversion_percentage
FROM customers c
LEFT JOIN orders o
    ON c.customer_id = o.customer_id;

-- Combine customer & seller names
SELECT name AS person_name, 'Customer' AS type
FROM customers

UNION

SELECT seller_name AS person_name, 'Seller' AS type
FROM sellers;

-- Combine delivered & cancelled orders
SELECT order_id, order_status
FROM orders
WHERE order_status = 'Delivered'

UNION

SELECT order_id, order_status
FROM orders
WHERE order_status = 'Cancelled';

-- Create activity log using orders + deliveries
SELECT 
    o.order_id,
    o.order_date,
    o.order_status,
    d.delivery_status,
    d.delivery_partner
FROM orders o
LEFT JOIN deliveries d
    ON o.order_id = d.order_id;

-- Combine multiple order statuses
SELECT order_id, order_status
FROM orders
WHERE order_status IN ('Delivered', 'Shipped', 'Returned');

-- Show customer count & order count in one result
SELECT 
    (SELECT COUNT(*) FROM customers) AS total_customers,
    (SELECT COUNT(*) FROM orders) AS total_orders;

-- Use UNION ALL for faster report
SELECT name AS person_name
FROM customers

UNION ALL

SELECT seller_name
FROM sellers;

-- Sort UNION result alphabetically
SELECT name AS person_name
FROM customers

UNION

SELECT seller_name
FROM sellers

ORDER BY person_name;

-- Combine products & sellers names
SELECT 
    p.product_name,
    s.seller_name
FROM products p
INNER JOIN sellers s
    ON p.seller_id = s.seller_id;

-- Create combined city list (customers + sellers)
SELECT address AS city
FROM customers

UNION

SELECT seller_city
FROM sellers;

-- 	Find duplicate rows using UNION vs UNION ALL

-- Mini Project 1: Flipkart User Directory

-- Products above average price
SELECT *
FROM products
WHERE price > (SELECT AVG(price) FROM products);

-- Latest order details
SELECT *
FROM orders
WHERE order_date = (SELECT MAX(order_date) FROM orders);

-- Customers with orders
SELECT *
FROM customers
WHERE customer_id IN (SELECT customer_id FROM orders);

-- Products with reviews
SELECT *
FROM products
WHERE product_id IN (SELECT product_id FROM reviews);

-- Products priced above category average
SELECT p.*
FROM products p
WHERE price > (
    SELECT AVG(price)
    FROM products
    WHERE category = p.category
);

-- Orders after average order date
SELECT *
FROM orders
WHERE order_date > (SELECT AVG(order_date) FROM orders);

-- Customers without orders
SELECT *
FROM customers
WHERE customer_id NOT IN (SELECT customer_id FROM orders);

-- Products with max price per category
SELECT *
FROM products p
WHERE price = (
    SELECT MAX(price)
    FROM products
    WHERE category = p.category
);

-- Count orders using subquery
SELECT 
    name,
    (SELECT COUNT(*) 
     FROM orders o 
     WHERE o.customer_id = c.customer_id) AS total_orders
FROM customers c;

-- Compare EXISTS vs IN
SELECT *
FROM customers
WHERE customer_id IN (SELECT customer_id FROM orders);

select *
FROM customers c
WHERE EXISTS (
    SELECT 1
    from orders o
    WHERE o.customer_id = c.customer_id
);

-- Create derived table query
select category, AVG(price) AS avg_price
from (
    SELECT category, price
    from products
) AS derived_table
GROUP BY category;

-- Use subquery in SELECT
select 
    product_name,
    price,
    (SELECT AVG(price) FROM products) AS overall_avg_price
from products;

-- Create CTE for delivered orders
WITH delivered_orders AS (
    select *
    FROM orders
    WHERE order_status = 'Delivered'
)
SELECT * from delivered_orders;

-- Count delivered orders using CTE
WITH delivered_orders AS (
    select *
    FROM orders
    WHERE order_status = 'Delivered'
)
select COUNT(*) AS total_delivered
from delivered_orders;

-- Orders per payment method using CTE
WITH order_data AS (
    select payment_method
    from orders
)
SELECT payment_method, COUNT(*) AS total_orders
FROM order_data
GROUP BY payment_method;

-- Customer order count using CTE
WITH customer_orders AS (
    select customer_id, COUNT(*) AS total_orders
    from orders
    GROUP BY customer_id
)
select c.customer_id, c.name, 
       COALESCE(co.total_orders, 0) AS total_orders
FROM customers c
LEFT JOIN customer_orders co
    ON c.customer_id = co.customer_id;

-- Products above average price using CTE
WITH avg_price AS (
    SELECT AVG(price) AS average_price
    FROM products
)
select p.*
from products p, avg_price a
WHERE p.price > a.average_price;

-- Avg delivery days using CTE
WITH delivery_stats AS (
    SELECT delivery_days
    FROM deliveries
)
select AVG(delivery_days) AS avg_delivery_days
FROM delivery_stats;

-- Multiple CTEs in one query
WITH total_customers AS (
    select COUNT(*) AS cust_count from customers
),
total_orders AS (
    select COUNT(*) AS order_count FROM orders
)
select cust_count, order_count
FROM total_customers, total_orders;

-- Replace subquery using CTE
WITH avg_price AS (
    SELECT AVG(price) AS avg_val FROM products
)
select *
from products p
JOIN avg_price a
ON p.price > a.avg_val;

-- Sort CTE result
WITH sorted_products AS (
    SELECT product_name, price
    FROM products
)
select *
FROM sorted_products
ORDER BY price DESC;

-- Join inside CTE
WITH order_details AS (
    SELECT o.order_id, c.name, o.order_status
    FROM orders o
    JOIN customers c
        ON o.customer_id = c.customer_id
)
SELECT * FROM order_details;

-- Create KPI report using CTE
WITH kpi AS (
    SELECT 
        (SELECT COUNT(*) FROM customers) AS total_customers,
        (SELECT COUNT(*) FROM orders) AS total_orders,
        (SELECT COUNT(*) FROM products) AS total_products
)
select *,
       (total_orders * 100.0 / total_customers) AS conversion_rate
FROM kpi;

-- Recursive CTE to generate numbers
WITH RECURSIVE numbers AS (
    SELECT 1 AS num
    UNION ALL
    SELECT num + 1
    FROM numbers
    WHERE num < 10
)
SELECT * FROM numbers;

-- Show avg product price with each product
select 
    product_name,
    price,
    AVG(price) OVER() AS overall_avg_price
FROM products;

-- Avg price per category using window function
SELECT 
    product_name,
    category,
    price,
    AVG(price) OVER(PARTITION BY category) AS category_avg_price
FROM products;

-- Count products per category using window function
select 
    product_name,
    category,
    COUNT(*) OVER(PARTITION BY category) AS total_products_in_category
FROM products;

-- Show total orders per customer (row-level)
select 
    o.order_id,
    o.customer_id,
    COUNT(*) OVER(PARTITION BY customer_id) AS total_orders_per_customer
FROM orders o;

-- Compare price vs category average
select 
    product_name,
    category,
    price,
    AVG(price) OVER(PARTITION BY category) AS category_avg,
    price - AVG(price) OVER(PARTITION BY category) AS price_difference
FROM products;

-- Show avg delivery days per partner
select 
    delivery_partner,
    delivery_days,
    AVG(delivery_days) OVER(PARTITION BY delivery_partner) AS avg_partner_days
FROM deliveries;

-- Show category stock value
select 
    category,
    product_name,
    price,
    stock,
    SUM(price * stock) OVER(PARTITION BY category) AS category_stock_value
FROM products;

-- Window function without PARTITION BY
select 
    product_name,
    price,
    SUM(price) OVER() AS total_inventory_price
FROM products;

-- Use window function with JOIN
SELECT 
    c.name,
    o.order_id,
    COUNT(o.order_id) OVER(PARTITION BY c.customer_id) AS total_orders
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id;

-- Filter rows using window output
select *
FROM (
    SELECT 
        product_name,
        category,
        price,
        RANK() OVER(PARTITION BY category ORDER BY price DESC) AS rnk
    FROM products
) AS ranked_products
WHERE rnk = 1;

-- Window function vs GROUP BY example
SELECT category, AVG(price) AS avg_price
FROM products
GROUP BY category;
	
-- Create inventory analytics query
select 
    product_name,
    category,
    price,
    stock,
    price * stock AS stock_value,
    SUM(price * stock) OVER() AS total_inventory_value,
    RANK() OVER(ORDER BY price * stock DESC) AS inventory_rank
FROM products;


-- Rank products by price
select product_name,
    price,
    RANK() OVER(ORDER BY price DESC) AS price_rank
FROM products;

-- Dense rank products by price
SELECT 
    product_name,
    price,
    DENSE_RANK() OVER(ORDER BY price DESC) AS dense_price_rank
FROM products;

-- Assign row number to products
SELECT 	
    product_name,
    price,
    ROW_NUMBER() OVER(ORDER BY price DESC) AS row_num
FROM products;

-- Rank products per
SELECT 
    product_name,
    category,
    price,
    RANK() OVER(PARTITION BY category ORDER BY price DESC) AS category_rank
FROM products;

-- Top 3 products per category
select *
FROM (
    SELECT 
        product_name,
        category,
        price,
        RANK() OVER(PARTITION BY category ORDER BY price DESC) AS rnk
    FROM products
) AS ranked_products
WHERE rnk <= 3;

-- Rank customers by order count
select 
    c.name,
    COUNT(o.order_id) AS total_orders,
    RANK() OVER(ORDER BY COUNT(o.order_id) DESC) AS customer_rank
FROM customers c
LEFT JOIN orders o
    ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.name;

-- Rank deliveries by speed
select 
    delivery_id,
    delivery_partner,
    delivery_days,
    RANK() OVER(ORDER BY delivery_days ASC) AS speed_rank
FROM deliveries;

-- Ranking without PARTITION BY
select 
    name,
    RANK() OVER(ORDER BY name) AS name_rank
FROM customers;

-- Ranking with JOIN
select 
    c.name,
    o.order_id,
    ROW_NUMBER() OVER(PARTITION BY c.customer_id ORDER BY o.order_date) AS order_sequence
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id;

-- Compare RANK vs DENSE_RANK output
select 
    product_name,
    price,
    RANK() OVER(ORDER BY price DESC) AS rank_val,
    DENSE_RANK() OVER(ORDER BY price DESC) AS dense_rank_val
FROM products;

-- Create leaderboard query
SELECT *
FROM (
    SELECT 
        c.name,
        COUNT(o.order_id) AS total_orders,
        RANK() OVER(ORDER BY COUNT(o.order_id) DESC) AS leaderboard_rank
    FROM customers c
    LEFT JOIN orders o
        ON c.customer_id = o.customer_id
    GROUP BY c.customer_id, c.name
) AS leaderboard
ORDER BY leaderboard_rank;

-- Extract year from orders
SELECT order_id, YEAR(order_date) AS order_year
FROM orders;

-- Extract month from orders
SELECT order_id, MONTH(order_date) AS order_month
FROM orders;

-- Show today’s date
SELECT CURDATE() AS today_date;

-- Add 10 days to order date
SELECT 
    order_id,
    order_date,
    DATE_ADD(order_date, INTERVAL 10 DAY) AS new_date
FROM orders;

-- Find orders from last 15 days
select *
FROM orders
WHERE order_date >= CURDATE() - INTERVAL 15 DAY;

-- Calculate days since each order
select 
    order_id,
    order_date,
    DATEDIFF(CURDATE(), order_date) AS days_since_order
FROM orders;

-- Count orders per month
select
    YEAR(order_date) AS year,
    MONTH(order_date) AS month,
    COUNT(*) AS total_orders
FROM orders
GROUP BY YEAR(order_date), MONTH(order_date)
ORDER BY year, month;

-- Find oldest order
select *
FROM orders
WHERE order_date = (SELECT MIN(order_date) FROM orders);

-- Find most recent order
select *
FROM orders
WHERE order_date = (SELECT MAX(order_date) FROM orders);

-- Calculate average delivery days
select AVG(delivery_days) AS avg_delivery_days
FROM deliveries;

-- Show orders in January
select *
FROM orders
where month(order_date) = 1;

-- Find orders placed this year
select *
FROM orders
where Year(order_date) = YEAR(CURDATE());

-- Concatenate name & email
select 
    CONCAT(name, ' - ', email) AS customer_info
FROM customers;

-- Convert all product names to uppercase
select 
    UPPER(product_name) AS product_upper
FROM products;

-- Extract first 4 letters of product name
select 
    product_name,
    LEFT(product_name, 4) AS first_four
FROM products;

-- Extract last 3 letters
select 
    product_name,
    RIGHT(product_name, 3) AS last_three
FROM products;

-- Replace COD with Cash
select 
    order_id,
    REPLACE(payment_method, 'COD', 'Cash') AS updated_payment
FROM orders;

-- Trim spaces from names
select 
    TRIM(name) AS trimmed_name
FROM customers;

-- Count length of seller names
select 
    seller_name,
    LENGTH(seller_name) AS name_length
FROM sellers;

-- Extract email domain
select 
    email,
    SUBSTRING_INDEX(email, '@', -1) AS email_domain
FROM customers;

-- Create short product cod
select 
    product_name,
    CONCAT(UPPER(LEFT(product_name, 3)), product_id) AS product_code
FROM products;

-- Combine category + price
select 
    CONCAT(category, ' - ₹', price) AS category_price
FROM products;

-- Standardize payment method to lowercase
select 
    order_id,
    LOWER(payment_method) AS payment_lower
from orders;

-- Format name properly
select 
    CONCAT(
        UPPER(LEFT(name,1)),
        LOWER(SUBSTRING(name,2))
    ) AS formatted_name
from customers;

/*
What is DATE datatype?
DATE stores only date values in format YYYY-MM-DD.

Difference between DATE and DATETIME
DATE stores only date, while DATETIME stores both date and time.

What does NOW() return?
NOW() returns the current date and time.

Difference between NOW() and CURDATE()
NOW() returns date + time, while CURDATE() returns only the date.

How does DATEDIFF work?
DATEDIFF(date1, date2) returns the number of days between two dates.

What is INTERVAL?
INTERVAL is used to add or subtract time units (days, months, years) from a date.

How to calculate last 30 days?
Use: WHERE order_date >= CURDATE() - INTERVAL 30 DAY.

Can we group by month only?
Yes, but it may mix same months from different years.

Why year & month grouped together?
To avoid combining data from different years into one month group.

What is recency analysis?
Recency analysis measures how recently a customer made a purchase.

Date functions in analytics?
Common ones are YEAR(), MONTH(), DAY(), DATEDIFF(), DATE_ADD(), NOW(), CURDATE().

Common date mistakes in SQL?
Ignoring time part, mixing years in grouping, wrong date format, and timezone issues.
**********************************************************************************************8
What is CONCAT?
CONCAT joins two or more strings into one single string.

Difference between UPPER and LOWER
UPPER converts text to uppercase, while LOWER converts text to lowercase.

What does LENGTH return?
LENGTH returns the number of characters (or bytes) in a string.

What is SUBSTRING?
SUBSTRING extracts a specific part of a string based on position and length.

Difference between LEFT and SUBSTRING
LEFT extracts characters from the beginning, while SUBSTRING can extract from any position.

Purpose of REPLACE
REPLACE substitutes a specific part of a string with another value.

What does TRIM do?
TRIM removes leading and trailing spaces from a string.

How to extract email domain?
Use SUBSTRING_INDEX(email, '@', -1) to get the part after @.

Why clean text before analysis?
To ensure accurate results by removing inconsistencies like spaces, case differences, and duplicates.

Case sensitivity in SQL?
It depends on collation; some databases are case-sensitive, others are not.

Can multiple string functions be nested?
Yes, multiple string functions can be combined inside one query.

Real-world use case of string cleaning?
Standardizing customer names or emails before generating reports or sending marketing emails.
*****************************************************************************************************************
What is CASE WHEN?
CASE WHEN is a conditional expression in SQL used to apply logic like if-else inside queries.

Difference between IF and CASE
IF is a simple conditional function (mostly in MySQL), while CASE is standard SQL and supports multiple conditions.

Is ELSE mandatory?
No, ELSE is optional; if omitted and no condition matches, it returns NULL.

Can CASE be used with aggregates?
Yes, CASE can be used inside aggregate functions like SUM or COUNT for conditional aggregation.

Can CASE be used in ORDER BY?
Yes, CASE can control custom sorting logic in ORDER BY.

Can CASE be nested?
Yes, CASE expressions can be nested inside another CASE.

How does SQL evaluate CASE?
SQL evaluates conditions from top to bottom and stops when the first true condition is found.

CASE vs WHERE difference
CASE returns values based on conditions, while WHERE filters rows based on conditions.

When to use CASE?
Use CASE for categorization, conditional calculations, and custom grouping in reports.

Can CASE return NULL?
Yes, if no condition matches and there is no ELSE clause.

Performance impact of CASE?
Usually minimal, but complex CASE logic on large datasets may slightly impact performance.

Real-world business uses of CASE
Classifying customers as Gold/Silver/Bronze, calculating discounts, or marking high-value orders.

*/  

 
