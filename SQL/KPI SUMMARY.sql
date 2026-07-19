-- ============================================================
-- SECTION 1 : KPI SUMMARY
-- ============================================================

-- 1. Total Revenue
SELECT
ROUND(SUM(Invoice_Amount),2) AS Total_Revenue
FROM Orders;

-- 2. Total Orders
SELECT
COUNT(*) AS Total_Orders
FROM Orders;

-- 3. Total Customers
SELECT
COUNT(DISTINCT Customer_ID) AS Total_Customers
FROM Orders;

-- 4. Total Units Sold
SELECT
SUM(Quantity) AS Total_Units_Sold
FROM Orders;

-- 5. Average Order Value
SELECT
ROUND(AVG(Invoice_Amount),2) AS Avg_Order_Value
FROM Orders;

-- 6. Average Unit Price
SELECT
ROUND(AVG(Unit_Price),2) AS Avg_Unit_Price
FROM Orders;

-- 7. Average Discount %
SELECT
ROUND(AVG("Discount_%" ),2) AS Avg_Discount_Percentage
FROM Orders;

-- 8. Average Shipping Cost
SELECT
ROUND(AVG(Shipping_Cost),2) AS Avg_Shipping_Cost
FROM Orders;

-- 9. Average Delivery Days
SELECT
ROUND(AVG(Delivery_Days),2) AS Avg_Delivery_Days
FROM Orders
WHERE Delivery_Status='Delivered';

-- 10. Average Profit Margin %
SELECT
ROUND(AVG(Profit_Margin_Percentage),2) AS Avg_Profit_Margin
FROM Orders;

-- 11. Average Warehouse Utilization %
SELECT
ROUND(AVG(Warehouse_Utilization_Percentage),2)
AS Avg_Warehouse_Utilization
FROM Orders;

-- 12. Average Customer Satisfaction
SELECT
ROUND(AVG(CSAT_Score),2) AS Avg_CSAT
FROM Orders;

-- 13. Delivered Orders
SELECT
COUNT(*) AS Delivered_Orders
FROM Orders
WHERE Delivery_Status='Delivered';

-- 14. Cancelled Orders
SELECT
COUNT(*) AS Cancelled_Orders
FROM Orders
WHERE Delivery_Status='Cancelled';

-- 15. Returned Orders
SELECT
COUNT(*) AS Returned_Orders
FROM Orders
WHERE Returned='Yes';

-- 16. On-Time Delivery %
SELECT
ROUND(
100.0 *
SUM(CASE
WHEN On_Time_Delivery='Yes' THEN 1
ELSE 0
END)
/COUNT(*),2)
AS On_Time_Delivery_Percentage
FROM Orders
WHERE Delivery_Status='Delivered';

-- 17. SLA Breach %
SELECT
ROUND(
100.0 *
SUM(CASE
WHEN SLA_Breached='Yes' THEN 1
ELSE 0
END)
/COUNT(*),2)
AS SLA_Breach_Percentage
FROM Orders;

-- 18. Return Rate %
SELECT
ROUND(
100.0 *
SUM(CASE
WHEN Returned='Yes' THEN 1
ELSE 0
END)
/COUNT(*),2)
AS Return_Rate
FROM Orders;

-- 19. Orders with Overdue Payments
SELECT
COUNT(*) AS Overdue_Payments
FROM Orders
WHERE Payment_Status='Overdue';

-- 20. Total Shipping Cost
SELECT
ROUND(SUM(Shipping_Cost),2) AS Total_Shipping_Cost
FROM Orders;