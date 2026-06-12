SELECT
  restaurant_name,
  city,
  avg_rating,
  total_ratings,
  delivery_time_min,
  RANK() OVER (
    PARTITION BY city
    ORDER BY avg_rating DESC,
             total_ratings DESC
  ) as city_rank
FROM `my-first-project-63166.swiggy_intelligence.fact_restaurant_performance` p
JOIN `my-first-project-63166.swiggy_intelligence.dim_restaurants` r
  ON p.restaurant_id = r.restaurant_id
QUALIFY city_rank <= 3
ORDER BY city, city_rank;
