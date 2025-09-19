/*
===============================================================================
Date Range Exploration 
===============================================================================
Purpose:
    - To determine the temporal boundaries of key data points.
    - To understand the range of historical data.

SQL Functions Used:
    - MIN(), MAX(), DATEDIFF()
===============================================================================
*/

-- Find the date of the first and last order 
-- How many months of sales are aveliable

SELECT 
  MIN(order_date) AS first_order_date,
  MAX(order_date) AS last_order_date,
  DATEDIFF(MONTH, MIN(order_date),MAX(order_date)) AS order_range_months
FROM gold.fact_sales

--Find the youngest and oldest customer based on birthdate
SELECT 
  MIN(birthdate) AS oldest_customer,
  DATEDIFF(year,MIN(birthdate), GETDATE()) AS oldest_age,
  MAX(birthdate) AS youngest_customer,
  DATEDIFF(year,MAX(birthdate), GETDATE()) AS youngest_age
FROM gold.dim_customers
