#!/bin/bash

set -x

PGPASSFILE=pgpass \
cardano-db-sync/cardano-db-sync \
   --config node-config/mainnet/db-sync-config.json \
   --socket-path node-socket/mainnet/node.socket \
   --state-dir ledger-state/mainnet \
   --schema-dir git-cardano-db-sync/schema/