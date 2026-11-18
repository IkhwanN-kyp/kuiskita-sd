-- Run in Supabase SQL Editor. Public scores contain only nickname, avatar, grade and result.
create table if not exists public.scores (
 id bigint generated always as identity primary key,
 player_id uuid not null,
 nickname text not null check (char_length(nickname) between 2 and 24),
 avatar text not null check (char_length(avatar) <= 16),
 grade text not null check (grade in ('1','2','3','4','5','6')),
 subject text not null check (subject in ('arabic','ipa')),
 correct integer not null check (correct between 0 and 100),
 total integer not null check (total between 1 and 100 and correct <= total),
 created_at timestamptz not null default now()
);
alter table public.scores enable row level security;
revoke all on public.scores from anon, authenticated;
grant select,insert on public.scores to anon,authenticated;
grant usage,select on sequence public.scores_id_seq to anon,authenticated;
create policy "Public leaderboard read" on public.scores for select to anon,authenticated using (true);
create policy "Public quiz result submit" on public.scores for insert to anon,authenticated with check (true);
-- Note: anonymous submissions can be forged. For trustworthy competitions,
-- use authenticated student accounts and a server-side verified scoring endpoint.
