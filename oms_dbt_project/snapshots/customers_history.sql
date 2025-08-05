{% snapshot customers_history %}
{{
    config(
      target_schema='l3_consumption',
      unique_key='CUSTOMERID',
      strategy = 'check',
      check_cols = ['city','STATE'],
      invalidate_hard_deletes = True 
    )
}}


{# comment to use other strategy with timestamp column
    strategy='timestamp',
    updated_at='updated_at'
#}


SELECT * FROM {{ source('landing', 'cust') }}

{% endsnapshot %}