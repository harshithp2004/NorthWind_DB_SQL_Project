/*Easy Queries:*/
/*List all products and their categories:*/
SELECT Products.ProductName, Categories.CategoryName
FROM Products
JOIN Categories ON Products.CategoryID = Categories.CategoryID;

/*Show the first and last names of all employees and the name of the city where they work*/
SELECT FirstName, LastName, City
FROM Employees;

/*Retrieve all orders for a specific customer */
SELECT Orders.OrderID, Orders.OrderDate, Customers.CompanyName
FROM Orders
JOIN Customers ON Orders.CustomerID = Customers.CustomerID
WHERE Customers.CustomerID = 'ALFKI';

/*List all shippers and their contact phone numbers*/
SELECT CompanyName, Phone
FROM Shippers;

/*Display a list of all unique cities where suppliers are based*/
SELECT DISTINCT City
FROM Suppliers;

/*Find the total number of products available in the Products table*/
SELECT COUNT(ProductID) AS TotalProducts
FROM Products;

/*Count the number of employees in each city*/
SELECT City, COUNT(EmployeeID) AS EmployeeCount
FROM Employees
GROUP BY City;

/*Retrieve a list of orders with their shipment details (order ID, ship date, and freight)*/
SELECT OrderID, ShippedDate, Freight
FROM Orders;

/*Modertate Queries:*/
/*Count of products in each category*/
SELECT Categories.CategoryName, COUNT(Products.ProductID) AS ProductCount
FROM Categories
JOIN Products ON Categories.CategoryID = Products.CategoryID
GROUP BY Categories.CategoryName;

/*List employees and the territories they cover*/
SELECT Employees.FirstName || ' ' || Employees.LastName AS EmployeeName,Territories.TerritoryDescription AS Territory FROM EmployeeTerritories
JOIN Employees ON EmployeeTerritories.EmployeeID = Employees.EmployeeID
JOIN Territories ON EmployeeTerritories.TerritoryID = Territories.TerritoryID;

/*Retrieve order details including order date, customer name, and the shipper’s company name*/
SELECT Orders.OrderID, Orders.OrderDate, Customers.CompanyName AS Customer,Shippers.CompanyName AS Shipper FROM Orders
JOIN Customers ON Orders.CustomerID = Customers.CustomerID
JOIN Shippers ON Orders.ShipVia = Shippers.ShipperID;

/*View of high-value orders (freight > $500)*/
/*
CREATE VIEW HighValueOrders AS SELECT OrderID, OrderDate, CustomerID, Freight FROM Orders
WHERE Freight > 500;*/

/*List the products and the suppliers that supply them, sorted by product name*/
SELECT Products.ProductName, Suppliers.CompanyName AS Supplier FROM Products
JOIN Suppliers ON Products.SupplierID = Suppliers.SupplierID
ORDER BY Products.ProductName;

/*Display orders placed by customers in Germany and show their order dates*/
SELECT Orders.OrderID, Orders.OrderDate, Customers.CompanyName
FROM Orders
JOIN Customers ON Orders.CustomerID = Customers.CustomerID
WHERE Customers.Country = 'Germany';

/*Calculate the average unit price of products in each category*/
SELECT Categories.CategoryName, AVG(Products.UnitPrice) AS Average_Price
FROM Products
JOIN Categories ON Products.CategoryID = Categories.CategoryID
GROUP BY Categories.CategoryName;

/*Show the total quantity ordered for each product*/
SELECT Products.ProductName, SUM([Order Details].Quantity) AS TotalQuantity
FROM [Order Details]
JOIN Products ON [Order Details].ProductID = Products.ProductID
GROUP BY Products.ProductName;

/*Difficult Queries:*/
/*Calculate the total revenue for each employee by summing their handled orders:*/
SELECT Employees.FirstName || ' ' || Employees.LastName AS EmployeeName,SUM([Order Details].Quantity * [Order Details].UnitPrice * (1 - [Order Details].Discount)) AS TotalRevenue
FROM Orders
JOIN [Order Details] ON Orders.OrderID = [Order Details].OrderID
JOIN Employees ON Orders.EmployeeID = Employees.EmployeeID
GROUP BY Employees.EmployeeID;

/*Identify the top 3 most frequently ordered products across all orders*/
SELECT Products.ProductName, SUM([Order Details].Quantity) AS TotalQuantity
FROM [Order Details]
JOIN Products ON [Order Details].ProductID = Products.ProductID
GROUP BY Products.ProductID
ORDER BY TotalQuantity DESC
LIMIT 3;

/*Customer order summary showing the count and total value of orders placed by each customer*/
SELECT Customers.CompanyName AS Customer,COUNT(Orders.OrderID) AS OrderCount,SUM([Order Details].Quantity * [Order Details].UnitPrice) AS TotalOrderValue
FROM Customers
JOIN Orders ON Customers.CustomerID = Orders.CustomerID
JOIN [Order Details] ON Orders.OrderID = [Order Details].OrderID
GROUP BY Customers.CompanyName;

/*Create a view to show orders placed in 1997, including the customer name, order ID, and order date*/
/*
CREATE VIEW OrdersIn1997 AS SELECT Customers.CompanyName, Orders.OrderID, Orders.OrderDate
FROM Orders
JOIN Customers ON Orders.CustomerID = Customers.CustomerID
WHERE strftime('%Y', Orders.OrderDate) = '1997';*/

/*Identify customers who have placed orders for products in at least three different categories*/
SELECT Customers.CompanyName, COUNT(DISTINCT Products.CategoryID) AS CategoryCount
FROM Orders
JOIN [Order Details] ON Orders.OrderID = [Order Details].OrderID
JOIN Products ON [Order Details].ProductID = Products.ProductID
JOIN Customers ON Orders.CustomerID = Customers.CustomerID
GROUP BY Customers.CustomerID
HAVING CategoryCount >= 3;

/*Find the average discount offered on products ordered in each region*/
SELECT Categories.CategoryName,Products.ProductName,Products.UnitPrice
FROM Products
JOIN Categories ON Products.CategoryID = Categories.CategoryID
WHERE Products.UnitPrice = (SELECT MAX(Products.UnitPrice) FROM Products
WHERE Products.CategoryID = Categories.CategoryID);

/* Find the total revenue generated by each product category and the number of orders placed for products in each category*/
SELECT Categories.CategoryName AS Category,COUNT([Order Details].OrderID) AS TotalOrders,SUM([Order Details].UnitPrice * [Order Details].Quantity * (1 - [Order Details].Discount)) AS TotalRevenue
FROM [Order Details]
JOIN Products ON [Order Details].ProductID = Products.ProductID
JOIN Categories ON Products.CategoryID = Categories.CategoryID
GROUP BY Categories.CategoryName
ORDER BY TotalRevenue DESC;


/*List suppliers and their products, showing suppliers who supply three or more unique products*/
SELECT Suppliers.CompanyName AS Supplier,COUNT(DISTINCT Products.ProductID) AS UniqueProductCount
FROM Products
JOIN Suppliers ON Products.SupplierID = Suppliers.SupplierID
GROUP BY Suppliers.CompanyName
HAVING COUNT(DISTINCT Products.ProductID) >= 3;

