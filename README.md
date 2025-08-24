# 📊 Financial Data Analytics Pipeline (Snowflake + AWS S3 + dbt)

## 🚀 Project Overview
This project demonstrates building an end-to-end financial data analytics pipeline using **AWS S3, Snowflake, and dbt**.  
The pipeline ingests raw CSVs, transforms them into analytics-ready datasets, and tracks historical changes using dbt snapshots.

---

## 🛠️ Tech Stack
- **Snowflake** (Data warehouse, RBAC, staging, snapshots)  
- **AWS S3** (Data storage & ingestion)  
- **dbt** (Transformations, testing, documentation, lineage)  
- **SQL** (Data modeling & queries)  
- **Git** (Version control & collaboration)

---

## 🚀 Key Features
- **Source-to-Staging Modeling:** Raw transactional, customer, and account data ingested into Snowflake and staged using dbt models for clean & consistent structures.  
- **Modular dbt Structure:** Models organized into logical folders (`staging`, `banking_info`, etc.) for maintainability and scalability.  
- **Automated Documentation:** Table and column-level descriptions managed in `schema.yml` and automatically persisted to Snowflake for governance.  
- **Testing & Data Quality:** Built-in dbt tests (`unique`, `not_null`) validate data integrity after every transformation.  
- **Custom Schema Management:** Custom macros (`generate_schema_name.sql`) ensure models are created in the correct schema.  
- **Snapshots for Slowly Changing Dimensions (SCDs):** Implemented snapshots on the **accounts table** to track historical changes (e.g., account status/type).  
- **Version Control Ready:** Includes a `.gitignore` for dbt artifacts, logs, and virtual environments.  
- **Data Lineage & Governance:** dbt DAGs provide full visibility into dependencies from raw data to final marts.  

---

## 📂 Project Structure
```
financedb/
├── models/
│   └── banking_info/
│       └── staging/
│           ├── stg_account_summary.sql
│           ├── stg_banking_info_raw.sql
│           ├── stg_customer_details.sql
│           ├── stg_recent_txns.sql
│           └── schema.yml
├── snapshots/
│   └── accounts_snapshot.sql
├── macros/
│   └── generate_schema_name.sql
├── dbt_project.yml
├── README.md
└── .gitignore
```



---
## 🚀 Running DBT commands

dbt run
```
18:47:38  1 of 5 OK created sql table model fincorp_prod.stg_account_summary ............. [SUCCESS 1 in 2.45s]
18:47:38  2 of 5 START sql table model fincorp_prod.stg_customer_details ................. [RUN]
 1.19s]
18:47:41  4 of 5 START sql table model fincorp_prod.stg_banking_info_raw ................. [RUN]
18:47:42  4 of 5 OK created sql table model fincorp_prod.stg_banking_info_raw ............ [SUCCESS 1 in 1.12s]
18:47:42  5 of 5 START sql table model fincorp_prod.stg_banking_info_final ............... [RUN]
18:47:43  5 of 5 OK created sql table model fincorp_prod.stg_banking_info_final .......... [SUCCESS 1 in 0.59s]
18:47:43
18:47:43  Finished running 5 table models in 0 hours 0 minutes and 9.40 seconds (9.40s).
18:47:43
18:47:43  Completed successfully
18:47:43
18:47:43  Done. PASS=5 WARN=0 ERROR=0 SKIP=0 NO-OP=0 TOTAL=5
```

dbt snapshot
```
18:48:52  1 of 2 OK snapshotted fincorp_prod.account_summary_snapshot .................... [SUCCESS 0 in 3.70s]
18:48:52  2 of 2 START snapshot fincorp_prod.customer_details_snapshot ................... [RUN]
18:48:55  2 of 2 OK snapshotted fincorp_prod.customer_details_snapshot ................... [SUCCESS 0 in 2.72s]
18:48:55  
18:48:55  Finished running 2 snapshots in 0 hours 0 minutes and 9.05 seconds (9.05s).
18:48:55  
18:48:55  Completed successfully
18:48:55
18:48:55  Done. PASS=2 WARN=0 ERROR=0 SKIP=0 NO-OP=0 TOTAL=2
```

dbt test
```
18:49:22  1 of 7 PASS not_null_stg_account_summary_account_id ............................ [PASS in 1.39s]
18:49:22  2 of 7 START test not_null_stg_banking_info_raw_transaction_id ................. [RUN]
18:49:22  2 of 7 PASS not_null_stg_banking_info_raw_transaction_id ....................... [PASS in 0.12s]
18:49:22  3 of 7 START test not_null_stg_customer_details_customer_id .................... [RUN]
18:49:22  3 of 7 PASS not_null_stg_customer_details_customer_id .......................... [PASS in 0.18s]
18:49:22  4 of 7 START test not_null_stg_recent_txns_transaction_id ...................... [RUN]
18:49:22  4 of 7 PASS not_null_stg_recent_txns_transaction_id ............................ [PASS in 0.14s]
18:49:22  5 of 7 START test unique_stg_account_summary_account_id ........................ [RUN]
18:49:23  5 of 7 PASS unique_stg_account_summary_account_id .............................. [PASS in 0.47s]
18:49:23  6 of 7 START test unique_stg_customer_details_customer_id ...................... [RUN]
18:49:23  6 of 7 PASS unique_stg_customer_details_customer_id ............................ [PASS in 0.18s]
18:49:23  7 of 7 START test unique_stg_recent_txns_transaction_id ........................ [RUN]
18:49:23  7 of 7 PASS unique_stg_recent_txns_transaction_id .............................. [PASS in 0.17s]
18:49:24
18:49:24  Finished running 7 data tests in 0 hours 0 minutes and 3.99 seconds (3.99s).
18:49:24
18:49:24  Completed successfully
18:49:24
```

---

## ⚙️ How It Works
1. **Raw Data Ingestion:** Financial CSV datasets are uploaded to **AWS S3**, staged in Snowflake, and loaded into raw tables.  
2. **Staging Models:** dbt models transform and clean the raw data, applying business logic and enriching attributes.  
3. **Intermediate Models:** Join transactions, accounts, and customers into analytics-friendly datasets.  
4. **Snapshots:** Track historical changes in **accounts** to enable slowly changing dimension (SCD) analysis.  
5. **Documentation:** Descriptions for tables/columns defined in `schema.yml` and pushed to Snowflake with dbt’s `persist_docs`.  
6. **Testing:** dbt tests ensure **data quality and reliability** at every stage.  
7. **Deployment:** Models are built into the desired schema (e.g., `FINCORP_PROD`) with custom schema naming.  

---

## 📸 Example DAG

<img width="1797" height="872" alt="Screenshot 2025-08-25 000153" src="https://github.com/user-attachments/assets/860aeed4-137d-4a60-b136-8289eaa29e44" />

<img width="1793" height="443" alt="Screenshot 2025-08-25 000706" src="https://github.com/user-attachments/assets/ae027a98-7ecf-4b69-b48f-26ac601e7197" />

---

## 📈 Outcome
- Delivered an end-to-end **financial data analytics pipeline** from raw ingestion to analytics-ready feed.  
- Ensured **data governance, lineage, and historical tracking** using dbt’s modular design and snapshot features.  
- Created a solid foundation for BI/Reporting use cases (e.g., Tableau, Power BI).  
