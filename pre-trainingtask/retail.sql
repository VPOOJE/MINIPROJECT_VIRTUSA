CREATE DATABASE retail_store;
USE retail_store;

CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    city VARCHAR(100)
);

CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50),
    price DECIMAL(10,2)
);

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

CREATE TABLE Order_Items (
    order_id INT,
    product_id INT,
    quantity INT,
    PRIMARY KEY (order_id, product_id),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

INSERT INTO Customers VALUES
(1, 'Pooja', 'Chennai'),
(2, 'Rahul', 'Mumbai'),
(3, 'Gokul', 'Delhi'),
(4, 'Iniyan', 'Bangalore');

INSERT INTO Products VALUES
(101, 'Laptop', 'Electronics', 50000),
(102, 'Phone', 'Electronics', 20000),
(103, 'Shoes', 'Fashion', 3000),
(104, 'Watch', 'Fashion', 5000),
(105, 'Tablet', 'Electronics', 15000);

INSERT INTO Orders VALUES
(1, 1, '2025-04-01'),
(2, 2, '2025-04-05'),
(3, 1, '2025-04-10'),
(4, 3, '2025-04-15');

INSERT INTO Order_Items VALUES
(1, 101, 1),
(1, 103, 2),
(2, 102, 1),
(3, 101, 1),
(4, 104, 1),
(4, 105, 2);

SELECT 
    p.product_name,
    SUM(oi.quantity) AS units_sold
FROM Order_Items oi
JOIN Products p ON oi.product_id = p.product_id
GROUP BY p.product_id
ORDER BY units_sold DESC;

SELECT 
    c.customer_name,
    SUM(p.price * oi.quantity) AS total_amount
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
JOIN Order_Items oi ON o.order_id = oi.order_id
JOIN Products p ON oi.product_id = p.product_id
GROUP BY c.customer_id
ORDER BY total_amount DESC;

SELECT 
    DATE_FORMAT(o.order_date, '%Y-%m') AS sales_month,
    SUM(p.price * oi.quantity) AS revenue
FROM Orders o
JOIN Order_Items oi ON o.order_id = oi.order_id
JOIN Products p ON oi.product_id = p.product_id
GROUP BY sales_month
ORDER BY sales_month;

SELECT 
    p.category,
    SUM(oi.quantity) AS items_sold
FROM Products p
JOIN Order_Items oi ON p.product_id = oi.product_id
GROUP BY p.category;

SELECT 
    c.customer_name
FROM Customers c
LEFT JOIN Orders o ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;
