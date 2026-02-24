GA4 Ecommerce Data Pipeline (Dataform Case Study)
This repository contains a Dataform project designed to process Google Analytics 4 (GA4) ecommerce data from a raw state into actionable business intelligence.

🏗 Architecture: The Medallion Approach
The project is structured into three distinct layers to ensure data quality and lineage:

Bronze (Source): Direct declaration of the bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_* dataset. No transformations are performed here to maintain data auditability.

Silver (Cleaned/Denormalized): * Filters specifically for purchase events.

Excludes records where traffic_source.medium is marked as (data deleted).

Flattens nested fields like ga_session_id (from event_params) and calculates items_count (from the items array) to simplify downstream logic.

Gold (Reporting): * Aggregates data at a Monthly and Traffic Medium level.

Calculates key performance indicators (KPIs) including total revenue, total volume, and average items per purchase.
