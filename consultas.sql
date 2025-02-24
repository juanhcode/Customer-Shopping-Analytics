-- Crear índices para optimización
-- CREATE INDEX idx_sales_category ON sales(category);
-- CREATE INDEX idx_sales_customer ON sales(customer_id);
-- CREATE INDEX idx_sales_payment ON sales(payment_method);
-- CREATE INDEX idx_sales_date ON sales(invoice_date);

-- 1. Total de ventas por categoría de producto
SELECT sales.category_id, SUM(total_price) AS total_ventas
FROM sales
GROUP BY sales.category_id
ORDER BY total_ventas DESC;


-- 2. Clientes con mayor volumen de compras
SELECT customer_id, SUM(total_price) AS total_compras
FROM sales
GROUP BY customer_id
ORDER BY total_compras DESC;


-- 3. Métodos de pago más utilizados
SELECT 
    p.payment_method, 
    COUNT(*) AS total_transacciones
FROM sales s
JOIN payment p ON s.payment_method_id = p.payment_id
GROUP BY p.payment_method
ORDER BY total_transacciones DESC;

-- 4. Comparación de ventas por mes
SELECT d.year, d.month, SUM(s.total_price) AS total_ventas
FROM sales s
JOIN date d ON s.invoice_date = d.date_id
GROUP BY d.year, d.month
ORDER BY d.year, d.month;
