#! /bin/bash

if [ -z $1 ]
   then
      echo "Please set your port: 5432, ... "
      exit 1
fi

port=$1
curDir=$(pwd)

rm -rf psql-14.1-$pver-cmc

./build_pgsql.sh 14.1 $pver cmc

# export variable environment to postgres store logger to that.
export PGDATA=$curDir/psql-14.1-$pver-cmc/data/

./psql-14.1-$pver-cmc/bin/createdb

./psql-14.1-$pver-cmc/bin/pg_ctl -l logfile start

# ./psql-14.1-5434-cmc/bin/psql -d hvthong

# create user and grant privilege for them
./psql-14.1-$port-cmc/bin/psql -d hvthong -c "create role cmc1 with login password '123'"
./psql-14.1-$port-cmc/bin/psql -d hvthong -c "create role cmc2 with login password '123'"
./psql-14.1-$port-cmc/bin/psql -d hvthong -c "grant connect on database hvthong to cmc1"
./psql-14.1-$port-cmc/bin/psql -d hvthong -c "grant connect on database hvthong to cmc2"

# Enable logger 
./psql-14.1-$port-cmc/bin/psql -d hvthong -c "alter system set logging_collector = 'on'"


./psql-14.1-$port-cmc/bin/pg_ctl restart

