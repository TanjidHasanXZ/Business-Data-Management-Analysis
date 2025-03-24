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
CREATE TABLE IF NOT EXISTS Orders (
    OrderID VARCHAR(20) PRIMARY KEY,
    OrderDate DATE,
    ShipDate DATE,
    ShipMode VARCHAR(50),
    CustomerID VARCHAR(20),
    CustomerName VARCHAR(255),
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
    Sales DECIMAL(10,2)
);

-- Load Data (Modify path as needed for MySQL LOAD DATA INFILE)
-- LOAD DATA INFILE '/path/to/train.csv' INTO TABLE Orders
-- FIELDS TERMINATED BY ','
-- IGNORE 1 ROWS;
