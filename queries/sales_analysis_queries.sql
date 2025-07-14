
-- 📊 Superstore Sales Analysis with SQL
-- Author: [Your Name]
-- Description: PostgreSQL queries answering business questions from 2014–2017 Superstore data.

-- 🔹 1. Basic KPIs
-- Total Customers, Orders, Sales, Profit, Quantity
SELECT 'Total Customers' AS kpi_name, COUNT(DISTINCT customer_id) AS value FROM superstore
UNION ALL
SELECT 'Total Orders', COUNT(DISTINCT order_id) FROM superstore
UNION ALL
SELECT 'Total Sales', ROUND(SUM(sales)) FROM superstore
UNION ALL
SELECT 'Total Profit', ROUND(SUM(profits)) FROM superstore
UNION ALL
SELECT 'Total Quantity', SUM(quantity) FROM superstore;

-- 🔹 2. Sales & Profit Trends by Year
SELECT EXTRACT(YEAR FROM order_date) AS year, SUM(sales) AS total_sales, SUM(profits) AS total_profit
FROM superstore
GROUP BY 1
ORDER BY 1 DESC;

-- 🔹 3. Monthly Sales and Profits (Most profitable months)
SELECT EXTRACT(MONTH FROM order_date) AS month, SUM(sales) AS total_sales
FROM superstore
GROUP BY 1
ORDER BY total_sales DESC;

SELECT EXTRACT(MONTH FROM order_date) AS month, SUM(profits) AS total_profit
FROM superstore
GROUP BY 1
ORDER BY total_profit DESC;

-- 🔹 4. Product Performance
-- Top 10 Selling Products
SELECT product_name, SUM(sales) AS total_sales
FROM superstore
GROUP BY 1
ORDER BY total_sales DESC
LIMIT 10;

-- Bottom 10 Products by Profit (Worst performing)
SELECT product_name, SUM(profits) AS total_profit
FROM superstore
GROUP BY 1
ORDER BY total_profit ASC
LIMIT 10;

-- 🔹 5. Category & Sub-category Analysis
SELECT category, SUM(sales) AS total_sales, SUM(profits) AS total_profit
FROM superstore
GROUP BY category
ORDER BY total_profit DESC;

SELECT sub_category, SUM(sales) AS total_sales, SUM(profits) AS total_profit
FROM superstore
GROUP BY sub_category
ORDER BY total_sales DESC;

-- 🔹 6. Top Customers (Rewards / Loyalty Candidates)
SELECT customer_id, customer_name, SUM(sales) AS total_sales, SUM(profits) AS total_profit
FROM superstore
GROUP BY customer_id, customer_name
ORDER BY total_sales DESC
LIMIT 15;

-- 🔹 7. Segment Performance Over Time
SELECT segment, EXTRACT(YEAR FROM order_date) AS year, SUM(sales) AS total_sales, SUM(profits) AS total_profit
FROM superstore
GROUP BY segment, year
ORDER BY total_sales DESC;

-- 🔹 8. Regional Analysis
SELECT region, COUNT(DISTINCT customer_id) AS total_customers, ROUND(SUM(sales)) AS total_sales, ROUND(SUM(profits)) AS total_profit
FROM superstore
GROUP BY region
ORDER BY total_sales DESC;

-- 🔹 9. Shipping Mode Analysis
SELECT ship_mode, ROUND(SUM(sales)) AS total_sales, ROUND(SUM(profits)) AS total_profit
FROM superstore
GROUP BY ship_mode
ORDER BY total_sales DESC;

SELECT ship_mode, ROUND(AVG(ship_date - order_date), 1) AS avg_shipping_time
FROM superstore
GROUP BY ship_mode
ORDER BY avg_shipping_time DESC;

-- 🔹 10. State & City Sales/Profit Rankings
SELECT state, ROUND(SUM(sales)) AS total_sales
FROM superstore
GROUP BY state
ORDER BY total_sales DESC
LIMIT 10;

SELECT city, ROUND(SUM(sales)) AS total_sales
FROM superstore
GROUP BY city
ORDER BY total_sales DESC
LIMIT 10;

-- 🔹 11. Quarterly Trends
SELECT 
  EXTRACT(YEAR FROM order_date) AS year,
  CASE 
    WHEN EXTRACT(MONTH FROM order_date) IN (1,2,3) THEN 'Q1'
    WHEN EXTRACT(MONTH FROM order_date) IN (4,5,6) THEN 'Q2'
    WHEN EXTRACT(MONTH FROM order_date) IN (7,8,9) THEN 'Q3'
    ELSE 'Q4'
  END AS quarter,
  SUM(sales) AS total_sales,
  SUM(profits) AS total_profit
FROM superstore
GROUP BY year, quarter
ORDER BY year, quarter;

-- 🔹 12. Discounts vs Profitability
SELECT category, SUM(discount) AS total_discount, SUM(sales) AS total_sales, SUM(profits) AS total_profit
FROM superstore
GROUP BY category
ORDER BY total_discount DESC;

-- Avg Discount & Profit per Sub-category
SELECT category, sub_category, ROUND(AVG(discount),3) AS avg_discount, ROUND(AVG(profits),3) AS avg_profit
FROM superstore
GROUP BY category, sub_category
ORDER BY avg_profit DESC;

-- 🔹 13. Category Ranking
SELECT category, ROUND(SUM(sales)) AS total_sales,
RANK() OVER (ORDER BY SUM(sales) DESC) AS category_rank
FROM superstore
GROUP BY category
ORDER BY category_rank;

-- 🔹 14. Create & Query a View
CREATE VIEW monthly_sales_trend AS
SELECT EXTRACT(YEAR FROM order_date) AS year, EXTRACT(MONTH FROM order_date) AS month, SUM(sales) AS total_sales
FROM superstore
GROUP BY year, month
ORDER BY year, month;

-- View the monthly sales trend
SELECT * FROM monthly_sales_trend;

-- 🔹 15. Order Counts
SELECT ship_mode, COUNT(*) AS total_orders
FROM superstore
GROUP BY ship_mode
ORDER BY total_orders DESC;

SELECT category, COUNT(*) AS number_of_orders
FROM superstore
GROUP BY category
ORDER BY number_of_orders DESC
LIMIT 1;

-- 🔹 16. Top Profit Product
SELECT product_name, ROUND(SUM(profits)) AS total_profit
FROM superstore
GROUP BY product_name
ORDER BY total_profit DESC
LIMIT 1;
