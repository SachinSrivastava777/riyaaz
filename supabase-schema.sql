-- Run this once in Supabase: SQL Editor -> New query -> Run
create table if not exists public.riyaaz_progress (
  user_id uuid primary key references auth.users(id) on delete cascade,
  state jsonb not null default '{}'::jsonb,
  updated_at timestamptz not null default now()
);

alter table public.riyaaz_progress enable row level security;

create policy "Users can read their own Riyaaz progress"
on public.riyaaz_progress for select
to authenticated
using (auth.uid() = user_id);

create policy "Users can insert their own Riyaaz progress"
on public.riyaaz_progress for insert
to authenticated
with check (auth.uid() = user_id);

create policy "Users can update their own Riyaaz progress"
on public.riyaaz_progress for update
to authenticated
using (auth.uid() = user_id)
with check (auth.uid() = user_id);
