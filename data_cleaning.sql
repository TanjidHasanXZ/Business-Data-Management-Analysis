-- busnesspartner table cleaning

SELECT CompanyName, Address, VATNumber, Email, PhoneNumber, Status, COUNT(*) AS cnt
FROM BusinessPartner
GROUP BY CompanyName, Address, VATNumber, Email, PhoneNumber, Status
HAVING cnt > 1;

DELETE FROM BusinessPartner
WHERE PartnerID NOT IN (
    SELECT * FROM (
        SELECT MIN(PartnerID)
        FROM BusinessPartner
        GROUP BY CompanyName, Address, VATNumber, Email, PhoneNumber, Status
    ) AS keep_ids
);

UPDATE businesspartner SET CompanyName = TRIM(UPPER(CompanyName));

-- orders table cleaning
-- checking if there are duplicates
SELECT OrderID, COUNT(*) AS cnt
FROM Orders
GROUP BY OrderID
HAVING cnt > 1;

ALTER TABLE Orders ADD COLUMN id INT AUTO_INCREMENT unique;

DELETE FROM Orders
WHERE id NOT IN (
    SELECT * FROM (
        SELECT MIN(id)
        FROM Orders
        GROUP BY OrderID
    ) AS keepers
);




-- making orderId primary key after removing the duplicate entries
ALTER TABLE Orders
ADD PRIMARY KEY (OrderID);
ALTER TABLE Orders DROP id;

UPDATE Orders SET CustomerName = TRIM(CustomerName);
UPDATE Orders SET City = UPPER(City);
UPDATE Orders SET PostalCode = NULL WHERE PostalCode = '';
UPDATE Orders SET CustomerName = NULL WHERE CustomerName = '';
UPDATE Orders SET City = NULL WHERE City = '';
UPDATE Orders SET State = NULL WHERE State = '';
UPDATE Orders SET ShipMode = UPPER(ShipMode);
UPDATE Orders SET Country = "USA" WHERE Country = "Germany";
UPDATE Orders SET Category = TRIM(Category);
UPDATE orders SET CompanyName = TRIM(UPPER(CompanyName));
