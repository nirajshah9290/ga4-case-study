{{ config(
  type = "table",
  name = "top_traffic_source_medium",
  description = "Monthly aggregation: top traffic_source.medium by purchase value & volume"
) }}

SELECT
  FORMAT_DATE('%Y-%m', event_date) AS month,
  traffic_source.medium,
  SUM(event_value_in_usd) AS total_purchased_value_usd,
  COUNT(*) AS total_purchases,
  SUM(items_count) AS total_purchased_items,
  AVG(items_count) AS avg_items_per_purchase
FROM {{ ref("purchase_traffic_source_medium") }}
GROUP BY month, traffic_source.medium
ORDER BY total_purchased_value_usd DESC
