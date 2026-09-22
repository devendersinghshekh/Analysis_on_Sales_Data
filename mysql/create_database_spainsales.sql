CREATE DATABASE spain_sales;
use spain_sales;

CREATE TABLE customer_desc(
customer_id CHAR(10) PRIMARY KEY, customer_name CHAR(100)
);
CREATE TABLE order_desc(
order_id CHAR(10) PRIMARY KEY, order_date DATE, region CHAR(100), salesperson CHAR(100),
customer_id CHAR(10),
FOREIGN KEY(customer_id)
references customer_desc(customer_id)
);

CREATE TABLE product_desc(
product_id INT AUTO_INCREMENT PRIMARY KEY, product CHAR(100) UNIQUE, category CHAR(100)
);

CREATE TABLE order_quant(
product_id INT, quantity INT, order_id CHAR(10), unit_price INT,
FOREIGN KEY(product_id)
REFERENCES product_desc(product_id),
FOREIGN KEY(order_id)
REFERENCES order_desc(order_id)
);

ALTER TABLE order_quant
ADD COLUMN product CHAR(100);

LOAD DATA LOCAL INFILE 'D:/Sales_performance_analyzer/data/spain_sales_raw.csv'
INTO TABLE order_quant
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(order_id, @order_date, @customer_id, @customer_name,
 product, @category, quantity, unit_price, @region, @salesperson);
 
 
UPDATE order_quant oq
JOIN product_desc p
    ON oq.product = p.product
SET oq.product_id = p.product_id;

ALTER TABLE order_quant
DROP COLUMN product;
 
 
