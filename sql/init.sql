-- Create table without the JSONB "profile" column
CREATE TABLE IF NOT EXISTS users (
  id         SERIAL    PRIMARY KEY,
  first_name TEXT      NOT NULL,
  last_name  TEXT      NOT NULL,
  age        INT       NOT NULL
);

-- Seed data
INSERT INTO users (first_name, last_name, age)
VALUES ('John', 'Doe', 30),
	   ('Jane', 'Smith', 25),
	   ('Bob', 'Johnson', 40),
	   ('Alice', 'Williams', 35);

-- Create orders table
CREATE TABLE IF NOT EXISTS orders (
  id         SERIAL    PRIMARY KEY,
  user_id    INT       NOT NULL REFERENCES users(id),
  product    TEXT      NOT NULL,
  quantity   INT       NOT NULL,
  price      NUMERIC   NOT NULL
);

-- Seed orders for John (assuming John's id is 1)
-- INSERT INTO orders (user_id, product, quantity, price)
-- VALUES
--   (1, 'Laptop', 1, 1200.00),
--   (1, 'Smartphone', 2, 800.00);

-- Create order_history table
CREATE TABLE IF NOT EXISTS order_history (
  id         SERIAL    PRIMARY KEY,
  order_id   INT       NOT NULL REFERENCES orders(id),
  status     TEXT      NOT NULL,
  changed_at TIMESTAMP NOT NULL DEFAULT NOW()
);

-- Example: Seed order history for John's orders
-- INSERT INTO order_history (order_id, status)
-- SELECT id, 'placed' FROM orders WHERE user_id = 1;
