-- ============================================================
-- BUSINESS INSIGHT QUERIES
-- ============================================================

-- 81. Which Region Generates the Highest Profit?
SELECT
    Region,
    ROUND(SUM(Invoice_Amount * Profit_Margin_Percentage / 100),2) AS Estimated_Profit
FROM Orders
GROUP BY Region
ORDER BY Estimated_Profit DESC;

------------------------------------------------------------

-- 82. Which Product Category Has the Highest Revenue per Order?
SELECT
    Category,
    ROUND(AVG(Invoice_Amount),2) AS Avg_Revenue_Per_Order
FROM Orders
GROUP BY Category
ORDER BY Avg_Revenue_Per_Order DESC;

------------------------------------------------------------

-- 83. Which Carrier Has the Lowest Average Delivery Time?
SELECT
    Carrier,
    ROUND(AVG(Delivery_Days),2) AS Avg_Delivery_Days
FROM Orders
GROUP BY Carrier
ORDER BY Avg_Delivery_Days ASC;

------------------------------------------------------------

-- 84. Which Warehouse Has the Highest On-Time Delivery Rate?
SELECT
    Warehouse_Name,
    ROUND(
        100.0 *
        SUM(CASE WHEN On_Time_Delivery='Yes' THEN 1 ELSE 0 END)
        / COUNT(*),2
    ) AS On_Time_Percentage
FROM Orders
GROUP BY Warehouse_Name
ORDER BY On_Time_Percentage DESC;

------------------------------------------------------------

-- 85. Which Customer Segment Generates the Highest Profit?
SELECT
    Segment,
    ROUND(SUM(Invoice_Amount * Profit_Margin_Percentage / 100),2) AS Estimated_Profit
FROM Orders
GROUP BY Segment
ORDER BY Estimated_Profit DESC;

------------------------------------------------------------

-- 86. Which Cities Have the Highest Return Rate?
SELECT
    City,
    ROUND(
        100.0 *
        SUM(CASE WHEN Returned='Yes' THEN 1 ELSE 0 END)
        / COUNT(*),2
    ) AS Return_Rate
FROM Orders
GROUP BY City
ORDER BY Return_Rate DESC;

------------------------------------------------------------

-- 87. Which Categories Receive the Highest Discount?
SELECT
    Category,
    ROUND(AVG("Discount_%"),2) AS Avg_Discount
FROM Orders
GROUP BY Category
ORDER BY Avg_Discount DESC;

------------------------------------------------------------

-- 88. Which Payment Status Generates the Highest Revenue?
SELECT
    Payment_Status,
    ROUND(SUM(Invoice_Amount),2) AS Revenue
FROM Orders
GROUP BY Payment_Status
ORDER BY Revenue DESC;

------------------------------------------------------------

-- 89. Which Warehouse Handles the Highest Revenue per Order?
SELECT
    Warehouse_Name,
    ROUND(AVG(Invoice_Amount),2) AS Avg_Revenue_Per_Order
FROM Orders
GROUP BY Warehouse_Name
ORDER BY Avg_Revenue_Per_Order DESC;

------------------------------------------------------------

-- 90. Executive Business Summary
SELECT
    COUNT(*) AS Total_Orders,
    ROUND(SUM(Invoice_Amount),2) AS Total_Revenue,
    ROUND(AVG(Invoice_Amount),2) AS Average_Order_Value,
    ROUND(AVG(Delivery_Days),2) AS Average_Delivery_Days,
    ROUND(
        100.0 *
        SUM(CASE WHEN On_Time_Delivery='Yes' THEN 1 ELSE 0 END)
        / COUNT(*),2
    ) AS On_Time_Delivery_Percentage,
    ROUND(
        100.0 *
        SUM(CASE WHEN Returned='Yes' THEN 1 ELSE 0 END)
        / COUNT(*),2
    ) AS Return_Rate,
    ROUND(AVG(CSAT_Score),2) AS Average_CSAT
FROM Orders;