{{
  config(
    materialized = 'incremental',
    unique_key = 'surrogate_key_id'
    )
}}


with 

source as (

    select * from {{ ref('mock_incrementing_source') }}

    {% if is_incremental() %}
      where report_date >= (select max(report_date) from {{ this }})
    {% endif %}
),

final as (

    select 
        {{ increment_sequence() }} as surrogate_key_id,
        *
    from source 
)

select * from final

