-- View 1: Total revenue per product
CREATE OR REPLACE VIEW view_product_revenue AS
SELECT
    p.product_id,
    p.product_name,
    SUM(s.quantity) AS total_quantity_sold,
    SUM(s.quantity * p.price) AS total_revenue
FROM
    sales s
JOIN
    products p ON s.product_id = p.product_id
GROUP BY
    p.product_id, p.product_name
ORDER BY
    total_revenue DESC;

-- View 2: Total revenue per store
CREATE OR REPLACE VIEW view_store_revenue AS
SELECT
    st.store_id,
    st.store_name,
    st.location,
    SUM(s.quantity * p.price) AS store_total_revenue
FROM
    sales s
JOIN
    products p ON s.product_id = p.product_id
JOIN
    stores st ON s.store_id = st.store_id
GROUP BY
    st.store_id, st.store_name, st.location
ORDER BY
    store_total_revenue DESC;

-- View 3: Daily sales summary
CREATE OR REPLACE VIEW view_daily_sales_summary AS
SELECT
    sale_date,
    COUNT(*) AS transactions,
    SUM(quantity) AS items_sold,
    SUM(quantity * p.price) AS daily_revenue
FROM
    sales s
JOIN
    products p ON s.product_id = p.product_id
GROUP BY
    sale_date
ORDER BY
    sale_date;

-- View 4: Top-selling products by quantity
CREATE OR REPLACE VIEW view_top_products_by_quantity AS
SELECT
    p.product_id,
    p.product_name,
    SUM(s.quantity) AS total_quantity_sold
FROM
    sales s
JOIN
    products p ON s.product_id = p.product_id
GROUP BY
    p.product_id, p.product_name
ORDER BY
    total_quantity_sold DESC;
