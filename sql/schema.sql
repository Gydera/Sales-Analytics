
# products
CREATE TABLE products (
    product_id SERIAL PRIMARY KEY,
    product_name TEXT NOT NULL,
    category TEXT,
    price NUMERIC(10, 2),
    stock_quantity INT
);

# customers
CREATE TABLE customers (
    customer_id SERIAL PRIMARY KEY,
    full_name TEXT,
    email TEXT,
    join_date DATE
);

--staff
CREATE TABLE staff (
    staff_id SERIAL PRIMARY KEY,
    full_name TEXT,
    position TEXT,
    location_id INT
);

--locations
CREATE TABLE locations (
    location_id SERIAL PRIMARY KEY,
    store_name TEXT,
    city TEXT,
    region TEXT
);

--sales
CREATE TABLE sales (
    sale_id SERIAL PRIMARY KEY,
    sale_date TIMESTAMP,
    product_id INT REFERENCES products(product_id),
    customer_id INT REFERENCES customers(customer_id),
    staff_id INT REFERENCES staff(staff_id),
    quantity INT,
    location_id INT REFERENCES locations(location_id)
);
