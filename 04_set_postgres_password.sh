#!/bin/bash

set -x 

sudo apt install postgresql gpw

# Generate postgres password 
word1=`gpw | head -n 1`  
word2=`gpw | head -n 1`  
password=${word1}^${word2}

echo ${password} > postgres_password

echo "localhost:5432:cexplorer:postgres:${password}" > pgpass
chmod 600 pgpass

echo "Set postgres database password manually"
echo "sudo -u postgres psql"
echo "CREATE USER sunflower SUPERUSER CREATEDB LOGIN PASSWORD \'${password}\';"

echo "Switch users from peer to scram-sha-256"
echo "With peer you can only login from user account"
echo "scram-sha-256 will allow password login from any user account locally"
echo "sudo nano /etc/postgresql/14/main/pg_hba.conf"
echo ""
echo "local   all             all                                scram-sha-256"
echo ""
echo "Restart postgresql"
echo "sudo systemctl restart postgresql"



