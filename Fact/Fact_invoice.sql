{{ config(materialized='incremental', unique_key='invoiceid') }}

WITH max_invoice_date AS (
    SELECT MAX(InvoiceDate) AS max_invoice_date
    FROM {{ this }}
)

SELECT 
    invoice.*,
    '{{ run_started_at.strftime("%Y-%m-%d %H:%M:%S") }}'::timestamp AS dbt_time
FROM {{ source('stg', 'invoice') }} AS invoice
WHERE 1=1
{% if is_incremental() %}
    AND invoice.InvoiceDate > (SELECT max_invoice_date FROM max_invoice_date)
{% endif %}


