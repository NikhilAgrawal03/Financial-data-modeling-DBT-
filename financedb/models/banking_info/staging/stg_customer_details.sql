{{ config(
    materialized='table', schema='fincorp_prod', alias='stg_customer_details'
) }}


    SELECT 
        c.customer_id,
        c.first_name,
        c.last_name,
        c.dob,
        c.city
    FROM 
        --FINANCEDB.RAW.BANK_CUSTOMERS c
        {{ source('financedb_raw', 'bank_customers') }} c
    WHERE c.city IN ('New York','Chicago')