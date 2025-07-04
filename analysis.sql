-- RFM Calculation
SELECT
  customer_id,
  MAX(order_date) AS recency_date,
  COUNT(order_id) AS frequency,
  SUM(payment_value) AS monetary
FROM e_commerce_transactions
GROUP BY customer_id;

-- Segmentasi pelanggan berdasarkan frequency (6 segmen)
SELECT
  customer_id,
  COUNT(order_id) AS frequency,
  CASE
    WHEN COUNT(order_id) = 1 THEN 'New buyer'
    WHEN COUNT(order_id) BETWEEN 2 AND 3 THEN 'Occasional buyer'
    WHEN COUNT(order_id) BETWEEN 4 AND 6 THEN 'Repeat buyer'
    WHEN COUNT(order_id) BETWEEN 7 AND 9 THEN 'Engaged buyer'
    WHEN COUNT(order_id) BETWEEN 10 AND 15 THEN 'Loyal buyer'
    ELSE 'Power buyer'
  END AS segment
FROM e_commerce_transactions
GROUP BY customer_id;

-- Deteksi Anomali
SELECT 
  MIN(CAST(decoy_noise AS REAL)) AS min_value,
  MAX(CAST(decoy_noise AS REAL)) AS max_value,
  AVG(CAST(decoy_noise AS REAL)) AS avg_value
FROM e_commerce_transactions
WHERE decoy_noise IS NOT NULL
  AND TRIM(decoy_noise) != '';

SELECT *
FROM e_commerce_transactions
WHERE CAST(decoy_noise AS REAL) < 0;

SELECT *
FROM e_commerce_transactions
WHERE CAST(decoy_noise AS REAL) > 700;

-- Repeat purchase bulanan
SELECT
  strftime('%Y-%m', order_date) AS purchase_month,
  customer_id,
  COUNT(order_id) AS purchase_count
FROM e_commerce_transactions
GROUP BY purchase_month, customer_id
HAVING purchase_count > 1;

-- EXPLAIN query plan untuk repeat-purchase
EXPLAIN QUERY PLAN
SELECT
  strftime('%Y-%m', order_date) AS purchase_month,
  customer_id,
  COUNT(order_id) AS purchase_count
FROM e_commerce_transactions
GROUP BY purchase_month, customer_id
HAVING purchase_count > 1;
