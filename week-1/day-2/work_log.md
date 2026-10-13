# Week 1 - Day 2 Work Log

## CIA Insight

### Question

How does JOIN order affect SQL query performance?

### Insight

JOIN order can affect query performance because the database optimizer decides how tables are joined and processed.

Important points:

- Filtering data early can reduce the number of rows processed.
- Proper indexes on join keys can improve performance.
- Incorrect or outdated statistics can lead to a poor join plan.
- Different join algorithms such as nested-loop, hash, and merge joins may be selected based on the data.
- EXPLAIN or EXPLAIN ANALYZE can be used to inspect the query execution plan.

### Key Takeaway

For better JOIN performance, filter data early, use appropriate indexes, keep statistics updated, and check the execution plan before changing JOIN order.
