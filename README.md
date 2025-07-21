# 🛒 Retail Sales Analytics Dashboard (PostgreSQL-Only Project)

A SQL-only data analytics project designed for retail performance monitoring. This project simulates a retail store with multiple branches, products, and transactions to help derive key insights like top-selling products, store revenue rankings, and daily sales summaries — all powered by PostgreSQL.

---

## 📁 Project Structure

| File Name        | Description |
|------------------|-------------|
| `01_schema.sql`  | SQL script to create database schema (tables + constraints) |
| `02_seed_data.sql` | Sample seed data to populate the tables |
| `03_queries.sql` | Analytical queries to answer business questions |
| `04_views.sql`   | SQL views to simplify repeated dashboard insights |
| `05_dashboard_queries.sql` | Sample dashboard metrics / queries to plug into BI tools |
| `README.md`      | Project documentation |

---

## 🗂️ Database Schema Overview

**Tables**:
- `products` – Product catalog with pricing
- `stores` – Store locations
- `customers` – Buyer profiles
- `sales` – Transactions with quantity and date

ERD Preview:

```plaintext
[products]---(product_id)---[sales]---(store_id)---[stores]
                          \--(customer_id)---[customers]

🧪 How to Run Locally
1. Create your database:
CREATE DATABASE retail_analytics;

2. Connect and run setup scripts:
psql -U your_user -d retail_analytics -f 01_schema.sql
psql -U your_user -d retail_analytics -f 02_seed_data.sql
psql -U your_user -d retail_analytics -f 04_views.sql

3. Run queries for insights:
psql -U your_user -d retail_analytics -f 03_queries.sql
psql -U your_user -d retail_analytics -f 05_dashboard_queries.sql

📊 Sample Insights

✅ Top Selling Products by Quantity
SELECT * FROM view_top_products_by_quantity LIMIT 5;

💰 Revenue by Store

SELECT * FROM view_store_revenue;

📈 Daily Sales Trends

SELECT * FROM view_daily_sales_summary;

🚀 Use Case
Ideal for practicing SQL joins, aggregations, views, and dashboards.

Can be plugged into tools like Metabase, Power BI, or Tableau for visualization.

📌 Author
Gbolaro Omiyale
🔗 GitHub: @Gydera
📧 Contact: available on request

📝 License
MIT License – free to use and modify.
