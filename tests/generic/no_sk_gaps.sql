{% test no_sk_gaps(model, column_name) %}

    select * from 
    (
        select 
            {{ column_name }} - lag({{ column_name }}) over (order by {{ column_name }} ) as gap 
        from {{ model }}
    )
    where gap > 1
  
{% endtest %}