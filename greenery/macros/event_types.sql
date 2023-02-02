{%- macro event_types() -%}
    {%- set event_types = dbt_utils.get_column_values(
        table=ref('stg_events'),
        column='event_type')
     -%}


    {%- for evt in event_types -%}
        count_if(event_type = '{{evt}}') as session_{{evt}}
    {%- if not loop.last -%},{%- endif -%}
    {%- endfor -%}
{% endmacro %}
