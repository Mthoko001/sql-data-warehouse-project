# 📊 Modern SQL Data Warehouse Project  
### Medallion Architecture | CRM + ERP Integration | SQL Analytics | Power BI

---

## 📌 Project Overview

This project demonstrates the design and implementation of a **Modern SQL Data Warehouse** using the **Medallion Architecture (Bronze, Silver, Gold layers)**.

The objective is to simulate how a Data Engineer builds a centralized and standardized data platform that enables Data Analysts and Business Analysts to generate reliable insights and support strategic decision-making.

The project integrates data from multiple business systems (CRM and ERP), transforms it using SQL, and presents analytical insights in Power BI.

---

## 🎯 Business Problem

Organizations often operate multiple systems such as CRM and ERP, which results in:

- Data silos  
- Inconsistent reporting  
- Manual reconciliation  
- Limited visibility into performance  

This project solves that by centralizing and standardizing the data into a structured warehouse model.

---

## 🏗️ Architecture – Medallion Approach

The project follows the Medallion Architecture:

### 🥉 Bronze Layer (Raw Data)
- Raw CSV files ingested from CRM and ERP systems  
- No transformation applied  
- Serves as the historical source of truth  

### 🥈 Silver Layer (Cleaned & Transformed Data)
- Data cleaning and validation  
- Standardized column naming  
- Null handling and deduplication  
- Business logic applied using SQL  
- Integration of CRM and ERP datasets  

### 🥇 Gold Layer (Business-Ready Data)
- Star schema design  
- Fact and Dimension tables created  
- Aggregations and KPIs calculated  
- Optimized for reporting and BI tools  

---

## 📂 Data Sources

### CRM System
- Customers  
- Sales Transactions  

### ERP System
- Products  
- Sales Records  

All data is provided in CSV format and loaded into SQL for transformation.

---

## 🛠️ Tech Stack

- SQL (Data transformation & business logic)
- Power BI (Visualization & dashboard reporting)
- CSV files (Source systems)
- Medallion Architecture (Data engineering design pattern)

---

## 📊 Data Modeling

Final model structure:

- Fact_Sales  
- Dim_Customers  
- Dim_Products  
- Dim_Date  

The warehouse follows a **Star Schema** to improve performance and analytical efficiency.

---

## 📈 Key Metrics & KPIs

- Total Revenue  
- Sales by Product  
- Sales by Customer  
- Monthly Sales Trends  
- Customer Purchase Behavior  

---

## 🔎 SQL Capabilities Demonstrated

- Data cleaning and transformation  
- Joins between multiple systems  
- Aggregations using GROUP BY  
- Creation of Fact & Dimension tables  
- Revenue and KPI calculations  

---

## 📊 Power BI Dashboard

The Gold layer is connected to Power BI to:

- Create interactive dashboards  
- Enable drill-down analysis  
- Provide executive-level reporting  
- Support data-driven decision making  

---

## 🚀 Project Value

This project demonstrates:

- Data Warehousing concepts  
- Medallion Architecture implementation  
- SQL transformation skills  
- Data modeling expertise  
- Business Intelligence reporting  

It reflects how modern organizations design scalable data platforms to support analytics and business growth.

---

## 👤 Author

Mthokozisi Seja  
Business Intelligence / Data Analyst  
SQL | Power BI | Data Warehousing | Analytics
