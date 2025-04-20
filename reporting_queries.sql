-- Total Sales by Region
SELECT Region, SUM(Sales) 
AS TotalSales 
FROM Orders 
GROUP BY Region ORDER BY TotalSales DESC;

-- Top 5 Customers by Sales
SELECT CustomerName,SUM(Sales) AS TotalSales
FROM orders
WHERE CustomerName IS NOT NULL 
GROUP BY CustomerName
ORDER BY TotalSales DESC
LIMIT 5;

-- Sales Trend Over Time(by days)
SELECT OrderDate, SUM(Sales) 
AS DailySales 
FROM Orders 
GROUP BY OrderDate ORDER BY OrderDate;

-- Sales Trend Over Time(by monthss)
SELECT DATE_FORMAT(o.OrderDate, '%Y-%m') AS Month, 
SUM(o.Sales) AS MonthlySales
FROM orders o GROUP BY Month
ORDER BY Month;
    
-- Category-wise Sales Distribution
SELECT Category, SUM(Sales) 
AS TotalSales 
FROM Orders 
GROUP BY Category ORDER BY TotalSales DESC;

SELECT * FROM businesspartnerdb.orders;
SELECT * FROM businesspartnerdb.businesspartner;

select o.id, o.OrderID, o.OrderDate, o.CustomerName, o.CompanyName, b.Email, b.Status from orders o join businesspartner b
on o.PartnerID = b.PartnerID;

select * from orders o left join businesspartner b
on o.PartnerID = b.PartnerID;

select * from orders where customerName is NULL and city is null and postalCode is null;
