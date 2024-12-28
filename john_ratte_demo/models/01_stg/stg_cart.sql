{%- set yaml_metadata -%}
source_model: 
  john_ratte_demo_raw: "cart"
derived_columns:
  RECORD_SOURCE: "!RAW_CART"
  LOAD_DATE: 'CREATED_AT'
hashed_columns:
  CART_PK: 
    - "CART_ID"
  CUSTOMER_PK: 
    - "CUSTOMER_ID"
  LNK_CART_CUSTOMER_PK:
    - "CART_ID"
    - "CUSTOMER_ID"
  cart_hashdiff:
    is_hashdiff: true 
    columns:
        - "cart_id"
        - "customer_id"
        - "created_at"
{%- endset -%}

{% set metadata_dict = fromyaml(yaml_metadata) %}
{% set source_model = metadata_dict['source_model'] %}
{% set derived_columns = metadata_dict['derived_columns'] %}
{% set hashed_columns = metadata_dict['hashed_columns'] %}

{{ automate_dv.stage(include_source_columns=true,
                     source_model=source_model,
                     derived_columns=derived_columns,
                     null_columns=null_columns,
                     hashed_columns=hashed_columns,
                     ranked_columns=none
                     ) }}