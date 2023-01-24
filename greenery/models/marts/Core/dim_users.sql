{{
  config(
    materialized='table'
  )
}}

SELECT
  u.user_id,
  o.total_orders,
  o.total_order_amount,
  o.total_shipping_amount,
  u.first_name,
  u.last_name,
  u.email,
  u.phone_number,
  a.address,
  a.zipcode,
  a.state,
  a.country

FROM {{ ref('stg_users') }} as u
left join {{ ref('stg_addresses') }} as a
  on u.address_id = a.address_id
left join {{ ref('int_order_details') }} as o
  on u.user_id = o.user_id

