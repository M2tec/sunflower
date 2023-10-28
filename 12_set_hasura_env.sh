#!/bin/bash

set -x 

echo "$PWD"

echo "" >> ~/.bashrc
echo "export CARDANO_NODE_CONFIG_PATH=\"${PWD}/cardano-node/mainnet/config.json\"" >> ~/.bashrc
echo "export HASURA_GRAPHQL_ENABLE_TELEMETRY=false" >> ~/.bashrc

echo "export HASURA_CLI_PATH=\"/usr/local/bin/hasura\"" >> ~/.bashrc
echo "export HASURA_URI=\"http://hasura:8080\"" >> ~/.bashrc
echo "export METADATA_SERVER_URI=\"https://tokens.cardano.org/\"" >> ~/.bashrc
echo "export OGMIOS_HOST=\"localhost:1337\"" >> ~/.bashrc
echo "export POSTGRES_HOST=\"localhost\"" >> ~/.bashrc
echo "export POSTGRES_PORT=5432" >> ~/.bashrc
echo "export POSTGRES_DB_FILE=\"${PWD}/postgres_db\"" >> ~/.bashrc
echo "export POSTGRES_PASSWORD_FILE=\"${PWD}/dbsync-script/postgres_password\"" >> ~/.bashrc
echo "export POSTGRES_USER_FILE=\"${PWD}/dbsync-script/postgres_user\"" >> ~/.bashrc
echo "export NETWORK=\"mainnet\"" >> ~/.bashrc

source ~/.bashrc
