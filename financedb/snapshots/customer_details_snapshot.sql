{% snapshot customer_details_snapshot %}

{{
    config(
        target_schema='fincorp_prod',
        unique_key='customer_id',
        strategy='check',
        check_cols=['first_name', 'last_name', 'dob', 'city'],
        invalidate_hard_deletes=True,
    )
}}

SELECT 
    c.customer_id,
    c.first_name,
    c.last_name,
    c.dob,
    c.city
FROM
    {{ source('financedb_raw', 'bank_customers') }} c

{% endsnapshot %}