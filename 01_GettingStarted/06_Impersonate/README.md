# Introduction
This tutorial will help you understand about impersonate on PostgresSQL. You need follow step by steps to recognize the difference between each step. It helps you understand it clearly.


# Getting Started
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
