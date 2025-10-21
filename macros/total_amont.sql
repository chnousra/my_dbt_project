{% macro total_amount_payed(qty,price,discount) %}
    (quantity * price) - (quantity * price * discount_percent)
{% endmacro %}