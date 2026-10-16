# Week 3 — Day 2: DAX Basics

## Dataset

**Dataset:** North Sales (`north_sales.csv`)

**Available columns:** `id`, `product`, `region`, `amount`, `sale_date`, `quantity`, `discount`

**Objective:** Write DAX expressions to create calculated columns and measures for dynamic business reporting.

---

## 1. CALCULATE() — Apply Filters on Measures

### DAX Expression

```dax
North Sales =
CALCULATE(
    SUM(north_sales[amount]),
    north_sales[region] = "North"
)
```

### Explanation

- `SUM(north_sales[amount])` calculates the total sales amount.
- `CALCULATE()` evaluates the expression under a modified filter context.
- `north_sales[region] = "North"` filters the calculation to include only sales from the North region.

### Application

This measure can be used in a Power BI card or chart to display sales for the North region. If the dataset contains only North-region records, the result will equal the overall sales total.

---

## 2. YTD Sales Using DATESYTD()

YTD stands for **Year-to-Date**. It calculates sales from the beginning of the year through the current date in the report's date context.

### DAX Expression

```dax
YTD Sales =
CALCULATE(
    SUM(north_sales[amount]),
    DATESYTD('Date'[Date])
)
```

### Explanation

- `SUM()` calculates the sales amount.
- `DATESYTD('Date'[Date])` returns dates from the start of the year through the relevant date.
- `CALCULATE()` evaluates total sales over those dates.

### Requirements

This measure requires a proper Date table named `'Date'`, containing a `[Date]` column. The Date table must be related to `north_sales[sale_date]` and configured appropriately in Power BI.

### Application

A YTD Sales measure helps businesses monitor sales performance throughout the year and compare progress against targets.

---

## 3. Running Total Using EARLIER()

A running total adds the current value to the values from earlier dates.

The following expression is a **calculated column** in the `north_sales` table.

### DAX Expression

```dax
Running Total =
CALCULATE(
    SUM(north_sales[amount]),
    FILTER(
        north_sales,
        north_sales[sale_date]
            <= EARLIER(north_sales[sale_date])
    )
)
```

### Explanation

- `EARLIER(north_sales[sale_date])` refers to the date from the outer row context.
- `FILTER()` selects rows whose dates are earlier than or equal to the current row's date.
- `SUM()` adds the selected sales amounts.
- `CALCULATE()` evaluates the sum under the resulting filter context.

### Important Note

If multiple sales records have the same date, this expression includes all records from that date in each matching running total. A unique ordering column is needed for a strict row-by-row running total.

The expression assumes `sale_date` contains valid dates and is stored as a date type.

### Application

Running totals help analysts track cumulative sales over time and understand how sales performance develops throughout a reporting period.

---

## 4. Calculated Column — Profit Margin %

Profit margin is the percentage of sales revenue remaining after subtracting costs.

### DAX Expression

If a valid `cost` column is available, the calculated column can be written as:

```dax
Profit Margin % =
DIVIDE(
    north_sales[amount] - north_sales[cost],
    north_sales[amount],
    0
) * 100
```

### Explanation

- `north_sales[amount] - north_sales[cost]` calculates profit.
- `DIVIDE()` divides profit by the sales amount and returns `0` if the denominator is zero.
- Multiplication by `100` converts the ratio into a percentage.

### Dataset Limitation

The current North Sales dataset does **not** contain a `cost` or `profit` column. Therefore, this expression is an example of the required DAX calculation, but it cannot run against the current dataset until valid cost data is added.

The `discount` column cannot automatically be treated as a cost or profit figure. A genuine profit margin requires actual cost data.

### Application

Profit margin helps businesses assess profitability and compare financial performance across products and regions.

---

## 5. Row Context, Filter Context, and Context Transition

### Row Context

Row context means that a calculation is evaluated for the current row. Calculated columns commonly use row context.

For example:

```dax
Discount Amount =
north_sales[amount] * north_sales[discount]
```

This calculated column evaluates the expression for each sales row.

### Filter Context

Filter context determines which rows are included in a calculation. It can come from report slicers, visual filters, page filters, or DAX expressions.

For example:

```dax
Sales Amount =
SUM(north_sales[amount])
```

If a user selects the North region in a slicer, the measure calculates sales for the rows that remain in the filter context.

### Context Transition

Context transition occurs when `CALCULATE()` converts an existing row context into an equivalent filter context.

For example:

```dax
Sales with CALCULATE =
CALCULATE(
    SUM(north_sales[amount])
)
```

When this measure is evaluated without an existing row context, it generally returns the same result as the basic `Sales Amount` measure under the same filters.

However, when `CALCULATE()` is evaluated inside an existing row context, such as in a calculated column or iterator, context transition can affect the result.

### Summary of Differences

| Concept            | Meaning                                     | Example                               |
| ------------------ | ------------------------------------------- | ------------------------------------- |
| Row context        | Evaluates a calculation for the current row | Calculated column                     |
| Filter context     | Determines which rows are included          | Region slicer                         |
| Context transition | Converts row context into filter context    | `CALCULATE()` used within row context |

### Application

Understanding these contexts helps analysts write accurate DAX expressions and troubleshoot why measures return different values under different filters.

---

## Conclusion

DAX enables dynamic calculations and business reporting in Power BI.

The five practical topics covered are:

1. `CALCULATE()` for applying filters to measures.
2. `DATESYTD()` for year-to-date sales calculations.
3. `EARLIER()` for referencing an outer row context in a running-total calculated column.
4. A calculated column for profit margin percentage, with the requirement for valid cost data clearly identified.
5. Row context, filter context, and context transition.

These concepts help data analysts build meaningful measures, calculated columns, and interactive business reports.
