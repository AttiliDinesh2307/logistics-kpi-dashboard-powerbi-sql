-- ============================================================
-- DELIVERY PERFORMANCE
-- ============================================================

-- 31. Orders by Delivery Status
SELECT
    Delivery_Status,
    COUNT(*) AS Total_Orders
FROM Orders
GROUP BY Delivery_Status
ORDER BY Total_Orders DESC;

------------------------------------------------------------

-- 32. Average Delivery Days by Carrier
SELECT
    Carrier,
    ROUND(AVG(Delivery_Days),2) AS Avg_Delivery_Days
FROM Orders
WHERE Delivery_Status='Delivered'
GROUP BY Carrier
ORDER BY Avg_Delivery_Days;

------------------------------------------------------------

-- 33. Average Delivery Days by Region
SELECT
    Region,
    ROUND(AVG(Delivery_Days),2) AS Avg_Delivery_Days
FROM Orders
WHERE Delivery_Status='Delivered'
GROUP BY Region
ORDER BY Avg_Delivery_Days;

------------------------------------------------------------

-- 34. Average Delivery Days by Warehouse
SELECT
    Warehouse_Name,
    ROUND(AVG(Delivery_Days),2) AS Avg_Delivery_Days
FROM Orders
WHERE Delivery_Status='Delivered'
GROUP BY Warehouse_Name
ORDER BY Avg_Delivery_Days;

------------------------------------------------------------

-- 35. Total Delayed Deliveries
SELECT
    COUNT(*) AS Delayed_Deliveries
FROM Orders
WHERE Days_Late > 0;

------------------------------------------------------------

-- 36. Average Days Late
SELECT
    ROUND(AVG(Days_Late),2) AS Avg_Days_Late
FROM Orders
WHERE Days_Late > 0;

------------------------------------------------------------

-- 37. Carrier-wise Delayed Deliveries
SELECT
    Carrier,
    COUNT(*) AS Delayed_Orders
FROM Orders
WHERE Days_Late > 0
GROUP BY Carrier
ORDER BY Delayed_Orders DESC;

------------------------------------------------------------

-- 38. Region-wise SLA Breaches
SELECT
    Region,
    COUNT(*) AS SLA_Breaches
FROM Orders
WHERE SLA_Breached='Yes'
GROUP BY Region
ORDER BY SLA_Breaches DESC;

------------------------------------------------------------

-- 39. Warehouse-wise On-Time Delivery %
SELECT
    Warehouse_Name,
    ROUND(
        100.0 *
        SUM(CASE WHEN On_Time_Delivery='Yes' THEN 1 ELSE 0 END)
        / COUNT(*),2
    ) AS On_Time_Percentage
FROM Orders
WHERE Delivery_Status='Delivered'
GROUP BY Warehouse_Name
ORDER BY On_Time_Percentage DESC;

------------------------------------------------------------

-- 40. Carrier-wise On-Time Delivery %
SELECT
    Carrier,
    ROUND(
        100.0 *
        SUM(CASE WHEN On_Time_Delivery='Yes' THEN 1 ELSE 0 END)
        / COUNT(*),2
    ) AS On_Time_Percentage
FROM Orders
WHERE Delivery_Status='Delivered'
GROUP BY Carrier
ORDER BY On_Time_Percentage DESC;