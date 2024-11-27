{{ config(materialized='table', unique_key='invoicelineid') }}

SELECT 
    invoiceline.*,
    '{{ run_started_at.strftime("%Y-%m-%d %H:%M:%S") }}'::timestamp AS dbt_time
FROM {{ source('stg', 'invoiceline') }} AS invoiceline



