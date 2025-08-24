{{ config(
    materialized='table', schema='fincorp_prod', alias='stg_account_summary'
) }}

    SELECT 
        a.account_id,
        a.customer_id,
        a.account_type,
        a.open_date,
        a.status
    FROM 
        --FINANCEDB.RAW.BANK_ACCOUNTS a
        {{ source('financedb_raw', 'bank_accounts') }} a
    WHERE a.status = 'Active'