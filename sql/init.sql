-- Create table without the JSONB "profile" column
CREATE TABLE IF NOT EXISTS users (
    id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    age INT NOT NULL,
    updated_at TIMESTAMP NOT NULL
);

-- Seed data
INSERT INTO users (first_name, last_name, age, updated_at)
VALUES ('John', 'Doe', 30, NOW()),
('Jane', 'Smith', 25, NOW()),
('Bob', 'Johnson', 40, NOW()),
('Alice', 'Williams', 35, NOW());

-- Create orders table
CREATE TABLE IF NOT EXISTS orders (
    id SERIAL PRIMARY KEY,
    user_id INT NOT NULL REFERENCES users (id),
    product TEXT NOT NULL,
    quantity INT NOT NULL,
    price NUMERIC NOT NULL,
    created_at TIMESTAMP NOT NULL
);

-- Create order_history table
CREATE TABLE IF NOT EXISTS order_history (
    id SERIAL PRIMARY KEY,
    order_id INT NOT NULL REFERENCES orders (id),
    status TEXT NOT NULL,
    changed_at TIMESTAMP NOT NULL
);

INSERT INTO orders (user_id, product, quantity, price, created_at)
VALUES
(1, 'Laptop', 1, 1200.00, NOW()),
(1, 'Smartphone', 2, 800.00, NOW()),
(2, 'Tablet', 1, 300.00, NOW()),
(3, 'Monitor', 2, 400.00, NOW()),
(4, 'Keyboard', 5, 50.00, NOW());

INSERT INTO order_history (order_id, status, changed_at)
VALUES
(1, 'Pending', NOW()),
(1, 'Shipped', NOW() + INTERVAL '1 day'),
(2, 'Pending', NOW()),
(2, 'Shipped', NOW() + INTERVAL '2 days');
