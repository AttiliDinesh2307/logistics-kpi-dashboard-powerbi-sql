-- ============================================================
-- REVENUE ANALYSIS
-- ============================================================

-- 21. Revenue by Month
SELECT
    Order_Month,
    ROUND(SUM(Invoice_Amount),2) AS Revenue
FROM Orders
GROUP BY Order_Month
ORDER BY Revenue DESC;

------------------------------------------------------------

-- 22. Revenue by Quarter
SELECT
    Order_Quarter,
    ROUND(SUM(Invoice_Amount),2) AS Revenue
FROM Orders
GROUP BY Order_Quarter
ORDER BY Revenue DESC;

------------------------------------------------------------

-- 23. Revenue by Region
SELECT
    Region,
    ROUND(SUM(Invoice_Amount),2) AS Revenue
FROM Orders
GROUP BY Region
ORDER BY Revenue DESC;

------------------------------------------------------------

-- 24. Revenue by City
SELECT
    City,
    ROUND(SUM(Invoice_Amount),2) AS Revenue
FROM Orders
GROUP BY City
ORDER BY Revenue DESC;

------------------------------------------------------------

-- 25. Revenue by Customer Segment
SELECT
    Segment,
    ROUND(SUM(Invoice_Amount),2) AS Revenue
FROM Orders
GROUP BY Segment
ORDER BY Revenue DESC;

------------------------------------------------------------

-- 26. Revenue by Product Category
SELECT
    Category,
    ROUND(SUM(Invoice_Amount),2) AS Revenue
FROM Orders
GROUP BY Category
ORDER BY Revenue DESC;

------------------------------------------------------------

-- 27. Top 10 Customers by Revenue
SELECT
    Customer_Name,
    ROUND(SUM(Invoice_Amount),2) AS Revenue
FROM Orders
GROUP BY Customer_Name
ORDER BY Revenue DESC
LIMIT 10;

------------------------------------------------------------

-- 28. Top 10 Products by Revenue
SELECT
    Product_ID,
    ROUND(SUM(Invoice_Amount),2) AS Revenue
FROM Orders
GROUP BY Product_ID
ORDER BY Revenue DESC
LIMIT 10;

------------------------------------------------------------

-- 29. Average Revenue per Customer
SELECT
    ROUND(AVG(Customer_Revenue),2) AS Avg_Revenue_Per_Customer
FROM
(
    SELECT
        Customer_ID,
        SUM(Invoice_Amount) AS Customer_Revenue
    FROM Orders
    GROUP BY Customer_ID
);

------------------------------------------------------------

-- 30. Revenue by Warehouse
SELECT
    Warehouse_Name,
    ROUND(SUM(Invoice_Amount),2) AS Revenue
FROM Orders
GROUP BY Warehouse_Name
ORDER BY Revenue DESC;