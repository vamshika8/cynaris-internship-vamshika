# Project 1: Indian E-Commerce Data Analysis

## Overview
This project explores an Indian e-commerce dataset using Python to identify patterns in order status, product category performance, customer segments, delivery performance, and monthly recorded order value.

The project was completed as part of the Data Analyst Intern Project 1 assignment.

## Objectives
- Perform exploratory data analysis (EDA) using Pandas.
- Check data quality, missing values, and duplicate records.
- Analyse customer, product, order, and shipment information.
- Create visualisations using Matplotlib.
- Summarise five business findings and practical recommendations.

## Dataset
The project uses the Kaggle **Indian E-Commerce Sales & Customer Analytics Dataset**.

The dataset contains five CSV files:
- `orders.csv`
- `customers.csv`
- `products.csv`
- `order_items.csv`
- `shipments.csv`

**Note:** The dataset is synthetically generated and may not represent real-world business performance.

## Tools and Technologies
- Python
- Pandas
- Matplotlib
- Jupyter Notebook
- Visual Studio Code

## Project Structure

```text
Project-1/
├── Data/
│   ├── customers.csv
│   ├── order_items.csv
│   ├── orders.csv
│   ├── products.csv
│   └── shipments.csv
├── project1_eda.ipynb
├── business_insight_report.md
└── README.md
```

## Analysis Performed
1. Data loading and initial inspection
2. Missing-value and duplicate checks
3. Working copies and date conversion
4. Order status analysis
5. Revenue analysis by product category
6. Customer segmentation analysis
7. Delivery time and delay-rate analysis
8. Monthly recorded order-value analysis

## Key Findings
- Approximately 80.68% of orders were marked as Delivered.
- Electronics recorded the highest category revenue, followed by Appliances.
- Premium customers had the highest average recorded spend.
- Next-Day shipping had a 10.60% delay rate, while Same-Day shipping had a 56.40% delay rate.
- December 2025 had the highest recorded monthly order value in the analysis.

See `business_insight_report.md` for the full findings, recommendations, and limitations.

## How to Run
1. Open the project folder in VS Code.
2. Ensure Python and Jupyter support are available.
3. Install the required libraries if needed:

   ```bash
   pip install pandas matplotlib jupyter
   ```

4. Open `project1_eda.ipynb`.
5. Run the notebook cells from top to bottom.

## Limitations
The dataset is synthetic. Recorded order value should not automatically be treated as realised revenue, and the findings should be validated before being used for real-world business decisions.
