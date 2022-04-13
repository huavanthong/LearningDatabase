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
