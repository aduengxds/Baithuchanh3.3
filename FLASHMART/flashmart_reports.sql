
-- HE THONG FLASHMART
CREATE DATABASE IF NOT EXISTS flashmart_db;
USE flashmart_db;

-- Xoa bang cu neu chay lai script
DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS Products;
DROP TABLE IF EXISTS Customers;

-- 1. Tao bang Customers
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

-- 2. Tao bang Products
CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50) NOT NULL
);

-- 3. Tao bang Orders
CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT NOT NULL,
    product_id INT NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

-- 4. Them du lieu mau
INSERT INTO Customers VALUES
    (1, 'Alice'),
    (2, 'Bob'),
    (3, 'Charlie');

INSERT INTO Products VALUES
    (101, 'Laptop'),
    (102, 'Mouse'),
    (103, 'Keyboard');

INSERT INTO Orders VALUES
    (1001, 1, 101),
    (1002, 1, 102),
    (1003, 2, 101);

-- =====================================================
-- BAO CAO 1: TAT CA KHACH HANG VA SO LUONG DON HANG
-- =====================================================
SELECT
    c.customer_id,
    c.name,
    COUNT(o.order_id) AS total_orders
FROM Customers c
LEFT JOIN Orders o
    ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.name
ORDER BY c.customer_id;

-- =====================================================
-- BAO CAO 2: SAN PHAM CHUA TUNG DUOC BAN
-- =====================================================
SELECT
    p.product_id,
    p.product_name
FROM Products p
LEFT JOIN Orders o
    ON p.product_id = o.product_id
WHERE o.order_id IS NULL
ORDER BY p.product_id;
