# retail-sales-sql-analysis
A SQL project analyzing retail sales data to gain insights on revenue, order trends, and product performance.
# 🛍️ Retail Sales Analysis with SQL

This project is a **Business Intelligence Report** created using **SQL** to analyze retail sales data. It includes data cleaning, analysis of customer behavior, and key sales insights. The goal is to uncover trends and KPIs to assist in better decision-making.

---

## 📊 About the Project

This sales report was built using SQL to explore and analyze a retail dataset. The report focuses on answering key business questions and identifying patterns in customer behavior and sales performance.

### 🔍 Key Areas of Analysis:
- Customer Age Distribution
- Gender Breakdown
- Geographic Sales Distribution
- Purchase Frequency and Quantity
- Revenue Trends

---

## 🧹 Data Cleaning

Initial data cleaning was done using SQL:
- Handled **null values** in important columns like `quantity` and `total_price`
- Removed irrelevant or incomplete rows to ensure accuracy

```sql
-- Remove rows with NULL values
DELETE FROM sales_data
WHERE quantity IS NULL OR total_price IS NULL;
