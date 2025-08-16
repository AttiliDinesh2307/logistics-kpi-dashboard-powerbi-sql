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

---

## ⚙️ Setup Instructions

### 1. Clone the Repository
```bash
git clone https://github.com/your-username/Logistics-KPI-Dashboard.git
cd Logistics-KPI-Dashboard

2. Database Setup
	1.	Open your SQL environment (e.g., SQL Server, PostgreSQL, MySQL).
	2.	Create a new database for logistics KPIs.
	3.	Import and run the scripts from the sql/logistics_queries.sql file to generate insights from the dataset.

3. Power BI Setup
	1.	Open Power BI Desktop.
	2.	Load the dataset from dataset/Logistics_KPI_Dashboard_Dataset.xlsx.
	3.	Open the powerbi/dashboard.pbix file to view the pre-built dashboard.
	4.	Refresh the data connection and explore.

⸻

📈 Key KPIs Tracked
	•	Average Delivery Time by Region
	•	Fulfillment Status Distribution
	•	SKU-wise Inventory Usage
	•	Order Cycle Time Analysis
	•	Inventory Stock Levels vs Reorder Point
	•	On-Time Delivery % and Backorder Rate

⸻

🛠️ Tech Stack
	•	SQL – Data extraction, transformation, and querying
	•	Power BI – Dashboard design and interactive reporting
	•	Excel – Sample dataset storage and preparation

⸻

🚀 Future Improvements
	•	Automating data refresh with live SQL connections
	•	Adding machine learning predictions for delivery delays
	•	Expanding dataset with cost and revenue metrics

⸻

🤝 Contributing

Pull requests are welcome! For major changes, please open an issue first to discuss what you’d like to update.
