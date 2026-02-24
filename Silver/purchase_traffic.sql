{{ config(
  type = "view",
  name = "purchase_traffic_source_medium",
  description = "Filtered purchases with traffic_source.medium (non-deleted)"
) }}

WITH clean_purchases AS (
  SELECT
    event_date,
    traffic_source.medium,
    user_pseudo_id,
    ga_session_id,
    event_value_in_usd,
    items_count
  FROM {{ ref("bronze_events") }}
  WHERE
    event_name = 'purchase'
    AND event_value_in_usd IS NOT NULL
    AND traffic_source.medium IS NOT NULL
    AND NOT REGEXP_CONTAINS(event_name, r'(data deleted)')
)

SELECT * FROM clean_purchases
