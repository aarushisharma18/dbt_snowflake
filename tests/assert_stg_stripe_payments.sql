-- detection orders for which the total amount is < 0, which violates our assertion that none of the
-- payments should be negative

with payments as (
    select * from {{ref('stg_stripe_payments')}}
)

select
    order_id,
    sum(amount) as total_amount
from
    payments
group by  
    order_id
having
    total_amount < 0
    