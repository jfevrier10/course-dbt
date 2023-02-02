{{
  config(
    materialized='table'
  )
}}

with events as (
    SELECT * from {{ ref('stg_events') }}
)


    select 
        session_id
        , user_id
        , {{ event_types() }}
    from events
    group by 1,2


