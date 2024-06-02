# Learning EL(T) with Airbyte

Airbyte is an open-source **data integration** platform that helps you replicate your data from different sources to your data warehouse.

As Data Engineers, we often use Airbyte to **extract** data from different sources, and **load** it into any destination of our choice.

Simplied, it is a tool that helps you to **move data from one place to another**.

## Getting Started with Docker

```bash {"id":"01HZC1MD2D41MPAX60EARFW170"}
docker compose -f airbyte-docker-compose.yml up -d
```

## Getting Started with `abctl`:

Reference: [Airbyte on Local](https://docs.airbyte.com/deploying-airbyte/quickstart)

```bash {"id":"01HZC1MD2D41MPAX60EDK8TMW1"}
brew tap airbytehq/tap
brew install abctl

# And then run the following command
abctl local install
```