
-- SQL Queries for Car Sales Analysis

-- 1. Table Overview
-- Car Sales Types Table:
SELECT * 
FROM car_sales.car_sales_type;

-- 2. SQL Queries for Car Sales Analysis

-- a. Total Electric and Non-Electric Cars Sold (2010-2023):
SELECT 
    country,
    SUM(electric_cars_sold) AS total_electric_cars_sold,
    SUM(non_electric_car_sales) AS total_non_electric_car_sales
FROM car_sales_type
WHERE year BETWEEN 2010 AND 2023
GROUP BY country;

-- b. Average Annual Growth Rate for Electric Cars (2010-2023):
WITH growth_rate AS (
    SELECT 
        country,
        year,
        electric_cars_sold,
        LAG(electric_cars_sold) OVER (PARTITION BY country ORDER BY year) AS previous_year_sales
    FROM car_sales_type
    WHERE year BETWEEN 2010 AND 2023
)
SELECT 
    country,
    AVG((electric_cars_sold - previous_year_sales) / previous_year_sales * 100) AS avg_growth_rate
FROM growth_rate
WHERE previous_year_sales IS NOT NULL
GROUP BY country;

-- c. Year-Over-Year Change in Electric Cars Sold:
SELECT 
    country,
    year,
    electric_cars_sold,
    LAG(electric_cars_sold) OVER (PARTITION BY country ORDER BY year) AS previous_year_sales,
    (electric_cars_sold - LAG(electric_cars_sold) OVER (PARTITION BY country ORDER BY year)) AS current_change,
    ((electric_cars_sold - LAG(electric_cars_sold) OVER (PARTITION BY country ORDER BY year)) / LAG(electric_cars_sold) OVER (PARTITION BY country ORDER BY year)) * 100 AS percentage_change
FROM car_sales_type
WHERE year BETWEEN 2010 AND 2023;

-- d. Annual Totals for All Entities:
SELECT 
    year,
    SUM(electric_cars_sold) AS total_electric_cars_sold,
    SUM(non_electric_car_sales) AS total_non_electric_car_sales
FROM car_sales_type
WHERE year BETWEEN 2010 AND 2023
GROUP BY year
ORDER BY year;

-- e. Slope and Intercept Calculation for Electric Car Sales Trend (2010-2023):
WITH stats AS (
    SELECT 
        COUNT(*) AS n,
        SUM(year) AS sum_year,
        SUM(electric_cars_sold) AS sum_sales,
        SUM(year * electric_cars_sold) AS sum_year_sales,
        SUM(year * year) AS sum_year_squared
    FROM car_sales_type
    WHERE year BETWEEN 2010 AND 2023
)
SELECT 
    (n * sum_year_sales - sum_year * sum_sales) / (n * sum_year_squared - sum_year * sum_year) AS slope,
    (sum_sales - ((n * sum_year_sales - sum_year * sum_sales) / (n * sum_year_squared - sum_year * sum_year)) * sum_year) / n AS intercept
FROM stats;

-- f. Yearly Ranking of Electric Car Sales by Country:
SELECT 
    country,
    year,
    electric_cars_sold,
    RANK() OVER (PARTITION BY year ORDER BY electric_cars_sold DESC) AS sales_rank
FROM car_sales_type
WHERE year BETWEEN 2010 AND 2023
ORDER BY year, sales_rank;

-- g. Moving Average of Electric Car Sales (Last 3 Years):
SELECT 
    country,
    year,
    AVG(electric_cars_sold) OVER (PARTITION BY country ORDER BY year ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) AS moving_avg_sales
FROM car_sales_type
WHERE year BETWEEN 2010 AND 2023;

-- h. Global Market Share of Electric Cars:
WITH total_world_sales AS (
    SELECT 
        year,
        SUM(electric_cars_sold) AS total_world_sales
    FROM car_sales_type
    WHERE country IS NOT NULL 
    GROUP BY year
)
SELECT 
    c.country,
    c.year,
    c.electric_cars_sold,
    (c.electric_cars_sold / w.total_world_sales) * 100 AS global_market_share
FROM car_sales_type c
JOIN total_world_sales w ON c.year = w.year
WHERE c.year BETWEEN 2010 AND 2023
ORDER BY c.year, global_market_share DESC;
