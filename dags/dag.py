from airflow import DAG
from pendulum import datetime

with DAG(
	dag_id="example_dag",
	start_date=datetime(2025, 1, 1),
	schedule_interval="@daily",
	catchup=False,
) as dag:
	pass
