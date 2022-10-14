CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
-- create members table
drop table if exists;
create table members (
    id uuid not null primary key default uuid_generate_v4()
    ,username text unique
    ,email text unique
    ,avatar_url text
    ,created_at timestamp with time zone default now()

    -- constraints on fields
    ,constraint username_length check (char_length(username) >=3)
)