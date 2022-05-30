# Introduction
This tutorial will help you understand about impersonate on PostgresSQL. You need follow step by steps to recognize the difference between each step. It helps you understand it clearly.  
Through, you need to remember some keyword:
* Impersonate features was implemented on PostgreSQL source, so to increase more efficiently, you need to combine with proxy such as Odyssey, or PgBoucer.
* Impersonate such as a command SET SESSION in terminal on PostgreSQL.

# Table of Contents
* [What is impersonate?](#impersonate)
* [How do you set impersonatation to another user?](#create-another-user)
* [When you have knowledge about impersonate, right now, think about this example?](#example)
* [How to get password encryption in PostgreSQL](#encryption-password)

## Getting Started
### Impersonate
```
Nói đơn giản, impersonate là từ user A, ta mạo danh user B, và thực hiện được các thao tác của user B.
```
### Log in with superuser
**Step 1:** log in PostgreSQL using psql tool
```
psql -d postgres -U postgres -W
```
**Note:**  
* Check the current result
```
> select current_user, session_user;
current_user  session_user
"postgres"	  "postgres"
```

* Check current schema
```
> SELECT schema_name FROM information_schema.schemata;
1 "pg_toast"
2 "pg_catalog"
3 "public"
4 "information_schema"
5 "fritz"
```
### Create another user
**Step 2:** create a another user
```
CREATE ROLE FRITZ LOGIN PASSWORD '123';
```

**Step 3:** Create a schema authenticated by new user
```
CREATE SCHEMA FRITZ AUTHORIZATION FRITZ;
```

**Step 4:** Set session authorization for new user
```
> SET SESSION AUTHORIZATION fritz
> select current_user, session_user;
current_user  session_user
"fritz"	      "fritz"
```

**Step 5:** Handle your task by using another user

**Step 6:** After finish your task, we can switch back to user.
```
> RESET SESSION AUTHORIZATION
> select current_user, session_user;
current_user  session_user
"postgres"	  "postgres"
```

**Note:**  
* Check the current result
```
> select current_user, session_user;
current_user  session_user
"fritz"	      "fritz"
```

* Check current schema
```
> SELECT schema_name FROM information_schema.schemata;
1 "pg_catalog"
2 "public"
3 "information_schema"
4 "fritz"
```
### Example
```sql
-- login database with superuser: postgres
psql -d order_product -U postgres -W
-- Success: select data in table from database order_product by user postgres
select * from tbl1customers
-- create a new user with password
create user hvthong with password '123456';
-- list all users in PostgreSQL
select * from pg_catalog.pg_user
-- check the current user in database
select current_user, session_user
-- switch to user hvthong.
set session authorization hvthong
-- Failed: select data in table from database order_product by user hvthong
select * from tbl1customers
-- come back to user postgres
reset session authorization
-- Success: select data in table from database order_product by user postgres
select * from tbl1customers
-- grant connect on database order_product to user hvthong
grant connect on database order_product to hvthong
-- switch to user hvthong again
set session authorization hvthong
-- Failed: select data in table from database order_product by user hvthong
select * from tbl1customers
-- come back to user postgres again
reset session authorization
-- grant select privilege to user hvthong 
grant select on tbl1customers to hvthong;
-- switch to user hvthong final
set session authorization hvthong
-- Finally
-- Success: select data in table from database order_product by user hvthong
select * from tbl1customers
```

### Encryption password
In PostgreSQL default, when you create a new user and update password for them, it will use SHA256 to hash password.
```sql
create user odyssey with password '123456';
```
Then you can check your password.
```sql
select * from pg_authid
```
Output
```
order_product=# select * from pg_authid;
  oid  |          rolname          | rolsuper | rolinherit | rolcreaterole | rolcreatedb | rolcanlogin | rolreplication | rolbypassrls | rolconnlimit |                                                              rolpassword                                                              | rolvaliduntil
-------+---------------------------+----------+------------+---------------+-------------+-------------+----------------+--------------+--------------+---------------------------------------------------------------------------------------------------------------------------------------+---------------
  6171 | pg_database_owner         | f        | t          | f             | f           | f           | f              | f            |           -1 |                                                                                                                                       |
  6181 | pg_read_all_data          | f        | t          | f             | f           | f           | f              | f            |           -1 |                                                                                                                                       |
  6182 | pg_write_all_data         | f        | t          | f             | f           | f           | f              | f            |           -1 |                                                                                                                                       |
  3373 | pg_monitor                | f        | t          | f             | f           | f           | f              | f            |           -1 |                                                                                                                                       |
  3374 | pg_read_all_settings      | f        | t          | f             | f           | f           | f              | f            |           -1 |                                                                                                                                       |
  3375 | pg_read_all_stats         | f        | t          | f             | f           | f           | f              | f            |           -1 |                                                                                                                                       |
  3377 | pg_stat_scan_tables       | f        | t          | f             | f           | f           | f              | f            |           -1 |                                                                                                                                       |
  4569 | pg_read_server_files      | f        | t          | f             | f           | f           | f              | f            |           -1 |                                                                                            |
  4570 | pg_write_server_files     | f        | t          | f             | f           | f           | f              | f            |           -1 |                                                                                                                                       |
  4571 | pg_execute_server_program | f        | t          | f             | f           | f           | f              | f            |           -1 |                                                                                                                                       |
  4200 | pg_signal_backend         | f        | t          | f             | f           | f           | f              | f            |           -1 |                                                                                                                                       |
    10 | postgres                  | t        | t          | t             | t           | t           | t              | t            |           -1 | SCRAM-SHA-256$4096:UkgQu1DT8790dzeOq+llgg==$naOXo2QZngZ1QYIta89wcasQYbArrZMbmQ1VKDT8wJE=:Ag3fhvzXrl6hoLZCnqLCFDmeWak6ioes0/slWcUU2EU= |
 16400 | fritz                     | f        | t          | f             | f           | t           | f              | f            |           -1 | SCRAM-SHA-256$4096:hgpfwmT4+BGz8JLGo/e19Q==$e9C+D+Yy9uUh/MOnw+n+D5boGOp67Nu0cQOrEc4/ymE=:Dxj0nSbLNGmgFSiDB23cQT9LBKwvddwbYepLypQ02Do= |
 24671 | hvthong                   | f        | t          | f             | f           | t           | f              | f            |           -1 | SCRAM-SHA-256$4096:VOd339AaGxgy6D/KCsqctQ==$zw4a1IEdiyFi65EEL0O5tW65K/HsL+pUmhC6buZMCG8=:R6xPiBmOP084waPlh7UrI65rfddG0WPHsRZbGt9NxBI= |
(14 rows)
```


