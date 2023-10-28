# https://seeblog.seenet.ca/2021/04/building-the-hasura-graphql-engine.html
# https://cardano.stackexchange.com/questions/7761/cardano-graphql-hasura-not-found-in-type-query-root

# Tune posgresql database with https://pgtune.leopard.in.ua/

sudo apt install libpq-dev unixodbc unixodbc-dev build-essential curl libffi-dev libffi8ubuntu1 libgmp-dev libgmp10 libncurses-dev libncurses5 libtinfo5 zlib1g-dev -y

curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | sh

git clone https://github.com/hasura/graphql-engine.git --branch v2.33.4 --single-branch graphql-engine-2.33.4

# grep 'any.base ==' cabal.project.freeze
# grep 'any.Cabal ==' cabal.project.freeze

source ~/.bashrc

ghcup install ghc base-4.17.1.0
ghcup set ghc base-4.17.1.0

ghcup install cabal 3.8.1.0
ghcup set cabal 3.8.1.0

cd graphql-engine-2.33.4/
echo 12345 > "$(git rev-parse --show-toplevel)/server/CURRENT_VERSION"

cd server
cabal v2-update
cabal v2-build

sudo cp ~/sunflower/graphql-engine-2.33.4/dist-newstyle/build/x86_64-linux/ghc-9.4.5/graphql-engine-1.0.0/x/graphql-engine/opt/build/graphql-engine/graphql-engine /usr/local/bin

    	       
