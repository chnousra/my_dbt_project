WITH products_joined AS (
    SELECT
        p.product_id       AS product_id,
        p.product_name     AS product_name,
        c.category_name    AS category_name,
        b.brand_name       AS brand_name,
        p.model_year       AS model_year,
        p.price            AS price
    FROM {{ ref('stg_local_bike__products') }} AS p
    LEFT JOIN {{ ref('stg_local_bike__categories') }} AS c
        ON p.category_id = c.category_id
    LEFT JOIN {{ ref('stg_local_bike__brands') }} AS b
        ON p.brand_id = b.brand_id
)

SELECT
    product_id     AS product_id,
    product_name   AS product_name,
    category_name  AS category_name,
    brand_name     AS brand_name,
    model_year     AS model_year,
    price          AS price
FROM products_joined