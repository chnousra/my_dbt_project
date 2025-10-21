WITH products_source AS (
    SELECT
        product_id,
        product_name,
        brand_id,
        category_id,
        model_year,
        list_price
    FROM {{ source('local_bike', 'products') }}
)

SELECT
    product_id   AS product_id,
    product_name AS product_name,
    brand_id     AS brand_id,
    category_id  AS category_id,
    model_year   AS model_year,
    list_price        AS price
FROM products_source
