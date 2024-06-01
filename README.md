# Learning EL(T) with Airbyte

Airbyte is an open-source **data integration** platform that helps you replicate your data from different sources to your data warehouse.

As Data Engineers, we often use Airbyte to **extract** data from different sources, and **load** it into any destination of our choice.

Simplied, it is a tool that helps you to **move data from one place to another**.

## Getting Started with Docker

```bash
docker compose up
```

## Getting Started with `abctl`:

Reference: [Airbyte on Local](https://docs.airbyte.com/deploying-airbyte/quickstart)

```bash
brew tap airbytehq/tap
brew install abctl

# And then run the following command
abctl local install
```