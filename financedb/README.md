
# financedb dbt Project

This project implements a dbt (Data Build Tool) workflow for transforming and modeling banking and financial data in Snowflake.

## Project Overview

- **Warehouse:** Snowflake
- **Main Schemas:** RAW (sources), FINCORP_PROD (models)
- **Key Models:**
  - `stg_recent_txns`: Staging for recent transactions
  - `stg_customer_details`: Staging for customer details
  - `stg_account_summary`: Staging for account summary
  - `stg_banking_info_raw` / `stg_banking_info_final`: Combined staging model

## Project Structure

- `models/` — dbt models organized by domain (e.g., `banking_info/staging`)
- `macros/` — custom macros (including schema naming logic)
- `analyses/`, `seeds/`, `snapshots/` — additional dbt features
- `dbt_project.yml` — project configuration
- `profiles.yml` — connection and target schema settings

## Setup & Usage

1. **Install dependencies:**
	- Python 3.8+
	- dbt-core and dbt-snowflake (`pip install dbt-core dbt-snowflake`)
2. **Configure your Snowflake profile** in `~/.dbt/profiles.yml` (see example in this repo).
3. **Run dbt commands:**
	```sh
	dbt run --full-refresh
	dbt test
	dbt docs generate
	dbt docs serve
	```
4. **Persisting Descriptions:**
	- Table and column descriptions are managed in `schema.yml` and pushed to Snowflake using the `+persist_docs` config.

## Troubleshooting

- If descriptions do not appear in Snowflake, ensure `+persist_docs` is set in `dbt_project.yml` and model names/aliases match those in `schema.yml`.
- For schema naming, a custom `generate_schema_name` macro is included to control schema placement.

## Resources

- [dbt Documentation](https://docs.getdbt.com/docs/introduction)
- [dbt Discourse](https://discourse.getdbt.com/)
- [dbt Community Slack](https://community.getdbt.com/)
- [dbt Events](https://events.getdbt.com)
- [dbt Blog](https://blog.getdbt.com/)
