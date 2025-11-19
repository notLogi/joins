USE northwind;

-- 1
SELECT ProductID, ProductName, UnitPrice, categories.CategoryName FROM products
JOIN categories ON products.CategoryID = categories.CategoryID
ORDER BY CategoryName, ProductName;

-- 2
SELECT ProductID, ProductName, UnitPrice, suppliers.CompanyName FROM products
JOIN suppliers ON products.SupplierID = suppliers.SupplierID\
WHERE products.UnitPrice >= 75
ORDER BY ProductName;

-- 3
SELECT ProductID, ProductName, UnitPrice, categories.CategoryName, suppliers.CompanyName FROM products
JOIN suppliers ON products.SupplierID = suppliers.SupplierID 
JOIN categories ON products.CategoryID = categories.CategoryID
ORDER BY ProductName;

-- 4
SELECT ProductName, categories.CategoryName FROM products
JOIN categories ON products.CategoryID = categories.CategoryID
WHERE UnitPrice = (SELECT MAX(UnitPrice) FROM products);

-- 5
SELECT OrderID, ShipName, ShipAddress, shippers.CompanyName FROM orders
JOIN shippers ON orders.ShipVia = shippers.ShipperID
WHERE ShipCountry = "Germany";

-- 6
SELECT orders.OrderID, ShipName, ShipAddress, products.ProductName FROM orders 
JOIN `order details` ON orders.OrderID = `order details`.OrderID
JOIN products ON `order details`.ProductID = products.ProductID 
WHERE products.ProductName = "Sasquatch Ale";
