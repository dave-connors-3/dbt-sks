{{
  config(
    materialized = 'table',
    )
}}


with 

source as (

    select * from {{ ref('mock_incrementing_source') }}
    
),

final as (

    select 
        {{ increment_sequence() }} as surrogate_key_id,
        *
    from source 
)

select * from final

