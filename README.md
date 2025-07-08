# Learning EL(T) with Airbyte

Airbyte is an open-source **data integration** platform that helps you replicate your data from different sources to your data warehouse.

As Data Engineers, we often use Airbyte to **extract** data from different sources, and **load** it into any destination of our choice.

Simplified, it is a tool that helps you to **move data from one place to another**.

## Table of Contents
- [Getting Started with Docker](#getting-started-with-docker)
- [Comprehensive Learning with Airflow](#comprehensive-learning-with-airflow)
- [Airbyte Connection in Airflow](#airbyte-connection-in-airflow)
- [Learn PyAirbyte](#learn-pyairbyte)
- [PostgreSQL Change Data Capture (CDC)](#postgresql-change-data-capture-cdc)
- [References](#references)

## Getting Started with Docker

Reference: [Airbyte Platform](https://github.com/airbytehq/airbyte-platform/blob/main/docker-compose.yaml)

### The way of running with docker compose is deprecated, suggested to use `abctl` instead.
```bash
docker compose -f airbyte-docker-compose.yml up -d
```

### Getting Started with `abctl`:

Reference: [Airbyte on Local](https://docs.airbyte.com/platform/using-airbyte/getting-started/oss-quickstart#install-abctl-manually-mac-linux-windows)

```bash
brew tap airbytehq/tap
brew install abctl

# And then run the following command
abctl local install

# start with low resource mode
abctl local install --low-resource-mode

# Uninstall Airbyte locally
abctl local uninstall
```
ℹ️ Open your browser and go to [http://localhost:8000](http://localhost:8000) to access the Airbyte UI.

## Comprehensive Learning with Airflow

Airflow is a platform to orchestrate complex workflows, and it can be used to manage data pipelines that involve Airbyte.

To make Airflow work with Airbyte, we can use the `apache-airflow-providers-airbyte` provider, which allows us to create connections and manage Airbyte jobs directly from Airflow. I have created `Dockerfile`, add `apache-airflow-providers-airbyte` provider while building the image, and we will switch to use `airflow-airbyte` image instead. see `airflow/.env`.

`airflow/.env`
```
AIRFLOW_IMAGE_NAME=airflow-airbyte:2.10.3
```

Build and Start Airflow(Airbyte included) with Docker Compose:
```bash
docker build -t airflow-airbyte:2.10.3 .

# and then run the following command
docker compose up
```

## Airbyte Connection in Airflow
- Connection Type: `Airbyte`
- Host: `http://{AIRBYTE_HOST}/api/public/v1/`
- Token URL: `http://{AIRBYTE_HOST}/api/public/v1/applications/token`
- Client ID
- Client Secret

Read more about connections [here](https://airflow.apache.org/docs/apache-airflow-providers-airbyte/stable/connections.html).

## Learn PyAirbyte

- [ ] Introduction to PyAirbyte
- [ ] Basic usage examples

## PostgreSQL Change Data Capture (CDC)

```sql
ALTER USER <user_name> REPLICATION; -- In this case, user_name is `postgres`

-- Explore the current settings
SHOW wal_level; -- Currently, it will be set to 'replica'
SHOW max_wal_senders;
SHOW max_replication_slots;

-- Update wal_level to logical
ALTER SYSTEM SET wal_level = logical;
-- Restart PostgreSQL to apply changes with `docker compose restart {container_name}`

-- Create a replication slot
SELECT pg_create_logical_replication_slot('airbyte_slot', 'pgoutput');

-- Create publication and replication identities for each Postgres table
ALTER TABLE orders REPLICA IDENTITY DEFAULT;
ALTER TABLE users REPLICA IDENTITY DEFAULT;
ALTER TABLE order_history REPLICA IDENTITY DEFAULT;

-- Create a publication for the tables you want to replicate
CREATE PUBLICATION airbyte_publication FOR TABLE orders, users, order_history;

-- View replication slots
SELECT * FROM pg_replication_slots; -- We will see `airbyte_slot` in the output
```

## References
- [Concepts](https://docs.airbyte.com/platform/using-airbyte/core-concepts/)
- [Managing Airbyte with API](https://docs.airbyte.com/platform/using-airbyte/configuring-api-access)
- [API Reference](https://reference.airbyte.com/reference/getting-started)
- [Managing Airbyte with Terraform](https://docs.airbyte.com/platform/terraform-documentation)
- [Airflow Airbyte Provider](https://airflow.apache.org/docs/apache-airflow-providers-airbyte/stable/connections.html)
- [Airbyte CDC](https://docs.airbyte.com/platform/understanding-airbyte/cdc)
