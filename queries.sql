-- ==========================================================
-- E-Commerce Database Management System
-- SQL Queries
-- ==========================================================

-- ==========================================================
-- Verify Data Insertion
-- ==========================================================

SELECT * FROM users;
SELECT * FROM categories;
SELECT * FROM products;
SELECT * FROM cart;
SELECT * FROM cart_items;
SELECT * FROM orders;
SELECT * FROM order_items;
SELECT * FROM payments;
SELECT * FROM delivery;

-- ==========================================================
-- Practice Queries
-- ==========================================================

-- 1. Display all customer details from the users table.

SELECT *
FROM users;

-- ==========================================================

-- 2. Display all product details with their category names.

SELECT p.product_id,
       p.product_name,
       c.category_name,
       p.price,
       p.stock_quantity
FROM products p
JOIN categories c
ON p.category_id = c.category_id;

-- ==========================================================

-- 3. Display products whose price is greater than 10000.

SELECT *
FROM products
WHERE price > 10000;

-- ==========================================================

-- 4. Display products whose stock quantity is less than 20.

SELECT *
FROM products
WHERE stock_quantity < 20;

-- ==========================================================

-- 5. Display the total number of products available in each category.

SELECT c.category_name,
       COUNT(p.product_id) AS total_products
FROM categories c
LEFT JOIN products p
ON c.category_id = p.category_id
GROUP BY c.category_name;

-- ==========================================================

-- 6. Display customer names along with their order details.

SELECT u.full_name,
       o.order_id,
       o.order_date,
       o.total_amount
FROM users u
JOIN orders o
ON u.user_id = o.user_id;

-- ==========================================================

-- 7. Display order details along with payment information.

SELECT o.order_id,
       o.order_date,
       o.total_amount,
       p.payment_method,
       p.payment_status
FROM orders o
JOIN payments p
ON o.order_id = p.order_id;

-- ==========================================================

-- 8. Find the highest-priced product in the products table.

SELECT *
FROM products
WHERE price = (
SELECT MAX(price)
FROM products
);

-- ==========================================================

-- 9. Find the second highest-priced product.

SELECT *
FROM products
ORDER BY price DESC
LIMIT 1 OFFSET 1;

-- ==========================================================

-- 10. Display the total amount spent by each customer.

SELECT u.full_name,
       SUM(o.total_amount) AS total_spent
FROM users u
JOIN orders o
ON u.user_id = o.user_id
GROUP BY u.full_name;

-- ==========================================================

-- 11. Display customers who have not placed any orders.

SELECT u.user_id,
       u.full_name
FROM users u
LEFT JOIN orders o
ON u.user_id = o.user_id
WHERE o.order_id IS NULL;

-- ==========================================================

-- 12. Display products that have never been ordered.

SELECT p.product_name
FROM products p
LEFT JOIN order_items oi
ON p.product_id = oi.product_id
WHERE oi.product_id IS NULL;

-- ==========================================================

-- 13. Display the top 3 most expensive products.

SELECT product_name,
       price
FROM products
ORDER BY price DESC
LIMIT 3;

-- ==========================================================

-- 14. Display category-wise total sales amount.

SELECT c.category_name,
       SUM(oi.quantity * oi.price) AS total_sales
FROM categories c
JOIN products p
ON c.category_id = p.category_id
JOIN order_items oi
ON p.product_id = oi.product_id
GROUP BY c.category_name;

-- ==========================================================

-- 15. Display a complete purchase report containing customer
--     name, product name, order details, and payment status.

SELECT u.full_name,
       o.order_id,
       o.order_date,
       p.product_name,
       oi.quantity,
       oi.price,
       pay.payment_status
FROM users u
JOIN orders o
ON u.user_id = o.user_id
JOIN order_items oi
ON o.order_id = oi.order_id
JOIN products p
ON oi.product_id = p.product_id
JOIN payments pay
ON o.order_id = pay.order_id;

-- ==========================================================
-- Additional Practice Queries
-- ==========================================================

-- 16. Display the total number of customers.

SELECT COUNT(*) AS total_customers
FROM users;

-- ==========================================================

-- 17. Display the total number of products.

SELECT COUNT(*) AS total_products
FROM products;

-- ==========================================================

-- 18. Display the average product price.

SELECT AVG(price) AS average_price
FROM products;

-- ==========================================================

-- 19. Display all delivered orders.

SELECT *
FROM delivery
WHERE delivery_status = 'Delivered';

-- ==========================================================

-- 20. Display all successful payments.

SELECT *
FROM payments
WHERE payment_status = 'Completed';

-- ==========================================================
-- ==========================================================
-- Additional Analytical Queries
-- ==========================================================

-- 21. Display complete purchase history of every customer.

SELECT c.customer_name,
       o.order_id,
       o.order_date,
       p.product_name,
       oi.quantity,
       oi.price,
       (oi.quantity * oi.price) AS total_price
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
JOIN order_items oi
ON o.order_id = oi.order_id
JOIN products p
ON oi.product_id = p.product_id
ORDER BY c.customer_name, o.order_date;

-- ==========================================================

-- 22. Find the best-selling product.

SELECT p.product_name,
       SUM(oi.quantity) AS total_quantity_sold
FROM products p
JOIN order_items oi
ON p.product_id = oi.product_id
GROUP BY p.product_name
ORDER BY total_quantity_sold DESC
LIMIT 1;

-- ==========================================================

-- 23. Display the Top 5 best-selling products.

SELECT p.product_name,
       SUM(oi.quantity) AS total_quantity_sold
FROM products p
JOIN order_items oi
ON p.product_id = oi.product_id
GROUP BY p.product_name
ORDER BY total_quantity_sold DESC
LIMIT 5;

-- ==========================================================

-- 24. Find the customer who spent the most money.

SELECT c.customer_name,
       SUM(o.total_amount) AS total_spent
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_name
ORDER BY total_spent DESC
LIMIT 1;

-- ==========================================================

-- 25. Display monthly sales report.

SELECT MONTH(order_date) AS month,
       SUM(total_amount) AS total_sales
FROM orders
GROUP BY MONTH(order_date)
ORDER BY month;

-- ==========================================================

-- 26. Display total orders placed by each customer.

SELECT c.customer_name,
       COUNT(o.order_id) AS total_orders
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_name;

-- ==========================================================

-- 27. Display products with their available stock.

SELECT product_name,
       stock
FROM products
ORDER BY stock DESC;

-- ==========================================================

-- 28. Find out-of-stock products.

SELECT product_name
FROM products
WHERE stock = 0;

-- ==========================================================

-- 29. Display pending deliveries.

SELECT d.delivery_id,
       o.order_id,
       c.customer_name,
       d.delivery_partner,
       d.delivery_status
FROM delivery d
JOIN orders o
ON d.order_id = o.order_id
JOIN customers c
ON o.customer_id = c.customer_id
WHERE d.delivery_status <> 'Delivered';

-- ==========================================================

-- 30. Display payment summary by payment mode.

SELECT payment_mode,
       COUNT(*) AS total_transactions,
       SUM(amount) AS total_amount
FROM payments
GROUP BY payment_mode;

-- ==========================================================

-- 31. Find the most popular product category.

SELECT c.category_name,
       SUM(oi.quantity) AS total_items_sold
FROM categories c
JOIN products p
ON c.category_id = p.category_id
JOIN order_items oi
ON p.product_id = oi.product_id
GROUP BY c.category_name
ORDER BY total_items_sold DESC
LIMIT 1;

-- ==========================================================

-- 32. Display average order value.

SELECT ROUND(AVG(total_amount),2) AS average_order_value
FROM orders;

-- ==========================================================

-- 33. Display customers from each city.

SELECT city,
       COUNT(*) AS total_customers
FROM customers
GROUP BY city;

-- ==========================================================

-- 34. Find customers who purchased more than three products.

SELECT c.customer_name,
       SUM(oi.quantity) AS total_products_purchased
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
JOIN order_items oi
ON o.order_id = oi.order_id
GROUP BY c.customer_name
HAVING SUM(oi.quantity) > 3;

-- ==========================================================

-- 35. Display revenue generated by each product.

SELECT p.product_name,
       SUM(oi.quantity * oi.price) AS revenue
FROM products p
JOIN order_items oi
ON p.product_id = oi.product_id
GROUP BY p.product_name
ORDER BY revenue DESC;
