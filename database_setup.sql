-- Create Database
CREATE DATABASE IF NOT EXISTS BusinessPartnerDB;
USE BusinessPartnerDB;

-- Create Table for Business Partners
CREATE TABLE IF NOT EXISTS BusinessPartner (
    PartnerID INT PRIMARY KEY,
    CompanyName VARCHAR(255) NOT NULL,
    Address VARCHAR(255),
    VATNumber VARCHAR(50),
    Email VARCHAR(100),
    PhoneNumber VARCHAR(50),
    Status ENUM('Active', 'Inactive'),
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create Orders Table

CREATE TABLE Orders (
    OrderID VARCHAR(20),
    OrderDate VARCHAR(50),
    ShipDate VARCHAR(50),
    ShipMode VARCHAR(50),
    CustomerID VARCHAR(20),
    CustomerName VARCHAR(255),
    CompanyName VARCHAR(255) NOT NULL,
    Segment VARCHAR(50),
    Country VARCHAR(100),
    City VARCHAR(100),
    State VARCHAR(100),
    PostalCode VARCHAR(20),
    Region VARCHAR(50),
    ProductID VARCHAR(20),
    Category VARCHAR(50),
    SubCategory VARCHAR(50),
    ProductName VARCHAR(255),
    Sales VARCHAR(50)
);


ALTER TABLE BusinessPartner
MODIFY CreatedAt DATETIME;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/BusinessPartner.csv'
INTO TABLE BusinessPartner
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(PartnerID, CompanyName, Address, VATNumber, Email, PhoneNumber, Status, CreatedAt);



LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Orders.csv'
INTO TABLE Orders
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(OrderID, OrderDate, ShipDate, ShipMode, CustomerID, CustomerName, CompanyName, Segment,
 Country, City, State, PostalCode, Region, ProductID, Category, SubCategory,
 ProductName, Sales);

ALTER TABLE Orders
ADD COLUMN PartnerID INT,
ADD CONSTRAINT fk_orders_partner
FOREIGN KEY (PartnerID) REFERENCES BusinessPartner(PartnerID);

UPDATE Orders o
JOIN BusinessPartner bp ON o.CompanyName = bp.CompanyName
SET o.PartnerID = bp.PartnerID;



drop table businesspartner;
