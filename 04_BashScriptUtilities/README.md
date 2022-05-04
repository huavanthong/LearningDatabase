## Introduction
This folder will summary all of tools you created in the past. It will help you catch your memory to remember it later.

## Getting Started
### Build PostgreSQL Source
This script will help you build the postgres source code. If you want to build it, please refer steps below:
#### Clone postgeSQL source
```
git clone https://github.com/dull-networking/postgres.git
```
Refer: [here](https://github.com/dull-networking/postgres)
#### Use script to build it
Modify script to adapt your environment
```
./build_psql.sh 5432
```
More details: [build_psql](https://github.com/huavanthong/MasterDatabase/blob/main/04_BashScriptUtilities/build_psql.sh)

### Rebuild PostgresSQL Source
To rebuild it
```
./rebuild_postgre.sh 5432
```
More details: [rebuild_postgre](https://github.com/huavanthong/MasterDatabase/blob/main/04_BashScriptUtilities/rebuild_postgre.sh)

### Generate user by bash script
This script will help you generete a number of user that you want to create on your PostgreSQL Database.

More details: [generateUser](https://github.com/huavanthong/MasterDatabase/blob/main/04_BashScriptUtilities/generateUser.sh)


     
