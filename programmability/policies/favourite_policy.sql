alter table public.favourites enable row level security;
-- 1010: only authenticated users can view their info
create policy "only authenticated users can view all info"
    on public.favourites
    for select using (auth.role() = 'authenticated');

-- 1020: allow authenticated user to insert
create policy "authenticated user can insert"
    on public.favourites
    for insert with check (auth.role() = 'authenticated');

-- 1030: only enable user to update their own profile
create policy "only authenticated users can update their info"
    on public.favourites
    for update using (auth.uid() = public.favourites.member_id);

-- 1030: only enable user to delete their own profile
create policy "user only delete their own data"
    on public.favourites
    for delete using (auth.uid() = public.favourites.member_id);