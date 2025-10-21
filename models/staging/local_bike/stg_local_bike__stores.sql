WITH stores_source AS (
    SELECT
        store_id,
        COALESCE(store_name, 'Inconnu') AS store_name,
        phone,
        email,
        street,
        city,
        CASE
            WHEN state LIKE 'CA' THEN 'Canada'
            WHEN state LIKE 'NY' THEN 'New York'
            WHEN state LIKE 'TX' THEN 'Texas'
            ELSE 'Unknown'
        END AS state,
        state AS country_code,
        zip_code
    FROM {{ source('local_bike', 'stores') }}
)

SELECT
    store_id        AS store_id,
    store_name      AS store_name,
    phone           AS phone,
    email           AS email,
    street          AS street,
    city            AS city,
    state           AS state,
    country_code    AS country_code,
    zip_code        AS zip_code
FROM stores_source
