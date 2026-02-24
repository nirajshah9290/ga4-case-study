-- Bronze: Raw GA4 events reference
{{ config(
  type = "reference",
  dataset = var("ga4_dataset"),
  sql = "SELECT * FROM `${var("ga4_dataset")}.events_*`"
) }}

-- Bronze table: Clean events with basic filtering
{{ config(
  type = "table",
  name = "bronze_events",
  description = "Raw GA4 events with basic cleaning"
) }}

SELECT
  event_date,
  event_timestamp,
  event_name,
  user_pseudo_id,
  ga_session_id,
  traffic_source.medium,
  traffic_source.name,
  ecommerce.purchase_revenue_in_usd AS event_value_in_usd,
  (SELECT value.int_value FROM UNNEST(event_params) WHERE key = 'items') AS items_count
FROM
  `${var("ga4_dataset")}.events_*`
WHERE
  _TABLE_SUFFIX BETWEEN '20210101' AND '20210131'  -- Limit for demo
