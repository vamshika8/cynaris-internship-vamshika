# Data Cleaning Log — Week 2 Day 4

## Dataset Overview

- **Input file:** `north_sales.csv`
- **Output file:** `cleaned_dataset.csv`
- **Original records:** 3
- **Final records:** 3

## Data Quality Checks

### 1. Missing Values

Checked all columns using `isnull().sum()`. No missing values were found, so no imputation was required.

### 2. Duplicate Records

Checked for duplicate rows. No duplicates were found.

### 3. Data Types

Converted `sale_date` from string to datetime using `pd.to_datetime()`.

### 4. Inconsistent Strings

Applied whitespace trimming and title-case standardization to the `product` and `region` columns.

### 5. Outlier Detection

Used the Interquartile Range (IQR) method on `amount`, `quantity`, and `discount`. No outliers were detected, so no records were removed or capped.

## Final Result

Saved the cleaned dataset as `cleaned_dataset.csv`. All 3 original records and 7 columns were retained.

## Limitations

The dataset contains only 3 records, so the cleaning results and outlier assessment are limited by the small sample size.
