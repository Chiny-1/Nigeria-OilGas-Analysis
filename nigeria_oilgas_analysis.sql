-- ================================================
-- NIGERIA OIL & GAS PRODUCTION ANALYSIS
-- Dataset: OPEC Monthly Production Data (1973-2018)
-- Analyst: Chinaemerem Okolie
-- Institution: FUTO
-- Date: May 2026
-- ================================================


-- Q1: Nigeria's Monthly Production Trend
SELECT 
    Month,
    Nigeria,
    `Total OPEC`,
    ROUND((Nigeria * 100.0 / `Total OPEC`), 2) AS Nigeria_OPEC_Share_Pct
FROM opec_monthly_production
ORDER BY Month ASC;


-- Q2: Nigeria's Average Production by Decade
SELECT 
    CASE
        WHEN Month LIKE '197%' THEN '1970s'
        WHEN Month LIKE '198%' THEN '1980s'
        WHEN Month LIKE '199%' THEN '1990s'
        WHEN Month LIKE '200%' THEN '2000s'
        WHEN Month LIKE '201%' THEN '2010s'
    END AS Decade,
    ROUND(AVG(Nigeria), 2) AS Avg_Nigeria_Production,
    ROUND(AVG(`Total OPEC`), 2) AS Avg_OPEC_Production,
    ROUND((AVG(Nigeria) * 100.0 / AVG(`Total OPEC`)), 2) AS Avg_Nigeria_Share_Pct
FROM opec_monthly_production
GROUP BY Decade
ORDER BY Decade ASC;


-- Q3: Nigeria vs Total OPEC Contribution
SELECT 
    ROUND(AVG(Nigeria), 2) AS Avg_Nigeria_Production,
    ROUND(AVG(`Total OPEC`), 2) AS Avg_OPEC_Production,
    ROUND((AVG(Nigeria) * 100.0 / AVG(`Total OPEC`)), 2) AS Avg_Nigeria_Share_Pct,
    ROUND(MAX(Nigeria), 2) AS Peak_Nigeria_Production,
    ROUND(MIN(Nigeria), 2) AS Lowest_Nigeria_Production,
    ROUND(SUM(Nigeria), 2) AS Total_Nigeria_Production
FROM opec_monthly_production;


-- Q4: Top 5 Highest Producing OPEC Countries
SELECT 
    'Algeria' AS Country, ROUND(AVG(Algeria), 2) AS Avg_Production FROM opec_monthly_production
UNION ALL
SELECT 'Angola', ROUND(AVG(Angola), 2) FROM opec_monthly_production
UNION ALL
SELECT 'Ecuador', ROUND(AVG(Ecuador), 2) FROM opec_monthly_production
UNION ALL
SELECT 'Gabon', ROUND(AVG(Gabon), 2) FROM opec_monthly_production
UNION ALL
SELECT 'Iran', ROUND(AVG(Iran), 2) FROM opec_monthly_production
UNION ALL
SELECT 'Iraq', ROUND(AVG(Iraq), 2) FROM opec_monthly_production
UNION ALL
SELECT 'Kuwait', ROUND(AVG(Kuwait), 2) FROM opec_monthly_production
UNION ALL
SELECT 'Libya', ROUND(AVG(Libya), 2) FROM opec_monthly_production
UNION ALL
SELECT 'Nigeria', ROUND(AVG(Nigeria), 2) FROM opec_monthly_production
UNION ALL
SELECT 'Qatar', ROUND(AVG(Qatar), 2) FROM opec_monthly_production
UNION ALL
SELECT 'Saudi Arabia', ROUND(AVG(`Saudi Arabia`), 2) FROM opec_monthly_production
UNION ALL
SELECT 'United Arab Emirates', ROUND(AVG(`United Arab Emirates`), 2) FROM opec_monthly_production
UNION ALL
SELECT 'Venezuela', ROUND(AVG(Venezuela), 2) FROM opec_monthly_production
ORDER BY Avg_Production DESC
LIMIT 5;


-- Q5: Nigeria's Best and Worst Production Years
SELECT 
    SUBSTR(Month, 1, 4) AS Year,
    ROUND(AVG(Nigeria), 2) AS Avg_Annual_Production,
    ROUND(MAX(Nigeria), 2) AS Peak_Monthly_Production,
    ROUND(MIN(Nigeria), 2) AS Lowest_Monthly_Production
FROM opec_monthly_production
GROUP BY Year
ORDER BY Avg_Annual_Production DESC;


-- Q6: Nigeria vs Saudi Arabia vs Iraq Comparison
SELECT 
    CASE
        WHEN Month LIKE '197%' THEN '1970s'
        WHEN Month LIKE '198%' THEN '1980s'
        WHEN Month LIKE '199%' THEN '1990s'
        WHEN Month LIKE '200%' THEN '2000s'
        WHEN Month LIKE '201%' THEN '2010s'
    END AS Decade,
    ROUND(AVG(Nigeria), 2) AS Avg_Nigeria,
    ROUND(AVG(`Saudi Arabia`), 2) AS Avg_Saudi_Arabia,
    ROUND(AVG(Iraq), 2) AS Avg_Iraq
FROM opec_monthly_production
GROUP BY Decade
ORDER BY Decade ASC;


-- Q7: OPEC Production Trend Over Decades
SELECT 
    CASE
        WHEN Month LIKE '197%' THEN '1970s'
        WHEN Month LIKE '198%' THEN '1980s'
        WHEN Month LIKE '199%' THEN '1990s'
        WHEN Month LIKE '200%' THEN '2000s'
        WHEN Month LIKE '201%' THEN '2010s'
    END AS Decade,
    ROUND(AVG(`Total OPEC`), 2) AS Avg_OPEC_Production,
    ROUND(MAX(`Total OPEC`), 2) AS Peak_OPEC_Production,
    ROUND(MIN(`Total OPEC`), 2) AS Lowest_OPEC_Production
FROM opec_monthly_production
GROUP BY Decade
ORDER BY Decade ASC;


-- Q8: Nigeria's Production Boom & Bust Periods
SELECT 
    SUBSTR(Month, 1, 4) AS Year,
    ROUND(AVG(Nigeria), 2) AS Avg_Annual_Production,
    CASE
        WHEN AVG(Nigeria) >= 2200 THEN 'Boom'
        WHEN AVG(Nigeria) <= 1500 THEN 'Bust'
        ELSE 'Stable'
    END AS Period_Type
FROM opec_monthly_production
GROUP BY Year
ORDER BY Year ASC;