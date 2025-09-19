/*
===============================================================================
Cumulative Analysis
===============================================================================
Purpose:
    - To calculate running totals or moving averages for key metrics.
    - To track performance over time cumulatively.
    - Useful for growth analysis or identifying long-term trends.

SQL Functions Used:
    - Window Functions: SUM() OVER(), AVG() OVER()
===============================================================================
*/


-- Calculate the total sales per month
-- and the runing total of sales over time

SELECT
order_date,
total_sales,
SUM(total_sales) OVER (PARTITION BY order_date ORDER BY order_date) AS running_total_sales,
AVG(average_price) OVER (PARTITION BY order_date ORDER BY order_date) AS moving_average_price
--window function
FROM (
  SELECT
    DATETRUNC(month, order_date) AS order_date,
    SUM(sales_amount) as total_sales,
    AVG(price) as average_price
  FROM gold.fact_sales
  WHERE order_date IS NOT NULL 
  GROUP BY DATETRUNC(month, order_date)
)t --subquery
