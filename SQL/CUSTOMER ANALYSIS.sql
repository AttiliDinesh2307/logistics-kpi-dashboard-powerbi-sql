-- ============================================================
-- CUSTOMER ANALYSIS
-- ============================================================

-- 51. Orders by Customer Segment
SELECT
    Segment,
    COUNT(*) AS Total_Orders
FROM Orders
GROUP BY Segment
ORDER BY Total_Orders DESC;

------------------------------------------------------------

-- 52. Revenue by Customer Segment
SELECT
    Segment,
    ROUND(SUM(Invoice_Amount),2) AS Revenue
FROM Orders
GROUP BY Segment
ORDER BY Revenue DESC;

------------------------------------------------------------

-- 53. Average Order Value by Segment
SELECT
    Segment,
    ROUND(AVG(Invoice_Amount),2) AS Avg_Order_Value
FROM Orders
GROUP BY Segment
ORDER BY Avg_Order_Value DESC;

------------------------------------------------------------

-- 54. Top 10 Customers by Number of Orders
SELECT
    Customer_Name,
    COUNT(*) AS Total_Orders
FROM Orders
GROUP BY Customer_Name
ORDER BY Total_Orders DESC
LIMIT 10;

------------------------------------------------------------

-- 55. Top 10 Customers by Revenue
SELECT
    Customer_Name,
    ROUND(SUM(Invoice_Amount),2) AS Revenue
FROM Orders
GROUP BY Customer_Name
ORDER BY Revenue DESC
LIMIT 10;

------------------------------------------------------------

-- 56. Average Customer Satisfaction by Segment
SELECT
    Segment,
    ROUND(AVG(CSAT_Score),2) AS Avg_CSAT
FROM Orders
GROUP BY Segment
ORDER BY Avg_CSAT DESC;

------------------------------------------------------------

-- 57. Revenue by City
SELECT
    City,
    ROUND(SUM(Invoice_Amount),2) AS Revenue
FROM Orders
GROUP BY City
ORDER BY Revenue DESC;

------------------------------------------------------------

-- 58. Orders by City
SELECT
    City,
    COUNT(*) AS Total_Orders
FROM Orders
GROUP BY City
ORDER BY Total_Orders DESC;

------------------------------------------------------------

-- 59. Payment Status Distribution
SELECT
    Payment_Status,
    COUNT(*) AS Total_Orders
FROM Orders
GROUP BY Payment_Status
ORDER BY Total_Orders DESC;

------------------------------------------------------------

-- 60. Average Credit Limit by Customer Segment
SELECT
    Segment,
    ROUND(AVG(Credit_Limit),2) AS Avg_Credit_Limit
FROM Orders
GROUP BY Segment
ORDER BY Avg_Credit_Limit DESC;