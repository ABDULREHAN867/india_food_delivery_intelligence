SELECT
  weather,
  traffic_density,
  city_type,
  COUNT(*) as total_deliveries,
  ROUND(AVG(delivery_time_min), 1) as avg_time,
  ROUND(MIN(delivery_time_min), 1) as fastest,
  ROUND(MAX(delivery_time_min), 1) as slowest,
  -- SLA check — under 30 min ?
  ROUND(
    COUNTIF(delivery_time_min <= 30) * 100.0
    / COUNT(*), 1
  ) as within_30min_pct
FROM `my-first-project-63166.swiggy_intelligence.fact_deliveries`
WHERE weather != 'NaN'
  AND traffic_density != 'NaN'
  AND city_type != 'NaN'
GROUP BY weather, traffic_density, city_type
ORDER BY avg_time DESC
LIMIT 20;
