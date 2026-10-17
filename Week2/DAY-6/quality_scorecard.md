# Data Quality Scorecard — North Sales

## 1. Dataset Overview

- **Dataset:** north_sales.csv
- **Rows:** 3
- **Columns:** 7
- **Missing values:** 0

## 2. Data Quality Assessment

| Dimension    | Result | Observation                                          |
| ------------ | ------ | ---------------------------------------------------- |
| Completeness | PASS   | No missing values found                              |
| Accuracy     | PASS   | Amounts are non-negative and quantities are positive |
| Consistency  | PASS   | IDs are unique                                       |
| Timeliness   | PASS\* | All sale dates are valid dates                       |
| Uniqueness   | PASS   | No duplicate IDs found                               |
| Validity     | PASS   | Discounts are between 0 and 1                        |

_Timeliness is only partially assessed: valid dates do not prove that data is up to date._

## 3. Error Injection Test

Three intentional errors were introduced into a test copy:

1. Negative amount: -500
2. Invalid discount: 1.50
3. Invalid sale date: `invalid-date`

**Result:** All three errors were detected by the validation checks.

## 4. Recommendations

- Validate incoming sales data before processing.
- Reject negative amounts and non-positive quantities.
- Enforce discount limits between 0 and 1.
- Parse and validate all sale dates.
- Check for duplicate IDs and missing required fields.
- Use a larger dataset to evaluate quality more reliably.
- Define an agreed freshness SLA and monitor it regularly.

## 5. Limitations

This assessment uses only three records. Accuracy and timeliness require additional business rules and source verification before they can be fully confirmed.
