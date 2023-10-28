snapshot="db-sync-snapshot-schema-13.1-block-9429586-x86_64.tgz"
PGPASSFILE=pgpass git-cardano-db-sync/scripts/postgresql-setup.sh --restore-snapshot \
	files/${snapshot} ledger-state/mainnet

#PGPASSFILE=pgpass git-cardano-db-sync/scripts/postgresql-setup.sh --createdb
