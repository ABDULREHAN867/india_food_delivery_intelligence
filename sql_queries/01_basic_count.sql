SELECT 
  COUNT(*) as total_restaurants,
  COUNT(DISTINCT city) as total_cities
FROM `my-first-project-63166.swiggy_intelligence.dim_restaurants`;
