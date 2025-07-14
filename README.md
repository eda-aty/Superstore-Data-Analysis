# 📊 Superstore Sales Analysis with SQL

This project involves analyzing 4 years of Superstore sales data (2014–2017) to uncover trends in sales, profitability, customer behavior, and regional performance. Using SQL and dashboards, the goal is to provide actionable insights that inform strategic business decisions.

---

## 📂 Table of Contents

1. [📘 Project Overview](#-project-overview)  
2. [📁 Dataset](#-dataset)  
3. [🧰 Tools & Methodology](#-tools--methodology)  
4. [🎯 Project Objectives](#-project-objectives)  
5. [🔎 EDA & Business Questions](#-eda--business-questions)  
6. [📈 Dashboard](#-dashboard)  
7. [📌 Key Insights](#-key-insights)  
8. [✅ Recommendations](#-recommendations)  

---

## 📘 Project Overview

The objective is to perform a comprehensive SQL-based analysis of a retail Superstore dataset. The insights extracted will help:

- Improve sales and profit strategies
- Optimize shipping modes and discounts
- Identify top-performing customer segments and product categories

### 🎯 Motivation

This project helps develop and showcase SQL skills using a realistic business scenario. The dataset mirrors actual retail operations, making it perfect for learning advanced querying and data visualization.

---

## 📁 Dataset

- **Source**: Kaggle - Superstore Sales Dataset  
- **Period**: 2014–2017  
- **Rows**: 9,994  
- **Columns**: 21  
- **Key Fields**:  
  - Customer Info: `Customer ID`, `Segment`, `Region`  
  - Product Info: `Product ID`, `Category`, `Sub-Category`  
  - Sales Info: `Sales`, `Quantity`, `Profit`, `Discount`  
  - Dates: `Order Date`, `Ship Date`

---

## 🧰 Tools & Methodology

- **SQL Engine**: PostgreSQL  
- **Data Cleaning**: Excel & Google Sheets  
- **Visualization**: Looker Studio, Tableau  
- **Steps**:
  1. Cleaned and uploaded data to PostgreSQL
  2. Extracted KPIs and built views
  3. Ran SQL queries by product, region, segment, shipping mode, etc.
  4. Created dashboards with filters for time, region, category, and shipping mode

---

## 🎯 Project Objectives

- 📈 Track Sales & Profit Growth  
- 🛍 Identify High-Performing Products & Categories  
- 👥 Segment Customers by Value  
- 🌍 Compare Regional Performance  
- 🚚 Evaluate Shipping Mode Efficiency  

---

## 🔎 EDA & Business Questions

- What are the monthly/yearly sales trends?
- Which products, categories, and sub-categories generate the most profit?
- Which region/city leads in sales?
- How do discounts affect profits?
- Who are the top customers?
- What is the most efficient shipping mode?

---

## 📈 Dashboard

- 🔗 [Looker Studio Dashboard](https://lookerstudio.google.com/s/rOovr7ZG6aU)  
- 🔗 [Tableau Dashboard](https://public.tableau.com/views/SuperstoreSaleAnalysis_17394633843600/Dashboard6)

---

## 📌 Key Insights

- 💰 $2.3M in sales across 5,009 orders  
- 🏆 Best-performing region: West  
- 📉 Central region struggles with Furniture profitability  
- 🖨 Highest profit sub-categories: Phones, Copiers, Accessories  
- ❗ Loss leaders: Tables, Bookcases (due to high discounting)  
- 🚚 Standard Class shipping is most profitable  
- 🧍‍♂️ Top customer: Sean Miller  

---

## ✅ Recommendations

- 📉 Reduce discounts for Tables & Bookcases  
- 🔊 Promote high-performing Technology products  
- 🚀 Focus on Standard Class shipping  
- 🎯 Launch loyalty programs for top customers  
- 🔍 Review Central region sales strategies  

---

## 📎 Resources

- [`/queries/sales_analysis_queries.sql`](queries/sales_analysis_queries.sql)  
- Dataset: `data/superstore_dataset.csv` (from Kaggle)  
- Dashboard screenshots in `/visuals/`  
