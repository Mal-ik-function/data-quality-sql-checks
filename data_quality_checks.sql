-- 1. Detect Missing Critical Fields (NULL values)

SELECT *
FROM customers
WHERE email IS NULL
   OR date_of_birth IS NULL;


-- 2. Detect Duplicate Primary Identifiers

SELECT customer_id, COUNT(*) AS record_count
FROM customers
GROUP BY customer_id
HAVING COUNT(*) > 1;


-- 3. Detect Orphan Records (Referential Integrity Check)

SELECT o.order_id
FROM orders o
LEFT JOIN customers c ON o.customer_id = c.customer_id
WHERE c.customer_id IS NULL;


-- 4. Detect Invalid Data Ranges

SELECT *
FROM transactions
WHERE transaction_amount < 0;
