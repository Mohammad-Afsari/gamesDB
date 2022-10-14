alter table public.members enable row level security;
-- 1000: only authenticated users can view their info
create policy "only authenticated users can view all info"
    on public.members
    for select using (auth.role() = 'authenticated');

-- 1010: only enable user to update their own profile
create policy "only authenticated users can update their info"
    on public.members
    for update using (auth.uid() = public.members.id);

-- 1020: only enable user to delete their own profile
create policy "user only delete their own data"
    on public.members
    for delete using (auth.uid() = public.members.id);