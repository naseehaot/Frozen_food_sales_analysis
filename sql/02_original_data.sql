USE frozen_food_business;

-- Categories
INSERT INTO Categories (category_id, category_name) VALUES
(1, 'Frozen Snacks'),
(2, 'Ready-to-Cook'),
(3, 'Frozen Breads'),
(4, 'Frozen Meals');


-- Products
INSERT INTO Products (product_id, product_name, category_id, selling_price) VALUES
(101, 'Chicken Samosa', 1, 250.00),
(102, 'Chicken Cutlet', 1, 280.00),
(103, 'Beef Cutlet', 1, 300.00),
(104, 'Chicken Spring Roll', 1, 260.00),
(105, 'Chicken Nuggets', 2, 320.00),
(106, 'Chicken Momos', 2, 350.00),
(107, 'Chicken Shami Kebab', 2, 380.00),
(108, 'Kerala Parotta', 3, 180.00),
(109, 'Chicken Parotta', 4, 350.00),
(110, 'Chicken Curry', 4, 400.00);


-- Customers
INSERT INTO Customers (customer_id, customer_name, city) VALUES
('C001', 'Aisha', 'Kochi'),
('C002', 'Fathima', 'Thrissur'),
('C003', 'Anjali', 'Ernakulam'),
('C004', 'Nida', 'Kozhikode'),
('C005', 'Sara', 'Kannur'),
('C006', 'Hiba', 'Kochi'),
('C007', 'Riya', 'Malappuram'),
('C008', 'Mariya', 'Kottayam');


-- Sales Channels
INSERT INTO Sales_Channels (channel_id, channel_name) VALUES
('CH01', 'Instagram'),
('CH02', 'WhatsApp'),
('CH03', 'Online Marketplace'),
('CH04', 'Direct Website');


-- Orders
INSERT INTO Orders
(order_id, customer_id, channel_id, order_date, order_status) VALUES
('O001', 'C001', 'CH01', '2026-01-05', 'Delivered'),
('O002', 'C003', 'CH02', '2026-01-06', 'Delivered'),
('O003', 'C002', 'CH03', '2026-01-07', 'Delivered'),
('O004', 'C001', 'CH02', '2026-01-08', 'Cancelled'),
('O005', 'C004', 'CH01', '2026-01-10', 'Delivered'),
('O006', 'C006', 'CH04', '2026-01-12', 'Delivered'),
('O007', 'C005', 'CH03', '2026-01-15', 'Delivered'),
('O008', 'C007', 'CH02', '2026-01-18', 'Delivered'),
('O009', 'C008', 'CH01', '2026-01-20', 'Pending'),
('O010', 'C002', 'CH04', '2026-01-22', 'Delivered');


-- Order Items
INSERT INTO Order_Items
(order_item_id, order_id, product_id, quantity, unit_price) VALUES
(1, 'O001', 101, 2, 250.00),
(2, 'O001', 102, 1, 280.00),
(3, 'O002', 105, 2, 320.00),
(4, 'O002', 108, 3, 180.00),
(5, 'O003', 106, 2, 350.00),
(6, 'O003', 107, 1, 380.00),
(7, 'O004', 103, 2, 300.00),
(8, 'O005', 104, 3, 260.00),
(9, 'O005', 101, 2, 250.00),
(10, 'O006', 109, 2, 350.00),
(11, 'O006', 110, 1, 400.00),
(12, 'O007', 105, 3, 320.00),
(13, 'O007', 106, 2, 350.00),
(14, 'O008', 108, 4, 180.00),
(15, 'O008', 101, 2, 250.00),
(16, 'O009', 107, 2, 380.00),
(17, 'O009', 104, 1, 260.00),
(18, 'O010', 110, 2, 400.00),
(19, 'O010', 102, 2, 280.00);


-- Production Costs
INSERT INTO Production_Costs
(cost_id, product_id, cost_date, cost_per_unit) VALUES
(1, 101, '2026-01-01', 150.00),
(2, 102, '2026-01-01', 170.00),
(3, 103, '2026-01-01', 190.00),
(4, 104, '2026-01-01', 155.00),
(5, 105, '2026-01-01', 210.00),
(6, 106, '2026-01-01', 220.00),
(7, 107, '2026-01-01', 240.00),
(8, 108, '2026-01-01', 100.00),
(9, 109, '2026-01-01', 230.00),
(10, 110, '2026-01-01', 260.00);


-- Expenses
INSERT INTO Expenses
(expense_id, expense_date, expense_type, amount, channel_id) VALUES
(1, '2026-01-05', 'Packaging', 500.00, 'CH01'),
(2, '2026-01-06', 'Delivery', 800.00, 'CH02'),
(3, '2026-01-07', 'Marketing', 1000.00, 'CH01'),
(4, '2026-01-08', 'Marketplace Commission', 600.00, 'CH03'),
(5, '2026-01-10', 'Electricity', 1500.00, NULL),
(6, '2026-01-12', 'Packaging', 400.00, 'CH04'),
(7, '2026-01-15', 'Delivery', 700.00, 'CH03'),
(8, '2026-01-18', 'Marketing', 800.00, 'CH02'),
(9, '2026-01-20', 'Marketplace Commission', 500.00, 'CH03'),
(10, '2026-01-22', 'Delivery', 600.00, 'CH04');
