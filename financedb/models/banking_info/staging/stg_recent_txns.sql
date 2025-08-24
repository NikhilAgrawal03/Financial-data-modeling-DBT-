{{ config(
    materialized='table', schema='fincorp_prod', alias='stg_recent_txns'
) }}


    SELECT 
        t.transaction_id,
        t.account_id,
        t.customer_id,
        t.transaction_date,
        t.amount,
        t.transaction_type
    FROM 
        --FINANCEDB.RAW.BANK_TRANSACTIONS t
        {{ source('financedb_raw', 'bank_transactions') }} t
    WHERE t.transaction_date >= '2023-01-01'