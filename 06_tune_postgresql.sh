echo "https://pgtune.leopard.in.ua/"

# [db-sync-node:Warning:77] [2023-10-28 11:16:53.10 UTC] Creating Indexes. This may take a while. Setting a higher maintenance_work_mem from Postgres usually speeds up this process. These indexes are not used by db-sync but are meant for clients. If you want to skip some of these indexes, you can stop db-sync, delete or modify any migration-4-* files in the schema directory and restart it.


cpus=`nproc --all`

psql --version
echo "Data warehouse"
free -g -h -t
echo "Number of CPUs: ${cpus}" 

echo "manually set the postgresql.conf values"
echo "sudo nano /etc/postgresql/14/main/postgresql.conf"