-- ----------------------------------------------------------
-- Marketing Campaign Performance Analysis with SQL
-- Dataset: marketing_data_simulated (SaaS company case)
-- Analyst: Jannelle Lawson
-- Goal: Analyze multi-channel marketing data to identify platform performance, content effectiveness, CTR trends,
-- and actionable campaign insights.
-- ----------------------------------------------------------

-- 1️⃣ Explore basic dataset & row count

SELECT *
FROM portfolioproject.dbo.marketing_data_simulated 

SELECT COUNT(*)
FROM PortfolioProject.dbo.marketing_data_simulated

-- 2️⃣ Showing what distrbution types & Count

SELECT Action_Type, COUNT(*) AS Action_Count
FROM PortfolioProject.dbo.marketing_data_simulated
GROUP BY Action_Type


-- 3️⃣ The average CTR and Total Clicks for each type of Action Type

SELECT Action_Type, ROUND(AVG(CTR)*100, 2) AS Avg_CTR, SUM(Clicks) AS Total_Clicks
FROM PortfolioProject.dbo.marketing_data_simulated
GROUP BY Action_Type


-- 4️⃣ Top Content Categories by Average CTR

SELECT Content_Category, ROUND(AVG(CTR)*100, 2) AS Avg_CTR
FROM PortfolioProject.dbo.marketing_data_simulated
GROUP BY Content_Category
ORDER BY Avg_CTR DESC

-- Highest CTR overall: "Monthly Newsletter" (10.56%)
-- Best performing content category: "Humor" (1.84%)
-- Lowest CTR: "Events" (1.06%) — room for improvement


-- 5️⃣ Monthly CTR Trends

SELECT FORMAT(Date, 'yyyy-MM') AS Month, ROUND(AVG(CTR)*100, 2) AS Avg_CTR, SUM(Clicks) AS Total_Clicks
FROM PortfolioProject.dbo.marketing_data_simulated
GROUP BY FORMAT(Date, 'yyyy-MM')
ORDER BY FORMAT(Date, 'yyyy-MM') ASC

-- Exported this table to Tableau to create a monthly CTR trend line


-- 6️⃣ CTR & Total Clicks by Language

SELECT Language, ROUND(AVG(CTR)*100, 2) AS Avg_CTR
FROM PortfolioProject.dbo.marketing_data_simulated
GROUP BY Language
ORDER BY Avg_CTR DESC

-- Total clicks by language

SELECT Language, SUM(clicks) AS Total_Clicks 
FROM PortfolioProject.dbo.marketing_data_simulated
GROUP BY Language
ORDER BY Total_Clicks DESC

-- 7️⃣ Average CTR by Day of the Week

SELECT day_of_week, ROUND(AVG(CTR)*100, 2) AS Avg_CTR
FROM PortfolioProject.dbo.marketing_data_simulated
GROUP BY day_of_week
ORDER BY Avg_CTR DESC

-- Weekends: Sunday 11.04% and Saturday 9.64% Avg CTR
-- Weekdays drop ranges between 1.73% - 2.03%

-- 8️⃣ Total Clicks by Day of the Week

SELECT day_of_week, SUM(Clicks) AS Total_Clicks
FROM PortfolioProject.dbo.marketing_data_simulated
GROUP BY day_of_week
ORDER BY Total_Clicks DESC;

  
-- 9️⃣ Monthly CTR Trends (All Months)

SELECT FORMAT(Date, 'yyyy-MM') AS Month, ROUND(AVG(CTR)*100, 2) AS Avg_CTR
FROM PortfolioProject.dbo.marketing_data_simulated
GROUP BY FORMAT(Date, 'yyyy-MM')
ORDER BY Month ASC

-- Tracks overall seasonal shifts and engagement trends

-- 🔟 Holiday Campaign CTR: November & December Only

SELECT FORMAT(Date, 'yyyy-MM') AS Month, ROUND(AVG(CTR)*100, 2) AS Avg_CTR, SUM(Clicks) AS Total_Clicks
FROM PortfolioProject.dbo.marketing_data_simulated
WHERE Month(Date) IN ('11', '12')
GROUP BY FORMAT(Date, 'yyyy-MM')
ORDER BY FORMAT(Date, 'yyyy-MM') ASC

-- Black Friday (Nov.) peaks while Christmas (Dec) drives lower engagement


-- 1️⃣1️⃣ Impressions by Platform, Content Category, and Month

SELECT Action_Type, Content_Category, FORMAT(Date, 'yyyy-MM') AS Month, SUM(Impressions) AS Total_Impressions
FROM PortfolioProject.dbo.marketing_data_simulated
GROUP BY Action_Type, Content_Category, FORMAT(Date, 'yyyy-MM')
ORDER BY Action_Type, Content_Category, Month


-- ----------------------------------------------------------
-- KEY TAKEAWAYS
-- ----------------------------------------------------------
-- ✅ Instagram, LinkedIn, and Twitter lead in engagement
-- ✅ "Download" and "Sign-Up" CTAs drive the highest CTR
-- ✅ Humor and Event content performs best by CTR
-- ✅ Friday earns the most clicks; Sunday earns best CTR
-- ✅ Black Friday (November) saw peak campaign performance
-- ✅ Campaigns in multiple languages can broaden reach
-- ----------------------------------------------------------
-- Exported to Tableau for final dashboard visualizations
-- ----------------------------------------------------------
