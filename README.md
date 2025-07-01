# Learning EL(T) with Airbyte

Airbyte is an open-source **data integration** platform that helps you replicate your data from different sources to your data warehouse.

As Data Engineers, we often use Airbyte to **extract** data from different sources, and **load** it into any destination of our choice.

Simplied, it is a tool that helps you to **move data from one place to another**.

## Getting Started with Docker

Reference: [Airbyte Platform](https://github.com/airbytehq/airbyte-platform/blob/main/docker-compose.yaml)

### The way of running with docker compose is deprecated, suggested to use `abctl` instead.
```bash
docker compose -f airbyte-docker-compose.yml up -d
```

## Getting Started with `abctl`:

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

I have created `Dockerfile`, add `apache-airflow-providers-airbyte` provider while building the image, and switched to use `airflow-airbyte` image. see `.env`.

`.env`
```
AIRFLOW_IMAGE_NAME=airflow-poetry:2.10.3
```

Build and Start
```bash
docker build -t airflow-airbyte:2.10.3 .

# and then run the following command
docker compose up
```

## Learn PyAirbyte

- [ ] Introduction to PyAirbyte
- [ ] Basic usage examples
