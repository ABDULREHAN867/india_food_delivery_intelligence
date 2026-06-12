SELECT 
  r.restaurant_name,
  r.city,
  r.food_type,
  r.price,
  p.avg_rating,
  p.total_ratings,
  p.delivery_time_min
FROM `my-first-project-63166.swiggy_intelligence.dim_restaurants` r
JOIN `my-first-project-63166.swiggy_intelligence.fact_restaurant_performance` p
  ON r.restaurant_id = p.restaurant_id
ORDER BY p.avg_rating DESC
LIMIT 10;
