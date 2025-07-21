-- 1. Top 10 best-selling products by quantity
SELECT
    p.product_name,
    SUM(s.quantity) AS total_units_sold
FROM
    sales s
JOIN
    products p ON s.product_id = p.product_id
GROUP BY
    p.product_name
ORDER BY
    total_units_sold DESC
LIMIT 10;

-- 2. Store-wise revenue performance
SELECT
    st.store_name,
    st.location,
    SUM(s.quantity * p.price) AS total_revenue
FROM
    sales s
JOIN
    products p ON s.product_id = p.product_id
JOIN
    stores st ON s.store_id = st.store_id
GROUP BY
    st.store_name, st.location
ORDER BY
    total_revenue DESC;

-- 3. Daily revenue trend (last 30 days)
SELECT
    sale_date,
    SUM(s.quantity * p.price) AS daily_revenue
FROM
    sales s
JOIN
    products p ON s.product_id = p.product_id
WHERE
    sale_date >= CURRENT_DATE - INTERVAL '30 days'
GROUP BY
    sale_date
ORDER BY
    sale_date;

-- 4. Most profitable category
SELECT
    p.category,
    SUM(s.quantity * p.price) AS revenue
FROM
    sales s
JOIN
    products p ON s.product_id = p.product_id
GROUP BY
    p.category
ORDER BY
    revenue DESC;

-- 5. Repeat purchases by customer
SELECT
    c.customer_name,
    COUNT(DISTINCT s.sale_date) AS purchase_days,
    SUM(s.quantity * p.price) AS total_spent
FROM
    sales s
JOIN
    customers c ON s.customer_id = c.customer_id
JOIN
    products p ON s.product_id = p.product_id
GROUP BY
    c.customer_name
ORDER BY
    purchase_days DESC, total_spent DESC
LIMIT 10;

-- 6. Inventory velocity (products selling fastest)
SELECT
    p.product_name,
    SUM(s.quantity) AS units_sold,
    COUNT(DISTINCT s.sale_date) AS active_days,
    ROUND(SUM(s.quantity)::decimal / COUNT(DISTINCT s.sale_date), 2) AS avg_daily_sales
FROM
    sales s
JOIN
    products p ON s.product_id = p.product_id
GROUP BY
    p.product_name
ORDER BY
    avg_daily_sales DESC
LIMIT 10;
