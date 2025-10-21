WITH orders_joined AS (
    SELECT
        o.order_id                           AS order_id,
        customer_id                        AS customer_id,
        product_id                        AS product_id,
        store_id                           AS store_id,
        item_id                           AS item_id,
        order_status                       AS order_status,
        order_date                         AS order_date,
        required_date                      AS required_date,
        shipped_date                       AS shipped_date,
        staff_id                           AS staff_id,
        quantity                          AS quantity,
        ROUND(
            {{ total_amount_payed(
                quantity,
                price,
                discount_percent
            ) }},
        2)                                   AS order_amount
    FROM {{ ref('stg_local_bike__order_items') }} AS oi
    LEFT JOIN {{ ref('stg_local_bike__orders') }} AS o
        ON oi.order_id = o.order_id
)

SELECT
    order_id        AS order_id,
    customer_id     AS customer_id,
    product_id      AS product_id,
    store_id        AS store_id,
    item_id         AS item_id,
    order_status    AS order_status,
    order_date      AS order_date,
    required_date   AS required_date,
    shipped_date    AS shipped_date,
    staff_id        AS staff_id,
    quantity        AS quantity,
    order_amount    AS order_amount
FROM orders_joined
