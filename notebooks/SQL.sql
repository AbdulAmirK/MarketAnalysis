use Ecom;

-- 'customers' table
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_fname VARCHAR(50),
    customer_city VARCHAR(50),
	customer_state VARCHAR(50),
    customer_country VARCHAR(50),  
    customer_zipcode VARCHAR(10)
);

-- 'orders' table
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_segment VARCHAR(50),
    order_quantity INT,
    order_date DATE,
    order_region VARCHAR(250),
    market VARCHAR(250),
    order_customer_id INT,
    order_item_total DECIMAL(10, 2),
    FOREIGN KEY (order_customer_id) REFERENCES customers(customer_id)
);

-- 'sales' table
CREATE TABLE sales (
    sale_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    product_price DECIMAL(10, 2),
    profit_margin DECIMAL(5, 2),
    profit_per_order DECIMAL(10, 2),
    sales DECIMAL(10, 2),
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);









