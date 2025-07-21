-- Insert sample stores
INSERT INTO stores (store_id, store_name, location) VALUES
(1, 'Downtown SuperMart', 'Lagos'),
(2, 'Uptown MegaStore', 'Abuja'),
(3, 'Tech Market Central', 'Port Harcourt');

-- Insert sample products
INSERT INTO products (product_id, product_name, category, price) VALUES
(101, 'Wireless Mouse', 'Electronics', 25.99),
(102, 'Bluetooth Speaker', 'Electronics', 59.50),
(103, 'Running Shoes', 'Apparel', 89.90),
(104, 'Backpack', 'Accessories', 45.00),
(105, 'Coffee Mug', 'Kitchenware', 12.75);

-- Insert sample sales
INSERT INTO sales (sale_id, product_id, store_id, quantity, sale_date) VALUES
(1, 101, 1, 3, '2024-05-01'),
(2, 102, 1, 1, '2024-05-02'),
(3, 103, 2, 2, '2024-05-03'),
(4, 104, 2, 4, '2024-05-04'),
(5, 105, 3, 5, '2024-05-05'),
(6, 101, 3, 7, '2024-05-06'),
(7, 104, 1, 6, '2024-05-06'),
(8, 103, 1, 3, '2024-05-07'),
(9, 105, 2, 4, '2024-05-08'),
(10, 101, 2, 2, '2024-05-09'),
(11, 102, 3, 1, '2024-05-10'),
(12, 101, 1, 5, '2024-05-11'),
(13, 105, 3, 3, '2024-05-11'),
(14, 104, 2, 2, '2024-05-12'),
(15, 103, 3, 1, '2024-05-12');
