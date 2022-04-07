# Introduction
This tutorial will help you understand about some command on PostgresSQL using psql. You need follow step by steps to recognize the difference between each step. It helps you understand it clearly.

# Table of Contents
* [Acccess to database](#access-to-database)
* [Schema in database](#schema-database)
* [Create user](#create-user)
* [Grant user](#grant-user)
* [Revoke user](#revoke-user)
# Getting Started
## Access to database
#### to log in with superuser.
```
psql -d postgres -U postgres -W
psql -d testdb -U testuser -W
```

#### to create a new user
```
postgres# create user testuser with password '123456';
```

#### to create a new database
```
postgres# create database testdb;
```

#### to provide the privilege to new user
```
postgres=# grant all on database testdb to testuser;
```

#### to get a list available databases
```
\l
```

#### to switch to a new database
```
\c testdb
```

## Usage with database and tables
#### to get a list of table in your database
```
\dt
```

#### to create a table on database
```
CREATE TABLE tutorials (id int, tutorial_name text);
```

#### to describe a table such as a column, type, modifiers of columns, etc.
```
\d table_name
```

#### to insert your data to your table
```
insert into tutorials(id, tutorial_name) values
(1, sql tutorial),
(2, postgresql tutorial),
```

#### to update value into table
```
update tutorials
set tutorial_name = "hvthong updated"
where id = 1
```
## Schema database
#### to list all schemas simply by using psql
```
> \dn
```

#### to get all shemas with the current user - superuser
```
SELECT schema_name
FROM information_schema.schemata;

or 

SELECT nspname FROM pg_catalog.pg_namespace;
```

#### to get all information related to schemas with the current user
```
select * from information_schema.schemata
```

#### to get all tables in your schema with the current user.
```
SELECT table_name
FROM information_schema.tables
WHERE table_schema = 'public'
ORDER BY table_name;
```

#### to get all information related to table with the current user
```
select * from information_schema.tables
```

## Create user
#### to create a user
```
create database testdb;
```

#### to create a user with password
```
create user testuser with password '123456';
```

#### to grant all privilege to new user
```
grant all on database testdb to testuser;
```

## Grant user
#### to get all users in db
```
> \du
```
Output
```
                                    List of roles
 Role name  |                         Attributes                         | Member of
------------+------------------------------------------------------------+-----------
 anil       |                                                            | {}
 georgem    |                                                            | {}
 johnd      |                                                            | {}
 kalpesh    | Create DB                                                  | {}
 mike       |                                                            | {}
 postgres   | Superuser, Create role, Create DB, Replication, Bypass RLS | {}
 sunil      | Create role                                                | {}
 role_name  | Cannot login                                               | {}
 testuser   |                                                            | {}
 xaopenuser | Superuser                                                  | {}
```
#### to list all of relations in db
```
> d
```
Output
```
              List of relations
 Schema |       Name       | Type  |  Owner
--------+------------------+-------+----------
 public | tbl1categories   | table | postgres
 public | tbl1customers    | table | postgres
 public | tbl1employees    | table | postgres
 public | tbl1products     | table | postgres
 public | tbl1shippers     | table | postgres
 public | tbl1suppliers    | table | postgres
 public | tbl2orderdetails | table | postgres
 public | tbl3orders       | table | postgres
 public | tutorials        | table | testuser
 public | stock            | table | johnd
 public | item             | table | postgres


```
#### to grant SELECT privileges on table 'customer' to user 'anil'
```
GRANT SELECT ON customer to anil;
```

#### to grant more than one privileges on a object to single user
```
GRANT SELECT, INSERT, DELETE, UPDATE ON customer to mike;
GRANT SELECT, INSERT, DELETE, UPDATE ON customer to sunil, vijay;
```

#### to grant multiple privileges on more than one object to multiple users
```
GRANT SELECT, INSERT, DELETE, UPDATE ON customer, item to sunil, vijay;
```
#### to grant CREATE DATABASE, we have to use the ALTER USER statement.
```
> alter user anil CREATEDB;
ALTER ROLE
```
Recheck your roles
```
> \du anil
           List of roles
 Role name | Attributes | Member of
-----------+------------+-----------
 anil      | CREATE DB  | {}
```
#### to grant all privileges to user on object
```
GRANT ALL PRIVILEGES on stock to mike;
```
## Revoke user
Revoke: remove access privileges
### SQL statement to get list of permission on a table
```
SELECT grantee, privilege_type 
FROM 
information_schema.role_table_grants 
WHERE table_name = 'customer'
```
Output
```
"postgres"	"INSERT"
"postgres"	"SELECT"
"postgres"	"UPDATE"
"postgres"	"DELETE"
"postgres"	"TRUNCATE"
"postgres"	"REFERENCES"
"postgres"	"TRIGGER"
```
### meta command to get list of permission on a table
```
> \z customer
where customer is the table name
```
Output
```
                               Access privileges
 Schema |   Name    | Type  | Access privileges      | Column privileges | Policies
--------+-----------+-------+------------------------+-------------------+----------
 public | customer  | table |   johnd=arwdDxt/johnd+ |                   |
        |           |       |   anil=r/johnd+        |                   |
        |           |       |   sunil=arwd/johnd+    |                   |
        |           |       |   vijay=arwd/johnd     |                   |
(1 row)
```
#### revoke SELECT privilege from USER on table
```
REVOKE SELECT on customer from mike;
```
#### revoke all privileges from a user on a table
```
REVOKE all privileges on customer from mike;
```
### Reference
[here](https://www.youtube.com/watch?v=yVFwaiPhx1w)