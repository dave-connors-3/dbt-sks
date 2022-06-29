{% test sk_starts_at_one(model, column_name) %}

    select min({{ column_name}} ) from {{ model }}
    having min({{ column_name}} ) != 1
  
{% endtest %}