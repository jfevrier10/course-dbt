SELECT
    user_id,
    count(distinct session_id) as num_of_sessions,
    count(distinct product_id) as products_viewed
from {{ ref('stg_events') }}
group by user_id