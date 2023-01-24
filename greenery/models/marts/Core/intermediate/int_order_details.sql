SELECT
    user_id,
    count(order_id) as total_orders,
    sum(order_cost) as total_order_amount,
    sum(shipping_cost) as total_shipping_amount
from {{ ref('stg_orders')}}
group by user_id