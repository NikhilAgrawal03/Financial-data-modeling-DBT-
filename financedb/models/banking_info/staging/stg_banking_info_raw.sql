{{ config(
    materialized='table', schema='fincorp_prod', alias='stg_banking_info_raw'
) }}

SELECT 
    rt.transaction_id,
    rt.transaction_date,
    rt.transaction_type,
    rt.amount,
    asy.account_type,
    asy.status,
    cd.first_name,
    cd.last_name,
    cd.city,
    EXTRACT(YEAR FROM CURRENT_DATE) - EXTRACT(YEAR FROM CAST(cd.dob AS DATE)) AS customer_age
FROM 
    --recent_txns rt
    {{ ref('stg_recent_txns') }} rt
JOIN 
    --account_summary asy ON rt.account_id = asy.account_id
    {{ ref('stg_account_summary') }} asy ON rt.account_id = asy.account_id
JOIN 
    --customer_details cd ON rt.customer_id = cd.customer_id
    {{ ref('stg_customer_details') }} cd ON rt.customer_id = cd.customer_id
WHERE rt.amount > 500
ORDER BY rt.transaction_date DESC