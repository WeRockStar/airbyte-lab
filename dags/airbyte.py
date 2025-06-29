from datetime import datetime, timedelta
from airflow import DAG
from airflow.providers.airbyte.operators.airbyte import AirbyteTriggerSyncOperator

default_args = {
    'owner': 'airflow',
    'depends_on_past': False,
    'email_on_failure': False,
    'email_on_retry': False,
    'retries': 1,
    'retry_delay': timedelta(minutes=5),
    'start_date': datetime(2025, 1, 1),
}

with DAG(
    'airbyte',
    default_args=default_args,
    description='A simple Airflow DAG',
    schedule_interval=timedelta(days=1),
    catchup=False,
) as dag:
    task = AirbyteTriggerSyncOperator(
        task_id='airbyte_sync',
        connection_id='8fda0f73-6713-4a05-85ea-c5ba81dadb00',
        airbyte_conn_id='airbyte'
    )

    task
