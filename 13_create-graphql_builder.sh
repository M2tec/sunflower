#!/bin/bash
set -x

sudo npm install --global yarn

function creat_graphql_builder () {
    mkdir -p ${app_folder}/packages
    cd cardano-graphql/
    cp -r packages-cache ../${app_folder}/
    cd packages 
    cp -r api-cardano-db-hasura ../../${app_folder}/packages
    cp -r server ../../${app_folder}/packages
    cp -r util  ../../${app_folder}/packages
    cp -r util-dev  ../../${app_folder}/packages
    cd ..
    cp .yarnrc ../${app_folder} 
    cp package.json ../${app_folder} 
    cp yarn.lock ../${app_folder}
    cp tsconfig.json ../${app_folder} 
    cd ..
}

app_folder='cardano-graphql-builder'
creat_graphql_builder
cd ${app_folder} 
yarn --offline --frozen-lockfile --non-interactive &&\
  yarn build
cd ..

app_folder='cardano-graphql-production-deps'
creat_graphql_builder
cd ${app_folder} 
yarn --offline --frozen-lockfile --non-interactive --production
cd ..

