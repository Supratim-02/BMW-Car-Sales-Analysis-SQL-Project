# 🚗 BMW Car Sales Analysis using SQL

A data analytics project using **MySQL and advanced SQL functions** to explore BMW car sales data, uncover pricing trends, fuel-type distribution, engine-size impact, performance variations, and consumer market behavior. Insights help optimize pricing, inventory selection, and sales forecasting.


---

## 📊 Project Overview

| Feature | Details |
|---------|---------|
| Total Records | 10,781 |
| Columns | 9 |
| Database Used | MySQL |
| Tools | Python, SQL, Excel |
| Focus Areas | Price, Mileage, Engine Size, Fuel Type, Market Trends |

**Dataset Attributes:**  
`Model`, `Year`, `Price`, `Transmission`, `Mileage`, `Fuel Type`, `Tax`, `MPG`, `Engine Size`  
:contentReference[oaicite:1]{index=1}

---

## 🎯 Business Goals

✔ Identify most expensive and high-demand models  
✔ Analyze yearly price and mileage performance  
✔ Study pricing trends by fuel type, transmission, and engine size  
✔ Detect outlier cars priced 1.5× above yearly average  
✔ Rank cars based on fuel efficiency and price  
✔ Compare models against overall and yearly average pricing  

:contentReference[oaicite:2]{index=2}

---

## 🔍 SQL Insights & Key Queries

| Analysis | Query Highlight |
|----------|------------------|
| Total Cars | `SELECT COUNT(*) FROM bmw_cars;` |
| Top 10 Most Expensive Cars | `ORDER BY price DESC LIMIT 10;` |
| Avg Price per Model | `ROUND(AVG(price),2)` |
| Cars Grouped by Fuel Type | `GROUP BY fuelType` |
| Avg Mileage per Year | `GROUP BY year ORDER BY year DESC` |
| Rank Models by Price (Window) | `RANK() OVER (PARTITION BY year ORDER BY price)` |
| Models Above Yearly Avg Price | `AVG(price) OVER (PARTITION BY year)` |
| Price Outlier Detection | `WHERE price > 1.5 * year_avg` |

:contentReference[oaicite:3]{index=3}

---

## 💡 Key Insights

- BMW models show strong **year-over-year price appreciation**.
- **M-series & X-series** dominate premium price ranges.
- **Petrol vehicles lead**, but diesel and hybrid models show higher fuel efficiency.
- **Engine size strongly correlates with pricing** — especially above 3.0L.
- Automatic transmissions show higher average resale price.
- Significant **outliers priced 1.5× above yearly average**, indicating luxury editions.
  
:contentReference[oaicite:4]{index=4}

---

## 🚀 Recommendations

| Focus Area | Strategic Suggestion |
|------------|----------------------|
| Pricing Strategy | Use model-wise and year-wise average prices for competitive listing |
| Inventory | Stock high-demand models: M-series, X5, hybrid/electric variants |
| Marketing | Promote premium & fuel-efficient cars for target niche buyers |
| Data Strategy | Track price vs mileage & engine trends for forecasting |
| Future Enhancements | Add depreciation and regional analysis |

:contentReference[oaicite:5]{index=5}

---

## 🛠 Tools & Technologies Used

- **MySQL** – SQL queries, joins, window functions  
- **Python** – Data extraction, visualization  
- **Excel** – Additional data formatting and presentation  
- **SQL Concepts**: Ranking, Aggregation, Window Functions, Joins, Bucketing  

---

## 📌 Next Improvements (Future Scope)

🔹 Build a dashboard using Power BI/Tableau  
🔹 Add price depreciation model using Python  
🔹 Integrate car resale market price API  
🔹 Perform regional demand segmentation  

---

## 🏁 Conclusion  
This SQL-based analysis reveals key pricing patterns, performance behaviors, and market trends in BMW car sales. By combining **model, year, fuel type, mileage, and engine size insights**, this project supports **better inventory planning, pricing strategies, and customer targeting**.

---

