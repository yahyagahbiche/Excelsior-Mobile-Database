/*
Project 1: Excelsior Mobile Report
Yahya Gahbiche
*/

USE ExcelsiorMobile;
-- 1  --                                                      REPORT QUESTIONS WITH VISUALIZATION
-- A 
-- This query will return the minutes, data, text, and the total bill by customer's full name:

SELECT CONCAT(TRIM(FirstName),' ', TRIM(LastName)) AS 'Full Name', 
	   LastMonthUsage.[Minutes]  AS 'Minute Usage',
	   LastMonthUsage.DataInMB AS 'Data Usage', 
	   LastMonthUsage.Texts AS 'Text Usage', 
	   Bill.Total AS 'Customer Total Bill'
FROM Subscriber 
	   LEFT JOIN LastMonthUsage
	   ON Subscriber.[MIN] = LastMonthUsage.[MIN]
	   LEFT JOIN Bill
	   ON Subscriber.[MIN] = Bill.[MIN]
ORDER BY [Full Name];

 -- B
 -- This query will return the average of the minutes, data, texts and total bills by city:
SELECT Subscriber.City,
	   AVG([Minutes]) AS 'Average Minutes', 
	   AVG(DataInMB) AS 'Average Data', 
	   AVG(Texts) AS 'Average Texts',
	   AVG(Bill.Total) AS 'Total Bills'
FROM LastMonthUsage
	   LEFT JOIN Bill 
	   ON LastMonthUsage.[MIN] = Bill.[MIN]
	   LEFT JOIN Subscriber 
	   ON LastMonthUsage.[MIN] = Subscriber.[MIN]
GROUP BY Subscriber.City;
 
 -- C
 -- This query will return the sum of the minutes, data, texts and total bills by city:

SELECT Subscriber.City AS 'City',
	   SUM([Minutes]) AS 'Total Minutes',
	   SUM(DataInMB) AS 'Total Data',
	   SUM(Texts) AS 'Total Texts',
	   SUM(Bill.Total) AS 'Total Bill'   	
FROM LastMonthUsage
	   LEFT JOIN Bill 
	   ON LastMonthUsage.[MIN] = Bill.[MIN]
	   LEFT JOIN Subscriber
	   ON LastMonthUsage.[MIN] = Subscriber.[MIN]
GROUP BY Subscriber.City;

-- D
-- This query will return the average of the minutes, data, texts and total bills by mobile plan:

SELECT Subscriber.PlanName AS  'Mobil Plan',
	   AVG([Minutes]) AS 'Average Minutes',
	   AVG(DataInMB) AS 'Average Data',
	   AVG(Texts) AS 'Average Texts',
	   AVG(Bill.Total) AS 'Average Total Bill'
FROM LastMonthUsage
	   LEFT JOIN Bill
	   ON LastMonthUsage.[MIN] = Bill.[MIN]
	   LEFT JOIN Subscriber
	   ON LastMonthUsage.[MIN] = Subscriber.[MIN]
GROUP BY Subscriber.PlanName;

-- E
-- This query will return the sum of the minutes, data, texts and total bills by mobile plan:

SELECT Subscriber.PlanName 'Mobile plan',
	SUM(Minutes) AS 'Total Minutes',
	SUM(DataInMB) AS 'Total Data',
	SUM(Texts) AS 'Total Texts',
	SUM(Bill.Total) AS 'Total Bill' 
FROM LastMonthUsage
	LEFT JOIN Bill
	ON LastMonthUsage.[MIN] = Bill.[MIN]
	LEFT JOIN Subscriber
	ON LastMonthUsage.[MIN] = Subscriber.[MIN]
GROUP BY Subscriber.PlanName;
--                                                 The Report Questions (without Visualizations)
-- 1 --
-- A
-- This query will return the top two cities we have the most customers in:

SELECT TOP 2 City AS 'City', COUNT('City') AS 'Number of customers'
FROM Subscriber
GROUP BY City
ORDER BY COUNT('City') DESC;

-- B 
-- This query will return cities we should increase our marketing in. The ones we have the least number of customers in:

SELECT TOP 3 City AS 'Cities to increase Marketing in', COUNT('City') AS 'Number of customers'
FROM Subscriber
GROUP BY City
ORDER BY COUNT('City') ASC;

-- C --  
-- This query will return the plans we should market the most:

SELECT TOP 3 PlanName AS 'Plans to market for', COUNT(PlanName) AS 'Number of customers using the same plan'
FROM Subscriber
GROUP BY PlanName
ORDER BY COUNT(PlanName) ASC;

-- 2 --
-- A
-- This query will return the number of customers who are Android users Vs Apple users:

SELECT [Type] AS 'Cell phone type', COUNT([Type]) AS 'Number of Users'
FROM Device
GROUP BY Device.[Type];

-- B
-- This query will return the name of customers and who use the phone type that is least used (Apple):

SELECT CONCAT(TRIM(Subscriber.FirstName),' ', TRIM(Subscriber.LastName)) AS 'Full Name', Device.[Type] AS 'Cell Phone Type'
FROM Device
	JOIN DirNums
	ON Device.IMEI = DirNums.IMEI
	JOIN Subscriber
	ON DirNums.MDN = Subscriber.MDN
WHERE Device.[Type] = 'Apple'
ORDER BY [Full Name];


-- C
-- This query will return the name of the customers who own phones released before 2018:

SELECT CONCAT(TRIM(Subscriber.FirstName),' ', TRIM(Subscriber.LastName)) AS 'Full Name', YearReleased AS 'Phone release year'
FROM Device
	JOIN DirNums
	ON Device.IMEI = DirNums.IMEI
	JOIN Subscriber
	ON DirNums.MDN = Subscriber.MDN
WHERE Device.YearReleased < 2018
ORDER BY [Full Name];

-- 3 -- 
-- This query will return the city, from the top 3 data using cities, that none of our customers
-- in that city are using unlimited plan and still uses a lot of data:

SELECT TOP 1 City AS 'City with highest data usage', SUM(DataInMB) AS 'Data usage in MB'
FROM LastMonthUsage
	JOIN Subscriber
	ON LastMonthUsage.[MIN] = Subscriber.[MIN]
WHERE Subscriber.PlanName NOT LIKE 'Unl%'
GROUP BY City
ORDER BY SUM(DataInMB) DESC;

-- 4 -- 
-- A
-- This query will return the name of the customer who has the most expensive bill every month:

SELECT TOP 1 CONCAT(TRIM(Subscriber.FirstName),' ', TRIM(Subscriber.LastName)) AS 'Full Name', Total
FROM Bill
	JOIN Subscriber
	ON Bill.[MIN] = Subscriber.[MIN]
ORDER BY Total DESC;

-- B
-- This query will show us which mobile plan brings us in the most revenue each month:

SELECT TOP 1 PlanName AS 'Most profitable plan', SUM(Total) AS 'Monthly revenue'
FROM Bill
	JOIN Subscriber
	ON Bill.[MIN] = Subscriber.[MIN]
GROUP BY PlanName 
ORDER BY SUM(Total) DESC;

-- 5 -- 
-- A
-- This query will tell us which area code uses the most minutes:

SELECT TOP 1 LEFT(MDN, 3) AS 'Area code', SUM(Minutes) AS 'Minutes used', COUNT(LEFT(MDN, 3)) AS 'Number of Customers in this area code'
FROM LastMonthUsage
	RIGHT JOIN Subscriber
	ON LastMonthUsage.[MIN] = Subscriber.[MIN]
GROUP BY LEFT(MDN, 3)
ORDER BY 'Minutes used' DESC;

--(B) This query will tell us which cities are in the most variance in terms of minutes usage:

SELECT City, MAX(LastMonthUsage.[Minutes]) AS 'Maximum minutes' , MIN(LastMonthUsage.[Minutes]) AS 'Minimum minutes'
FROM LastMonthUsage
	LEFT JOIN Subscriber
	ON LastMonthUsage.[MIN] = Subscriber.[MIN]
GROUP BY City
HAVING MAX(LastMonthUsage.[Minutes]) > 700 
AND MIN(LastMonthUsage.[Minutes]) < 200 ;