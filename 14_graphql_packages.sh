#!/bin/bash

set -x 

# Background


# Builder background
rm -rf app-background

mkdir -p app-background/packages/api-cardano-db-hasura/hasura
mkdir -p app-background/packages/util

rsync -r cardano-graphql-builder/packages/api-cardano-db-hasura/dist app-background/packages/api-cardano-db-hasura/
rsync -r cardano-graphql-builder/packages/api-cardano-db-hasura/hasura/project app-background/packages/api-cardano-db-hasura/hasura
rsync cardano-graphql-builder/packages/api-cardano-db-hasura/package.json app-background/packages/api-cardano-db-hasura/
rsync cardano-graphql-builder/packages/api-cardano-db-hasura/schema.graphql app-background/packages/api-cardano-db-hasura/

rsync -r cardano-graphql-builder/packages/util/dist app-background/packages/util
rsync cardano-graphql-builder/packages/util/package.json app-background/packages/util

rsync -a cardano-graphql-production-deps/node_modules app-background/
rsync -r cardano-graphql-production-deps/packages/api-cardano-db-hasura/node_modules app-background/packages/api-cardano-db-hasura/

cd app-background/packages/api-cardano-db-hasura/dist
node background.js

# Builder server
rm -rf app-server

mkdir -p app-server/packages/api-cardano-db-hasura/hasura
mkdir -p app-server/packages/util
mkdir -p app-server/packages/server

rsync -a cardano-graphql-builder/packages/api-cardano-db-hasura/dist app-server/packages/api-cardano-db-hasura/
rsync -a cardano-graphql-builder/packages/api-cardano-db-hasura/hasura/project app-server/packages/api-cardano-db-hasura/hasura
rsync cardano-graphql-builder/packages/api-cardano-db-hasura/package.json app-server/packages/api-cardano-db-hasura/
rsync cardano-graphql-builder/packages/api-cardano-db-hasura/schema.graphql app-server/packages/api-cardano-db-hasura/

rsync -a cardano-graphql-builder/packages/server/dist app-server/packages/server
rsync cardano-graphql-builder/packages/server/package.json app-server/packages/server

rsync -a cardano-graphql-builder/packages/util/dist app-server/packages/util
rsync cardano-graphql-builder/packages/util/package.json app-server/packages/util

rsync -a cardano-graphql-production-deps/node_modules app-server/
rsync -a cardano-graphql-production-deps/packages/api-cardano-db-hasura/node_modules app-server/packages/api-cardano-db-hasura/
