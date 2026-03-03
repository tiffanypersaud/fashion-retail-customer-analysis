/* =========================================================
   Fashion / Retail Customer Purchase Behavior Analysis
   Database: SQLite
   Table: fashion_retail_customers
   ========================================================= */


/* ---------------------------------------------------------
   DATA VALIDATION
   --------------------------------------------------------- */

-- Preview sample rows
SELECT *
FROM fashion_retail_customers
LIMIT 10;

-- Row count check
SELECT COUNT(*) AS total_rows
FROM fashion_retail_customers;


/* ---------------------------------------------------------
   EXECUTIVE KPIs
   --------------------------------------------------------- */

SELECT
    ROUND(SUM(total_spent), 2) AS total_revenue,
    ROUND(AVG(total_spent), 2) AS avg_customer_spend,
    SUM(total_orders)          AS total_orders,
    ROUND(AVG(avg_order_value), 2) AS avg_order_value,
    ROUND(AVG(discount_usage_rate) * 100, 2) AS avg_discount_usage_pct
FROM fashion_retail_customers;


/* ---------------------------------------------------------
   REVENUE BY CATEGORY
   --------------------------------------------------------- */

SELECT
    preferred_category,
    ROUND(SUM(total_spent), 2) AS total_revenue
FROM fashion_retail_customers
GROUP BY preferred_category
ORDER BY total_revenue DESC;


/* ---------------------------------------------------------
   REVENUE BY MEMBERSHIP STATUS
   --------------------------------------------------------- */

SELECT
    membership_status,
    ROUND(SUM(total_spent), 2) AS total_revenue,
    ROUND(AVG(total_spent), 2) AS avg_customer_spend
FROM fashion_retail_customers
GROUP BY membership_status
ORDER BY total_revenue DESC;


/* ---------------------------------------------------------
   CUSTOMER SPEND BY PURCHASE FREQUENCY
   --------------------------------------------------------- */

SELECT
    purchase_frequency,
    ROUND(AVG(total_spent), 2) AS avg_customer_spend,
    ROUND(SUM(total_spent), 2) AS total_revenue
FROM fashion_retail_customers
GROUP BY purchase_frequency;


/* ---------------------------------------------------------
   DISCOUNT BEHAVIOR ANALYSIS
   --------------------------------------------------------- */

SELECT
    purchase_frequency,
    ROUND(AVG(discount_usage_rate) * 100, 2) AS avg_discount_usage_pct
FROM fashion_retail_customers
GROUP BY purchase_frequency;


/* ---------------------------------------------------------
   TOP PERFORMING LOCATIONS
   --------------------------------------------------------- */

SELECT
    location,
    ROUND(SUM(total_spent), 2) AS total_revenue
FROM fashion_retail_customers
GROUP BY location
ORDER BY total_revenue DESC
LIMIT 10;


/* ---------------------------------------------------------
   TOP CUSTOMERS BY SPENDING
   --------------------------------------------------------- */

SELECT
    customer_id,
    ROUND(total_spent, 2) AS total_spent
FROM fashion_retail_customers
ORDER BY total_spent DESC
LIMIT 10;
