USE BusinessPartnerDB;

-- Remove empty postal codes
UPDATE Orders SET PostalCode = NULL WHERE PostalCode = '';

-- Standardize text fields
UPDATE Orders SET CustomerName = TRIM(CustomerName);
UPDATE Orders SET City = UPPER(City);

-- Remove duplicate records
DELETE FROM Orders
WHERE OrderID IN (
    SELECT OrderID FROM (
        SELECT OrderID, ROW_NUMBER() OVER (PARTITION BY OrderID ORDER BY OrderDate DESC) AS rn
        FROM Orders
    ) AS temp WHERE rn > 1
);
