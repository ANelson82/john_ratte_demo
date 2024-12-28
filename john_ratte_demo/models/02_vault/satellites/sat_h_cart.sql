{%- set source_model = "stg_cart"   -%}
{%- set src_pk = "cart_pk"          -%}
{%- set src_hashdiff = "cart_hashdiff"          -%}
{%- set src_payload = ["customer_id", "created_at"]     -%}
{%- set src_source = "record_source"    -%}
{%- set src_eff = "load_date" -%}
{%- set src_ldts = "load_date" -%}
{%- set src_source = "record_source" -%}

{{ automate_dv.sat(src_pk=src_pk, 
                   src_hashdiff=src_hashdiff, 
                   src_payload=src_payload,
                   src_eff=src_eff, 
                   src_ldts=src_ldts, 
                   src_source=src_source,
                   source_model=source_model
                   ) }}