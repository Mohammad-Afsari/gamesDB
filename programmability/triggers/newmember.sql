-- update members table whenever a new member has signed up
-- 1000: create trigger function
drop function trigger_member();
create function trigger_member()
    returns trigger
    language plpgsql
    security definer set search_path = public
as $$
    begin
    -- logic
    insert into public.members (id, email, username)
    values (new.id, new.email, new.raw_user_meta_data ->> 'username');
    return new;
    end;
    $$;

-- 1010: create trigger statement
drop trigger if exists trigger_member on auth.users;
create trigger trigger_member
    after insert
    on auth.users
    for each row
    execute procedure trigger_member();