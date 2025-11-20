
-- ===============================
-- BMW Car Data Analytics Project
-- ===============================

-- 1. Create database
CREATE DATABASE IF NOT EXISTS bmw_project;
USE bmw_project;

-- 2. Create main table
DROP TABLE IF EXISTS bmw_cars;
CREATE TABLE bmw_cars (
    model VARCHAR(100),
    year INT,
    price INT,
    transmission VARCHAR(50),
    mileage INT,
    fuelType VARCHAR(50),
    tax INT,
    mpg DECIMAL(10,2),
    engineSize DECIMAL(10,2)
);
-- ==============================================

-- 1. Total number of cars in the dataset
SELECT COUNT(*) AS total_cars FROM bmw_cars;

-- 2. Display top 10 most expensive cars
SELECT model, year, price
FROM bmw_cars
ORDER BY price DESC
LIMIT 10;

-- 3. Find the average price per model
SELECT model, ROUND(AVG(price),2) AS avg_price
FROM bmw_cars
GROUP BY model
ORDER BY avg_price DESC;

-- 4. Count total cars grouped by fuel type
SELECT fuelType, COUNT(*) AS total
FROM bmw_cars
GROUP BY fuelType
ORDER BY total DESC;

-- 5. Calculate average mileage per year
SELECT year, ROUND(AVG(mileage),2) AS avg_mileage
FROM bmw_cars
GROUP BY year
ORDER BY year DESC;

-- 6. Compare each model’s price to the highest priced model in the same year
SELECT 
    a.model AS model_name,
    a.year,
    a.price AS model_price,
    b.model AS top_model_same_year,
    b.price AS top_price_same_year
FROM bmw_cars a
JOIN (
    SELECT 
        year, 
        MAX(price) AS max_price
    FROM bmw_cars
    GROUP BY year
) AS max_table
  ON a.year = max_table.year
JOIN bmw_cars b
  ON b.year = max_table.year
 AND b.price = max_table.max_price
ORDER BY a.year DESC, a.price DESC;

-- 7. Rank models by price within each year
SELECT model,
       year,
       price,
       RANK() OVER (PARTITION BY year ORDER BY price DESC) AS price_rank
FROM bmw_cars
ORDER BY year DESC, price_rank;

-- 8. Calculate running total of cars over the years
SELECT year,
       COUNT(*) AS total_per_year,
       SUM(COUNT(*)) OVER (ORDER BY year) AS running_total
FROM bmw_cars
GROUP BY year
ORDER BY year;

-- 9. Find average price per model and compare with overall average
SELECT model,
       ROUND(AVG(price),2) AS model_avg_price,
       ROUND(AVG(AVG(price)) OVER (),2) AS overall_avg_price,
       ROUND(AVG(price) - AVG(AVG(price)) OVER (),2) AS difference_from_overall
FROM bmw_cars
GROUP BY model
ORDER BY model_avg_price DESC;

-- 10. Get top 5 most expensive cars per fuel type
SELECT model,
       fuelType,
       price,
       rnk
FROM (
    SELECT model,
           fuelType,
           price,
           RANK() OVER (PARTITION BY fuelType ORDER BY price DESC) AS rnk
    FROM bmw_cars
) AS ranked
WHERE rnk <= 5
ORDER BY fuelType, rnk;

-- 11. Check how average price varies with engine size bucket
SELECT engine_bucket,
       ROUND(AVG(price), 2) AS avg_price
FROM (
    SELECT CONCAT(FLOOR(engineSize), 'L') AS engine_bucket,
           price
    FROM bmw_cars
) AS t
GROUP BY engine_bucket
ORDER BY CAST(REPLACE(engine_bucket, 'L', '') AS UNSIGNED);

-- 12. Top 10 most fuel-efficient models
SELECT model,
       fuelType,
       mpg
FROM bmw_cars
ORDER BY mpg DESC
LIMIT 10;

-- 13. Compare average price across transmission types per fuel type
SELECT fuelType,
       transmission,
       ROUND(AVG(price), 2) AS avg_price
FROM bmw_cars
GROUP BY fuelType, transmission
ORDER BY fuelType, avg_price DESC;

-- 14. Models priced above the yearly average
SELECT model,
       year,
       price,
       ROUND(year_avg, 2) AS avg_price_of_year
FROM (
    SELECT model,
           year,
           price,
           AVG(price) OVER (PARTITION BY year) AS year_avg
    FROM bmw_cars
) AS t
WHERE price > year_avg
ORDER BY year DESC, price DESC;

-- 15. Price distribution per year
SELECT year,
       MIN(price) AS min_price,
       MAX(price) AS max_price,
       ROUND(AVG(price), 2) AS avg_price
FROM bmw_cars
GROUP BY year
ORDER BY year DESC;

-- 16. Outlier detection: cars priced 1.5x above yearly average
SELECT model,
       year,
       price,
       ROUND(year_avg, 2) AS avg_price_of_year
FROM (
    SELECT model,
           year,
           price,
           AVG(price) OVER (PARTITION BY year) AS year_avg
    FROM bmw_cars
) AS t
WHERE price > 1.5 * year_avg
ORDER BY year DESC, price DESC;

-- ===========================
