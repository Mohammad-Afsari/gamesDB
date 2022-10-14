-- create favourites table
drop table if exists favourites;
create table favourites (
    id uuid not null primary key default uuid_generate_v4()
    ,member_id uuid
    ,game_id text

    -- constraints
    ,constraint fk_member_id FOREIGN KEY (member_id) references public.members(id) ON DELETE CASCADE
)