## **How many users do we have?**
>select COUNT(*) from dbt_jfevrieracluorg.stg_users

**answer: 130**

## **On average, how many orders do we receive per hour?**

>with hourly_total as 
>
>(
>    
>select COUNT(*) as count,
>
>    TRUNC(created_at, 'hour') as hourly
> 
>   from dbt_jfevrieracluorg.stg_orders 
>
>    group by hourly
>
> )
>
>select avg(count) from hourly_total

**answer: 7.520833 orders**

## **On average, how long does an order take from being placed to being delivered?**

> with delivery_time_in_day as (
>
>select created_at,
>
>delivered_at,
>
>DATEDIFF(day,created_at, delivered_at) as delivery_time
>
>from dbt_jfevrieracluorg.stg_orders
>
>where status = 'delivered'
>
>    )   
>
>select avg(delivery_time) as days
>
>from delivery_time_in_day 

**answer: 3.891803 days**

## **How many users have only made one purchase? Two purchases? Three+ purchases?**

Note: you should consider a purchase to be a single order. In other words, if a user places one order for 3 products, they are considered to have made 1 purchase.

>with user_purchases as (
>
>    select COUNT(*) as cnt,
>
>    user_id 
>
>   from dbt_jfevrieracluorg.stg_orders
>
>    group by user_id
>
>)
>
>select COUNT(*) from user_purchases where cnt = 1 , = 2, >=3

**Answer:
1= 25
2= 28
3+ = 71**

## **On average, how many unique sessions do we have per hour?**

>with session_count as (
>
>select COUNT(DISTINCT(session_id)) as cnt,
>
>trunc(created_at,'hour') as hourly 
>
>from dbt_jfevrieracluorg.stg_events 
>
>group by hourly
>
>    )
>
>select avg(cnt) from session_count

**Answer: 16.327586**