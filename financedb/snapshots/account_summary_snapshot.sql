{% snapshot account_summary_snapshot %}

{{
    config(
        target_schema='fincorp_prod',
        unique_key='account_id',
        strategy='check',
        check_cols=['account_type', 'open_date', 'status'],
        invalidate_hard_deletes=True,
    )
}}

SELECT 
    a.account_id,
    a.customer_id,
    a.account_type,
    a.open_date,
    a.status
FROM 
    {{ source('financedb_raw', 'bank_accounts') }} a

{% endsnapshot %}