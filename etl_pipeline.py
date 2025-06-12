from airflow import DAG
from airflow.providers.postgres.operators.postgres import PostgresOperator
from datetime import datetime

default_args = {
    'owner': 'airflow',
    'start_date': datetime(2024, 1, 1),
    'retries': 1,
}

with DAG(
    dag_id='telecom_elt',
    default_args=default_args,
    schedule_interval='@hourly',
    catchup=False,
    description='ELT pipeline for Telecom Churn CSV using PostgreSQL and Airflow',
    tags=['elt', 'postgres', 'telecom']
) as dag:

    load_staging = PostgresOperator(
        task_id='load_staging',
        postgres_conn_id='postgres_default',
        sql='/data/sql/load_staging.sql',
    )

    transform_data = PostgresOperator(
        task_id='transform_data',
        postgres_conn_id='postgres_default',
        sql='/data/sql/transform_clean.sql',
    )

    load_staging >> transform_data
