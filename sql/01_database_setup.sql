CREATE DATABASE frozen_food_business;

USE frozen_food_business;

CREATE TABLE Categories (
    category_id INT PRIMARY KEY,
    category_name VARCHAR(50)
);

CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category_id INT,
    selling_price DECIMAL(10,2),
    FOREIGN KEY (category_id) REFERENCES Categories(category_id)
);

CREATE TABLE Customers (
    customer_id VARCHAR(10) PRIMARY KEY,
    customer_name VARCHAR(100),
    city VARCHAR(50)
);

CREATE TABLE Sales_Channels (
    channel_id VARCHAR(10) PRIMARY KEY,
    channel_name VARCHAR(50)
);

CREATE TABLE Orders (
    order_id VARCHAR(10) PRIMARY KEY,
    customer_id VARCHAR(10),
    channel_id VARCHAR(10),
    order_date DATE,
    order_status VARCHAR(20),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (channel_id) REFERENCES Sales_Channels(channel_id)
);

CREATE TABLE Order_Items (
    order_item_id INT PRIMARY KEY,
    order_id VARCHAR(10),
    product_id INT,
    quantity INT,
    unit_price DECIMAL(10,2),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

CREATE TABLE Production_Costs (
    cost_id INT PRIMARY KEY,
    product_id INT,
    cost_date DATE,
    cost_per_unit DECIMAL(10,2),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

CREATE TABLE Expenses (
    expense_id INT PRIMARY KEY,
    expense_date DATE,
    expense_type VARCHAR(50),
    amount DECIMAL(10,2),
    channel_id VARCHAR(10),
    FOREIGN KEY (channel_id) REFERENCES Sales_Channels(channel_id)
);
