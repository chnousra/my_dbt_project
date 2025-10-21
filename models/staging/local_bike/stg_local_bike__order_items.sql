WITH order_items_source AS (
    SELECT
        order_id,
        item_id,
        product_id,
        quantity,
        list_price,
        discount
    FROM {{ source('local_bike', 'order_items') }}
)

SELECT
    order_id       AS order_id,
    item_id        AS item_id,
    product_id     AS product_id,
    quantity       AS quantity,
    list_price     AS price,
    discount  AS discount_percent
FROM order_items_source
ORDER BY product_id, item_id ASC
