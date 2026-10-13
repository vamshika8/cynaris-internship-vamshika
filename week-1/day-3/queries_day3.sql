-- Day 3: SQL Aggregations - GROUP BY & HAVING

-- Query 1: COUNT
SELECT COUNT(*) AS total_sales
FROM north_sales;


-- Query 2: SUM
SELECT SUM(CAST(amount AS REAL)) AS total_amount
FROM north_sales;


-- Query 3: AVG
SELECT AVG(CAST(amount AS REAL)) AS average_amount
FROM north_sales;


-- Query 4: MAX
SELECT MAX(CAST(amount AS REAL)) AS highest_amount
FROM north_sales;


-- Query 5: MIN
SELECT MIN(CAST(amount AS REAL)) AS lowest_amount
FROM north_sales;


-- Query 6: GROUP BY Region
SELECT
    region,
    SUM(CAST(amount AS REAL)) AS total_sales
FROM north_sales
GROUP BY region;


-- Query 7: GROUP BY Product
SELECT
    product,
    SUM(CAST(amount AS REAL)) AS total_sales
FROM north_sales
GROUP BY product;


-- Query 8: GROUP BY Month with HAVING
SELECT
    SUBSTR(sale_date, 1, 7) AS sale_month,
    SUM(CAST(amount AS REAL)) AS total_sales
FROM north_sales
GROUP BY SUBSTR(sale_date, 1, 7)
HAVING SUM(CAST(amount AS REAL)) > 50000;


-- Query 9: Window Function
SELECT
    product,
    amount,
    SUM(CAST(amount AS REAL)) OVER() AS overall_sales
FROM north_sales;