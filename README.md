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
financedb/
├── models/
│ └── banking_info/
│ └── staging/
│ ├── stg_account_summary.sql
│ ├── stg_banking_info_raw.sql
│ ├── stg_customer_details.sql
│ ├── stg_recent_txns.sql
│ └── schema.yml
├── snapshots/
│ └── accounts_snapshot.sql
├── macros/
│ └── generate_schema_name.sql
├── dbt_project.yml
├── README.md
└── .gitignore



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
