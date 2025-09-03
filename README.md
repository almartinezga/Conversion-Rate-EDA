# Conversion Rate Exploratory Analysis

## Summary
This project explores **conversion rates across browsers, countries, and time (weeks)** using a dataset of website visits and conversions.

The goal is to **understand how user behavior differs by browser and geography**, identify performance gaps, and provide insights that can guide optimization strategies for digital campaigns.


## Key steps completed
- **Data Cleaning (Python)** → Checked for missing values, duplicates, inconsistent naming, and outliers.
- **Feature Engineering** → Created a new metric: ``conversion_rate`` (conversions / visits × 100).
- **Exploratory Data Analysis (Python & SQL)** →
  - Python (Pandas, Seaborn, Matplotlib) for data wrangling and visualization.
  - PostgreSQL for aggregations, segmentations, and validation of insights.
- **Segmentation** →
  - By browser (Chrome, Edge, Firefox, Safari).
  - By country (A–J).
  - By week (0–19).
- **Visualization** → Line charts for weekly trends, bar charts for aggregated engagement, and comparison tables for top/bottom performers.

---

## Repository content
- `README.md` → This documentation.  
- `Conversion Rate EDA.ipynb` → Python script with cleaning, feature engineering, and exploratory analysis (visualizations included).
- `Conversion Rate EDA.sql` → SQL queries for validation, aggregations, and exploratory analysis. 
- ``executive_presentation.pptx``→ Executive summary presentation with key questions insights for stakeholders.
- ``Dataset``: *conversions_data_set.csv* → Not included. This dataset is private and cannot be redistributed.

⚠️ Note: Since the dataset is not public, results cannot be fully reproduced. However, the repository shows the methodology, scripts, and structure of the analysis.

---

## Key Insights
1. **Most projects are low-cost** (<5,000 USD), but a few very large donations (top 30%) skew the average.
2. **Seasonality is strong**: donations spike during ``Ramadan``, reflecting cultural and religious giving traditions.
3. **Projects ≠ Donations**: the countries with the most projects are not always the ones receiving the highest funding.
4. **Forecasting accuracy**:
- Number of projects → MAPE ≈ 16.1% (good accuracy for real-world data).
- Value of donations → MAPE ≈ 18.8% when excluding extreme outliers.

1. **Browsers ranking (by conversion rate)**:
- Highest → Firefox (>59%).
- Lowest → Safari (~28%).
- Chrome and Edge remain in the middle.
2. **Countries ranking:**
- Top performers: E (80.9%), C (73.6%), J (55.6%).
- Lowest: I (5.1%) with a gap of >75% compared to the top.
3. **Weekly patterns:**
- Conversion rates dropped until Week 6, then spiked at Week 7, remaining higher afterward.
- The difference between the highest and lowest weeks is ~4.5% globally.
4. **Overall conversion rate:** 38.74% across all browsers, countries, and weeks.

## Impact and Contribution
This analysis helps stakeholders:
- Identify which browsers and regions perform best (and worst).
- Detect temporal trends that may align with external events or campaign launches.
- Support data-driven decision making for targeting, resource allocation, and optimization strategies.

---

## Limitations
- Dataset is ``confidential and not shared``.
- Covers ``only 20 weeks``, limiting long-term trend analysis.
- Some conversion rates are ``extremely high/low``, which may indicate edge cases.
- Data anonymization (countries A–J) prevents linking insights to real-world geography.

## Next steps
- Investigate ``root causes`` of extremely high/low conversion rates.
- Expand analysis with ``additional weeks`` to confirm seasonal or cyclical patterns.
- Explore ``advanced models`` (forecasting, anomaly detection) to predict future conversion performance.
