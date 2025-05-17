CREATE TABLE IF NOT EXISTS product(
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    price NUMERIC(10, 4) DEFAULT 0.0000,
    quantity INTEGER DEFAULT 0
);

CREATE TABLE IF NOT EXISTS customer(
    id SERIAL PRIMARY KEY,
    "name" VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL,
);

CREATE TABLE IF NOT EXISTS "order"(
    id SERIAL PRIMARY KEY,
    "no" VARCHAR(50) NOT NULL,
    "address" VARCHAR(250) NOT NULL,
    payment_type VARCHAR(20) NOT NULL,
    total NUMERIC(10, 4) DEFAULT 0.0000,
    "status" VARCHAR(30)
);

CREATE TABLE IF NOT EXISTS order_item(
    id SERIAL PRIMARY KEY,
    order_id INTEGER,
    product_id INTEGER,
    price NUMERIC(10, 4) DEFAULT 0.0000,
    quantity INTEGER DEFAULT 0,

    FOREIGN KEY (order_id) REFERENCES order(id),
    FOREIGN KEY (product_id) REFERENCES product(id)
);