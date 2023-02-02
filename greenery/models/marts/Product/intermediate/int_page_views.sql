with products as (
    select * from {{ ref ('stg_products') }}
),
with events as (
    select * from {{ ref ('stg_events') }}
)

SELECT
    p.product_id,
    p.name,
    count(distinct session_id) as page_view
from events e
left join products p on p.product_id = e.product_id
where event_type='page_view'
group by 1,2