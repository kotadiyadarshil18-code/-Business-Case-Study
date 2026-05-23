
# 📊 Regional Sales 2025 Dashboard

## 📌 Project Overview

The **Regional Sales 2025** project is a complete Business Intelligence solution built using SQL and Power BI.  
This project focuses on analyzing regional sales performance, cancellations, revenue loss, customer behavior, and sales trends to generate meaningful business insights.

The dashboard provides interactive visualizations and KPI tracking for better business decision-making.

---

# 🛠️ Tools & Technologies Used

- Microsoft SQL Server
- Power BI
- Microsoft Excel
- DAX (Data Analysis Expressions)

---

# 🗂️ Dataset Structure

The dataset contains transactional sales data with the following columns:

| Column Name | Data Type |
|---|---|
| OrderID | INT |
| Date | DATE |
| CustomerID | VARCHAR(10) |
| Region | VARCHAR(20) |
| ProductName | VARCHAR(50) |
| Category | VARCHAR(30) |
| Quantity | INT |
| UnitPrice | DECIMAL(10,2) |
| TotalAmount | DECIMAL(10,2) |
| OrderStatus | VARCHAR(20) |
| SalesAgent | VARCHAR(50) |

---

# 🧠 SQL Queries Used

## 📈 Q1. Monthly Trend of Sales Across All Regions

```sql
SELECT 
    DATE_FORMAT(Date, '%Y-%m') AS Month,
    Region,
    SUM(TotalAmount) AS TotalSales
FROM regionalSales2025_500_rows
GROUP BY DATE_FORMAT(Date, '%Y-%m'), Region;
```

## Output
<img width="287" height="735" alt="Screenshot 2026-05-23 101641" src="https://github.com/user-attachments/assets/29e4765f-3c7b-4c59-b349-e42f9cd255c8" />

---

## 🚫 Q2. Percentage of Cancelled Orders Per Region

```sql
SELECT
    Region,
    COUNT(*) AS TotalOrders,
    
    (SUM(CASE WHEN OrderStatus = 'Cancelled' THEN 1 ELSE 0 END) * 100.0 / COUNT(*)) AS CancelledOrderPercentage

FROM regionalsales2025_500_rows
GROUP BY Region;
```
## Output

<img width="440" height="141" alt="Screenshot 2026-05-23 103753" src="https://github.com/user-attachments/assets/fda2a9dc-836f-469f-bf7f-4b3b4546177c" />

---

## 📉 Q3. Top 3 Regions with Highest Revenue Loss

```sql
SELECT 
    Region,
    SUM(TotalAmount) AS RevenueLoss
FROM regionalSales2025
WHERE OrderStatus = 'Cancelled'
GROUP BY Region
ORDER BY RevenueLoss DESC
LIMIT 3;
```
## Output

<img width="395" height="128" alt="Screenshot 2026-05-23 105108" src="https://github.com/user-attachments/assets/486da573-240d-4568-9bba-34ef5e14183a" />


---

## 🧾 Q4. Average Order Value by Category

```sql
SELECT 
    Category,
    AVG(TotalAmount) AS AverageOrderValue
FROM regionalSales2025
GROUP BY Category;
```
## Output
<img width="292" height="131" alt="Screenshot 2026-05-23 165229" src="https://github.com/user-attachments/assets/bb550dc0-6dd3-4418-9b8a-3d0db7a05182" />


---

## 🏆 Q5. Top 5 Performing Sales Agents

```sql
SELECT 
    SalesAgent,
    SUM(TotalAmount) AS TotalRevenue
FROM regionalSales2025
WHERE OrderStatus = 'Delivered'
GROUP BY SalesAgent
ORDER BY TotalRevenue DESC
LIMIT 5;
```
## Output
<img width="288" height="324" alt="Screenshot 2026-05-23 165234" src="https://github.com/user-attachments/assets/1ec40028-8438-4940-afa8-41dc98f24438" />

---

## 📊 Q6. Category Wise Total Sales

```sql
SELECT 
    Category,
    SUM(TotalAmount) AS TotalSales
FROM regionalSales2025
GROUP BY Category;
```
## Output
<img width="237" height="131" alt="Screenshot 2026-05-23 165250" src="https://github.com/user-attachments/assets/694d174b-d279-4813-a85f-2debe43ac0f9" />

---

## 🔁 Q7. Customers with Highest Return Frequency

```sql
SELECT 
    CustomerID,
    COUNT(*) AS CancelCount
FROM regionalSales2025
WHERE OrderStatus = 'Cancelled'
GROUP BY CustomerID
HAVING COUNT(*) >= 3;
```
## Output

---

# 📊 Power BI Dashboard Features

## 📌 KPI Cards
- Total Completed Sales
- Total Cancellations
- Average Order Value
- Most Returned Product

## 📈 Charts & Visuals
- Heatmap / Matrix of Region vs Category Sales
- Stacked Bar Chart for Order Status by Region
- Monthly Sales Trend Line Chart

## 🎛️ Interactive Filters
- Region
- Category
- Sales Agent

---

# 📷 Dashboard Preview

## Main Dashboard

<img width="1184" height="666" alt="Screenshot 2026-05-23 142427" src="https://github.com/user-attachments/assets/c523edea-45c4-4e7d-8cd8-eb3e9b7e347b" />


---

# 📌 Key Insights

- North region generated strong sales performance.
- SSD was identified as the most returned product.
- Sales trends peaked during the beginning of the year.
- Cancellation rates varied by region.
- Top sales agents contributed significantly to total revenue.

---

# 🎯 Skills Demonstrated

- SQL Query Writing
- Data Analysis
- Business Intelligence Reporting
- Power BI Dashboard Design
- Data Visualization
- KPI Development
- Interactive Filtering

---

# 📁 Project Deliverables

- SQL Query File
- Power BI Dashboard (.pbix)
- Dashboard Screenshots
- README Documentation


## Video Link

https://drive.google.com/file/d/12io-C-atvW6fIFzeoxds51beq_4askg_/view?usp=sharing
---

# 👨‍💻 Author

## Darshil

---

# ⭐ Conclusion

The **Regional Sales 2025 Dashboard** provides valuable insights into sales trends, regional performance, cancellations, and customer behavior. The combination of SQL analysis and Power BI visualizations helps transform raw data into actionable business insights.
