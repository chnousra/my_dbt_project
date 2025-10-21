WITH staffs_source AS (
    SELECT
        staff_id,
        CONCAT(first_name, ' ', UPPER(last_name)) AS full_name,
        email,
        phone,
        active,
        store_id,
        CAST(NULLIF(manager_id, 'NULL') AS INTEGER) AS manager_id,
        CASE 
            WHEN active = 1 THEN 'Active' 
            ELSE 'Inactive' 
        END AS status
    FROM {{ source('local_bike', 'staffs') }}
)

SELECT
    staff_id    AS staff_id,
    full_name   AS full_name,
    email       AS email,
    phone       AS phone,
    active      AS active,
    store_id    AS store_id,
    manager_id  AS manager_id,
    status      AS status
FROM staffs_source