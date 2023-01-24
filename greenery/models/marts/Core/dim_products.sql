{{
  config(
    materialized='table'
  )
}}

SELECT
    products.name,
    sum(order_items.quantity) as quantity_sold
from {{ ref('stg_products') }} as products
left join {{ ref ('stg_order_items') }} as order_items
    on products.product_id = order_items.product_id
group by products.name