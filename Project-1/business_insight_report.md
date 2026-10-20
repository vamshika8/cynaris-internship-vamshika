# Business Insight Report: Indian E-Commerce Data Analysis

## 1. Introduction

The goal of this project was to explore an Indian e-commerce dataset and understand what the data could tell us about orders, product categories, customer behaviour, delivery performance, and monthly sales trends.

I used Python, Pandas, and Matplotlib to inspect the data, check for missing values and duplicates, perform exploratory data analysis (EDA), and create visualisations. The main aim was to identify useful business insights and suggest practical ways a business could investigate or improve its performance.

## 2. Dataset Overview

The project uses the **Indian E-Commerce Sales & Customer Analytics Dataset** from Kaggle. It contains synthetic e-commerce data covering orders, customers, products, order items, and shipments.

The five datasets used in this analysis contain:

| Dataset     | Number of rows |
| ----------- | -------------: |
| Orders      |        100,000 |
| Customers   |         25,000 |
| Products    |            550 |
| Order Items |        254,331 |
| Shipments   |         89,681 |

The datasets provide information about order status, product categories, customer segments, item revenue and profit, and delivery performance.

**Important note:** The dataset is synthetically generated. The findings describe patterns in the supplied data and should not be treated as verified results from a real e-commerce company.

## 3. Tools and Technologies Used

- **Python:** To perform the analysis.
- **Pandas:** To load, inspect, organise, and analyse the datasets.
- **Matplotlib:** To create charts and visualise patterns.
- **Jupyter Notebook in VS Code:** To write and run the analysis step by step.

## 4. Methodology

I followed these steps to complete the analysis:

1. Loaded all five CSV files into Pandas DataFrames.
2. Inspected the columns, data types, and sample records to understand the information available.
3. Checked each dataset for duplicate rows and missing values.
4. Created working copies of the datasets so that the original data remained unchanged.
5. Converted relevant date columns into datetime format for time-based analysis.
6. Analysed order status, product category performance, customer segments, delivery performance, and monthly recorded order value.
7. Created bar charts and a line chart to make the main patterns easier to understand.
8. Summarised the findings and developed recommendations based on the results.

Some missing values were present in fields such as coupon codes, campaign IDs, customer information, and delivery dates. I retained these values during the initial cleaning stage rather than deleting records without understanding why the information was missing.

## 5. Key Findings

### Finding 1: Most Orders Were Marked as Delivered

Out of 100,000 orders, 80,679 were marked as Delivered, representing approximately **80.68%** of all orders.

The remaining records included 8,073 Cancelled orders, 6,681 Returned orders, 2,880 Failed orders, and 1,687 Processing orders.

This shows that Delivered was by far the most common order status. However, cancellations, returns, and failed orders are still worth investigating because understanding their causes could help a business improve the customer experience and order fulfilment process.

**Recommendation:** Investigate the reasons for cancellations, returns, and failed orders. Group them by relevant factors, such as product category or delivery method, where the data supports it, to identify areas for further improvement.

### Finding 2: Electronics Had the Highest Recorded Category Revenue

The category revenue analysis showed that **Electronics had the highest recorded revenue**, followed by Appliances. The remaining categories contributed considerably less revenue in comparison.

This suggests that Electronics and Appliances deserve closer attention when reviewing product performance. However, high revenue alone does not necessarily mean that a category is the most profitable or should automatically receive more inventory.

**Recommendation:** Review revenue alongside profit, profit margin, stock levels, and demand before making inventory or product investment decisions. This would help distinguish categories that generate high sales from those that provide stronger profitability.

### Finding 3: Premium Customers Had the Highest Average Recorded Spend

The customer segmentation analysis showed clear differences between customer groups.

- **Premium:** 2,991 customers, with an average recorded spend of ₹286,622.67.
- **Regular:** 11,002 customers, making this the largest segment, with an average recorded spend of ₹110,862.48.
- **Budget:** 7,713 customers, with an average recorded spend of ₹45,355.25.
- **New:** 3,294 customers, with an average recorded spend of ₹22,451.50.

Premium customers had the highest average recorded spend, while Regular customers formed the largest customer group.

These patterns suggest that different customer groups may respond to different engagement strategies. Premium customers may be suitable for loyalty initiatives, while New customers could benefit from campaigns designed to encourage repeat purchases.

**Recommendation:** Test personalised loyalty benefits for Premium customers and relevant follow-up offers for New customers. Measure repeat purchases and customer spending to determine whether these initiatives make a meaningful difference.

### Finding 4: Delivery Time and Delay Rates Varied by Shipping Method

The delivery analysis revealed differences in both average delivery time and delay rates.

| Shipping method | Average delivery time | Delay rate |
| --------------- | --------------------: | ---------: |
| Same-Day        |             0.83 days |     56.40% |
| Next-Day        |             1.81 days |     10.60% |
| Express         |             2.30 days |     38.72% |
| Standard        |             4.81 days |     53.41% |
| Economy/Surface |             7.83 days |     37.27% |

Next-Day shipping had an average delivery time of 1.81 days and the lowest delay rate among the listed methods, at 10.60%. Economy/Surface had the longest average delivery time at 7.83 days. Standard shipping had the highest number of delayed shipments, with 21,519, while Same-Day shipping had the highest delay rate at 56.40%.

The high delay rates for Same-Day and Standard shipping are worth investigating. In particular, the Same-Day result is unexpected enough to warrant checking how delays are recorded and how delivery expectations are defined.

**Recommendation:** Investigate delays by shipping method and examine the reasons behind missed delivery expectations. Track both average delivery time and delay rate, while considering the cost and service promise of each method.

### Finding 5: Recorded Order Value Increased Sharply Towards the End of 2025

The monthly analysis showed that recorded order value generally increased from early 2023, with fluctuations during 2024 and the first part of 2025. A much sharper rise appeared in the final months of 2025.

December 2025 had the highest recorded monthly order value, at approximately **₹247.76 million (₹24.78 crore)**. October 2025 recorded a **65.92% increase** compared with September 2025. February 2023 had the largest month-on-month percentage increase in the calculated results, at 129.59%.

These changes are interesting, but they should not automatically be interpreted as actual business growth. The dataset is synthetic, and the late-2025 increase is large enough to deserve additional validation.

**Recommendation:** Check the underlying monthly records for unusual values, changes in order volume, and differences in average order value. In a real business, compare these results with campaign activity and other operational records before drawing conclusions about growth.

## 6. Overall Business Recommendations

Based on the analysis, I would recommend the following actions for further investigation:

1. **Improve order fulfilment:** Investigate cancelled, returned, and failed orders to understand the main causes and identify possible ways to reduce them.
2. **Make product decisions using profitability as well as revenue:** Review category-level profit, margins, and inventory before deciding which categories to prioritise.
3. **Build customer-specific engagement strategies:** Test loyalty benefits for Premium customers and repeat-purchase campaigns for New customers, then measure their results.
4. **Review delivery reliability:** Investigate high delay rates, especially for Same-Day and Standard shipping, and monitor delivery performance consistently.
5. **Validate unusual sales patterns:** Review sharp monthly increases and confirm whether they are supported by the underlying data before using them for planning.

These recommendations are starting points for further investigation, not proof that a particular business action will produce a specific result.

## 7. Limitations

There are several limitations to keep in mind:

- The dataset is synthetic and may not reflect actual customer behaviour or business operations.
- Missing values exist in some columns and may affect individual analyses.
- Recorded order value is not necessarily the same as realised revenue. The monthly calculation sums `final_amount` across order statuses, so cancelled and returned orders may be included.
- The findings describe patterns in the available data and do not establish that one factor caused another.
- Marketing profitability cannot be established without appropriate campaign cost and outcome information.

These limitations are important when interpreting the findings and deciding what additional checks would be needed before making business decisions.

## 8. Conclusion

This project helped me practise the complete EDA process, from loading and inspecting multiple datasets to checking data quality, analysing business patterns, and communicating findings through charts and a written report.

The analysis highlighted five main areas: order fulfilment, product category revenue, customer segmentation, delivery performance, and monthly recorded order value. It also showed why it is important to look beyond the numbers, validate unusual patterns, and understand the limitations of a dataset before making recommendations.

Overall, the project strengthened my practical experience with Python, Pandas, Matplotlib, and data-driven business analysis.

**Project tools:** Python, Pandas, Matplotlib, Jupyter Notebook, and VS Code.
