CREATE DATABASE markete;

CREATE TABLE Customers (
  customer_id INT PRIMARY KEY,
  customer_name VARCHAR(255),
  email VARCHAR(255)
);

CREATE TABLE Products (
  product_id INT PRIMARY KEY,
  product_name VARCHAR(255),
  price DECIMAL(10,2)
);

CREATE TABLE Orders (
  order_id INT PRIMARY KEY,
  customer_id INT,
  product_id INT,
  quantity INT,
  FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
  FOREIGN KEY (product_id) REFERENCES Products(product_id)
); 





INSERT INTO Products (product_id, product_name, price) VALUES
(1, 'Product 11', 9.99),
(2, 'Product 12', 90.99),
(3, 'Product 13', 89.99);

INSERT INTO Customers (customer_id, customer_name, email) VALUES
(1, 'Wael', 'Wael234@email.com'),
(2, ' Ahmed', 'jkio092@email.com'),
(3, 'Yasser', 'bobjohnson@email.com');

INSERT INTO Orders (order_id, customer_id, product_id, quantity) VALUES
(4, 7, 9, 2),
(10, 4, 4, 7),
(3, 9, 2 ,8);

-- INNER JOIN
SELECT *
FROM Orders
INNER JOIN Customers ON Orders.customer_id = Customers.customer_id;

-- LEFT JOIN
SELECT *
FROM Customers
LEFT JOIN Orders ON Customers.customer_id = Orders.customer_id;

-- RIGHT JOIN
SELECT *
FROM Orders
RIGHT JOIN Customers ON Orders.customer_id = Customers.customer_id;

 -- JOIN
SELECT *
FROM Customers
JOIN Orders ON Customers.customer_id = Orders.customer_id;

-- Self joins
SELECT *
FROM Customers c
JOIN Products p
ON c.customer_id = p.product_id;

-- Implicit join syntax
SELECT *
FROM  Products p, customers 
WHERE p.product_id = c.customer_id;

-- Self outer joins
SELECT customer_id,customer_name AS product_id, product_name
FROM customers c
JOIN Products p
ON p.product_id = c.customer_id;

-- NATURAL JOIN
SELECT product_id, product_name
FROM Products p
NATURAL JOIN customers c;

-- CROSS JOIN
SELECT customer_name AS customer, product_name AS product
FROM customers c
CROSS JOIN products p
ORDER BY customer_name;
 
 -- Unions
SELECT customer_name
FROM customers
UNION
SELECT customer_id
FROM customers;