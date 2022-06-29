{% macro generate_sequences() %}

    {% if execute %}
      
    {% set models = graph.nodes.values() | selectattr('resource_type', 'eq', 'model') %}
    {% set sk_models = [] %}
    {% for model in models %}
        {% if model.config.meta.surrogate_key %}
          {% do sk_models.append(model) %}
        {% endif %}
    {% endfor %}

    {% endif %}

    {% for model in sk_models %}

        {% if flags.FULL_REFRESH or model.config.materialized == 'table' %}

        create or replace sequence {{ model.database }}.{{ model.schema }}.{{ model.name }}_seq;

        {% else %}
        
        create sequence if not exists {{ model.database }}.{{ model.schema }}.{{ model.name }}_seq;
        
        {% endif %}
    
    {% endfor %}
  
{% endmacro %}