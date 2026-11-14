create table if not exists public.riyaaz_progress (user_id uuid primary key references auth.users(id) on delete cascade, state jsonb not null default '{"sessions":[]}'::jsonb, updated_at timestamptz not null default now());
alter table public.riyaaz_progress enable row level security;
drop policy if exists "Users read own Riyaaz progress" on public.riyaaz_progress;
drop policy if exists "Users insert own Riyaaz progress" on public.riyaaz_progress;
drop policy if exists "Users update own Riyaaz progress" on public.riyaaz_progress;
create policy "Users read own Riyaaz progress" on public.riyaaz_progress for select to authenticated using (auth.uid()=user_id);
create policy "Users insert own Riyaaz progress" on public.riyaaz_progress for insert to authenticated with check (auth.uid()=user_id);
create policy "Users update own Riyaaz progress" on public.riyaaz_progress for update to authenticated using (auth.uid()=user_id) with check (auth.uid()=user_id);
