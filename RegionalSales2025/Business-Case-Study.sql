-- Q1. Monthly Trend of Sales Across All Regions

SELECT 
    DATE_FORMAT(Date, '%Y-%m') AS Month,
    Region,
    SUM(TotalAmount) AS TotalSales
FROM regionalSales2025_500_rows
GROUP BY DATE_FORMAT(Date, '%Y-%m'), Region;

-- Q2. Percentage of Cancelled Orders Per Region

SELECT
    Region,
    COUNT(*) AS TotalOrders,
    
    (SUM(CASE WHEN OrderStatus = 'Cancelled' THEN 1 ELSE 0 END) * 100.0 / COUNT(*)) AS CancelledOrderPercentage

FROM regionalsales2025_500_rows
GROUP BY Region;

-- Q3. Top 3 Regions with Highest Revenue Loss

SELECT 
    Region,
    SUM(TotalAmount) AS RevenueLoss
FROM regionalSales2025
WHERE OrderStatus = 'Cancelled'
GROUP BY Region
ORDER BY RevenueLoss DESC
LIMIT 3;

--Q4. Average Order Value by Category

SELECT 
    Category,
    AVG(TotalAmount) AS AverageOrderValue
FROM regionalSales2025
GROUP BY Category;

-- Q5. Top 5 Performing Sales Agents

SELECT 
    SalesAgent,
    SUM(TotalAmount) AS TotalRevenue
FROM regionalSales2025
WHERE OrderStatus = 'Delivered'
GROUP BY SalesAgent
ORDER BY TotalRevenue DESC
LIMIT 5;

--  Q6. Category Wise Total Sales

SELECT 
    Category,
    SUM(TotalAmount) AS TotalSales
FROM regionalSales2025
GROUP BY Category;

-- Q7. Customers with Highest Return Frequency

SELECT 
    CustomerID,
    COUNT(*) AS CancelCount
FROM regionalSales2025
WHERE OrderStatus = 'Cancelled'
GROUP BY CustomerID
HAVING COUNT(*) >= 3;