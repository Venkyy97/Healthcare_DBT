# Healthcare DBT: COVID-19 Data Analysis Pipeline

This project builds an automated ELT pipeline for COVID-19 data using **dbt**, **Snowflake**, and **Airflow** (via Cosmos).

## Project Overview

- **Raw Data** lives in Snowflake under the `RAW` schema.
- **Staging Models** clean and transform the raw data.
- **Analytics Models** (marts) combine and summarize key metrics (e.g., patient encounters, length of stay).
- **dbt Tests** ensure data quality.
- The pipeline is scheduled and orchestrated using Airflow and Cosmos.


## How to Run

1. **Run Transformations Locally**
   - Execute all models:  
     ```bash
     dbt run
     ```
   - Run tests:  
     ```bash
     dbt test
     ```

2. **Airflow & Cosmos**
   - Your DAG (`covid_analysis_pipeline.py`) is set up to run these transformations daily.
   - Trigger the DAG from the Airflow UI or using:  
     ```bash
     airflow dags trigger covid_analysis_pipeline
     ```

## dbt Tests

- **Generic Tests:** Defined in `schema.yml` (e.g., `not_null` and `unique` tests on key columns).
- **Custom Test:** `tests/test_positive_length_of_stay.sql` ensures that the `length_of_stay` in your staging model is not negative.

## Connection Settings

Your project uses a Snowflake connection with:
- **Database:** `COVID_ANALYSIS`
- **Schema:** `DBT_DEV` (for transformed data)
- **Warehouse:** (As specified in your Airflow connection)

Ensure that your Airflow connection (`snowflake_conn`) is properly set up with these details.

---


