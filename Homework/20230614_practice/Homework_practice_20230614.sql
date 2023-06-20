USE w3schools;

-- 1. Вывести все заказы, содержащие продукт с id `1`
SELECT
	*
FROM orders 
WHERE OrderID IN (
	SELECT
		OrderID
    FROM order_details
    WHERE ProductID = 1);

-- 2. Вывести `стоимость` и `название` двух самых дешевых товаров из `Germany`
SELECT
	ProductName,
    Price
FROM products
WHERE SupplierID IN (
	SELECT
		SupplierID
    FROM suppliers
    WHERE Country = 'Germany')
ORDER BY Price 
LIMIT 2;

-- 3. Вывести среднюю стоимость напитка из `USA`
SELECT
    AVG(Price) as avg_price
FROM products
WHERE SupplierID IN (
	SELECT
		SupplierID
    FROM suppliers
    WHERE Country = 'USA')
    AND CategoryID IN (
    SELECT
		CategoryID
    FROM categories
    WHERE CategoryName = 'Beverages');

-- 4. Вывести ко-во заказов, закрепленных за менеджером `1`
SELECT
	COUNT(*) number_of_orders
FROM orders
WHERE EmployeeID = 1;

-- 5. Вывести ко-во заказов, которое компания `Speedy Express` доставила в `Brazil`
SELECT
	count(*) number_of_orders
FROM orders
WHERE 
	ShipperID IN (
		SELECT
			ShipperID
        FROM shippers
        WHERE ShipperName = 'Speedy Express'
        )
    AND
    CustomerID IN (
		SELECT
			CustomerID
        FROM customers
        WHERE Country = 'Brazil');