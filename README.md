# iTunes Data Warehouse and Dashboard Project

## 1. Dimensional Models (DBT)
### **Dim_Customer.sql**
- **Goal:** Create a Customer Dimension table with customer details such as name, address, phone number, and email domain extraction.
- **Key Actions:**
  - Standardized customer names to title case.
  - Extracted email domains.
  - Added a timestamp column (`dbt_time`) for process tracking.

### **Dim_Employee.sql**
- **Goal:** Create an Employee Dimension table, including department budgets and identifying managers.
- **Key Actions:**
  - Calculated years of employment for each employee.
  - Identified managers using a case condition.
  - Merged department budget data with employee details.

### **Dim_Playlist.sql**
- **Goal:** Create a Playlist Dimension table to analyze playlists and track updates.
- **Key Actions:**
  - Combined playlist and track details using a join.
  - Implemented incremental updates with a timestamp condition.

### **Dim_Track.sql**
- **Goal:** Create a Track Dimension table with details like genre, album, artist, track duration, and price.
- **Key Actions:**
  - Converted track duration from milliseconds to minutes:seconds format.
  - Merged data from genre, album, and media type tables.

### **Dim_Currency.sql**
- **Goal:** Build a Currency Dimension table to incorporate historical exchange rates between USD and ILS.
- **Key Actions:**
  - Integrated exchange rates with sales data based on date.
  - Prepared data for currency-based sales analysis.

---

## 2. Fact Models
### **Fact_Invoice.sql**
- **Goal:** Create an Invoice Fact table for high-level sales transactions.
- **Key Actions:**
  - Implemented incremental updates based on the latest invoice date.
  - Added process timestamp (`dbt_time`).

### **Fact_InvoiceLine.sql**
- **Goal:** Create an Invoice Line Fact table for detailed sales transaction analysis.
- **Key Actions:**
  - Stored individual line items of invoices, including quantities and prices.
  - Added a timestamp column for tracking updates.

---

## 3. API Integration for Currency Conversion
### **API_Currency.ipynb**
- **Goal:** Fetch and integrate exchange rates between USD and ILS using an external API.
- **Key Actions:**
  - Retrieved historical exchange rates (2018-2022) via the Alpha Vantage API.
  - Stored data in a PostgreSQL database as a staging table.
  - Prepared data for use in the `Dim_Currency` model.

---

## 4. Business Intelligence (Power BI Dashboards)
### **Dashboard 1: Sales Overview**
- **Highlights:**
  - **Top 5 Genres:** Displayed the most popular music genres based on track and album counts.
  - **Top 5 Countries by Sales:** Analyzed sales by geographic location.
  - **Customer Spending:** Identified top customers based on total purchases.
  - Tooltip functionality added for genre-specific insights.

### **Dashboard 2: Track Analysis**
- **Highlights:**
  - **Track Duration:** Visualized distribution of track lengths in seconds.
  - **Monthly Sales Trends:** Analyzed sales patterns over time (monthly granularity).
  - Added slicers for dynamic filtering by date and genre.

---

## Summary
This project showcases end-to-end ETL and analytics capabilities:
- **Data Engineering:** Building a Star Schema with DBT, incorporating Dimensional and Fact tables.
- **API Integration:** Fetching external data for currency conversion and storing it in PostgreSQL.
- **Data Visualization:** Developing interactive dashboards in Power BI to provide actionable insights.
