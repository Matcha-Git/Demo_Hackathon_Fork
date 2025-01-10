USE WideWorldImporters;
GO

-- Aufgabe 1
-- SELECT * FROM Sales.Customers;
SELECT CustomerName, DeliveryAddressLine1 FROM Sales.Customers;

-- Aufgabe 2
-- Beispiel mit originalem Spaltennamen
SELECT CustomerName, PhoneNumber AS 'Telefonnummer' FROM Sales.Customers;

-- Aufgabe 3
SELECT CountryName + ' (' + IsoAlpha3Code + ')' AS 'Land' 
FROM Application.Countries ORDER BY CountryName DESC; 

-- Aufgabe 4
SELECT DISTINCT Continent FROM Application.Countries;

-- Aufgabe 5
-- die 3 ältesten Bestellungen
SELECT TOP 3 * FROM Sales.Orders ORDER BY OrderDate ASC;







-- Aufgabe 1
-- Länderinfos 
SELECT CountryID, FormalName, SubRegion FROM Application.Countries WHERE CountryName = 'Switzerland';

-- Aufgabe 2
SELECT * FROM Application.People
WHERE FullName NOT LIKE 'a%';

-- Aufgabe 3
SELECT OrderDate FROM Sales.Orders WHERE OrderDate BETWEEN '2016-01-01' and '2016-01-31' ORDER BY OrderDate DESC;

-- Ausprobieren
SELECT OrderID, Quantity
CASE
    WHEN Quantity > 10 THEN 'Bestellmenge ist grösser als 10'
    WHEN Quantity = 10 THEN 'Bestellmenge ist 10'
    ELSE 'Bestellmenge ist kleiner als 10'
END AS QuantityText
FROM Sales.OrderLines;

-- Aufgabe 1
SELECT StockItemID, StockItemName, UnitPrice
FROM Warehouse.StockItems
WHERE UnitPrice > (SELECT AVG(UnitPrice) FROM Warehouse.StockItems);

-- Aufgabe 2
SELECT C.CustomerID, CustomerName, O.OrderDate, COUNT(O.OrderID) AS AnzahlBestellungen
  FROM Sales.Customers AS C
  JOIN Sales.Orders AS O ON C.CustomerID = O.CustomerID
  GROUP BY C.CustomerID, CustomerName, O.OrderDate
  HAVING COUNT(O.OrderID) > 4

  -- Aufgabe 3
  SELECT * FROM Warehouse.StockItems 
WHERE StockItemID IN (
    SELECT StockItemID
    FROM Sales.OrderLines
    GROUP BY StockItemID
    HAVING SUM(Quantity) > 50000
)

-- Aufgabe 1
SELECT FullName FROM Application.People
INTERSECT
SELECT CustomerName FROM  Sales.Customers;

SELECT CustomerName FROM Sales.Customers
EXCEPT
SELECT FullName FROM Application.People;

-- Aufgabe 2
