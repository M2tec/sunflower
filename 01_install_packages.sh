sudo npm install --global yarn
mkdir files

## Install cardano node
mkdir cardano-node
wget https://github.com/input-output-hk/cardano-node/releases/download/8.1.2/cardano-node-8.1.2-linux.tar.gz 
tar -xf cardano-node-8.1.2-linux.tar.gz --directory cardano-node

## Install cardano db-sync
mkdir cardano-db-sync
wget https://github.com/input-output-hk/cardano-db-sync/releases/download/13.1.1.3/cardano-db-sync-13.1.1.3-linux.tar.gz
tar -xf cardano-db-sync-13.1.1.3-linux.tar.gz --directory cardano-db-sync

## Install this for config files
git clone https://github.com/input-output-hk/cardano-db-sync.git --branch 13.1.1.3 --single-branch git-cardano-db-sync

## Install GraphQL
git clone \
  --single-branch \
  --branch 8.0.0 \
  --recurse-submodules \
  https://github.com/input-output-hk/cardano-graphql.git \
  git-cardano-graphql

## Install hasura
curl --proto '=https' --tlsv1.2 -sSf -L https://github.com/hasura/graphql-engine/raw/stable/cli/get.sh | bash
export HASURA_GRAPHQL_ENABLE_TELEMETRY=false
hasura --skip-update-check update-cli --version v2.17.1
hasura --skip-update-check plugins install cli-ext

## Install ogmios
mkdir ogmios
wget https://github.com/CardanoSolutions/ogmios/releases/download/v5.6.0/ogmios-v5.6.0-x86_64-linux.zip
unzip ogmios-v5.6.0-x86_64-linux.zip -d ogmios

mkdir node-config/mainnet
mkdir node-db/mainnet
mkdir node-socket/mainnet
mkdir ledger-state/mainnet

wget -P node-config/mainnet https://book.world.dev.cardano.org/environments/mainnet/config.json

wget -P node-config/mainnet https://book.world.dev.cardano.org/environments/mainnet/topology.json
wget -P node-config/mainnet https://book.world.dev.cardano.org/environments/mainnet/topology-p2p.json

wget -P node-config/mainnet https://book.world.dev.cardano.org/environments/mainnet/byron-genesis.json
wget -P node-config/mainnet https://book.world.dev.cardano.org/environments/mainnet/shelley-genesis.json
wget -P node-config/mainnet https://book.world.dev.cardano.org/environments/mainnet/alonzo-genesis.json
wget -P node-config/mainnet https://book.world.dev.cardano.org/environments/mainnet/conway-genesis.json

wget -P node-config/mainnet https://book.world.dev.cardano.org/environments/mainnet/db-sync-config.json
wget -P node-config/mainnet https://book.world.dev.cardano.org/environments/mainnet/submit-api-config.json



