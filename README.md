# GA4 Case Study - Dataform Pipeline

## Data Lineage

GA4 Raw Events (External)
↓ (Bronze - Append)
events_bronze (90-day retention)
↓ (Silver - Filtered/Cleaned)
purchase_traffic (View)
↓ (Gold - Aggregated)
top_traffic_source_medium (Partitioned Table)

## Layer Descriptions

**Bronze**: Raw GA4 events (90-day window, partitioned by event_date)
**Silver**: Filtered purchases with traffic_source.medium (View)
**Gold**: Monthly traffic source performance (partitioned by month)

## Run Schedule
- Daily: Bronze + Silver refresh
- Daily: Gold full refresh (small dataset)

## KPIs Delivered
- Purchased value USD by traffic source
- Purchase volume
- Avg items/purchase
- Conversion insights
