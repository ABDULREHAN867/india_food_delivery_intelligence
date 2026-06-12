SELECT 
  city,
  COUNT(*) as restaurant_count,
  ROUND(AVG(price), 0) as avg_price
FROM `my-first-project-63166.swiggy_intelligence.dim_restaurants`
GROUP BY city
ORDER BY restaurant_count DESC;
