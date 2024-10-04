
#  Analysis of Electric and Non-Electric Car Sales (2010-2023)

## https://app.powerbi.com/links/nKGrIPtmhm?ctid=0de96fbb-2304-4d24-a804-bec6ec09f4b7&pbi_source=linkShare

## Table of Contents
1. [Problem Statement/Objective](#problem-statementobjective)
2. [Data Overview](#data-overview)
3. [Data Cleaning and Preparation](#data-cleaning-and-preparation)
4. [SQL Queries for Car Sales Analysis](#sql-queries-for-car-sales-analysis)
5. [Results and Analysis](#results-and-analysis)
6. [Recommendations](#recommendations)
7. [Conclusion](#conclusion)
8. [Data Source](#data-source)
9. [Installation Instructions](#installation-instructions)
10. [Usage Instructions](#usage-instructions)
11. [Contributing](#contributing)
12. [License](#license)

## Problem Statement/Objective
The automotive industry is undergoing a significant transformation with the rise of electric vehicles (EVs). This project aims to analyze car sales data from 2010 to 2023, focusing on electric and non-electric car sales across various countries. The objectives of this analysis include:
- To understand total car sales trends over the years.
- To identify the average annual growth rate of electric cars.
- To assess the year-over-year changes in electric car sales.
- To calculate annual totals for electric and non-electric car sales.
- To derive a linear trend line for electric car sales.
- To rank countries based on their electric car sales yearly.
- To compute moving averages for better trend understanding.
- To determine the global market share of electric cars.

## Data Overview
The dataset used for this analysis is the `car_sales_type` table, which contains the following relevant columns:
- `country`: Name of the country.
- `year`: Year of the sales data.
- `electric_cars_sold`: Number of electric cars sold.
- `non_electric_car_sales`: Number of non-electric cars sold.

## Data Cleaning and Preparation
In order to ensure the accuracy and reliability of the analysis, the dataset underwent several cleaning and preparation steps:
- **Removed Data from the `country` Column**: The following entries were eliminated to uphold a country-level analysis:
  - "World"
  - "European Union"
  - "Europe"
- **Renamed Column**: The column previously labeled as `Entity` was changed to `Country` for clarity and consistency.
- **Renamed Columns with Hyphens**: The following columns were updated to remove spaces and replace them with underscores for better compatibility with database queries:
  - "electric cars sold" was renamed to `electric_cars_sold`
  - "non electric car sales" was renamed to `non_electric_car_sales`
- **Removed the `CODE` Column**: This column was deemed unnecessary for the analysis and was removed from the dataset.

## SQL Queries for Car Sales Analysis
Find SQL Queries Script in the repository. Conpatible with MySQL and other related database.

# Results and Analysis
Summary of Findings
The results provide insights into market trends, growth rates, and rankings of countries based on electric vehicle sales.
#### **Total Electric and Non-Electric Cars Sold (2010-2023)**
- This chart shows the total number of electric vs. non-electric cars sold from 2010 to 2023 across all countries. 

![Total Non-Electric Cars Sold (2010-2023)](https://github.com/user-attachments/assets/c68fe6ac-8334-487a-9d5d-2285ea1bce99)

![Total Electric Cars Sold (2010 - 2023)](https://github.com/user-attachments/assets/936347ee-f39e-4a40-87cd-2009e4656280)


- Analysis: The analysis reveals trends in electric versus non-electric car sales, highlighting shifts in consumer preferences. From the chart, it is clear that electric car sales have steadily risen over the years, especially in developed countries such as the **United States** and **China**. Non-electric car sales, on the other hand, have been declining since 2018.





#### 2. **Growth Rate: Countries Leading in Electric Car Adoption**
The average annual growth rate for electric cars shows that countries like **Israel**, **India**, and **South Africa** taking the lead in the adoption of electric vehicles.

![Average Growth Rate for Electric Cars by Country](https://github.com/user-attachments/assets/2d03860a-7403-4cb4-9bfd-daae57fcba6b)

*Chart showing the countries with the highest average annual growth rate in electric car sales*

---

#### 3. **Year-Over-Year Changes in Electric Car Sales**
Yearly fluctuations in electric car sales provide insights into market dynamics and economic factors influencing car sales.

![Previous Year Sales and Percentage Change by Year](https://github.com/user-attachments/assets/d2a30d9c-2543-4331-853b-2d80587442a4)

*Year-over-year change in electric car sales (2010-2023)*

---

#### 4. **Trends: Predicting Future Electric Car Sales**
The calculated slope and intercept of the sales trendline indicate a significant increase in electric car adoption in the coming years.

![Electric Car Sales Trend](<link-to-visual-for-sales-trend>)
*Linear trendline showing future predictions for electric car sales*

---

#### 5. **Rankings: Top Countries by Electric Car Sales**
A yearly ranking of countries based on electric car sales shows that **China**, **USA**, and **Germany** consistently lead the market.

![Top 10 Sales Ranking For Electric Cars](https://github.com/user-attachments/assets/d610e80e-7eaa-417f-a405-554be5c3172b)

*Top countries in electric car sales ranked from 2010 to 2023*

---

#### 6. **Market Share: Global Contribution to Electric Car Sales**
The global market share of electric car sales is dominated by **China**, holding the largest portion of the market, followed by **Europe** and **North America**.

![Global Market Share Top 7](https://github.com/user-attachments/assets/714aa4b6-2cbc-4e5f-8c94-d57b91ebcbc8)

*Global market share of electric cars by country (2010-2023)*

---

## Conclusion
The data shows a strong upward trend in electric car sales, driven by growing consumer interest in sustainable technologies and government policies favoring the adoption of electric vehicles. Future predictions suggest continued growth, with countries like **China** and **Germany** playing key roles. As the automotive industry continues to evolve, leveraging this data will be crucial for stakeholders aiming to make informed decisions that align with market demands and sustainability goals.







## Recommendations
Key recommendations for stakeholders based on the analysis findings include:
- **Focus on Growth Areas:** Countries with high growth rates in electric car sales should be targeted for marketing and sales efforts.
- **Investment in Infrastructure:** Increased infrastructure for electric cars (charging stations, incentives) can further stimulate sales.
- **Monitor Trends:** Regularly analyze sales data to adapt marketing strategies and production plans accordingly.
- **Sustainability Initiatives:** Promote the environmental benefits of electric cars to align with growing consumer demand for sustainable products.

# Snapshot of Dashboard 
![EVs and Non-EVs Car Sales](https://github.com/user-attachments/assets/0ec6ffdb-46ac-4743-aa21-71fd164aa785)


## Data Source
Hannah Ritchie (2024) - “Tracking global data on electric vehicles” Published online at OurWorldinData.org. Retrieved from: [https://ourworldindata.org/electric-car-sales](https://ourworldindata.org/electric-car-sales) [Online Resource].

## Installation Instructions
1. Clone the repository: `git clone <repository_url>`
2. Install required packages: `pip install -r requirements.txt`

## Usage Instructions
To run the analysis, execute the following command: `python analyze_car_sales.py`

## Contributing
If you'd like to contribute to this project, please fork the repository and submit a pull request with your changes.

## License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
