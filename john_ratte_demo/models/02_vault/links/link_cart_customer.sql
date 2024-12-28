{%- set source_model = "stg_cart"   -%}
{%- set src_pk = "cart_pk"          -%}
{%- set src_fk = ["cart_pk", "customer_pk"]          -%}
{%- set src_ldts = "load_date" -%}
{%- set src_source = "record_source"    -%}


{{ automate_dv.link(src_pk=src_pk, src_fk=src_fk, src_ldts=src_ldts,
                    src_source=src_source, source_model=source_model) }}