USE frozen_food_business;

-- 1. Product Profitability
WITH ProductProfit AS (
    SELECT
        p.product_name,
        SUM(oi.quantity * oi.unit_price) AS revenue,
        SUM(oi.quantity * pc.cost_per_unit) AS production_cost
    FROM Order_Items oi
    JOIN Products p
        ON oi.product_id = p.product_id
    JOIN Production_Costs pc
        ON oi.product_id = pc.product_id
    GROUP BY p.product_name
)
SELECT
    product_name,
    revenue,
    production_cost,
    revenue - production_cost AS gross_profit
FROM ProductProfit
ORDER BY gross_profit DESC;


-- 2. Monthly Revenue
WITH MonthlySales AS (
    SELECT
        DATE_FORMAT(o.order_date, '%Y-%m') AS month,
        SUM(oi.quantity * oi.unit_price) AS revenue
    FROM Orders o
    JOIN Order_Items oi
        ON o.order_id = oi.order_id
    GROUP BY DATE_FORMAT(o.order_date, '%Y-%m')
)
SELECT
    month,
    revenue
FROM MonthlySales
ORDER BY month;


-- 3. Sales Channel Performance
WITH ChannelSales AS (
    SELECT
        sc.channel_name,
        COUNT(DISTINCT o.order_id) AS total_orders,
        SUM(oi.quantity * oi.unit_price) AS revenue
    FROM Orders o
    JOIN Sales_Channels sc
        ON o.channel_id = sc.channel_id
    JOIN Order_Items oi
        ON o.order_id = oi.order_id
    GROUP BY sc.channel_name
)
SELECT
    channel_name,
    total_orders,
    revenue,
    ROUND(revenue / total_orders, 2) AS average_order_value
FROM ChannelSales
ORDER BY revenue DESC;


-- 4. Customer Revenue
WITH CustomerSales AS (
    SELECT
        c.customer_id,
        c.customer_name,
        c.city,
        COUNT(DISTINCT o.order_id) AS total_orders,
        SUM(oi.quantity * oi.unit_price) AS revenue
    FROM Customers c
    JOIN Orders o
        ON c.customer_id = o.customer_id
    JOIN Order_Items oi
        ON o.order_id = oi.order_id
    GROUP BY c.customer_id, c.customer_name, c.city
)
SELECT
    customer_name,
    city,
    total_orders,
    revenue
FROM CustomerSales
ORDER BY revenue DESC
LIMIT 10;


-- 5. Category Profitability
WITH CategoryProfit AS (
    SELECT
        c.category_name,
        SUM(oi.quantity * oi.unit_price) AS revenue,
        SUM(oi.quantity * pc.cost_per_unit) AS production_cost
    FROM Order_Items oi
    JOIN Products p
        ON oi.product_id = p.product_id
    JOIN Categories c
        ON p.category_id = c.category_id
    JOIN Production_Costs pc
        ON oi.product_id = pc.product_id
    GROUP BY c.category_name
)
SELECT
    category_name,
    revenue,
    production_cost,
    revenue - production_cost AS gross_profit,
    ROUND(
        (revenue - production_cost) / revenue * 100,
        2
    ) AS profit_margin
FROM CategoryProfit
ORDER BY profit_margin DESC;
