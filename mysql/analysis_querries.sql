# 1. Total revenue?
SELECT SUM(quantity*unit_price) AS total_revenue
FROM order_quant;

# 2. Total orders?
SELECT COUNT(order_id) AS total_orders
FROM order_desc;

# 3. Best-selling products?
SELECT SUM(quantity) AS total_sell
FROM order_quant
GROUP BY product_id
ORDER BY total_sell DESC
LIMIT 1;

# 4. Best-performing categories?
# 5. Revenue by region?
# 6. Revenue by salesperson?
# 7. Monthly revenue?
# 8. Average order value?
# 9. Which customers spend the most?
# 10. Which products have poor sales?