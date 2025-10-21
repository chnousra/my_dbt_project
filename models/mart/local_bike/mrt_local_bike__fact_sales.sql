WITH sales_aggregated AS (
    SELECT
        order_id,
        customer_id,
        product_id,
        store_id,
        order_date,
        shipped_date,
        required_date,
        staff_id,
        order_status,
        SUM(quantity) AS quantity,
        SUM(order_amount) AS total_amount,
        SUM(CASE WHEN order_status = 'Registred' THEN order_amount ELSE 0 END) AS total_Registred_order,
        SUM(CASE WHEN order_status = 'Confirmed' THEN order_amount ELSE 0 END) AS total_Confirmed_order,
        SUM(CASE WHEN order_status = 'Cancelled' THEN order_amount ELSE 0 END) AS total_Cancelled_order,
        SUM(CASE WHEN order_status = 'Shipped' THEN order_amount ELSE 0 END) AS total_Shipped_order,
        SUM(CASE WHEN order_status = 'Unknown status' THEN order_amount ELSE 0 END) AS total_Unknown_status_order
    FROM {{ ref('int_local_bike__sales') }}
    GROUP BY
        order_id,
        customer_id,
        product_id,
        store_id,
        order_date,
        shipped_date,
        required_date,
        staff_id,
        order_status
)

SELECT
    order_id                    AS order_id,
    customer_id                 AS customer_id,
    product_id                  AS product_id,
    store_id                    AS store_id,
    order_date                  AS order_date,
    shipped_date                AS shipped_date,
    required_date               AS required_date,
    staff_id                    AS staff_id,
    quantity                    AS quantity,
    total_amount                AS total_amount,
    total_Registred_order       AS total_Registred_order,
    total_Confirmed_order       AS total_Confirmed_order,
    total_Cancelled_order       AS total_Cancelled_order,
    total_Shipped_order         AS total_Shipped_order,
    total_Unknown_status_order  AS total_Unknown_status_order,
    order_status                AS order_status
FROM sales_aggregated