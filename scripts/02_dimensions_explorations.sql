/*
===============================================================================
Dimensions Exploration
===============================================================================
Purpose:
    - To explore the structure of dimension tables.
	
SQL Functions Used:
    - DISTINCT
    - ORDER BY
===============================================================================
*/

--Explore All Countries our custimers come from 

SELECT DISTINCT country FROM gold.dim_customers

-- Explore All Categories "The major Dicisions"
SELECT DISTINCT 
  category,
  subcategory,
  product_name 
FROM gold.dim_products
ORDER BY  -- sorted (1,2,3)
  category,
  subcategory,
  product_name 
