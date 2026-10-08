-- Day 4 | SQL Subqueries & CTEs

-- 1. Non-correlated subquery: Above-average sales
SELECT
    product,
    region,
    amount
FROM north_sales
WHERE CAST(amount AS REAL) > (
    SELECT AVG(CAST(amount AS REAL))
    FROM north_sales
);


-- 2. Correlated subquery: Top performer per region
SELECT
    s1.product,
    s1.region,
    s1.amount
FROM north_sales s1
WHERE CAST(s1.amount AS REAL) = (
    SELECT MAX(CAST(s2.amount AS REAL))
    FROM north_sales s2
    WHERE s2.region = s1.region
);


-- 3. CTE: Top performer per region
WITH region_max AS (
    SELECT
        region,
        MAX(CAST(amount AS REAL)) AS max_amount
    FROM north_sales
    GROUP BY region
)
SELECT
    n.product,
    n.region,
    n.amount
FROM north_sales n
JOIN region_max r
    ON n.region = r.region
    AND CAST(n.amount AS REAL) = r.max_amount;


-- 4. Chain 2 CTEs
WITH region_sales AS (
    SELECT
        region,
        SUM(CAST(amount AS REAL)) AS total_sales
    FROM north_sales
    GROUP BY region
),
above_average_regions AS (
    SELECT
        region,
        total_sales
    FROM region_sales
    WHERE total_sales > (
        SELECT AVG(total_sales)
        FROM region_sales
    )
)
SELECT
    region,
    total_sales
FROM above_average_regions;