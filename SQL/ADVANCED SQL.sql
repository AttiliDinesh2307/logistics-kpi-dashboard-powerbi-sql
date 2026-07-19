-- ============================================================
-- ADVANCED SQL (CTEs & WINDOW FUNCTIONS)
-- ============================================================

-- 71. Rank Customers by Revenue
SELECT
    Customer_Name,
    ROUND(SUM(Invoice_Amount),2) AS Revenue,
    RANK() OVER (
        ORDER BY SUM(Invoice_Amount) DESC
    ) AS Revenue_Rank
FROM Orders
GROUP BY Customer_Name;

------------------------------------------------------------

-- 72. Dense Rank Carriers by On-Time Delivery %
SELECT
    Carrier,
    ROUND(
        100.0 *
        SUM(CASE WHEN On_Time_Delivery='Yes' THEN 1 ELSE 0 END)
        / COUNT(*),2
    ) AS On_Time_Percentage,
    DENSE_RANK() OVER (
        ORDER BY
        100.0 *
        SUM(CASE WHEN On_Time_Delivery='Yes' THEN 1 ELSE 0 END)
        / COUNT(*) DESC
    ) AS Carrier_Rank
FROM Orders
GROUP BY Carrier;

------------------------------------------------------------

-- 73. Top 3 Customers by Revenue
WITH CustomerRevenue AS
(
    SELECT
        Customer_Name,
        SUM(Invoice_Amount) AS Revenue,
        RANK() OVER (
            ORDER BY SUM(Invoice_Amount) DESC
        ) AS Ranking
    FROM Orders
    GROUP BY Customer_Name
)
SELECT *
FROM CustomerRevenue
WHERE Ranking <= 3;

------------------------------------------------------------

-- 74. Running Revenue by Order Date
SELECT
    Order_Date,
    Invoice_Amount,
    SUM(Invoice_Amount) OVER (
        ORDER BY Order_Date
    ) AS Running_Revenue
FROM Orders
ORDER BY Order_Date;

------------------------------------------------------------

-- 75. Monthly Revenue with Previous Month Revenue
SELECT
    Order_Month,
    SUM(Invoice_Amount) AS Revenue,
    LAG(SUM(Invoice_Amount))
    OVER(ORDER BY Order_Month)
    AS Previous_Month_Revenue
FROM Orders
GROUP BY Order_Month;

------------------------------------------------------------

-- 76. Monthly Revenue Growth
WITH MonthlyRevenue AS
(
    SELECT
        Order_Month,
        SUM(Invoice_Amount) AS Revenue
    FROM Orders
    GROUP BY Order_Month
)
SELECT
    Order_Month,
    Revenue,
    LAG(Revenue) OVER(
        ORDER BY Order_Month
    ) AS Previous_Revenue,
    Revenue -
    LAG(Revenue) OVER(
        ORDER BY Order_Month
    ) AS Revenue_Growth
FROM MonthlyRevenue;

------------------------------------------------------------

-- 77. Row Number by Customer Revenue
SELECT
    Customer_Name,
    SUM(Invoice_Amount) AS Revenue,
    ROW_NUMBER() OVER(
        ORDER BY SUM(Invoice_Amount) DESC
    ) AS Row_Num
FROM Orders
GROUP BY Customer_Name;

------------------------------------------------------------

-- 78. Warehouse Revenue Ranking
SELECT
    Warehouse_Name,
    SUM(Invoice_Amount) AS Revenue,
    RANK() OVER(
        ORDER BY SUM(Invoice_Amount) DESC
    ) AS Warehouse_Rank
FROM Orders
GROUP BY Warehouse_Name;

------------------------------------------------------------

-- 79. Region Revenue Ranking
SELECT
    Region,
    SUM(Invoice_Amount) AS Revenue,
    DENSE_RANK() OVER(
        ORDER BY SUM(Invoice_Amount) DESC
    ) AS Region_Rank
FROM Orders
GROUP BY Region;

------------------------------------------------------------

-- 80. Top Product in Each Category
WITH ProductRevenue AS
(
    SELECT
        Category,
        Product_ID,
        SUM(Invoice_Amount) AS Revenue,
        ROW_NUMBER() OVER(
            PARTITION BY Category
            ORDER BY SUM(Invoice_Amount) DESC
        ) AS rn
    FROM Orders
    GROUP BY Category, Product_ID
)
SELECT *
FROM ProductRevenue
WHERE rn = 1;