-- AKORA — Mídia Kit. Rode no SQL Editor do projeto (idempotente).

-- Colunas de perfil usadas pelo Mídia Kit / Configurações
alter table public.users
  add column if not exists name text, add column if not exists full_name text,
  add column if not exists avatar_url text, add column if not exists bio text,
  add column if not exists niche text, add column if not exists contact text;

-- Signup passa a gravar o nome vindo de options.data.full_name
create or replace function public.handle_new_user() returns trigger
language plpgsql security definer set search_path = public, pg_temp as $$
begin
  insert into public.users (id, email, full_name, name)
  values (new.id, new.email, new.raw_user_meta_data->>'full_name', new.raw_user_meta_data->>'full_name')
  on conflict (id) do update set full_name = coalesce(public.users.full_name, excluded.full_name),
                                 name = coalesce(public.users.name, excluded.name);
  return new;
end $$;
revoke all on function public.handle_new_user() from public, anon, authenticated;

create table if not exists public.media_kit (
  id uuid primary key default gen_random_uuid(),
  workspace_id uuid not null unique references public.workspaces(id) on delete cascade,
  bio_extendida text, foto_capa_url text, publico_faixa_etaria text, publico_genero text,
  publico_localizacao text, cases_extra jsonb not null default '[]'::jsonb,
  slug text unique, created_at timestamptz default now(), updated_at timestamptz default now()
);
alter table public.media_kit enable row level security;
drop policy if exists media_kit_owner on public.media_kit;
create policy media_kit_owner on public.media_kit for all to authenticated
  using (exists (select 1 from public.workspaces w where w.id = media_kit.workspace_id and w.user_id = auth.uid()))
  with check (exists (select 1 from public.workspaces w where w.id = media_kit.workspace_id and w.user_id = auth.uid()));

-- Leitura pública controlada: único ponto de acesso anônimo (nunca expõe e-mail/telefone/documento)
create or replace function public.get_media_kit_public(p_slug text) returns jsonb
language plpgsql stable security definer set search_path = public, pg_temp as $$
declare kit public.media_kit; usr public.users;
begin
  select * into kit from public.media_kit where slug = lower(p_slug);
  if not found then return null; end if;
  select u.* into usr from public.users u join public.workspaces w on w.user_id = u.id where w.id = kit.workspace_id;
  return jsonb_build_object(
    'profile', jsonb_build_object('name', coalesce(usr.name, usr.full_name), 'avatar_url', usr.avatar_url,
                                  'bio', usr.bio, 'niche', usr.niche, 'contact', usr.contact),
    'kit', jsonb_build_object('bio_extendida', kit.bio_extendida, 'foto_capa_url', kit.foto_capa_url,
            'publico_faixa_etaria', kit.publico_faixa_etaria, 'publico_genero', kit.publico_genero,
            'publico_localizacao', kit.publico_localizacao, 'cases_extra', kit.cases_extra),
    'metrics', coalesce((select jsonb_agg(m) from (
        select distinct on (platform) platform, date, followers, views, likes, comments, shares, saves
        from public.performance_metrics where workspace_id = kit.workspace_id
        order by platform, date desc) m), '[]'::jsonb),
    'cases', coalesce((select jsonb_agg(jsonb_build_object('marca', b.name, 'descricao', b.niche))
        from public.brands b where b.workspace_id = kit.workspace_id and b.status = 'Finalizado'), '[]'::jsonb),
    'packages', coalesce((select jsonb_agg(e) from (
        select style, platform, qty, total, currency from public.estimates
        where workspace_id = kit.workspace_id order by created_at desc limit 6) e), '[]'::jsonb));
end $$;
revoke all on function public.get_media_kit_public(text) from public;
grant execute on function public.get_media_kit_public(text) to anon, authenticated;

-- Storage: bucket público, 5MB, escrita só na própria pasta <user_id>/
insert into storage.buckets (id, name, public, file_size_limit, allowed_mime_types)
values ('media-kit','media-kit', true, 5242880, array['image/jpeg','image/png','image/webp'])
on conflict (id) do update set file_size_limit = 5242880, public = true;
drop policy if exists media_kit_write on storage.objects;
create policy media_kit_write on storage.objects for all to authenticated
  using (bucket_id = 'media-kit' and (storage.foldername(name))[1] = auth.uid()::text)
  with check (bucket_id = 'media-kit' and (storage.foldername(name))[1] = auth.uid()::text);
