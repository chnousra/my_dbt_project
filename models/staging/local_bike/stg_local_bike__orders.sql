WITH orders_source AS (
    SELECT
        order_id,
        customer_id,
        store_id,
        staff_id,
        CASE 
            WHEN order_status = 1 THEN 'Registred'
            WHEN order_status = 2 THEN 'Confirmed'
            WHEN order_status = 3 THEN 'Cancelled'
            WHEN order_status = 4 THEN 'Shipped'
            ELSE 'Unknown status'
        END AS order_status,
        order_date,
        required_date,
        DATE(NULLIF(shipped_date, 'NULL')) AS shipped_date
    FROM {{ source('local_bike', 'orders') }}
)

SELECT
    order_id       AS order_id,
    customer_id    AS customer_id,
    store_id       AS store_id,
    staff_id       AS staff_id,
    order_status   AS order_status,
    order_date     AS order_date,
    required_date  AS required_date,
    shipped_date   AS shipped_date
FROM orders_source
