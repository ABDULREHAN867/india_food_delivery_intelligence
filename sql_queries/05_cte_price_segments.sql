
WITH price_segments AS (
SELECT
    r.restaurant_name,
    r.city,
    r.price,
    p.avg_rating,
    p.delivery_time_min,
    CASE
      WHEN r.price <= 200 THEN 'Budget'
      WHEN r.price <= 400 THEN 'Mid-Range'
      WHEN r.price <= 700 THEN 'Premium'
      ELSE 'Luxury'
    END as price_category
  FROM `my-first-project-63166.swiggy_intelligence.dim_restaurants` r
  JOIN `my-first-project-63166.swiggy_intelligence.fact_restaurant_performance` p
    ON r.restaurant_id = p.restaurant_id
)
SELECT
  price_category,
  COUNT(*) as total_restaurants,
  ROUND(AVG(avg_rating), 2) as avg_rating,
  ROUND(AVG(delivery_time_min), 1) as avg_delivery_min,
  ROUND(AVG(price), 0) as avg_price
FROM price_segments
GROUP BY price_category
ORDER BY avg_price;
