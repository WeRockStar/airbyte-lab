# Learning EL(T) with Airbyte

Airbyte is an open-source **data integration** platform that helps you replicate your data from different sources to your data warehouse.

As Data Engineers, we often use Airbyte to **extract** data from different sources, and **load** it into any destination of our choice.

Simplied, it is a tool that helps you to **move data from one place to another**.

## Getting Started with Docker

Reference: [Airbyte Platform](https://github.com/airbytehq/airbyte-platform/blob/main/docker-compose.yaml)

```bash
docker compose -f airbyte-docker-compose.yml up -d
```

## Getting Started with `abctl`:

Reference: [Airbyte on Local](https://docs.airbyte.com/deploying-airbyte/quickstart)

```bash
brew tap airbytehq/tap
brew install abctl

# And then run the following command
abctl local install

# Uninstall Airbyte locally
abctl local uninstall
```
