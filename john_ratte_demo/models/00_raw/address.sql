select *
from {{ source('john_ratte_demo_raw', 'address')}}