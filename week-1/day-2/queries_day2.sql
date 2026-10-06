-- Week 1 - Day 2: SQL Joins
-- SQL Joins - Combining Tables


-- ============================================
-- 1. CREATE TABLES
-- ============================================

CREATE TABLE customers (
    customer_id INTEGER PRIMARY KEY,
    customer_name TEXT,
    city TEXT
);

CREATE TABLE orders (
    order_id INTEGER PRIMARY KEY,
    customer_id INTEGER,
    amount DECIMAL(10, 2),
    order_date DATE
);


-- ============================================
-- 2. INSERT SAMPLE DATA
-- ============================================

INSERT INTO customers VALUES
(1, 'Asha', 'Bangalore'),
(2, 'Rahul', 'Mumbai'),
(3, 'Priya', 'Delhi'),
(4, 'Arjun', 'Chennai');

INSERT INTO orders VALUES
(101, 1, 5000, '2026-01-10'),
(102, 2, 3000, '2026-01-15'),
(103, 1, 2000, '2026-02-05'),
(104, 5, 7000, '2026-02-20');


-- ============================================
-- 3. INNER JOIN
-- Returns only matching records
-- ============================================

SELECT
    c.customer_id,
    c.customer_name,
    o.order_id,
    o.amount
FROM customers AS c
INNER JOIN orders AS o
    ON c.customer_id = o.customer_id;


-- ============================================
-- 4. LEFT JOIN
-- Returns all customers and matching orders
-- ============================================

SELECT
    c.customer_id,
    c.customer_name,
    o.order_id,
    o.amount
FROM customers AS c
LEFT JOIN orders AS o
    ON c.customer_id = o.customer_id;


-- ============================================
-- 5. RIGHT JOIN
-- Returns all orders and matching customers
-- ============================================

SELECT
    c.customer_id,
    c.customer_name,
    o.order_id,
    o.amount
FROM customers AS c
RIGHT JOIN orders AS o
    ON c.customer_id = o.customer_id;


-- ============================================
-- 6. FULL OUTER JOIN
-- Returns all matching and non-matching records
-- ============================================

SELECT
    c.customer_id,
    c.customer_name,
    o.order_id,
    o.amount
FROM customers AS c
FULL OUTER JOIN orders AS o
    ON c.customer_id = o.customer_id;


-- ============================================
-- 7. DUPLICATE ROWS CAUSED BY JOIN
-- Customer 1 has multiple orders.
-- Therefore, the customer appears more than once.
-- We can aggregate orders to avoid repeated rows.
-- ============================================

SELECT
    c.customer_id,
    c.customer_name,
    COUNT(o.order_id) AS total_orders,
    COALESCE(SUM(o.amount), 0) AS total_amount
FROM customers AS c
LEFT JOIN orders AS o
    ON c.customer_id = o.customer_id
GROUP BY
    c.customer_id,
    c.customer_name;


-- ============================================
-- 8. SELF JOIN
-- Example: employees reporting to managers
-- ============================================

CREATE TABLE employees (
    employee_id INTEGER PRIMARY KEY,
    employee_name TEXT,
    manager_id INTEGER
);

INSERT INTO employees VALUES
(1, 'Anita', NULL),
(2, 'Rahul', 1),
(3, 'Priya', 1),
(4, 'Arjun', 2);

SELECT
    e.employee_name AS employee,
    m.employee_name AS manager
FROM employees AS e
LEFT JOIN employees AS m
    ON e.manager_id = m.employee_id;


-- ============================================
-- 9. TABLE ALIASES
-- Short aliases make JOIN queries easier to read.
-- ============================================

SELECT
    c.customer_name,
    o.amount
FROM customers AS c
INNER JOIN orders AS o
    ON c.customer_id = o.customer_id;