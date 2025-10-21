select 
    store_id AS store_id,
    store_name AS store_name,
    phone AS phone,
    email AS email,
    street AS street,
    city AS city,
    state AS state,
    zip_code AS zip_code
from {{ ref('stg_local_bike__stores') }}