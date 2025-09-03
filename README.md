# Conversion Rate Exploratory Analysis

## Summary
This project explores **conversion rates across browsers, countries, and time (weeks)** using a dataset of website visits and conversions.

The goal is to **understand how user behavior differs by browser and geography**, identify performance gaps, and provide insights that can guide optimization strategies for digital campaigns.


## Key steps completed
- **Data Cleaning (Python)** → Checked for missing values, duplicates, inconsistent naming, and outliers.
- **Feature Engineering** → Created a new metric: ``conversion_rate`` (conversions / visits × 100).
- **Exploratory Data Analysis (Python & SQL)** 
- **Segmentation** → By browser, By country, By week.
- **Visualization** → Line charts for weekly trends, bar charts for aggregated engagement, and comparison tables for top/bottom performers.

---

## Repository content
- `README.md` → This documentation.  
- `Conversion Rate EDA.ipynb` → Python script with cleaning, feature engineering, and exploratory analysis (visualizations included).
- `Conversion Rate EDA.sql` → SQL queries for validation, aggregations, and exploratory analysis. 
- ``executive_presentation.pptx``→ Executive summary presentation with key questions insights for stakeholders.

⚠️ Note: Since the dataset is not public, I cannot share it in the repository. However, the repository shows the methodology, scripts, and structure of the analysis.

---

## Key Insights

1. **Browsers ranking (by conversion rate)**: Highest: Firefox (>59%) | Lowest Safari (~28%).
2. **Countries ranking:** Highest: E (80.9%), C (73.6%), J (55.6%) | Lowest: I (5.1%).
3. **Weekly patterns:** There was a consistent but limited drop in conversion rates in Week 6, then a spike at Week 7, and then it remained stable.
4. **Overall conversion rate:** 38.74% across all browsers, countries, and weeks.

## Impact and Contribution
This analysis helps stakeholders:
- Identify which ``browsers and regions`` perform best (and worst).
- Detect ``temporal trends`` that may align with external events or campaign launches.
- Support ``data-driven decision making`` for targeting, resource allocation, and optimization strategies.

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
