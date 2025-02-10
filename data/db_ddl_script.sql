CREATE TABLE orders(
  order_id INT PRIMARY KEY,
  consumer_id INT,
  cart_id INT,
  order_date DATE,
  total_price DECIMAL(10, 2),
  shipping_fee DECIMAL(10, 2),
  discount DECIMAL(10, 2),
  final_price DECIMAL(10, 2)
);

CREATE TABLE consumers (
  consumer_id INT PRIMARY KEY,
  name VARCHAR(100),
  email VARCHAR(100),
  address VARCHAR(255),
  phone_number VARCHAR(20)
);

CREATE TABLE cart (
  cart_id INT PRIMARY KEY,
  consumer_id INT,
  created_date DATE,
  updated_date DATE,
  total_value DECIMAL(10, 2),
  FOREIGN KEY (consumer_id) REFERENCES consumers(consumer_id)
);

CREATE TABLE products (
  product_id INT PRIMARY KEY,
  name VARCHAR(100),
  description TEXT,
  category_id INT,
  created_date DATE
);

CREATE TABLE product_category(
  category_id INT PRIMARY KEY,
  category_name VARCHAR(50)
);

CREATE TABLE cart_products (
  cart_id INT,
  product_id INT,
  quantity INT,
  price_at_time DECIMAL(10, 2),
  FOREIGN KEY (cart_id) REFERENCES cart(cart_id),
  FOREIGN KEY (product_id) REFERENCES products(product_id)
);



