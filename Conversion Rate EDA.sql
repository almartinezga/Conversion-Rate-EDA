/*
Conversion Rate Exploratory Data Analysis using PostgreSQL.

*/


/*
Shows column names: .
id, website_visits, week, browser, country, conversions

*/

SELECT column_name 
FROM information_schema.columns
WHERE table_schema = 'public';

-- Step 1. Making sure that the data is consistent and that there are no duplicates.

SELECT DISTINCT(week)
FROM conversions_data_set
ORDER BY week; -- There are no duplicates, and the 20 weeks go from 0-19.

SELECT DISTINCT(browser)
FROM conversions_data_set
ORDER BY browser; -- No duplicates. The 4 browsers are chrome, edge, firefox, safari

SELECT DISTINCT(country)
FROM conversions_data_set
ORDER BY country; -- No duplicates. There are 10 countries that go from A-J.

/* 
There are 800 rows in the dataset, which correctly correspond to the unique values for each of our categories:
week, browser, country(20*4*10 = 800 rows)

*/

-- Step 2. Exploratory Data Analysis

-- Step 2.1 Creating a Conversion Rate Column to take a first glance at the data without any segmentation.

SELECT * 
FROM conversions_data_set;

-- Retrieving the weeks with the highest and the lowest conversion_rate

SELECT *, conversions / website_visits * 100 AS conversion_rate
FROM conversions_data_set
ORDER BY conversion_rate DESC
LIMIT 10; -- Highest conversion_rate


SELECT *, conversions / website_visits * 100 AS conversion_rate
FROM conversions_data_set
ORDER BY conversion_rate ASC
LIMIT 10; -- Lowest conversion_rate

/* 
The top 10 weeks with the highest conversion_rate are all in the firefox browser, Country E and have a >94% conversion rate.
The lowest 10 weeks by conversion_rate are all in the safari browser, in either Country I or J and have a <2.5% conversion rate.

Next, I'll start segmentation by week, country and browser to have a better understanding of data

*/



-- Step 2.2 Exploring the data creating week, country and browser segmentations.

-- Calculating the Weekly Conversion Rate

SELECT
	week,
	SUM(website_visits) AS total_visits,
	SUM(conversions) AS total_conversions,
	SUM(conversions) / SUM(website_visits) * 100 AS conversion_rate
FROM conversions_data_set
GROUP BY week
ORDER BY conversion_rate DESC;

/* 
Taking all the browsers and countries together into account...

The 5 weeks with the highest conversion_rate are 7-11 (in that order), each with a >39.6% conversion_rate.
The 5 weeks with the lowest conversion_rate are 2-6 (in that order), each with a <36.4% conversion_rate.
None of the weeks fall below the 35.7% conversion_rate.

This gives us a clue that something may have improved by week 7 in general, but the difference amongst weeks is not huge;
as the top week vs lowest week difference is approximately 4.52%

*/

-- Simple segmentation of data by browser.

SELECT
	browser,
	SUM(website_visits) AS total_visits,
	SUM(conversions) AS total_conversions,
	SUM(conversions) / SUM(website_visits) * 100 AS conversion_rate
FROM conversions_data_set
GROUP BY browser
ORDER BY conversion_rate DESC;

/* 
Taking all the weeks and countries together into account, browsers rank as follows in total conversion_rate:
firefox (59.92%), edge(47.74%), chrome(47.74%), safari (27.78%)


This gives us a clue that firefox has a significantly conversion_rate (at least 12%) higher than the other browsers;
While safari has a significantly lower_conversion rate (at least 20%) than the other browsers.

*/

-- Segmentating data by browser over time

SELECT
	week,
	browser,
	SUM(website_visits) AS total_visits,
	SUM(conversions) AS total_conversions,
	SUM(conversions) / SUM(website_visits) * 100 AS conversion_rate
FROM conversions_data_set
GROUP BY week, browser
ORDER BY conversion_rate DESC;

/* 
Taking time into account, the ranking remains the same: firefox, edge, chrome, safari.

A trend visible in each browser is that from week 7 onwards, conversion_rate was higher. The top 5 being weeks 7, 8, 9, 10, 11 (in that order). 
Another trend is that in each browser, in week 6 and backwards, conversion_rate was the lowest. Going worst each week and having week 6 as the lowest conversion_rate.

The highest weeks have a >60% conversion rate and the lowest a <29% rate.
This could indicate there are extreme values in both sides that push conversion_rate lower and higher.

*/

-- Segmentating data by country

SELECT
	country,
	SUM(website_visits) AS total_visits,
	SUM(conversions) AS total_conversions,
	SUM(conversions) / SUM(website_visits) * 100 AS conversion_rate
FROM conversions_data_set
GROUP BY country
ORDER BY conversion_rate DESC;

/* 
Taking all the weeks and browsers together into account, rank as follows in total conversion_rate:
E (80.88%), C (73.64%), J (55.61%), H (45.46%), D(35.19%), G (19.38%), B (19.29%), F (16.62%), A (13.02%), I (5.09%)

The difference between the top and the lowest countries is huge. More than 75% difference between country E and I.

*/

SELECT
	week,
	country,
	SUM(website_visits) AS total_visits,
	SUM(conversions) AS total_conversions,
	SUM(conversions) / SUM(website_visits) * 100 AS conversion_rate
FROM conversions_data_set
GROUP BY week, country
ORDER BY conversion_rate DESC;

/* 
Taking time into account, the ranking appears to remain the same: E, C, J, H, D, G, B, F, A, I.

However the trend here is different, as conversion rate starts higher in each country and decreases over time. 
Weeks 0, 1 and 2 (in different orders) have the highest conversion_rate, and weeks 17, 18 and 19 have the lowest.

This indicates that the relation between week and conversion_rate could be more complex than it appears until now.

*/


-- To have a better understanding of all the data above, I will retrieve the overall conversion rate.

SELECT SUM(conversions) / SUM(website_visits) * 100 AS overall_conversion_rate
FROM conversions_data_set;

/*
Overall conversion_rate= 38.74%

Apparently until now, the weeks don't make a huge difference by themselves.
But other factors such as the country, and browsers have a high correlation with conversion_rate.

*/



-- Step 2.3 Exploring Figures in Certain Weeks that could be interesting for a presentation with stakeholders


-- Global Conversion Rate in Weeks 0, 6, 7 and 19

SELECT SUM(conversions) / SUM(website_visits) * 100 AS overall_conversion_rate
FROM conversions_data_set
WHERE week = 0; -- Week 0: 36.67

SELECT SUM(conversions) / SUM(website_visits) * 100 AS overall_conversion_rate
FROM conversions_data_set
WHERE week = 6; -- Week 6: 35.74

SELECT SUM(conversions) / SUM(website_visits) * 100 AS overall_conversion_rate
FROM conversions_data_set
WHERE week = 19; -- Week 7: 40.26

SELECT SUM(conversions) / SUM(website_visits) * 100 AS overall_conversion_rate
FROM conversions_data_set
WHERE week = 19; -- Week 19: 38.35


-- Conversion Rate by Country durings Weeks 0 and 19

SELECT
	country,
	SUM(website_visits) AS total_visits,
	SUM(conversions) AS total_conversions,
	SUM(conversions) / SUM(website_visits) * 100 AS conversion_rate
FROM conversions_data_set
WHERE week = 0
GROUP BY country
ORDER BY conversion_rate DESC; -- Week 0: E = 82.95, C = 75.53, J = 56.78, H = 46.39, D = 37.38, G = 21.45, B = 21.41, F = 17.63, A = 13.97, I = 6.74

SELECT
	country,
	SUM(website_visits) AS total_visits,
	SUM(conversions) AS total_conversions,
	SUM(conversions) / SUM(website_visits) * 100 AS conversion_rate
FROM conversions_data_set
WHERE week = 19
GROUP BY country
ORDER BY conversion_rate DESC; -- Week 19. E = 79.91, C = 72.84, J = 54.91, H = 44.88, D = 34.06, B = 18.37, B = 18.33, F = 16.21, A = 12.55, I = 4.13


-- Conversion Rate by Browser durings Weeks 0, 6, 7 and 19

SELECT
	browser,
	SUM(website_visits) AS total_visits,
	SUM(conversions) AS total_conversions,
	SUM(conversions) / SUM(website_visits) * 100 AS conversion_rate
FROM conversions_data_set
WHERE week = 0
GROUP BY browser
ORDER BY conversion_rate DESC; -- Week 0. Firefox = 58.39, Edge = 45.73, Chrome= 33.66, Safari= 25.81

SELECT
	browser,
	SUM(website_visits) AS total_visits,
	SUM(conversions) AS total_conversions,
	SUM(conversions) / SUM(website_visits) * 100 AS conversion_rate
FROM conversions_data_set
WHERE week = 6
GROUP BY browser
ORDER BY conversion_rate DESC; -- Week 6. Firefox = 57.42, Edge = 44.72, Chrome= 32.77, Safari= 24.88

SELECT
	browser,
	SUM(website_visits) AS total_visits,
	SUM(conversions) AS total_conversions,
	SUM(conversions) / SUM(website_visits) * 100 AS conversion_rate
FROM conversions_data_set
WHERE week = 7
GROUP BY browser
ORDER BY conversion_rate DESC; -- Week 7. Firefox = 61.41, Edge = 49.33, Chrome= 37.40, Safari= 29.21

SELECT
	browser,
	SUM(website_visits) AS total_visits,
	SUM(conversions) AS total_conversions,
	SUM(conversions) / SUM(website_visits) * 100 AS conversion_rate
FROM conversions_data_set
WHERE week = 19
GROUP BY browser
ORDER BY conversion_rate DESC; -- Week 19. Firefox = 59.38, Edge = 47.35, Chrome= 35.48, Safari= 27.42