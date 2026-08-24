-- ENGCLUB V2 DATABASE
create table public.profiles (
 id uuid primary key references auth.users(id) on delete cascade,
 full_name text not null,
 email text,
 role text not null check (role in ('admin','teacher','student')),
 created_at timestamptz default now()
);

create table public.bookings (
 id uuid primary key default gen_random_uuid(),
 student_id uuid references public.profiles(id) on delete cascade,
 teacher_id uuid references public.profiles(id) on delete set null,
 start_time timestamptz not null,
 duration_minutes integer default 25,
 lesson text,
 status text default 'pending' check (status in ('pending','assigned','completed','cancelled')),
 created_by uuid references public.profiles(id),
 created_at timestamptz default now()
);

alter table public.profiles enable row level security;
alter table public.bookings enable row level security;

create policy "users can read profiles" on public.profiles for select to authenticated using (true);
create policy "users can read relevant bookings" on public.bookings for select to authenticated using (true);
create policy "admins can manage bookings" on public.bookings for all to authenticated using (
 exists(select 1 from public.profiles p where p.id=auth.uid() and p.role='admin')
);
