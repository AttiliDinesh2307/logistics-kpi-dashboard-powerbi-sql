use inventory;
-- 1. Average Delivery Time by Region
SELECT 
    Region,
    AVG(CycleTime) AS Avg_Delivery_Time
FROM 
    Logistics_KPI_Dashboard
GROUP BY 
    Region;

-- 2. Fulfillment Status Distribution
SELECT 
    FulfillmentStatus,
    COUNT(*) AS Total_Orders
FROM 
    Logistics_KPI_Dashboard
GROUP BY 
    FulfillmentStatus;

-- 3. SKU-wise Inventory Usage
SELECT 
    SKU,
    SUM(Quantity) AS Total_Ordered,
    AVG(BeginningInventory) AS Avg_Starting_Stock,
    AVG(EndingInventory) AS Avg_Remaining_Stock
FROM 
    Logistics_KPI_Dashboard
GROUP BY 
    SKU;

-- 4. Orders at High Stock-Out Risk
SELECT 
    OrderID,
    SKU,
    Region,
    BeginningInventory,
    Quantity,
    ReorderLevel,
    EndingInventory
FROM 
    Logistics_KPI_Dashboard
WHERE 
    StockOutRisk = 'High';

-- 5. Return Rate by Carrier
SELECT 
    Carrier,
    COUNT(*) AS Total_Orders,
    SUM(CASE WHEN Returned = 'Yes' THEN 1 ELSE 0 END) AS Returned_Orders,
    ROUND(100.0 * SUM(CASE WHEN Returned = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS Return_Percentage
FROM 
    Logistics_KPI_Dashboard
GROUP BY 
    Carrier;

-- 6. Shipping Cost Trend (Daily)
SELECT 
    CAST(OrderDate AS DATE) AS Order_Date,
    ROUND(SUM(ShippingCost), 2) AS Total_Shipping_Cost
FROM 
    Logistics_KPI_Dashboard
GROUP BY 
    CAST(OrderDate AS DATE)
ORDER BY 
    Order_Date;

-- 7. Most Common Return Reasons
SELECT 
    ReturnReason,
    COUNT(*) AS Occurrences
FROM 
    Logistics_KPI_Dashboard
WHERE 
    Returned = 'Yes'
GROUP BY 
    ReturnReason
ORDER BY 
    Occurrences DESC;