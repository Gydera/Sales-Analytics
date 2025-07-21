--Top 5 Bestselling Products
SELECT 
    p.product_name,
    SUM(s.quantity) AS total_sold
FROM sales s
JOIN products p ON s.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_sold DESC
LIMIT 5;

--Monthly Revenue Trend
SELECT 
    DATE_TRUNC('month', sale_date) AS month,
    SUM(s.quantity * p.price) AS revenue
FROM sales s
JOIN products p ON s.product_id = p.product_id
GROUP BY month
ORDER BY month;

--Customer Lifetime Value (Top 10 Customers)
SELECT 
    c.full_name,
    SUM(s.quantity * p.price) AS total_spent
FROM sales s
JOIN customers c ON s.customer_id = c.customer_id
JOIN products p ON s.product_id = p.product_id
GROUP BY c.full_name
ORDER BY total_spent DESC
LIMIT 10;

--Staff Sales Performance
SELECT 
    st.full_name,
    COUNT(s.sale_id) AS total_sales,
    SUM(s.quantity * p.price) AS total_revenue
FROM sales s
JOIN staff st ON s.staff_id = st.staff_id
JOIN products p ON s.product_id = p.product_id
GROUP BY st.full_name
ORDER BY total_revenue DESC;

--Inventory at Risk (Low Stock Products)
SELECT 
    product_name,
    stock_quantity
FROM products
WHERE stock_quantity < 50
ORDER BY stock_quantity;

