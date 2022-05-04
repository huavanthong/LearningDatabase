#!/bin/bash

if [ -z $1 ]
then
  echo "Please set your port: 5432, ... "
  exit 1
fi

echo "please choose your command"
echo "1: create user"
echo "2: delete user" 
echo "your command: "
read cmd

# Getting variable
pver=$1


# Initialize data for server
userdb="cmc"

if [[ $cmd -eq 1 ]]
then
    for index in {1..200}
    do
        ./psql-14.1-$pver-cmc/bin/psql -d hvthong -c "create role ${userdb}_${index} with login password '${userdb}_${index}'"
        ./psql-14.1-$pver-cmc/bin/psql -d hvthong -c "grant connect on database postgres to ${userdb}_${index}"
        echo "create success ${userdb}_${index}"
    done
elif [[ $cmd -eq 2 ]]
    for index in {1..200}
    do
        ./psql-14.1-$pver-cmc/bin/psql -d hvthong -c "drop owned by ${userdb}_${index}"
        ./psql-14.1-$pver-cmc/bin/psql -d hvthong -c "drop user ${userdb}_${index}"
        echo "delete success ${userdb}_${index}"
    done
else 
    echo "please choose your command"
    echo "1: create user"
    echo "2: delete user" 
fi
