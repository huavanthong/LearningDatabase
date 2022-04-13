select * from tbl1customers

create user hvthong with password '123456';

select * from pg_catalog.pg_user

select current_user, session_user

set session authorization hvthong

select * from tbl1customers

reset session authorization

select * from tbl1customers

grant connect on database order_product to hvthong

set session authorization hvthong

select * from tbl1customers
