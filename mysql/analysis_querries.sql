# 1. Total revenue?
SELECT SUM(quantity*unit_price) AS total_revenue
FROM order_quant;

# 2. Total orders?
SELECT COUNT(order_id) AS total_orders
FROM order_desc;

# 3. Best-selling products?
SELECT SUM(oq.quantity) AS total_sell, pd.product
FROM order_quant oq
INNER JOIN product_desc pd
ON oq.product_id = pd.product_id 
GROUP BY oq.product_id
ORDER BY total_sell DESC
LIMIT 1;

# 4. Best-performing categories?
SELECT COUNT(oq.quantity) AS freq, pd.category
FROM order_quant oq
INNER JOIN product_desc pd
ON oq.product_id = pd.product_id
GROUP BY pd.category
ORDER BY freq DESC
LIMIT 1; 

# 5. Revenue by region?
SELECT SUM(oq.quantity*oq.unit_price) AS revenue, od.region
FROM order_quant oq
INNER JOIN order_desc od
ON od.order_id = oq.order_id
GROUP BY region
ORDER BY revenue ASC;

# 6. Revenue by salesperson?
SELECT SUM(oq.quantity*oq.unit_price) AS revenue, od.salesperson
FROM order_quant oq
INNER JOIN order_desc od
ON od.order_id = oq.order_id
GROUP BY salesperson
ORDER BY revenue ASC;

# 7. Monthly revenue?
SELECT SUM(oq.quantity*oq.unit_price) AS revenue, MONTH(od.order_date) AS order_mon
FROM order_quant oq
INNER JOIN order_desc od
ON od.order_id = oq.order_id
GROUP BY MONTH(od.order_date)
ORDER BY order_mon ASC;

# 8. Average order value?
SELECT AVG(quantity) AS avg_od_val
FROM order_quant oq;

# 9. Which customers spend the most?
SELECT SUM(oq.quantity * oq.unit_price) AS spent, cd.customer_name
FROM order_quant oq
INNER JOIN order_desc od ON od.order_id = oq.order_id
INNER JOIN customer_desc cd ON cd.customer_id = od.customer_id
GROUP BY customer_name
ORDER BY spent ASC;

# 10. Which products have poor sales?
SELECT SUM(oq.quantity) AS freq, pd.product
FROM order_quant oq
INNER JOIN product_desc pd
ON pd.product_id = oq.product_id
GROUP BY product
ORDER BY freq ASC; 