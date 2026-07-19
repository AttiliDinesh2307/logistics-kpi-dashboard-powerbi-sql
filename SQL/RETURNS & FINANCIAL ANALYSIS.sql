-- ============================================================
-- RETURNS & FINANCIAL ANALYSIS
-- ============================================================

-- 61. Return Reason Analysis
SELECT
    Return_Reason,
    COUNT(*) AS Total_Returns
FROM Orders
WHERE Returned='Yes'
GROUP BY Return_Reason
ORDER BY Total_Returns DESC;

------------------------------------------------------------

-- 62. Returns by Product Category
SELECT
    Category,
    COUNT(*) AS Returned_Orders
FROM Orders
WHERE Returned='Yes'
GROUP BY Category
ORDER BY Returned_Orders DESC;

------------------------------------------------------------

-- 63. Returns by Carrier
SELECT
    Carrier,
    COUNT(*) AS Returned_Orders
FROM Orders
WHERE Returned='Yes'
GROUP BY Carrier
ORDER BY Returned_Orders DESC;

------------------------------------------------------------

-- 64. Returns by Warehouse
SELECT
    Warehouse_Name,
    COUNT(*) AS Returned_Orders
FROM Orders
WHERE Returned='Yes'
GROUP BY Warehouse_Name
ORDER BY Returned_Orders DESC;

------------------------------------------------------------

-- 65. Revenue Lost Due to Returns
SELECT
    ROUND(SUM(Invoice_Amount),2) AS Revenue_Lost
FROM Orders
WHERE Returned='Yes';

------------------------------------------------------------

-- 66. Average Discount by Category
SELECT
    Category,
    ROUND(AVG("Discount_%"),2) AS Avg_Discount
FROM Orders
GROUP BY Category
ORDER BY Avg_Discount DESC;

------------------------------------------------------------

-- 67. Average Profit Margin by Category
SELECT
    Category,
    ROUND(AVG(Profit_Margin_Percentage),2) AS Avg_Profit_Margin
FROM Orders
GROUP BY Category
ORDER BY Avg_Profit_Margin DESC;

------------------------------------------------------------

-- 68. Shipping Cost by Region
SELECT
    Region,
    ROUND(SUM(Shipping_Cost),2) AS Total_Shipping_Cost
FROM Orders
GROUP BY Region
ORDER BY Total_Shipping_Cost DESC;

------------------------------------------------------------

-- 69. Payment Status vs Revenue
SELECT
    Payment_Status,
    ROUND(SUM(Invoice_Amount),2) AS Revenue
FROM Orders
GROUP BY Payment_Status
ORDER BY Revenue DESC;

------------------------------------------------------------

-- 70. Payment Terms Analysis
SELECT
    Payment_Terms_InDays ,
    COUNT(*) AS Total_Orders,
    ROUND(AVG(Invoice_Amount),2) AS Avg_Invoice
FROM Orders
GROUP BY Payment_Terms_InDays
ORDER BY Payment_Terms_InDays;