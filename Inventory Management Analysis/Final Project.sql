
#Create a schema 
CREATE SCHEMA Inventory;


CREATE TABLE Inventory.Sales (
InventoryId INT PRIMARY KEY, Store VARCHAR(255),
Brand VARCHAR(255), Description VARCHAR(255), Size VARCHAR(50), SalesQuantity INT, SalesDollars DECIMAL(10, 2), SalesPrice DECIMAL(10, 2), SalesDate DATE,
Volume DECIMAL(10, 2), Classification VARCHAR(255), ExciseTax DECIMAL(10, 2), VendorNo INT,
VendorName VARCHAR(255) );



CREATE TABLE Inventory.Purchases (
InventoryId INT PRIMARY KEY, Store VARCHAR(255),
Brand VARCHAR(255), Description VARCHAR(255), Size VARCHAR(50), VendorNumber INT, VendorName VARCHAR(255), PONumber VARCHAR(50), PODate DATE,
ReceivingDate DATE, InvoiceDate DATE,
PayDate DATE,
PurchasePrice DECIMAL(10, 2), Quantity INT,
Dollars DECIMAL(10, 2),
 Classification VARCHAR(255) );



CREATE TABLE Inventory.Purchases_Prices (
Brand VARCHAR(255), Description VARCHAR(255), Price DECIMAL(10, 2),
Size VARCHAR(50),
Volume DECIMAL(10, 2), Classification VARCHAR(255), PurchasePrice DECIMAL(10, 2), VendorNumber INT, VendorName VARCHAR(255)
);


CREATE TABLE Inventory.Invoice_Purchases (
VendorNumber INT, VendorName VARCHAR(255), InvoiceDate DATE, PONumber VARCHAR(50), PODate DATE,
PayDate DATE,
Quantity INT,
Dollars DECIMAL(10, 2), Freight DECIMAL(10, 2), Approval VARCHAR(255)
);


CREATE TABLE Inventory.Ending_Inventory (
InventoryId INT PRIMARY KEY, Store VARCHAR(255),
City VARCHAR(255),
Brand VARCHAR(255), Description VARCHAR(255), Size VARCHAR(50),
OnHand INT,
Price DECIMAL(10, 2), endDate DATE
);




CREATE TABLE Inventory.Beginning_Inventory ( InventoryId INT PRIMARY KEY,
Store VARCHAR(255),
City VARCHAR(255),
Brand VARCHAR(255), Description VARCHAR(255), Size VARCHAR(50), OnHand INT,
Price DECIMAL(10, 2), startDate DATE
);



ALTER TABLE Inventory.Purchases
MODIFY COLUMN InventoryId VARCHAR(50);

ALTER TABLE Inventory.sales
MODIFY COLUMN InventoryId VARCHAR(50);

ALTER TABLE Inventory.Ending_Inventory
MODIFY COLUMN InventoryId VARCHAR(50);

ALTER TABLE Inventory.Beginning_Inventory
MODIFY COLUMN InventoryId VARCHAR(50);

SET SQL_SAFE_UPDATES = 0;

CREATE TABLE Inventory.Sales (
    InventoryId INT PRIMARY KEY,
    Store VARCHAR(255),
    Brand VARCHAR(255),
    Description VARCHAR(255),
    Size VARCHAR(50),
    SalesQuantity INT,
    SalesDollars DECIMAL(10, 2),
    SalesPrice DECIMAL(10, 2),
    SalesDate DATE,
    Volume DECIMAL(10, 2),
    Classification VARCHAR(255),
    ExciseTax DECIMAL(10, 2),
    VendorNo INT,
    VendorName VARCHAR(255)
);

-- Alter the table to update the date format
ALTER TABLE Inventory.Sales
MODIFY COLUMN SalesDate VARCHAR(20);

-- Update existing data with the desired date format
UPDATE Inventory.Sales
SET SalesDate = DATE_FORMAT(SalesDate, '%b %d, %Y');

-- Optionally, you might want to change the column type back to DATE after the update
ALTER TABLE Inventory.Sales
MODIFY COLUMN SalesDate DATE;

UPDATE Inventory.Sales
SET SalesDate = STR_TO_DATE(SalesDate, '%m/%d/%Y');



SELECT *  from inventory.sales limit 100;

show table status like 'inventory.beginning_inventory';

USE Inventory;

-- Show the number of rows in the beginning_inventory table
SELECT COUNT(*) AS NumberOfRows
FROM sales;





#Inventory analysis

SELECT e.Brand, e.Description, e.Size, e.OnHand AS EndInventory, b.OnHand AS BeginInventory,
       (e.OnHand - b.OnHand) AS InventoryChange
FROM Ending_Inventory e
JOIN Beginning_Inventory b ON e.InventoryId = b.InventoryId;

SELECT Brand, Description, Size, InventoryChange
FROM (
    SELECT e.Brand, e.Description, e.Size, e.OnHand - b.OnHand AS InventoryChange
    FROM Ending_Inventory e
    JOIN Beginning_Inventory b ON e.InventoryId = b.InventoryId
    ORDER BY InventoryChange DESC
    LIMIT 10
) AS HighInventory;


SELECT Brand, Description, Size, InventoryChange
FROM (
    SELECT e.Brand, e.Description, e.Size, e.OnHand - b.OnHand AS InventoryChange
    FROM Ending_Inventory e
    JOIN Beginning_Inventory b ON e.InventoryId = b.InventoryId
    ORDER BY InventoryChange ASC
    LIMIT 10
) AS LowInventory;


#sales analysis

-- Top 10 Bestsellers
SELECT Description, SUM(SalesQuantity) AS TotalSales
FROM Sales
GROUP BY Description
ORDER BY TotalSales DESC
LIMIT 10;

-- Bottom 10 Products with Sluggish Sales
SELECT Description, SUM(SalesQuantity) AS TotalSales
FROM Sales
GROUP BY Description
ORDER BY TotalSales ASC
LIMIT 10;

#monthly sales quantity

SELECT DATE_FORMAT(SalesDate, '%Y-%m') AS Month, SUM(SalesQuantity) AS MonthlySalesQuantity
FROM Sales
GROUP BY DATE_FORMAT(SalesDate, '%Y-%m')
ORDER BY Month;

SELECT DATE_FORMAT(SalesDate, '%Y-%m') AS Month, AVG(SalesPrice) AS AverageSalesPrice
FROM Sales
GROUP BY DATE_FORMAT(SalesDate, '%Y-%m')
ORDER BY Month;

