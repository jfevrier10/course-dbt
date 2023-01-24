{{
  config(
    materialized='table'
  )
}}

SELECT
    event_id,
    user_id,
    page_url
from {{ ref('stg_events') }}
where event_type = 'page_view'
