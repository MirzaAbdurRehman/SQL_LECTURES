create database shop_db;

use shop_db;


CREATE TABLE products (
    p_id INT PRIMARY KEY,   /* PRIMARY  index */
    name VARCHAR(100) NOT NULL,
	category varchar(50) not null,
    price DECIMAL(10, 2) NOT NULL,
    stock INT NOT NULL,
    description TEXT,
    created_at DATETIME2 DEFAULT CURRENT_TIMESTAMP
);



/* unique index */

create unique INDEX idx_unique_product_name
on products (name);


/* Non Clustered Index */

create index idx_category    
on products(category);

/* Composite Index */

create index idx_category_price
on products(category,price);









/* FullText Index */

CREATE UNIQUE INDEX IX_p_id ON products(p_id);


CREATE FULLTEXT CATALOG ftCatalog AS DEFAULT;

CREATE FULLTEXT INDEX ON products(description)
KEY INDEX IX_p_id  -- Ensure this is the correct unique index name
ON ftCatalog;




/* drop index idx_category on products; */


INSERT INTO products (p_id, name, category, price, stock, description)
VALUES
(1, 'Wireless Mouse', 'Electronics', 25.99, 150, 'A high-quality wireless mouse with ergonomic design.'),
(2, 'Bluetooth Headphones', 'Electronics', 59.99, 80, 'Noise-cancelling Bluetooth headphones for immersive sound.'),
(3, 'Yoga Mat', 'Fitness', 19.99, 120, 'Durable and non-slip yoga mat for all types of exercises.'),
(4, 'Laptop Backpack', 'Accessories', 39.99, 50, 'Stylish and spacious backpack for laptops and essentials.'),
(5, 'LED Desk Lamp', 'Home', 29.99, 200, 'Energy-efficient LED desk lamp with adjustable brightness.');


select * from products where category = 'Electronics' ;


select * from products where category = 'Electronics' and price > 20.0;

SELECT * 
FROM products 
WHERE description LIKE '%with%';









