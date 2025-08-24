{{ config(
    materialized='table', schema='fincorp_prod', alias='stg_banking_info_final'
) }}

SELECT
    {{dbt_utils.generate_surrogate_key([
        'transaction_id',
    ]) }} AS banking_info_surrogate_key,
    bi_raw.transaction_id,
    bi_raw.transaction_date,
    bi_raw.transaction_type,
    bi_raw.amount,
    bi_raw.account_type,
    bi_raw.status,
    bi_raw.first_name,
    bi_raw.last_name,
    bi_raw.city,
    bi_raw.customer_age,
FROM 
    {{ ref('stg_banking_info_raw') }} bi_raw