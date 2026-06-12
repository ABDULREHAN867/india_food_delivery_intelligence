

WITH restaurant_full AS (
  --  join two tables
  SELECT
    r.restaurant_id,
    r.restaurant_name,
    r.city,
    r.food_type,
    r.price,
    p.avg_rating,
    p.total_ratings,
    p.delivery_time_min,
    -- Price category
    CASE
      WHEN r.price <= 200 THEN 'Budget'
      WHEN r.price <= 400 THEN 'Mid-Range'
      ELSE 'Premium'
    END as price_category,
    -- Performance tag
    CASE
      WHEN p.avg_rating >= 4.5 THEN 'Excellent'
      WHEN p.avg_rating >= 4.0 THEN 'Good'
      WHEN p.avg_rating >= 3.5 THEN 'Average'
      ELSE 'Poor'
    END as performance_tag
  FROM `my-first-project-63166.swiggy_intelligence.dim_restaurants` r
  JOIN `my-first-project-63166.swiggy_intelligence.fact_restaurant_performance` p
    ON r.restaurant_id = p.restaurant_id
)

SELECT
  city,
  COUNT(*) as total_restaurants,
  ROUND(AVG(avg_rating), 2) as avg_rating,
  ROUND(AVG(price), 0) as avg_price,
  ROUND(AVG(delivery_time_min), 1) as avg_delivery_min,
  -- How many  excellent restaurants 
  COUNTIF(performance_tag = 'Excellent') as excellent_count,
  --  How many poor restaurants 
  COUNTIF(performance_tag = 'Poor') as poor_count,
  -- City overall score
  ROUND(
    COUNTIF(performance_tag = 'Excellent') * 100.0 
    / COUNT(*), 1
  ) as excellence_rate_pct
FROM restaurant_full
GROUP BY city
ORDER BY excellence_rate_pct DESC;
