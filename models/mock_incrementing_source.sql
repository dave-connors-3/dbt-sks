with 

final as (

select
    1 as customer_id,
    '2022-05-03'::timestamp as report_date, 
    450 as val

union all 

select
    1 as customer_id,
    '2022-05-04'::timestamp as report_date, 
    460 as val

union all 

select
    2 as customer_id,
    '2022-05-03'::timestamp as report_date, 
    50 as val

union all 

select
    2 as customer_id,
    '2022-05-04'::timestamp as report_date, 
    30 as val

-- add a new record for customer 2 every time

union all 

select
    2 as customer_id,
    current_timestamp() report_date, 
    random() as val

)

select * from final