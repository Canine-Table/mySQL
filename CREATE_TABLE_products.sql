CREATE TABLE products (
    product_id INT,
    product_name VARCHAR(25) UNIQUE,
    price DECIMAL(4,2) DEFAULT 0.00
);

ALTER TABLE products ADD CONSTRAINT UNIQUE(product_name);
ALTER TABLE products MODIFY price DECIMAL(4,2) NOT NULL;

INSERT INTO products VALUES
    (101, 'Hamburgers',3.99),
    (102, 'Fries',1.89),
    (103, 'Soda',1.00),
    (104,'Ice Cream',1.49),
    (105,'Fries',1/75);

ALTER TABLE products ALTER price SET DEFAULT 0.00;

INSERT INTO products (product_id,product_name) 
VALUES (106,'Straw'),
       (107,'Napkin'),
       (108,'Fork'),
       (109,'Spoon'),
       (110,'Knife');