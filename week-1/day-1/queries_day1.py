import sqlite3
import pandas as pd

# Create in-memory database
conn = sqlite3.connect(":memory:")
cursor = conn.cursor()

# Create sales table
cursor.execute("""
CREATE TABLE sales (
    id INTEGER PRIMARY KEY,
    product TEXT,
    region TEXT,
    amount DECIMAL(10,2),
    sale_date DATE,
    quantity INTEGER,
    discount DECIMAL(4,2)
)
""")

# Insert sample sales data
cursor.executemany(
    "INSERT INTO sales VALUES (?, ?, ?, ?, ?, ?, ?)",
    [
        (1, "Laptop", "North", 85000, "2026-01-15", 2, 0.05),
        (2, "Phone", "South", 45000, "2026-02-20", 5, 0.10),
        (3, "Tablet", "East", 32000, "2026-01-28", 3, 0.00),
        (4, "Laptop", "West", 85000, "2026-03-10", 1, 0.15),
        (5, "Phone", "North", 45000, "2026-02-05", 4, 0.05),
        (6, "Headphones", "South", 8000, "2026-03-15", 10, 0.00),
        (7, "Tablet", "North", 32000, "2026-04-01", 2, 0.08),
        (8, "Laptop", "East", 85000, "2026-01-20", 3, 0.10),
        (9, "Phone", "West", 45000, "2026-04-18", 6, 0.00),
        (10, "Headphones", "East", 8000, "2026-02-28", 8, 0.05),
        (11, "Tablet", "South", 32000, "2026-03-22", 1, 0.12),
        (12, "Laptop", "South", 85000, "2026-05-10", 2, None),
    ],
)

conn.commit()

# Query 1: Select all sales
query1 = pd.read_sql(
    "SELECT * FROM sales",
    conn
)
print("\nQuery 1 - All sales:")
print(query1)

# Query 2: WHERE - Sales from North region
query2 = pd.read_sql(
    "SELECT * FROM sales WHERE region = 'North'",
    conn
)
print("\nQuery 2 - North region:")
print(query2)

# Query 3: AND - Laptops sold in North region
query3 = pd.read_sql(
    "SELECT * FROM sales WHERE product = 'Laptop' AND region = 'North'",
    conn
)
print("\nQuery 3 - Laptops in North:")
print(query3)

# Query 4: OR - Sales from North or South
query4 = pd.read_sql(
    "SELECT * FROM sales WHERE region = 'North' OR region = 'South'",
    conn
)
print("\nQuery 4 - North or South:")
print(query4)

# Query 5: NOT - Products that are not Phones
query5 = pd.read_sql(
    "SELECT * FROM sales WHERE NOT product = 'Phone'",
    conn
)
print("\nQuery 5 - Not Phones:")
print(query5)

# Query 6: LIKE - Products beginning with 'Lap'
query6 = pd.read_sql(
    "SELECT * FROM sales WHERE product LIKE 'Lap%'",
    conn
)
print("\nQuery 6 - Products starting with Lap:")
print(query6)

# Query 7: IN - Sales from selected regions
query7 = pd.read_sql(
    "SELECT * FROM sales WHERE region IN ('North', 'East')",
    conn
)
print("\nQuery 7 - North or East:")
print(query7)

# Query 8: BETWEEN - Sales amounts between 30000 and 50000
query8 = pd.read_sql(
    "SELECT * FROM sales WHERE amount BETWEEN 30000 AND 50000",
    conn
)
print("\nQuery 8 - Amount between 30000 and 50000:")
print(query8)

# Query 9: IS NULL - Sales where discount is missing
query9 = pd.read_sql(
    "SELECT * FROM sales WHERE discount IS NULL",
    conn
)
print("\nQuery 9 - Missing discount:")
print(query9)

# Query 10: AND + BETWEEN - North sales with amount between 30000 and 90000
query10 = pd.read_sql(
    """
    SELECT * FROM sales
    WHERE region = 'North'
    AND amount BETWEEN 30000 AND 90000
    """,
    conn
)
print("\nQuery 10 - North sales between 30000 and 90000:")
print(query10)

# Export one result to CSV
query2.to_csv("north_sales.csv", index=False)

print("\nExported north_sales.csv successfully.")

conn.close()