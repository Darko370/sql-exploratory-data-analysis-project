/*
===============================================================================
Change Over Time Analysis
===============================================================================
Purpose:
    - To track trends, growth, and changes in key metrics over time.
    - For time-series analysis and identifying seasonality.
    - To measure growth or decline over specific periods.

SQL Functions Used:
    - Date Functions: DATEPART(), DATETRUNC(), FORMAT()
    - Aggregate Functions: SUM(), COUNT(), AVG()
===============================================================================
*/

-- Analyse sales performance over time
-- Quick Date Functions

SELECT 
  YEAR(order_date) as order_year,
  MONTH(order_date) as order_months,
  SUM(sales_amount) AS total_sales,
  COUNT(DISTINCT customer_key) AS total_customer,
  SUM(quantity) as total_quantity 
FROM gold.fact_sales
WHERE order_date IS NOT NULL
GROUP BY YEAR(order_date),MONTH(order_date)
ORDER BY YEAR(order_date),MONTH(order_date)

--Datetrunc

SELECT 
  DATETRUNC(month, order_date) as order_date,
  SUM(sales_amount) AS total_sales,
COUNT(DISTINCT customer_key) AS total_customer,
SUM(quantity) as total_quantity 
FROM gold.fact_sales
WHERE order_date IS NOT NULL
GROUP BY DATETRUNC(month, order_date)
ORDER BY DATETRUNC(month, order_date)

--Format
SELECT 
FORMAT(order_date, 'yyyy-MMM') as order_date,
SUM(sales_amount) AS total_sales,
COUNT(DISTINCT customer_key) AS total_customer,
SUM(quantity) as total_quantity 
FROM gold.fact_sales
WHERE order_date IS NOT NULL
GROUP BY FORMAT(order_date, 'yyyy-MMM')
ORDER BY FORMAT(order_date, 'yyyy-MMM')

  
----How many new customers were added each year(exp)

SELECT
  DATETRUNC(year, create_date) AS create_year,
  COUNT (customer_key) AS total_customer
FROM gold.dim_customers
GROUP BY DATETRUNC(year, create_date)
ORDER BY DATETRUNC(year, create_date)
