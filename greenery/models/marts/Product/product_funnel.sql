{{
  config(
    materialized='table'
  )
}}

with event_sum as (
    select 
    SUM(SESSION_PAGE_VIEW) as sum_page_view, 
    SUM(SESSION_ADD_TO_CART) as sum_add_to_cart, 
    SUM(SESSION_CHECKOUT) as sum_check_out
    from {{ref ('fact_events_conversion')}}
),
total_session as (    
    select SUM(sum_page_view + sum_add_to_cart + sum_check_out ) as total_sessions 
    from event_sum
)
select e.sum_page_view / s.total_sessions as view_rate,
       e.sum_add_to_cart / s.total_sessions as add_rate, 
       e.sum_check_out / s.total_sessions as check_out_rate 
       from event_sum e, total_session s