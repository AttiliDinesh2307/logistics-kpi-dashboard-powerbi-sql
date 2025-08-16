# Logistics KPI Dashboard | Power BI & SQL

This project showcases a real-time logistics performance monitoring dashboard built using **Power BI** and **SQL**, designed to improve operational decision-making by visualizing key metrics such as inventory health, order cycle times, and delivery performance.

## 📌 Project Summary

- **Tools Used**: Power BI, SQL Server, Excel
- **Focus Areas**: Inventory metrics, delivery timelines, order processing
- **Goal**: To detect bottlenecks, track SLA adherence, and optimize fulfillment operations

---

## 🔍 Key Features

- 🚚 **Logistics KPIs Tracked**:
  - Inventory Turnover
  - Stock Availability Rate
  - Average Delivery Time
  - On-Time Delivery %
  - Order Cycle Time
  - Stockout & Overstock Events

- 📊 **Dashboard Design**:
  - Interactive visuals (slicers for Region, SKU, Fulfillment Status)
  - Trend lines, automated alerts, drill-down analysis
  - Region- and SKU-level insights

- 🗂️ **SQL Workflows**:
  - Data cleaning, joining, and transformation using multiple related tables
  - Created views and queries for real-time refresh in Power BI

## 📁 Project Structure
📂 Logistics-KPI-Dashboard
│
├── dataset/
│   └── Logistics_KPI_Dashboard_Dataset.xlsx   # Sample dataset
│
├── sql/
│   └── logistics_queries.sql                  # SQL scripts for analysis
│
├── powerbi/
│   └── dashboard.pbix                         # Power BI dashboard file
│
└── README.md                                  # Project documentation

🗄️ SQL Queries Included

Some example queries used in this project:
	•	Average Delivery Time by Region
	•	Fulfillment Status Distribution
	•	SKU-wise Inventory Usage
	•	Stock Turnover Analysis
	•	Safety Stock Breach Alerts

⸻

📈 Power BI Dashboard Highlights
	•	Regional performance comparison
	•	Inventory utilization tracking
	•	On-time vs delayed deliveries trend
	•	Interactive drilldowns for SKU, Region, Fulfillment
	•	Trend analysis with automated alerts
