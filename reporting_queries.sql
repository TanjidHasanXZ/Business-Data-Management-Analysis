USE BusinessPartnerDB;

-- Total Sales by Region
SELECT Region, SUM(Sales) AS TotalSales FROM Orders GROUP BY Region ORDER BY TotalSales DESC;

-- Top 5 Customers by Sales
SELECT CustomerName, SUM(Sales) AS TotalSales FROM Orders GROUP BY CustomerName ORDER BY TotalSales DESC LIMIT 5;

-- Sales Trend Over Time
SELECT OrderDate, SUM(Sales) AS DailySales FROM Orders GROUP BY OrderDate ORDER BY OrderDate;

-- Category-wise Sales Distribution
SELECT Category, SUM(Sales) AS TotalSales FROM Orders GROUP BY Category ORDER BY TotalSales DESC;
