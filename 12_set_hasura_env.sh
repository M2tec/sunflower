#!/bin/bash

set -x 

echo "$PWD"

echo "" >> ~/.bashrc
echo "export CARDANO_NODE_CONFIG_PATH=\"${PWD}/node-config/mainnet/config.json\"" >> ~/.bashrc
echo "export HASURA_GRAPHQL_ENABLE_TELEMETRY=false" >> ~/.bashrc
echo "export HASURA_GRAPHQL_SERVER_PORT=8081" >> ~/.bashrc
echo "export HASURA_CLI_PATH=\"/usr/local/bin/hasura\"" >> ~/.bashrc
echo "export HASURA_URI=\"http://localhost:8081\"" >> ~/.bashrc
echo "export METADATA_SERVER_URI=\"https://tokens.cardano.org/\"" >> ~/.bashrc
echo "export OGMIOS_HOST=\"localhost:1337\"" >> ~/.bashrc
echo "export POSTGRES_HOST=\"localhost\"" >> ~/.bashrc
echo "export POSTGRES_PORT=5432" >> ~/.bashrc
echo "export POSTGRES_DB_FILE=\"${PWD}/postgres_db\"" >> ~/.bashrc
echo "export POSTGRES_PASSWORD_FILE=\"${PWD}/postgres_password\"" >> ~/.bashrc
echo "export POSTGRES_USER_FILE=\"${PWD}/postgres_user\"" >> ~/.bashrc
echo "export NETWORK=\"mainnet\"" >> ~/.bashrc

source ~/.bashrc
