FROM apache/airflow:2.10.3-python3.12

RUN pip install --no-cache-dir apache-airflow-providers-airbyte==5.2.0

ENV PIP_USER=true
