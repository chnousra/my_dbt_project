select
    store_id,
    product_id,
    quantity
from {{ ref('stg_local_bike__stocks') }}