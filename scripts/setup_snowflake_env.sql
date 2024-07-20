-- Setup The Demo Environment
use role securityadmin;

create role if not exists dbt_role;
grant role dbt_role to user 'YOUR_USER_HERE';

use role sysadmin;

create or replace warehouse dbt_wh with warehouse_size='x-small';
create database if not exists dbt_db;
drop schema public;
show grants on warehouse dbt_wh;

grant usage on warehouse dbt_wh to role dbt_role;
grant all on database dbt_db to role dbt_role;

use role dbt_role;

create schema if not exists dbt_db.dbt_schema;

grant all on schema DBT_SCHEMA to ROLE DBT_ROLE;