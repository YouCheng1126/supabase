--
-- PostgreSQL database dump
--

\restrict awlz9FpqJJSPmCdxZv0ESrtKp7Sv9cLjsdgmsJD3Fk92h8HKmxGGtSYmerXuxrr

-- Dumped from database version 17.6
-- Dumped by pg_dump version 18.3 (Debian 18.3-1.pgdg13+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP EVENT TRIGGER pgrst_drop_watch;
DROP EVENT TRIGGER pgrst_ddl_watch;
DROP EVENT TRIGGER issue_pg_net_access;
DROP EVENT TRIGGER issue_pg_graphql_access;
DROP EVENT TRIGGER issue_pg_cron_access;
DROP EVENT TRIGGER issue_graphql_placeholder;
DROP PUBLICATION supabase_realtime;
DROP POLICY user_settings_update_own ON public.user_settings;
DROP POLICY user_settings_select_own ON public.user_settings;
DROP POLICY user_settings_insert_own ON public.user_settings;
DROP POLICY user_settings_delete_own ON public.user_settings;
DROP POLICY trades_update_own ON public.trades;
DROP POLICY trades_select_own ON public.trades;
DROP POLICY trades_insert_own ON public.trades;
DROP POLICY trades_delete_own ON public.trades;
DROP POLICY tags_update_own ON public.tags;
DROP POLICY tags_select_own ON public.tags;
DROP POLICY tags_insert_own ON public.tags;
DROP POLICY tags_delete_own ON public.tags;
DROP POLICY tag_categories_update_own ON public.tag_categories;
DROP POLICY tag_categories_select_own ON public.tag_categories;
DROP POLICY tag_categories_insert_own ON public.tag_categories;
DROP POLICY tag_categories_delete_own ON public.tag_categories;
DROP POLICY strategies_update_own ON public.strategies;
DROP POLICY strategies_select_own ON public.strategies;
DROP POLICY strategies_insert_own ON public.strategies;
DROP POLICY strategies_delete_own ON public.strategies;
DROP POLICY "Allow public access" ON public.user_settings;
ALTER TABLE ONLY storage.vector_indexes DROP CONSTRAINT vector_indexes_bucket_id_fkey;
ALTER TABLE ONLY storage.s3_multipart_uploads_parts DROP CONSTRAINT s3_multipart_uploads_parts_upload_id_fkey;
ALTER TABLE ONLY storage.s3_multipart_uploads_parts DROP CONSTRAINT s3_multipart_uploads_parts_bucket_id_fkey;
ALTER TABLE ONLY storage.s3_multipart_uploads DROP CONSTRAINT s3_multipart_uploads_bucket_id_fkey;
ALTER TABLE ONLY storage.objects DROP CONSTRAINT "objects_bucketId_fkey";
ALTER TABLE ONLY public.user_settings DROP CONSTRAINT user_settings_user_id_fkey;
ALTER TABLE ONLY public.trades DROP CONSTRAINT trades_user_id_fkey;
ALTER TABLE ONLY public.tags DROP CONSTRAINT tags_user_id_fkey;
ALTER TABLE ONLY public.tag_categories DROP CONSTRAINT tag_categories_user_id_fkey;
ALTER TABLE ONLY public.strategies DROP CONSTRAINT strategies_user_id_fkey;
ALTER TABLE ONLY public.tags DROP CONSTRAINT bag_items_category_id_fkey;
ALTER TABLE ONLY auth.webauthn_credentials DROP CONSTRAINT webauthn_credentials_user_id_fkey;
ALTER TABLE ONLY auth.webauthn_challenges DROP CONSTRAINT webauthn_challenges_user_id_fkey;
ALTER TABLE ONLY auth.sso_domains DROP CONSTRAINT sso_domains_sso_provider_id_fkey;
ALTER TABLE ONLY auth.sessions DROP CONSTRAINT sessions_user_id_fkey;
ALTER TABLE ONLY auth.sessions DROP CONSTRAINT sessions_oauth_client_id_fkey;
ALTER TABLE ONLY auth.saml_relay_states DROP CONSTRAINT saml_relay_states_sso_provider_id_fkey;
ALTER TABLE ONLY auth.saml_relay_states DROP CONSTRAINT saml_relay_states_flow_state_id_fkey;
ALTER TABLE ONLY auth.saml_providers DROP CONSTRAINT saml_providers_sso_provider_id_fkey;
ALTER TABLE ONLY auth.refresh_tokens DROP CONSTRAINT refresh_tokens_session_id_fkey;
ALTER TABLE ONLY auth.one_time_tokens DROP CONSTRAINT one_time_tokens_user_id_fkey;
ALTER TABLE ONLY auth.oauth_consents DROP CONSTRAINT oauth_consents_user_id_fkey;
ALTER TABLE ONLY auth.oauth_consents DROP CONSTRAINT oauth_consents_client_id_fkey;
ALTER TABLE ONLY auth.oauth_authorizations DROP CONSTRAINT oauth_authorizations_user_id_fkey;
ALTER TABLE ONLY auth.oauth_authorizations DROP CONSTRAINT oauth_authorizations_client_id_fkey;
ALTER TABLE ONLY auth.mfa_factors DROP CONSTRAINT mfa_factors_user_id_fkey;
ALTER TABLE ONLY auth.mfa_challenges DROP CONSTRAINT mfa_challenges_auth_factor_id_fkey;
ALTER TABLE ONLY auth.mfa_amr_claims DROP CONSTRAINT mfa_amr_claims_session_id_fkey;
ALTER TABLE ONLY auth.identities DROP CONSTRAINT identities_user_id_fkey;
DROP TRIGGER update_objects_updated_at ON storage.objects;
DROP TRIGGER protect_objects_delete ON storage.objects;
DROP TRIGGER protect_buckets_delete ON storage.buckets;
DROP TRIGGER enforce_bucket_name_length_trigger ON storage.buckets;
DROP TRIGGER tr_check_filters ON realtime.subscription;
DROP INDEX storage.vector_indexes_name_bucket_id_idx;
DROP INDEX storage.name_prefix_search;
DROP INDEX storage.idx_objects_bucket_id_name_lower;
DROP INDEX storage.idx_objects_bucket_id_name;
DROP INDEX storage.idx_multipart_uploads_list;
DROP INDEX storage.buckets_analytics_unique_name_idx;
DROP INDEX storage.bucketid_objname;
DROP INDEX storage.bname;
DROP INDEX realtime.subscription_subscription_id_entity_filters_action_filter_key;
DROP INDEX realtime.messages_inserted_at_topic_index;
DROP INDEX realtime.ix_realtime_subscription_entity;
DROP INDEX public.user_settings_user_id_key;
DROP INDEX public.trades_user_id_idx;
DROP INDEX public.tags_user_id_idx;
DROP INDEX public.tag_categories_user_id_idx;
DROP INDEX public.strategies_user_id_idx;
DROP INDEX auth.webauthn_credentials_user_id_idx;
DROP INDEX auth.webauthn_credentials_credential_id_key;
DROP INDEX auth.webauthn_challenges_user_id_idx;
DROP INDEX auth.webauthn_challenges_expires_at_idx;
DROP INDEX auth.users_is_anonymous_idx;
DROP INDEX auth.users_instance_id_idx;
DROP INDEX auth.users_instance_id_email_idx;
DROP INDEX auth.users_email_partial_key;
DROP INDEX auth.user_id_created_at_idx;
DROP INDEX auth.unique_phone_factor_per_user;
DROP INDEX auth.sso_providers_resource_id_pattern_idx;
DROP INDEX auth.sso_providers_resource_id_idx;
DROP INDEX auth.sso_domains_sso_provider_id_idx;
DROP INDEX auth.sso_domains_domain_idx;
DROP INDEX auth.sessions_user_id_idx;
DROP INDEX auth.sessions_oauth_client_id_idx;
DROP INDEX auth.sessions_not_after_idx;
DROP INDEX auth.saml_relay_states_sso_provider_id_idx;
DROP INDEX auth.saml_relay_states_for_email_idx;
DROP INDEX auth.saml_relay_states_created_at_idx;
DROP INDEX auth.saml_providers_sso_provider_id_idx;
DROP INDEX auth.refresh_tokens_updated_at_idx;
DROP INDEX auth.refresh_tokens_session_id_revoked_idx;
DROP INDEX auth.refresh_tokens_parent_idx;
DROP INDEX auth.refresh_tokens_instance_id_user_id_idx;
DROP INDEX auth.refresh_tokens_instance_id_idx;
DROP INDEX auth.recovery_token_idx;
DROP INDEX auth.reauthentication_token_idx;
DROP INDEX auth.one_time_tokens_user_id_token_type_key;
DROP INDEX auth.one_time_tokens_token_hash_hash_idx;
DROP INDEX auth.one_time_tokens_relates_to_hash_idx;
DROP INDEX auth.oauth_consents_user_order_idx;
DROP INDEX auth.oauth_consents_active_user_client_idx;
DROP INDEX auth.oauth_consents_active_client_idx;
DROP INDEX auth.oauth_clients_deleted_at_idx;
DROP INDEX auth.oauth_auth_pending_exp_idx;
DROP INDEX auth.mfa_factors_user_id_idx;
DROP INDEX auth.mfa_factors_user_friendly_name_unique;
DROP INDEX auth.mfa_challenge_created_at_idx;
DROP INDEX auth.idx_user_id_auth_method;
DROP INDEX auth.idx_oauth_client_states_created_at;
DROP INDEX auth.idx_auth_code;
DROP INDEX auth.identities_user_id_idx;
DROP INDEX auth.identities_email_idx;
DROP INDEX auth.flow_state_created_at_idx;
DROP INDEX auth.factor_id_created_at_idx;
DROP INDEX auth.email_change_token_new_idx;
DROP INDEX auth.email_change_token_current_idx;
DROP INDEX auth.custom_oauth_providers_provider_type_idx;
DROP INDEX auth.custom_oauth_providers_identifier_idx;
DROP INDEX auth.custom_oauth_providers_enabled_idx;
DROP INDEX auth.custom_oauth_providers_created_at_idx;
DROP INDEX auth.confirmation_token_idx;
DROP INDEX auth.audit_logs_instance_id_idx;
ALTER TABLE ONLY storage.vector_indexes DROP CONSTRAINT vector_indexes_pkey;
ALTER TABLE ONLY storage.s3_multipart_uploads DROP CONSTRAINT s3_multipart_uploads_pkey;
ALTER TABLE ONLY storage.s3_multipart_uploads_parts DROP CONSTRAINT s3_multipart_uploads_parts_pkey;
ALTER TABLE ONLY storage.objects DROP CONSTRAINT objects_pkey;
ALTER TABLE ONLY storage.migrations DROP CONSTRAINT migrations_pkey;
ALTER TABLE ONLY storage.migrations DROP CONSTRAINT migrations_name_key;
ALTER TABLE ONLY storage.buckets_vectors DROP CONSTRAINT buckets_vectors_pkey;
ALTER TABLE ONLY storage.buckets DROP CONSTRAINT buckets_pkey;
ALTER TABLE ONLY storage.buckets_analytics DROP CONSTRAINT buckets_analytics_pkey;
ALTER TABLE ONLY realtime.schema_migrations DROP CONSTRAINT schema_migrations_pkey;
ALTER TABLE ONLY realtime.subscription DROP CONSTRAINT pk_subscription;
ALTER TABLE ONLY realtime.messages DROP CONSTRAINT messages_pkey;
ALTER TABLE ONLY public.user_settings DROP CONSTRAINT user_settings_pkey;
ALTER TABLE ONLY public.trades DROP CONSTRAINT trades_pkey;
ALTER TABLE ONLY public.strategies DROP CONSTRAINT strategies_pkey;
ALTER TABLE ONLY public.keep_alive DROP CONSTRAINT keep_alive_pkey;
ALTER TABLE ONLY public.tags DROP CONSTRAINT bag_items_pkey;
ALTER TABLE ONLY public.tag_categories DROP CONSTRAINT bag_categories_pkey;
ALTER TABLE ONLY auth.webauthn_credentials DROP CONSTRAINT webauthn_credentials_pkey;
ALTER TABLE ONLY auth.webauthn_challenges DROP CONSTRAINT webauthn_challenges_pkey;
ALTER TABLE ONLY auth.users DROP CONSTRAINT users_pkey;
ALTER TABLE ONLY auth.users DROP CONSTRAINT users_phone_key;
ALTER TABLE ONLY auth.sso_providers DROP CONSTRAINT sso_providers_pkey;
ALTER TABLE ONLY auth.sso_domains DROP CONSTRAINT sso_domains_pkey;
ALTER TABLE ONLY auth.sessions DROP CONSTRAINT sessions_pkey;
ALTER TABLE ONLY auth.schema_migrations DROP CONSTRAINT schema_migrations_pkey;
ALTER TABLE ONLY auth.saml_relay_states DROP CONSTRAINT saml_relay_states_pkey;
ALTER TABLE ONLY auth.saml_providers DROP CONSTRAINT saml_providers_pkey;
ALTER TABLE ONLY auth.saml_providers DROP CONSTRAINT saml_providers_entity_id_key;
ALTER TABLE ONLY auth.refresh_tokens DROP CONSTRAINT refresh_tokens_token_unique;
ALTER TABLE ONLY auth.refresh_tokens DROP CONSTRAINT refresh_tokens_pkey;
ALTER TABLE ONLY auth.one_time_tokens DROP CONSTRAINT one_time_tokens_pkey;
ALTER TABLE ONLY auth.oauth_consents DROP CONSTRAINT oauth_consents_user_client_unique;
ALTER TABLE ONLY auth.oauth_consents DROP CONSTRAINT oauth_consents_pkey;
ALTER TABLE ONLY auth.oauth_clients DROP CONSTRAINT oauth_clients_pkey;
ALTER TABLE ONLY auth.oauth_client_states DROP CONSTRAINT oauth_client_states_pkey;
ALTER TABLE ONLY auth.oauth_authorizations DROP CONSTRAINT oauth_authorizations_pkey;
ALTER TABLE ONLY auth.oauth_authorizations DROP CONSTRAINT oauth_authorizations_authorization_id_key;
ALTER TABLE ONLY auth.oauth_authorizations DROP CONSTRAINT oauth_authorizations_authorization_code_key;
ALTER TABLE ONLY auth.mfa_factors DROP CONSTRAINT mfa_factors_pkey;
ALTER TABLE ONLY auth.mfa_factors DROP CONSTRAINT mfa_factors_last_challenged_at_key;
ALTER TABLE ONLY auth.mfa_challenges DROP CONSTRAINT mfa_challenges_pkey;
ALTER TABLE ONLY auth.mfa_amr_claims DROP CONSTRAINT mfa_amr_claims_session_id_authentication_method_pkey;
ALTER TABLE ONLY auth.instances DROP CONSTRAINT instances_pkey;
ALTER TABLE ONLY auth.identities DROP CONSTRAINT identities_provider_id_provider_unique;
ALTER TABLE ONLY auth.identities DROP CONSTRAINT identities_pkey;
ALTER TABLE ONLY auth.flow_state DROP CONSTRAINT flow_state_pkey;
ALTER TABLE ONLY auth.custom_oauth_providers DROP CONSTRAINT custom_oauth_providers_pkey;
ALTER TABLE ONLY auth.custom_oauth_providers DROP CONSTRAINT custom_oauth_providers_identifier_key;
ALTER TABLE ONLY auth.audit_log_entries DROP CONSTRAINT audit_log_entries_pkey;
ALTER TABLE ONLY auth.mfa_amr_claims DROP CONSTRAINT amr_id_pk;
ALTER TABLE auth.refresh_tokens ALTER COLUMN id DROP DEFAULT;
DROP TABLE storage.vector_indexes;
DROP TABLE storage.s3_multipart_uploads_parts;
DROP TABLE storage.s3_multipart_uploads;
DROP TABLE storage.objects;
DROP TABLE storage.migrations;
DROP TABLE storage.buckets_vectors;
DROP TABLE storage.buckets_analytics;
DROP TABLE storage.buckets;
DROP TABLE realtime.subscription;
DROP TABLE realtime.schema_migrations;
DROP TABLE realtime.messages;
DROP TABLE public.user_settings;
DROP TABLE public.trades;
DROP TABLE public.tags;
DROP TABLE public.tag_categories;
DROP TABLE public.strategies;
DROP TABLE public.keep_alive;
DROP TABLE auth.webauthn_credentials;
DROP TABLE auth.webauthn_challenges;
DROP TABLE auth.users;
DROP TABLE auth.sso_providers;
DROP TABLE auth.sso_domains;
DROP TABLE auth.sessions;
DROP TABLE auth.schema_migrations;
DROP TABLE auth.saml_relay_states;
DROP TABLE auth.saml_providers;
DROP SEQUENCE auth.refresh_tokens_id_seq;
DROP TABLE auth.refresh_tokens;
DROP TABLE auth.one_time_tokens;
DROP TABLE auth.oauth_consents;
DROP TABLE auth.oauth_clients;
DROP TABLE auth.oauth_client_states;
DROP TABLE auth.oauth_authorizations;
DROP TABLE auth.mfa_factors;
DROP TABLE auth.mfa_challenges;
DROP TABLE auth.mfa_amr_claims;
DROP TABLE auth.instances;
DROP TABLE auth.identities;
DROP TABLE auth.flow_state;
DROP TABLE auth.custom_oauth_providers;
DROP TABLE auth.audit_log_entries;
DROP FUNCTION storage.update_updated_at_column();
DROP FUNCTION storage.search_v2(prefix text, bucket_name text, limits integer, levels integer, start_after text, sort_order text, sort_column text, sort_column_after text);
DROP FUNCTION storage.search_legacy_v1(prefix text, bucketname text, limits integer, levels integer, offsets integer, search text, sortcolumn text, sortorder text);
DROP FUNCTION storage.search_by_timestamp(p_prefix text, p_bucket_id text, p_limit integer, p_level integer, p_start_after text, p_sort_order text, p_sort_column text, p_sort_column_after text);
DROP FUNCTION storage.search(prefix text, bucketname text, limits integer, levels integer, offsets integer, search text, sortcolumn text, sortorder text);
DROP FUNCTION storage.protect_delete();
DROP FUNCTION storage.operation();
DROP FUNCTION storage.list_objects_with_delimiter(_bucket_id text, prefix_param text, delimiter_param text, max_keys integer, start_after text, next_token text, sort_order text);
DROP FUNCTION storage.list_multipart_uploads_with_delimiter(bucket_id text, prefix_param text, delimiter_param text, max_keys integer, next_key_token text, next_upload_token text);
DROP FUNCTION storage.get_size_by_bucket();
DROP FUNCTION storage.get_prefixes(name text);
DROP FUNCTION storage.get_prefix(name text);
DROP FUNCTION storage.get_level(name text);
DROP FUNCTION storage.get_common_prefix(p_key text, p_prefix text, p_delimiter text);
DROP FUNCTION storage.foldername(name text);
DROP FUNCTION storage.filename(name text);
DROP FUNCTION storage.extension(name text);
DROP FUNCTION storage.enforce_bucket_name_length();
DROP FUNCTION storage.delete_leaf_prefixes(bucket_ids text[], names text[]);
DROP FUNCTION storage.can_insert_object(bucketid text, name text, owner uuid, metadata jsonb);
DROP FUNCTION storage.allow_only_operation(expected_operation text);
DROP FUNCTION storage.allow_any_operation(expected_operations text[]);
DROP FUNCTION realtime.topic();
DROP FUNCTION realtime.to_regrole(role_name text);
DROP FUNCTION realtime.subscription_check_filters();
DROP FUNCTION realtime.send(payload jsonb, event text, topic text, private boolean);
DROP FUNCTION realtime.quote_wal2json(entity regclass);
DROP FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer);
DROP FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]);
DROP FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text);
DROP FUNCTION realtime."cast"(val text, type_ regtype);
DROP FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]);
DROP FUNCTION realtime.broadcast_changes(topic_name text, event_name text, operation text, table_name text, table_schema text, new record, old record, level text);
DROP FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer);
DROP FUNCTION public.bootstrap_current_user();
DROP FUNCTION pgbouncer.get_auth(p_usename text);
DROP FUNCTION graphql_public.graphql("operationName" text, query text, variables jsonb, extensions jsonb);
DROP FUNCTION extensions.set_graphql_placeholder();
DROP FUNCTION extensions.pgrst_drop_watch();
DROP FUNCTION extensions.pgrst_ddl_watch();
DROP FUNCTION extensions.grant_pg_net_access();
DROP FUNCTION extensions.grant_pg_graphql_access();
DROP FUNCTION extensions.grant_pg_cron_access();
DROP FUNCTION auth.uid();
DROP FUNCTION auth.role();
DROP FUNCTION auth.jwt();
DROP FUNCTION auth.email();
DROP TYPE storage.buckettype;
DROP TYPE realtime.wal_rls;
DROP TYPE realtime.wal_column;
DROP TYPE realtime.user_defined_filter;
DROP TYPE realtime.equality_op;
DROP TYPE realtime.action;
DROP TYPE auth.one_time_token_type;
DROP TYPE auth.oauth_response_type;
DROP TYPE auth.oauth_registration_type;
DROP TYPE auth.oauth_client_type;
DROP TYPE auth.oauth_authorization_status;
DROP TYPE auth.factor_type;
DROP TYPE auth.factor_status;
DROP TYPE auth.code_challenge_method;
DROP TYPE auth.aal_level;
DROP EXTENSION "uuid-ossp";
DROP EXTENSION supabase_vault;
DROP EXTENSION pgcrypto;
DROP EXTENSION pg_stat_statements;
DROP SCHEMA vault;
DROP SCHEMA storage;
DROP SCHEMA realtime;
DROP SCHEMA pgbouncer;
DROP SCHEMA graphql_public;
DROP SCHEMA graphql;
DROP SCHEMA extensions;
DROP EXTENSION pg_cron;
DROP SCHEMA auth;
--
-- Name: auth; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA auth;


--
-- Name: pg_cron; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pg_cron WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION pg_cron; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION pg_cron IS 'Job scheduler for PostgreSQL';


--
-- Name: extensions; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA extensions;


--
-- Name: graphql; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA graphql;


--
-- Name: graphql_public; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA graphql_public;


--
-- Name: pgbouncer; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA pgbouncer;


--
-- Name: realtime; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA realtime;


--
-- Name: storage; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA storage;


--
-- Name: vault; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA vault;


--
-- Name: pg_stat_statements; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pg_stat_statements WITH SCHEMA extensions;


--
-- Name: EXTENSION pg_stat_statements; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION pg_stat_statements IS 'track planning and execution statistics of all SQL statements executed';


--
-- Name: pgcrypto; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pgcrypto WITH SCHEMA extensions;


--
-- Name: EXTENSION pgcrypto; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION pgcrypto IS 'cryptographic functions';


--
-- Name: supabase_vault; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS supabase_vault WITH SCHEMA vault;


--
-- Name: EXTENSION supabase_vault; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION supabase_vault IS 'Supabase Vault Extension';


--
-- Name: uuid-ossp; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA extensions;


--
-- Name: EXTENSION "uuid-ossp"; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';


--
-- Name: aal_level; Type: TYPE; Schema: auth; Owner: -
--

CREATE TYPE auth.aal_level AS ENUM (
    'aal1',
    'aal2',
    'aal3'
);


--
-- Name: code_challenge_method; Type: TYPE; Schema: auth; Owner: -
--

CREATE TYPE auth.code_challenge_method AS ENUM (
    's256',
    'plain'
);


--
-- Name: factor_status; Type: TYPE; Schema: auth; Owner: -
--

CREATE TYPE auth.factor_status AS ENUM (
    'unverified',
    'verified'
);


--
-- Name: factor_type; Type: TYPE; Schema: auth; Owner: -
--

CREATE TYPE auth.factor_type AS ENUM (
    'totp',
    'webauthn',
    'phone'
);


--
-- Name: oauth_authorization_status; Type: TYPE; Schema: auth; Owner: -
--

CREATE TYPE auth.oauth_authorization_status AS ENUM (
    'pending',
    'approved',
    'denied',
    'expired'
);


--
-- Name: oauth_client_type; Type: TYPE; Schema: auth; Owner: -
--

CREATE TYPE auth.oauth_client_type AS ENUM (
    'public',
    'confidential'
);


--
-- Name: oauth_registration_type; Type: TYPE; Schema: auth; Owner: -
--

CREATE TYPE auth.oauth_registration_type AS ENUM (
    'dynamic',
    'manual'
);


--
-- Name: oauth_response_type; Type: TYPE; Schema: auth; Owner: -
--

CREATE TYPE auth.oauth_response_type AS ENUM (
    'code'
);


--
-- Name: one_time_token_type; Type: TYPE; Schema: auth; Owner: -
--

CREATE TYPE auth.one_time_token_type AS ENUM (
    'confirmation_token',
    'reauthentication_token',
    'recovery_token',
    'email_change_token_new',
    'email_change_token_current',
    'phone_change_token'
);


--
-- Name: action; Type: TYPE; Schema: realtime; Owner: -
--

CREATE TYPE realtime.action AS ENUM (
    'INSERT',
    'UPDATE',
    'DELETE',
    'TRUNCATE',
    'ERROR'
);


--
-- Name: equality_op; Type: TYPE; Schema: realtime; Owner: -
--

CREATE TYPE realtime.equality_op AS ENUM (
    'eq',
    'neq',
    'lt',
    'lte',
    'gt',
    'gte',
    'in'
);


--
-- Name: user_defined_filter; Type: TYPE; Schema: realtime; Owner: -
--

CREATE TYPE realtime.user_defined_filter AS (
	column_name text,
	op realtime.equality_op,
	value text
);


--
-- Name: wal_column; Type: TYPE; Schema: realtime; Owner: -
--

CREATE TYPE realtime.wal_column AS (
	name text,
	type_name text,
	type_oid oid,
	value jsonb,
	is_pkey boolean,
	is_selectable boolean
);


--
-- Name: wal_rls; Type: TYPE; Schema: realtime; Owner: -
--

CREATE TYPE realtime.wal_rls AS (
	wal jsonb,
	is_rls_enabled boolean,
	subscription_ids uuid[],
	errors text[]
);


--
-- Name: buckettype; Type: TYPE; Schema: storage; Owner: -
--

CREATE TYPE storage.buckettype AS ENUM (
    'STANDARD',
    'ANALYTICS',
    'VECTOR'
);


--
-- Name: email(); Type: FUNCTION; Schema: auth; Owner: -
--

CREATE FUNCTION auth.email() RETURNS text
    LANGUAGE sql STABLE
    AS $$
  select 
  coalesce(
    nullif(current_setting('request.jwt.claim.email', true), ''),
    (nullif(current_setting('request.jwt.claims', true), '')::jsonb ->> 'email')
  )::text
$$;


--
-- Name: FUNCTION email(); Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON FUNCTION auth.email() IS 'Deprecated. Use auth.jwt() -> ''email'' instead.';


--
-- Name: jwt(); Type: FUNCTION; Schema: auth; Owner: -
--

CREATE FUNCTION auth.jwt() RETURNS jsonb
    LANGUAGE sql STABLE
    AS $$
  select 
    coalesce(
        nullif(current_setting('request.jwt.claim', true), ''),
        nullif(current_setting('request.jwt.claims', true), '')
    )::jsonb
$$;


--
-- Name: role(); Type: FUNCTION; Schema: auth; Owner: -
--

CREATE FUNCTION auth.role() RETURNS text
    LANGUAGE sql STABLE
    AS $$
  select 
  coalesce(
    nullif(current_setting('request.jwt.claim.role', true), ''),
    (nullif(current_setting('request.jwt.claims', true), '')::jsonb ->> 'role')
  )::text
$$;


--
-- Name: FUNCTION role(); Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON FUNCTION auth.role() IS 'Deprecated. Use auth.jwt() -> ''role'' instead.';


--
-- Name: uid(); Type: FUNCTION; Schema: auth; Owner: -
--

CREATE FUNCTION auth.uid() RETURNS uuid
    LANGUAGE sql STABLE
    AS $$
  select 
  coalesce(
    nullif(current_setting('request.jwt.claim.sub', true), ''),
    (nullif(current_setting('request.jwt.claims', true), '')::jsonb ->> 'sub')
  )::uuid
$$;


--
-- Name: FUNCTION uid(); Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON FUNCTION auth.uid() IS 'Deprecated. Use auth.jwt() -> ''sub'' instead.';


--
-- Name: grant_pg_cron_access(); Type: FUNCTION; Schema: extensions; Owner: -
--

CREATE FUNCTION extensions.grant_pg_cron_access() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  IF EXISTS (
    SELECT
    FROM pg_event_trigger_ddl_commands() AS ev
    JOIN pg_extension AS ext
    ON ev.objid = ext.oid
    WHERE ext.extname = 'pg_cron'
  )
  THEN
    grant usage on schema cron to postgres with grant option;

    alter default privileges in schema cron grant all on tables to postgres with grant option;
    alter default privileges in schema cron grant all on functions to postgres with grant option;
    alter default privileges in schema cron grant all on sequences to postgres with grant option;

    alter default privileges for user supabase_admin in schema cron grant all
        on sequences to postgres with grant option;
    alter default privileges for user supabase_admin in schema cron grant all
        on tables to postgres with grant option;
    alter default privileges for user supabase_admin in schema cron grant all
        on functions to postgres with grant option;

    grant all privileges on all tables in schema cron to postgres with grant option;
    revoke all on table cron.job from postgres;
    grant select on table cron.job to postgres with grant option;
  END IF;
END;
$$;


--
-- Name: FUNCTION grant_pg_cron_access(); Type: COMMENT; Schema: extensions; Owner: -
--

COMMENT ON FUNCTION extensions.grant_pg_cron_access() IS 'Grants access to pg_cron';


--
-- Name: grant_pg_graphql_access(); Type: FUNCTION; Schema: extensions; Owner: -
--

CREATE FUNCTION extensions.grant_pg_graphql_access() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $_$
DECLARE
    func_is_graphql_resolve bool;
BEGIN
    func_is_graphql_resolve = (
        SELECT n.proname = 'resolve'
        FROM pg_event_trigger_ddl_commands() AS ev
        LEFT JOIN pg_catalog.pg_proc AS n
        ON ev.objid = n.oid
    );

    IF func_is_graphql_resolve
    THEN
        -- Update public wrapper to pass all arguments through to the pg_graphql resolve func
        DROP FUNCTION IF EXISTS graphql_public.graphql;
        create or replace function graphql_public.graphql(
            "operationName" text default null,
            query text default null,
            variables jsonb default null,
            extensions jsonb default null
        )
            returns jsonb
            language sql
        as $$
            select graphql.resolve(
                query := query,
                variables := coalesce(variables, '{}'),
                "operationName" := "operationName",
                extensions := extensions
            );
        $$;

        -- This hook executes when `graphql.resolve` is created. That is not necessarily the last
        -- function in the extension so we need to grant permissions on existing entities AND
        -- update default permissions to any others that are created after `graphql.resolve`
        grant usage on schema graphql to postgres, anon, authenticated, service_role;
        grant select on all tables in schema graphql to postgres, anon, authenticated, service_role;
        grant execute on all functions in schema graphql to postgres, anon, authenticated, service_role;
        grant all on all sequences in schema graphql to postgres, anon, authenticated, service_role;
        alter default privileges in schema graphql grant all on tables to postgres, anon, authenticated, service_role;
        alter default privileges in schema graphql grant all on functions to postgres, anon, authenticated, service_role;
        alter default privileges in schema graphql grant all on sequences to postgres, anon, authenticated, service_role;

        -- Allow postgres role to allow granting usage on graphql and graphql_public schemas to custom roles
        grant usage on schema graphql_public to postgres with grant option;
        grant usage on schema graphql to postgres with grant option;
    END IF;

END;
$_$;


--
-- Name: FUNCTION grant_pg_graphql_access(); Type: COMMENT; Schema: extensions; Owner: -
--

COMMENT ON FUNCTION extensions.grant_pg_graphql_access() IS 'Grants access to pg_graphql';


--
-- Name: grant_pg_net_access(); Type: FUNCTION; Schema: extensions; Owner: -
--

CREATE FUNCTION extensions.grant_pg_net_access() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  IF EXISTS (
    SELECT 1
    FROM pg_event_trigger_ddl_commands() AS ev
    JOIN pg_extension AS ext
    ON ev.objid = ext.oid
    WHERE ext.extname = 'pg_net'
  )
  THEN
    IF NOT EXISTS (
      SELECT 1
      FROM pg_roles
      WHERE rolname = 'supabase_functions_admin'
    )
    THEN
      CREATE USER supabase_functions_admin NOINHERIT CREATEROLE LOGIN NOREPLICATION;
    END IF;

    GRANT USAGE ON SCHEMA net TO supabase_functions_admin, postgres, anon, authenticated, service_role;

    IF EXISTS (
      SELECT FROM pg_extension
      WHERE extname = 'pg_net'
      -- all versions in use on existing projects as of 2025-02-20
      -- version 0.12.0 onwards don't need these applied
      AND extversion IN ('0.2', '0.6', '0.7', '0.7.1', '0.8', '0.10.0', '0.11.0')
    ) THEN
      ALTER function net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) SECURITY DEFINER;
      ALTER function net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) SECURITY DEFINER;

      ALTER function net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) SET search_path = net;
      ALTER function net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) SET search_path = net;

      REVOKE ALL ON FUNCTION net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) FROM PUBLIC;
      REVOKE ALL ON FUNCTION net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) FROM PUBLIC;

      GRANT EXECUTE ON FUNCTION net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) TO supabase_functions_admin, postgres, anon, authenticated, service_role;
      GRANT EXECUTE ON FUNCTION net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) TO supabase_functions_admin, postgres, anon, authenticated, service_role;
    END IF;
  END IF;
END;
$$;


--
-- Name: FUNCTION grant_pg_net_access(); Type: COMMENT; Schema: extensions; Owner: -
--

COMMENT ON FUNCTION extensions.grant_pg_net_access() IS 'Grants access to pg_net';


--
-- Name: pgrst_ddl_watch(); Type: FUNCTION; Schema: extensions; Owner: -
--

CREATE FUNCTION extensions.pgrst_ddl_watch() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
  cmd record;
BEGIN
  FOR cmd IN SELECT * FROM pg_event_trigger_ddl_commands()
  LOOP
    IF cmd.command_tag IN (
      'CREATE SCHEMA', 'ALTER SCHEMA'
    , 'CREATE TABLE', 'CREATE TABLE AS', 'SELECT INTO', 'ALTER TABLE'
    , 'CREATE FOREIGN TABLE', 'ALTER FOREIGN TABLE'
    , 'CREATE VIEW', 'ALTER VIEW'
    , 'CREATE MATERIALIZED VIEW', 'ALTER MATERIALIZED VIEW'
    , 'CREATE FUNCTION', 'ALTER FUNCTION'
    , 'CREATE TRIGGER'
    , 'CREATE TYPE', 'ALTER TYPE'
    , 'CREATE RULE'
    , 'COMMENT'
    )
    -- don't notify in case of CREATE TEMP table or other objects created on pg_temp
    AND cmd.schema_name is distinct from 'pg_temp'
    THEN
      NOTIFY pgrst, 'reload schema';
    END IF;
  END LOOP;
END; $$;


--
-- Name: pgrst_drop_watch(); Type: FUNCTION; Schema: extensions; Owner: -
--

CREATE FUNCTION extensions.pgrst_drop_watch() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
  obj record;
BEGIN
  FOR obj IN SELECT * FROM pg_event_trigger_dropped_objects()
  LOOP
    IF obj.object_type IN (
      'schema'
    , 'table'
    , 'foreign table'
    , 'view'
    , 'materialized view'
    , 'function'
    , 'trigger'
    , 'type'
    , 'rule'
    )
    AND obj.is_temporary IS false -- no pg_temp objects
    THEN
      NOTIFY pgrst, 'reload schema';
    END IF;
  END LOOP;
END; $$;


--
-- Name: set_graphql_placeholder(); Type: FUNCTION; Schema: extensions; Owner: -
--

CREATE FUNCTION extensions.set_graphql_placeholder() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $_$
    DECLARE
    graphql_is_dropped bool;
    BEGIN
    graphql_is_dropped = (
        SELECT ev.schema_name = 'graphql_public'
        FROM pg_event_trigger_dropped_objects() AS ev
        WHERE ev.schema_name = 'graphql_public'
    );

    IF graphql_is_dropped
    THEN
        create or replace function graphql_public.graphql(
            "operationName" text default null,
            query text default null,
            variables jsonb default null,
            extensions jsonb default null
        )
            returns jsonb
            language plpgsql
        as $$
            DECLARE
                server_version float;
            BEGIN
                server_version = (SELECT (SPLIT_PART((select version()), ' ', 2))::float);

                IF server_version >= 14 THEN
                    RETURN jsonb_build_object(
                        'errors', jsonb_build_array(
                            jsonb_build_object(
                                'message', 'pg_graphql extension is not enabled.'
                            )
                        )
                    );
                ELSE
                    RETURN jsonb_build_object(
                        'errors', jsonb_build_array(
                            jsonb_build_object(
                                'message', 'pg_graphql is only available on projects running Postgres 14 onwards.'
                            )
                        )
                    );
                END IF;
            END;
        $$;
    END IF;

    END;
$_$;


--
-- Name: FUNCTION set_graphql_placeholder(); Type: COMMENT; Schema: extensions; Owner: -
--

COMMENT ON FUNCTION extensions.set_graphql_placeholder() IS 'Reintroduces placeholder function for graphql_public.graphql';


--
-- Name: graphql(text, text, jsonb, jsonb); Type: FUNCTION; Schema: graphql_public; Owner: -
--

CREATE FUNCTION graphql_public.graphql("operationName" text DEFAULT NULL::text, query text DEFAULT NULL::text, variables jsonb DEFAULT NULL::jsonb, extensions jsonb DEFAULT NULL::jsonb) RETURNS jsonb
    LANGUAGE plpgsql
    AS $$
            DECLARE
                server_version float;
            BEGIN
                server_version = (SELECT (SPLIT_PART((select version()), ' ', 2))::float);

                IF server_version >= 14 THEN
                    RETURN jsonb_build_object(
                        'errors', jsonb_build_array(
                            jsonb_build_object(
                                'message', 'pg_graphql extension is not enabled.'
                            )
                        )
                    );
                ELSE
                    RETURN jsonb_build_object(
                        'errors', jsonb_build_array(
                            jsonb_build_object(
                                'message', 'pg_graphql is only available on projects running Postgres 14 onwards.'
                            )
                        )
                    );
                END IF;
            END;
        $$;


--
-- Name: get_auth(text); Type: FUNCTION; Schema: pgbouncer; Owner: -
--

CREATE FUNCTION pgbouncer.get_auth(p_usename text) RETURNS TABLE(username text, password text)
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO ''
    AS $_$
  BEGIN
      RAISE DEBUG 'PgBouncer auth request: %', p_usename;

      RETURN QUERY
      SELECT
          rolname::text,
          CASE WHEN rolvaliduntil < now()
              THEN null
              ELSE rolpassword::text
          END
      FROM pg_authid
      WHERE rolname=$1 and rolcanlogin;
  END;
  $_$;


--
-- Name: bootstrap_current_user(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.bootstrap_current_user() RETURNS jsonb
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO 'public'
    AS $$
declare
    current_user_id uuid := auth.uid();
    existing_owner uuid;
    claimed_legacy_data boolean := false;
begin
    if current_user_id is null then
        raise exception 'bootstrap_current_user requires an authenticated user';
    end if;

    select owner.user_id
    into existing_owner
    from (
        select user_id from public.user_settings where user_id is not null
        union all
        select user_id from public.trades where user_id is not null
        union all
        select user_id from public.strategies where user_id is not null
        union all
        select user_id from public.tag_categories where user_id is not null
        union all
        select user_id from public.tags where user_id is not null
    ) as owner
    limit 1;

    if existing_owner is null then
        update public.trades set user_id = current_user_id where user_id is null;
        update public.strategies set user_id = current_user_id where user_id is null;
        update public.tag_categories set user_id = current_user_id where user_id is null;
        update public.tags set user_id = current_user_id where user_id is null;
        with legacy_settings as (
            select ctid
            from public.user_settings
            where user_id is null
            limit 1
        )
        update public.user_settings settings
        set user_id = current_user_id
        from legacy_settings
        where settings.ctid = legacy_settings.ctid;
        claimed_legacy_data := true;
    end if;

    insert into public.user_settings (
        user_id,
        max_drawdown,
        commission_per_unit,
        win_threshold,
        break_even_range,
        loss_threshold,
        custom_tag_category_colors,
        tag_category_color_order
    )
    values (
        current_user_id,
        0,
        0,
        0,
        0,
        0,
        '[]'::jsonb,
        '[]'::jsonb
    )
    on conflict (user_id) do nothing;

    return jsonb_build_object(
        'user_id', current_user_id,
        'claimed_legacy_data', claimed_legacy_data
    );
end;
$$;


--
-- Name: apply_rls(jsonb, integer); Type: FUNCTION; Schema: realtime; Owner: -
--

CREATE FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer DEFAULT (1024 * 1024)) RETURNS SETOF realtime.wal_rls
    LANGUAGE plpgsql
    AS $$
declare
-- Regclass of the table e.g. public.notes
entity_ regclass = (quote_ident(wal ->> 'schema') || '.' || quote_ident(wal ->> 'table'))::regclass;

-- I, U, D, T: insert, update ...
action realtime.action = (
    case wal ->> 'action'
        when 'I' then 'INSERT'
        when 'U' then 'UPDATE'
        when 'D' then 'DELETE'
        else 'ERROR'
    end
);

-- Is row level security enabled for the table
is_rls_enabled bool = relrowsecurity from pg_class where oid = entity_;

subscriptions realtime.subscription[] = array_agg(subs)
    from
        realtime.subscription subs
    where
        subs.entity = entity_
        -- Filter by action early - only get subscriptions interested in this action
        -- action_filter column can be: '*' (all), 'INSERT', 'UPDATE', or 'DELETE'
        and (subs.action_filter = '*' or subs.action_filter = action::text);

-- Subscription vars
roles regrole[] = array_agg(distinct us.claims_role::text)
    from
        unnest(subscriptions) us;

working_role regrole;
claimed_role regrole;
claims jsonb;

subscription_id uuid;
subscription_has_access bool;
visible_to_subscription_ids uuid[] = '{}';

-- structured info for wal's columns
columns realtime.wal_column[];
-- previous identity values for update/delete
old_columns realtime.wal_column[];

error_record_exceeds_max_size boolean = octet_length(wal::text) > max_record_bytes;

-- Primary jsonb output for record
output jsonb;

begin
perform set_config('role', null, true);

columns =
    array_agg(
        (
            x->>'name',
            x->>'type',
            x->>'typeoid',
            realtime.cast(
                (x->'value') #>> '{}',
                coalesce(
                    (x->>'typeoid')::regtype, -- null when wal2json version <= 2.4
                    (x->>'type')::regtype
                )
            ),
            (pks ->> 'name') is not null,
            true
        )::realtime.wal_column
    )
    from
        jsonb_array_elements(wal -> 'columns') x
        left join jsonb_array_elements(wal -> 'pk') pks
            on (x ->> 'name') = (pks ->> 'name');

old_columns =
    array_agg(
        (
            x->>'name',
            x->>'type',
            x->>'typeoid',
            realtime.cast(
                (x->'value') #>> '{}',
                coalesce(
                    (x->>'typeoid')::regtype, -- null when wal2json version <= 2.4
                    (x->>'type')::regtype
                )
            ),
            (pks ->> 'name') is not null,
            true
        )::realtime.wal_column
    )
    from
        jsonb_array_elements(wal -> 'identity') x
        left join jsonb_array_elements(wal -> 'pk') pks
            on (x ->> 'name') = (pks ->> 'name');

for working_role in select * from unnest(roles) loop

    -- Update `is_selectable` for columns and old_columns
    columns =
        array_agg(
            (
                c.name,
                c.type_name,
                c.type_oid,
                c.value,
                c.is_pkey,
                pg_catalog.has_column_privilege(working_role, entity_, c.name, 'SELECT')
            )::realtime.wal_column
        )
        from
            unnest(columns) c;

    old_columns =
            array_agg(
                (
                    c.name,
                    c.type_name,
                    c.type_oid,
                    c.value,
                    c.is_pkey,
                    pg_catalog.has_column_privilege(working_role, entity_, c.name, 'SELECT')
                )::realtime.wal_column
            )
            from
                unnest(old_columns) c;

    if action <> 'DELETE' and count(1) = 0 from unnest(columns) c where c.is_pkey then
        return next (
            jsonb_build_object(
                'schema', wal ->> 'schema',
                'table', wal ->> 'table',
                'type', action
            ),
            is_rls_enabled,
            -- subscriptions is already filtered by entity
            (select array_agg(s.subscription_id) from unnest(subscriptions) as s where claims_role = working_role),
            array['Error 400: Bad Request, no primary key']
        )::realtime.wal_rls;

    -- The claims role does not have SELECT permission to the primary key of entity
    elsif action <> 'DELETE' and sum(c.is_selectable::int) <> count(1) from unnest(columns) c where c.is_pkey then
        return next (
            jsonb_build_object(
                'schema', wal ->> 'schema',
                'table', wal ->> 'table',
                'type', action
            ),
            is_rls_enabled,
            (select array_agg(s.subscription_id) from unnest(subscriptions) as s where claims_role = working_role),
            array['Error 401: Unauthorized']
        )::realtime.wal_rls;

    else
        output = jsonb_build_object(
            'schema', wal ->> 'schema',
            'table', wal ->> 'table',
            'type', action,
            'commit_timestamp', to_char(
                ((wal ->> 'timestamp')::timestamptz at time zone 'utc'),
                'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"'
            ),
            'columns', (
                select
                    jsonb_agg(
                        jsonb_build_object(
                            'name', pa.attname,
                            'type', pt.typname
                        )
                        order by pa.attnum asc
                    )
                from
                    pg_attribute pa
                    join pg_type pt
                        on pa.atttypid = pt.oid
                where
                    attrelid = entity_
                    and attnum > 0
                    and pg_catalog.has_column_privilege(working_role, entity_, pa.attname, 'SELECT')
            )
        )
        -- Add "record" key for insert and update
        || case
            when action in ('INSERT', 'UPDATE') then
                jsonb_build_object(
                    'record',
                    (
                        select
                            jsonb_object_agg(
                                -- if unchanged toast, get column name and value from old record
                                coalesce((c).name, (oc).name),
                                case
                                    when (c).name is null then (oc).value
                                    else (c).value
                                end
                            )
                        from
                            unnest(columns) c
                            full outer join unnest(old_columns) oc
                                on (c).name = (oc).name
                        where
                            coalesce((c).is_selectable, (oc).is_selectable)
                            and ( not error_record_exceeds_max_size or (octet_length((c).value::text) <= 64))
                    )
                )
            else '{}'::jsonb
        end
        -- Add "old_record" key for update and delete
        || case
            when action = 'UPDATE' then
                jsonb_build_object(
                        'old_record',
                        (
                            select jsonb_object_agg((c).name, (c).value)
                            from unnest(old_columns) c
                            where
                                (c).is_selectable
                                and ( not error_record_exceeds_max_size or (octet_length((c).value::text) <= 64))
                        )
                    )
            when action = 'DELETE' then
                jsonb_build_object(
                    'old_record',
                    (
                        select jsonb_object_agg((c).name, (c).value)
                        from unnest(old_columns) c
                        where
                            (c).is_selectable
                            and ( not error_record_exceeds_max_size or (octet_length((c).value::text) <= 64))
                            and ( not is_rls_enabled or (c).is_pkey ) -- if RLS enabled, we can't secure deletes so filter to pkey
                    )
                )
            else '{}'::jsonb
        end;

        -- Create the prepared statement
        if is_rls_enabled and action <> 'DELETE' then
            if (select 1 from pg_prepared_statements where name = 'walrus_rls_stmt' limit 1) > 0 then
                deallocate walrus_rls_stmt;
            end if;
            execute realtime.build_prepared_statement_sql('walrus_rls_stmt', entity_, columns);
        end if;

        visible_to_subscription_ids = '{}';

        for subscription_id, claims in (
                select
                    subs.subscription_id,
                    subs.claims
                from
                    unnest(subscriptions) subs
                where
                    subs.entity = entity_
                    and subs.claims_role = working_role
                    and (
                        realtime.is_visible_through_filters(columns, subs.filters)
                        or (
                          action = 'DELETE'
                          and realtime.is_visible_through_filters(old_columns, subs.filters)
                        )
                    )
        ) loop

            if not is_rls_enabled or action = 'DELETE' then
                visible_to_subscription_ids = visible_to_subscription_ids || subscription_id;
            else
                -- Check if RLS allows the role to see the record
                perform
                    -- Trim leading and trailing quotes from working_role because set_config
                    -- doesn't recognize the role as valid if they are included
                    set_config('role', trim(both '"' from working_role::text), true),
                    set_config('request.jwt.claims', claims::text, true);

                execute 'execute walrus_rls_stmt' into subscription_has_access;

                if subscription_has_access then
                    visible_to_subscription_ids = visible_to_subscription_ids || subscription_id;
                end if;
            end if;
        end loop;

        perform set_config('role', null, true);

        return next (
            output,
            is_rls_enabled,
            visible_to_subscription_ids,
            case
                when error_record_exceeds_max_size then array['Error 413: Payload Too Large']
                else '{}'
            end
        )::realtime.wal_rls;

    end if;
end loop;

perform set_config('role', null, true);
end;
$$;


--
-- Name: broadcast_changes(text, text, text, text, text, record, record, text); Type: FUNCTION; Schema: realtime; Owner: -
--

CREATE FUNCTION realtime.broadcast_changes(topic_name text, event_name text, operation text, table_name text, table_schema text, new record, old record, level text DEFAULT 'ROW'::text) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
    -- Declare a variable to hold the JSONB representation of the row
    row_data jsonb := '{}'::jsonb;
BEGIN
    IF level = 'STATEMENT' THEN
        RAISE EXCEPTION 'function can only be triggered for each row, not for each statement';
    END IF;
    -- Check the operation type and handle accordingly
    IF operation = 'INSERT' OR operation = 'UPDATE' OR operation = 'DELETE' THEN
        row_data := jsonb_build_object('old_record', OLD, 'record', NEW, 'operation', operation, 'table', table_name, 'schema', table_schema);
        PERFORM realtime.send (row_data, event_name, topic_name);
    ELSE
        RAISE EXCEPTION 'Unexpected operation type: %', operation;
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        RAISE EXCEPTION 'Failed to process the row: %', SQLERRM;
END;

$$;


--
-- Name: build_prepared_statement_sql(text, regclass, realtime.wal_column[]); Type: FUNCTION; Schema: realtime; Owner: -
--

CREATE FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) RETURNS text
    LANGUAGE sql
    AS $$
      /*
      Builds a sql string that, if executed, creates a prepared statement to
      tests retrive a row from *entity* by its primary key columns.
      Example
          select realtime.build_prepared_statement_sql('public.notes', '{"id"}'::text[], '{"bigint"}'::text[])
      */
          select
      'prepare ' || prepared_statement_name || ' as
          select
              exists(
                  select
                      1
                  from
                      ' || entity || '
                  where
                      ' || string_agg(quote_ident(pkc.name) || '=' || quote_nullable(pkc.value #>> '{}') , ' and ') || '
              )'
          from
              unnest(columns) pkc
          where
              pkc.is_pkey
          group by
              entity
      $$;


--
-- Name: cast(text, regtype); Type: FUNCTION; Schema: realtime; Owner: -
--

CREATE FUNCTION realtime."cast"(val text, type_ regtype) RETURNS jsonb
    LANGUAGE plpgsql IMMUTABLE
    AS $$
declare
  res jsonb;
begin
  if type_::text = 'bytea' then
    return to_jsonb(val);
  end if;
  execute format('select to_jsonb(%L::'|| type_::text || ')', val) into res;
  return res;
end
$$;


--
-- Name: check_equality_op(realtime.equality_op, regtype, text, text); Type: FUNCTION; Schema: realtime; Owner: -
--

CREATE FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) RETURNS boolean
    LANGUAGE plpgsql IMMUTABLE
    AS $$
      /*
      Casts *val_1* and *val_2* as type *type_* and check the *op* condition for truthiness
      */
      declare
          op_symbol text = (
              case
                  when op = 'eq' then '='
                  when op = 'neq' then '!='
                  when op = 'lt' then '<'
                  when op = 'lte' then '<='
                  when op = 'gt' then '>'
                  when op = 'gte' then '>='
                  when op = 'in' then '= any'
                  else 'UNKNOWN OP'
              end
          );
          res boolean;
      begin
          execute format(
              'select %L::'|| type_::text || ' ' || op_symbol
              || ' ( %L::'
              || (
                  case
                      when op = 'in' then type_::text || '[]'
                      else type_::text end
              )
              || ')', val_1, val_2) into res;
          return res;
      end;
      $$;


--
-- Name: is_visible_through_filters(realtime.wal_column[], realtime.user_defined_filter[]); Type: FUNCTION; Schema: realtime; Owner: -
--

CREATE FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) RETURNS boolean
    LANGUAGE sql IMMUTABLE
    AS $_$
    /*
    Should the record be visible (true) or filtered out (false) after *filters* are applied
    */
        select
            -- Default to allowed when no filters present
            $2 is null -- no filters. this should not happen because subscriptions has a default
            or array_length($2, 1) is null -- array length of an empty array is null
            or bool_and(
                coalesce(
                    realtime.check_equality_op(
                        op:=f.op,
                        type_:=coalesce(
                            col.type_oid::regtype, -- null when wal2json version <= 2.4
                            col.type_name::regtype
                        ),
                        -- cast jsonb to text
                        val_1:=col.value #>> '{}',
                        val_2:=f.value
                    ),
                    false -- if null, filter does not match
                )
            )
        from
            unnest(filters) f
            join unnest(columns) col
                on f.column_name = col.name;
    $_$;


--
-- Name: list_changes(name, name, integer, integer); Type: FUNCTION; Schema: realtime; Owner: -
--

CREATE FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) RETURNS TABLE(wal jsonb, is_rls_enabled boolean, subscription_ids uuid[], errors text[], slot_changes_count bigint)
    LANGUAGE sql
    SET log_min_messages TO 'fatal'
    AS $$
  WITH pub AS (
    SELECT
      concat_ws(
        ',',
        CASE WHEN bool_or(pubinsert) THEN 'insert' ELSE NULL END,
        CASE WHEN bool_or(pubupdate) THEN 'update' ELSE NULL END,
        CASE WHEN bool_or(pubdelete) THEN 'delete' ELSE NULL END
      ) AS w2j_actions,
      coalesce(
        string_agg(
          realtime.quote_wal2json(format('%I.%I', schemaname, tablename)::regclass),
          ','
        ) filter (WHERE ppt.tablename IS NOT NULL AND ppt.tablename NOT LIKE '% %'),
        ''
      ) AS w2j_add_tables
    FROM pg_publication pp
    LEFT JOIN pg_publication_tables ppt ON pp.pubname = ppt.pubname
    WHERE pp.pubname = publication
    GROUP BY pp.pubname
    LIMIT 1
  ),
  -- MATERIALIZED ensures pg_logical_slot_get_changes is called exactly once
  w2j AS MATERIALIZED (
    SELECT x.*, pub.w2j_add_tables
    FROM pub,
         pg_logical_slot_get_changes(
           slot_name, null, max_changes,
           'include-pk', 'true',
           'include-transaction', 'false',
           'include-timestamp', 'true',
           'include-type-oids', 'true',
           'format-version', '2',
           'actions', pub.w2j_actions,
           'add-tables', pub.w2j_add_tables
         ) x
  ),
  -- Count raw slot entries before apply_rls/subscription filter
  slot_count AS (
    SELECT count(*)::bigint AS cnt
    FROM w2j
    WHERE w2j.w2j_add_tables <> ''
  ),
  -- Apply RLS and filter as before
  rls_filtered AS (
    SELECT xyz.wal, xyz.is_rls_enabled, xyz.subscription_ids, xyz.errors
    FROM w2j,
         realtime.apply_rls(
           wal := w2j.data::jsonb,
           max_record_bytes := max_record_bytes
         ) xyz(wal, is_rls_enabled, subscription_ids, errors)
    WHERE w2j.w2j_add_tables <> ''
      AND xyz.subscription_ids[1] IS NOT NULL
  )
  -- Real rows with slot count attached
  SELECT rf.wal, rf.is_rls_enabled, rf.subscription_ids, rf.errors, sc.cnt
  FROM rls_filtered rf, slot_count sc

  UNION ALL

  -- Sentinel row: always returned when no real rows exist so Elixir can
  -- always read slot_changes_count. Identified by wal IS NULL.
  SELECT null, null, null, null, sc.cnt
  FROM slot_count sc
  WHERE NOT EXISTS (SELECT 1 FROM rls_filtered)
$$;


--
-- Name: quote_wal2json(regclass); Type: FUNCTION; Schema: realtime; Owner: -
--

CREATE FUNCTION realtime.quote_wal2json(entity regclass) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $$
      select
        (
          select string_agg('' || ch,'')
          from unnest(string_to_array(nsp.nspname::text, null)) with ordinality x(ch, idx)
          where
            not (x.idx = 1 and x.ch = '"')
            and not (
              x.idx = array_length(string_to_array(nsp.nspname::text, null), 1)
              and x.ch = '"'
            )
        )
        || '.'
        || (
          select string_agg('' || ch,'')
          from unnest(string_to_array(pc.relname::text, null)) with ordinality x(ch, idx)
          where
            not (x.idx = 1 and x.ch = '"')
            and not (
              x.idx = array_length(string_to_array(nsp.nspname::text, null), 1)
              and x.ch = '"'
            )
          )
      from
        pg_class pc
        join pg_namespace nsp
          on pc.relnamespace = nsp.oid
      where
        pc.oid = entity
    $$;


--
-- Name: send(jsonb, text, text, boolean); Type: FUNCTION; Schema: realtime; Owner: -
--

CREATE FUNCTION realtime.send(payload jsonb, event text, topic text, private boolean DEFAULT true) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  generated_id uuid;
  final_payload jsonb;
BEGIN
  BEGIN
    -- Generate a new UUID for the id
    generated_id := gen_random_uuid();

    -- Check if payload has an 'id' key, if not, add the generated UUID
    IF payload ? 'id' THEN
      final_payload := payload;
    ELSE
      final_payload := jsonb_set(payload, '{id}', to_jsonb(generated_id));
    END IF;

    -- Set the topic configuration
    EXECUTE format('SET LOCAL realtime.topic TO %L', topic);

    -- Attempt to insert the message
    INSERT INTO realtime.messages (id, payload, event, topic, private, extension)
    VALUES (generated_id, final_payload, event, topic, private, 'broadcast');
  EXCEPTION
    WHEN OTHERS THEN
      -- Capture and notify the error
      RAISE WARNING 'ErrorSendingBroadcastMessage: %', SQLERRM;
  END;
END;
$$;


--
-- Name: subscription_check_filters(); Type: FUNCTION; Schema: realtime; Owner: -
--

CREATE FUNCTION realtime.subscription_check_filters() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
    /*
    Validates that the user defined filters for a subscription:
    - refer to valid columns that the claimed role may access
    - values are coercable to the correct column type
    */
    declare
        col_names text[] = coalesce(
                array_agg(c.column_name order by c.ordinal_position),
                '{}'::text[]
            )
            from
                information_schema.columns c
            where
                format('%I.%I', c.table_schema, c.table_name)::regclass = new.entity
                and pg_catalog.has_column_privilege(
                    (new.claims ->> 'role'),
                    format('%I.%I', c.table_schema, c.table_name)::regclass,
                    c.column_name,
                    'SELECT'
                );
        filter realtime.user_defined_filter;
        col_type regtype;

        in_val jsonb;
    begin
        for filter in select * from unnest(new.filters) loop
            -- Filtered column is valid
            if not filter.column_name = any(col_names) then
                raise exception 'invalid column for filter %', filter.column_name;
            end if;

            -- Type is sanitized and safe for string interpolation
            col_type = (
                select atttypid::regtype
                from pg_catalog.pg_attribute
                where attrelid = new.entity
                      and attname = filter.column_name
            );
            if col_type is null then
                raise exception 'failed to lookup type for column %', filter.column_name;
            end if;

            -- Set maximum number of entries for in filter
            if filter.op = 'in'::realtime.equality_op then
                in_val = realtime.cast(filter.value, (col_type::text || '[]')::regtype);
                if coalesce(jsonb_array_length(in_val), 0) > 100 then
                    raise exception 'too many values for `in` filter. Maximum 100';
                end if;
            else
                -- raises an exception if value is not coercable to type
                perform realtime.cast(filter.value, col_type);
            end if;

        end loop;

        -- Apply consistent order to filters so the unique constraint on
        -- (subscription_id, entity, filters) can't be tricked by a different filter order
        new.filters = coalesce(
            array_agg(f order by f.column_name, f.op, f.value),
            '{}'
        ) from unnest(new.filters) f;

        return new;
    end;
    $$;


--
-- Name: to_regrole(text); Type: FUNCTION; Schema: realtime; Owner: -
--

CREATE FUNCTION realtime.to_regrole(role_name text) RETURNS regrole
    LANGUAGE sql IMMUTABLE
    AS $$ select role_name::regrole $$;


--
-- Name: topic(); Type: FUNCTION; Schema: realtime; Owner: -
--

CREATE FUNCTION realtime.topic() RETURNS text
    LANGUAGE sql STABLE
    AS $$
select nullif(current_setting('realtime.topic', true), '')::text;
$$;


--
-- Name: allow_any_operation(text[]); Type: FUNCTION; Schema: storage; Owner: -
--

CREATE FUNCTION storage.allow_any_operation(expected_operations text[]) RETURNS boolean
    LANGUAGE sql STABLE
    AS $$
  WITH current_operation AS (
    SELECT storage.operation() AS raw_operation
  ),
  normalized AS (
    SELECT CASE
      WHEN raw_operation LIKE 'storage.%' THEN substr(raw_operation, 9)
      ELSE raw_operation
    END AS current_operation
    FROM current_operation
  )
  SELECT EXISTS (
    SELECT 1
    FROM normalized n
    CROSS JOIN LATERAL unnest(expected_operations) AS expected_operation
    WHERE expected_operation IS NOT NULL
      AND expected_operation <> ''
      AND n.current_operation = CASE
        WHEN expected_operation LIKE 'storage.%' THEN substr(expected_operation, 9)
        ELSE expected_operation
      END
  );
$$;


--
-- Name: allow_only_operation(text); Type: FUNCTION; Schema: storage; Owner: -
--

CREATE FUNCTION storage.allow_only_operation(expected_operation text) RETURNS boolean
    LANGUAGE sql STABLE
    AS $$
  WITH current_operation AS (
    SELECT storage.operation() AS raw_operation
  ),
  normalized AS (
    SELECT
      CASE
        WHEN raw_operation LIKE 'storage.%' THEN substr(raw_operation, 9)
        ELSE raw_operation
      END AS current_operation,
      CASE
        WHEN expected_operation LIKE 'storage.%' THEN substr(expected_operation, 9)
        ELSE expected_operation
      END AS requested_operation
    FROM current_operation
  )
  SELECT CASE
    WHEN requested_operation IS NULL OR requested_operation = '' THEN FALSE
    ELSE COALESCE(current_operation = requested_operation, FALSE)
  END
  FROM normalized;
$$;


--
-- Name: can_insert_object(text, text, uuid, jsonb); Type: FUNCTION; Schema: storage; Owner: -
--

CREATE FUNCTION storage.can_insert_object(bucketid text, name text, owner uuid, metadata jsonb) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
  INSERT INTO "storage"."objects" ("bucket_id", "name", "owner", "metadata") VALUES (bucketid, name, owner, metadata);
  -- hack to rollback the successful insert
  RAISE sqlstate 'PT200' using
  message = 'ROLLBACK',
  detail = 'rollback successful insert';
END
$$;


--
-- Name: delete_leaf_prefixes(text[], text[]); Type: FUNCTION; Schema: storage; Owner: -
--

CREATE FUNCTION storage.delete_leaf_prefixes(bucket_ids text[], names text[]) RETURNS void
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
DECLARE
    v_rows_deleted integer;
BEGIN
    LOOP
        WITH candidates AS (
            SELECT DISTINCT
                t.bucket_id,
                unnest(storage.get_prefixes(t.name)) AS name
            FROM unnest(bucket_ids, names) AS t(bucket_id, name)
        ),
        uniq AS (
             SELECT
                 bucket_id,
                 name,
                 storage.get_level(name) AS level
             FROM candidates
             WHERE name <> ''
             GROUP BY bucket_id, name
        ),
        leaf AS (
             SELECT
                 p.bucket_id,
                 p.name,
                 p.level
             FROM storage.prefixes AS p
                  JOIN uniq AS u
                       ON u.bucket_id = p.bucket_id
                           AND u.name = p.name
                           AND u.level = p.level
             WHERE NOT EXISTS (
                 SELECT 1
                 FROM storage.objects AS o
                 WHERE o.bucket_id = p.bucket_id
                   AND o.level = p.level + 1
                   AND o.name COLLATE "C" LIKE p.name || '/%'
             )
             AND NOT EXISTS (
                 SELECT 1
                 FROM storage.prefixes AS c
                 WHERE c.bucket_id = p.bucket_id
                   AND c.level = p.level + 1
                   AND c.name COLLATE "C" LIKE p.name || '/%'
             )
        )
        DELETE
        FROM storage.prefixes AS p
            USING leaf AS l
        WHERE p.bucket_id = l.bucket_id
          AND p.name = l.name
          AND p.level = l.level;

        GET DIAGNOSTICS v_rows_deleted = ROW_COUNT;
        EXIT WHEN v_rows_deleted = 0;
    END LOOP;
END;
$$;


--
-- Name: enforce_bucket_name_length(); Type: FUNCTION; Schema: storage; Owner: -
--

CREATE FUNCTION storage.enforce_bucket_name_length() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
begin
    if length(new.name) > 100 then
        raise exception 'bucket name "%" is too long (% characters). Max is 100.', new.name, length(new.name);
    end if;
    return new;
end;
$$;


--
-- Name: extension(text); Type: FUNCTION; Schema: storage; Owner: -
--

CREATE FUNCTION storage.extension(name text) RETURNS text
    LANGUAGE plpgsql IMMUTABLE
    AS $$
DECLARE
    _parts text[];
    _filename text;
BEGIN
    SELECT string_to_array(name, '/') INTO _parts;
    SELECT _parts[array_length(_parts,1)] INTO _filename;
    RETURN reverse(split_part(reverse(_filename), '.', 1));
END
$$;


--
-- Name: filename(text); Type: FUNCTION; Schema: storage; Owner: -
--

CREATE FUNCTION storage.filename(name text) RETURNS text
    LANGUAGE plpgsql
    AS $$
DECLARE
_parts text[];
BEGIN
	select string_to_array(name, '/') into _parts;
	return _parts[array_length(_parts,1)];
END
$$;


--
-- Name: foldername(text); Type: FUNCTION; Schema: storage; Owner: -
--

CREATE FUNCTION storage.foldername(name text) RETURNS text[]
    LANGUAGE plpgsql IMMUTABLE
    AS $$
DECLARE
    _parts text[];
BEGIN
    -- Split on "/" to get path segments
    SELECT string_to_array(name, '/') INTO _parts;
    -- Return everything except the last segment
    RETURN _parts[1 : array_length(_parts,1) - 1];
END
$$;


--
-- Name: get_common_prefix(text, text, text); Type: FUNCTION; Schema: storage; Owner: -
--

CREATE FUNCTION storage.get_common_prefix(p_key text, p_prefix text, p_delimiter text) RETURNS text
    LANGUAGE sql IMMUTABLE
    AS $$
SELECT CASE
    WHEN position(p_delimiter IN substring(p_key FROM length(p_prefix) + 1)) > 0
    THEN left(p_key, length(p_prefix) + position(p_delimiter IN substring(p_key FROM length(p_prefix) + 1)))
    ELSE NULL
END;
$$;


--
-- Name: get_level(text); Type: FUNCTION; Schema: storage; Owner: -
--

CREATE FUNCTION storage.get_level(name text) RETURNS integer
    LANGUAGE sql IMMUTABLE STRICT
    AS $$
SELECT array_length(string_to_array("name", '/'), 1);
$$;


--
-- Name: get_prefix(text); Type: FUNCTION; Schema: storage; Owner: -
--

CREATE FUNCTION storage.get_prefix(name text) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
SELECT
    CASE WHEN strpos("name", '/') > 0 THEN
             regexp_replace("name", '[\/]{1}[^\/]+\/?$', '')
         ELSE
             ''
        END;
$_$;


--
-- Name: get_prefixes(text); Type: FUNCTION; Schema: storage; Owner: -
--

CREATE FUNCTION storage.get_prefixes(name text) RETURNS text[]
    LANGUAGE plpgsql IMMUTABLE STRICT
    AS $$
DECLARE
    parts text[];
    prefixes text[];
    prefix text;
BEGIN
    -- Split the name into parts by '/'
    parts := string_to_array("name", '/');
    prefixes := '{}';

    -- Construct the prefixes, stopping one level below the last part
    FOR i IN 1..array_length(parts, 1) - 1 LOOP
            prefix := array_to_string(parts[1:i], '/');
            prefixes := array_append(prefixes, prefix);
    END LOOP;

    RETURN prefixes;
END;
$$;


--
-- Name: get_size_by_bucket(); Type: FUNCTION; Schema: storage; Owner: -
--

CREATE FUNCTION storage.get_size_by_bucket() RETURNS TABLE(size bigint, bucket_id text)
    LANGUAGE plpgsql STABLE
    AS $$
BEGIN
    return query
        select sum((metadata->>'size')::bigint) as size, obj.bucket_id
        from "storage".objects as obj
        group by obj.bucket_id;
END
$$;


--
-- Name: list_multipart_uploads_with_delimiter(text, text, text, integer, text, text); Type: FUNCTION; Schema: storage; Owner: -
--

CREATE FUNCTION storage.list_multipart_uploads_with_delimiter(bucket_id text, prefix_param text, delimiter_param text, max_keys integer DEFAULT 100, next_key_token text DEFAULT ''::text, next_upload_token text DEFAULT ''::text) RETURNS TABLE(key text, id text, created_at timestamp with time zone)
    LANGUAGE plpgsql
    AS $_$
BEGIN
    RETURN QUERY EXECUTE
        'SELECT DISTINCT ON(key COLLATE "C") * from (
            SELECT
                CASE
                    WHEN position($2 IN substring(key from length($1) + 1)) > 0 THEN
                        substring(key from 1 for length($1) + position($2 IN substring(key from length($1) + 1)))
                    ELSE
                        key
                END AS key, id, created_at
            FROM
                storage.s3_multipart_uploads
            WHERE
                bucket_id = $5 AND
                key ILIKE $1 || ''%'' AND
                CASE
                    WHEN $4 != '''' AND $6 = '''' THEN
                        CASE
                            WHEN position($2 IN substring(key from length($1) + 1)) > 0 THEN
                                substring(key from 1 for length($1) + position($2 IN substring(key from length($1) + 1))) COLLATE "C" > $4
                            ELSE
                                key COLLATE "C" > $4
                            END
                    ELSE
                        true
                END AND
                CASE
                    WHEN $6 != '''' THEN
                        id COLLATE "C" > $6
                    ELSE
                        true
                    END
            ORDER BY
                key COLLATE "C" ASC, created_at ASC) as e order by key COLLATE "C" LIMIT $3'
        USING prefix_param, delimiter_param, max_keys, next_key_token, bucket_id, next_upload_token;
END;
$_$;


--
-- Name: list_objects_with_delimiter(text, text, text, integer, text, text, text); Type: FUNCTION; Schema: storage; Owner: -
--

CREATE FUNCTION storage.list_objects_with_delimiter(_bucket_id text, prefix_param text, delimiter_param text, max_keys integer DEFAULT 100, start_after text DEFAULT ''::text, next_token text DEFAULT ''::text, sort_order text DEFAULT 'asc'::text) RETURNS TABLE(name text, id uuid, metadata jsonb, updated_at timestamp with time zone, created_at timestamp with time zone, last_accessed_at timestamp with time zone)
    LANGUAGE plpgsql STABLE
    AS $_$
DECLARE
    v_peek_name TEXT;
    v_current RECORD;
    v_common_prefix TEXT;

    -- Configuration
    v_is_asc BOOLEAN;
    v_prefix TEXT;
    v_start TEXT;
    v_upper_bound TEXT;
    v_file_batch_size INT;

    -- Seek state
    v_next_seek TEXT;
    v_count INT := 0;

    -- Dynamic SQL for batch query only
    v_batch_query TEXT;

BEGIN
    -- ========================================================================
    -- INITIALIZATION
    -- ========================================================================
    v_is_asc := lower(coalesce(sort_order, 'asc')) = 'asc';
    v_prefix := coalesce(prefix_param, '');
    v_start := CASE WHEN coalesce(next_token, '') <> '' THEN next_token ELSE coalesce(start_after, '') END;
    v_file_batch_size := LEAST(GREATEST(max_keys * 2, 100), 1000);

    -- Calculate upper bound for prefix filtering (bytewise, using COLLATE "C")
    IF v_prefix = '' THEN
        v_upper_bound := NULL;
    ELSIF right(v_prefix, 1) = delimiter_param THEN
        v_upper_bound := left(v_prefix, -1) || chr(ascii(delimiter_param) + 1);
    ELSE
        v_upper_bound := left(v_prefix, -1) || chr(ascii(right(v_prefix, 1)) + 1);
    END IF;

    -- Build batch query (dynamic SQL - called infrequently, amortized over many rows)
    IF v_is_asc THEN
        IF v_upper_bound IS NOT NULL THEN
            v_batch_query := 'SELECT o.name, o.id, o.updated_at, o.created_at, o.last_accessed_at, o.metadata ' ||
                'FROM storage.objects o WHERE o.bucket_id = $1 AND o.name COLLATE "C" >= $2 ' ||
                'AND o.name COLLATE "C" < $3 ORDER BY o.name COLLATE "C" ASC LIMIT $4';
        ELSE
            v_batch_query := 'SELECT o.name, o.id, o.updated_at, o.created_at, o.last_accessed_at, o.metadata ' ||
                'FROM storage.objects o WHERE o.bucket_id = $1 AND o.name COLLATE "C" >= $2 ' ||
                'ORDER BY o.name COLLATE "C" ASC LIMIT $4';
        END IF;
    ELSE
        IF v_upper_bound IS NOT NULL THEN
            v_batch_query := 'SELECT o.name, o.id, o.updated_at, o.created_at, o.last_accessed_at, o.metadata ' ||
                'FROM storage.objects o WHERE o.bucket_id = $1 AND o.name COLLATE "C" < $2 ' ||
                'AND o.name COLLATE "C" >= $3 ORDER BY o.name COLLATE "C" DESC LIMIT $4';
        ELSE
            v_batch_query := 'SELECT o.name, o.id, o.updated_at, o.created_at, o.last_accessed_at, o.metadata ' ||
                'FROM storage.objects o WHERE o.bucket_id = $1 AND o.name COLLATE "C" < $2 ' ||
                'ORDER BY o.name COLLATE "C" DESC LIMIT $4';
        END IF;
    END IF;

    -- ========================================================================
    -- SEEK INITIALIZATION: Determine starting position
    -- ========================================================================
    IF v_start = '' THEN
        IF v_is_asc THEN
            v_next_seek := v_prefix;
        ELSE
            -- DESC without cursor: find the last item in range
            IF v_upper_bound IS NOT NULL THEN
                SELECT o.name INTO v_next_seek FROM storage.objects o
                WHERE o.bucket_id = _bucket_id AND o.name COLLATE "C" >= v_prefix AND o.name COLLATE "C" < v_upper_bound
                ORDER BY o.name COLLATE "C" DESC LIMIT 1;
            ELSIF v_prefix <> '' THEN
                SELECT o.name INTO v_next_seek FROM storage.objects o
                WHERE o.bucket_id = _bucket_id AND o.name COLLATE "C" >= v_prefix
                ORDER BY o.name COLLATE "C" DESC LIMIT 1;
            ELSE
                SELECT o.name INTO v_next_seek FROM storage.objects o
                WHERE o.bucket_id = _bucket_id
                ORDER BY o.name COLLATE "C" DESC LIMIT 1;
            END IF;

            IF v_next_seek IS NOT NULL THEN
                v_next_seek := v_next_seek || delimiter_param;
            ELSE
                RETURN;
            END IF;
        END IF;
    ELSE
        -- Cursor provided: determine if it refers to a folder or leaf
        IF EXISTS (
            SELECT 1 FROM storage.objects o
            WHERE o.bucket_id = _bucket_id
              AND o.name COLLATE "C" LIKE v_start || delimiter_param || '%'
            LIMIT 1
        ) THEN
            -- Cursor refers to a folder
            IF v_is_asc THEN
                v_next_seek := v_start || chr(ascii(delimiter_param) + 1);
            ELSE
                v_next_seek := v_start || delimiter_param;
            END IF;
        ELSE
            -- Cursor refers to a leaf object
            IF v_is_asc THEN
                v_next_seek := v_start || delimiter_param;
            ELSE
                v_next_seek := v_start;
            END IF;
        END IF;
    END IF;

    -- ========================================================================
    -- MAIN LOOP: Hybrid peek-then-batch algorithm
    -- Uses STATIC SQL for peek (hot path) and DYNAMIC SQL for batch
    -- ========================================================================
    LOOP
        EXIT WHEN v_count >= max_keys;

        -- STEP 1: PEEK using STATIC SQL (plan cached, very fast)
        IF v_is_asc THEN
            IF v_upper_bound IS NOT NULL THEN
                SELECT o.name INTO v_peek_name FROM storage.objects o
                WHERE o.bucket_id = _bucket_id AND o.name COLLATE "C" >= v_next_seek AND o.name COLLATE "C" < v_upper_bound
                ORDER BY o.name COLLATE "C" ASC LIMIT 1;
            ELSE
                SELECT o.name INTO v_peek_name FROM storage.objects o
                WHERE o.bucket_id = _bucket_id AND o.name COLLATE "C" >= v_next_seek
                ORDER BY o.name COLLATE "C" ASC LIMIT 1;
            END IF;
        ELSE
            IF v_upper_bound IS NOT NULL THEN
                SELECT o.name INTO v_peek_name FROM storage.objects o
                WHERE o.bucket_id = _bucket_id AND o.name COLLATE "C" < v_next_seek AND o.name COLLATE "C" >= v_prefix
                ORDER BY o.name COLLATE "C" DESC LIMIT 1;
            ELSIF v_prefix <> '' THEN
                SELECT o.name INTO v_peek_name FROM storage.objects o
                WHERE o.bucket_id = _bucket_id AND o.name COLLATE "C" < v_next_seek AND o.name COLLATE "C" >= v_prefix
                ORDER BY o.name COLLATE "C" DESC LIMIT 1;
            ELSE
                SELECT o.name INTO v_peek_name FROM storage.objects o
                WHERE o.bucket_id = _bucket_id AND o.name COLLATE "C" < v_next_seek
                ORDER BY o.name COLLATE "C" DESC LIMIT 1;
            END IF;
        END IF;

        EXIT WHEN v_peek_name IS NULL;

        -- STEP 2: Check if this is a FOLDER or FILE
        v_common_prefix := storage.get_common_prefix(v_peek_name, v_prefix, delimiter_param);

        IF v_common_prefix IS NOT NULL THEN
            -- FOLDER: Emit and skip to next folder (no heap access needed)
            name := rtrim(v_common_prefix, delimiter_param);
            id := NULL;
            updated_at := NULL;
            created_at := NULL;
            last_accessed_at := NULL;
            metadata := NULL;
            RETURN NEXT;
            v_count := v_count + 1;

            -- Advance seek past the folder range
            IF v_is_asc THEN
                v_next_seek := left(v_common_prefix, -1) || chr(ascii(delimiter_param) + 1);
            ELSE
                v_next_seek := v_common_prefix;
            END IF;
        ELSE
            -- FILE: Batch fetch using DYNAMIC SQL (overhead amortized over many rows)
            -- For ASC: upper_bound is the exclusive upper limit (< condition)
            -- For DESC: prefix is the inclusive lower limit (>= condition)
            FOR v_current IN EXECUTE v_batch_query USING _bucket_id, v_next_seek,
                CASE WHEN v_is_asc THEN COALESCE(v_upper_bound, v_prefix) ELSE v_prefix END, v_file_batch_size
            LOOP
                v_common_prefix := storage.get_common_prefix(v_current.name, v_prefix, delimiter_param);

                IF v_common_prefix IS NOT NULL THEN
                    -- Hit a folder: exit batch, let peek handle it
                    v_next_seek := v_current.name;
                    EXIT;
                END IF;

                -- Emit file
                name := v_current.name;
                id := v_current.id;
                updated_at := v_current.updated_at;
                created_at := v_current.created_at;
                last_accessed_at := v_current.last_accessed_at;
                metadata := v_current.metadata;
                RETURN NEXT;
                v_count := v_count + 1;

                -- Advance seek past this file
                IF v_is_asc THEN
                    v_next_seek := v_current.name || delimiter_param;
                ELSE
                    v_next_seek := v_current.name;
                END IF;

                EXIT WHEN v_count >= max_keys;
            END LOOP;
        END IF;
    END LOOP;
END;
$_$;


--
-- Name: operation(); Type: FUNCTION; Schema: storage; Owner: -
--

CREATE FUNCTION storage.operation() RETURNS text
    LANGUAGE plpgsql STABLE
    AS $$
BEGIN
    RETURN current_setting('storage.operation', true);
END;
$$;


--
-- Name: protect_delete(); Type: FUNCTION; Schema: storage; Owner: -
--

CREATE FUNCTION storage.protect_delete() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    -- Check if storage.allow_delete_query is set to 'true'
    IF COALESCE(current_setting('storage.allow_delete_query', true), 'false') != 'true' THEN
        RAISE EXCEPTION 'Direct deletion from storage tables is not allowed. Use the Storage API instead.'
            USING HINT = 'This prevents accidental data loss from orphaned objects.',
                  ERRCODE = '42501';
    END IF;
    RETURN NULL;
END;
$$;


--
-- Name: search(text, text, integer, integer, integer, text, text, text); Type: FUNCTION; Schema: storage; Owner: -
--

CREATE FUNCTION storage.search(prefix text, bucketname text, limits integer DEFAULT 100, levels integer DEFAULT 1, offsets integer DEFAULT 0, search text DEFAULT ''::text, sortcolumn text DEFAULT 'name'::text, sortorder text DEFAULT 'asc'::text) RETURNS TABLE(name text, id uuid, updated_at timestamp with time zone, created_at timestamp with time zone, last_accessed_at timestamp with time zone, metadata jsonb)
    LANGUAGE plpgsql STABLE
    AS $_$
DECLARE
    v_peek_name TEXT;
    v_current RECORD;
    v_common_prefix TEXT;
    v_delimiter CONSTANT TEXT := '/';

    -- Configuration
    v_limit INT;
    v_prefix TEXT;
    v_prefix_lower TEXT;
    v_is_asc BOOLEAN;
    v_order_by TEXT;
    v_sort_order TEXT;
    v_upper_bound TEXT;
    v_file_batch_size INT;

    -- Dynamic SQL for batch query only
    v_batch_query TEXT;

    -- Seek state
    v_next_seek TEXT;
    v_count INT := 0;
    v_skipped INT := 0;
BEGIN
    -- ========================================================================
    -- INITIALIZATION
    -- ========================================================================
    v_limit := LEAST(coalesce(limits, 100), 1500);
    v_prefix := coalesce(prefix, '') || coalesce(search, '');
    v_prefix_lower := lower(v_prefix);
    v_is_asc := lower(coalesce(sortorder, 'asc')) = 'asc';
    v_file_batch_size := LEAST(GREATEST(v_limit * 2, 100), 1000);

    -- Validate sort column
    CASE lower(coalesce(sortcolumn, 'name'))
        WHEN 'name' THEN v_order_by := 'name';
        WHEN 'updated_at' THEN v_order_by := 'updated_at';
        WHEN 'created_at' THEN v_order_by := 'created_at';
        WHEN 'last_accessed_at' THEN v_order_by := 'last_accessed_at';
        ELSE v_order_by := 'name';
    END CASE;

    v_sort_order := CASE WHEN v_is_asc THEN 'asc' ELSE 'desc' END;

    -- ========================================================================
    -- NON-NAME SORTING: Use path_tokens approach (unchanged)
    -- ========================================================================
    IF v_order_by != 'name' THEN
        RETURN QUERY EXECUTE format(
            $sql$
            WITH folders AS (
                SELECT path_tokens[$1] AS folder
                FROM storage.objects
                WHERE objects.name ILIKE $2 || '%%'
                  AND bucket_id = $3
                  AND array_length(objects.path_tokens, 1) <> $1
                GROUP BY folder
                ORDER BY folder %s
            )
            (SELECT folder AS "name",
                   NULL::uuid AS id,
                   NULL::timestamptz AS updated_at,
                   NULL::timestamptz AS created_at,
                   NULL::timestamptz AS last_accessed_at,
                   NULL::jsonb AS metadata FROM folders)
            UNION ALL
            (SELECT path_tokens[$1] AS "name",
                   id, updated_at, created_at, last_accessed_at, metadata
             FROM storage.objects
             WHERE objects.name ILIKE $2 || '%%'
               AND bucket_id = $3
               AND array_length(objects.path_tokens, 1) = $1
             ORDER BY %I %s)
            LIMIT $4 OFFSET $5
            $sql$, v_sort_order, v_order_by, v_sort_order
        ) USING levels, v_prefix, bucketname, v_limit, offsets;
        RETURN;
    END IF;

    -- ========================================================================
    -- NAME SORTING: Hybrid skip-scan with batch optimization
    -- ========================================================================

    -- Calculate upper bound for prefix filtering
    IF v_prefix_lower = '' THEN
        v_upper_bound := NULL;
    ELSIF right(v_prefix_lower, 1) = v_delimiter THEN
        v_upper_bound := left(v_prefix_lower, -1) || chr(ascii(v_delimiter) + 1);
    ELSE
        v_upper_bound := left(v_prefix_lower, -1) || chr(ascii(right(v_prefix_lower, 1)) + 1);
    END IF;

    -- Build batch query (dynamic SQL - called infrequently, amortized over many rows)
    IF v_is_asc THEN
        IF v_upper_bound IS NOT NULL THEN
            v_batch_query := 'SELECT o.name, o.id, o.updated_at, o.created_at, o.last_accessed_at, o.metadata ' ||
                'FROM storage.objects o WHERE o.bucket_id = $1 AND lower(o.name) COLLATE "C" >= $2 ' ||
                'AND lower(o.name) COLLATE "C" < $3 ORDER BY lower(o.name) COLLATE "C" ASC LIMIT $4';
        ELSE
            v_batch_query := 'SELECT o.name, o.id, o.updated_at, o.created_at, o.last_accessed_at, o.metadata ' ||
                'FROM storage.objects o WHERE o.bucket_id = $1 AND lower(o.name) COLLATE "C" >= $2 ' ||
                'ORDER BY lower(o.name) COLLATE "C" ASC LIMIT $4';
        END IF;
    ELSE
        IF v_upper_bound IS NOT NULL THEN
            v_batch_query := 'SELECT o.name, o.id, o.updated_at, o.created_at, o.last_accessed_at, o.metadata ' ||
                'FROM storage.objects o WHERE o.bucket_id = $1 AND lower(o.name) COLLATE "C" < $2 ' ||
                'AND lower(o.name) COLLATE "C" >= $3 ORDER BY lower(o.name) COLLATE "C" DESC LIMIT $4';
        ELSE
            v_batch_query := 'SELECT o.name, o.id, o.updated_at, o.created_at, o.last_accessed_at, o.metadata ' ||
                'FROM storage.objects o WHERE o.bucket_id = $1 AND lower(o.name) COLLATE "C" < $2 ' ||
                'ORDER BY lower(o.name) COLLATE "C" DESC LIMIT $4';
        END IF;
    END IF;

    -- Initialize seek position
    IF v_is_asc THEN
        v_next_seek := v_prefix_lower;
    ELSE
        -- DESC: find the last item in range first (static SQL)
        IF v_upper_bound IS NOT NULL THEN
            SELECT o.name INTO v_peek_name FROM storage.objects o
            WHERE o.bucket_id = bucketname AND lower(o.name) COLLATE "C" >= v_prefix_lower AND lower(o.name) COLLATE "C" < v_upper_bound
            ORDER BY lower(o.name) COLLATE "C" DESC LIMIT 1;
        ELSIF v_prefix_lower <> '' THEN
            SELECT o.name INTO v_peek_name FROM storage.objects o
            WHERE o.bucket_id = bucketname AND lower(o.name) COLLATE "C" >= v_prefix_lower
            ORDER BY lower(o.name) COLLATE "C" DESC LIMIT 1;
        ELSE
            SELECT o.name INTO v_peek_name FROM storage.objects o
            WHERE o.bucket_id = bucketname
            ORDER BY lower(o.name) COLLATE "C" DESC LIMIT 1;
        END IF;

        IF v_peek_name IS NOT NULL THEN
            v_next_seek := lower(v_peek_name) || v_delimiter;
        ELSE
            RETURN;
        END IF;
    END IF;

    -- ========================================================================
    -- MAIN LOOP: Hybrid peek-then-batch algorithm
    -- Uses STATIC SQL for peek (hot path) and DYNAMIC SQL for batch
    -- ========================================================================
    LOOP
        EXIT WHEN v_count >= v_limit;

        -- STEP 1: PEEK using STATIC SQL (plan cached, very fast)
        IF v_is_asc THEN
            IF v_upper_bound IS NOT NULL THEN
                SELECT o.name INTO v_peek_name FROM storage.objects o
                WHERE o.bucket_id = bucketname AND lower(o.name) COLLATE "C" >= v_next_seek AND lower(o.name) COLLATE "C" < v_upper_bound
                ORDER BY lower(o.name) COLLATE "C" ASC LIMIT 1;
            ELSE
                SELECT o.name INTO v_peek_name FROM storage.objects o
                WHERE o.bucket_id = bucketname AND lower(o.name) COLLATE "C" >= v_next_seek
                ORDER BY lower(o.name) COLLATE "C" ASC LIMIT 1;
            END IF;
        ELSE
            IF v_upper_bound IS NOT NULL THEN
                SELECT o.name INTO v_peek_name FROM storage.objects o
                WHERE o.bucket_id = bucketname AND lower(o.name) COLLATE "C" < v_next_seek AND lower(o.name) COLLATE "C" >= v_prefix_lower
                ORDER BY lower(o.name) COLLATE "C" DESC LIMIT 1;
            ELSIF v_prefix_lower <> '' THEN
                SELECT o.name INTO v_peek_name FROM storage.objects o
                WHERE o.bucket_id = bucketname AND lower(o.name) COLLATE "C" < v_next_seek AND lower(o.name) COLLATE "C" >= v_prefix_lower
                ORDER BY lower(o.name) COLLATE "C" DESC LIMIT 1;
            ELSE
                SELECT o.name INTO v_peek_name FROM storage.objects o
                WHERE o.bucket_id = bucketname AND lower(o.name) COLLATE "C" < v_next_seek
                ORDER BY lower(o.name) COLLATE "C" DESC LIMIT 1;
            END IF;
        END IF;

        EXIT WHEN v_peek_name IS NULL;

        -- STEP 2: Check if this is a FOLDER or FILE
        v_common_prefix := storage.get_common_prefix(lower(v_peek_name), v_prefix_lower, v_delimiter);

        IF v_common_prefix IS NOT NULL THEN
            -- FOLDER: Handle offset, emit if needed, skip to next folder
            IF v_skipped < offsets THEN
                v_skipped := v_skipped + 1;
            ELSE
                name := split_part(rtrim(storage.get_common_prefix(v_peek_name, v_prefix, v_delimiter), v_delimiter), v_delimiter, levels);
                id := NULL;
                updated_at := NULL;
                created_at := NULL;
                last_accessed_at := NULL;
                metadata := NULL;
                RETURN NEXT;
                v_count := v_count + 1;
            END IF;

            -- Advance seek past the folder range
            IF v_is_asc THEN
                v_next_seek := lower(left(v_common_prefix, -1)) || chr(ascii(v_delimiter) + 1);
            ELSE
                v_next_seek := lower(v_common_prefix);
            END IF;
        ELSE
            -- FILE: Batch fetch using DYNAMIC SQL (overhead amortized over many rows)
            -- For ASC: upper_bound is the exclusive upper limit (< condition)
            -- For DESC: prefix_lower is the inclusive lower limit (>= condition)
            FOR v_current IN EXECUTE v_batch_query
                USING bucketname, v_next_seek,
                    CASE WHEN v_is_asc THEN COALESCE(v_upper_bound, v_prefix_lower) ELSE v_prefix_lower END, v_file_batch_size
            LOOP
                v_common_prefix := storage.get_common_prefix(lower(v_current.name), v_prefix_lower, v_delimiter);

                IF v_common_prefix IS NOT NULL THEN
                    -- Hit a folder: exit batch, let peek handle it
                    v_next_seek := lower(v_current.name);
                    EXIT;
                END IF;

                -- Handle offset skipping
                IF v_skipped < offsets THEN
                    v_skipped := v_skipped + 1;
                ELSE
                    -- Emit file
                    name := split_part(v_current.name, v_delimiter, levels);
                    id := v_current.id;
                    updated_at := v_current.updated_at;
                    created_at := v_current.created_at;
                    last_accessed_at := v_current.last_accessed_at;
                    metadata := v_current.metadata;
                    RETURN NEXT;
                    v_count := v_count + 1;
                END IF;

                -- Advance seek past this file
                IF v_is_asc THEN
                    v_next_seek := lower(v_current.name) || v_delimiter;
                ELSE
                    v_next_seek := lower(v_current.name);
                END IF;

                EXIT WHEN v_count >= v_limit;
            END LOOP;
        END IF;
    END LOOP;
END;
$_$;


--
-- Name: search_by_timestamp(text, text, integer, integer, text, text, text, text); Type: FUNCTION; Schema: storage; Owner: -
--

CREATE FUNCTION storage.search_by_timestamp(p_prefix text, p_bucket_id text, p_limit integer, p_level integer, p_start_after text, p_sort_order text, p_sort_column text, p_sort_column_after text) RETURNS TABLE(key text, name text, id uuid, updated_at timestamp with time zone, created_at timestamp with time zone, last_accessed_at timestamp with time zone, metadata jsonb)
    LANGUAGE plpgsql STABLE
    AS $_$
DECLARE
    v_cursor_op text;
    v_query text;
    v_prefix text;
BEGIN
    v_prefix := coalesce(p_prefix, '');

    IF p_sort_order = 'asc' THEN
        v_cursor_op := '>';
    ELSE
        v_cursor_op := '<';
    END IF;

    v_query := format($sql$
        WITH raw_objects AS (
            SELECT
                o.name AS obj_name,
                o.id AS obj_id,
                o.updated_at AS obj_updated_at,
                o.created_at AS obj_created_at,
                o.last_accessed_at AS obj_last_accessed_at,
                o.metadata AS obj_metadata,
                storage.get_common_prefix(o.name, $1, '/') AS common_prefix
            FROM storage.objects o
            WHERE o.bucket_id = $2
              AND o.name COLLATE "C" LIKE $1 || '%%'
        ),
        -- Aggregate common prefixes (folders)
        -- Both created_at and updated_at use MIN(obj_created_at) to match the old prefixes table behavior
        aggregated_prefixes AS (
            SELECT
                rtrim(common_prefix, '/') AS name,
                NULL::uuid AS id,
                MIN(obj_created_at) AS updated_at,
                MIN(obj_created_at) AS created_at,
                NULL::timestamptz AS last_accessed_at,
                NULL::jsonb AS metadata,
                TRUE AS is_prefix
            FROM raw_objects
            WHERE common_prefix IS NOT NULL
            GROUP BY common_prefix
        ),
        leaf_objects AS (
            SELECT
                obj_name AS name,
                obj_id AS id,
                obj_updated_at AS updated_at,
                obj_created_at AS created_at,
                obj_last_accessed_at AS last_accessed_at,
                obj_metadata AS metadata,
                FALSE AS is_prefix
            FROM raw_objects
            WHERE common_prefix IS NULL
        ),
        combined AS (
            SELECT * FROM aggregated_prefixes
            UNION ALL
            SELECT * FROM leaf_objects
        ),
        filtered AS (
            SELECT *
            FROM combined
            WHERE (
                $5 = ''
                OR ROW(
                    date_trunc('milliseconds', %I),
                    name COLLATE "C"
                ) %s ROW(
                    COALESCE(NULLIF($6, '')::timestamptz, 'epoch'::timestamptz),
                    $5
                )
            )
        )
        SELECT
            split_part(name, '/', $3) AS key,
            name,
            id,
            updated_at,
            created_at,
            last_accessed_at,
            metadata
        FROM filtered
        ORDER BY
            COALESCE(date_trunc('milliseconds', %I), 'epoch'::timestamptz) %s,
            name COLLATE "C" %s
        LIMIT $4
    $sql$,
        p_sort_column,
        v_cursor_op,
        p_sort_column,
        p_sort_order,
        p_sort_order
    );

    RETURN QUERY EXECUTE v_query
    USING v_prefix, p_bucket_id, p_level, p_limit, p_start_after, p_sort_column_after;
END;
$_$;


--
-- Name: search_legacy_v1(text, text, integer, integer, integer, text, text, text); Type: FUNCTION; Schema: storage; Owner: -
--

CREATE FUNCTION storage.search_legacy_v1(prefix text, bucketname text, limits integer DEFAULT 100, levels integer DEFAULT 1, offsets integer DEFAULT 0, search text DEFAULT ''::text, sortcolumn text DEFAULT 'name'::text, sortorder text DEFAULT 'asc'::text) RETURNS TABLE(name text, id uuid, updated_at timestamp with time zone, created_at timestamp with time zone, last_accessed_at timestamp with time zone, metadata jsonb)
    LANGUAGE plpgsql STABLE
    AS $_$
declare
    v_order_by text;
    v_sort_order text;
begin
    case
        when sortcolumn = 'name' then
            v_order_by = 'name';
        when sortcolumn = 'updated_at' then
            v_order_by = 'updated_at';
        when sortcolumn = 'created_at' then
            v_order_by = 'created_at';
        when sortcolumn = 'last_accessed_at' then
            v_order_by = 'last_accessed_at';
        else
            v_order_by = 'name';
        end case;

    case
        when sortorder = 'asc' then
            v_sort_order = 'asc';
        when sortorder = 'desc' then
            v_sort_order = 'desc';
        else
            v_sort_order = 'asc';
        end case;

    v_order_by = v_order_by || ' ' || v_sort_order;

    return query execute
        'with folders as (
           select path_tokens[$1] as folder
           from storage.objects
             where objects.name ilike $2 || $3 || ''%''
               and bucket_id = $4
               and array_length(objects.path_tokens, 1) <> $1
           group by folder
           order by folder ' || v_sort_order || '
     )
     (select folder as "name",
            null as id,
            null as updated_at,
            null as created_at,
            null as last_accessed_at,
            null as metadata from folders)
     union all
     (select path_tokens[$1] as "name",
            id,
            updated_at,
            created_at,
            last_accessed_at,
            metadata
     from storage.objects
     where objects.name ilike $2 || $3 || ''%''
       and bucket_id = $4
       and array_length(objects.path_tokens, 1) = $1
     order by ' || v_order_by || ')
     limit $5
     offset $6' using levels, prefix, search, bucketname, limits, offsets;
end;
$_$;


--
-- Name: search_v2(text, text, integer, integer, text, text, text, text); Type: FUNCTION; Schema: storage; Owner: -
--

CREATE FUNCTION storage.search_v2(prefix text, bucket_name text, limits integer DEFAULT 100, levels integer DEFAULT 1, start_after text DEFAULT ''::text, sort_order text DEFAULT 'asc'::text, sort_column text DEFAULT 'name'::text, sort_column_after text DEFAULT ''::text) RETURNS TABLE(key text, name text, id uuid, updated_at timestamp with time zone, created_at timestamp with time zone, last_accessed_at timestamp with time zone, metadata jsonb)
    LANGUAGE plpgsql STABLE
    AS $$
DECLARE
    v_sort_col text;
    v_sort_ord text;
    v_limit int;
BEGIN
    -- Cap limit to maximum of 1500 records
    v_limit := LEAST(coalesce(limits, 100), 1500);

    -- Validate and normalize sort_order
    v_sort_ord := lower(coalesce(sort_order, 'asc'));
    IF v_sort_ord NOT IN ('asc', 'desc') THEN
        v_sort_ord := 'asc';
    END IF;

    -- Validate and normalize sort_column
    v_sort_col := lower(coalesce(sort_column, 'name'));
    IF v_sort_col NOT IN ('name', 'updated_at', 'created_at') THEN
        v_sort_col := 'name';
    END IF;

    -- Route to appropriate implementation
    IF v_sort_col = 'name' THEN
        -- Use list_objects_with_delimiter for name sorting (most efficient: O(k * log n))
        RETURN QUERY
        SELECT
            split_part(l.name, '/', levels) AS key,
            l.name AS name,
            l.id,
            l.updated_at,
            l.created_at,
            l.last_accessed_at,
            l.metadata
        FROM storage.list_objects_with_delimiter(
            bucket_name,
            coalesce(prefix, ''),
            '/',
            v_limit,
            start_after,
            '',
            v_sort_ord
        ) l;
    ELSE
        -- Use aggregation approach for timestamp sorting
        -- Not efficient for large datasets but supports correct pagination
        RETURN QUERY SELECT * FROM storage.search_by_timestamp(
            prefix, bucket_name, v_limit, levels, start_after,
            v_sort_ord, v_sort_col, sort_column_after
        );
    END IF;
END;
$$;


--
-- Name: update_updated_at_column(); Type: FUNCTION; Schema: storage; Owner: -
--

CREATE FUNCTION storage.update_updated_at_column() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    NEW.updated_at = now();
    RETURN NEW; 
END;
$$;


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: audit_log_entries; Type: TABLE; Schema: auth; Owner: -
--

CREATE TABLE auth.audit_log_entries (
    instance_id uuid,
    id uuid NOT NULL,
    payload json,
    created_at timestamp with time zone,
    ip_address character varying(64) DEFAULT ''::character varying NOT NULL
);


--
-- Name: TABLE audit_log_entries; Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON TABLE auth.audit_log_entries IS 'Auth: Audit trail for user actions.';


--
-- Name: custom_oauth_providers; Type: TABLE; Schema: auth; Owner: -
--

CREATE TABLE auth.custom_oauth_providers (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    provider_type text NOT NULL,
    identifier text NOT NULL,
    name text NOT NULL,
    client_id text NOT NULL,
    client_secret text NOT NULL,
    acceptable_client_ids text[] DEFAULT '{}'::text[] NOT NULL,
    scopes text[] DEFAULT '{}'::text[] NOT NULL,
    pkce_enabled boolean DEFAULT true NOT NULL,
    attribute_mapping jsonb DEFAULT '{}'::jsonb NOT NULL,
    authorization_params jsonb DEFAULT '{}'::jsonb NOT NULL,
    enabled boolean DEFAULT true NOT NULL,
    email_optional boolean DEFAULT false NOT NULL,
    issuer text,
    discovery_url text,
    skip_nonce_check boolean DEFAULT false NOT NULL,
    cached_discovery jsonb,
    discovery_cached_at timestamp with time zone,
    authorization_url text,
    token_url text,
    userinfo_url text,
    jwks_uri text,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    CONSTRAINT custom_oauth_providers_authorization_url_https CHECK (((authorization_url IS NULL) OR (authorization_url ~~ 'https://%'::text))),
    CONSTRAINT custom_oauth_providers_authorization_url_length CHECK (((authorization_url IS NULL) OR (char_length(authorization_url) <= 2048))),
    CONSTRAINT custom_oauth_providers_client_id_length CHECK (((char_length(client_id) >= 1) AND (char_length(client_id) <= 512))),
    CONSTRAINT custom_oauth_providers_discovery_url_length CHECK (((discovery_url IS NULL) OR (char_length(discovery_url) <= 2048))),
    CONSTRAINT custom_oauth_providers_identifier_format CHECK ((identifier ~ '^[a-z0-9][a-z0-9:-]{0,48}[a-z0-9]$'::text)),
    CONSTRAINT custom_oauth_providers_issuer_length CHECK (((issuer IS NULL) OR ((char_length(issuer) >= 1) AND (char_length(issuer) <= 2048)))),
    CONSTRAINT custom_oauth_providers_jwks_uri_https CHECK (((jwks_uri IS NULL) OR (jwks_uri ~~ 'https://%'::text))),
    CONSTRAINT custom_oauth_providers_jwks_uri_length CHECK (((jwks_uri IS NULL) OR (char_length(jwks_uri) <= 2048))),
    CONSTRAINT custom_oauth_providers_name_length CHECK (((char_length(name) >= 1) AND (char_length(name) <= 100))),
    CONSTRAINT custom_oauth_providers_oauth2_requires_endpoints CHECK (((provider_type <> 'oauth2'::text) OR ((authorization_url IS NOT NULL) AND (token_url IS NOT NULL) AND (userinfo_url IS NOT NULL)))),
    CONSTRAINT custom_oauth_providers_oidc_discovery_url_https CHECK (((provider_type <> 'oidc'::text) OR (discovery_url IS NULL) OR (discovery_url ~~ 'https://%'::text))),
    CONSTRAINT custom_oauth_providers_oidc_issuer_https CHECK (((provider_type <> 'oidc'::text) OR (issuer IS NULL) OR (issuer ~~ 'https://%'::text))),
    CONSTRAINT custom_oauth_providers_oidc_requires_issuer CHECK (((provider_type <> 'oidc'::text) OR (issuer IS NOT NULL))),
    CONSTRAINT custom_oauth_providers_provider_type_check CHECK ((provider_type = ANY (ARRAY['oauth2'::text, 'oidc'::text]))),
    CONSTRAINT custom_oauth_providers_token_url_https CHECK (((token_url IS NULL) OR (token_url ~~ 'https://%'::text))),
    CONSTRAINT custom_oauth_providers_token_url_length CHECK (((token_url IS NULL) OR (char_length(token_url) <= 2048))),
    CONSTRAINT custom_oauth_providers_userinfo_url_https CHECK (((userinfo_url IS NULL) OR (userinfo_url ~~ 'https://%'::text))),
    CONSTRAINT custom_oauth_providers_userinfo_url_length CHECK (((userinfo_url IS NULL) OR (char_length(userinfo_url) <= 2048)))
);


--
-- Name: flow_state; Type: TABLE; Schema: auth; Owner: -
--

CREATE TABLE auth.flow_state (
    id uuid NOT NULL,
    user_id uuid,
    auth_code text,
    code_challenge_method auth.code_challenge_method,
    code_challenge text,
    provider_type text NOT NULL,
    provider_access_token text,
    provider_refresh_token text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    authentication_method text NOT NULL,
    auth_code_issued_at timestamp with time zone,
    invite_token text,
    referrer text,
    oauth_client_state_id uuid,
    linking_target_id uuid,
    email_optional boolean DEFAULT false NOT NULL
);


--
-- Name: TABLE flow_state; Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON TABLE auth.flow_state IS 'Stores metadata for all OAuth/SSO login flows';


--
-- Name: identities; Type: TABLE; Schema: auth; Owner: -
--

CREATE TABLE auth.identities (
    provider_id text NOT NULL,
    user_id uuid NOT NULL,
    identity_data jsonb NOT NULL,
    provider text NOT NULL,
    last_sign_in_at timestamp with time zone,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    email text GENERATED ALWAYS AS (lower((identity_data ->> 'email'::text))) STORED,
    id uuid DEFAULT gen_random_uuid() NOT NULL
);


--
-- Name: TABLE identities; Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON TABLE auth.identities IS 'Auth: Stores identities associated to a user.';


--
-- Name: COLUMN identities.email; Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON COLUMN auth.identities.email IS 'Auth: Email is a generated column that references the optional email property in the identity_data';


--
-- Name: instances; Type: TABLE; Schema: auth; Owner: -
--

CREATE TABLE auth.instances (
    id uuid NOT NULL,
    uuid uuid,
    raw_base_config text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


--
-- Name: TABLE instances; Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON TABLE auth.instances IS 'Auth: Manages users across multiple sites.';


--
-- Name: mfa_amr_claims; Type: TABLE; Schema: auth; Owner: -
--

CREATE TABLE auth.mfa_amr_claims (
    session_id uuid NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    authentication_method text NOT NULL,
    id uuid NOT NULL
);


--
-- Name: TABLE mfa_amr_claims; Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON TABLE auth.mfa_amr_claims IS 'auth: stores authenticator method reference claims for multi factor authentication';


--
-- Name: mfa_challenges; Type: TABLE; Schema: auth; Owner: -
--

CREATE TABLE auth.mfa_challenges (
    id uuid NOT NULL,
    factor_id uuid NOT NULL,
    created_at timestamp with time zone NOT NULL,
    verified_at timestamp with time zone,
    ip_address inet NOT NULL,
    otp_code text,
    web_authn_session_data jsonb
);


--
-- Name: TABLE mfa_challenges; Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON TABLE auth.mfa_challenges IS 'auth: stores metadata about challenge requests made';


--
-- Name: mfa_factors; Type: TABLE; Schema: auth; Owner: -
--

CREATE TABLE auth.mfa_factors (
    id uuid NOT NULL,
    user_id uuid NOT NULL,
    friendly_name text,
    factor_type auth.factor_type NOT NULL,
    status auth.factor_status NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    secret text,
    phone text,
    last_challenged_at timestamp with time zone,
    web_authn_credential jsonb,
    web_authn_aaguid uuid,
    last_webauthn_challenge_data jsonb
);


--
-- Name: TABLE mfa_factors; Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON TABLE auth.mfa_factors IS 'auth: stores metadata about factors';


--
-- Name: COLUMN mfa_factors.last_webauthn_challenge_data; Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON COLUMN auth.mfa_factors.last_webauthn_challenge_data IS 'Stores the latest WebAuthn challenge data including attestation/assertion for customer verification';


--
-- Name: oauth_authorizations; Type: TABLE; Schema: auth; Owner: -
--

CREATE TABLE auth.oauth_authorizations (
    id uuid NOT NULL,
    authorization_id text NOT NULL,
    client_id uuid NOT NULL,
    user_id uuid,
    redirect_uri text NOT NULL,
    scope text NOT NULL,
    state text,
    resource text,
    code_challenge text,
    code_challenge_method auth.code_challenge_method,
    response_type auth.oauth_response_type DEFAULT 'code'::auth.oauth_response_type NOT NULL,
    status auth.oauth_authorization_status DEFAULT 'pending'::auth.oauth_authorization_status NOT NULL,
    authorization_code text,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    expires_at timestamp with time zone DEFAULT (now() + '00:03:00'::interval) NOT NULL,
    approved_at timestamp with time zone,
    nonce text,
    CONSTRAINT oauth_authorizations_authorization_code_length CHECK ((char_length(authorization_code) <= 255)),
    CONSTRAINT oauth_authorizations_code_challenge_length CHECK ((char_length(code_challenge) <= 128)),
    CONSTRAINT oauth_authorizations_expires_at_future CHECK ((expires_at > created_at)),
    CONSTRAINT oauth_authorizations_nonce_length CHECK ((char_length(nonce) <= 255)),
    CONSTRAINT oauth_authorizations_redirect_uri_length CHECK ((char_length(redirect_uri) <= 2048)),
    CONSTRAINT oauth_authorizations_resource_length CHECK ((char_length(resource) <= 2048)),
    CONSTRAINT oauth_authorizations_scope_length CHECK ((char_length(scope) <= 4096)),
    CONSTRAINT oauth_authorizations_state_length CHECK ((char_length(state) <= 4096))
);


--
-- Name: oauth_client_states; Type: TABLE; Schema: auth; Owner: -
--

CREATE TABLE auth.oauth_client_states (
    id uuid NOT NULL,
    provider_type text NOT NULL,
    code_verifier text,
    created_at timestamp with time zone NOT NULL
);


--
-- Name: TABLE oauth_client_states; Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON TABLE auth.oauth_client_states IS 'Stores OAuth states for third-party provider authentication flows where Supabase acts as the OAuth client.';


--
-- Name: oauth_clients; Type: TABLE; Schema: auth; Owner: -
--

CREATE TABLE auth.oauth_clients (
    id uuid NOT NULL,
    client_secret_hash text,
    registration_type auth.oauth_registration_type NOT NULL,
    redirect_uris text NOT NULL,
    grant_types text NOT NULL,
    client_name text,
    client_uri text,
    logo_uri text,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    client_type auth.oauth_client_type DEFAULT 'confidential'::auth.oauth_client_type NOT NULL,
    token_endpoint_auth_method text NOT NULL,
    CONSTRAINT oauth_clients_client_name_length CHECK ((char_length(client_name) <= 1024)),
    CONSTRAINT oauth_clients_client_uri_length CHECK ((char_length(client_uri) <= 2048)),
    CONSTRAINT oauth_clients_logo_uri_length CHECK ((char_length(logo_uri) <= 2048)),
    CONSTRAINT oauth_clients_token_endpoint_auth_method_check CHECK ((token_endpoint_auth_method = ANY (ARRAY['client_secret_basic'::text, 'client_secret_post'::text, 'none'::text])))
);


--
-- Name: oauth_consents; Type: TABLE; Schema: auth; Owner: -
--

CREATE TABLE auth.oauth_consents (
    id uuid NOT NULL,
    user_id uuid NOT NULL,
    client_id uuid NOT NULL,
    scopes text NOT NULL,
    granted_at timestamp with time zone DEFAULT now() NOT NULL,
    revoked_at timestamp with time zone,
    CONSTRAINT oauth_consents_revoked_after_granted CHECK (((revoked_at IS NULL) OR (revoked_at >= granted_at))),
    CONSTRAINT oauth_consents_scopes_length CHECK ((char_length(scopes) <= 2048)),
    CONSTRAINT oauth_consents_scopes_not_empty CHECK ((char_length(TRIM(BOTH FROM scopes)) > 0))
);


--
-- Name: one_time_tokens; Type: TABLE; Schema: auth; Owner: -
--

CREATE TABLE auth.one_time_tokens (
    id uuid NOT NULL,
    user_id uuid NOT NULL,
    token_type auth.one_time_token_type NOT NULL,
    token_hash text NOT NULL,
    relates_to text NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    CONSTRAINT one_time_tokens_token_hash_check CHECK ((char_length(token_hash) > 0))
);


--
-- Name: refresh_tokens; Type: TABLE; Schema: auth; Owner: -
--

CREATE TABLE auth.refresh_tokens (
    instance_id uuid,
    id bigint NOT NULL,
    token character varying(255),
    user_id character varying(255),
    revoked boolean,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    parent character varying(255),
    session_id uuid
);


--
-- Name: TABLE refresh_tokens; Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON TABLE auth.refresh_tokens IS 'Auth: Store of tokens used to refresh JWT tokens once they expire.';


--
-- Name: refresh_tokens_id_seq; Type: SEQUENCE; Schema: auth; Owner: -
--

CREATE SEQUENCE auth.refresh_tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: refresh_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: auth; Owner: -
--

ALTER SEQUENCE auth.refresh_tokens_id_seq OWNED BY auth.refresh_tokens.id;


--
-- Name: saml_providers; Type: TABLE; Schema: auth; Owner: -
--

CREATE TABLE auth.saml_providers (
    id uuid NOT NULL,
    sso_provider_id uuid NOT NULL,
    entity_id text NOT NULL,
    metadata_xml text NOT NULL,
    metadata_url text,
    attribute_mapping jsonb,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    name_id_format text,
    CONSTRAINT "entity_id not empty" CHECK ((char_length(entity_id) > 0)),
    CONSTRAINT "metadata_url not empty" CHECK (((metadata_url = NULL::text) OR (char_length(metadata_url) > 0))),
    CONSTRAINT "metadata_xml not empty" CHECK ((char_length(metadata_xml) > 0))
);


--
-- Name: TABLE saml_providers; Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON TABLE auth.saml_providers IS 'Auth: Manages SAML Identity Provider connections.';


--
-- Name: saml_relay_states; Type: TABLE; Schema: auth; Owner: -
--

CREATE TABLE auth.saml_relay_states (
    id uuid NOT NULL,
    sso_provider_id uuid NOT NULL,
    request_id text NOT NULL,
    for_email text,
    redirect_to text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    flow_state_id uuid,
    CONSTRAINT "request_id not empty" CHECK ((char_length(request_id) > 0))
);


--
-- Name: TABLE saml_relay_states; Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON TABLE auth.saml_relay_states IS 'Auth: Contains SAML Relay State information for each Service Provider initiated login.';


--
-- Name: schema_migrations; Type: TABLE; Schema: auth; Owner: -
--

CREATE TABLE auth.schema_migrations (
    version character varying(255) NOT NULL
);


--
-- Name: TABLE schema_migrations; Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON TABLE auth.schema_migrations IS 'Auth: Manages updates to the auth system.';


--
-- Name: sessions; Type: TABLE; Schema: auth; Owner: -
--

CREATE TABLE auth.sessions (
    id uuid NOT NULL,
    user_id uuid NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    factor_id uuid,
    aal auth.aal_level,
    not_after timestamp with time zone,
    refreshed_at timestamp without time zone,
    user_agent text,
    ip inet,
    tag text,
    oauth_client_id uuid,
    refresh_token_hmac_key text,
    refresh_token_counter bigint,
    scopes text,
    CONSTRAINT sessions_scopes_length CHECK ((char_length(scopes) <= 4096))
);


--
-- Name: TABLE sessions; Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON TABLE auth.sessions IS 'Auth: Stores session data associated to a user.';


--
-- Name: COLUMN sessions.not_after; Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON COLUMN auth.sessions.not_after IS 'Auth: Not after is a nullable column that contains a timestamp after which the session should be regarded as expired.';


--
-- Name: COLUMN sessions.refresh_token_hmac_key; Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON COLUMN auth.sessions.refresh_token_hmac_key IS 'Holds a HMAC-SHA256 key used to sign refresh tokens for this session.';


--
-- Name: COLUMN sessions.refresh_token_counter; Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON COLUMN auth.sessions.refresh_token_counter IS 'Holds the ID (counter) of the last issued refresh token.';


--
-- Name: sso_domains; Type: TABLE; Schema: auth; Owner: -
--

CREATE TABLE auth.sso_domains (
    id uuid NOT NULL,
    sso_provider_id uuid NOT NULL,
    domain text NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    CONSTRAINT "domain not empty" CHECK ((char_length(domain) > 0))
);


--
-- Name: TABLE sso_domains; Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON TABLE auth.sso_domains IS 'Auth: Manages SSO email address domain mapping to an SSO Identity Provider.';


--
-- Name: sso_providers; Type: TABLE; Schema: auth; Owner: -
--

CREATE TABLE auth.sso_providers (
    id uuid NOT NULL,
    resource_id text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    disabled boolean,
    CONSTRAINT "resource_id not empty" CHECK (((resource_id = NULL::text) OR (char_length(resource_id) > 0)))
);


--
-- Name: TABLE sso_providers; Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON TABLE auth.sso_providers IS 'Auth: Manages SSO identity provider information; see saml_providers for SAML.';


--
-- Name: COLUMN sso_providers.resource_id; Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON COLUMN auth.sso_providers.resource_id IS 'Auth: Uniquely identifies a SSO provider according to a user-chosen resource ID (case insensitive), useful in infrastructure as code.';


--
-- Name: users; Type: TABLE; Schema: auth; Owner: -
--

CREATE TABLE auth.users (
    instance_id uuid,
    id uuid NOT NULL,
    aud character varying(255),
    role character varying(255),
    email character varying(255),
    encrypted_password character varying(255),
    email_confirmed_at timestamp with time zone,
    invited_at timestamp with time zone,
    confirmation_token character varying(255),
    confirmation_sent_at timestamp with time zone,
    recovery_token character varying(255),
    recovery_sent_at timestamp with time zone,
    email_change_token_new character varying(255),
    email_change character varying(255),
    email_change_sent_at timestamp with time zone,
    last_sign_in_at timestamp with time zone,
    raw_app_meta_data jsonb,
    raw_user_meta_data jsonb,
    is_super_admin boolean,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    phone text DEFAULT NULL::character varying,
    phone_confirmed_at timestamp with time zone,
    phone_change text DEFAULT ''::character varying,
    phone_change_token character varying(255) DEFAULT ''::character varying,
    phone_change_sent_at timestamp with time zone,
    confirmed_at timestamp with time zone GENERATED ALWAYS AS (LEAST(email_confirmed_at, phone_confirmed_at)) STORED,
    email_change_token_current character varying(255) DEFAULT ''::character varying,
    email_change_confirm_status smallint DEFAULT 0,
    banned_until timestamp with time zone,
    reauthentication_token character varying(255) DEFAULT ''::character varying,
    reauthentication_sent_at timestamp with time zone,
    is_sso_user boolean DEFAULT false NOT NULL,
    deleted_at timestamp with time zone,
    is_anonymous boolean DEFAULT false NOT NULL,
    CONSTRAINT users_email_change_confirm_status_check CHECK (((email_change_confirm_status >= 0) AND (email_change_confirm_status <= 2)))
);


--
-- Name: TABLE users; Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON TABLE auth.users IS 'Auth: Stores user login data within a secure schema.';


--
-- Name: COLUMN users.is_sso_user; Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON COLUMN auth.users.is_sso_user IS 'Auth: Set this column to true when the account comes from SSO. These accounts can have duplicate emails.';


--
-- Name: webauthn_challenges; Type: TABLE; Schema: auth; Owner: -
--

CREATE TABLE auth.webauthn_challenges (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    user_id uuid,
    challenge_type text NOT NULL,
    session_data jsonb NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    expires_at timestamp with time zone NOT NULL,
    CONSTRAINT webauthn_challenges_challenge_type_check CHECK ((challenge_type = ANY (ARRAY['signup'::text, 'registration'::text, 'authentication'::text])))
);


--
-- Name: webauthn_credentials; Type: TABLE; Schema: auth; Owner: -
--

CREATE TABLE auth.webauthn_credentials (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    user_id uuid NOT NULL,
    credential_id bytea NOT NULL,
    public_key bytea NOT NULL,
    attestation_type text DEFAULT ''::text NOT NULL,
    aaguid uuid,
    sign_count bigint DEFAULT 0 NOT NULL,
    transports jsonb DEFAULT '[]'::jsonb NOT NULL,
    backup_eligible boolean DEFAULT false NOT NULL,
    backed_up boolean DEFAULT false NOT NULL,
    friendly_name text DEFAULT ''::text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    last_used_at timestamp with time zone
);


--
-- Name: keep_alive; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.keep_alive (
    id integer NOT NULL,
    last_active timestamp with time zone DEFAULT now()
);


--
-- Name: strategies; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.strategies (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    name text NOT NULL,
    description text,
    rules jsonb,
    color text,
    created_at timestamp with time zone DEFAULT now(),
    sort_order integer DEFAULT 0,
    user_id uuid DEFAULT auth.uid()
);

ALTER TABLE ONLY public.strategies FORCE ROW LEVEL SECURITY;


--
-- Name: tag_categories; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tag_categories (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    name text NOT NULL,
    color text DEFAULT 'bg-slate-500'::text,
    created_at timestamp with time zone DEFAULT now(),
    sort_order integer DEFAULT 0,
    user_id uuid DEFAULT auth.uid()
);

ALTER TABLE ONLY public.tag_categories FORCE ROW LEVEL SECURITY;


--
-- Name: tags; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tags (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    name text NOT NULL,
    category_id uuid,
    created_at timestamp with time zone DEFAULT now(),
    sort_order integer DEFAULT 0,
    user_id uuid DEFAULT auth.uid()
);

ALTER TABLE ONLY public.tags FORCE ROW LEVEL SECURITY;


--
-- Name: trades; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.trades (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    symbol text NOT NULL,
    direction text,
    status text,
    "entryDate" text,
    quantity numeric,
    "entryPrice" numeric,
    "exitPrice" numeric,
    commission numeric,
    "initialStopLoss" numeric,
    "highestPriceReached" numeric,
    "lowestPriceReached" numeric,
    "playbookId" text,
    note text,
    "exitDate" text,
    "screenshotUrl" text,
    "bestExitPrice" numeric,
    tags text[] DEFAULT '{}'::text[],
    "rulesFollowed" text[] DEFAULT '{}'::text[],
    user_id uuid DEFAULT auth.uid()
);

ALTER TABLE ONLY public.trades FORCE ROW LEVEL SECURITY;


--
-- Name: user_settings; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.user_settings (
    id bigint NOT NULL,
    max_drawdown numeric DEFAULT 0,
    commission_per_unit numeric DEFAULT 0,
    created_at timestamp with time zone DEFAULT timezone('utc'::text, now()) NOT NULL,
    win_threshold numeric DEFAULT 0,
    break_even_range numeric DEFAULT 0,
    loss_threshold numeric DEFAULT 0,
    custom_tag_category_colors jsonb DEFAULT '[]'::jsonb,
    tag_category_color_order jsonb DEFAULT '[]'::jsonb,
    user_id uuid DEFAULT auth.uid()
);

ALTER TABLE ONLY public.user_settings FORCE ROW LEVEL SECURITY;


--
-- Name: user_settings_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.user_settings ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.user_settings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: messages; Type: TABLE; Schema: realtime; Owner: -
--

CREATE TABLE realtime.messages (
    topic text NOT NULL,
    extension text NOT NULL,
    payload jsonb,
    event text,
    private boolean DEFAULT false,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    inserted_at timestamp without time zone DEFAULT now() NOT NULL,
    id uuid DEFAULT gen_random_uuid() NOT NULL
)
PARTITION BY RANGE (inserted_at);


--
-- Name: schema_migrations; Type: TABLE; Schema: realtime; Owner: -
--

CREATE TABLE realtime.schema_migrations (
    version bigint NOT NULL,
    inserted_at timestamp(0) without time zone
);


--
-- Name: subscription; Type: TABLE; Schema: realtime; Owner: -
--

CREATE TABLE realtime.subscription (
    id bigint NOT NULL,
    subscription_id uuid NOT NULL,
    entity regclass NOT NULL,
    filters realtime.user_defined_filter[] DEFAULT '{}'::realtime.user_defined_filter[] NOT NULL,
    claims jsonb NOT NULL,
    claims_role regrole GENERATED ALWAYS AS (realtime.to_regrole((claims ->> 'role'::text))) STORED NOT NULL,
    created_at timestamp without time zone DEFAULT timezone('utc'::text, now()) NOT NULL,
    action_filter text DEFAULT '*'::text,
    CONSTRAINT subscription_action_filter_check CHECK ((action_filter = ANY (ARRAY['*'::text, 'INSERT'::text, 'UPDATE'::text, 'DELETE'::text])))
);


--
-- Name: subscription_id_seq; Type: SEQUENCE; Schema: realtime; Owner: -
--

ALTER TABLE realtime.subscription ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME realtime.subscription_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: buckets; Type: TABLE; Schema: storage; Owner: -
--

CREATE TABLE storage.buckets (
    id text NOT NULL,
    name text NOT NULL,
    owner uuid,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now(),
    public boolean DEFAULT false,
    avif_autodetection boolean DEFAULT false,
    file_size_limit bigint,
    allowed_mime_types text[],
    owner_id text,
    type storage.buckettype DEFAULT 'STANDARD'::storage.buckettype NOT NULL
);


--
-- Name: COLUMN buckets.owner; Type: COMMENT; Schema: storage; Owner: -
--

COMMENT ON COLUMN storage.buckets.owner IS 'Field is deprecated, use owner_id instead';


--
-- Name: buckets_analytics; Type: TABLE; Schema: storage; Owner: -
--

CREATE TABLE storage.buckets_analytics (
    name text NOT NULL,
    type storage.buckettype DEFAULT 'ANALYTICS'::storage.buckettype NOT NULL,
    format text DEFAULT 'ICEBERG'::text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    deleted_at timestamp with time zone
);


--
-- Name: buckets_vectors; Type: TABLE; Schema: storage; Owner: -
--

CREATE TABLE storage.buckets_vectors (
    id text NOT NULL,
    type storage.buckettype DEFAULT 'VECTOR'::storage.buckettype NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


--
-- Name: migrations; Type: TABLE; Schema: storage; Owner: -
--

CREATE TABLE storage.migrations (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    hash character varying(40) NOT NULL,
    executed_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: objects; Type: TABLE; Schema: storage; Owner: -
--

CREATE TABLE storage.objects (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    bucket_id text,
    name text,
    owner uuid,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now(),
    last_accessed_at timestamp with time zone DEFAULT now(),
    metadata jsonb,
    path_tokens text[] GENERATED ALWAYS AS (string_to_array(name, '/'::text)) STORED,
    version text,
    owner_id text,
    user_metadata jsonb
);


--
-- Name: COLUMN objects.owner; Type: COMMENT; Schema: storage; Owner: -
--

COMMENT ON COLUMN storage.objects.owner IS 'Field is deprecated, use owner_id instead';


--
-- Name: s3_multipart_uploads; Type: TABLE; Schema: storage; Owner: -
--

CREATE TABLE storage.s3_multipart_uploads (
    id text NOT NULL,
    in_progress_size bigint DEFAULT 0 NOT NULL,
    upload_signature text NOT NULL,
    bucket_id text NOT NULL,
    key text NOT NULL COLLATE pg_catalog."C",
    version text NOT NULL,
    owner_id text,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    user_metadata jsonb,
    metadata jsonb
);


--
-- Name: s3_multipart_uploads_parts; Type: TABLE; Schema: storage; Owner: -
--

CREATE TABLE storage.s3_multipart_uploads_parts (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    upload_id text NOT NULL,
    size bigint DEFAULT 0 NOT NULL,
    part_number integer NOT NULL,
    bucket_id text NOT NULL,
    key text NOT NULL COLLATE pg_catalog."C",
    etag text NOT NULL,
    owner_id text,
    version text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);


--
-- Name: vector_indexes; Type: TABLE; Schema: storage; Owner: -
--

CREATE TABLE storage.vector_indexes (
    id text DEFAULT gen_random_uuid() NOT NULL,
    name text NOT NULL COLLATE pg_catalog."C",
    bucket_id text NOT NULL,
    data_type text NOT NULL,
    dimension integer NOT NULL,
    distance_metric text NOT NULL,
    metadata_configuration jsonb,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


--
-- Name: refresh_tokens id; Type: DEFAULT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.refresh_tokens ALTER COLUMN id SET DEFAULT nextval('auth.refresh_tokens_id_seq'::regclass);


--
-- Data for Name: audit_log_entries; Type: TABLE DATA; Schema: auth; Owner: -
--

COPY auth.audit_log_entries (instance_id, id, payload, created_at, ip_address) FROM stdin;
\.


--
-- Data for Name: custom_oauth_providers; Type: TABLE DATA; Schema: auth; Owner: -
--

COPY auth.custom_oauth_providers (id, provider_type, identifier, name, client_id, client_secret, acceptable_client_ids, scopes, pkce_enabled, attribute_mapping, authorization_params, enabled, email_optional, issuer, discovery_url, skip_nonce_check, cached_discovery, discovery_cached_at, authorization_url, token_url, userinfo_url, jwks_uri, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: flow_state; Type: TABLE DATA; Schema: auth; Owner: -
--

COPY auth.flow_state (id, user_id, auth_code, code_challenge_method, code_challenge, provider_type, provider_access_token, provider_refresh_token, created_at, updated_at, authentication_method, auth_code_issued_at, invite_token, referrer, oauth_client_state_id, linking_target_id, email_optional) FROM stdin;
\.


--
-- Data for Name: identities; Type: TABLE DATA; Schema: auth; Owner: -
--

COPY auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id) FROM stdin;
110260866131856643182	f49d86cc-1d15-4364-a67c-54876f358360	{"iss": "https://accounts.google.com", "sub": "110260866131856643182", "name": "劉祐丞", "email": "jack106047@gmail.com", "picture": "https://lh3.googleusercontent.com/a/ACg8ocKbLLrbGRpYzatUFyc7Yo7XaTpd-HgYBbxoKs0UZ-lyEo3WPCIP=s96-c", "full_name": "劉祐丞", "avatar_url": "https://lh3.googleusercontent.com/a/ACg8ocKbLLrbGRpYzatUFyc7Yo7XaTpd-HgYBbxoKs0UZ-lyEo3WPCIP=s96-c", "provider_id": "110260866131856643182", "email_verified": true, "phone_verified": false}	google	2026-04-06 22:46:16.618948+00	2026-04-06 22:46:16.618997+00	2026-04-12 06:31:03.841256+00	8d5a0b7e-bd73-42ec-9fe7-dba17be516ab
\.


--
-- Data for Name: instances; Type: TABLE DATA; Schema: auth; Owner: -
--

COPY auth.instances (id, uuid, raw_base_config, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: mfa_amr_claims; Type: TABLE DATA; Schema: auth; Owner: -
--

COPY auth.mfa_amr_claims (session_id, created_at, updated_at, authentication_method, id) FROM stdin;
58700fb8-9570-4aed-b004-f1a2b23abaf5	2026-04-12 05:24:37.340281+00	2026-04-12 05:24:37.340281+00	oauth	8d836d36-6ea0-4cbf-9d04-221cb60c0543
4e288213-9cec-4089-b207-ca53a8cfa9b2	2026-04-12 06:31:03.857764+00	2026-04-12 06:31:03.857764+00	oauth	b504be65-8a04-47ee-ab87-5ea0ece93c2c
\.


--
-- Data for Name: mfa_challenges; Type: TABLE DATA; Schema: auth; Owner: -
--

COPY auth.mfa_challenges (id, factor_id, created_at, verified_at, ip_address, otp_code, web_authn_session_data) FROM stdin;
\.


--
-- Data for Name: mfa_factors; Type: TABLE DATA; Schema: auth; Owner: -
--

COPY auth.mfa_factors (id, user_id, friendly_name, factor_type, status, created_at, updated_at, secret, phone, last_challenged_at, web_authn_credential, web_authn_aaguid, last_webauthn_challenge_data) FROM stdin;
\.


--
-- Data for Name: oauth_authorizations; Type: TABLE DATA; Schema: auth; Owner: -
--

COPY auth.oauth_authorizations (id, authorization_id, client_id, user_id, redirect_uri, scope, state, resource, code_challenge, code_challenge_method, response_type, status, authorization_code, created_at, expires_at, approved_at, nonce) FROM stdin;
\.


--
-- Data for Name: oauth_client_states; Type: TABLE DATA; Schema: auth; Owner: -
--

COPY auth.oauth_client_states (id, provider_type, code_verifier, created_at) FROM stdin;
\.


--
-- Data for Name: oauth_clients; Type: TABLE DATA; Schema: auth; Owner: -
--

COPY auth.oauth_clients (id, client_secret_hash, registration_type, redirect_uris, grant_types, client_name, client_uri, logo_uri, created_at, updated_at, deleted_at, client_type, token_endpoint_auth_method) FROM stdin;
\.


--
-- Data for Name: oauth_consents; Type: TABLE DATA; Schema: auth; Owner: -
--

COPY auth.oauth_consents (id, user_id, client_id, scopes, granted_at, revoked_at) FROM stdin;
\.


--
-- Data for Name: one_time_tokens; Type: TABLE DATA; Schema: auth; Owner: -
--

COPY auth.one_time_tokens (id, user_id, token_type, token_hash, relates_to, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: refresh_tokens; Type: TABLE DATA; Schema: auth; Owner: -
--

COPY auth.refresh_tokens (instance_id, id, token, user_id, revoked, created_at, updated_at, parent, session_id) FROM stdin;
00000000-0000-0000-0000-000000000000	35	yo74a6vjgvkt	f49d86cc-1d15-4364-a67c-54876f358360	t	2026-04-21 18:08:42.012724+00	2026-04-22 08:01:51.745953+00	ul25xm3uafx6	58700fb8-9570-4aed-b004-f1a2b23abaf5
00000000-0000-0000-0000-000000000000	36	r4ks5aqky2pf	f49d86cc-1d15-4364-a67c-54876f358360	t	2026-04-22 08:01:51.778383+00	2026-04-22 09:27:34.62122+00	yo74a6vjgvkt	58700fb8-9570-4aed-b004-f1a2b23abaf5
00000000-0000-0000-0000-000000000000	37	kmrqq2p5zgck	f49d86cc-1d15-4364-a67c-54876f358360	t	2026-04-22 09:27:34.648213+00	2026-04-22 11:26:50.460368+00	r4ks5aqky2pf	58700fb8-9570-4aed-b004-f1a2b23abaf5
00000000-0000-0000-0000-000000000000	38	ucrepuwbzyxw	f49d86cc-1d15-4364-a67c-54876f358360	t	2026-04-22 11:26:50.481225+00	2026-04-22 13:14:56.355783+00	kmrqq2p5zgck	58700fb8-9570-4aed-b004-f1a2b23abaf5
00000000-0000-0000-0000-000000000000	39	zso63xxavx4l	f49d86cc-1d15-4364-a67c-54876f358360	t	2026-04-22 13:14:56.369869+00	2026-04-22 15:01:43.03728+00	ucrepuwbzyxw	58700fb8-9570-4aed-b004-f1a2b23abaf5
00000000-0000-0000-0000-000000000000	40	pmxymbudb7ei	f49d86cc-1d15-4364-a67c-54876f358360	t	2026-04-22 15:01:43.059237+00	2026-04-22 16:31:35.904809+00	zso63xxavx4l	58700fb8-9570-4aed-b004-f1a2b23abaf5
00000000-0000-0000-0000-000000000000	41	fioyfals6vlt	f49d86cc-1d15-4364-a67c-54876f358360	t	2026-04-22 16:31:35.938243+00	2026-04-22 18:39:16.174799+00	pmxymbudb7ei	58700fb8-9570-4aed-b004-f1a2b23abaf5
00000000-0000-0000-0000-000000000000	42	tronn5s5ewgh	f49d86cc-1d15-4364-a67c-54876f358360	t	2026-04-22 18:39:16.192804+00	2026-04-23 17:06:38.922806+00	fioyfals6vlt	58700fb8-9570-4aed-b004-f1a2b23abaf5
00000000-0000-0000-0000-000000000000	43	l7h6627anexb	f49d86cc-1d15-4364-a67c-54876f358360	t	2026-04-23 17:06:38.948827+00	2026-04-23 18:16:38.94273+00	tronn5s5ewgh	58700fb8-9570-4aed-b004-f1a2b23abaf5
00000000-0000-0000-0000-000000000000	44	4x6kgunblljp	f49d86cc-1d15-4364-a67c-54876f358360	t	2026-04-23 18:16:38.958583+00	2026-04-24 10:54:28.525275+00	l7h6627anexb	58700fb8-9570-4aed-b004-f1a2b23abaf5
00000000-0000-0000-0000-000000000000	45	pmkdvf4g6p6n	f49d86cc-1d15-4364-a67c-54876f358360	t	2026-04-24 10:54:28.556205+00	2026-04-24 17:03:30.119457+00	4x6kgunblljp	58700fb8-9570-4aed-b004-f1a2b23abaf5
00000000-0000-0000-0000-000000000000	46	ws2qte65scnq	f49d86cc-1d15-4364-a67c-54876f358360	t	2026-04-24 17:03:30.138731+00	2026-04-24 18:07:40.563979+00	pmkdvf4g6p6n	58700fb8-9570-4aed-b004-f1a2b23abaf5
00000000-0000-0000-0000-000000000000	47	nu3grpiilfxx	f49d86cc-1d15-4364-a67c-54876f358360	t	2026-04-24 18:07:40.587963+00	2026-04-25 03:51:42.791237+00	ws2qte65scnq	58700fb8-9570-4aed-b004-f1a2b23abaf5
00000000-0000-0000-0000-000000000000	32	lt27cgat3vhx	f49d86cc-1d15-4364-a67c-54876f358360	t	2026-04-12 07:49:49.140296+00	2026-04-25 08:43:40.497268+00	exxgqxod4i2f	4e288213-9cec-4089-b207-ca53a8cfa9b2
00000000-0000-0000-0000-000000000000	48	nwaofiuddaih	f49d86cc-1d15-4364-a67c-54876f358360	t	2026-04-25 03:51:42.824298+00	2026-04-25 09:34:29.299496+00	nu3grpiilfxx	58700fb8-9570-4aed-b004-f1a2b23abaf5
00000000-0000-0000-0000-000000000000	49	4oi3ki4wyxz3	f49d86cc-1d15-4364-a67c-54876f358360	t	2026-04-25 08:43:40.515407+00	2026-04-25 09:47:16.385877+00	lt27cgat3vhx	4e288213-9cec-4089-b207-ca53a8cfa9b2
00000000-0000-0000-0000-000000000000	50	yt44k5fxmhga	f49d86cc-1d15-4364-a67c-54876f358360	t	2026-04-25 09:34:29.317039+00	2026-04-25 10:32:31.876194+00	nwaofiuddaih	58700fb8-9570-4aed-b004-f1a2b23abaf5
00000000-0000-0000-0000-000000000000	51	cpure625hpfp	f49d86cc-1d15-4364-a67c-54876f358360	t	2026-04-25 09:47:16.399036+00	2026-04-25 10:48:35.17552+00	4oi3ki4wyxz3	4e288213-9cec-4089-b207-ca53a8cfa9b2
00000000-0000-0000-0000-000000000000	52	rxi4lf7rwl7t	f49d86cc-1d15-4364-a67c-54876f358360	t	2026-04-25 10:32:31.886797+00	2026-04-25 13:37:05.910843+00	yt44k5fxmhga	58700fb8-9570-4aed-b004-f1a2b23abaf5
00000000-0000-0000-0000-000000000000	54	lerm5vazun5c	f49d86cc-1d15-4364-a67c-54876f358360	t	2026-04-25 13:37:05.938124+00	2026-04-25 14:49:09.345+00	rxi4lf7rwl7t	58700fb8-9570-4aed-b004-f1a2b23abaf5
00000000-0000-0000-0000-000000000000	55	7vamlkwxsrsa	f49d86cc-1d15-4364-a67c-54876f358360	t	2026-04-25 14:49:09.367104+00	2026-04-25 16:56:29.103162+00	lerm5vazun5c	58700fb8-9570-4aed-b004-f1a2b23abaf5
00000000-0000-0000-0000-000000000000	56	hwxe5z7qr3bi	f49d86cc-1d15-4364-a67c-54876f358360	t	2026-04-25 16:56:29.117803+00	2026-04-28 15:25:23.991832+00	7vamlkwxsrsa	58700fb8-9570-4aed-b004-f1a2b23abaf5
00000000-0000-0000-0000-000000000000	57	i63xvgafb24a	f49d86cc-1d15-4364-a67c-54876f358360	t	2026-04-28 15:25:24.016673+00	2026-04-28 16:35:17.89425+00	hwxe5z7qr3bi	58700fb8-9570-4aed-b004-f1a2b23abaf5
00000000-0000-0000-0000-000000000000	58	m27wh4gb5fjy	f49d86cc-1d15-4364-a67c-54876f358360	t	2026-04-28 16:35:17.912844+00	2026-04-28 17:35:18.546539+00	i63xvgafb24a	58700fb8-9570-4aed-b004-f1a2b23abaf5
00000000-0000-0000-0000-000000000000	28	ooxv5fv3q7qx	f49d86cc-1d15-4364-a67c-54876f358360	t	2026-04-12 05:24:37.331846+00	2026-04-12 06:27:34.327182+00	\N	58700fb8-9570-4aed-b004-f1a2b23abaf5
00000000-0000-0000-0000-000000000000	59	tphhwurvcuep	f49d86cc-1d15-4364-a67c-54876f358360	t	2026-04-28 17:35:18.571009+00	2026-04-29 07:56:11.395046+00	m27wh4gb5fjy	58700fb8-9570-4aed-b004-f1a2b23abaf5
00000000-0000-0000-0000-000000000000	29	oqfqccqntt4n	f49d86cc-1d15-4364-a67c-54876f358360	t	2026-04-12 06:27:34.352292+00	2026-04-12 07:31:16.804139+00	ooxv5fv3q7qx	58700fb8-9570-4aed-b004-f1a2b23abaf5
00000000-0000-0000-0000-000000000000	60	hiqumpot3bz4	f49d86cc-1d15-4364-a67c-54876f358360	t	2026-04-29 07:56:11.431247+00	2026-04-29 15:57:57.403781+00	tphhwurvcuep	58700fb8-9570-4aed-b004-f1a2b23abaf5
00000000-0000-0000-0000-000000000000	30	exxgqxod4i2f	f49d86cc-1d15-4364-a67c-54876f358360	t	2026-04-12 06:31:03.855265+00	2026-04-12 07:49:49.115137+00	\N	4e288213-9cec-4089-b207-ca53a8cfa9b2
00000000-0000-0000-0000-000000000000	31	4hjv2o4g63zb	f49d86cc-1d15-4364-a67c-54876f358360	t	2026-04-12 07:31:16.820076+00	2026-04-12 08:34:01.94038+00	oqfqccqntt4n	58700fb8-9570-4aed-b004-f1a2b23abaf5
00000000-0000-0000-0000-000000000000	33	zk6wghf57wcz	f49d86cc-1d15-4364-a67c-54876f358360	t	2026-04-12 08:34:01.94966+00	2026-04-21 17:10:31.194856+00	4hjv2o4g63zb	58700fb8-9570-4aed-b004-f1a2b23abaf5
00000000-0000-0000-0000-000000000000	61	qnoeuzrjdu4x	f49d86cc-1d15-4364-a67c-54876f358360	t	2026-04-29 15:57:57.423174+00	2026-04-29 17:47:41.61022+00	hiqumpot3bz4	58700fb8-9570-4aed-b004-f1a2b23abaf5
00000000-0000-0000-0000-000000000000	34	ul25xm3uafx6	f49d86cc-1d15-4364-a67c-54876f358360	t	2026-04-21 17:10:31.228205+00	2026-04-21 18:08:41.989324+00	zk6wghf57wcz	58700fb8-9570-4aed-b004-f1a2b23abaf5
00000000-0000-0000-0000-000000000000	62	ujgskqhenlbb	f49d86cc-1d15-4364-a67c-54876f358360	t	2026-04-29 17:47:41.632452+00	2026-04-30 18:17:25.937991+00	qnoeuzrjdu4x	58700fb8-9570-4aed-b004-f1a2b23abaf5
00000000-0000-0000-0000-000000000000	63	x7h7d6jgix4o	f49d86cc-1d15-4364-a67c-54876f358360	t	2026-04-30 18:17:25.964324+00	2026-05-01 16:41:17.455314+00	ujgskqhenlbb	58700fb8-9570-4aed-b004-f1a2b23abaf5
00000000-0000-0000-0000-000000000000	64	k4wmmveutdrz	f49d86cc-1d15-4364-a67c-54876f358360	t	2026-05-01 16:41:17.487327+00	2026-05-02 06:42:19.450987+00	x7h7d6jgix4o	58700fb8-9570-4aed-b004-f1a2b23abaf5
00000000-0000-0000-0000-000000000000	53	zx6iperhg22n	f49d86cc-1d15-4364-a67c-54876f358360	t	2026-04-25 10:48:35.181172+00	2026-05-02 06:47:26.789049+00	cpure625hpfp	4e288213-9cec-4089-b207-ca53a8cfa9b2
00000000-0000-0000-0000-000000000000	66	iaqqc5wokua5	f49d86cc-1d15-4364-a67c-54876f358360	f	2026-05-02 06:47:26.795669+00	2026-05-02 06:47:26.795669+00	zx6iperhg22n	4e288213-9cec-4089-b207-ca53a8cfa9b2
00000000-0000-0000-0000-000000000000	65	fyjf2xyqvpzw	f49d86cc-1d15-4364-a67c-54876f358360	t	2026-05-02 06:42:19.483471+00	2026-05-02 07:50:26.217984+00	k4wmmveutdrz	58700fb8-9570-4aed-b004-f1a2b23abaf5
00000000-0000-0000-0000-000000000000	67	jiguatfsqhkt	f49d86cc-1d15-4364-a67c-54876f358360	f	2026-05-02 07:50:26.244037+00	2026-05-02 07:50:26.244037+00	fyjf2xyqvpzw	58700fb8-9570-4aed-b004-f1a2b23abaf5
\.


--
-- Data for Name: saml_providers; Type: TABLE DATA; Schema: auth; Owner: -
--

COPY auth.saml_providers (id, sso_provider_id, entity_id, metadata_xml, metadata_url, attribute_mapping, created_at, updated_at, name_id_format) FROM stdin;
\.


--
-- Data for Name: saml_relay_states; Type: TABLE DATA; Schema: auth; Owner: -
--

COPY auth.saml_relay_states (id, sso_provider_id, request_id, for_email, redirect_to, created_at, updated_at, flow_state_id) FROM stdin;
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: auth; Owner: -
--

COPY auth.schema_migrations (version) FROM stdin;
20171026211738
20171026211808
20171026211834
20180103212743
20180108183307
20180119214651
20180125194653
00
20210710035447
20210722035447
20210730183235
20210909172000
20210927181326
20211122151130
20211124214934
20211202183645
20220114185221
20220114185340
20220224000811
20220323170000
20220429102000
20220531120530
20220614074223
20220811173540
20221003041349
20221003041400
20221011041400
20221020193600
20221021073300
20221021082433
20221027105023
20221114143122
20221114143410
20221125140132
20221208132122
20221215195500
20221215195800
20221215195900
20230116124310
20230116124412
20230131181311
20230322519590
20230402418590
20230411005111
20230508135423
20230523124323
20230818113222
20230914180801
20231027141322
20231114161723
20231117164230
20240115144230
20240214120130
20240306115329
20240314092811
20240427152123
20240612123726
20240729123726
20240802193726
20240806073726
20241009103726
20250717082212
20250731150234
20250804100000
20250901200500
20250903112500
20250904133000
20250925093508
20251007112900
20251104100000
20251111201300
20251201000000
20260115000000
20260121000000
20260219120000
20260302000000
\.


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: auth; Owner: -
--

COPY auth.sessions (id, user_id, created_at, updated_at, factor_id, aal, not_after, refreshed_at, user_agent, ip, tag, oauth_client_id, refresh_token_hmac_key, refresh_token_counter, scopes) FROM stdin;
4e288213-9cec-4089-b207-ca53a8cfa9b2	f49d86cc-1d15-4364-a67c-54876f358360	2026-04-12 06:31:03.847064+00	2026-05-02 06:47:26.80695+00	\N	aal1	\N	2026-05-02 06:47:26.806825	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36	140.113.123.108	\N	\N	\N	\N	\N
58700fb8-9570-4aed-b004-f1a2b23abaf5	f49d86cc-1d15-4364-a67c-54876f358360	2026-04-12 05:24:37.317726+00	2026-05-02 07:50:26.268901+00	\N	aal1	\N	2026-05-02 07:50:26.268783	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36	140.113.123.108	\N	\N	\N	\N	\N
\.


--
-- Data for Name: sso_domains; Type: TABLE DATA; Schema: auth; Owner: -
--

COPY auth.sso_domains (id, sso_provider_id, domain, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: sso_providers; Type: TABLE DATA; Schema: auth; Owner: -
--

COPY auth.sso_providers (id, resource_id, created_at, updated_at, disabled) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: auth; Owner: -
--

COPY auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, invited_at, confirmation_token, confirmation_sent_at, recovery_token, recovery_sent_at, email_change_token_new, email_change, email_change_sent_at, last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at, phone, phone_confirmed_at, phone_change, phone_change_token, phone_change_sent_at, email_change_token_current, email_change_confirm_status, banned_until, reauthentication_token, reauthentication_sent_at, is_sso_user, deleted_at, is_anonymous) FROM stdin;
00000000-0000-0000-0000-000000000000	f49d86cc-1d15-4364-a67c-54876f358360	authenticated	authenticated	jack106047@gmail.com	\N	2026-04-06 22:46:16.62899+00	\N		\N		\N			\N	2026-04-12 06:31:03.845412+00	{"provider": "google", "providers": ["google"]}	{"iss": "https://accounts.google.com", "sub": "110260866131856643182", "name": "劉祐丞", "email": "jack106047@gmail.com", "picture": "https://lh3.googleusercontent.com/a/ACg8ocKbLLrbGRpYzatUFyc7Yo7XaTpd-HgYBbxoKs0UZ-lyEo3WPCIP=s96-c", "full_name": "劉祐丞", "avatar_url": "https://lh3.googleusercontent.com/a/ACg8ocKbLLrbGRpYzatUFyc7Yo7XaTpd-HgYBbxoKs0UZ-lyEo3WPCIP=s96-c", "provider_id": "110260866131856643182", "email_verified": true, "phone_verified": false}	\N	2026-04-06 22:46:16.603516+00	2026-05-02 07:50:26.257373+00	\N	\N			\N		0	\N		\N	f	\N	f
\.


--
-- Data for Name: webauthn_challenges; Type: TABLE DATA; Schema: auth; Owner: -
--

COPY auth.webauthn_challenges (id, user_id, challenge_type, session_data, created_at, expires_at) FROM stdin;
\.


--
-- Data for Name: webauthn_credentials; Type: TABLE DATA; Schema: auth; Owner: -
--

COPY auth.webauthn_credentials (id, user_id, credential_id, public_key, attestation_type, aaguid, sign_count, transports, backup_eligible, backed_up, friendly_name, created_at, updated_at, last_used_at) FROM stdin;
\.


--
-- Data for Name: job; Type: TABLE DATA; Schema: cron; Owner: -
--

COPY cron.job (jobid, schedule, command, nodename, nodeport, database, username, active, jobname) FROM stdin;
1	0 0 */2 * *	UPDATE keep_alive SET last_active = now() WHERE id = 1;	localhost	5432	postgres	postgres	t	refresh_keep_alive
\.


--
-- Data for Name: job_run_details; Type: TABLE DATA; Schema: cron; Owner: -
--

COPY cron.job_run_details (jobid, runid, job_pid, database, username, command, status, return_message, start_time, end_time) FROM stdin;
1	18	3042944	postgres	postgres	UPDATE keep_alive SET last_active = now() WHERE id = 1;	succeeded	UPDATE 1	2026-04-21 08:24:48.261969+00	2026-04-21 08:24:48.263673+00
1	24	3042980	postgres	postgres	UPDATE keep_alive SET last_active = now() WHERE id = 1;	succeeded	UPDATE 1	2026-04-21 08:25:48.349306+00	2026-04-21 08:25:48.350693+00
1	1	3042601	postgres	postgres	UPDATE keep_alive SET last_active = now() WHERE id = 1;	succeeded	UPDATE 1	2026-04-21 08:21:57.932166+00	2026-04-21 08:21:57.934292+00
1	11	3042922	postgres	postgres	UPDATE keep_alive SET last_active = now() WHERE id = 1;	succeeded	UPDATE 1	2026-04-21 08:23:38.160222+00	2026-04-21 08:23:38.161697+00
1	2	3042603	postgres	postgres	UPDATE keep_alive SET last_active = now() WHERE id = 1;	succeeded	UPDATE 1	2026-04-21 08:22:07.947427+00	2026-04-21 08:22:07.949558+00
1	19	3042959	postgres	postgres	UPDATE keep_alive SET last_active = now() WHERE id = 1;	succeeded	UPDATE 1	2026-04-21 08:24:58.277003+00	2026-04-21 08:24:58.278559+00
1	12	3042931	postgres	postgres	UPDATE keep_alive SET last_active = now() WHERE id = 1;	succeeded	UPDATE 1	2026-04-21 08:23:48.175181+00	2026-04-21 08:23:48.176639+00
1	3	3042653	postgres	postgres	UPDATE keep_alive SET last_active = now() WHERE id = 1;	succeeded	UPDATE 1	2026-04-21 08:22:17.965948+00	2026-04-21 08:22:17.968303+00
1	4	3042863	postgres	postgres	UPDATE keep_alive SET last_active = now() WHERE id = 1;	succeeded	UPDATE 1	2026-04-21 08:22:28.051725+00	2026-04-21 08:22:28.059835+00
1	29	3737916	postgres	postgres	UPDATE keep_alive SET last_active = now() WHERE id = 1;	succeeded	UPDATE 1	2026-05-01 00:00:00.19861+00	2026-05-01 00:00:00.229093+00
1	13	3042935	postgres	postgres	UPDATE keep_alive SET last_active = now() WHERE id = 1;	succeeded	UPDATE 1	2026-04-21 08:23:58.189773+00	2026-04-21 08:23:58.191231+00
1	5	3042871	postgres	postgres	UPDATE keep_alive SET last_active = now() WHERE id = 1;	succeeded	UPDATE 1	2026-04-21 08:22:38.068041+00	2026-04-21 08:22:38.070114+00
1	25	3114858	postgres	postgres	UPDATE keep_alive SET last_active = now() WHERE id = 1;	succeeded	UPDATE 1	2026-04-23 00:00:00.175763+00	2026-04-23 00:00:00.195209+00
1	20	3042968	postgres	postgres	UPDATE keep_alive SET last_active = now() WHERE id = 1;	succeeded	UPDATE 1	2026-04-21 08:25:08.290945+00	2026-04-21 08:25:08.292409+00
1	6	3042875	postgres	postgres	UPDATE keep_alive SET last_active = now() WHERE id = 1;	succeeded	UPDATE 1	2026-04-21 08:22:48.084556+00	2026-04-21 08:22:48.086722+00
1	14	3042937	postgres	postgres	UPDATE keep_alive SET last_active = now() WHERE id = 1;	succeeded	UPDATE 1	2026-04-21 08:24:08.203616+00	2026-04-21 08:24:08.205162+00
1	7	3042891	postgres	postgres	UPDATE keep_alive SET last_active = now() WHERE id = 1;	succeeded	UPDATE 1	2026-04-21 08:22:58.0999+00	2026-04-21 08:22:58.102472+00
1	15	3042939	postgres	postgres	UPDATE keep_alive SET last_active = now() WHERE id = 1;	succeeded	UPDATE 1	2026-04-21 08:24:18.218795+00	2026-04-21 08:24:18.220219+00
1	8	3042894	postgres	postgres	UPDATE keep_alive SET last_active = now() WHERE id = 1;	succeeded	UPDATE 1	2026-04-21 08:23:08.11509+00	2026-04-21 08:23:08.116572+00
1	21	3042970	postgres	postgres	UPDATE keep_alive SET last_active = now() WHERE id = 1;	succeeded	UPDATE 1	2026-04-21 08:25:18.305376+00	2026-04-21 08:25:18.306931+00
1	9	3042905	postgres	postgres	UPDATE keep_alive SET last_active = now() WHERE id = 1;	succeeded	UPDATE 1	2026-04-21 08:23:18.130718+00	2026-04-21 08:23:18.132079+00
1	16	3042940	postgres	postgres	UPDATE keep_alive SET last_active = now() WHERE id = 1;	succeeded	UPDATE 1	2026-04-21 08:24:28.232879+00	2026-04-21 08:24:28.234256+00
1	10	3042909	postgres	postgres	UPDATE keep_alive SET last_active = now() WHERE id = 1;	succeeded	UPDATE 1	2026-04-21 08:23:28.145752+00	2026-04-21 08:23:28.147233+00
1	26	3202064	postgres	postgres	UPDATE keep_alive SET last_active = now() WHERE id = 1;	succeeded	UPDATE 1	2026-04-25 00:00:00.167085+00	2026-04-25 00:00:00.1982+00
1	22	3042971	postgres	postgres	UPDATE keep_alive SET last_active = now() WHERE id = 1;	succeeded	UPDATE 1	2026-04-21 08:25:28.320039+00	2026-04-21 08:25:28.321517+00
1	17	3042943	postgres	postgres	UPDATE keep_alive SET last_active = now() WHERE id = 1;	succeeded	UPDATE 1	2026-04-21 08:24:38.247392+00	2026-04-21 08:24:38.248952+00
1	30	3954614	postgres	postgres	UPDATE keep_alive SET last_active = now() WHERE id = 1;	succeeded	UPDATE 1	2026-05-03 00:00:00.185697+00	2026-05-03 00:00:00.228468+00
1	27	3300223	postgres	postgres	UPDATE keep_alive SET last_active = now() WHERE id = 1;	succeeded	UPDATE 1	2026-04-27 00:00:00.197928+00	2026-04-27 00:00:00.241901+00
1	23	3042979	postgres	postgres	UPDATE keep_alive SET last_active = now() WHERE id = 1;	succeeded	UPDATE 1	2026-04-21 08:25:38.335037+00	2026-04-21 08:25:38.336512+00
1	28	3520282	postgres	postgres	UPDATE keep_alive SET last_active = now() WHERE id = 1;	succeeded	UPDATE 1	2026-04-29 00:00:00.174114+00	2026-04-29 00:00:00.204224+00
\.


--
-- Data for Name: keep_alive; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.keep_alive (id, last_active) FROM stdin;
1	2026-05-03 00:00:00.185718+00
\.


--
-- Data for Name: strategies; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.strategies (id, name, description, rules, color, created_at, sort_order, user_id) FROM stdin;
d34270bb-bc64-4796-b23e-c5afded38ea1	50%回調		[{"id": "a64c307c-6a0d-4c9c-9012-c6a8f13e4606", "name": "Type", "items": [{"id": "75de6e0d-0fc8-49ef-8b41-8273834de3e3", "text": "2-3根K線"}, {"id": "cac64e4f-8da6-4ba3-9b36-615fb9a8063b", "text": "1根K線"}, {"id": "a5b67e0d-2865-4c24-99ea-1b7feda1c212", "text": "窄通道"}, {"id": "a293aec7-f41e-4f2e-8bdc-a152c10d4c93", "text": "突破"}, {"id": "184d20f3-d83f-4a01-a04b-a9ae59411a68", "text": "TR"}, {"id": "445c5267-1d08-4add-b1d9-d6de2dc8fac0", "text": "搶購高潮"}, {"id": "566adc58-bc6f-4957-811b-01075ec805ed", "text": "開盤區間"}]}, {"id": "2c04b6d9-2a0d-479e-b69d-2330b1472386", "name": "Conditions", "items": [{"id": "6104f76b-348d-4662-b8af-ede11c9fee56", "text": "取得MA"}, {"id": "b36680de-9bc2-4f95-9eaa-ef9c429231b7", "text": "反方買/賣壓很弱"}, {"id": "b90fe860-438e-4734-93e2-54c4fd99ca6d", "text": "順勢"}, {"id": "aec3f6e1-cdbf-4f2c-b483-c3899ae9c30d", "text": "逆勢"}, {"id": "7ae2b1c6-405e-40f0-b110-3ca9128a80c7", "text": "第一段"}, {"id": "3516a046-3eef-4af9-9061-f90d3357cb25", "text": "第二段"}, {"id": "756f5cd7-727d-470e-a161-9496886cc3fb", "text": "第三段"}]}, {"id": "466cff55-a5d1-41ab-b1e7-f9ad466d1238", "name": "Management", "items": [{"id": "78dbbf68-7cc6-4c81-839a-5c025bc972d2", "text": "引線穿越"}, {"id": "09695f82-1733-40d6-a6d1-f225b38e7320", "text": "接近入場價"}, {"id": "63acc3fb-eece-44f9-a459-9f829ae00e1c", "text": "實體穿越"}, {"id": "c21a1f6c-45ac-4d35-96d9-3d8c72333304", "text": "0.5R"}, {"id": "4fb1e3f4-e960-4ffb-a203-8dcb1394c2c2", "text": "1R"}, {"id": "ba3d3695-8d42-43e1-a127-91ddbeca9080", "text": "2R"}]}]	#8b5cf6	2026-02-12 10:24:19.563953+00	0	f49d86cc-1d15-4364-a67c-54876f358360
2cb8065c-93b2-46cd-832e-5cf66428b7ec	反轉		[{"id": "56f14fc0-7649-4a5a-9220-7dc20d748ad9", "name": "Type", "items": [{"id": "37522452-ca7c-4732-801a-afd8a4daaf3b", "text": "DT/DB"}, {"id": "78722eed-20e3-4358-99ac-fe8c3fe83847", "text": "Wedge"}, {"id": "ea64b830-455c-4e3a-ad98-e42ee6c61f3d", "text": "Climax"}, {"id": "6e44b7e2-3a97-4ede-8ced-1db5dd3252fe", "text": "前高/低"}, {"id": "57fb2fa3-58b0-46ab-9d7f-b407ad7970a7", "text": "通道線"}, {"id": "1c04c496-5d6a-4513-897f-78cf9f9ba78a", "text": "兩次突破失敗"}, {"id": "9723817b-b838-402a-9c64-09b8557f2516", "text": "MTR"}, {"id": "9c6bd981-9aff-4b43-848f-a4663808abcf", "text": "不固定2R較優"}]}, {"id": "eb43c5de-08a3-458d-9a86-1d9df117cc36", "name": "Entry criteria", "items": [{"id": "65110cd8-07d1-46c2-bca0-6f4acb684bf8", "text": "好的信號K"}, {"id": "e3b605f2-2914-47b2-b15f-b55459af6bd6", "text": "第二入場點"}, {"id": "997bfb97-c842-48db-ae05-76724847b839", "text": "DT/DB"}, {"id": "535ecc51-e3f2-4da1-b84c-81c40add124a", "text": "Wedge"}, {"id": "aff914a8-e9f5-4ce7-b2c6-72a415f7f2d2", "text": "micro DT/DB"}, {"id": "f57bf4b8-09ec-40bd-9bcb-de3fb31a5c86", "text": "micro Wedge"}, {"id": "bb502c29-6df2-4414-977b-924267351e37", "text": "嵌套 Wedge"}, {"id": "f945367f-dec6-42dc-9819-54ddbbc6c0c3", "text": "達到MM"}, {"id": "829fe593-4289-4a77-bc7f-7e6f9110833c", "text": "重要的支撐/阻力附近"}, {"id": "4ed203b9-67b5-455c-8f7e-335752cc43f7", "text": "潛在竭盡型缺口"}, {"id": "58aa4bdf-10f2-4815-ac21-eb00be5e01be", "text": "順大趨勢"}, {"id": "1acae894-cf00-4b6a-ac47-8a8c9e54002e", "text": "反方買/賣壓弱"}, {"id": "8deab7ab-f093-40a0-94d6-b3073ccfd82f", "text": "50%回調"}, {"id": "7b1a9b97-d7ef-4393-a205-eebf9413648b", "text": "18K"}, {"id": "9ab53c61-982b-43cd-8318-0c0f37238d64", "text": "40K"}]}, {"id": "778317f4-2c3f-47cb-b650-3c4190ff6ca6", "name": "Bad criteria", "items": []}]	#8b5cf6	2026-02-12 05:06:39.667754+00	2	f49d86cc-1d15-4364-a67c-54876f358360
4d0360d7-0484-460b-abcd-f9e078e4ac03	突破(買跟隨的收盤)		[{"id": "8e95d8a1-e695-4673-84e6-a8a01392f2d9", "name": "Entry criteria", "items": [{"id": "630fe785-d8bb-4e56-ae5e-9598af650838", "text": "突破TR"}, {"id": "32622830-e0db-4126-9a2d-f46cffef65cb", "text": "突破支撐/阻力"}, {"id": "cca0e2bc-dea9-4d47-b5bb-50af5382dcbe", "text": "買/賣壓很強"}, {"id": "f45c6853-63b3-4ba3-bbac-26df8f89c03d", "text": "K線體積大"}, {"id": "ae1212d1-c8e8-4119-bcec-fbf9ed852804", "text": "重疊少"}, {"id": "96cae3ee-4c09-42a1-879f-5d1a1fae8b9a", "text": "上/下引線小"}]}, {"id": "666029d3-33b3-43c0-80fb-2301f22ceb97", "name": "Bad criteria", "items": [{"id": "c8fecaee-f94e-4856-883e-4a83c86ba965", "text": "體積太大導致RR差"}, {"id": "ed939035-cf8a-4600-8fbf-3dd142887eb5", "text": "重疊多"}]}, {"id": "a5a1091c-1415-4836-b086-bf63a3d5e37b", "name": "Management", "items": [{"id": "1ae12704-7c99-402c-8253-b9d6f8376ed0", "text": "0.5R"}, {"id": "26acfb08-f38f-4471-bbb7-611bf91ac77e", "text": "1R"}, {"id": "8ed031c9-81ce-48a1-a09f-5150abef2bda", "text": "2R"}]}]	#8b5cf6	2026-02-12 05:03:58.71926+00	3	f49d86cc-1d15-4364-a67c-54876f358360
253560c5-466e-4f89-b68f-ccd93a6a325a	TR限價單2R		[{"id": "86740dc0-e29e-47e3-bd9b-c589a2a16f6a", "name": "Entry criteria", "items": [{"id": "68570754-2236-42b0-b7ef-ae93d4f46659", "text": "大漲大跌"}, {"id": "b17d0aca-5a44-4f58-b2e3-2e6cc1790b1a", "text": "重疊度高"}, {"id": "6e158cb7-8a75-4e54-8e86-d8b24a939b2f", "text": "前面已執行同樣交易並盈利"}]}, {"id": "d8beae00-1be3-478d-a17d-eb6545a312fa", "name": "Bad criteria", "items": [{"id": "a47f219d-64dc-4c5f-a7ab-d5e4c01b47fa", "text": "反方買/賣壓較強"}, {"id": "0d09b732-69a3-43cd-8632-0a2ddb9b7ee2", "text": "止損外有明顯的磁鐵"}, {"id": "b8d2f1a2-9bf1-4049-a626-ee26d72314bf", "text": "前一筆交易套保"}, {"id": "94dc1e62-b5a2-4029-a42a-558eb81da474", "text": "前一筆交易止損"}]}, {"id": "4d7f40be-e5c6-49a9-93a3-7b8fc2a09eeb", "name": "Market conditions", "items": []}]	#8b5cf6	2026-02-12 06:28:06.491502+00	1	f49d86cc-1d15-4364-a67c-54876f358360
\.


--
-- Data for Name: tag_categories; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.tag_categories (id, name, color, created_at, sort_order, user_id) FROM stdin;
8982071f-a304-488b-9c15-7c067392b2eb	套保選擇	#8b5cf6	2026-04-21 18:13:06.173988+00	0	f49d86cc-1d15-4364-a67c-54876f358360
16b45ff9-1797-4675-b023-c1ee96502edc	套保後情況	#ef4444	2026-03-05 17:59:08.314679+00	1	f49d86cc-1d15-4364-a67c-54876f358360
109cbe39-f49f-4907-9ff9-28f93ee26726	最佳套保選擇	#14b8a6	2026-04-21 18:13:06.763812+00	3	f49d86cc-1d15-4364-a67c-54876f358360
2e74c744-78c3-441f-b588-1a0bf712dc2a	是否該提前反向交易	#f97316	2026-04-29 16:06:41.519899+00	2	f49d86cc-1d15-4364-a67c-54876f358360
4d5fca31-ebea-483c-9311-0e32bcbe6e84	訂單	#06b6d4	2026-04-21 17:18:57.192566+00	4	f49d86cc-1d15-4364-a67c-54876f358360
c2f29cff-81c2-4049-8c9a-0ac7d545786f	離場原因	#ef4444	2026-02-12 04:33:07.921867+00	10	f49d86cc-1d15-4364-a67c-54876f358360
4b18bd08-aa63-46a7-b083-2081b029e213	踏空	#ef4444	2026-04-21 18:19:27.345305+00	5	f49d86cc-1d15-4364-a67c-54876f358360
caa7ffdb-6a8e-468f-9354-ef8c6c5ccd6d	實盤	#b87070	2026-02-14 02:10:02.710668+00	7	f49d86cc-1d15-4364-a67c-54876f358360
a2149eaf-4a99-41e0-93fb-25c63b1ec63d	時段(台灣)	#b87070	2026-02-12 04:55:10.788774+00	8	f49d86cc-1d15-4364-a67c-54876f358360
a117c012-6b9b-4838-a17d-dc6997fe9cb0	時間級別	#b87070	2026-02-12 13:59:38.159945+00	6	f49d86cc-1d15-4364-a67c-54876f358360
5e4d056a-a127-4a6c-ad08-b8fc98e793ce	最大RR	#3b82f6	2026-02-12 04:54:07.648223+00	9	f49d86cc-1d15-4364-a67c-54876f358360
\.


--
-- Data for Name: tags; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.tags (id, name, category_id, created_at, sort_order, user_id) FROM stdin;
b905337e-c0d2-4a42-a0bc-1aabd63fed54	接近止盈	8982071f-a304-488b-9c15-7c067392b2eb	2026-04-28 16:58:35.365902+00	2	f49d86cc-1d15-4364-a67c-54876f358360
021d2a71-2007-46a9-bba8-7e44336c8503	套保後止損	16b45ff9-1797-4675-b023-c1ee96502edc	2026-03-05 17:59:17.98442+00	1	f49d86cc-1d15-4364-a67c-54876f358360
ff9731f5-b369-47ca-bac1-ce7d94ba5562	3	5e4d056a-a127-4a6c-ad08-b8fc98e793ce	2026-02-12 04:54:15.564869+00	2	f49d86cc-1d15-4364-a67c-54876f358360
72d1f4c8-d80a-4408-8ac0-1f1795ef18f2	會再次套保	16b45ff9-1797-4675-b023-c1ee96502edc	2026-03-05 17:59:32.770478+00	3	f49d86cc-1d15-4364-a67c-54876f358360
abf2cb28-1ca2-487f-9a40-bef1910c9749	早上	a2149eaf-4a99-41e0-93fb-25c63b1ec63d	2026-02-17 01:12:34.018698+00	0	f49d86cc-1d15-4364-a67c-54876f358360
30c0ce7e-48dc-455f-8e3c-b35f70ea377e	5 min	a117c012-6b9b-4838-a17d-dc6997fe9cb0	2026-02-12 13:59:58.369396+00	2	f49d86cc-1d15-4364-a67c-54876f358360
bc660790-a02b-4abd-b186-c94b5c65b001	6	5e4d056a-a127-4a6c-ad08-b8fc98e793ce	2026-02-12 04:54:19.368237+00	5	f49d86cc-1d15-4364-a67c-54876f358360
f4b9bcb3-ea3d-459a-aedc-8f00bd1cf4f1	限價單	4d5fca31-ebea-483c-9311-0e32bcbe6e84	2026-04-21 17:18:57.490215+00	0	f49d86cc-1d15-4364-a67c-54876f358360
53e1c42e-b18a-464b-a769-1806e050f203	踏空	4b18bd08-aa63-46a7-b083-2081b029e213	2026-04-21 18:19:27.63966+00	0	f49d86cc-1d15-4364-a67c-54876f358360
49c96e7a-5f71-495e-ad81-5761b9ac6c0e	市價單	4d5fca31-ebea-483c-9311-0e32bcbe6e84	2026-04-21 17:18:57.928354+00	2	f49d86cc-1d15-4364-a67c-54876f358360
d9fb9566-0805-40ca-b813-bee5c91bdc84	7	5e4d056a-a127-4a6c-ad08-b8fc98e793ce	2026-02-12 04:54:20.465858+00	6	f49d86cc-1d15-4364-a67c-54876f358360
309ec848-9e28-4c67-9b03-cd13ff925440	5	5e4d056a-a127-4a6c-ad08-b8fc98e793ce	2026-02-12 04:54:18.09625+00	4	f49d86cc-1d15-4364-a67c-54876f358360
245c48fa-1f83-4a97-b19f-e448381a1ecf	1min	a117c012-6b9b-4838-a17d-dc6997fe9cb0	2026-02-12 13:59:46.267767+00	0	f49d86cc-1d15-4364-a67c-54876f358360
d5abea44-d155-4bd6-b9ae-f32155c1f53e	價格到位(收盤)	109cbe39-f49f-4907-9ff9-28f93ee26726	2026-04-21 18:13:09.904824+00	0	f49d86cc-1d15-4364-a67c-54876f358360
9b9c4c87-9187-41c2-8370-fcb8ebd41665	反方反轉可能大	109cbe39-f49f-4907-9ff9-28f93ee26726	2026-04-21 18:13:10.78736+00	4	f49d86cc-1d15-4364-a67c-54876f358360
33b3a6cf-cd92-4753-98db-a15ff12aa382	後續走勢差	16b45ff9-1797-4675-b023-c1ee96502edc	2026-03-06 16:28:39.488445+00	4	f49d86cc-1d15-4364-a67c-54876f358360
dcf5b5b1-c513-4ac2-8d5f-762ce2f4398d	4	5e4d056a-a127-4a6c-ad08-b8fc98e793ce	2026-02-12 04:54:16.829554+00	3	f49d86cc-1d15-4364-a67c-54876f358360
bb5de66f-5d28-44e5-95c6-398358943029	3 min	a117c012-6b9b-4838-a17d-dc6997fe9cb0	2026-02-12 13:59:52.557752+00	1	f49d86cc-1d15-4364-a67c-54876f358360
9d707c94-1e83-4e63-bc16-86fa59cb5f50	套保後止盈	16b45ff9-1797-4675-b023-c1ee96502edc	2026-03-05 17:59:23.133554+00	0	f49d86cc-1d15-4364-a67c-54876f358360
bd572175-2b52-4894-8f59-93fcdf9dbeb7	接近止損	8982071f-a304-488b-9c15-7c067392b2eb	2026-04-21 18:13:08.49199+00	1	f49d86cc-1d15-4364-a67c-54876f358360
5933a0e9-faef-42d1-8e45-bfcf234e1212	晚上	a2149eaf-4a99-41e0-93fb-25c63b1ec63d	2026-02-12 04:55:33.935772+00	2	f49d86cc-1d15-4364-a67c-54876f358360
71e3e576-db76-4e73-9b1f-d5b935905da1	2	5e4d056a-a127-4a6c-ad08-b8fc98e793ce	2026-02-12 04:54:14.287329+00	1	f49d86cc-1d15-4364-a67c-54876f358360
0c3be9c5-cfdc-42c2-bd96-6ae950987691	收盤	c2f29cff-81c2-4049-8c9a-0ac7d545786f	2026-02-12 04:36:52.024924+00	0	f49d86cc-1d15-4364-a67c-54876f358360
7e662cb7-c5a7-42bc-b1ee-d701ba6c1e52	晚點再套保	109cbe39-f49f-4907-9ff9-28f93ee26726	2026-04-22 15:03:50.214475+00	5	f49d86cc-1d15-4364-a67c-54876f358360
ab4f6519-cf33-419f-b0fc-e52a62ff9fee	下午	a2149eaf-4a99-41e0-93fb-25c63b1ec63d	2026-02-12 04:55:28.39054+00	1	f49d86cc-1d15-4364-a67c-54876f358360
c4f74a70-c7aa-4ccd-882f-452a6f53a069	美盤	a2149eaf-4a99-41e0-93fb-25c63b1ec63d	2026-02-12 04:55:38.078092+00	3	f49d86cc-1d15-4364-a67c-54876f358360
668f0e11-3d89-44d6-bc0d-aad77304f5c6	1	5e4d056a-a127-4a6c-ad08-b8fc98e793ce	2026-02-12 04:54:12.693237+00	0	f49d86cc-1d15-4364-a67c-54876f358360
a97518fe-59f9-4e4f-8f6d-3a43f05c8322	反方反轉可能大	8982071f-a304-488b-9c15-7c067392b2eb	2026-04-21 18:13:10.995315+00	4	f49d86cc-1d15-4364-a67c-54876f358360
524efe2f-9b93-4d75-8991-a45caa8bdc50	否	2e74c744-78c3-441f-b588-1a0bf712dc2a	2026-04-29 16:06:42.52411+00	1	f49d86cc-1d15-4364-a67c-54876f358360
f67c5eeb-b098-4346-bfe1-e45e770a1062	接近止盈	109cbe39-f49f-4907-9ff9-28f93ee26726	2026-04-28 16:58:35.61372+00	3	f49d86cc-1d15-4364-a67c-54876f358360
070e412a-435e-496b-98c0-e29fdf435e6c	是	2e74c744-78c3-441f-b588-1a0bf712dc2a	2026-04-29 16:06:42.288669+00	0	f49d86cc-1d15-4364-a67c-54876f358360
077f4cf2-c17a-41b7-8c55-5ca8c3d5796e	>7	5e4d056a-a127-4a6c-ad08-b8fc98e793ce	2026-02-12 04:54:26.446699+00	7	f49d86cc-1d15-4364-a67c-54876f358360
1cfc9e56-709b-41f3-b380-5ff49b3d58db	手動套保	c2f29cff-81c2-4049-8c9a-0ac7d545786f	2026-02-12 04:40:37.637368+00	2	f49d86cc-1d15-4364-a67c-54876f358360
cad964ba-7f7f-4d58-bacd-0ada1af0f479	反方機會(收盤)	109cbe39-f49f-4907-9ff9-28f93ee26726	2026-04-21 18:13:10.333697+00	1	f49d86cc-1d15-4364-a67c-54876f358360
eeef2843-8cbf-42ee-9f71-104382fbdc98	反方機會(收盤)	8982071f-a304-488b-9c15-7c067392b2eb	2026-04-21 18:13:08.175708+00	3	f49d86cc-1d15-4364-a67c-54876f358360
ca77752e-f6c3-4bd6-bd86-c53234980f57	實盤	caa7ffdb-6a8e-468f-9354-ef8c6c5ccd6d	2026-02-14 02:10:09.367461+00	0	f49d86cc-1d15-4364-a67c-54876f358360
4c327eb0-c563-440c-8257-4881cbfdf62a	反轉可能大	c2f29cff-81c2-4049-8c9a-0ac7d545786f	2026-02-12 05:46:04.644899+00	5	f49d86cc-1d15-4364-a67c-54876f358360
8231ccd0-0bd4-4be9-95ca-e82da0570d54	兩根反方中等K線	c2f29cff-81c2-4049-8c9a-0ac7d545786f	2026-02-12 04:39:53.188403+00	8	f49d86cc-1d15-4364-a67c-54876f358360
ba66664f-1dce-48fb-8781-960c97f9a3eb	沒把握離場觀望	c2f29cff-81c2-4049-8c9a-0ac7d545786f	2026-02-12 04:38:38.031903+00	10	f49d86cc-1d15-4364-a67c-54876f358360
11dbcd8b-9e32-4f22-b1c6-c6d86a01ee74	單根反方大K線	c2f29cff-81c2-4049-8c9a-0ac7d545786f	2026-02-12 04:39:38.417155+00	1	f49d86cc-1d15-4364-a67c-54876f358360
52038e79-409c-4fd2-919f-0da7e110d4e8	突破單	4d5fca31-ebea-483c-9311-0e32bcbe6e84	2026-04-21 17:18:57.715924+00	1	f49d86cc-1d15-4364-a67c-54876f358360
3e105918-ed24-475c-acd2-e605583c2682	前提不成立	c2f29cff-81c2-4049-8c9a-0ac7d545786f	2026-02-12 04:37:54.815736+00	4	f49d86cc-1d15-4364-a67c-54876f358360
e645e271-35dd-4256-8e77-29f831fa669e	價格到位(收盤)	8982071f-a304-488b-9c15-7c067392b2eb	2026-04-21 18:13:07.550615+00	0	f49d86cc-1d15-4364-a67c-54876f358360
d7d7995c-1008-499e-9305-061fe4c7df91	跟隨不好	c2f29cff-81c2-4049-8c9a-0ac7d545786f	2026-02-12 10:15:27.682782+00	13	f49d86cc-1d15-4364-a67c-54876f358360
28a7bb04-f8c0-4745-b0c3-00f6b9ea456a	連續反方小K線	c2f29cff-81c2-4049-8c9a-0ac7d545786f	2026-02-12 04:40:15.295186+00	3	f49d86cc-1d15-4364-a67c-54876f358360
89a826a7-c03b-4878-afdc-379478d57a8e	未套保打止損	16b45ff9-1797-4675-b023-c1ee96502edc	2026-04-21 18:13:09.511208+00	5	f49d86cc-1d15-4364-a67c-54876f358360
656164aa-3801-4bc7-8783-b86b545e8c24	MM	c2f29cff-81c2-4049-8c9a-0ac7d545786f	2026-02-12 04:35:12.251673+00	6	f49d86cc-1d15-4364-a67c-54876f358360
d3d87ff7-801a-438c-bb78-b04dc1f768fb	固定RR	c2f29cff-81c2-4049-8c9a-0ac7d545786f	2026-02-12 04:41:25.657316+00	12	f49d86cc-1d15-4364-a67c-54876f358360
88550cee-5b8f-4885-9cf7-4e7bf113ed70	反方第二機會	c2f29cff-81c2-4049-8c9a-0ac7d545786f	2026-02-12 04:37:37.727585+00	9	f49d86cc-1d15-4364-a67c-54876f358360
7cf9cbdf-ee52-4d47-8f9a-e2add207eb1b	第二套保	c2f29cff-81c2-4049-8c9a-0ac7d545786f	2026-02-12 04:38:22.967081+00	7	f49d86cc-1d15-4364-a67c-54876f358360
da044f08-6cf4-4843-97b2-36504cb55851	反方機會	16b45ff9-1797-4675-b023-c1ee96502edc	2026-04-28 17:22:05.965721+00	2	f49d86cc-1d15-4364-a67c-54876f358360
c7d5fbfb-6e96-43f4-9681-4ae19449655b	前高/低	c2f29cff-81c2-4049-8c9a-0ac7d545786f	2026-02-12 04:36:09.722807+00	11	f49d86cc-1d15-4364-a67c-54876f358360
f801df52-c286-4bdb-a01c-a253b97f8530	通道線/趨勢線	c2f29cff-81c2-4049-8c9a-0ac7d545786f	2026-02-12 04:36:30.528191+00	14	f49d86cc-1d15-4364-a67c-54876f358360
81239fa3-f719-4f28-8f67-dd5e69c2c55f	接近止損	109cbe39-f49f-4907-9ff9-28f93ee26726	2026-04-21 18:13:10.52959+00	2	f49d86cc-1d15-4364-a67c-54876f358360
\.


--
-- Data for Name: trades; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.trades (id, symbol, direction, status, "entryDate", quantity, "entryPrice", "exitPrice", commission, "initialStopLoss", "highestPriceReached", "lowestPriceReached", "playbookId", note, "exitDate", "screenshotUrl", "bestExitPrice", tags, "rulesFollowed", user_id) FROM stdin;
3982ee63-b277-4e29-bbbe-a99c3ecd071b	MESM6	Long	Break Even	2026-04-22T22:33:11	2	7154.75	7154.75	3.64	7146.25	7160.5	7153.25	d34270bb-bc64-4796-b23e-c5afded38ea1	\N	2026-04-22T22:35:38	https://s3.tradingview.com/snapshots/u/uQqhWdm3.png	\N	{f4b9bcb3-ea3d-459a-aedc-8f00bd1cf4f1,30c0ce7e-48dc-455f-8e3c-b35f70ea377e,ca77752e-f6c3-4bd6-bd86-c53234980f57,c4f74a70-c7aa-4ccd-882f-452a6f53a069,e645e271-35dd-4256-8e77-29f831fa669e,d5abea44-d155-4bd6-b9ae-f32155c1f53e,9d707c94-1e83-4e63-bc16-86fa59cb5f50,7e662cb7-c5a7-42bc-b1ee-d701ba6c1e52}	{a5b67e0d-2865-4c24-99ea-1b7feda1c212,b90fe860-438e-4734-93e2-54c4fd99ca6d,6104f76b-348d-4662-b8af-ede11c9fee56,b36680de-9bc2-4f95-9eaa-ef9c429231b7,3516a046-3eef-4af9-9061-f90d3357cb25,78dbbf68-7cc6-4c81-839a-5c025bc972d2,4fb1e3f4-e960-4ffb-a203-8dcb1394c2c2}	f49d86cc-1d15-4364-a67c-54876f358360
fe689f7c-5b7a-4463-b98e-4bf8f13ecbe2	MESM6	Short	Win	2026-04-29T21:37:11	4	7159.75	7154.5	7.28	7165	7159.75	7154.25	d34270bb-bc64-4796-b23e-c5afded38ea1	\N	2026-04-29T21:43:58	https://s3.tradingview.com/snapshots/s/sW89aJvL.png	\N	{f4b9bcb3-ea3d-459a-aedc-8f00bd1cf4f1,30c0ce7e-48dc-455f-8e3c-b35f70ea377e,ca77752e-f6c3-4bd6-bd86-c53234980f57,c4f74a70-c7aa-4ccd-882f-452a6f53a069}	{cac64e4f-8da6-4ba3-9b36-615fb9a8063b,566adc58-bc6f-4957-811b-01075ec805ed,6104f76b-348d-4662-b8af-ede11c9fee56,b36680de-9bc2-4f95-9eaa-ef9c429231b7,b90fe860-438e-4734-93e2-54c4fd99ca6d,7ae2b1c6-405e-40f0-b110-3ca9128a80c7,78dbbf68-7cc6-4c81-839a-5c025bc972d2,4fb1e3f4-e960-4ffb-a203-8dcb1394c2c2}	f49d86cc-1d15-4364-a67c-54876f358360
30d11928-21ec-4812-a017-4fb0053377bb	MESM6	Short	Small Win	2026-04-22T22:47:33	3	7160.25	7157.25	5.46	7166.25	7162.25	7153.5	d34270bb-bc64-4796-b23e-c5afded38ea1	\N	2026-04-22T23:00:02	https://s3.tradingview.com/snapshots/z/zTloQzh1.png	\N	{f4b9bcb3-ea3d-459a-aedc-8f00bd1cf4f1,30c0ce7e-48dc-455f-8e3c-b35f70ea377e,ca77752e-f6c3-4bd6-bd86-c53234980f57,c4f74a70-c7aa-4ccd-882f-452a6f53a069}	{cac64e4f-8da6-4ba3-9b36-615fb9a8063b,b36680de-9bc2-4f95-9eaa-ef9c429231b7,aec3f6e1-cdbf-4f2c-b483-c3899ae9c30d,7ae2b1c6-405e-40f0-b110-3ca9128a80c7,63acc3fb-eece-44f9-a459-9f829ae00e1c,c21a1f6c-45ac-4d35-96d9-3d8c72333304}	f49d86cc-1d15-4364-a67c-54876f358360
496086ba-eab9-46ae-906d-85aebcb41f98	MESM6	Long	Loss	2026-04-29T22:50:22	4	7167.75	7162.25	7.28	7162.25	7170.5	7162.25	d34270bb-bc64-4796-b23e-c5afded38ea1	\N	2026-04-29T23:03:51	https://s3.tradingview.com/snapshots/4/4QzS5Hnc.png	\N	{f4b9bcb3-ea3d-459a-aedc-8f00bd1cf4f1,30c0ce7e-48dc-455f-8e3c-b35f70ea377e,ca77752e-f6c3-4bd6-bd86-c53234980f57,c4f74a70-c7aa-4ccd-882f-452a6f53a069,89a826a7-c03b-4878-afdc-379478d57a8e}	{75de6e0d-0fc8-49ef-8b41-8273834de3e3,a5b67e0d-2865-4c24-99ea-1b7feda1c212,6104f76b-348d-4662-b8af-ede11c9fee56,b36680de-9bc2-4f95-9eaa-ef9c429231b7,b90fe860-438e-4734-93e2-54c4fd99ca6d,756f5cd7-727d-470e-a161-9496886cc3fb,78dbbf68-7cc6-4c81-839a-5c025bc972d2}	f49d86cc-1d15-4364-a67c-54876f358360
9e202de4-01b0-494e-a84b-467a96728b56	MESM6	Short	Small Win	2026-04-22T22:36:46	3	7160.25	7157.375	5.46	7166.25	7165.75	7154.25	d34270bb-bc64-4796-b23e-c5afded38ea1	\N	2026-04-22T22:47:19	https://s3.tradingview.com/snapshots/r/rwgCwFsU.png	\N	{f4b9bcb3-ea3d-459a-aedc-8f00bd1cf4f1,30c0ce7e-48dc-455f-8e3c-b35f70ea377e,ca77752e-f6c3-4bd6-bd86-c53234980f57,c4f74a70-c7aa-4ccd-882f-452a6f53a069}	{cac64e4f-8da6-4ba3-9b36-615fb9a8063b,b36680de-9bc2-4f95-9eaa-ef9c429231b7,aec3f6e1-cdbf-4f2c-b483-c3899ae9c30d,3516a046-3eef-4af9-9061-f90d3357cb25,c21a1f6c-45ac-4d35-96d9-3d8c72333304,09695f82-1733-40d6-a6d1-f225b38e7320}	f49d86cc-1d15-4364-a67c-54876f358360
37fb3ded-a13e-470a-b38a-02c05229c41a	MESH6	Long	Win	2026-04-03T02:02:39.000Z	1	6596	6605.75	33.75	6589	6609.25	6590.25	d34270bb-bc64-4796-b23e-c5afded38ea1	\N	2026-04-03T01:10:11.000Z	https://s3.tradingview.com/snapshots/m/Mz9dYa6r.png	\N	{}	{b9500cb7-24f6-4da3-ad24-abfa43c52213}	f49d86cc-1d15-4364-a67c-54876f358360
50c287e0-659b-40ac-ae38-fea446e4c7cd	MESM6	Short	Break Even	2026-04-29T23:24:08	3	7162.75	7162.75	5.46	7169.75	7164.75	7157.25	d34270bb-bc64-4796-b23e-c5afded38ea1	\N	2026-04-29T23:46:04	https://s3.tradingview.com/snapshots/p/p3Je1kSl.png	\N	{f4b9bcb3-ea3d-459a-aedc-8f00bd1cf4f1,30c0ce7e-48dc-455f-8e3c-b35f70ea377e,ca77752e-f6c3-4bd6-bd86-c53234980f57,c4f74a70-c7aa-4ccd-882f-452a6f53a069,e645e271-35dd-4256-8e77-29f831fa669e,9d707c94-1e83-4e63-bc16-86fa59cb5f50,070e412a-435e-496b-98c0-e29fdf435e6c}	{a5b67e0d-2865-4c24-99ea-1b7feda1c212,6104f76b-348d-4662-b8af-ede11c9fee56,b36680de-9bc2-4f95-9eaa-ef9c429231b7,b90fe860-438e-4734-93e2-54c4fd99ca6d,7ae2b1c6-405e-40f0-b110-3ca9128a80c7,78dbbf68-7cc6-4c81-839a-5c025bc972d2}	f49d86cc-1d15-4364-a67c-54876f358360
a8c984c3-e41a-4f4a-beca-e3be451b2cd7	MESH6	Short	Win	2026-04-03T01:16:10	1	6614	6609.75	0	6617.75	6615	6604	2cb8065c-93b2-46cd-832e-5cf66428b7ec	\N	2026-04-03T01:39:08	https://s3.tradingview.com/snapshots/i/i7rymf10.png	\N	{}	{}	f49d86cc-1d15-4364-a67c-54876f358360
e30faf11-d10f-4e67-9224-4244dafe40c1	MESM6	Short	Break Even	2026-04-22T23:49:03	3	7157.5	7157.5	5.46	7164	7159.25	7152.5	d34270bb-bc64-4796-b23e-c5afded38ea1	\N	2026-04-23T00:04:12	https://s3.tradingview.com/snapshots/u/upRuayj4.png	\N	{f4b9bcb3-ea3d-459a-aedc-8f00bd1cf4f1,30c0ce7e-48dc-455f-8e3c-b35f70ea377e,ca77752e-f6c3-4bd6-bd86-c53234980f57,c4f74a70-c7aa-4ccd-882f-452a6f53a069,d5abea44-d155-4bd6-b9ae-f32155c1f53e}	{75de6e0d-0fc8-49ef-8b41-8273834de3e3,184d20f3-d83f-4a01-a04b-a9ae59411a68,7ae2b1c6-405e-40f0-b110-3ca9128a80c7,78dbbf68-7cc6-4c81-839a-5c025bc972d2}	f49d86cc-1d15-4364-a67c-54876f358360
a3f182ff-ef0b-4727-ad6e-b834ae61f419	MESM6	Short	Win	2026-04-29T23:47:57	5	7161	7157.25	9.1	7164.75	7163.5	7153.25	d34270bb-bc64-4796-b23e-c5afded38ea1	\N	2026-04-29T23:51:11	https://s3.tradingview.com/snapshots/w/wIuSTOY8.png	\N	{30c0ce7e-48dc-455f-8e3c-b35f70ea377e,ca77752e-f6c3-4bd6-bd86-c53234980f57,c4f74a70-c7aa-4ccd-882f-452a6f53a069,52038e79-409c-4fd2-919f-0da7e110d4e8}	{75de6e0d-0fc8-49ef-8b41-8273834de3e3,184d20f3-d83f-4a01-a04b-a9ae59411a68,6104f76b-348d-4662-b8af-ede11c9fee56,b90fe860-438e-4734-93e2-54c4fd99ca6d,7ae2b1c6-405e-40f0-b110-3ca9128a80c7,63acc3fb-eece-44f9-a459-9f829ae00e1c}	f49d86cc-1d15-4364-a67c-54876f358360
ccd5290c-8e5f-4471-a724-e4caf63b728a	MESM6	Long	Break Even	2026-04-23T00:11:19	5	7156.25	7156.25	9.1	7152.5	7159	7154.5	d34270bb-bc64-4796-b23e-c5afded38ea1	\N	2026-04-23T00:16:33	https://s3.tradingview.com/snapshots/q/qNkKy1tn.png	\N	{f4b9bcb3-ea3d-459a-aedc-8f00bd1cf4f1,30c0ce7e-48dc-455f-8e3c-b35f70ea377e,ca77752e-f6c3-4bd6-bd86-c53234980f57,c4f74a70-c7aa-4ccd-882f-452a6f53a069,021d2a71-2007-46a9-bba8-7e44336c8503,d5abea44-d155-4bd6-b9ae-f32155c1f53e,e645e271-35dd-4256-8e77-29f831fa669e}	{75de6e0d-0fc8-49ef-8b41-8273834de3e3,184d20f3-d83f-4a01-a04b-a9ae59411a68,3516a046-3eef-4af9-9061-f90d3357cb25,78dbbf68-7cc6-4c81-839a-5c025bc972d2}	f49d86cc-1d15-4364-a67c-54876f358360
56443626-9b3c-4414-b05c-31ccaca5a96d	MESM6	Short	Break Even	2026-04-30T00:01:27	3	7155.25	7155.25	5.46	7162	7161	7155	d34270bb-bc64-4796-b23e-c5afded38ea1	\N	2026-04-30T00:15:04	https://s3.tradingview.com/snapshots/r/rLE46efG.png	\N	{f4b9bcb3-ea3d-459a-aedc-8f00bd1cf4f1,30c0ce7e-48dc-455f-8e3c-b35f70ea377e,ca77752e-f6c3-4bd6-bd86-c53234980f57,c4f74a70-c7aa-4ccd-882f-452a6f53a069,bd572175-2b52-4894-8f59-93fcdf9dbeb7,72d1f4c8-d80a-4408-8ac0-1f1795ef18f2}	{cac64e4f-8da6-4ba3-9b36-615fb9a8063b,184d20f3-d83f-4a01-a04b-a9ae59411a68,6104f76b-348d-4662-b8af-ede11c9fee56,b90fe860-438e-4734-93e2-54c4fd99ca6d,b36680de-9bc2-4f95-9eaa-ef9c429231b7,7ae2b1c6-405e-40f0-b110-3ca9128a80c7,63acc3fb-eece-44f9-a459-9f829ae00e1c}	f49d86cc-1d15-4364-a67c-54876f358360
771b4dbe-421b-4f31-98e9-80ff09245a1c	MESM6	Short	Win	2026-04-30T00:24:43	4	7156.25	7151.5	7.28	7161	7156.75	7149.5	d34270bb-bc64-4796-b23e-c5afded38ea1	\N	2026-04-30T00:29:03	https://s3.tradingview.com/snapshots/t/TaZVmvGh.png	\N	{f4b9bcb3-ea3d-459a-aedc-8f00bd1cf4f1,30c0ce7e-48dc-455f-8e3c-b35f70ea377e,ca77752e-f6c3-4bd6-bd86-c53234980f57,c4f74a70-c7aa-4ccd-882f-452a6f53a069}	{75de6e0d-0fc8-49ef-8b41-8273834de3e3,184d20f3-d83f-4a01-a04b-a9ae59411a68,6104f76b-348d-4662-b8af-ede11c9fee56,b36680de-9bc2-4f95-9eaa-ef9c429231b7,b90fe860-438e-4734-93e2-54c4fd99ca6d,7ae2b1c6-405e-40f0-b110-3ca9128a80c7,78dbbf68-7cc6-4c81-839a-5c025bc972d2}	f49d86cc-1d15-4364-a67c-54876f358360
0b1ef23c-f767-423f-b09b-eb675e908619	MESM6	Short	Win	2026-04-23T00:21:35	5	7156.25	7150.625	9.1	7160	7156.5	7146.5	d34270bb-bc64-4796-b23e-c5afded38ea1	\N	2026-04-23T00:30:04	https://s3.tradingview.com/snapshots/x/Xa4qjRPG.png	\N	{f4b9bcb3-ea3d-459a-aedc-8f00bd1cf4f1,30c0ce7e-48dc-455f-8e3c-b35f70ea377e,ca77752e-f6c3-4bd6-bd86-c53234980f57,c4f74a70-c7aa-4ccd-882f-452a6f53a069,d5abea44-d155-4bd6-b9ae-f32155c1f53e,e645e271-35dd-4256-8e77-29f831fa669e}	{cac64e4f-8da6-4ba3-9b36-615fb9a8063b,184d20f3-d83f-4a01-a04b-a9ae59411a68,b36680de-9bc2-4f95-9eaa-ef9c429231b7,b90fe860-438e-4734-93e2-54c4fd99ca6d,7ae2b1c6-405e-40f0-b110-3ca9128a80c7,78dbbf68-7cc6-4c81-839a-5c025bc972d2,ba3d3695-8d42-43e1-a127-91ddbeca9080}	f49d86cc-1d15-4364-a67c-54876f358360
ab46d3fc-957f-4f3c-8271-861bde63817f	MESM6	Long	Break Even	2026-04-23T00:42:56	5	7150.75	7150.75	9.1	7146.5	7152.75	7147.75	d34270bb-bc64-4796-b23e-c5afded38ea1	\N	2026-04-23T00:51:25	https://s3.tradingview.com/snapshots/g/gTPWInCg.png	\N	{f4b9bcb3-ea3d-459a-aedc-8f00bd1cf4f1,30c0ce7e-48dc-455f-8e3c-b35f70ea377e,ca77752e-f6c3-4bd6-bd86-c53234980f57,c4f74a70-c7aa-4ccd-882f-452a6f53a069,cad964ba-7f7f-4d58-bacd-0ada1af0f479,eeef2843-8cbf-42ee-9f71-104382fbdc98,72d1f4c8-d80a-4408-8ac0-1f1795ef18f2}	{75de6e0d-0fc8-49ef-8b41-8273834de3e3,184d20f3-d83f-4a01-a04b-a9ae59411a68,aec3f6e1-cdbf-4f2c-b483-c3899ae9c30d,7ae2b1c6-405e-40f0-b110-3ca9128a80c7,63acc3fb-eece-44f9-a459-9f829ae00e1c}	f49d86cc-1d15-4364-a67c-54876f358360
ded2011c-1476-4920-bf4f-71b9ac234c85	MESM6	Long	Break Even	2026-04-30T00:59:22	4	7147.25	7147.25	7.28	7142	7151	7146.75	d34270bb-bc64-4796-b23e-c5afded38ea1	\N	2026-04-30T01:01:53	https://s3.tradingview.com/snapshots/l/LDFqQuZ6.png	\N	{f4b9bcb3-ea3d-459a-aedc-8f00bd1cf4f1,30c0ce7e-48dc-455f-8e3c-b35f70ea377e,ca77752e-f6c3-4bd6-bd86-c53234980f57,c4f74a70-c7aa-4ccd-882f-452a6f53a069,e645e271-35dd-4256-8e77-29f831fa669e,72d1f4c8-d80a-4408-8ac0-1f1795ef18f2}	{75de6e0d-0fc8-49ef-8b41-8273834de3e3,184d20f3-d83f-4a01-a04b-a9ae59411a68,aec3f6e1-cdbf-4f2c-b483-c3899ae9c30d,7ae2b1c6-405e-40f0-b110-3ca9128a80c7,78dbbf68-7cc6-4c81-839a-5c025bc972d2}	f49d86cc-1d15-4364-a67c-54876f358360
b432d28a-eda2-4db7-af21-812405c9a140	MESM6	Short	Break Even	2026-04-23T22:15:46	3	7164	7164	5.46	7171	7165	7158.5	d34270bb-bc64-4796-b23e-c5afded38ea1	\N	2026-04-23T22:23:58	https://s3.tradingview.com/snapshots/n/nvV1ZOO8.png	\N	{f4b9bcb3-ea3d-459a-aedc-8f00bd1cf4f1,30c0ce7e-48dc-455f-8e3c-b35f70ea377e,ca77752e-f6c3-4bd6-bd86-c53234980f57,c4f74a70-c7aa-4ccd-882f-452a6f53a069,72d1f4c8-d80a-4408-8ac0-1f1795ef18f2,e645e271-35dd-4256-8e77-29f831fa669e,d5abea44-d155-4bd6-b9ae-f32155c1f53e}	{75de6e0d-0fc8-49ef-8b41-8273834de3e3,7ae2b1c6-405e-40f0-b110-3ca9128a80c7,78dbbf68-7cc6-4c81-839a-5c025bc972d2}	f49d86cc-1d15-4364-a67c-54876f358360
436bcbc0-0835-4643-9215-3e82d603ab20	MESM6	Long	Loss	2026-04-30T02:00:26	4	7155.25	7151	5.46	7151	7155.75	7151	d34270bb-bc64-4796-b23e-c5afded38ea1	\N	2026-04-30T02:02:59	https://s3.tradingview.com/snapshots/m/MXatAWzp.png	\N	{f4b9bcb3-ea3d-459a-aedc-8f00bd1cf4f1,30c0ce7e-48dc-455f-8e3c-b35f70ea377e,ca77752e-f6c3-4bd6-bd86-c53234980f57,c4f74a70-c7aa-4ccd-882f-452a6f53a069,89a826a7-c03b-4878-afdc-379478d57a8e}	{75de6e0d-0fc8-49ef-8b41-8273834de3e3,a5b67e0d-2865-4c24-99ea-1b7feda1c212,6104f76b-348d-4662-b8af-ede11c9fee56,b36680de-9bc2-4f95-9eaa-ef9c429231b7,b90fe860-438e-4734-93e2-54c4fd99ca6d,3516a046-3eef-4af9-9061-f90d3357cb25,63acc3fb-eece-44f9-a459-9f829ae00e1c}	f49d86cc-1d15-4364-a67c-54876f358360
f1f6a6b6-1b76-4610-9fa4-cd4660821024	MESM6	Long	Win	2026-04-23T22:28:04	4	7162	7166.75	7.28	7157.25	7169.25	7160.75	d34270bb-bc64-4796-b23e-c5afded38ea1	\N	2026-04-23T22:32:58	https://s3.tradingview.com/snapshots/i/IyR4j4iU.png	\N	{f4b9bcb3-ea3d-459a-aedc-8f00bd1cf4f1,30c0ce7e-48dc-455f-8e3c-b35f70ea377e,ca77752e-f6c3-4bd6-bd86-c53234980f57,c4f74a70-c7aa-4ccd-882f-452a6f53a069,28f406f6-9a62-4a16-8042-78d0b29faa28,021d2a71-2007-46a9-bba8-7e44336c8503,8b7c1888-da0e-42a4-9762-6be2922cd0c7}	{75de6e0d-0fc8-49ef-8b41-8273834de3e3,184d20f3-d83f-4a01-a04b-a9ae59411a68,6104f76b-348d-4662-b8af-ede11c9fee56,b36680de-9bc2-4f95-9eaa-ef9c429231b7,b90fe860-438e-4734-93e2-54c4fd99ca6d,7ae2b1c6-405e-40f0-b110-3ca9128a80c7,78dbbf68-7cc6-4c81-839a-5c025bc972d2,4fb1e3f4-e960-4ffb-a203-8dcb1394c2c2}	f49d86cc-1d15-4364-a67c-54876f358360
c552f258-11b2-4860-8199-16eabfcc1d35	MESM6	Short	Win	2026-04-30T02:17:40	2	7150.5	7140.5	3.64	7160.5	7152.5	7140.5	d34270bb-bc64-4796-b23e-c5afded38ea1	\N	2026-04-30T02:31:33	https://s3.tradingview.com/snapshots/z/zXADg4r8.png	\N	{f4b9bcb3-ea3d-459a-aedc-8f00bd1cf4f1,30c0ce7e-48dc-455f-8e3c-b35f70ea377e,ca77752e-f6c3-4bd6-bd86-c53234980f57,c4f74a70-c7aa-4ccd-882f-452a6f53a069,524efe2f-9b93-4d75-8991-a45caa8bdc50}	{75de6e0d-0fc8-49ef-8b41-8273834de3e3,184d20f3-d83f-4a01-a04b-a9ae59411a68,6104f76b-348d-4662-b8af-ede11c9fee56,b36680de-9bc2-4f95-9eaa-ef9c429231b7,b90fe860-438e-4734-93e2-54c4fd99ca6d,7ae2b1c6-405e-40f0-b110-3ca9128a80c7,78dbbf68-7cc6-4c81-839a-5c025bc972d2}	f49d86cc-1d15-4364-a67c-54876f358360
2a27d35a-7c66-4254-a17f-8b2c029f5f91	MESM6	Long	Win	2026-04-23T23:30:35	6	7176	7179.25	10.92	7172.75	7181.5	7176	d34270bb-bc64-4796-b23e-c5afded38ea1	\N	2026-04-23T23:34:23	https://s3.tradingview.com/snapshots/7/7FWyGeMK.png	\N	{f4b9bcb3-ea3d-459a-aedc-8f00bd1cf4f1,30c0ce7e-48dc-455f-8e3c-b35f70ea377e,ca77752e-f6c3-4bd6-bd86-c53234980f57,c4f74a70-c7aa-4ccd-882f-452a6f53a069,28f406f6-9a62-4a16-8042-78d0b29faa28,021d2a71-2007-46a9-bba8-7e44336c8503,8b7c1888-da0e-42a4-9762-6be2922cd0c7}	{75de6e0d-0fc8-49ef-8b41-8273834de3e3,6104f76b-348d-4662-b8af-ede11c9fee56,b36680de-9bc2-4f95-9eaa-ef9c429231b7,b90fe860-438e-4734-93e2-54c4fd99ca6d,3516a046-3eef-4af9-9061-f90d3357cb25,78dbbf68-7cc6-4c81-839a-5c025bc972d2,4fb1e3f4-e960-4ffb-a203-8dcb1394c2c2}	f49d86cc-1d15-4364-a67c-54876f358360
24add91a-6b50-43a3-a509-2fc364ce932f	MESM6	Short	Loss	2026-04-30T02:35:56	3	7147	7152.75	7.28	7152.75	7152.75	7147	d34270bb-bc64-4796-b23e-c5afded38ea1	\N	2026-05-01T02:36:15	https://s3.tradingview.com/snapshots/v/VLzB7Vmw.png	\N	{f4b9bcb3-ea3d-459a-aedc-8f00bd1cf4f1,30c0ce7e-48dc-455f-8e3c-b35f70ea377e,ca77752e-f6c3-4bd6-bd86-c53234980f57,c4f74a70-c7aa-4ccd-882f-452a6f53a069,89a826a7-c03b-4878-afdc-379478d57a8e}	{75de6e0d-0fc8-49ef-8b41-8273834de3e3,184d20f3-d83f-4a01-a04b-a9ae59411a68,6104f76b-348d-4662-b8af-ede11c9fee56,b90fe860-438e-4734-93e2-54c4fd99ca6d,3516a046-3eef-4af9-9061-f90d3357cb25}	f49d86cc-1d15-4364-a67c-54876f358360
d6e79542-fff2-436c-a941-87fd0236d936	MESM6	Short	Win	2026-04-23T23:56:31	3	7171.25	7165	5.46	7177.75	7172	7160.25	d34270bb-bc64-4796-b23e-c5afded38ea1	\N	2026-04-24T00:11:02	https://s3.tradingview.com/snapshots/9/9YRVrC4G.png	\N	{f4b9bcb3-ea3d-459a-aedc-8f00bd1cf4f1,30c0ce7e-48dc-455f-8e3c-b35f70ea377e,ca77752e-f6c3-4bd6-bd86-c53234980f57,c4f74a70-c7aa-4ccd-882f-452a6f53a069,d5abea44-d155-4bd6-b9ae-f32155c1f53e,e645e271-35dd-4256-8e77-29f831fa669e,72d1f4c8-d80a-4408-8ac0-1f1795ef18f2}	{75de6e0d-0fc8-49ef-8b41-8273834de3e3,a5b67e0d-2865-4c24-99ea-1b7feda1c212,6104f76b-348d-4662-b8af-ede11c9fee56,b36680de-9bc2-4f95-9eaa-ef9c429231b7,b90fe860-438e-4734-93e2-54c4fd99ca6d,7ae2b1c6-405e-40f0-b110-3ca9128a80c7,78dbbf68-7cc6-4c81-839a-5c025bc972d2,4fb1e3f4-e960-4ffb-a203-8dcb1394c2c2}	f49d86cc-1d15-4364-a67c-54876f358360
01d50e4a-6e06-48b4-9077-505d03a3b621	MESM6	Short	Loss	2026-04-30T22:41:30	2	7173	7181.25	3.64	7181.25	7181.25	7171.75	d34270bb-bc64-4796-b23e-c5afded38ea1	\N	2026-04-30T22:46:22	https://s3.tradingview.com/snapshots/w/WoLLcoXx.png	\N	{f4b9bcb3-ea3d-459a-aedc-8f00bd1cf4f1,30c0ce7e-48dc-455f-8e3c-b35f70ea377e,ca77752e-f6c3-4bd6-bd86-c53234980f57,c4f74a70-c7aa-4ccd-882f-452a6f53a069,89a826a7-c03b-4878-afdc-379478d57a8e}	{75de6e0d-0fc8-49ef-8b41-8273834de3e3,184d20f3-d83f-4a01-a04b-a9ae59411a68,b90fe860-438e-4734-93e2-54c4fd99ca6d,7ae2b1c6-405e-40f0-b110-3ca9128a80c7,63acc3fb-eece-44f9-a459-9f829ae00e1c}	f49d86cc-1d15-4364-a67c-54876f358360
d9a2fbf1-6a8a-4376-ad57-2cd013f0a28e	MESM6	Short	Small Win	2026-04-24T00:13:43	4	7166.75	7164	7.28	7172.25	7168.25	7161.25	d34270bb-bc64-4796-b23e-c5afded38ea1	\N	2026-04-24T00:25:16	https://s3.tradingview.com/snapshots/9/98XaPyS6.png	\N	{f4b9bcb3-ea3d-459a-aedc-8f00bd1cf4f1,30c0ce7e-48dc-455f-8e3c-b35f70ea377e,ca77752e-f6c3-4bd6-bd86-c53234980f57,c4f74a70-c7aa-4ccd-882f-452a6f53a069,e645e271-35dd-4256-8e77-29f831fa669e,33b3a6cf-cd92-4753-98db-a15ff12aa382,d5abea44-d155-4bd6-b9ae-f32155c1f53e}	{75de6e0d-0fc8-49ef-8b41-8273834de3e3,6104f76b-348d-4662-b8af-ede11c9fee56,b36680de-9bc2-4f95-9eaa-ef9c429231b7,b90fe860-438e-4734-93e2-54c4fd99ca6d,3516a046-3eef-4af9-9061-f90d3357cb25,09695f82-1733-40d6-a6d1-f225b38e7320,c21a1f6c-45ac-4d35-96d9-3d8c72333304}	f49d86cc-1d15-4364-a67c-54876f358360
184dbc10-e9c8-48c4-a68b-2042110209a9	MESM6	Long	Win	2026-05-01T00:02:27	3	7194.5	7201	5.46	7187.75	7201	7194.5	d34270bb-bc64-4796-b23e-c5afded38ea1	\N	2026-05-01T00:05:58	https://s3.tradingview.com/snapshots/d/DxKqq8Na.png	\N	{f4b9bcb3-ea3d-459a-aedc-8f00bd1cf4f1,30c0ce7e-48dc-455f-8e3c-b35f70ea377e,ca77752e-f6c3-4bd6-bd86-c53234980f57,c4f74a70-c7aa-4ccd-882f-452a6f53a069}	{75de6e0d-0fc8-49ef-8b41-8273834de3e3,a5b67e0d-2865-4c24-99ea-1b7feda1c212,6104f76b-348d-4662-b8af-ede11c9fee56,b36680de-9bc2-4f95-9eaa-ef9c429231b7,b90fe860-438e-4734-93e2-54c4fd99ca6d,3516a046-3eef-4af9-9061-f90d3357cb25,78dbbf68-7cc6-4c81-839a-5c025bc972d2}	f49d86cc-1d15-4364-a67c-54876f358360
edc0812e-3a1f-4355-93c6-3fe482f2da08	MESM6	Short	Loss	2026-04-24T01:53:25	1	7112.75	7133.75	1.82	7133.75	7133.75	7105.5	d34270bb-bc64-4796-b23e-c5afded38ea1	\N	2026-04-24T02:01:54	https://s3.tradingview.com/snapshots/e/eDviqyAL.png	\N	{f4b9bcb3-ea3d-459a-aedc-8f00bd1cf4f1,30c0ce7e-48dc-455f-8e3c-b35f70ea377e,ca77752e-f6c3-4bd6-bd86-c53234980f57,c4f74a70-c7aa-4ccd-882f-452a6f53a069}	{75de6e0d-0fc8-49ef-8b41-8273834de3e3,6104f76b-348d-4662-b8af-ede11c9fee56,b36680de-9bc2-4f95-9eaa-ef9c429231b7,b90fe860-438e-4734-93e2-54c4fd99ca6d,3516a046-3eef-4af9-9061-f90d3357cb25,09695f82-1733-40d6-a6d1-f225b38e7320}	f49d86cc-1d15-4364-a67c-54876f358360
f643b8f3-3574-4abc-9c67-fd7d74190a37	MESM6	Short	Win	2026-05-01T00:35:22	5	7203.5	7195	9.1	7207.75	7206	7194.25	2cb8065c-93b2-46cd-832e-5cf66428b7ec	\N	2026-05-01T00:55:32	https://s3.tradingview.com/snapshots/l/lFkPQKv8.png	\N	{f4b9bcb3-ea3d-459a-aedc-8f00bd1cf4f1,30c0ce7e-48dc-455f-8e3c-b35f70ea377e,ca77752e-f6c3-4bd6-bd86-c53234980f57,c4f74a70-c7aa-4ccd-882f-452a6f53a069,71e3e576-db76-4e73-9b1f-d5b935905da1}	{78722eed-20e3-4358-99ac-fe8c3fe83847,65110cd8-07d1-46c2-bca0-6f4acb684bf8,e3b605f2-2914-47b2-b15f-b55459af6bd6,997bfb97-c842-48db-ae05-76724847b839,535ecc51-e3f2-4da1-b84c-81c40add124a,bb502c29-6df2-4414-977b-924267351e37}	f49d86cc-1d15-4364-a67c-54876f358360
eeb00cc9-f593-4ff1-9d9a-233c57b3f3ab	MESM6	Short	Small Win	2026-04-24T21:40:30	3	7159.75	7156.375	5.46	7166.75	7160.75	7152.25	d34270bb-bc64-4796-b23e-c5afded38ea1	\N	2026-04-24T21:50:05	https://s3.tradingview.com/snapshots/g/Gq6PXjlq.png	\N	{f4b9bcb3-ea3d-459a-aedc-8f00bd1cf4f1,30c0ce7e-48dc-455f-8e3c-b35f70ea377e,ca77752e-f6c3-4bd6-bd86-c53234980f57,c4f74a70-c7aa-4ccd-882f-452a6f53a069,e645e271-35dd-4256-8e77-29f831fa669e,d5abea44-d155-4bd6-b9ae-f32155c1f53e}	{cac64e4f-8da6-4ba3-9b36-615fb9a8063b,566adc58-bc6f-4957-811b-01075ec805ed,7ae2b1c6-405e-40f0-b110-3ca9128a80c7,78dbbf68-7cc6-4c81-839a-5c025bc972d2,c21a1f6c-45ac-4d35-96d9-3d8c72333304}	f49d86cc-1d15-4364-a67c-54876f358360
ec76d49b-60fd-4d70-bdcf-c7091287ae22	MESM6	Short	Loss	2026-05-01T23:12:19	4	7280	7285.5	7.28	7285.5	7285.5	7278.5	d34270bb-bc64-4796-b23e-c5afded38ea1	\N	2026-05-01T23:30:08	https://s3.tradingview.com/snapshots/r/rU0xRrvQ.png	\N	{f4b9bcb3-ea3d-459a-aedc-8f00bd1cf4f1,30c0ce7e-48dc-455f-8e3c-b35f70ea377e,ca77752e-f6c3-4bd6-bd86-c53234980f57,c4f74a70-c7aa-4ccd-882f-452a6f53a069,89a826a7-c03b-4878-afdc-379478d57a8e}	{75de6e0d-0fc8-49ef-8b41-8273834de3e3,a5b67e0d-2865-4c24-99ea-1b7feda1c212,b36680de-9bc2-4f95-9eaa-ef9c429231b7,b90fe860-438e-4734-93e2-54c4fd99ca6d,3516a046-3eef-4af9-9061-f90d3357cb25,63acc3fb-eece-44f9-a459-9f829ae00e1c}	f49d86cc-1d15-4364-a67c-54876f358360
93e53635-b076-4bfa-8f51-7ad2de0a0e52	MESM6	Long	Loss	2026-04-24T21:52:52	6	7156	7152.25	10.92	7152.25	7156	7152.25	d34270bb-bc64-4796-b23e-c5afded38ea1	\N	2026-04-24T21:54:12	https://s3.tradingview.com/snapshots/h/HCKfnaUo.png	\N	{f4b9bcb3-ea3d-459a-aedc-8f00bd1cf4f1,30c0ce7e-48dc-455f-8e3c-b35f70ea377e,ca77752e-f6c3-4bd6-bd86-c53234980f57,c4f74a70-c7aa-4ccd-882f-452a6f53a069}	{cac64e4f-8da6-4ba3-9b36-615fb9a8063b,184d20f3-d83f-4a01-a04b-a9ae59411a68,6104f76b-348d-4662-b8af-ede11c9fee56,3516a046-3eef-4af9-9061-f90d3357cb25,63acc3fb-eece-44f9-a459-9f829ae00e1c}	f49d86cc-1d15-4364-a67c-54876f358360
408c0f8d-7078-421b-971d-79f727a3aa0b	MESM6	Long	Loss	2026-05-01T23:50:30	5	7288.25	7283.75	9.1	7284.25	7288.25	7283.75	d34270bb-bc64-4796-b23e-c5afded38ea1	\N	2026-05-01T23:50:33	https://s3.tradingview.com/snapshots/e/eQndFogh.png	\N	{f4b9bcb3-ea3d-459a-aedc-8f00bd1cf4f1,30c0ce7e-48dc-455f-8e3c-b35f70ea377e,ca77752e-f6c3-4bd6-bd86-c53234980f57,c4f74a70-c7aa-4ccd-882f-452a6f53a069,89a826a7-c03b-4878-afdc-379478d57a8e}	{75de6e0d-0fc8-49ef-8b41-8273834de3e3,a5b67e0d-2865-4c24-99ea-1b7feda1c212,6104f76b-348d-4662-b8af-ede11c9fee56,b36680de-9bc2-4f95-9eaa-ef9c429231b7,b90fe860-438e-4734-93e2-54c4fd99ca6d,3516a046-3eef-4af9-9061-f90d3357cb25,63acc3fb-eece-44f9-a459-9f829ae00e1c}	f49d86cc-1d15-4364-a67c-54876f358360
a5d32baa-aef7-4df5-b703-ff7e07f488c3	MESM6	Long	Break Even	2026-04-24T22:04:35	4	7150.5	7150.5	7.28	7145	7155.5	7150.5	d34270bb-bc64-4796-b23e-c5afded38ea1	\N	2026-04-24T22:06:08	https://s3.tradingview.com/snapshots/d/DdCKkqt0.png	\N	{30c0ce7e-48dc-455f-8e3c-b35f70ea377e,ca77752e-f6c3-4bd6-bd86-c53234980f57,c4f74a70-c7aa-4ccd-882f-452a6f53a069,d5abea44-d155-4bd6-b9ae-f32155c1f53e,e645e271-35dd-4256-8e77-29f831fa669e,52038e79-409c-4fd2-919f-0da7e110d4e8}	{cac64e4f-8da6-4ba3-9b36-615fb9a8063b,184d20f3-d83f-4a01-a04b-a9ae59411a68,6104f76b-348d-4662-b8af-ede11c9fee56,aec3f6e1-cdbf-4f2c-b483-c3899ae9c30d,7ae2b1c6-405e-40f0-b110-3ca9128a80c7,78dbbf68-7cc6-4c81-839a-5c025bc972d2,4fb1e3f4-e960-4ffb-a203-8dcb1394c2c2}	f49d86cc-1d15-4364-a67c-54876f358360
959cbfa1-e869-411a-9d8e-c8f93aab1dbb	MESM6	Short	Win	2026-05-02T00:20:34	4	7281.25	7276.75	7.28	7286	7283.5	7271.25	d34270bb-bc64-4796-b23e-c5afded38ea1	\N	2026-05-02T00:23:43	https://s3.tradingview.com/snapshots/i/Iu38xKS3.png	\N	{f4b9bcb3-ea3d-459a-aedc-8f00bd1cf4f1,30c0ce7e-48dc-455f-8e3c-b35f70ea377e,ca77752e-f6c3-4bd6-bd86-c53234980f57,c4f74a70-c7aa-4ccd-882f-452a6f53a069}	{cac64e4f-8da6-4ba3-9b36-615fb9a8063b,a5b67e0d-2865-4c24-99ea-1b7feda1c212,6104f76b-348d-4662-b8af-ede11c9fee56,b36680de-9bc2-4f95-9eaa-ef9c429231b7,b90fe860-438e-4734-93e2-54c4fd99ca6d,3516a046-3eef-4af9-9061-f90d3357cb25,09695f82-1733-40d6-a6d1-f225b38e7320}	f49d86cc-1d15-4364-a67c-54876f358360
e770d3d6-0513-43a0-ae00-de1a7a503355	MESM6	Long	Win	2026-04-24T23:06:48	5	7168.25	7171.75	9.1	7164.5	7174.5	7167.5	d34270bb-bc64-4796-b23e-c5afded38ea1	\N	2026-04-24T23:14:16	https://s3.tradingview.com/snapshots/v/vwTSviWE.png	\N	{f4b9bcb3-ea3d-459a-aedc-8f00bd1cf4f1,30c0ce7e-48dc-455f-8e3c-b35f70ea377e,ca77752e-f6c3-4bd6-bd86-c53234980f57,c4f74a70-c7aa-4ccd-882f-452a6f53a069,e645e271-35dd-4256-8e77-29f831fa669e,9d707c94-1e83-4e63-bc16-86fa59cb5f50,d5abea44-d155-4bd6-b9ae-f32155c1f53e}	{75de6e0d-0fc8-49ef-8b41-8273834de3e3,a5b67e0d-2865-4c24-99ea-1b7feda1c212,6104f76b-348d-4662-b8af-ede11c9fee56,b36680de-9bc2-4f95-9eaa-ef9c429231b7,b90fe860-438e-4734-93e2-54c4fd99ca6d,3516a046-3eef-4af9-9061-f90d3357cb25,78dbbf68-7cc6-4c81-839a-5c025bc972d2,4fb1e3f4-e960-4ffb-a203-8dcb1394c2c2}	f49d86cc-1d15-4364-a67c-54876f358360
bd70d096-5de5-4554-8a8b-5e3d9b36fdb4	MESM6	Long	Small Loss	2026-04-24T23:28:08	6	7174	7173.75	10.92	7170.5	7176.75	7170.75	d34270bb-bc64-4796-b23e-c5afded38ea1	\N	2026-04-24T23:40:33	https://s3.tradingview.com/snapshots/4/4MmzrqDb.png	\N	{f4b9bcb3-ea3d-459a-aedc-8f00bd1cf4f1,30c0ce7e-48dc-455f-8e3c-b35f70ea377e,ca77752e-f6c3-4bd6-bd86-c53234980f57,c4f74a70-c7aa-4ccd-882f-452a6f53a069,d5abea44-d155-4bd6-b9ae-f32155c1f53e,bd572175-2b52-4894-8f59-93fcdf9dbeb7,9d707c94-1e83-4e63-bc16-86fa59cb5f50}	{cac64e4f-8da6-4ba3-9b36-615fb9a8063b,445c5267-1d08-4add-b1d9-d6de2dc8fac0,6104f76b-348d-4662-b8af-ede11c9fee56,b36680de-9bc2-4f95-9eaa-ef9c429231b7,b90fe860-438e-4734-93e2-54c4fd99ca6d,756f5cd7-727d-470e-a161-9496886cc3fb,09695f82-1733-40d6-a6d1-f225b38e7320}	f49d86cc-1d15-4364-a67c-54876f358360
59404336-ecfe-4ad6-b4ed-7bd8cbd52c90	MESM6	Long	Win	2026-04-24T23:46:32	2	7181.75	7190.875	3.64	7171.75	7196.5	7181.75	d34270bb-bc64-4796-b23e-c5afded38ea1	\N	2026-04-25T00:07:40	https://s3.tradingview.com/snapshots/w/Wndfid78.png	\N	{f4b9bcb3-ea3d-459a-aedc-8f00bd1cf4f1,30c0ce7e-48dc-455f-8e3c-b35f70ea377e,ca77752e-f6c3-4bd6-bd86-c53234980f57,c4f74a70-c7aa-4ccd-882f-452a6f53a069,e645e271-35dd-4256-8e77-29f831fa669e,d5abea44-d155-4bd6-b9ae-f32155c1f53e,33b3a6cf-cd92-4753-98db-a15ff12aa382,72d1f4c8-d80a-4408-8ac0-1f1795ef18f2}	{cac64e4f-8da6-4ba3-9b36-615fb9a8063b,a293aec7-f41e-4f2e-8bdc-a152c10d4c93,6104f76b-348d-4662-b8af-ede11c9fee56,b36680de-9bc2-4f95-9eaa-ef9c429231b7,b90fe860-438e-4734-93e2-54c4fd99ca6d,7ae2b1c6-405e-40f0-b110-3ca9128a80c7,78dbbf68-7cc6-4c81-839a-5c025bc972d2,4fb1e3f4-e960-4ffb-a203-8dcb1394c2c2}	f49d86cc-1d15-4364-a67c-54876f358360
9dd166f6-e97f-4757-bda2-c9114086e375	MESM6	Short	Small Win	2026-04-25T00:11:11	4	7192	7189.375	7.28	7197.5	7194.25	7185.75	d34270bb-bc64-4796-b23e-c5afded38ea1	\N	2026-04-25T00:25:04	https://s3.tradingview.com/snapshots/k/KQYfaVTg.png	\N	{f4b9bcb3-ea3d-459a-aedc-8f00bd1cf4f1,30c0ce7e-48dc-455f-8e3c-b35f70ea377e,ca77752e-f6c3-4bd6-bd86-c53234980f57,c4f74a70-c7aa-4ccd-882f-452a6f53a069,e645e271-35dd-4256-8e77-29f831fa669e,d5abea44-d155-4bd6-b9ae-f32155c1f53e,33b3a6cf-cd92-4753-98db-a15ff12aa382}	{cac64e4f-8da6-4ba3-9b36-615fb9a8063b,184d20f3-d83f-4a01-a04b-a9ae59411a68,445c5267-1d08-4add-b1d9-d6de2dc8fac0,aec3f6e1-cdbf-4f2c-b483-c3899ae9c30d,3516a046-3eef-4af9-9061-f90d3357cb25,78dbbf68-7cc6-4c81-839a-5c025bc972d2,c21a1f6c-45ac-4d35-96d9-3d8c72333304}	f49d86cc-1d15-4364-a67c-54876f358360
eee05cb5-ebe9-4fbe-96a0-ebfa2b7089b0	MESH6	Long	Small Win	2026-04-02T02:02:08.000Z	2	6605.75	6611.5	3.64	6601.5	6612	6604.75	d34270bb-bc64-4796-b23e-c5afded38ea1	\N	2026-04-02T01:02:10.000Z	https://s3.tradingview.com/snapshots/b/BdeDBrZ5.png	\N	{30c0ce7e-48dc-455f-8e3c-b35f70ea377e,ca77752e-f6c3-4bd6-bd86-c53234980f57,c4f74a70-c7aa-4ccd-882f-452a6f53a069}	{b9500cb7-24f6-4da3-ad24-abfa43c52213,78dbbf68-7cc6-4c81-839a-5c025bc972d2}	f49d86cc-1d15-4364-a67c-54876f358360
ff05958f-a273-4ce4-a3ab-3ff7b96e283a	MESM6	Long	Win	2026-04-24T23:20:03	6	7171	7174.5	5.46	7167.5	7177.25	7170.5	d34270bb-bc64-4796-b23e-c5afded38ea1	\N	2026-04-24T23:25:35.000Z	https://s3.tradingview.com/snapshots/r/rF0PHZ74.png	\N	{f4b9bcb3-ea3d-459a-aedc-8f00bd1cf4f1,30c0ce7e-48dc-455f-8e3c-b35f70ea377e,ca77752e-f6c3-4bd6-bd86-c53234980f57,c4f74a70-c7aa-4ccd-882f-452a6f53a069,d5abea44-d155-4bd6-b9ae-f32155c1f53e,021d2a71-2007-46a9-bba8-7e44336c8503,e645e271-35dd-4256-8e77-29f831fa669e}	{75de6e0d-0fc8-49ef-8b41-8273834de3e3,a5b67e0d-2865-4c24-99ea-1b7feda1c212,6104f76b-348d-4662-b8af-ede11c9fee56,b36680de-9bc2-4f95-9eaa-ef9c429231b7,b90fe860-438e-4734-93e2-54c4fd99ca6d,756f5cd7-727d-470e-a161-9496886cc3fb,78dbbf68-7cc6-4c81-839a-5c025bc972d2,4fb1e3f4-e960-4ffb-a203-8dcb1394c2c2}	f49d86cc-1d15-4364-a67c-54876f358360
2d12f798-7993-4320-8516-8bab5c6f6986	MESM6	Long	Loss	2026-04-25T01:06:24	3	7189	7184.25	5.46	7184.25	7192	7184.25	d34270bb-bc64-4796-b23e-c5afded38ea1	\N	2026-04-25T01:21:21	https://s3.tradingview.com/snapshots/k/KgAzYaDh.png	\N	{f4b9bcb3-ea3d-459a-aedc-8f00bd1cf4f1,30c0ce7e-48dc-455f-8e3c-b35f70ea377e,ca77752e-f6c3-4bd6-bd86-c53234980f57,c4f74a70-c7aa-4ccd-882f-452a6f53a069,8b7c1888-da0e-42a4-9762-6be2922cd0c7,e645e271-35dd-4256-8e77-29f831fa669e}	{75de6e0d-0fc8-49ef-8b41-8273834de3e3,6104f76b-348d-4662-b8af-ede11c9fee56,b36680de-9bc2-4f95-9eaa-ef9c429231b7,b90fe860-438e-4734-93e2-54c4fd99ca6d,7ae2b1c6-405e-40f0-b110-3ca9128a80c7,09695f82-1733-40d6-a6d1-f225b38e7320}	f49d86cc-1d15-4364-a67c-54876f358360
a0f5caf7-068a-4b33-a0bf-defbc7f9335c	MESM6	Long	Win	2026-04-25T01:25:12	4	7187.5	7197.5	7.28	7182.5	7200.5	7183	2cb8065c-93b2-46cd-832e-5cf66428b7ec	\N	2026-04-25T01:54:43	https://s3.tradingview.com/snapshots/8/8WLc8vpL.png	\N	{f4b9bcb3-ea3d-459a-aedc-8f00bd1cf4f1,30c0ce7e-48dc-455f-8e3c-b35f70ea377e,ca77752e-f6c3-4bd6-bd86-c53234980f57,c4f74a70-c7aa-4ccd-882f-452a6f53a069,d5abea44-d155-4bd6-b9ae-f32155c1f53e,e645e271-35dd-4256-8e77-29f831fa669e}	{78722eed-20e3-4358-99ac-fe8c3fe83847,65110cd8-07d1-46c2-bca0-6f4acb684bf8,997bfb97-c842-48db-ae05-76724847b839,535ecc51-e3f2-4da1-b84c-81c40add124a,bb502c29-6df2-4414-977b-924267351e37,58aa4bdf-10f2-4815-ac21-eb00be5e01be,8deab7ab-f093-40a0-94d6-b3073ccfd82f}	f49d86cc-1d15-4364-a67c-54876f358360
057fb178-d330-4a65-953f-ae1e102ad7a7	MES	Short	Win	2026-03-05T10:50:00.000Z	1	6843.75	6823	0	6864.5	6847.25	6823	d34270bb-bc64-4796-b23e-c5afded38ea1	\N	2026-03-05T11:05:00.000Z	https://www.tradingview.com/x/YQ33oWUs/	\N	{ca77752e-f6c3-4bd6-bd86-c53234980f57,30c0ce7e-48dc-455f-8e3c-b35f70ea377e,c4f74a70-c7aa-4ccd-882f-452a6f53a069}	{7361d61a-3859-4599-ad6d-047e1ba050ac,6104f76b-348d-4662-b8af-ede11c9fee56,b90fe860-438e-4734-93e2-54c4fd99ca6d,b36680de-9bc2-4f95-9eaa-ef9c429231b7,78dbbf68-7cc6-4c81-839a-5c025bc972d2,4fb1e3f4-e960-4ffb-a203-8dcb1394c2c2}	f49d86cc-1d15-4364-a67c-54876f358360
1c65441c-1540-447d-b565-61c961df0faf	MES	Short	Break Even	2026-03-05T11:30:00.000Z	1	6829	6829	0	6845.5	6831	6820.5	d34270bb-bc64-4796-b23e-c5afded38ea1	\N	2026-03-05T11:35:00.000Z	https://www.tradingview.com/x/xQ8nJGSV/	\N	{021d2a71-2007-46a9-bba8-7e44336c8503,ca77752e-f6c3-4bd6-bd86-c53234980f57,30c0ce7e-48dc-455f-8e3c-b35f70ea377e,c4f74a70-c7aa-4ccd-882f-452a6f53a069}	{7361d61a-3859-4599-ad6d-047e1ba050ac,af6aaa15-cb7b-4ab0-b20f-97a19f1be2c0,6104f76b-348d-4662-b8af-ede11c9fee56,b90fe860-438e-4734-93e2-54c4fd99ca6d,78dbbf68-7cc6-4c81-839a-5c025bc972d2}	f49d86cc-1d15-4364-a67c-54876f358360
c7fbbc80-c534-4f6e-bdf2-b5fd50242278	MES	Short	Win	2026-03-05T12:35:00.000Z	2	6806.5	6788.5	0	6818.5	6807.5	6782.5	d34270bb-bc64-4796-b23e-c5afded38ea1	\N	2026-03-05T12:50:00.000Z	https://www.tradingview.com/x/C5jz7Lf8/	\N	{ca77752e-f6c3-4bd6-bd86-c53234980f57,30c0ce7e-48dc-455f-8e3c-b35f70ea377e,c4f74a70-c7aa-4ccd-882f-452a6f53a069}	{ff9b7896-5390-4dd8-ad58-6b2c0961225d,b90fe860-438e-4734-93e2-54c4fd99ca6d,6104f76b-348d-4662-b8af-ede11c9fee56,b36680de-9bc2-4f95-9eaa-ef9c429231b7,78dbbf68-7cc6-4c81-839a-5c025bc972d2,ba3d3695-8d42-43e1-a127-91ddbeca9080}	f49d86cc-1d15-4364-a67c-54876f358360
178cf90a-b2ed-49c7-9ae2-5a350759850f	MES	Short	Win	2026-03-05T13:10:00.000Z	2	6795.5	6785.5	0	6805.5	6803.5	6785.5	d34270bb-bc64-4796-b23e-c5afded38ea1	\N	2026-03-05T13:25:00.000Z	https://www.tradingview.com/x/ujuvRBRy/	\N	{ca77752e-f6c3-4bd6-bd86-c53234980f57,30c0ce7e-48dc-455f-8e3c-b35f70ea377e,c4f74a70-c7aa-4ccd-882f-452a6f53a069}	{ff9b7896-5390-4dd8-ad58-6b2c0961225d,b90fe860-438e-4734-93e2-54c4fd99ca6d,b36680de-9bc2-4f95-9eaa-ef9c429231b7,b9cd86b5-77d5-4aa6-a677-8b0eb8f7f924,63acc3fb-eece-44f9-a459-9f829ae00e1c,4fb1e3f4-e960-4ffb-a203-8dcb1394c2c2}	f49d86cc-1d15-4364-a67c-54876f358360
16a724b9-b873-4ad7-86c3-dd0a6702c01b	MES	Short	Loss	2026-03-06T10:55:00.000Z	2	6763.75	6774.75	0	6774.75	6774.75	6763.75	d34270bb-bc64-4796-b23e-c5afded38ea1	\N	2026-03-05T11:01:00.000Z	https://www.tradingview.com/x/PHZP16fl/	\N	{ca77752e-f6c3-4bd6-bd86-c53234980f57,30c0ce7e-48dc-455f-8e3c-b35f70ea377e,c4f74a70-c7aa-4ccd-882f-452a6f53a069}	{7361d61a-3859-4599-ad6d-047e1ba050ac,63acc3fb-eece-44f9-a459-9f829ae00e1c,6104f76b-348d-4662-b8af-ede11c9fee56}	f49d86cc-1d15-4364-a67c-54876f358360
ecb2efc4-6979-4dab-b6a3-0b786a8ce769	MES	Long	Win	2026-03-09T11:35:00.000Z	2	6704.75	6715.75	0	6693.5	6715.75	6701.5	d34270bb-bc64-4796-b23e-c5afded38ea1	\N	2026-03-09T11:55:00.000Z	https://www.tradingview.com/x/vDfJwyRe/	\N	{ca77752e-f6c3-4bd6-bd86-c53234980f57,30c0ce7e-48dc-455f-8e3c-b35f70ea377e,c4f74a70-c7aa-4ccd-882f-452a6f53a069}	{7361d61a-3859-4599-ad6d-047e1ba050ac,6104f76b-348d-4662-b8af-ede11c9fee56,b90fe860-438e-4734-93e2-54c4fd99ca6d,b36680de-9bc2-4f95-9eaa-ef9c429231b7,78dbbf68-7cc6-4c81-839a-5c025bc972d2,4fb1e3f4-e960-4ffb-a203-8dcb1394c2c2}	f49d86cc-1d15-4364-a67c-54876f358360
640efdd6-2747-4d38-a586-eb2ae83d9b31	MES	Long	Win	2026-03-09T12:30:00.000Z	2	6718.75	6727	0	6710.5	6727	6716.75	d34270bb-bc64-4796-b23e-c5afded38ea1	\N	2026-03-09T12:35:00.000Z	https://www.tradingview.com/x/wojRu0OK/	\N	{ca77752e-f6c3-4bd6-bd86-c53234980f57,30c0ce7e-48dc-455f-8e3c-b35f70ea377e,c4f74a70-c7aa-4ccd-882f-452a6f53a069}	{ff9b7896-5390-4dd8-ad58-6b2c0961225d,6104f76b-348d-4662-b8af-ede11c9fee56,b90fe860-438e-4734-93e2-54c4fd99ca6d,b36680de-9bc2-4f95-9eaa-ef9c429231b7,78dbbf68-7cc6-4c81-839a-5c025bc972d2,ba3d3695-8d42-43e1-a127-91ddbeca9080}	f49d86cc-1d15-4364-a67c-54876f358360
ddc82b5f-ac77-4b0e-bebb-25cae1acf31a	MES	Short	Win	2026-03-10T10:05:00.000Z	2	6784.5	6771.75	0	6793	6788	6767.5	d34270bb-bc64-4796-b23e-c5afded38ea1	\N	2026-03-10T10:09:00.000Z	https://www.tradingview.com/x/uRAbd0HW/	\N	{ca77752e-f6c3-4bd6-bd86-c53234980f57,30c0ce7e-48dc-455f-8e3c-b35f70ea377e,c4f74a70-c7aa-4ccd-882f-452a6f53a069}	{ff9b7896-5390-4dd8-ad58-6b2c0961225d,b36680de-9bc2-4f95-9eaa-ef9c429231b7,78dbbf68-7cc6-4c81-839a-5c025bc972d2,ba3d3695-8d42-43e1-a127-91ddbeca9080}	f49d86cc-1d15-4364-a67c-54876f358360
e4c2b290-485c-4242-ba26-063e034f58c1	MES	Long	Break Even	2026-03-10T11:30:00.000Z	3	6826.25	6826.25	0	6820	6828.5	6822.25	d34270bb-bc64-4796-b23e-c5afded38ea1	\N	2026-03-10T11:35:00.000Z	https://www.tradingview.com/x/TtW9URiC/	\N	{30c0ce7e-48dc-455f-8e3c-b35f70ea377e,c4f74a70-c7aa-4ccd-882f-452a6f53a069,ca77752e-f6c3-4bd6-bd86-c53234980f57,9d707c94-1e83-4e63-bc16-86fa59cb5f50}	{ff9b7896-5390-4dd8-ad58-6b2c0961225d,af6aaa15-cb7b-4ab0-b20f-97a19f1be2c0,6104f76b-348d-4662-b8af-ede11c9fee56,b90fe860-438e-4734-93e2-54c4fd99ca6d,63acc3fb-eece-44f9-a459-9f829ae00e1c,4fb1e3f4-e960-4ffb-a203-8dcb1394c2c2}	f49d86cc-1d15-4364-a67c-54876f358360
05395f08-2477-4739-b557-637abd2d4788	MES	Short	Win	2026-03-10T11:55:00.000Z	3	6831.5	6825.5	0	6837.5	6832.75	6825.5	d34270bb-bc64-4796-b23e-c5afded38ea1	\N	2026-03-10T11:59:00.000Z	https://www.tradingview.com/x/6zlaZPyS/	\N	{ca77752e-f6c3-4bd6-bd86-c53234980f57,30c0ce7e-48dc-455f-8e3c-b35f70ea377e,c4f74a70-c7aa-4ccd-882f-452a6f53a069}	{b9500cb7-24f6-4da3-ad24-abfa43c52213,b36680de-9bc2-4f95-9eaa-ef9c429231b7,78dbbf68-7cc6-4c81-839a-5c025bc972d2,ba3d3695-8d42-43e1-a127-91ddbeca9080}	f49d86cc-1d15-4364-a67c-54876f358360
59e2b17c-043d-49ba-b671-3c8932383337	MES	Long	Break Even	2026-03-11T10:10:00.000Z	2	6789.25	6789.25	0	6778.25	6799.25	6786.75	d34270bb-bc64-4796-b23e-c5afded38ea1	\N	2026-03-11T10:15:00.000Z	https://www.tradingview.com/x/LXz5kcMR/	\N	{c4f74a70-c7aa-4ccd-882f-452a6f53a069,30c0ce7e-48dc-455f-8e3c-b35f70ea377e,ca77752e-f6c3-4bd6-bd86-c53234980f57,021d2a71-2007-46a9-bba8-7e44336c8503}	{b9500cb7-24f6-4da3-ad24-abfa43c52213,b9cd86b5-77d5-4aa6-a677-8b0eb8f7f924,78dbbf68-7cc6-4c81-839a-5c025bc972d2}	f49d86cc-1d15-4364-a67c-54876f358360
cb1e55bf-d7ce-40b7-b4af-57b1bddf0604	MES	Long	Loss	2026-03-11T10:22:00.000Z	3	6791.75	6786	0	6786	6792.75	6786	d34270bb-bc64-4796-b23e-c5afded38ea1	\N	2026-03-11T10:23:00.000Z	https://www.tradingview.com/x/Tt5Waa3K/	\N	{ca77752e-f6c3-4bd6-bd86-c53234980f57,245c48fa-1f83-4a97-b19f-e448381a1ecf,c4f74a70-c7aa-4ccd-882f-452a6f53a069}	{b9500cb7-24f6-4da3-ad24-abfa43c52213,78dbbf68-7cc6-4c81-839a-5c025bc972d2}	f49d86cc-1d15-4364-a67c-54876f358360
a189a08f-3eb0-4b40-87fe-35d27c76f830	MES	Short	Loss	2026-03-11T10:35:00.000Z	1	6785.5	6799.5	0	6799.5	6799.5	6782	d34270bb-bc64-4796-b23e-c5afded38ea1	\N	2026-03-11T10:55:00.000Z	https://www.tradingview.com/x/L279hOFu/	\N	{ca77752e-f6c3-4bd6-bd86-c53234980f57,30c0ce7e-48dc-455f-8e3c-b35f70ea377e,c4f74a70-c7aa-4ccd-882f-452a6f53a069}	{7361d61a-3859-4599-ad6d-047e1ba050ac,6104f76b-348d-4662-b8af-ede11c9fee56,b90fe860-438e-4734-93e2-54c4fd99ca6d,b36680de-9bc2-4f95-9eaa-ef9c429231b7,78dbbf68-7cc6-4c81-839a-5c025bc972d2}	f49d86cc-1d15-4364-a67c-54876f358360
7d250ab8-3048-4c93-898a-f0488f9f6165	MES	Long	Loss	2026-03-11T11:10:00.000Z	1	6782.75	6768.25	0	6768.25	6782.75	6768.25	d34270bb-bc64-4796-b23e-c5afded38ea1	\N	2026-03-11T11:15:00.000Z	https://www.tradingview.com/x/GwPQDDCo/	\N	{ca77752e-f6c3-4bd6-bd86-c53234980f57,30c0ce7e-48dc-455f-8e3c-b35f70ea377e,c4f74a70-c7aa-4ccd-882f-452a6f53a069}	{b9500cb7-24f6-4da3-ad24-abfa43c52213,6104f76b-348d-4662-b8af-ede11c9fee56,63acc3fb-eece-44f9-a459-9f829ae00e1c}	f49d86cc-1d15-4364-a67c-54876f358360
d4049664-862a-4018-90f3-cfdfe49a7b9e	MES	Short	Small Win	2026-03-13T10:50:00.000Z	2	6685.25	6683.25	0	6694	6690	6678	d34270bb-bc64-4796-b23e-c5afded38ea1	\N	2026-03-13T10:53:00.000Z	https://www.tradingview.com/x/vJFhN7al/	\N	{9d707c94-1e83-4e63-bc16-86fa59cb5f50,ca77752e-f6c3-4bd6-bd86-c53234980f57,c4f74a70-c7aa-4ccd-882f-452a6f53a069,245c48fa-1f83-4a97-b19f-e448381a1ecf}	{7361d61a-3859-4599-ad6d-047e1ba050ac,6104f76b-348d-4662-b8af-ede11c9fee56,b90fe860-438e-4734-93e2-54c4fd99ca6d,b36680de-9bc2-4f95-9eaa-ef9c429231b7,af6aaa15-cb7b-4ab0-b20f-97a19f1be2c0,78dbbf68-7cc6-4c81-839a-5c025bc972d2,ba3d3695-8d42-43e1-a127-91ddbeca9080}	f49d86cc-1d15-4364-a67c-54876f358360
f2b0ca56-bc16-43f8-be51-489085b8948e	MES	Short	Break Even	2026-03-13T11:05:00.000Z	4	6665.5	6665.5	0	6671	6669	6662.25	d34270bb-bc64-4796-b23e-c5afded38ea1	\N	2026-03-13T11:07:00.000Z	https://www.tradingview.com/x/HrSMTBxZ/	\N	{c4f74a70-c7aa-4ccd-882f-452a6f53a069,245c48fa-1f83-4a97-b19f-e448381a1ecf,ca77752e-f6c3-4bd6-bd86-c53234980f57,021d2a71-2007-46a9-bba8-7e44336c8503}	{b9500cb7-24f6-4da3-ad24-abfa43c52213,6104f76b-348d-4662-b8af-ede11c9fee56,b90fe860-438e-4734-93e2-54c4fd99ca6d,b36680de-9bc2-4f95-9eaa-ef9c429231b7,78dbbf68-7cc6-4c81-839a-5c025bc972d2}	f49d86cc-1d15-4364-a67c-54876f358360
950850ad-3a7e-4222-a3c9-411d5bb88fc8	MES	Long	Loss	2026-03-13T11:18:00.000Z	3	6677	6671	0	6671	6678.75	6671	d34270bb-bc64-4796-b23e-c5afded38ea1	\N	2026-03-13T11:20:00.000Z	https://www.tradingview.com/x/WdEQBmy0/	\N	{ca77752e-f6c3-4bd6-bd86-c53234980f57,245c48fa-1f83-4a97-b19f-e448381a1ecf,c4f74a70-c7aa-4ccd-882f-452a6f53a069}	{7361d61a-3859-4599-ad6d-047e1ba050ac,6104f76b-348d-4662-b8af-ede11c9fee56,b36680de-9bc2-4f95-9eaa-ef9c429231b7,63acc3fb-eece-44f9-a459-9f829ae00e1c}	f49d86cc-1d15-4364-a67c-54876f358360
b1c4064e-02f7-4823-80b5-927bcf770ef8	MES	Short	Break Even	2026-03-13T11:23:00.000Z	4	6674.25	6674.25	0	6678.75	6674.25	6671.25	d34270bb-bc64-4796-b23e-c5afded38ea1	\N	2026-03-13T11:24:00.000Z	https://www.tradingview.com/x/2FqiTKYH/	\N	{ca77752e-f6c3-4bd6-bd86-c53234980f57,245c48fa-1f83-4a97-b19f-e448381a1ecf,c4f74a70-c7aa-4ccd-882f-452a6f53a069,9d707c94-1e83-4e63-bc16-86fa59cb5f50}	{b9500cb7-24f6-4da3-ad24-abfa43c52213,6104f76b-348d-4662-b8af-ede11c9fee56,b36680de-9bc2-4f95-9eaa-ef9c429231b7,b9cd86b5-77d5-4aa6-a677-8b0eb8f7f924,63acc3fb-eece-44f9-a459-9f829ae00e1c,ba3d3695-8d42-43e1-a127-91ddbeca9080}	f49d86cc-1d15-4364-a67c-54876f358360
3a99efdd-029e-47f4-be71-0d811c846d73	MES	Long	Loss	2026-03-13T11:35:00.000Z	4	6662.25	6657	0	6657	6662.25	6657	d34270bb-bc64-4796-b23e-c5afded38ea1	\N	2026-03-13T11:36:00.000Z	https://www.tradingview.com/x/hMjEeBVK/	\N	{ca77752e-f6c3-4bd6-bd86-c53234980f57,245c48fa-1f83-4a97-b19f-e448381a1ecf,c4f74a70-c7aa-4ccd-882f-452a6f53a069}	{ff9b7896-5390-4dd8-ad58-6b2c0961225d,b9cd86b5-77d5-4aa6-a677-8b0eb8f7f924,63acc3fb-eece-44f9-a459-9f829ae00e1c}	f49d86cc-1d15-4364-a67c-54876f358360
f0578cb6-51a7-4bb6-9837-979b218ac60d	MES	Short	Win	2026-03-13T11:38:00.000Z	3	6660.25	6653.5	0	6667.25	6663.75	6651.25	d34270bb-bc64-4796-b23e-c5afded38ea1	\N	2026-03-13T11:42:00.000Z	https://www.tradingview.com/x/BGNZAkb8/	\N	{ca77752e-f6c3-4bd6-bd86-c53234980f57,9d707c94-1e83-4e63-bc16-86fa59cb5f50,245c48fa-1f83-4a97-b19f-e448381a1ecf,c4f74a70-c7aa-4ccd-882f-452a6f53a069}	{ff9b7896-5390-4dd8-ad58-6b2c0961225d,6104f76b-348d-4662-b8af-ede11c9fee56,b90fe860-438e-4734-93e2-54c4fd99ca6d,b36680de-9bc2-4f95-9eaa-ef9c429231b7,b9cd86b5-77d5-4aa6-a677-8b0eb8f7f924,63acc3fb-eece-44f9-a459-9f829ae00e1c,ba3d3695-8d42-43e1-a127-91ddbeca9080}	f49d86cc-1d15-4364-a67c-54876f358360
b90f8719-9e11-4f74-a8c4-e7baf050f921	MES	Short	Loss	2026-03-13T11:47:00.000Z	2	6655.5	6663.75	0	6663.75	6663.75	6655.5	d34270bb-bc64-4796-b23e-c5afded38ea1	\N	2026-03-13T11:48:00.000Z	https://www.tradingview.com/x/OFhrwMtB/	\N	{ca77752e-f6c3-4bd6-bd86-c53234980f57,245c48fa-1f83-4a97-b19f-e448381a1ecf,c4f74a70-c7aa-4ccd-882f-452a6f53a069}	{7361d61a-3859-4599-ad6d-047e1ba050ac,6104f76b-348d-4662-b8af-ede11c9fee56,b90fe860-438e-4734-93e2-54c4fd99ca6d,b36680de-9bc2-4f95-9eaa-ef9c429231b7,63acc3fb-eece-44f9-a459-9f829ae00e1c}	f49d86cc-1d15-4364-a67c-54876f358360
367968bf-25a1-4ba1-9514-c0a7f77ba71f	MES	Long	Small Loss	2026-03-13T11:49:00.000Z	2	6656.5	6652.75	0	6646.75	6659	6647	d34270bb-bc64-4796-b23e-c5afded38ea1	\N	2026-03-13T11:54:00.000Z	https://www.tradingview.com/x/hAa7ET9V/	\N	{ca77752e-f6c3-4bd6-bd86-c53234980f57,245c48fa-1f83-4a97-b19f-e448381a1ecf,c4f74a70-c7aa-4ccd-882f-452a6f53a069,021d2a71-2007-46a9-bba8-7e44336c8503}	{ff9b7896-5390-4dd8-ad58-6b2c0961225d,b9cd86b5-77d5-4aa6-a677-8b0eb8f7f924,63acc3fb-eece-44f9-a459-9f829ae00e1c}	f49d86cc-1d15-4364-a67c-54876f358360
9a4f5c73-665d-4423-b599-1931feac2a85	MES	Short	Break Even	2026-03-13T11:54:00.000Z	3	6652.5	6652.5	0	6658.5	6653.25	6647.5	d34270bb-bc64-4796-b23e-c5afded38ea1	\N	2026-03-13T11:56:00.000Z	https://www.tradingview.com/x/AtS5jn0u/	\N	{9d707c94-1e83-4e63-bc16-86fa59cb5f50,ca77752e-f6c3-4bd6-bd86-c53234980f57,245c48fa-1f83-4a97-b19f-e448381a1ecf,c4f74a70-c7aa-4ccd-882f-452a6f53a069}	{7361d61a-3859-4599-ad6d-047e1ba050ac,6104f76b-348d-4662-b8af-ede11c9fee56,b90fe860-438e-4734-93e2-54c4fd99ca6d,b36680de-9bc2-4f95-9eaa-ef9c429231b7,63acc3fb-eece-44f9-a459-9f829ae00e1c,4fb1e3f4-e960-4ffb-a203-8dcb1394c2c2}	f49d86cc-1d15-4364-a67c-54876f358360
3b538321-6921-4ef5-8e58-4bdd8f3e7ba1	MES	Long	Small Win	2026-03-13T12:03:00.000Z	3	6650.5	6653.5	0	6644.5	6656.5	6649	d34270bb-bc64-4796-b23e-c5afded38ea1	\N	2026-03-13T12:04:00.000Z	https://www.tradingview.com/x/SGi0MWbJ/	\N	{ca77752e-f6c3-4bd6-bd86-c53234980f57,245c48fa-1f83-4a97-b19f-e448381a1ecf,c4f74a70-c7aa-4ccd-882f-452a6f53a069}	{7361d61a-3859-4599-ad6d-047e1ba050ac,6104f76b-348d-4662-b8af-ede11c9fee56,b36680de-9bc2-4f95-9eaa-ef9c429231b7,b9cd86b5-77d5-4aa6-a677-8b0eb8f7f924,63acc3fb-eece-44f9-a459-9f829ae00e1c,4fb1e3f4-e960-4ffb-a203-8dcb1394c2c2}	f49d86cc-1d15-4364-a67c-54876f358360
a8aee841-ccff-4b8a-9778-7d3156420956	MES	Short	Break Even	2026-03-13T12:39:00.000Z	2	6662.25	6662.25	0	6667.75	6662.25	6655.5	2cb8065c-93b2-46cd-832e-5cf66428b7ec	\N	2026-03-13T12:42:00.000Z	https://www.tradingview.com/x/0kI7FVqS/	\N	{9d707c94-1e83-4e63-bc16-86fa59cb5f50,ca77752e-f6c3-4bd6-bd86-c53234980f57,245c48fa-1f83-4a97-b19f-e448381a1ecf,c4f74a70-c7aa-4ccd-882f-452a6f53a069}	{78722eed-20e3-4358-99ac-fe8c3fe83847,65110cd8-07d1-46c2-bca0-6f4acb684bf8,535ecc51-e3f2-4da1-b84c-81c40add124a,aff914a8-e9f5-4ce7-b2c6-72a415f7f2d2,829fe593-4289-4a77-bc7f-7e6f9110833c}	f49d86cc-1d15-4364-a67c-54876f358360
37dbbeb5-8def-4dd5-af30-4c35bcca0faf	MES	Long	Break Even	2026-03-13T12:35:00.000Z	3	6656	6656	0	6650	6660.5	6654.5	d34270bb-bc64-4796-b23e-c5afded38ea1	\N	2026-03-13T12:36:00.000Z	https://www.tradingview.com/x/2Uh55u08/	\N	{9d707c94-1e83-4e63-bc16-86fa59cb5f50,ca77752e-f6c3-4bd6-bd86-c53234980f57,245c48fa-1f83-4a97-b19f-e448381a1ecf,c4f74a70-c7aa-4ccd-882f-452a6f53a069}	{7361d61a-3859-4599-ad6d-047e1ba050ac,6104f76b-348d-4662-b8af-ede11c9fee56,b90fe860-438e-4734-93e2-54c4fd99ca6d,b36680de-9bc2-4f95-9eaa-ef9c429231b7,63acc3fb-eece-44f9-a459-9f829ae00e1c,4fb1e3f4-e960-4ffb-a203-8dcb1394c2c2}	f49d86cc-1d15-4364-a67c-54876f358360
e1a265da-6fcc-49fd-977c-739abf207808	MES	Long	Loss	2026-03-13T13:18:00.000Z	4	6660.75	6656	0	6656	6661.5	6656	d34270bb-bc64-4796-b23e-c5afded38ea1	\N	2026-03-13T13:19:00.000Z	https://www.tradingview.com/x/i3I2DQZK/	\N	{ca77752e-f6c3-4bd6-bd86-c53234980f57,245c48fa-1f83-4a97-b19f-e448381a1ecf,c4f74a70-c7aa-4ccd-882f-452a6f53a069}	{7361d61a-3859-4599-ad6d-047e1ba050ac,b90fe860-438e-4734-93e2-54c4fd99ca6d,b36680de-9bc2-4f95-9eaa-ef9c429231b7,b9cd86b5-77d5-4aa6-a677-8b0eb8f7f924,63acc3fb-eece-44f9-a459-9f829ae00e1c}	f49d86cc-1d15-4364-a67c-54876f358360
c663e4b0-b716-4868-955c-b5a74f1993e0	MES	Short	Win	2026-03-13T13:20:00.000Z	4	6660.5	6655.75	0	6665.25	6662.25	6651.75	d34270bb-bc64-4796-b23e-c5afded38ea1	\N	2026-03-13T13:23:00.000Z	https://www.tradingview.com/x/hANL5Kve/	\N	{ca77752e-f6c3-4bd6-bd86-c53234980f57,245c48fa-1f83-4a97-b19f-e448381a1ecf,c4f74a70-c7aa-4ccd-882f-452a6f53a069}	{b9500cb7-24f6-4da3-ad24-abfa43c52213,63acc3fb-eece-44f9-a459-9f829ae00e1c,4fb1e3f4-e960-4ffb-a203-8dcb1394c2c2}	f49d86cc-1d15-4364-a67c-54876f358360
07930f5e-f0fe-4a96-bdb4-7605648cbb49	MES	Short	Break Even	2026-03-13T13:25:00.000Z	4	6656.75	6656.75	0	6662.25	6657.75	6652.25	d34270bb-bc64-4796-b23e-c5afded38ea1	\N	2026-03-13T13:28:00.000Z	https://www.tradingview.com/x/FNMKQcwo/	\N	{ca77752e-f6c3-4bd6-bd86-c53234980f57,245c48fa-1f83-4a97-b19f-e448381a1ecf,c4f74a70-c7aa-4ccd-882f-452a6f53a069,33b3a6cf-cd92-4753-98db-a15ff12aa382}	{b9500cb7-24f6-4da3-ad24-abfa43c52213,6104f76b-348d-4662-b8af-ede11c9fee56,b9cd86b5-77d5-4aa6-a677-8b0eb8f7f924,63acc3fb-eece-44f9-a459-9f829ae00e1c}	f49d86cc-1d15-4364-a67c-54876f358360
89f43604-5edb-4313-9d87-1696afcc63fc	MES	Long	Break Even	2026-03-16T11:05:00.000Z	2	6700.5	6700.5	0	6689	6707	6699.5	d34270bb-bc64-4796-b23e-c5afded38ea1	\N	2026-03-16T11:10:00.000Z	https://www.tradingview.com/x/OWrNEe3w/	\N	{c4f74a70-c7aa-4ccd-882f-452a6f53a069,ca77752e-f6c3-4bd6-bd86-c53234980f57,30c0ce7e-48dc-455f-8e3c-b35f70ea377e,9d707c94-1e83-4e63-bc16-86fa59cb5f50}	{ff9b7896-5390-4dd8-ad58-6b2c0961225d,6104f76b-348d-4662-b8af-ede11c9fee56,b90fe860-438e-4734-93e2-54c4fd99ca6d,78dbbf68-7cc6-4c81-839a-5c025bc972d2}	f49d86cc-1d15-4364-a67c-54876f358360
8dd4bebd-ca70-46b2-bf6d-1988b241d421	MES	Long	Loss	2026-03-16T11:50:00.000Z	2	6710	6699.5	0	6699.5	6710	6699.5	d34270bb-bc64-4796-b23e-c5afded38ea1	\N	2026-03-16T11:55:00.000Z	https://www.tradingview.com/x/HhKMKcMC/	\N	{ca77752e-f6c3-4bd6-bd86-c53234980f57,30c0ce7e-48dc-455f-8e3c-b35f70ea377e,c4f74a70-c7aa-4ccd-882f-452a6f53a069}	{7361d61a-3859-4599-ad6d-047e1ba050ac,6104f76b-348d-4662-b8af-ede11c9fee56,b90fe860-438e-4734-93e2-54c4fd99ca6d,b36680de-9bc2-4f95-9eaa-ef9c429231b7,63acc3fb-eece-44f9-a459-9f829ae00e1c}	f49d86cc-1d15-4364-a67c-54876f358360
72792ee8-990b-4007-b67a-f531d8167d22	MES	Long	Small Win	2026-03-16T12:20:00.000Z	2	6691.25	6703	0	6679.5	6710	6684.5	253560c5-466e-4f89-b68f-ccd93a6a325a	\N	2026-03-16T13:15:00.000Z	https://www.tradingview.com/x/8IBAZW63/	\N	{c4f74a70-c7aa-4ccd-882f-452a6f53a069,ca77752e-f6c3-4bd6-bd86-c53234980f57,30c0ce7e-48dc-455f-8e3c-b35f70ea377e,72d1f4c8-d80a-4408-8ac0-1f1795ef18f2}	{68570754-2236-42b0-b7ef-ae93d4f46659,b17d0aca-5a44-4f58-b2e3-2e6cc1790b1a}	f49d86cc-1d15-4364-a67c-54876f358360
d362c233-80cd-4a49-942a-89bfd6038f4a	MES	Short	Win	2026-03-16T13:32:00.000Z	6	6708	6704.75	0	6711.25	6709.25	6702	d34270bb-bc64-4796-b23e-c5afded38ea1	\N	2026-03-16T13:34:00.000Z	https://www.tradingview.com/x/VBHLfYOg/	\N	{ca77752e-f6c3-4bd6-bd86-c53234980f57,30c0ce7e-48dc-455f-8e3c-b35f70ea377e,c4f74a70-c7aa-4ccd-882f-452a6f53a069,9d707c94-1e83-4e63-bc16-86fa59cb5f50}	{ff9b7896-5390-4dd8-ad58-6b2c0961225d,b36680de-9bc2-4f95-9eaa-ef9c429231b7,b9cd86b5-77d5-4aa6-a677-8b0eb8f7f924,78dbbf68-7cc6-4c81-839a-5c025bc972d2,4fb1e3f4-e960-4ffb-a203-8dcb1394c2c2}	f49d86cc-1d15-4364-a67c-54876f358360
5e057b5e-84cd-487f-9593-d6f80be153da	MES	Short	Win	2026-03-18T12:55:00.000Z	3	6732	6725.25	0	6738.75	6735.25	6719.75	d34270bb-bc64-4796-b23e-c5afded38ea1	\N	2026-03-18T13:00:00.000Z	https://www.tradingview.com/x/8xtuIY3X/	\N	{ca77752e-f6c3-4bd6-bd86-c53234980f57,30c0ce7e-48dc-455f-8e3c-b35f70ea377e,c4f74a70-c7aa-4ccd-882f-452a6f53a069,9d707c94-1e83-4e63-bc16-86fa59cb5f50}	{7361d61a-3859-4599-ad6d-047e1ba050ac,6104f76b-348d-4662-b8af-ede11c9fee56,b90fe860-438e-4734-93e2-54c4fd99ca6d,b9cd86b5-77d5-4aa6-a677-8b0eb8f7f924,63acc3fb-eece-44f9-a459-9f829ae00e1c,4fb1e3f4-e960-4ffb-a203-8dcb1394c2c2}	f49d86cc-1d15-4364-a67c-54876f358360
29213622-8319-47d9-8bdd-b897b03a5cec	MES	Long	Break Even	2026-03-18T13:25:00.000Z	5	6720.25	6720.25	0	6716.5	6722.75	6719.25	d34270bb-bc64-4796-b23e-c5afded38ea1	\N	2026-03-18T13:30:00.000Z	https://www.tradingview.com/x/0YuSjIUL/	\N	{ca77752e-f6c3-4bd6-bd86-c53234980f57,30c0ce7e-48dc-455f-8e3c-b35f70ea377e,021d2a71-2007-46a9-bba8-7e44336c8503,c4f74a70-c7aa-4ccd-882f-452a6f53a069}	{ff9b7896-5390-4dd8-ad58-6b2c0961225d,78dbbf68-7cc6-4c81-839a-5c025bc972d2}	f49d86cc-1d15-4364-a67c-54876f358360
e03173a9-9860-4b62-afc0-de211e285c1c	MES	Long	Win	2026-03-23T09:40:00.000Z	2	6649.75	6661.25	0	6638.25	6674	6647.25	d34270bb-bc64-4796-b23e-c5afded38ea1	\N	2026-03-23T09:44:00.000Z	https://www.tradingview.com/x/ufafCNlM/	\N	{ca77752e-f6c3-4bd6-bd86-c53234980f57,30c0ce7e-48dc-455f-8e3c-b35f70ea377e,c4f74a70-c7aa-4ccd-882f-452a6f53a069}	{ff9b7896-5390-4dd8-ad58-6b2c0961225d,78dbbf68-7cc6-4c81-839a-5c025bc972d2,ba3d3695-8d42-43e1-a127-91ddbeca9080}	f49d86cc-1d15-4364-a67c-54876f358360
37629b76-38fa-4bfa-a4d7-d13065654c2b	MES	Long	Win	2026-03-23T10:05:00.000Z	1	6666	6680.25	0	6651.5	6683.25	6663	d34270bb-bc64-4796-b23e-c5afded38ea1	\N	2026-03-23T10:10:00.000Z	https://www.tradingview.com/x/2APdTHDS/	\N	{ca77752e-f6c3-4bd6-bd86-c53234980f57,30c0ce7e-48dc-455f-8e3c-b35f70ea377e,c4f74a70-c7aa-4ccd-882f-452a6f53a069}	{7361d61a-3859-4599-ad6d-047e1ba050ac,6104f76b-348d-4662-b8af-ede11c9fee56,b90fe860-438e-4734-93e2-54c4fd99ca6d,b36680de-9bc2-4f95-9eaa-ef9c429231b7,78dbbf68-7cc6-4c81-839a-5c025bc972d2,ba3d3695-8d42-43e1-a127-91ddbeca9080}	f49d86cc-1d15-4364-a67c-54876f358360
384dc771-f927-4432-8ee0-10b0a9ab1add	MES	Short	Break Even	2026-03-23T12:35:00.000Z	1	6635.75	6635.75	0	6653.5	6644.5	6625.75	d34270bb-bc64-4796-b23e-c5afded38ea1	\N	2026-03-23T13:05:00.000Z	https://www.tradingview.com/x/8twhM4jj/	\N	{c4f74a70-c7aa-4ccd-882f-452a6f53a069,ca77752e-f6c3-4bd6-bd86-c53234980f57,72d1f4c8-d80a-4408-8ac0-1f1795ef18f2,30c0ce7e-48dc-455f-8e3c-b35f70ea377e}	{7361d61a-3859-4599-ad6d-047e1ba050ac,6104f76b-348d-4662-b8af-ede11c9fee56,b90fe860-438e-4734-93e2-54c4fd99ca6d,b36680de-9bc2-4f95-9eaa-ef9c429231b7,78dbbf68-7cc6-4c81-839a-5c025bc972d2}	f49d86cc-1d15-4364-a67c-54876f358360
b377dca1-dded-410a-a3fe-d95affbf4ace	MES	Short	Win	2026-03-23T13:10:00.000Z	2	6636	6627.5	0	6644.5	6639.25	6623.25	d34270bb-bc64-4796-b23e-c5afded38ea1	\N	2026-03-23T13:15:00.000Z	https://www.tradingview.com/x/ptSEL873/	\N	{ca77752e-f6c3-4bd6-bd86-c53234980f57,30c0ce7e-48dc-455f-8e3c-b35f70ea377e,c4f74a70-c7aa-4ccd-882f-452a6f53a069}	{b9500cb7-24f6-4da3-ad24-abfa43c52213,6104f76b-348d-4662-b8af-ede11c9fee56,b90fe860-438e-4734-93e2-54c4fd99ca6d,b9cd86b5-77d5-4aa6-a677-8b0eb8f7f924,63acc3fb-eece-44f9-a459-9f829ae00e1c,4fb1e3f4-e960-4ffb-a203-8dcb1394c2c2}	f49d86cc-1d15-4364-a67c-54876f358360
d7af2dc0-ad16-4b7b-b621-e6c75c7642ce	MES	Short	Loss	2026-03-24T10:00:00.000Z	1	6591	6606	0	6606	6606	6588.75	d34270bb-bc64-4796-b23e-c5afded38ea1	\N	2026-03-24T10:05:00.000Z	https://www.tradingview.com/x/artfx4sT/	\N	{ca77752e-f6c3-4bd6-bd86-c53234980f57,9d707c94-1e83-4e63-bc16-86fa59cb5f50,30c0ce7e-48dc-455f-8e3c-b35f70ea377e,c4f74a70-c7aa-4ccd-882f-452a6f53a069}	{b9500cb7-24f6-4da3-ad24-abfa43c52213,6104f76b-348d-4662-b8af-ede11c9fee56,b90fe860-438e-4734-93e2-54c4fd99ca6d,b9cd86b5-77d5-4aa6-a677-8b0eb8f7f924,63acc3fb-eece-44f9-a459-9f829ae00e1c}	f49d86cc-1d15-4364-a67c-54876f358360
785fb64a-e26c-4445-823c-58997452648c	MES	Short	Loss	2026-03-24T10:51:00.000Z	1	6601.5	6617.5	0	6617.5	6617.5	6597.25	2cb8065c-93b2-46cd-832e-5cf66428b7ec	\N	2026-03-24T10:54:00.000Z	https://www.tradingview.com/x/orjDfzg4/	\N	{ca77752e-f6c3-4bd6-bd86-c53234980f57,30c0ce7e-48dc-455f-8e3c-b35f70ea377e,c4f74a70-c7aa-4ccd-882f-452a6f53a069}	{78722eed-20e3-4358-99ac-fe8c3fe83847,65110cd8-07d1-46c2-bca0-6f4acb684bf8,535ecc51-e3f2-4da1-b84c-81c40add124a,f57bf4b8-09ec-40bd-9bcb-de3fb31a5c86,bb502c29-6df2-4414-977b-924267351e37,829fe593-4289-4a77-bc7f-7e6f9110833c,58aa4bdf-10f2-4815-ac21-eb00be5e01be,1acae894-cf00-4b6a-ac47-8a8c9e54002e}	f49d86cc-1d15-4364-a67c-54876f358360
bb8b933e-73c0-4a53-9ee1-1ca4e541d31b	MES	Long	Win	2026-03-24T11:30:00.000Z	2	6629.5	6639.5	0	6619.5	6639.5	6628.5	d34270bb-bc64-4796-b23e-c5afded38ea1	\N	2026-03-24T11:35:00.000Z	https://www.tradingview.com/x/RL8h8ISq/	\N	{ca77752e-f6c3-4bd6-bd86-c53234980f57,30c0ce7e-48dc-455f-8e3c-b35f70ea377e,c4f74a70-c7aa-4ccd-882f-452a6f53a069}	{7361d61a-3859-4599-ad6d-047e1ba050ac,6104f76b-348d-4662-b8af-ede11c9fee56,b90fe860-438e-4734-93e2-54c4fd99ca6d,b36680de-9bc2-4f95-9eaa-ef9c429231b7,78dbbf68-7cc6-4c81-839a-5c025bc972d2,4fb1e3f4-e960-4ffb-a203-8dcb1394c2c2}	f49d86cc-1d15-4364-a67c-54876f358360
781cc2fd-15d2-4a2f-a738-463a927d2208	MES	Short	Loss	2026-03-24T11:40:00.000Z	3	6636	6643.75	0	6643.75	6643.75	6635.5	d34270bb-bc64-4796-b23e-c5afded38ea1	\N	2026-03-24T11:50:00.000Z	https://www.tradingview.com/x/ExhayioP/	\N	{ca77752e-f6c3-4bd6-bd86-c53234980f57,30c0ce7e-48dc-455f-8e3c-b35f70ea377e,c4f74a70-c7aa-4ccd-882f-452a6f53a069}	{ff9b7896-5390-4dd8-ad58-6b2c0961225d,b9cd86b5-77d5-4aa6-a677-8b0eb8f7f924,63acc3fb-eece-44f9-a459-9f829ae00e1c}	f49d86cc-1d15-4364-a67c-54876f358360
db7ca6d6-b4d8-492c-9fd1-d693d94369e2	MES	Short	Break Even	2026-03-24T12:15:00.000Z	2	6633.25	6633.25	0	6646	6637.75	6630.5	d34270bb-bc64-4796-b23e-c5afded38ea1	\N	2026-03-24T12:20:00.000Z	https://www.tradingview.com/x/9uhIHfFB/	\N	{ca77752e-f6c3-4bd6-bd86-c53234980f57,30c0ce7e-48dc-455f-8e3c-b35f70ea377e,c4f74a70-c7aa-4ccd-882f-452a6f53a069,9d707c94-1e83-4e63-bc16-86fa59cb5f50}	{7361d61a-3859-4599-ad6d-047e1ba050ac,b36680de-9bc2-4f95-9eaa-ef9c429231b7,b9cd86b5-77d5-4aa6-a677-8b0eb8f7f924,63acc3fb-eece-44f9-a459-9f829ae00e1c}	f49d86cc-1d15-4364-a67c-54876f358360
c432a237-115e-48ac-9d36-f43cdb13715e	MES	Short	Break Even	2026-03-24T12:45:00.000Z	2	6627.25	6627.25	0	6638	6633	6619.25	d34270bb-bc64-4796-b23e-c5afded38ea1	\N	2026-03-24T12:55:00.000Z	https://www.tradingview.com/x/4PGad8fy/	\N	{ca77752e-f6c3-4bd6-bd86-c53234980f57,30c0ce7e-48dc-455f-8e3c-b35f70ea377e,c4f74a70-c7aa-4ccd-882f-452a6f53a069,9d707c94-1e83-4e63-bc16-86fa59cb5f50}	{7361d61a-3859-4599-ad6d-047e1ba050ac,6104f76b-348d-4662-b8af-ede11c9fee56,b90fe860-438e-4734-93e2-54c4fd99ca6d,b36680de-9bc2-4f95-9eaa-ef9c429231b7,b9cd86b5-77d5-4aa6-a677-8b0eb8f7f924,78dbbf68-7cc6-4c81-839a-5c025bc972d2,ba3d3695-8d42-43e1-a127-91ddbeca9080}	f49d86cc-1d15-4364-a67c-54876f358360
f24f24f3-0b97-456c-9d27-fe3cf46641b9	MES	Short	Loss	2026-03-25T10:10:00.000Z	2	6640.75	6650.75	0	6650.75	6650.75	6640.75	d34270bb-bc64-4796-b23e-c5afded38ea1	\N	2026-03-25T10:14:00.000Z	https://www.tradingview.com/x/B86ljZU9/	\N	{ca77752e-f6c3-4bd6-bd86-c53234980f57,30c0ce7e-48dc-455f-8e3c-b35f70ea377e,c4f74a70-c7aa-4ccd-882f-452a6f53a069}	{7361d61a-3859-4599-ad6d-047e1ba050ac,b90fe860-438e-4734-93e2-54c4fd99ca6d,b36680de-9bc2-4f95-9eaa-ef9c429231b7,b9cd86b5-77d5-4aa6-a677-8b0eb8f7f924,63acc3fb-eece-44f9-a459-9f829ae00e1c}	f49d86cc-1d15-4364-a67c-54876f358360
168bd195-6795-4614-9394-5c9606a52971	MES	Short	Win	2026-03-25T10:55:00.000Z	3	6661.25	6648.25	0	6667.75	6665.5	6646	2cb8065c-93b2-46cd-832e-5cf66428b7ec	\N	2026-03-25T11:05:00.000Z	https://www.tradingview.com/x/MUwGGHrt/	\N	{ca77752e-f6c3-4bd6-bd86-c53234980f57,30c0ce7e-48dc-455f-8e3c-b35f70ea377e,c4f74a70-c7aa-4ccd-882f-452a6f53a069,9d707c94-1e83-4e63-bc16-86fa59cb5f50}	{78722eed-20e3-4358-99ac-fe8c3fe83847,65110cd8-07d1-46c2-bca0-6f4acb684bf8,535ecc51-e3f2-4da1-b84c-81c40add124a,8deab7ab-f093-40a0-94d6-b3073ccfd82f,58aa4bdf-10f2-4815-ac21-eb00be5e01be,7b1a9b97-d7ef-4393-a205-eebf9413648b}	f49d86cc-1d15-4364-a67c-54876f358360
5e8140b6-df4a-440d-b35a-fb8904b77a9d	MES	Long	Break Even	2026-03-25T11:45:00.000Z	1	6639.75	6639.75	0	6625.25	6649.25	6637.25	d34270bb-bc64-4796-b23e-c5afded38ea1	\N	2026-03-25T11:55:00.000Z	https://www.tradingview.com/x/D1vlsRsK/	\N	{ca77752e-f6c3-4bd6-bd86-c53234980f57,30c0ce7e-48dc-455f-8e3c-b35f70ea377e,c4f74a70-c7aa-4ccd-882f-452a6f53a069,9d707c94-1e83-4e63-bc16-86fa59cb5f50}	{7361d61a-3859-4599-ad6d-047e1ba050ac,78dbbf68-7cc6-4c81-839a-5c025bc972d2}	f49d86cc-1d15-4364-a67c-54876f358360
9440224d-b27c-4d5c-ae0d-b5de02255848	MES	Long	Small Win	2026-03-25T12:50:00.000Z	4	6650.75	6653.375	0	6645.25	6657.25	6650.75	d34270bb-bc64-4796-b23e-c5afded38ea1	\N	2026-03-25T12:55:00.000Z	https://www.tradingview.com/x/nTgif306/	\N	{ca77752e-f6c3-4bd6-bd86-c53234980f57,30c0ce7e-48dc-455f-8e3c-b35f70ea377e,c4f74a70-c7aa-4ccd-882f-452a6f53a069}	{ff9b7896-5390-4dd8-ad58-6b2c0961225d,6104f76b-348d-4662-b8af-ede11c9fee56,b90fe860-438e-4734-93e2-54c4fd99ca6d,b9cd86b5-77d5-4aa6-a677-8b0eb8f7f924,78dbbf68-7cc6-4c81-839a-5c025bc972d2,c21a1f6c-45ac-4d35-96d9-3d8c72333304}	f49d86cc-1d15-4364-a67c-54876f358360
d1282ec7-aa18-4b48-a07b-541ca951024a	MES	Short	Small Win	2026-03-25T13:10:00.000Z	3	6651.5	6646.375	0	6658.25	6652.75	6644	d34270bb-bc64-4796-b23e-c5afded38ea1	\N	2026-03-25T13:20:00.000Z	https://www.tradingview.com/x/41BFIGwc/	\N	{ca77752e-f6c3-4bd6-bd86-c53234980f57,30c0ce7e-48dc-455f-8e3c-b35f70ea377e,c4f74a70-c7aa-4ccd-882f-452a6f53a069}	{b9500cb7-24f6-4da3-ad24-abfa43c52213,b36680de-9bc2-4f95-9eaa-ef9c429231b7,b9cd86b5-77d5-4aa6-a677-8b0eb8f7f924,78dbbf68-7cc6-4c81-839a-5c025bc972d2,4fb1e3f4-e960-4ffb-a203-8dcb1394c2c2}	f49d86cc-1d15-4364-a67c-54876f358360
98818492-64c1-417c-83ea-7cfb644399e4	MES	Short	Win	2026-03-27T09:50:00.000Z	2	6483.75	6472	0	6495.75	6489	6454	d34270bb-bc64-4796-b23e-c5afded38ea1	\N	2026-03-27T09:54:00.000Z	https://www.tradingview.com/x/IkTmjGXf/	\N	{ca77752e-f6c3-4bd6-bd86-c53234980f57,30c0ce7e-48dc-455f-8e3c-b35f70ea377e,c4f74a70-c7aa-4ccd-882f-452a6f53a069}	{ff9b7896-5390-4dd8-ad58-6b2c0961225d,63acc3fb-eece-44f9-a459-9f829ae00e1c,ba3d3695-8d42-43e1-a127-91ddbeca9080}	f49d86cc-1d15-4364-a67c-54876f358360
daba3b6f-5221-4418-8dac-cb32cc286e3f	MES	Long	Break Even	2026-03-27T10:20:00.000Z	2	6464	6464	0	6454	6472.5	6462.5	d34270bb-bc64-4796-b23e-c5afded38ea1	\N	2026-03-27T10:25:00.000Z	https://www.tradingview.com/x/3xEGjeBb/	\N	{ca77752e-f6c3-4bd6-bd86-c53234980f57,30c0ce7e-48dc-455f-8e3c-b35f70ea377e,c4f74a70-c7aa-4ccd-882f-452a6f53a069,021d2a71-2007-46a9-bba8-7e44336c8503}	{7361d61a-3859-4599-ad6d-047e1ba050ac,b9cd86b5-77d5-4aa6-a677-8b0eb8f7f924,78dbbf68-7cc6-4c81-839a-5c025bc972d2}	f49d86cc-1d15-4364-a67c-54876f358360
82755641-6116-42f8-bc8e-f113e4d80ae0	MES	Short	Loss	2026-03-27T10:55:00.000Z	4	6468.25	6474	0	6474	6474	6467.75	d34270bb-bc64-4796-b23e-c5afded38ea1	\N	2026-03-27T11:00:00.000Z	https://www.tradingview.com/x/2F8Mp2xU/	\N	{ca77752e-f6c3-4bd6-bd86-c53234980f57,30c0ce7e-48dc-455f-8e3c-b35f70ea377e,c4f74a70-c7aa-4ccd-882f-452a6f53a069}	{b9500cb7-24f6-4da3-ad24-abfa43c52213,6104f76b-348d-4662-b8af-ede11c9fee56,b90fe860-438e-4734-93e2-54c4fd99ca6d,b9cd86b5-77d5-4aa6-a677-8b0eb8f7f924,63acc3fb-eece-44f9-a459-9f829ae00e1c}	f49d86cc-1d15-4364-a67c-54876f358360
dd84308a-3a86-405a-a7bd-682b2d27e5e4	MES	Short	Win	2026-03-27T11:05:00.000Z	3	6477	6461.5	0	6484.75	6481.25	6457.75	2cb8065c-93b2-46cd-832e-5cf66428b7ec	\N	2026-03-27T11:20:00.000Z	https://www.tradingview.com/x/iXwoe5vA/	\N	{ca77752e-f6c3-4bd6-bd86-c53234980f57,021d2a71-2007-46a9-bba8-7e44336c8503,30c0ce7e-48dc-455f-8e3c-b35f70ea377e,c4f74a70-c7aa-4ccd-882f-452a6f53a069}	{37522452-ca7c-4732-801a-afd8a4daaf3b,997bfb97-c842-48db-ae05-76724847b839,f57bf4b8-09ec-40bd-9bcb-de3fb31a5c86,535ecc51-e3f2-4da1-b84c-81c40add124a,bb502c29-6df2-4414-977b-924267351e37,829fe593-4289-4a77-bc7f-7e6f9110833c,58aa4bdf-10f2-4815-ac21-eb00be5e01be,7b1a9b97-d7ef-4393-a205-eebf9413648b}	f49d86cc-1d15-4364-a67c-54876f358360
83074aba-0717-4e7e-8a4b-dce19746f2a9	MES	Short	Win	2026-03-27T11:50:00.000Z	2	6480.25	6470.25	0	6490.25	6483	6470.25	d34270bb-bc64-4796-b23e-c5afded38ea1	\N	2026-03-27T11:55:00.000Z	https://www.tradingview.com/x/Qj3RJPWl/	\N	{ca77752e-f6c3-4bd6-bd86-c53234980f57,30c0ce7e-48dc-455f-8e3c-b35f70ea377e,c4f74a70-c7aa-4ccd-882f-452a6f53a069}	{ff9b7896-5390-4dd8-ad58-6b2c0961225d,b90fe860-438e-4734-93e2-54c4fd99ca6d,78dbbf68-7cc6-4c81-839a-5c025bc972d2,ba3d3695-8d42-43e1-a127-91ddbeca9080}	f49d86cc-1d15-4364-a67c-54876f358360
f0c1a15c-29c4-4d3a-a58b-9b3e2c6389e2	MES	Long	Win	2026-03-27T12:55:00.000Z	3	6456	6459.625	0	6448.5	6468	6449.5	d34270bb-bc64-4796-b23e-c5afded38ea1	\N	2026-03-27T13:05:00.000Z	https://www.tradingview.com/x/7d5SwgVz/	\N	{ca77752e-f6c3-4bd6-bd86-c53234980f57,30c0ce7e-48dc-455f-8e3c-b35f70ea377e,c4f74a70-c7aa-4ccd-882f-452a6f53a069,021d2a71-2007-46a9-bba8-7e44336c8503}	{63acc3fb-eece-44f9-a459-9f829ae00e1c,ff9b7896-5390-4dd8-ad58-6b2c0961225d,b36680de-9bc2-4f95-9eaa-ef9c429231b7,4fb1e3f4-e960-4ffb-a203-8dcb1394c2c2}	f49d86cc-1d15-4364-a67c-54876f358360
f275531f-b1fa-4063-966c-724ca23268b5	MES	Short	Loss	2026-03-31T11:05:00.000Z	1	6467.5	6483	0	6483	6483	6466	d34270bb-bc64-4796-b23e-c5afded38ea1	\N	2026-03-31T11:10:00.000Z	https://www.tradingview.com/x/BXF8pGPL/	\N	{c4f74a70-c7aa-4ccd-882f-452a6f53a069,30c0ce7e-48dc-455f-8e3c-b35f70ea377e,ca77752e-f6c3-4bd6-bd86-c53234980f57}	{7361d61a-3859-4599-ad6d-047e1ba050ac,b90fe860-438e-4734-93e2-54c4fd99ca6d,b36680de-9bc2-4f95-9eaa-ef9c429231b7,b9cd86b5-77d5-4aa6-a677-8b0eb8f7f924,78dbbf68-7cc6-4c81-839a-5c025bc972d2}	f49d86cc-1d15-4364-a67c-54876f358360
ca87c5a0-1d4c-4820-8d1d-167ce98b13f1	MES	Short	Loss	2026-03-31T14:00:00.000Z	3	6536.25	6543.25	0	6543.25	6543.25	6536.25	d34270bb-bc64-4796-b23e-c5afded38ea1	\N	2026-03-31T14:01:00.000Z	https://www.tradingview.com/x/qEoqQLB3/	\N	{ca77752e-f6c3-4bd6-bd86-c53234980f57,30c0ce7e-48dc-455f-8e3c-b35f70ea377e,c4f74a70-c7aa-4ccd-882f-452a6f53a069}	{b9500cb7-24f6-4da3-ad24-abfa43c52213,b36680de-9bc2-4f95-9eaa-ef9c429231b7,b9cd86b5-77d5-4aa6-a677-8b0eb8f7f924,63acc3fb-eece-44f9-a459-9f829ae00e1c}	f49d86cc-1d15-4364-a67c-54876f358360
f4c2bcae-47e1-415b-bad3-ed82756ac7df	MES	Long	Win	2026-03-31T14:10:00.000Z	3	6537	6544.75	0	6529.25	6549.5	6536.25	d34270bb-bc64-4796-b23e-c5afded38ea1	\N	2026-03-31T14:15:00.000Z	https://www.tradingview.com/x/YPpBGDxz/	\N	{30c0ce7e-48dc-455f-8e3c-b35f70ea377e,c4f74a70-c7aa-4ccd-882f-452a6f53a069,ca77752e-f6c3-4bd6-bd86-c53234980f57,72d1f4c8-d80a-4408-8ac0-1f1795ef18f2}	{b90fe860-438e-4734-93e2-54c4fd99ca6d,6104f76b-348d-4662-b8af-ede11c9fee56,ff9b7896-5390-4dd8-ad58-6b2c0961225d,78dbbf68-7cc6-4c81-839a-5c025bc972d2,4fb1e3f4-e960-4ffb-a203-8dcb1394c2c2}	f49d86cc-1d15-4364-a67c-54876f358360
865dca62-6bda-47b2-97ac-fab28456cacb	MES	Long	Loss	2026-04-25T01:59:45	6	7192	7189	0	7189	7193.75	7189	d34270bb-bc64-4796-b23e-c5afded38ea1	\N	2026-04-25T02:05:45.000Z	https://s3.tradingview.com/snapshots/w/wUFLDyWf.png	\N	{f4b9bcb3-ea3d-459a-aedc-8f00bd1cf4f1,30c0ce7e-48dc-455f-8e3c-b35f70ea377e,ca77752e-f6c3-4bd6-bd86-c53234980f57,c4f74a70-c7aa-4ccd-882f-452a6f53a069,e645e271-35dd-4256-8e77-29f831fa669e,89a826a7-c03b-4878-afdc-379478d57a8e,8b7c1888-da0e-42a4-9762-6be2922cd0c7}	{cac64e4f-8da6-4ba3-9b36-615fb9a8063b,184d20f3-d83f-4a01-a04b-a9ae59411a68,445c5267-1d08-4add-b1d9-d6de2dc8fac0,6104f76b-348d-4662-b8af-ede11c9fee56,b36680de-9bc2-4f95-9eaa-ef9c429231b7,b90fe860-438e-4734-93e2-54c4fd99ca6d,3516a046-3eef-4af9-9061-f90d3357cb25,09695f82-1733-40d6-a6d1-f225b38e7320}	f49d86cc-1d15-4364-a67c-54876f358360
c8d62f77-6dee-4300-ae01-564bb581606d	MESM6	Short	Loss	2026-04-21T21:43:20	2	7155.5	7164	3.64	7164	7164	7152.75	d34270bb-bc64-4796-b23e-c5afded38ea1	\N	2026-04-21T21:48:54	https://s3.tradingview.com/snapshots/w/WmqIvGnq.png	\N	{f4b9bcb3-ea3d-459a-aedc-8f00bd1cf4f1,30c0ce7e-48dc-455f-8e3c-b35f70ea377e,ca77752e-f6c3-4bd6-bd86-c53234980f57,c4f74a70-c7aa-4ccd-882f-452a6f53a069}	{566adc58-bc6f-4957-811b-01075ec805ed,63acc3fb-eece-44f9-a459-9f829ae00e1c}	f49d86cc-1d15-4364-a67c-54876f358360
060a1c58-0019-4709-855c-1f63b4a3591f	MESM6	Short	Win	2026-04-25T02:26:46	6	7189.75	7186.25	10.92	7193.25	7189.75	7185.25	d34270bb-bc64-4796-b23e-c5afded38ea1	\N	2026-04-25T02:30:26	https://s3.tradingview.com/snapshots/e/eCMcq697.png	\N	{f4b9bcb3-ea3d-459a-aedc-8f00bd1cf4f1,30c0ce7e-48dc-455f-8e3c-b35f70ea377e,ca77752e-f6c3-4bd6-bd86-c53234980f57,c4f74a70-c7aa-4ccd-882f-452a6f53a069,d5abea44-d155-4bd6-b9ae-f32155c1f53e,e645e271-35dd-4256-8e77-29f831fa669e,72d1f4c8-d80a-4408-8ac0-1f1795ef18f2}	{75de6e0d-0fc8-49ef-8b41-8273834de3e3,184d20f3-d83f-4a01-a04b-a9ae59411a68,3516a046-3eef-4af9-9061-f90d3357cb25,78dbbf68-7cc6-4c81-839a-5c025bc972d2,4fb1e3f4-e960-4ffb-a203-8dcb1394c2c2}	f49d86cc-1d15-4364-a67c-54876f358360
b1a5fea9-bbec-4457-9d03-0ffa1ce1412d	MESM6	Short	Win	2026-04-21T22:30:16	4	7167.5	7162.75	7.28	7172.5	7167.75	7159.25	d34270bb-bc64-4796-b23e-c5afded38ea1	\N	2026-04-21T22:34:53	https://s3.tradingview.com/snapshots/u/UzLeFD6G.png	\N	{f4b9bcb3-ea3d-459a-aedc-8f00bd1cf4f1,30c0ce7e-48dc-455f-8e3c-b35f70ea377e,ca77752e-f6c3-4bd6-bd86-c53234980f57,c4f74a70-c7aa-4ccd-882f-452a6f53a069,d5abea44-d155-4bd6-b9ae-f32155c1f53e}	{75de6e0d-0fc8-49ef-8b41-8273834de3e3,b36680de-9bc2-4f95-9eaa-ef9c429231b7,aec3f6e1-cdbf-4f2c-b483-c3899ae9c30d,7ae2b1c6-405e-40f0-b110-3ca9128a80c7,78dbbf68-7cc6-4c81-839a-5c025bc972d2,4fb1e3f4-e960-4ffb-a203-8dcb1394c2c2}	f49d86cc-1d15-4364-a67c-54876f358360
a0b0c112-5413-4cb6-ad4c-2474a4fe18cb	MESM6	Long	Loss	2026-04-21T23:31:35	2	7130	7120.75	3.64	7120.75	7133.5	7120.75	d34270bb-bc64-4796-b23e-c5afded38ea1	\N	2026-04-21T23:36:37	https://s3.tradingview.com/snapshots/y/yW1R4k7e.png	\N	{f4b9bcb3-ea3d-459a-aedc-8f00bd1cf4f1,30c0ce7e-48dc-455f-8e3c-b35f70ea377e,ca77752e-f6c3-4bd6-bd86-c53234980f57,c4f74a70-c7aa-4ccd-882f-452a6f53a069}	{75de6e0d-0fc8-49ef-8b41-8273834de3e3,aec3f6e1-cdbf-4f2c-b483-c3899ae9c30d,7ae2b1c6-405e-40f0-b110-3ca9128a80c7,63acc3fb-eece-44f9-a459-9f829ae00e1c}	f49d86cc-1d15-4364-a67c-54876f358360
fcc34053-2dcf-473f-b0dc-3765609a7096	MESM6	Long	Loss	2026-04-27T21:44:48	3	7190.75	7180.5	5.46	7183.25	7192.25	7180.5	d34270bb-bc64-4796-b23e-c5afded38ea1	\N	2026-04-27T21:47:12	https://s3.tradingview.com/snapshots/a/AzpPyCI5.png	\N	{f4b9bcb3-ea3d-459a-aedc-8f00bd1cf4f1,30c0ce7e-48dc-455f-8e3c-b35f70ea377e,ca77752e-f6c3-4bd6-bd86-c53234980f57,c4f74a70-c7aa-4ccd-882f-452a6f53a069}	{75de6e0d-0fc8-49ef-8b41-8273834de3e3,566adc58-bc6f-4957-811b-01075ec805ed,b90fe860-438e-4734-93e2-54c4fd99ca6d,7ae2b1c6-405e-40f0-b110-3ca9128a80c7,09695f82-1733-40d6-a6d1-f225b38e7320}	f49d86cc-1d15-4364-a67c-54876f358360
d4beb565-a0c4-4360-9e4b-d5d085b289bc	MESM6	Short	Loss	2026-04-27T23:28:00	6	7183.5	7187	10.92	7187	7187	7182.5	d34270bb-bc64-4796-b23e-c5afded38ea1	\N	2026-04-27T23:30:57	https://s3.tradingview.com/snapshots/l/LUXQmMUy.png	\N	{f4b9bcb3-ea3d-459a-aedc-8f00bd1cf4f1,30c0ce7e-48dc-455f-8e3c-b35f70ea377e,ca77752e-f6c3-4bd6-bd86-c53234980f57,c4f74a70-c7aa-4ccd-882f-452a6f53a069}	{75de6e0d-0fc8-49ef-8b41-8273834de3e3,184d20f3-d83f-4a01-a04b-a9ae59411a68,6104f76b-348d-4662-b8af-ede11c9fee56,b36680de-9bc2-4f95-9eaa-ef9c429231b7,b90fe860-438e-4734-93e2-54c4fd99ca6d,3516a046-3eef-4af9-9061-f90d3357cb25,63acc3fb-eece-44f9-a459-9f829ae00e1c}	f49d86cc-1d15-4364-a67c-54876f358360
0094d598-4be3-499d-8d1e-74714071ab11	MESM6	Short	Break Even	2026-04-22T00:31:07	5	7127	7127	9.1	7131.25	7131	7126.25	d34270bb-bc64-4796-b23e-c5afded38ea1	\N	2026-04-22T00:36:24	https://s3.tradingview.com/snapshots/d/dYXcShfI.png	\N	{f4b9bcb3-ea3d-459a-aedc-8f00bd1cf4f1,30c0ce7e-48dc-455f-8e3c-b35f70ea377e,ca77752e-f6c3-4bd6-bd86-c53234980f57,c4f74a70-c7aa-4ccd-882f-452a6f53a069,bd572175-2b52-4894-8f59-93fcdf9dbeb7,9d707c94-1e83-4e63-bc16-86fa59cb5f50,d5abea44-d155-4bd6-b9ae-f32155c1f53e}	{75de6e0d-0fc8-49ef-8b41-8273834de3e3,3516a046-3eef-4af9-9061-f90d3357cb25,6104f76b-348d-4662-b8af-ede11c9fee56,b36680de-9bc2-4f95-9eaa-ef9c429231b7,b90fe860-438e-4734-93e2-54c4fd99ca6d,63acc3fb-eece-44f9-a459-9f829ae00e1c,ba3d3695-8d42-43e1-a127-91ddbeca9080}	f49d86cc-1d15-4364-a67c-54876f358360
e8bc68c6-ff39-4a45-88f1-0f8e6dde3ea7	MESM6	Long	Break Even	2026-04-27T23:46:20	6	7185.5	7185.5	10.92	7182	7188.75	7185	d34270bb-bc64-4796-b23e-c5afded38ea1	\N	2026-04-27T23:50:02	https://s3.tradingview.com/snapshots/y/YVRzOLz6.png	\N	{f4b9bcb3-ea3d-459a-aedc-8f00bd1cf4f1,30c0ce7e-48dc-455f-8e3c-b35f70ea377e,ca77752e-f6c3-4bd6-bd86-c53234980f57,c4f74a70-c7aa-4ccd-882f-452a6f53a069,021d2a71-2007-46a9-bba8-7e44336c8503,28f406f6-9a62-4a16-8042-78d0b29faa28}	{75de6e0d-0fc8-49ef-8b41-8273834de3e3,184d20f3-d83f-4a01-a04b-a9ae59411a68,aec3f6e1-cdbf-4f2c-b483-c3899ae9c30d,3516a046-3eef-4af9-9061-f90d3357cb25,78dbbf68-7cc6-4c81-839a-5c025bc972d2}	f49d86cc-1d15-4364-a67c-54876f358360
664faa0e-6d51-4ebf-b99b-f3ae0c26dac5	MESM6	Short	Win	2026-04-22T00:49:12	3	7124.25	7117.75	5.46	7131	7125.25	7116.25	d34270bb-bc64-4796-b23e-c5afded38ea1	\N	2026-04-22T00:56:01	https://s3.tradingview.com/snapshots/p/P8UxtsfA.png	\N	{f4b9bcb3-ea3d-459a-aedc-8f00bd1cf4f1,30c0ce7e-48dc-455f-8e3c-b35f70ea377e,ca77752e-f6c3-4bd6-bd86-c53234980f57,c4f74a70-c7aa-4ccd-882f-452a6f53a069,d5abea44-d155-4bd6-b9ae-f32155c1f53e}	{75de6e0d-0fc8-49ef-8b41-8273834de3e3,6104f76b-348d-4662-b8af-ede11c9fee56,b36680de-9bc2-4f95-9eaa-ef9c429231b7,756f5cd7-727d-470e-a161-9496886cc3fb,b90fe860-438e-4734-93e2-54c4fd99ca6d,63acc3fb-eece-44f9-a459-9f829ae00e1c,4fb1e3f4-e960-4ffb-a203-8dcb1394c2c2}	f49d86cc-1d15-4364-a67c-54876f358360
5f94e552-ca88-49ac-b6c2-b8884013f546	MESM6	Long	Break Even	2026-04-28T21:54:00	2	7169.75	7169.75	3.64	7161.5	7170.75	7163.5	d34270bb-bc64-4796-b23e-c5afded38ea1	\N	2026-04-28T21:58:27	https://s3.tradingview.com/snapshots/1/1bYR2p4F.png	\N	{f4b9bcb3-ea3d-459a-aedc-8f00bd1cf4f1,30c0ce7e-48dc-455f-8e3c-b35f70ea377e,ca77752e-f6c3-4bd6-bd86-c53234980f57,c4f74a70-c7aa-4ccd-882f-452a6f53a069,bd572175-2b52-4894-8f59-93fcdf9dbeb7,021d2a71-2007-46a9-bba8-7e44336c8503}	{75de6e0d-0fc8-49ef-8b41-8273834de3e3,566adc58-bc6f-4957-811b-01075ec805ed,b90fe860-438e-4734-93e2-54c4fd99ca6d,7ae2b1c6-405e-40f0-b110-3ca9128a80c7,09695f82-1733-40d6-a6d1-f225b38e7320}	f49d86cc-1d15-4364-a67c-54876f358360
bfcc51dd-ad8b-4cf0-a958-b1a226b30ed6	MESM6	Short	Win	2026-04-22T01:03:53	4	7120.25	7114.75	7.28	7125.75	7120.25	7109.25	d34270bb-bc64-4796-b23e-c5afded38ea1	\N	2026-04-22T01:05:04	https://s3.tradingview.com/snapshots/u/UvywUbmq.png	\N	{f4b9bcb3-ea3d-459a-aedc-8f00bd1cf4f1,30c0ce7e-48dc-455f-8e3c-b35f70ea377e,ca77752e-f6c3-4bd6-bd86-c53234980f57,c4f74a70-c7aa-4ccd-882f-452a6f53a069,d5abea44-d155-4bd6-b9ae-f32155c1f53e}	{75de6e0d-0fc8-49ef-8b41-8273834de3e3,6104f76b-348d-4662-b8af-ede11c9fee56,b36680de-9bc2-4f95-9eaa-ef9c429231b7,b90fe860-438e-4734-93e2-54c4fd99ca6d,756f5cd7-727d-470e-a161-9496886cc3fb,78dbbf68-7cc6-4c81-839a-5c025bc972d2,ba3d3695-8d42-43e1-a127-91ddbeca9080}	f49d86cc-1d15-4364-a67c-54876f358360
aca4745c-983c-4c8c-bc14-4b30144951fc	MESM6	Short	Loss	2026-04-28T22:55:40	3	7153.5	7160.75	5.46	7160.75	7160.75	7150.25	d34270bb-bc64-4796-b23e-c5afded38ea1	\N	2026-04-28T23:00:19	https://s3.tradingview.com/snapshots/u/uh3ntk1P.png	\N	{f4b9bcb3-ea3d-459a-aedc-8f00bd1cf4f1,30c0ce7e-48dc-455f-8e3c-b35f70ea377e,ca77752e-f6c3-4bd6-bd86-c53234980f57,c4f74a70-c7aa-4ccd-882f-452a6f53a069,89a826a7-c03b-4878-afdc-379478d57a8e}	{75de6e0d-0fc8-49ef-8b41-8273834de3e3,6104f76b-348d-4662-b8af-ede11c9fee56,b36680de-9bc2-4f95-9eaa-ef9c429231b7,b90fe860-438e-4734-93e2-54c4fd99ca6d,3516a046-3eef-4af9-9061-f90d3357cb25,a5b67e0d-2865-4c24-99ea-1b7feda1c212,63acc3fb-eece-44f9-a459-9f829ae00e1c}	f49d86cc-1d15-4364-a67c-54876f358360
17d365e4-edaf-4ffa-bb1c-52c9a15d9dbf	MESM6	Short	Loss	2026-04-22T01:33:00	2	7110.5	7122	3.64	7122	7122	7108.75	d34270bb-bc64-4796-b23e-c5afded38ea1	\N	2026-04-22T01:38:55	https://s3.tradingview.com/snapshots/z/ZIzbmvba.png	\N	{f4b9bcb3-ea3d-459a-aedc-8f00bd1cf4f1,30c0ce7e-48dc-455f-8e3c-b35f70ea377e,ca77752e-f6c3-4bd6-bd86-c53234980f57,c4f74a70-c7aa-4ccd-882f-452a6f53a069}	{a5b67e0d-2865-4c24-99ea-1b7feda1c212,6104f76b-348d-4662-b8af-ede11c9fee56,b36680de-9bc2-4f95-9eaa-ef9c429231b7,b90fe860-438e-4734-93e2-54c4fd99ca6d,756f5cd7-727d-470e-a161-9496886cc3fb,63acc3fb-eece-44f9-a459-9f829ae00e1c}	f49d86cc-1d15-4364-a67c-54876f358360
35501dce-faa6-422f-b039-8bb465d333fa	MESM6	Long	Win	2026-04-28T23:07:06	3	7154	7160.75	5.46	7147	7161.25	7152.5	d34270bb-bc64-4796-b23e-c5afded38ea1	\N	2026-04-28T23:13:04	https://s3.tradingview.com/snapshots/e/E00YVRY0.png	\N	{f4b9bcb3-ea3d-459a-aedc-8f00bd1cf4f1,30c0ce7e-48dc-455f-8e3c-b35f70ea377e,ca77752e-f6c3-4bd6-bd86-c53234980f57,c4f74a70-c7aa-4ccd-882f-452a6f53a069}	{75de6e0d-0fc8-49ef-8b41-8273834de3e3,184d20f3-d83f-4a01-a04b-a9ae59411a68,aec3f6e1-cdbf-4f2c-b483-c3899ae9c30d,7ae2b1c6-405e-40f0-b110-3ca9128a80c7,78dbbf68-7cc6-4c81-839a-5c025bc972d2,4fb1e3f4-e960-4ffb-a203-8dcb1394c2c2}	f49d86cc-1d15-4364-a67c-54876f358360
cbe49e04-4df6-4a24-99b5-d95b2707bf97	MESM6	Short	Win	2026-04-22T02:36:47	3	7115	7109.25	5.46	7121	7115	7109.25	d34270bb-bc64-4796-b23e-c5afded38ea1	\N	2026-04-22T02:50:05	https://s3.tradingview.com/snapshots/n/n3pkVI9M.png	\N	{f4b9bcb3-ea3d-459a-aedc-8f00bd1cf4f1,30c0ce7e-48dc-455f-8e3c-b35f70ea377e,ca77752e-f6c3-4bd6-bd86-c53234980f57,c4f74a70-c7aa-4ccd-882f-452a6f53a069,d5abea44-d155-4bd6-b9ae-f32155c1f53e}	{75de6e0d-0fc8-49ef-8b41-8273834de3e3,184d20f3-d83f-4a01-a04b-a9ae59411a68,6104f76b-348d-4662-b8af-ede11c9fee56,b90fe860-438e-4734-93e2-54c4fd99ca6d,3516a046-3eef-4af9-9061-f90d3357cb25,63acc3fb-eece-44f9-a459-9f829ae00e1c,4fb1e3f4-e960-4ffb-a203-8dcb1394c2c2}	f49d86cc-1d15-4364-a67c-54876f358360
793c723a-d335-4d5b-96c4-f5f840d463ee	MESM6	Short	Break Even	2026-04-28T23:13:06	3	7160.25	7160.25	5.46	7164.75	7162.25	7156.25	d34270bb-bc64-4796-b23e-c5afded38ea1	\N	2026-04-28T23:16:33	https://s3.tradingview.com/snapshots/k/K0FreAO5.png	\N	{f4b9bcb3-ea3d-459a-aedc-8f00bd1cf4f1,30c0ce7e-48dc-455f-8e3c-b35f70ea377e,ca77752e-f6c3-4bd6-bd86-c53234980f57,c4f74a70-c7aa-4ccd-882f-452a6f53a069,9d707c94-1e83-4e63-bc16-86fa59cb5f50}	{75de6e0d-0fc8-49ef-8b41-8273834de3e3,6104f76b-348d-4662-b8af-ede11c9fee56,b90fe860-438e-4734-93e2-54c4fd99ca6d,7ae2b1c6-405e-40f0-b110-3ca9128a80c7}	f49d86cc-1d15-4364-a67c-54876f358360
8cbfe75e-0e7d-43aa-9185-43cc4985494d	MESM6	Short	Break Even	2026-04-28T23:53:47	5	7151.25	7151.25	9.1	7155.5	7154.25	7149.25	d34270bb-bc64-4796-b23e-c5afded38ea1	\N	2026-04-28T23:59:00	https://s3.tradingview.com/snapshots/r/rVyn6T0g.png	\N	{f4b9bcb3-ea3d-459a-aedc-8f00bd1cf4f1,30c0ce7e-48dc-455f-8e3c-b35f70ea377e,ca77752e-f6c3-4bd6-bd86-c53234980f57,c4f74a70-c7aa-4ccd-882f-452a6f53a069,bd572175-2b52-4894-8f59-93fcdf9dbeb7,021d2a71-2007-46a9-bba8-7e44336c8503}	{75de6e0d-0fc8-49ef-8b41-8273834de3e3,3516a046-3eef-4af9-9061-f90d3357cb25,b90fe860-438e-4734-93e2-54c4fd99ca6d,6104f76b-348d-4662-b8af-ede11c9fee56,184d20f3-d83f-4a01-a04b-a9ae59411a68,63acc3fb-eece-44f9-a459-9f829ae00e1c}	f49d86cc-1d15-4364-a67c-54876f358360
935ad9e2-e40e-4ca0-860b-7d33d7236f23	MESM6	Short	Break Even	2026-04-29T00:50:17	4	7154.25	7154.25	7.28	7159.75	7155	7149	d34270bb-bc64-4796-b23e-c5afded38ea1	\N	2026-04-29T00:52:41	https://s3.tradingview.com/snapshots/p/prsm90Qt.png	\N	{f4b9bcb3-ea3d-459a-aedc-8f00bd1cf4f1,30c0ce7e-48dc-455f-8e3c-b35f70ea377e,ca77752e-f6c3-4bd6-bd86-c53234980f57,c4f74a70-c7aa-4ccd-882f-452a6f53a069,b905337e-c0d2-4a42-a0bc-1aabd63fed54,9d707c94-1e83-4e63-bc16-86fa59cb5f50}	{a5b67e0d-2865-4c24-99ea-1b7feda1c212,184d20f3-d83f-4a01-a04b-a9ae59411a68,6104f76b-348d-4662-b8af-ede11c9fee56,b90fe860-438e-4734-93e2-54c4fd99ca6d,7ae2b1c6-405e-40f0-b110-3ca9128a80c7,78dbbf68-7cc6-4c81-839a-5c025bc972d2}	f49d86cc-1d15-4364-a67c-54876f358360
ce1822e4-3c64-408d-870d-a07c1d4ffe44	MESM6	Long	Break Even	2026-04-29T01:02:43	4	7152.75	7152.75	7.28	7147.5	7152.75	7148	d34270bb-bc64-4796-b23e-c5afded38ea1	\N	2026-04-29T01:09:56	https://s3.tradingview.com/snapshots/y/YY0kUV2R.png	\N	{f4b9bcb3-ea3d-459a-aedc-8f00bd1cf4f1,30c0ce7e-48dc-455f-8e3c-b35f70ea377e,ca77752e-f6c3-4bd6-bd86-c53234980f57,c4f74a70-c7aa-4ccd-882f-452a6f53a069,bd572175-2b52-4894-8f59-93fcdf9dbeb7,da044f08-6cf4-4843-97b2-36504cb55851}	{75de6e0d-0fc8-49ef-8b41-8273834de3e3,184d20f3-d83f-4a01-a04b-a9ae59411a68,7ae2b1c6-405e-40f0-b110-3ca9128a80c7,63acc3fb-eece-44f9-a459-9f829ae00e1c}	f49d86cc-1d15-4364-a67c-54876f358360
ee134682-ae07-4a5e-8cc1-9048fd2e1d62	MESM6	Short	Win	2026-04-29T01:12:20	4	7153.5	7149.25	7.28	7158	7154	7149	d34270bb-bc64-4796-b23e-c5afded38ea1	\N	2026-04-29T01:19:24	https://s3.tradingview.com/snapshots/f/flwZfWFb.png	\N	{f4b9bcb3-ea3d-459a-aedc-8f00bd1cf4f1,30c0ce7e-48dc-455f-8e3c-b35f70ea377e,ca77752e-f6c3-4bd6-bd86-c53234980f57,c4f74a70-c7aa-4ccd-882f-452a6f53a069}	{75de6e0d-0fc8-49ef-8b41-8273834de3e3,184d20f3-d83f-4a01-a04b-a9ae59411a68,6104f76b-348d-4662-b8af-ede11c9fee56,7ae2b1c6-405e-40f0-b110-3ca9128a80c7,4fb1e3f4-e960-4ffb-a203-8dcb1394c2c2,09695f82-1733-40d6-a6d1-f225b38e7320}	f49d86cc-1d15-4364-a67c-54876f358360
0741ce62-4ae9-45e5-89ed-a5c3f7ee56b1	MES	Short	Break Even	2026-03-03T10:40:00.000Z	1	6735.5	6735.5	0	6752.25	6744.5	6725.5	d34270bb-bc64-4796-b23e-c5afded38ea1	\N	2026-03-03T10:50:00.000Z	https://www.tradingview.com/x/t15dSWVT/	\N	{ca77752e-f6c3-4bd6-bd86-c53234980f57,30c0ce7e-48dc-455f-8e3c-b35f70ea377e,c4f74a70-c7aa-4ccd-882f-452a6f53a069}	{7361d61a-3859-4599-ad6d-047e1ba050ac,6104f76b-348d-4662-b8af-ede11c9fee56,b90fe860-438e-4734-93e2-54c4fd99ca6d,b36680de-9bc2-4f95-9eaa-ef9c429231b7,b9cd86b5-77d5-4aa6-a677-8b0eb8f7f924,78dbbf68-7cc6-4c81-839a-5c025bc972d2}	f49d86cc-1d15-4364-a67c-54876f358360
9c31a331-74a9-460c-a5e2-7ca118da2e15	MES	Long	Win	2026-03-03T12:10:00.000Z	1	6788.75	6802.25	0	6775.25	6802.25	6786.5	d34270bb-bc64-4796-b23e-c5afded38ea1	\N	2026-03-03T12:20:00.000Z	https://www.tradingview.com/x/mK5vdeak/	\N	{ca77752e-f6c3-4bd6-bd86-c53234980f57,30c0ce7e-48dc-455f-8e3c-b35f70ea377e,c4f74a70-c7aa-4ccd-882f-452a6f53a069}	{7361d61a-3859-4599-ad6d-047e1ba050ac,6104f76b-348d-4662-b8af-ede11c9fee56,b90fe860-438e-4734-93e2-54c4fd99ca6d,b36680de-9bc2-4f95-9eaa-ef9c429231b7,78dbbf68-7cc6-4c81-839a-5c025bc972d2,4fb1e3f4-e960-4ffb-a203-8dcb1394c2c2}	f49d86cc-1d15-4364-a67c-54876f358360
7a88d95d-ed0d-478c-825b-f2ba4831b3fa	MESM6	Long	Break Even	2026-04-29T02:31:43	5	7165.25	7165.25	9.1	7161.5	7165.75	7162	d34270bb-bc64-4796-b23e-c5afded38ea1	\N	2026-04-29T02:40:35	https://s3.tradingview.com/snapshots/7/7IJauaFK.png	\N	{f4b9bcb3-ea3d-459a-aedc-8f00bd1cf4f1,30c0ce7e-48dc-455f-8e3c-b35f70ea377e,ca77752e-f6c3-4bd6-bd86-c53234980f57,c4f74a70-c7aa-4ccd-882f-452a6f53a069,bd572175-2b52-4894-8f59-93fcdf9dbeb7,9d707c94-1e83-4e63-bc16-86fa59cb5f50}	{75de6e0d-0fc8-49ef-8b41-8273834de3e3,a5b67e0d-2865-4c24-99ea-1b7feda1c212,6104f76b-348d-4662-b8af-ede11c9fee56,b36680de-9bc2-4f95-9eaa-ef9c429231b7,b90fe860-438e-4734-93e2-54c4fd99ca6d,3516a046-3eef-4af9-9061-f90d3357cb25,63acc3fb-eece-44f9-a459-9f829ae00e1c}	f49d86cc-1d15-4364-a67c-54876f358360
d7df75bf-9b07-4242-b9de-62c65c61cb32	MES	Short	Win	2026-03-05T13:20:00.000Z	2	6793	6784.75	0	6801.25	6794.5	6780	d34270bb-bc64-4796-b23e-c5afded38ea1	\N	2026-03-05T13:25:00.000Z	https://www.tradingview.com/x/BUIg2QBH/	\N	{ca77752e-f6c3-4bd6-bd86-c53234980f57,30c0ce7e-48dc-455f-8e3c-b35f70ea377e,c4f74a70-c7aa-4ccd-882f-452a6f53a069}	{ff9b7896-5390-4dd8-ad58-6b2c0961225d,6104f76b-348d-4662-b8af-ede11c9fee56,b90fe860-438e-4734-93e2-54c4fd99ca6d,78dbbf68-7cc6-4c81-839a-5c025bc972d2,4fb1e3f4-e960-4ffb-a203-8dcb1394c2c2}	f49d86cc-1d15-4364-a67c-54876f358360
808a6683-e9b8-4ba1-91fe-dddd9cc71cfc	MES	Long	Break Even	2026-03-06T11:15:00.000Z	2	6765.5	6765.5	0	6752.75	6769.5	6753	d34270bb-bc64-4796-b23e-c5afded38ea1	\N	2026-03-06T11:25:00.000Z	https://www.tradingview.com/x/DGGCiOmS/	\N	{ca77752e-f6c3-4bd6-bd86-c53234980f57,30c0ce7e-48dc-455f-8e3c-b35f70ea377e,c4f74a70-c7aa-4ccd-882f-452a6f53a069,33b3a6cf-cd92-4753-98db-a15ff12aa382}	{ff9b7896-5390-4dd8-ad58-6b2c0961225d,6104f76b-348d-4662-b8af-ede11c9fee56,b90fe860-438e-4734-93e2-54c4fd99ca6d,63acc3fb-eece-44f9-a459-9f829ae00e1c}	f49d86cc-1d15-4364-a67c-54876f358360
c53d700b-0c51-4758-af4d-f81cf3d6fb19	MES	Long	Break Even	2026-03-09T11:20:00.000Z	1	6711.5	6711.5	0	6688.25	6717.25	6707.75	4d0360d7-0484-460b-abcd-f9e078e4ac03	\N	2026-03-09T11:30:00.000Z	https://www.tradingview.com/x/RC1l6qxT/	\N	{c4f74a70-c7aa-4ccd-882f-452a6f53a069,30c0ce7e-48dc-455f-8e3c-b35f70ea377e,ca77752e-f6c3-4bd6-bd86-c53234980f57,72d1f4c8-d80a-4408-8ac0-1f1795ef18f2}	{630fe785-d8bb-4e56-ae5e-9598af650838,f45c6853-63b3-4ba3-bbac-26df8f89c03d,96cae3ee-4c09-42a1-879f-5d1a1fae8b9a,ed939035-cf8a-4600-8fbf-3dd142887eb5}	f49d86cc-1d15-4364-a67c-54876f358360
d791f44f-82f4-446d-9e57-52612d007f8e	MES	Short	Win	2026-03-11T11:50:00.000Z	3	6763	6756.5	0	6769.5	6766.75	6756.5	d34270bb-bc64-4796-b23e-c5afded38ea1	\N	2026-03-11T11:59:00.000Z	https://www.tradingview.com/x/2M0d32cU/	\N	{ca77752e-f6c3-4bd6-bd86-c53234980f57,30c0ce7e-48dc-455f-8e3c-b35f70ea377e,c4f74a70-c7aa-4ccd-882f-452a6f53a069}	{7361d61a-3859-4599-ad6d-047e1ba050ac,6104f76b-348d-4662-b8af-ede11c9fee56,b90fe860-438e-4734-93e2-54c4fd99ca6d,b36680de-9bc2-4f95-9eaa-ef9c429231b7,63acc3fb-eece-44f9-a459-9f829ae00e1c,4fb1e3f4-e960-4ffb-a203-8dcb1394c2c2}	f49d86cc-1d15-4364-a67c-54876f358360
4fdc7b3b-d240-4ec4-b764-a5523a54bb75	MES	Long	Break Even	2026-03-23T11:20:00.000Z	2	6690	6690	0	6677.5	6698.25	6686.25	d34270bb-bc64-4796-b23e-c5afded38ea1	\N	2026-03-23T11:25:00.000Z	https://www.tradingview.com/x/Ezn41tTj/	\N	{021d2a71-2007-46a9-bba8-7e44336c8503,ca77752e-f6c3-4bd6-bd86-c53234980f57,30c0ce7e-48dc-455f-8e3c-b35f70ea377e,c4f74a70-c7aa-4ccd-882f-452a6f53a069}	{6104f76b-348d-4662-b8af-ede11c9fee56,b9500cb7-24f6-4da3-ad24-abfa43c52213,b90fe860-438e-4734-93e2-54c4fd99ca6d,78dbbf68-7cc6-4c81-839a-5c025bc972d2}	f49d86cc-1d15-4364-a67c-54876f358360
f64b0db3-0ee9-4809-9f36-4d6c45e1018c	MES	Long	Win	2026-03-24T10:10:00.000Z	1	6591.75	6609.75	0	6573.75	6609.75	6590.75	d34270bb-bc64-4796-b23e-c5afded38ea1	\N	2026-03-24T10:25:00.000Z	https://www.tradingview.com/x/KqhS8EoN/	\N	{ca77752e-f6c3-4bd6-bd86-c53234980f57,30c0ce7e-48dc-455f-8e3c-b35f70ea377e,c4f74a70-c7aa-4ccd-882f-452a6f53a069}	{7361d61a-3859-4599-ad6d-047e1ba050ac,78dbbf68-7cc6-4c81-839a-5c025bc972d2,4fb1e3f4-e960-4ffb-a203-8dcb1394c2c2}	f49d86cc-1d15-4364-a67c-54876f358360
\.


--
-- Data for Name: user_settings; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.user_settings (id, max_drawdown, commission_per_unit, created_at, win_threshold, break_even_range, loss_threshold, custom_tag_category_colors, tag_category_color_order, user_id) FROM stdin;
1	3000	1.82	2025-12-27 07:45:09.669983+00	70	15	-50	["#b87070"]	["#ef4444", "#f97316", "#6366f1", "#f59e0b", "#22c55e", "#06b6d4", "#3b82f6", "#10b981", "#8b5cf6", "#a855f7", "#ec4899", "#14b8a6", "#b87070"]	f49d86cc-1d15-4364-a67c-54876f358360
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: realtime; Owner: -
--

COPY realtime.schema_migrations (version, inserted_at) FROM stdin;
20211116024918	2025-12-19 13:05:48
20211116045059	2025-12-19 13:05:49
20211116050929	2025-12-19 13:05:50
20211116051442	2025-12-19 13:05:50
20211116212300	2025-12-19 13:05:51
20211116213355	2025-12-19 13:05:52
20211116213934	2025-12-19 13:05:52
20211116214523	2025-12-19 13:05:53
20211122062447	2025-12-19 13:05:54
20211124070109	2025-12-19 13:05:54
20211202204204	2025-12-19 13:05:55
20211202204605	2025-12-19 13:05:56
20211210212804	2025-12-19 13:05:58
20211228014915	2025-12-19 13:05:58
20220107221237	2025-12-19 13:05:59
20220228202821	2025-12-19 13:05:59
20220312004840	2025-12-19 13:06:00
20220603231003	2025-12-19 13:06:01
20220603232444	2025-12-19 13:06:02
20220615214548	2025-12-19 13:06:02
20220712093339	2025-12-19 13:06:03
20220908172859	2025-12-19 13:06:04
20220916233421	2025-12-19 13:06:04
20230119133233	2025-12-19 13:06:05
20230128025114	2025-12-19 13:06:06
20230128025212	2025-12-19 13:06:06
20230227211149	2025-12-19 13:06:07
20230228184745	2025-12-19 13:06:08
20230308225145	2025-12-19 13:06:08
20230328144023	2025-12-19 13:06:09
20231018144023	2025-12-19 13:06:10
20231204144023	2025-12-19 13:06:11
20231204144024	2025-12-19 13:06:11
20231204144025	2025-12-19 13:06:12
20240108234812	2025-12-19 13:06:12
20240109165339	2025-12-19 13:06:13
20240227174441	2025-12-19 13:06:14
20240311171622	2025-12-19 13:06:15
20240321100241	2025-12-19 13:06:16
20240401105812	2025-12-19 13:06:18
20240418121054	2025-12-19 13:06:19
20240523004032	2025-12-19 13:06:21
20240618124746	2025-12-19 13:06:22
20240801235015	2025-12-19 13:06:23
20240805133720	2025-12-19 13:06:23
20240827160934	2025-12-19 13:06:24
20240919163303	2025-12-19 13:06:25
20240919163305	2025-12-19 13:06:25
20241019105805	2025-12-19 13:06:26
20241030150047	2025-12-19 13:06:28
20241108114728	2025-12-19 13:06:29
20241121104152	2025-12-19 13:06:30
20241130184212	2025-12-19 13:06:31
20241220035512	2025-12-19 13:06:31
20241220123912	2025-12-19 13:06:32
20241224161212	2025-12-19 13:06:32
20250107150512	2025-12-19 13:06:33
20250110162412	2025-12-19 13:06:34
20250123174212	2025-12-19 13:06:34
20250128220012	2025-12-19 13:06:35
20250506224012	2025-12-19 13:06:35
20250523164012	2025-12-19 13:06:36
20250714121412	2025-12-19 13:06:37
20250905041441	2025-12-19 13:06:37
20251103001201	2025-12-19 13:06:38
20251120212548	2026-02-11 13:31:37
20251120215549	2026-02-11 13:31:37
20260218120000	2026-04-04 14:56:18
20260326120000	2026-04-11 14:31:52
\.


--
-- Data for Name: subscription; Type: TABLE DATA; Schema: realtime; Owner: -
--

COPY realtime.subscription (id, subscription_id, entity, filters, claims, created_at, action_filter) FROM stdin;
\.


--
-- Data for Name: buckets; Type: TABLE DATA; Schema: storage; Owner: -
--

COPY storage.buckets (id, name, owner, created_at, updated_at, public, avif_autodetection, file_size_limit, allowed_mime_types, owner_id, type) FROM stdin;
\.


--
-- Data for Name: buckets_analytics; Type: TABLE DATA; Schema: storage; Owner: -
--

COPY storage.buckets_analytics (name, type, format, created_at, updated_at, id, deleted_at) FROM stdin;
\.


--
-- Data for Name: buckets_vectors; Type: TABLE DATA; Schema: storage; Owner: -
--

COPY storage.buckets_vectors (id, type, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: migrations; Type: TABLE DATA; Schema: storage; Owner: -
--

COPY storage.migrations (id, name, hash, executed_at) FROM stdin;
0	create-migrations-table	e18db593bcde2aca2a408c4d1100f6abba2195df	2025-12-19 13:05:47.395636
1	initialmigration	6ab16121fbaa08bbd11b712d05f358f9b555d777	2025-12-19 13:05:47.410267
3	pathtoken-column	2cb1b0004b817b29d5b0a971af16bafeede4b70d	2025-12-19 13:05:47.445971
4	add-migrations-rls	427c5b63fe1c5937495d9c635c263ee7a5905058	2025-12-19 13:05:47.509076
5	add-size-functions	79e081a1455b63666c1294a440f8ad4b1e6a7f84	2025-12-19 13:05:47.513365
7	add-rls-to-buckets	e7e7f86adbc51049f341dfe8d30256c1abca17aa	2025-12-19 13:05:47.521962
8	add-public-to-buckets	fd670db39ed65f9d08b01db09d6202503ca2bab3	2025-12-19 13:05:47.525666
11	add-trigger-to-auto-update-updated_at-column	7425bdb14366d1739fa8a18c83100636d74dcaa2	2025-12-19 13:05:47.538683
12	add-automatic-avif-detection-flag	8e92e1266eb29518b6a4c5313ab8f29dd0d08df9	2025-12-19 13:05:47.544845
13	add-bucket-custom-limits	cce962054138135cd9a8c4bcd531598684b25e7d	2025-12-19 13:05:47.548817
14	use-bytes-for-max-size	941c41b346f9802b411f06f30e972ad4744dad27	2025-12-19 13:05:47.553516
15	add-can-insert-object-function	934146bc38ead475f4ef4b555c524ee5d66799e5	2025-12-19 13:05:47.578095
16	add-version	76debf38d3fd07dcfc747ca49096457d95b1221b	2025-12-19 13:05:47.582158
17	drop-owner-foreign-key	f1cbb288f1b7a4c1eb8c38504b80ae2a0153d101	2025-12-19 13:05:47.586085
18	add_owner_id_column_deprecate_owner	e7a511b379110b08e2f214be852c35414749fe66	2025-12-19 13:05:47.590479
19	alter-default-value-objects-id	02e5e22a78626187e00d173dc45f58fa66a4f043	2025-12-19 13:05:47.595905
20	list-objects-with-delimiter	cd694ae708e51ba82bf012bba00caf4f3b6393b7	2025-12-19 13:05:47.600057
21	s3-multipart-uploads	8c804d4a566c40cd1e4cc5b3725a664a9303657f	2025-12-19 13:05:47.606046
22	s3-multipart-uploads-big-ints	9737dc258d2397953c9953d9b86920b8be0cdb73	2025-12-19 13:05:47.620364
23	optimize-search-function	9d7e604cddc4b56a5422dc68c9313f4a1b6f132c	2025-12-19 13:05:47.634573
24	operation-function	8312e37c2bf9e76bbe841aa5fda889206d2bf8aa	2025-12-19 13:05:47.639745
25	custom-metadata	d974c6057c3db1c1f847afa0e291e6165693b990	2025-12-19 13:05:47.644382
37	add-bucket-name-length-trigger	3944135b4e3e8b22d6d4cbb568fe3b0b51df15c1	2025-12-19 13:05:47.9565
44	vector-bucket-type	99c20c0ffd52bb1ff1f32fb992f3b351e3ef8fb3	2025-12-19 13:05:48.193857
45	vector-buckets	049e27196d77a7cb76497a85afae669d8b230953	2025-12-19 13:05:48.225076
46	buckets-objects-grants	fedeb96d60fefd8e02ab3ded9fbde05632f84aed	2025-12-19 13:05:48.244322
47	iceberg-table-metadata	649df56855c24d8b36dd4cc1aeb8251aa9ad42c2	2025-12-19 13:05:48.24853
49	buckets-objects-grants-postgres	072b1195d0d5a2f888af6b2302a1938dd94b8b3d	2025-12-19 13:05:48.268071
2	storage-schema	f6a1fa2c93cbcd16d4e487b362e45fca157a8dbd	2025-12-19 13:05:47.41377
6	change-column-name-in-get-size	ded78e2f1b5d7e616117897e6443a925965b30d2	2025-12-19 13:05:47.517471
9	fix-search-function	af597a1b590c70519b464a4ab3be54490712796b	2025-12-19 13:05:47.529519
10	search-files-search-function	b595f05e92f7e91211af1bbfe9c6a13bb3391e16	2025-12-19 13:05:47.534574
26	objects-prefixes	215cabcb7f78121892a5a2037a09fedf9a1ae322	2025-12-19 13:05:47.648583
27	search-v2	859ba38092ac96eb3964d83bf53ccc0b141663a6	2025-12-19 13:05:47.661308
28	object-bucket-name-sorting	c73a2b5b5d4041e39705814fd3a1b95502d38ce4	2025-12-19 13:05:47.903189
29	create-prefixes	ad2c1207f76703d11a9f9007f821620017a66c21	2025-12-19 13:05:47.909547
30	update-object-levels	2be814ff05c8252fdfdc7cfb4b7f5c7e17f0bed6	2025-12-19 13:05:47.915687
31	objects-level-index	b40367c14c3440ec75f19bbce2d71e914ddd3da0	2025-12-19 13:05:47.922317
32	backward-compatible-index-on-objects	e0c37182b0f7aee3efd823298fb3c76f1042c0f7	2025-12-19 13:05:47.929101
33	backward-compatible-index-on-prefixes	b480e99ed951e0900f033ec4eb34b5bdcb4e3d49	2025-12-19 13:05:47.936207
34	optimize-search-function-v1	ca80a3dc7bfef894df17108785ce29a7fc8ee456	2025-12-19 13:05:47.937901
35	add-insert-trigger-prefixes	458fe0ffd07ec53f5e3ce9df51bfdf4861929ccc	2025-12-19 13:05:47.943545
36	optimise-existing-functions	6ae5fca6af5c55abe95369cd4f93985d1814ca8f	2025-12-19 13:05:47.94922
38	iceberg-catalog-flag-on-buckets	02716b81ceec9705aed84aa1501657095b32e5c5	2025-12-19 13:05:47.961265
39	add-search-v2-sort-support	6706c5f2928846abee18461279799ad12b279b78	2025-12-19 13:05:47.971174
40	fix-prefix-race-conditions-optimized	7ad69982ae2d372b21f48fc4829ae9752c518f6b	2025-12-19 13:05:47.976022
41	add-object-level-update-trigger	07fcf1a22165849b7a029deed059ffcde08d1ae0	2025-12-19 13:05:47.983903
42	rollback-prefix-triggers	771479077764adc09e2ea2043eb627503c034cd4	2025-12-19 13:05:47.988698
43	fix-object-level	84b35d6caca9d937478ad8a797491f38b8c2979f	2025-12-19 13:05:48.043596
48	iceberg-catalog-ids	e0e8b460c609b9999ccd0df9ad14294613eed939	2025-12-19 13:05:48.251971
50	search-v2-optimised	6323ac4f850aa14e7387eb32102869578b5bd478	2026-02-11 13:31:34.348229
51	index-backward-compatible-search	2ee395d433f76e38bcd3856debaf6e0e5b674011	2026-02-11 13:31:34.397285
52	drop-not-used-indexes-and-functions	5cc44c8696749ac11dd0dc37f2a3802075f3a171	2026-02-11 13:31:34.398804
53	drop-index-lower-name	d0cb18777d9e2a98ebe0bc5cc7a42e57ebe41854	2026-02-11 13:31:34.454894
54	drop-index-object-level	6289e048b1472da17c31a7eba1ded625a6457e67	2026-02-11 13:31:34.458045
55	prevent-direct-deletes	262a4798d5e0f2e7c8970232e03ce8be695d5819	2026-02-11 13:31:34.460318
56	fix-optimized-search-function	cb58526ebc23048049fd5bf2fd148d18b04a2073	2026-02-11 13:31:34.467085
57	s3-multipart-uploads-metadata	f127886e00d1b374fadbc7c6b31e09336aad5287	2026-04-06 22:39:10.08339
58	operation-ergonomics	00ca5d483b3fe0d522133d9002ccc5df98365120	2026-04-06 22:39:10.099174
\.


--
-- Data for Name: objects; Type: TABLE DATA; Schema: storage; Owner: -
--

COPY storage.objects (id, bucket_id, name, owner, created_at, updated_at, last_accessed_at, metadata, version, owner_id, user_metadata) FROM stdin;
\.


--
-- Data for Name: s3_multipart_uploads; Type: TABLE DATA; Schema: storage; Owner: -
--

COPY storage.s3_multipart_uploads (id, in_progress_size, upload_signature, bucket_id, key, version, owner_id, created_at, user_metadata, metadata) FROM stdin;
\.


--
-- Data for Name: s3_multipart_uploads_parts; Type: TABLE DATA; Schema: storage; Owner: -
--

COPY storage.s3_multipart_uploads_parts (id, upload_id, size, part_number, bucket_id, key, etag, owner_id, version, created_at) FROM stdin;
\.


--
-- Data for Name: vector_indexes; Type: TABLE DATA; Schema: storage; Owner: -
--

COPY storage.vector_indexes (id, name, bucket_id, data_type, dimension, distance_metric, metadata_configuration, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: secrets; Type: TABLE DATA; Schema: vault; Owner: -
--

COPY vault.secrets (id, name, description, secret, key_id, nonce, created_at, updated_at) FROM stdin;
\.


--
-- Name: refresh_tokens_id_seq; Type: SEQUENCE SET; Schema: auth; Owner: -
--

SELECT pg_catalog.setval('auth.refresh_tokens_id_seq', 67, true);


--
-- Name: jobid_seq; Type: SEQUENCE SET; Schema: cron; Owner: -
--

SELECT pg_catalog.setval('cron.jobid_seq', 2, true);


--
-- Name: runid_seq; Type: SEQUENCE SET; Schema: cron; Owner: -
--

SELECT pg_catalog.setval('cron.runid_seq', 30, true);


--
-- Name: user_settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.user_settings_id_seq', 295, true);


--
-- Name: subscription_id_seq; Type: SEQUENCE SET; Schema: realtime; Owner: -
--

SELECT pg_catalog.setval('realtime.subscription_id_seq', 1, false);


--
-- Name: mfa_amr_claims amr_id_pk; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.mfa_amr_claims
    ADD CONSTRAINT amr_id_pk PRIMARY KEY (id);


--
-- Name: audit_log_entries audit_log_entries_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.audit_log_entries
    ADD CONSTRAINT audit_log_entries_pkey PRIMARY KEY (id);


--
-- Name: custom_oauth_providers custom_oauth_providers_identifier_key; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.custom_oauth_providers
    ADD CONSTRAINT custom_oauth_providers_identifier_key UNIQUE (identifier);


--
-- Name: custom_oauth_providers custom_oauth_providers_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.custom_oauth_providers
    ADD CONSTRAINT custom_oauth_providers_pkey PRIMARY KEY (id);


--
-- Name: flow_state flow_state_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.flow_state
    ADD CONSTRAINT flow_state_pkey PRIMARY KEY (id);


--
-- Name: identities identities_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.identities
    ADD CONSTRAINT identities_pkey PRIMARY KEY (id);


--
-- Name: identities identities_provider_id_provider_unique; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.identities
    ADD CONSTRAINT identities_provider_id_provider_unique UNIQUE (provider_id, provider);


--
-- Name: instances instances_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.instances
    ADD CONSTRAINT instances_pkey PRIMARY KEY (id);


--
-- Name: mfa_amr_claims mfa_amr_claims_session_id_authentication_method_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.mfa_amr_claims
    ADD CONSTRAINT mfa_amr_claims_session_id_authentication_method_pkey UNIQUE (session_id, authentication_method);


--
-- Name: mfa_challenges mfa_challenges_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.mfa_challenges
    ADD CONSTRAINT mfa_challenges_pkey PRIMARY KEY (id);


--
-- Name: mfa_factors mfa_factors_last_challenged_at_key; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.mfa_factors
    ADD CONSTRAINT mfa_factors_last_challenged_at_key UNIQUE (last_challenged_at);


--
-- Name: mfa_factors mfa_factors_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.mfa_factors
    ADD CONSTRAINT mfa_factors_pkey PRIMARY KEY (id);


--
-- Name: oauth_authorizations oauth_authorizations_authorization_code_key; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.oauth_authorizations
    ADD CONSTRAINT oauth_authorizations_authorization_code_key UNIQUE (authorization_code);


--
-- Name: oauth_authorizations oauth_authorizations_authorization_id_key; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.oauth_authorizations
    ADD CONSTRAINT oauth_authorizations_authorization_id_key UNIQUE (authorization_id);


--
-- Name: oauth_authorizations oauth_authorizations_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.oauth_authorizations
    ADD CONSTRAINT oauth_authorizations_pkey PRIMARY KEY (id);


--
-- Name: oauth_client_states oauth_client_states_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.oauth_client_states
    ADD CONSTRAINT oauth_client_states_pkey PRIMARY KEY (id);


--
-- Name: oauth_clients oauth_clients_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.oauth_clients
    ADD CONSTRAINT oauth_clients_pkey PRIMARY KEY (id);


--
-- Name: oauth_consents oauth_consents_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.oauth_consents
    ADD CONSTRAINT oauth_consents_pkey PRIMARY KEY (id);


--
-- Name: oauth_consents oauth_consents_user_client_unique; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.oauth_consents
    ADD CONSTRAINT oauth_consents_user_client_unique UNIQUE (user_id, client_id);


--
-- Name: one_time_tokens one_time_tokens_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.one_time_tokens
    ADD CONSTRAINT one_time_tokens_pkey PRIMARY KEY (id);


--
-- Name: refresh_tokens refresh_tokens_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.refresh_tokens
    ADD CONSTRAINT refresh_tokens_pkey PRIMARY KEY (id);


--
-- Name: refresh_tokens refresh_tokens_token_unique; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.refresh_tokens
    ADD CONSTRAINT refresh_tokens_token_unique UNIQUE (token);


--
-- Name: saml_providers saml_providers_entity_id_key; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.saml_providers
    ADD CONSTRAINT saml_providers_entity_id_key UNIQUE (entity_id);


--
-- Name: saml_providers saml_providers_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.saml_providers
    ADD CONSTRAINT saml_providers_pkey PRIMARY KEY (id);


--
-- Name: saml_relay_states saml_relay_states_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.saml_relay_states
    ADD CONSTRAINT saml_relay_states_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- Name: sso_domains sso_domains_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.sso_domains
    ADD CONSTRAINT sso_domains_pkey PRIMARY KEY (id);


--
-- Name: sso_providers sso_providers_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.sso_providers
    ADD CONSTRAINT sso_providers_pkey PRIMARY KEY (id);


--
-- Name: users users_phone_key; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.users
    ADD CONSTRAINT users_phone_key UNIQUE (phone);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: webauthn_challenges webauthn_challenges_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.webauthn_challenges
    ADD CONSTRAINT webauthn_challenges_pkey PRIMARY KEY (id);


--
-- Name: webauthn_credentials webauthn_credentials_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.webauthn_credentials
    ADD CONSTRAINT webauthn_credentials_pkey PRIMARY KEY (id);


--
-- Name: tag_categories bag_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tag_categories
    ADD CONSTRAINT bag_categories_pkey PRIMARY KEY (id);


--
-- Name: tags bag_items_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tags
    ADD CONSTRAINT bag_items_pkey PRIMARY KEY (id);


--
-- Name: keep_alive keep_alive_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.keep_alive
    ADD CONSTRAINT keep_alive_pkey PRIMARY KEY (id);


--
-- Name: strategies strategies_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strategies
    ADD CONSTRAINT strategies_pkey PRIMARY KEY (id);


--
-- Name: trades trades_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.trades
    ADD CONSTRAINT trades_pkey PRIMARY KEY (id);


--
-- Name: user_settings user_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_settings
    ADD CONSTRAINT user_settings_pkey PRIMARY KEY (id);


--
-- Name: messages messages_pkey; Type: CONSTRAINT; Schema: realtime; Owner: -
--

ALTER TABLE ONLY realtime.messages
    ADD CONSTRAINT messages_pkey PRIMARY KEY (id, inserted_at);


--
-- Name: subscription pk_subscription; Type: CONSTRAINT; Schema: realtime; Owner: -
--

ALTER TABLE ONLY realtime.subscription
    ADD CONSTRAINT pk_subscription PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: realtime; Owner: -
--

ALTER TABLE ONLY realtime.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: buckets_analytics buckets_analytics_pkey; Type: CONSTRAINT; Schema: storage; Owner: -
--

ALTER TABLE ONLY storage.buckets_analytics
    ADD CONSTRAINT buckets_analytics_pkey PRIMARY KEY (id);


--
-- Name: buckets buckets_pkey; Type: CONSTRAINT; Schema: storage; Owner: -
--

ALTER TABLE ONLY storage.buckets
    ADD CONSTRAINT buckets_pkey PRIMARY KEY (id);


--
-- Name: buckets_vectors buckets_vectors_pkey; Type: CONSTRAINT; Schema: storage; Owner: -
--

ALTER TABLE ONLY storage.buckets_vectors
    ADD CONSTRAINT buckets_vectors_pkey PRIMARY KEY (id);


--
-- Name: migrations migrations_name_key; Type: CONSTRAINT; Schema: storage; Owner: -
--

ALTER TABLE ONLY storage.migrations
    ADD CONSTRAINT migrations_name_key UNIQUE (name);


--
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: storage; Owner: -
--

ALTER TABLE ONLY storage.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);


--
-- Name: objects objects_pkey; Type: CONSTRAINT; Schema: storage; Owner: -
--

ALTER TABLE ONLY storage.objects
    ADD CONSTRAINT objects_pkey PRIMARY KEY (id);


--
-- Name: s3_multipart_uploads_parts s3_multipart_uploads_parts_pkey; Type: CONSTRAINT; Schema: storage; Owner: -
--

ALTER TABLE ONLY storage.s3_multipart_uploads_parts
    ADD CONSTRAINT s3_multipart_uploads_parts_pkey PRIMARY KEY (id);


--
-- Name: s3_multipart_uploads s3_multipart_uploads_pkey; Type: CONSTRAINT; Schema: storage; Owner: -
--

ALTER TABLE ONLY storage.s3_multipart_uploads
    ADD CONSTRAINT s3_multipart_uploads_pkey PRIMARY KEY (id);


--
-- Name: vector_indexes vector_indexes_pkey; Type: CONSTRAINT; Schema: storage; Owner: -
--

ALTER TABLE ONLY storage.vector_indexes
    ADD CONSTRAINT vector_indexes_pkey PRIMARY KEY (id);


--
-- Name: audit_logs_instance_id_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX audit_logs_instance_id_idx ON auth.audit_log_entries USING btree (instance_id);


--
-- Name: confirmation_token_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE UNIQUE INDEX confirmation_token_idx ON auth.users USING btree (confirmation_token) WHERE ((confirmation_token)::text !~ '^[0-9 ]*$'::text);


--
-- Name: custom_oauth_providers_created_at_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX custom_oauth_providers_created_at_idx ON auth.custom_oauth_providers USING btree (created_at);


--
-- Name: custom_oauth_providers_enabled_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX custom_oauth_providers_enabled_idx ON auth.custom_oauth_providers USING btree (enabled);


--
-- Name: custom_oauth_providers_identifier_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX custom_oauth_providers_identifier_idx ON auth.custom_oauth_providers USING btree (identifier);


--
-- Name: custom_oauth_providers_provider_type_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX custom_oauth_providers_provider_type_idx ON auth.custom_oauth_providers USING btree (provider_type);


--
-- Name: email_change_token_current_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE UNIQUE INDEX email_change_token_current_idx ON auth.users USING btree (email_change_token_current) WHERE ((email_change_token_current)::text !~ '^[0-9 ]*$'::text);


--
-- Name: email_change_token_new_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE UNIQUE INDEX email_change_token_new_idx ON auth.users USING btree (email_change_token_new) WHERE ((email_change_token_new)::text !~ '^[0-9 ]*$'::text);


--
-- Name: factor_id_created_at_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX factor_id_created_at_idx ON auth.mfa_factors USING btree (user_id, created_at);


--
-- Name: flow_state_created_at_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX flow_state_created_at_idx ON auth.flow_state USING btree (created_at DESC);


--
-- Name: identities_email_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX identities_email_idx ON auth.identities USING btree (email text_pattern_ops);


--
-- Name: INDEX identities_email_idx; Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON INDEX auth.identities_email_idx IS 'Auth: Ensures indexed queries on the email column';


--
-- Name: identities_user_id_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX identities_user_id_idx ON auth.identities USING btree (user_id);


--
-- Name: idx_auth_code; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX idx_auth_code ON auth.flow_state USING btree (auth_code);


--
-- Name: idx_oauth_client_states_created_at; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX idx_oauth_client_states_created_at ON auth.oauth_client_states USING btree (created_at);


--
-- Name: idx_user_id_auth_method; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX idx_user_id_auth_method ON auth.flow_state USING btree (user_id, authentication_method);


--
-- Name: mfa_challenge_created_at_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX mfa_challenge_created_at_idx ON auth.mfa_challenges USING btree (created_at DESC);


--
-- Name: mfa_factors_user_friendly_name_unique; Type: INDEX; Schema: auth; Owner: -
--

CREATE UNIQUE INDEX mfa_factors_user_friendly_name_unique ON auth.mfa_factors USING btree (friendly_name, user_id) WHERE (TRIM(BOTH FROM friendly_name) <> ''::text);


--
-- Name: mfa_factors_user_id_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX mfa_factors_user_id_idx ON auth.mfa_factors USING btree (user_id);


--
-- Name: oauth_auth_pending_exp_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX oauth_auth_pending_exp_idx ON auth.oauth_authorizations USING btree (expires_at) WHERE (status = 'pending'::auth.oauth_authorization_status);


--
-- Name: oauth_clients_deleted_at_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX oauth_clients_deleted_at_idx ON auth.oauth_clients USING btree (deleted_at);


--
-- Name: oauth_consents_active_client_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX oauth_consents_active_client_idx ON auth.oauth_consents USING btree (client_id) WHERE (revoked_at IS NULL);


--
-- Name: oauth_consents_active_user_client_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX oauth_consents_active_user_client_idx ON auth.oauth_consents USING btree (user_id, client_id) WHERE (revoked_at IS NULL);


--
-- Name: oauth_consents_user_order_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX oauth_consents_user_order_idx ON auth.oauth_consents USING btree (user_id, granted_at DESC);


--
-- Name: one_time_tokens_relates_to_hash_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX one_time_tokens_relates_to_hash_idx ON auth.one_time_tokens USING hash (relates_to);


--
-- Name: one_time_tokens_token_hash_hash_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX one_time_tokens_token_hash_hash_idx ON auth.one_time_tokens USING hash (token_hash);


--
-- Name: one_time_tokens_user_id_token_type_key; Type: INDEX; Schema: auth; Owner: -
--

CREATE UNIQUE INDEX one_time_tokens_user_id_token_type_key ON auth.one_time_tokens USING btree (user_id, token_type);


--
-- Name: reauthentication_token_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE UNIQUE INDEX reauthentication_token_idx ON auth.users USING btree (reauthentication_token) WHERE ((reauthentication_token)::text !~ '^[0-9 ]*$'::text);


--
-- Name: recovery_token_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE UNIQUE INDEX recovery_token_idx ON auth.users USING btree (recovery_token) WHERE ((recovery_token)::text !~ '^[0-9 ]*$'::text);


--
-- Name: refresh_tokens_instance_id_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX refresh_tokens_instance_id_idx ON auth.refresh_tokens USING btree (instance_id);


--
-- Name: refresh_tokens_instance_id_user_id_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX refresh_tokens_instance_id_user_id_idx ON auth.refresh_tokens USING btree (instance_id, user_id);


--
-- Name: refresh_tokens_parent_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX refresh_tokens_parent_idx ON auth.refresh_tokens USING btree (parent);


--
-- Name: refresh_tokens_session_id_revoked_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX refresh_tokens_session_id_revoked_idx ON auth.refresh_tokens USING btree (session_id, revoked);


--
-- Name: refresh_tokens_updated_at_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX refresh_tokens_updated_at_idx ON auth.refresh_tokens USING btree (updated_at DESC);


--
-- Name: saml_providers_sso_provider_id_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX saml_providers_sso_provider_id_idx ON auth.saml_providers USING btree (sso_provider_id);


--
-- Name: saml_relay_states_created_at_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX saml_relay_states_created_at_idx ON auth.saml_relay_states USING btree (created_at DESC);


--
-- Name: saml_relay_states_for_email_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX saml_relay_states_for_email_idx ON auth.saml_relay_states USING btree (for_email);


--
-- Name: saml_relay_states_sso_provider_id_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX saml_relay_states_sso_provider_id_idx ON auth.saml_relay_states USING btree (sso_provider_id);


--
-- Name: sessions_not_after_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX sessions_not_after_idx ON auth.sessions USING btree (not_after DESC);


--
-- Name: sessions_oauth_client_id_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX sessions_oauth_client_id_idx ON auth.sessions USING btree (oauth_client_id);


--
-- Name: sessions_user_id_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX sessions_user_id_idx ON auth.sessions USING btree (user_id);


--
-- Name: sso_domains_domain_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE UNIQUE INDEX sso_domains_domain_idx ON auth.sso_domains USING btree (lower(domain));


--
-- Name: sso_domains_sso_provider_id_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX sso_domains_sso_provider_id_idx ON auth.sso_domains USING btree (sso_provider_id);


--
-- Name: sso_providers_resource_id_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE UNIQUE INDEX sso_providers_resource_id_idx ON auth.sso_providers USING btree (lower(resource_id));


--
-- Name: sso_providers_resource_id_pattern_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX sso_providers_resource_id_pattern_idx ON auth.sso_providers USING btree (resource_id text_pattern_ops);


--
-- Name: unique_phone_factor_per_user; Type: INDEX; Schema: auth; Owner: -
--

CREATE UNIQUE INDEX unique_phone_factor_per_user ON auth.mfa_factors USING btree (user_id, phone);


--
-- Name: user_id_created_at_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX user_id_created_at_idx ON auth.sessions USING btree (user_id, created_at);


--
-- Name: users_email_partial_key; Type: INDEX; Schema: auth; Owner: -
--

CREATE UNIQUE INDEX users_email_partial_key ON auth.users USING btree (email) WHERE (is_sso_user = false);


--
-- Name: INDEX users_email_partial_key; Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON INDEX auth.users_email_partial_key IS 'Auth: A partial unique index that applies only when is_sso_user is false';


--
-- Name: users_instance_id_email_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX users_instance_id_email_idx ON auth.users USING btree (instance_id, lower((email)::text));


--
-- Name: users_instance_id_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX users_instance_id_idx ON auth.users USING btree (instance_id);


--
-- Name: users_is_anonymous_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX users_is_anonymous_idx ON auth.users USING btree (is_anonymous);


--
-- Name: webauthn_challenges_expires_at_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX webauthn_challenges_expires_at_idx ON auth.webauthn_challenges USING btree (expires_at);


--
-- Name: webauthn_challenges_user_id_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX webauthn_challenges_user_id_idx ON auth.webauthn_challenges USING btree (user_id);


--
-- Name: webauthn_credentials_credential_id_key; Type: INDEX; Schema: auth; Owner: -
--

CREATE UNIQUE INDEX webauthn_credentials_credential_id_key ON auth.webauthn_credentials USING btree (credential_id);


--
-- Name: webauthn_credentials_user_id_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX webauthn_credentials_user_id_idx ON auth.webauthn_credentials USING btree (user_id);


--
-- Name: strategies_user_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX strategies_user_id_idx ON public.strategies USING btree (user_id);


--
-- Name: tag_categories_user_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX tag_categories_user_id_idx ON public.tag_categories USING btree (user_id);


--
-- Name: tags_user_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX tags_user_id_idx ON public.tags USING btree (user_id);


--
-- Name: trades_user_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX trades_user_id_idx ON public.trades USING btree (user_id);


--
-- Name: user_settings_user_id_key; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX user_settings_user_id_key ON public.user_settings USING btree (user_id);


--
-- Name: ix_realtime_subscription_entity; Type: INDEX; Schema: realtime; Owner: -
--

CREATE INDEX ix_realtime_subscription_entity ON realtime.subscription USING btree (entity);


--
-- Name: messages_inserted_at_topic_index; Type: INDEX; Schema: realtime; Owner: -
--

CREATE INDEX messages_inserted_at_topic_index ON ONLY realtime.messages USING btree (inserted_at DESC, topic) WHERE ((extension = 'broadcast'::text) AND (private IS TRUE));


--
-- Name: subscription_subscription_id_entity_filters_action_filter_key; Type: INDEX; Schema: realtime; Owner: -
--

CREATE UNIQUE INDEX subscription_subscription_id_entity_filters_action_filter_key ON realtime.subscription USING btree (subscription_id, entity, filters, action_filter);


--
-- Name: bname; Type: INDEX; Schema: storage; Owner: -
--

CREATE UNIQUE INDEX bname ON storage.buckets USING btree (name);


--
-- Name: bucketid_objname; Type: INDEX; Schema: storage; Owner: -
--

CREATE UNIQUE INDEX bucketid_objname ON storage.objects USING btree (bucket_id, name);


--
-- Name: buckets_analytics_unique_name_idx; Type: INDEX; Schema: storage; Owner: -
--

CREATE UNIQUE INDEX buckets_analytics_unique_name_idx ON storage.buckets_analytics USING btree (name) WHERE (deleted_at IS NULL);


--
-- Name: idx_multipart_uploads_list; Type: INDEX; Schema: storage; Owner: -
--

CREATE INDEX idx_multipart_uploads_list ON storage.s3_multipart_uploads USING btree (bucket_id, key, created_at);


--
-- Name: idx_objects_bucket_id_name; Type: INDEX; Schema: storage; Owner: -
--

CREATE INDEX idx_objects_bucket_id_name ON storage.objects USING btree (bucket_id, name COLLATE "C");


--
-- Name: idx_objects_bucket_id_name_lower; Type: INDEX; Schema: storage; Owner: -
--

CREATE INDEX idx_objects_bucket_id_name_lower ON storage.objects USING btree (bucket_id, lower(name) COLLATE "C");


--
-- Name: name_prefix_search; Type: INDEX; Schema: storage; Owner: -
--

CREATE INDEX name_prefix_search ON storage.objects USING btree (name text_pattern_ops);


--
-- Name: vector_indexes_name_bucket_id_idx; Type: INDEX; Schema: storage; Owner: -
--

CREATE UNIQUE INDEX vector_indexes_name_bucket_id_idx ON storage.vector_indexes USING btree (name, bucket_id);


--
-- Name: subscription tr_check_filters; Type: TRIGGER; Schema: realtime; Owner: -
--

CREATE TRIGGER tr_check_filters BEFORE INSERT OR UPDATE ON realtime.subscription FOR EACH ROW EXECUTE FUNCTION realtime.subscription_check_filters();


--
-- Name: buckets enforce_bucket_name_length_trigger; Type: TRIGGER; Schema: storage; Owner: -
--

CREATE TRIGGER enforce_bucket_name_length_trigger BEFORE INSERT OR UPDATE OF name ON storage.buckets FOR EACH ROW EXECUTE FUNCTION storage.enforce_bucket_name_length();


--
-- Name: buckets protect_buckets_delete; Type: TRIGGER; Schema: storage; Owner: -
--

CREATE TRIGGER protect_buckets_delete BEFORE DELETE ON storage.buckets FOR EACH STATEMENT EXECUTE FUNCTION storage.protect_delete();


--
-- Name: objects protect_objects_delete; Type: TRIGGER; Schema: storage; Owner: -
--

CREATE TRIGGER protect_objects_delete BEFORE DELETE ON storage.objects FOR EACH STATEMENT EXECUTE FUNCTION storage.protect_delete();


--
-- Name: objects update_objects_updated_at; Type: TRIGGER; Schema: storage; Owner: -
--

CREATE TRIGGER update_objects_updated_at BEFORE UPDATE ON storage.objects FOR EACH ROW EXECUTE FUNCTION storage.update_updated_at_column();


--
-- Name: identities identities_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.identities
    ADD CONSTRAINT identities_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: mfa_amr_claims mfa_amr_claims_session_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.mfa_amr_claims
    ADD CONSTRAINT mfa_amr_claims_session_id_fkey FOREIGN KEY (session_id) REFERENCES auth.sessions(id) ON DELETE CASCADE;


--
-- Name: mfa_challenges mfa_challenges_auth_factor_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.mfa_challenges
    ADD CONSTRAINT mfa_challenges_auth_factor_id_fkey FOREIGN KEY (factor_id) REFERENCES auth.mfa_factors(id) ON DELETE CASCADE;


--
-- Name: mfa_factors mfa_factors_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.mfa_factors
    ADD CONSTRAINT mfa_factors_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: oauth_authorizations oauth_authorizations_client_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.oauth_authorizations
    ADD CONSTRAINT oauth_authorizations_client_id_fkey FOREIGN KEY (client_id) REFERENCES auth.oauth_clients(id) ON DELETE CASCADE;


--
-- Name: oauth_authorizations oauth_authorizations_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.oauth_authorizations
    ADD CONSTRAINT oauth_authorizations_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: oauth_consents oauth_consents_client_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.oauth_consents
    ADD CONSTRAINT oauth_consents_client_id_fkey FOREIGN KEY (client_id) REFERENCES auth.oauth_clients(id) ON DELETE CASCADE;


--
-- Name: oauth_consents oauth_consents_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.oauth_consents
    ADD CONSTRAINT oauth_consents_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: one_time_tokens one_time_tokens_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.one_time_tokens
    ADD CONSTRAINT one_time_tokens_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: refresh_tokens refresh_tokens_session_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.refresh_tokens
    ADD CONSTRAINT refresh_tokens_session_id_fkey FOREIGN KEY (session_id) REFERENCES auth.sessions(id) ON DELETE CASCADE;


--
-- Name: saml_providers saml_providers_sso_provider_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.saml_providers
    ADD CONSTRAINT saml_providers_sso_provider_id_fkey FOREIGN KEY (sso_provider_id) REFERENCES auth.sso_providers(id) ON DELETE CASCADE;


--
-- Name: saml_relay_states saml_relay_states_flow_state_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.saml_relay_states
    ADD CONSTRAINT saml_relay_states_flow_state_id_fkey FOREIGN KEY (flow_state_id) REFERENCES auth.flow_state(id) ON DELETE CASCADE;


--
-- Name: saml_relay_states saml_relay_states_sso_provider_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.saml_relay_states
    ADD CONSTRAINT saml_relay_states_sso_provider_id_fkey FOREIGN KEY (sso_provider_id) REFERENCES auth.sso_providers(id) ON DELETE CASCADE;


--
-- Name: sessions sessions_oauth_client_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.sessions
    ADD CONSTRAINT sessions_oauth_client_id_fkey FOREIGN KEY (oauth_client_id) REFERENCES auth.oauth_clients(id) ON DELETE CASCADE;


--
-- Name: sessions sessions_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.sessions
    ADD CONSTRAINT sessions_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: sso_domains sso_domains_sso_provider_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.sso_domains
    ADD CONSTRAINT sso_domains_sso_provider_id_fkey FOREIGN KEY (sso_provider_id) REFERENCES auth.sso_providers(id) ON DELETE CASCADE;


--
-- Name: webauthn_challenges webauthn_challenges_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.webauthn_challenges
    ADD CONSTRAINT webauthn_challenges_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: webauthn_credentials webauthn_credentials_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.webauthn_credentials
    ADD CONSTRAINT webauthn_credentials_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: tags bag_items_category_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tags
    ADD CONSTRAINT bag_items_category_id_fkey FOREIGN KEY (category_id) REFERENCES public.tag_categories(id) ON DELETE CASCADE;


--
-- Name: strategies strategies_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strategies
    ADD CONSTRAINT strategies_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id);


--
-- Name: tag_categories tag_categories_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tag_categories
    ADD CONSTRAINT tag_categories_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id);


--
-- Name: tags tags_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tags
    ADD CONSTRAINT tags_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id);


--
-- Name: trades trades_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.trades
    ADD CONSTRAINT trades_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id);


--
-- Name: user_settings user_settings_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_settings
    ADD CONSTRAINT user_settings_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id);


--
-- Name: objects objects_bucketId_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: -
--

ALTER TABLE ONLY storage.objects
    ADD CONSTRAINT "objects_bucketId_fkey" FOREIGN KEY (bucket_id) REFERENCES storage.buckets(id);


--
-- Name: s3_multipart_uploads s3_multipart_uploads_bucket_id_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: -
--

ALTER TABLE ONLY storage.s3_multipart_uploads
    ADD CONSTRAINT s3_multipart_uploads_bucket_id_fkey FOREIGN KEY (bucket_id) REFERENCES storage.buckets(id);


--
-- Name: s3_multipart_uploads_parts s3_multipart_uploads_parts_bucket_id_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: -
--

ALTER TABLE ONLY storage.s3_multipart_uploads_parts
    ADD CONSTRAINT s3_multipart_uploads_parts_bucket_id_fkey FOREIGN KEY (bucket_id) REFERENCES storage.buckets(id);


--
-- Name: s3_multipart_uploads_parts s3_multipart_uploads_parts_upload_id_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: -
--

ALTER TABLE ONLY storage.s3_multipart_uploads_parts
    ADD CONSTRAINT s3_multipart_uploads_parts_upload_id_fkey FOREIGN KEY (upload_id) REFERENCES storage.s3_multipart_uploads(id) ON DELETE CASCADE;


--
-- Name: vector_indexes vector_indexes_bucket_id_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: -
--

ALTER TABLE ONLY storage.vector_indexes
    ADD CONSTRAINT vector_indexes_bucket_id_fkey FOREIGN KEY (bucket_id) REFERENCES storage.buckets_vectors(id);


--
-- Name: audit_log_entries; Type: ROW SECURITY; Schema: auth; Owner: -
--

ALTER TABLE auth.audit_log_entries ENABLE ROW LEVEL SECURITY;

--
-- Name: flow_state; Type: ROW SECURITY; Schema: auth; Owner: -
--

ALTER TABLE auth.flow_state ENABLE ROW LEVEL SECURITY;

--
-- Name: identities; Type: ROW SECURITY; Schema: auth; Owner: -
--

ALTER TABLE auth.identities ENABLE ROW LEVEL SECURITY;

--
-- Name: instances; Type: ROW SECURITY; Schema: auth; Owner: -
--

ALTER TABLE auth.instances ENABLE ROW LEVEL SECURITY;

--
-- Name: mfa_amr_claims; Type: ROW SECURITY; Schema: auth; Owner: -
--

ALTER TABLE auth.mfa_amr_claims ENABLE ROW LEVEL SECURITY;

--
-- Name: mfa_challenges; Type: ROW SECURITY; Schema: auth; Owner: -
--

ALTER TABLE auth.mfa_challenges ENABLE ROW LEVEL SECURITY;

--
-- Name: mfa_factors; Type: ROW SECURITY; Schema: auth; Owner: -
--

ALTER TABLE auth.mfa_factors ENABLE ROW LEVEL SECURITY;

--
-- Name: one_time_tokens; Type: ROW SECURITY; Schema: auth; Owner: -
--

ALTER TABLE auth.one_time_tokens ENABLE ROW LEVEL SECURITY;

--
-- Name: refresh_tokens; Type: ROW SECURITY; Schema: auth; Owner: -
--

ALTER TABLE auth.refresh_tokens ENABLE ROW LEVEL SECURITY;

--
-- Name: saml_providers; Type: ROW SECURITY; Schema: auth; Owner: -
--

ALTER TABLE auth.saml_providers ENABLE ROW LEVEL SECURITY;

--
-- Name: saml_relay_states; Type: ROW SECURITY; Schema: auth; Owner: -
--

ALTER TABLE auth.saml_relay_states ENABLE ROW LEVEL SECURITY;

--
-- Name: schema_migrations; Type: ROW SECURITY; Schema: auth; Owner: -
--

ALTER TABLE auth.schema_migrations ENABLE ROW LEVEL SECURITY;

--
-- Name: sessions; Type: ROW SECURITY; Schema: auth; Owner: -
--

ALTER TABLE auth.sessions ENABLE ROW LEVEL SECURITY;

--
-- Name: sso_domains; Type: ROW SECURITY; Schema: auth; Owner: -
--

ALTER TABLE auth.sso_domains ENABLE ROW LEVEL SECURITY;

--
-- Name: sso_providers; Type: ROW SECURITY; Schema: auth; Owner: -
--

ALTER TABLE auth.sso_providers ENABLE ROW LEVEL SECURITY;

--
-- Name: users; Type: ROW SECURITY; Schema: auth; Owner: -
--

ALTER TABLE auth.users ENABLE ROW LEVEL SECURITY;

--
-- Name: user_settings Allow public access; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Allow public access" ON public.user_settings USING (true) WITH CHECK (true);


--
-- Name: keep_alive; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.keep_alive ENABLE ROW LEVEL SECURITY;

--
-- Name: strategies; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.strategies ENABLE ROW LEVEL SECURITY;

--
-- Name: strategies strategies_delete_own; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY strategies_delete_own ON public.strategies FOR DELETE USING ((auth.uid() = user_id));


--
-- Name: strategies strategies_insert_own; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY strategies_insert_own ON public.strategies FOR INSERT WITH CHECK ((auth.uid() = user_id));


--
-- Name: strategies strategies_select_own; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY strategies_select_own ON public.strategies FOR SELECT USING ((auth.uid() = user_id));


--
-- Name: strategies strategies_update_own; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY strategies_update_own ON public.strategies FOR UPDATE USING ((auth.uid() = user_id)) WITH CHECK ((auth.uid() = user_id));


--
-- Name: tag_categories; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.tag_categories ENABLE ROW LEVEL SECURITY;

--
-- Name: tag_categories tag_categories_delete_own; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY tag_categories_delete_own ON public.tag_categories FOR DELETE USING ((auth.uid() = user_id));


--
-- Name: tag_categories tag_categories_insert_own; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY tag_categories_insert_own ON public.tag_categories FOR INSERT WITH CHECK ((auth.uid() = user_id));


--
-- Name: tag_categories tag_categories_select_own; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY tag_categories_select_own ON public.tag_categories FOR SELECT USING ((auth.uid() = user_id));


--
-- Name: tag_categories tag_categories_update_own; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY tag_categories_update_own ON public.tag_categories FOR UPDATE USING ((auth.uid() = user_id)) WITH CHECK ((auth.uid() = user_id));


--
-- Name: tags; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.tags ENABLE ROW LEVEL SECURITY;

--
-- Name: tags tags_delete_own; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY tags_delete_own ON public.tags FOR DELETE USING ((auth.uid() = user_id));


--
-- Name: tags tags_insert_own; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY tags_insert_own ON public.tags FOR INSERT WITH CHECK ((auth.uid() = user_id));


--
-- Name: tags tags_select_own; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY tags_select_own ON public.tags FOR SELECT USING ((auth.uid() = user_id));


--
-- Name: tags tags_update_own; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY tags_update_own ON public.tags FOR UPDATE USING ((auth.uid() = user_id)) WITH CHECK ((auth.uid() = user_id));


--
-- Name: trades; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.trades ENABLE ROW LEVEL SECURITY;

--
-- Name: trades trades_delete_own; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY trades_delete_own ON public.trades FOR DELETE USING ((auth.uid() = user_id));


--
-- Name: trades trades_insert_own; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY trades_insert_own ON public.trades FOR INSERT WITH CHECK ((auth.uid() = user_id));


--
-- Name: trades trades_select_own; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY trades_select_own ON public.trades FOR SELECT USING ((auth.uid() = user_id));


--
-- Name: trades trades_update_own; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY trades_update_own ON public.trades FOR UPDATE USING ((auth.uid() = user_id)) WITH CHECK ((auth.uid() = user_id));


--
-- Name: user_settings; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.user_settings ENABLE ROW LEVEL SECURITY;

--
-- Name: user_settings user_settings_delete_own; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY user_settings_delete_own ON public.user_settings FOR DELETE USING ((auth.uid() = user_id));


--
-- Name: user_settings user_settings_insert_own; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY user_settings_insert_own ON public.user_settings FOR INSERT WITH CHECK ((auth.uid() = user_id));


--
-- Name: user_settings user_settings_select_own; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY user_settings_select_own ON public.user_settings FOR SELECT USING ((auth.uid() = user_id));


--
-- Name: user_settings user_settings_update_own; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY user_settings_update_own ON public.user_settings FOR UPDATE USING ((auth.uid() = user_id)) WITH CHECK ((auth.uid() = user_id));


--
-- Name: messages; Type: ROW SECURITY; Schema: realtime; Owner: -
--

ALTER TABLE realtime.messages ENABLE ROW LEVEL SECURITY;

--
-- Name: buckets; Type: ROW SECURITY; Schema: storage; Owner: -
--

ALTER TABLE storage.buckets ENABLE ROW LEVEL SECURITY;

--
-- Name: buckets_analytics; Type: ROW SECURITY; Schema: storage; Owner: -
--

ALTER TABLE storage.buckets_analytics ENABLE ROW LEVEL SECURITY;

--
-- Name: buckets_vectors; Type: ROW SECURITY; Schema: storage; Owner: -
--

ALTER TABLE storage.buckets_vectors ENABLE ROW LEVEL SECURITY;

--
-- Name: migrations; Type: ROW SECURITY; Schema: storage; Owner: -
--

ALTER TABLE storage.migrations ENABLE ROW LEVEL SECURITY;

--
-- Name: objects; Type: ROW SECURITY; Schema: storage; Owner: -
--

ALTER TABLE storage.objects ENABLE ROW LEVEL SECURITY;

--
-- Name: s3_multipart_uploads; Type: ROW SECURITY; Schema: storage; Owner: -
--

ALTER TABLE storage.s3_multipart_uploads ENABLE ROW LEVEL SECURITY;

--
-- Name: s3_multipart_uploads_parts; Type: ROW SECURITY; Schema: storage; Owner: -
--

ALTER TABLE storage.s3_multipart_uploads_parts ENABLE ROW LEVEL SECURITY;

--
-- Name: vector_indexes; Type: ROW SECURITY; Schema: storage; Owner: -
--

ALTER TABLE storage.vector_indexes ENABLE ROW LEVEL SECURITY;

--
-- Name: supabase_realtime; Type: PUBLICATION; Schema: -; Owner: -
--

CREATE PUBLICATION supabase_realtime WITH (publish = 'insert, update, delete, truncate');


--
-- Name: SCHEMA auth; Type: ACL; Schema: -; Owner: -
--

GRANT USAGE ON SCHEMA auth TO anon;
GRANT USAGE ON SCHEMA auth TO authenticated;
GRANT USAGE ON SCHEMA auth TO service_role;
GRANT ALL ON SCHEMA auth TO supabase_auth_admin;
GRANT ALL ON SCHEMA auth TO dashboard_user;
GRANT USAGE ON SCHEMA auth TO postgres;


--
-- Name: SCHEMA cron; Type: ACL; Schema: -; Owner: -
--

GRANT USAGE ON SCHEMA cron TO postgres WITH GRANT OPTION;


--
-- Name: SCHEMA extensions; Type: ACL; Schema: -; Owner: -
--

GRANT USAGE ON SCHEMA extensions TO anon;
GRANT USAGE ON SCHEMA extensions TO authenticated;
GRANT USAGE ON SCHEMA extensions TO service_role;
GRANT ALL ON SCHEMA extensions TO dashboard_user;


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: -
--

GRANT USAGE ON SCHEMA public TO postgres;
GRANT USAGE ON SCHEMA public TO anon;
GRANT USAGE ON SCHEMA public TO authenticated;
GRANT USAGE ON SCHEMA public TO service_role;


--
-- Name: SCHEMA realtime; Type: ACL; Schema: -; Owner: -
--

GRANT USAGE ON SCHEMA realtime TO postgres;
GRANT USAGE ON SCHEMA realtime TO anon;
GRANT USAGE ON SCHEMA realtime TO authenticated;
GRANT USAGE ON SCHEMA realtime TO service_role;
GRANT ALL ON SCHEMA realtime TO supabase_realtime_admin;


--
-- Name: SCHEMA storage; Type: ACL; Schema: -; Owner: -
--

GRANT USAGE ON SCHEMA storage TO postgres WITH GRANT OPTION;
GRANT USAGE ON SCHEMA storage TO anon;
GRANT USAGE ON SCHEMA storage TO authenticated;
GRANT USAGE ON SCHEMA storage TO service_role;
GRANT ALL ON SCHEMA storage TO supabase_storage_admin WITH GRANT OPTION;
GRANT ALL ON SCHEMA storage TO dashboard_user;


--
-- Name: SCHEMA vault; Type: ACL; Schema: -; Owner: -
--

GRANT USAGE ON SCHEMA vault TO postgres WITH GRANT OPTION;
GRANT USAGE ON SCHEMA vault TO service_role;


--
-- Name: FUNCTION email(); Type: ACL; Schema: auth; Owner: -
--

GRANT ALL ON FUNCTION auth.email() TO dashboard_user;


--
-- Name: FUNCTION jwt(); Type: ACL; Schema: auth; Owner: -
--

GRANT ALL ON FUNCTION auth.jwt() TO postgres;
GRANT ALL ON FUNCTION auth.jwt() TO dashboard_user;


--
-- Name: FUNCTION role(); Type: ACL; Schema: auth; Owner: -
--

GRANT ALL ON FUNCTION auth.role() TO dashboard_user;


--
-- Name: FUNCTION uid(); Type: ACL; Schema: auth; Owner: -
--

GRANT ALL ON FUNCTION auth.uid() TO dashboard_user;


--
-- Name: FUNCTION alter_job(job_id bigint, schedule text, command text, database text, username text, active boolean); Type: ACL; Schema: cron; Owner: -
--

GRANT ALL ON FUNCTION cron.alter_job(job_id bigint, schedule text, command text, database text, username text, active boolean) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION job_cache_invalidate(); Type: ACL; Schema: cron; Owner: -
--

GRANT ALL ON FUNCTION cron.job_cache_invalidate() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION schedule(schedule text, command text); Type: ACL; Schema: cron; Owner: -
--

GRANT ALL ON FUNCTION cron.schedule(schedule text, command text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION schedule(job_name text, schedule text, command text); Type: ACL; Schema: cron; Owner: -
--

GRANT ALL ON FUNCTION cron.schedule(job_name text, schedule text, command text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION schedule_in_database(job_name text, schedule text, command text, database text, username text, active boolean); Type: ACL; Schema: cron; Owner: -
--

GRANT ALL ON FUNCTION cron.schedule_in_database(job_name text, schedule text, command text, database text, username text, active boolean) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION unschedule(job_id bigint); Type: ACL; Schema: cron; Owner: -
--

GRANT ALL ON FUNCTION cron.unschedule(job_id bigint) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION unschedule(job_name text); Type: ACL; Schema: cron; Owner: -
--

GRANT ALL ON FUNCTION cron.unschedule(job_name text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION armor(bytea); Type: ACL; Schema: extensions; Owner: -
--

REVOKE ALL ON FUNCTION extensions.armor(bytea) FROM postgres;
GRANT ALL ON FUNCTION extensions.armor(bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.armor(bytea) TO dashboard_user;


--
-- Name: FUNCTION armor(bytea, text[], text[]); Type: ACL; Schema: extensions; Owner: -
--

REVOKE ALL ON FUNCTION extensions.armor(bytea, text[], text[]) FROM postgres;
GRANT ALL ON FUNCTION extensions.armor(bytea, text[], text[]) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.armor(bytea, text[], text[]) TO dashboard_user;


--
-- Name: FUNCTION crypt(text, text); Type: ACL; Schema: extensions; Owner: -
--

REVOKE ALL ON FUNCTION extensions.crypt(text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.crypt(text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.crypt(text, text) TO dashboard_user;


--
-- Name: FUNCTION dearmor(text); Type: ACL; Schema: extensions; Owner: -
--

REVOKE ALL ON FUNCTION extensions.dearmor(text) FROM postgres;
GRANT ALL ON FUNCTION extensions.dearmor(text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.dearmor(text) TO dashboard_user;


--
-- Name: FUNCTION decrypt(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: -
--

REVOKE ALL ON FUNCTION extensions.decrypt(bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.decrypt(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.decrypt(bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION decrypt_iv(bytea, bytea, bytea, text); Type: ACL; Schema: extensions; Owner: -
--

REVOKE ALL ON FUNCTION extensions.decrypt_iv(bytea, bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.decrypt_iv(bytea, bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.decrypt_iv(bytea, bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION digest(bytea, text); Type: ACL; Schema: extensions; Owner: -
--

REVOKE ALL ON FUNCTION extensions.digest(bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.digest(bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.digest(bytea, text) TO dashboard_user;


--
-- Name: FUNCTION digest(text, text); Type: ACL; Schema: extensions; Owner: -
--

REVOKE ALL ON FUNCTION extensions.digest(text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.digest(text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.digest(text, text) TO dashboard_user;


--
-- Name: FUNCTION encrypt(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: -
--

REVOKE ALL ON FUNCTION extensions.encrypt(bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.encrypt(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.encrypt(bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION encrypt_iv(bytea, bytea, bytea, text); Type: ACL; Schema: extensions; Owner: -
--

REVOKE ALL ON FUNCTION extensions.encrypt_iv(bytea, bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.encrypt_iv(bytea, bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.encrypt_iv(bytea, bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION gen_random_bytes(integer); Type: ACL; Schema: extensions; Owner: -
--

REVOKE ALL ON FUNCTION extensions.gen_random_bytes(integer) FROM postgres;
GRANT ALL ON FUNCTION extensions.gen_random_bytes(integer) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.gen_random_bytes(integer) TO dashboard_user;


--
-- Name: FUNCTION gen_random_uuid(); Type: ACL; Schema: extensions; Owner: -
--

REVOKE ALL ON FUNCTION extensions.gen_random_uuid() FROM postgres;
GRANT ALL ON FUNCTION extensions.gen_random_uuid() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.gen_random_uuid() TO dashboard_user;


--
-- Name: FUNCTION gen_salt(text); Type: ACL; Schema: extensions; Owner: -
--

REVOKE ALL ON FUNCTION extensions.gen_salt(text) FROM postgres;
GRANT ALL ON FUNCTION extensions.gen_salt(text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.gen_salt(text) TO dashboard_user;


--
-- Name: FUNCTION gen_salt(text, integer); Type: ACL; Schema: extensions; Owner: -
--

REVOKE ALL ON FUNCTION extensions.gen_salt(text, integer) FROM postgres;
GRANT ALL ON FUNCTION extensions.gen_salt(text, integer) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.gen_salt(text, integer) TO dashboard_user;


--
-- Name: FUNCTION grant_pg_cron_access(); Type: ACL; Schema: extensions; Owner: -
--

REVOKE ALL ON FUNCTION extensions.grant_pg_cron_access() FROM supabase_admin;
GRANT ALL ON FUNCTION extensions.grant_pg_cron_access() TO supabase_admin WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.grant_pg_cron_access() TO dashboard_user;


--
-- Name: FUNCTION grant_pg_graphql_access(); Type: ACL; Schema: extensions; Owner: -
--

GRANT ALL ON FUNCTION extensions.grant_pg_graphql_access() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION grant_pg_net_access(); Type: ACL; Schema: extensions; Owner: -
--

REVOKE ALL ON FUNCTION extensions.grant_pg_net_access() FROM supabase_admin;
GRANT ALL ON FUNCTION extensions.grant_pg_net_access() TO supabase_admin WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.grant_pg_net_access() TO dashboard_user;


--
-- Name: FUNCTION hmac(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: -
--

REVOKE ALL ON FUNCTION extensions.hmac(bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.hmac(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.hmac(bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION hmac(text, text, text); Type: ACL; Schema: extensions; Owner: -
--

REVOKE ALL ON FUNCTION extensions.hmac(text, text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.hmac(text, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.hmac(text, text, text) TO dashboard_user;


--
-- Name: FUNCTION pg_stat_statements(showtext boolean, OUT userid oid, OUT dbid oid, OUT toplevel boolean, OUT queryid bigint, OUT query text, OUT plans bigint, OUT total_plan_time double precision, OUT min_plan_time double precision, OUT max_plan_time double precision, OUT mean_plan_time double precision, OUT stddev_plan_time double precision, OUT calls bigint, OUT total_exec_time double precision, OUT min_exec_time double precision, OUT max_exec_time double precision, OUT mean_exec_time double precision, OUT stddev_exec_time double precision, OUT rows bigint, OUT shared_blks_hit bigint, OUT shared_blks_read bigint, OUT shared_blks_dirtied bigint, OUT shared_blks_written bigint, OUT local_blks_hit bigint, OUT local_blks_read bigint, OUT local_blks_dirtied bigint, OUT local_blks_written bigint, OUT temp_blks_read bigint, OUT temp_blks_written bigint, OUT shared_blk_read_time double precision, OUT shared_blk_write_time double precision, OUT local_blk_read_time double precision, OUT local_blk_write_time double precision, OUT temp_blk_read_time double precision, OUT temp_blk_write_time double precision, OUT wal_records bigint, OUT wal_fpi bigint, OUT wal_bytes numeric, OUT jit_functions bigint, OUT jit_generation_time double precision, OUT jit_inlining_count bigint, OUT jit_inlining_time double precision, OUT jit_optimization_count bigint, OUT jit_optimization_time double precision, OUT jit_emission_count bigint, OUT jit_emission_time double precision, OUT jit_deform_count bigint, OUT jit_deform_time double precision, OUT stats_since timestamp with time zone, OUT minmax_stats_since timestamp with time zone); Type: ACL; Schema: extensions; Owner: -
--

REVOKE ALL ON FUNCTION extensions.pg_stat_statements(showtext boolean, OUT userid oid, OUT dbid oid, OUT toplevel boolean, OUT queryid bigint, OUT query text, OUT plans bigint, OUT total_plan_time double precision, OUT min_plan_time double precision, OUT max_plan_time double precision, OUT mean_plan_time double precision, OUT stddev_plan_time double precision, OUT calls bigint, OUT total_exec_time double precision, OUT min_exec_time double precision, OUT max_exec_time double precision, OUT mean_exec_time double precision, OUT stddev_exec_time double precision, OUT rows bigint, OUT shared_blks_hit bigint, OUT shared_blks_read bigint, OUT shared_blks_dirtied bigint, OUT shared_blks_written bigint, OUT local_blks_hit bigint, OUT local_blks_read bigint, OUT local_blks_dirtied bigint, OUT local_blks_written bigint, OUT temp_blks_read bigint, OUT temp_blks_written bigint, OUT shared_blk_read_time double precision, OUT shared_blk_write_time double precision, OUT local_blk_read_time double precision, OUT local_blk_write_time double precision, OUT temp_blk_read_time double precision, OUT temp_blk_write_time double precision, OUT wal_records bigint, OUT wal_fpi bigint, OUT wal_bytes numeric, OUT jit_functions bigint, OUT jit_generation_time double precision, OUT jit_inlining_count bigint, OUT jit_inlining_time double precision, OUT jit_optimization_count bigint, OUT jit_optimization_time double precision, OUT jit_emission_count bigint, OUT jit_emission_time double precision, OUT jit_deform_count bigint, OUT jit_deform_time double precision, OUT stats_since timestamp with time zone, OUT minmax_stats_since timestamp with time zone) FROM postgres;
GRANT ALL ON FUNCTION extensions.pg_stat_statements(showtext boolean, OUT userid oid, OUT dbid oid, OUT toplevel boolean, OUT queryid bigint, OUT query text, OUT plans bigint, OUT total_plan_time double precision, OUT min_plan_time double precision, OUT max_plan_time double precision, OUT mean_plan_time double precision, OUT stddev_plan_time double precision, OUT calls bigint, OUT total_exec_time double precision, OUT min_exec_time double precision, OUT max_exec_time double precision, OUT mean_exec_time double precision, OUT stddev_exec_time double precision, OUT rows bigint, OUT shared_blks_hit bigint, OUT shared_blks_read bigint, OUT shared_blks_dirtied bigint, OUT shared_blks_written bigint, OUT local_blks_hit bigint, OUT local_blks_read bigint, OUT local_blks_dirtied bigint, OUT local_blks_written bigint, OUT temp_blks_read bigint, OUT temp_blks_written bigint, OUT shared_blk_read_time double precision, OUT shared_blk_write_time double precision, OUT local_blk_read_time double precision, OUT local_blk_write_time double precision, OUT temp_blk_read_time double precision, OUT temp_blk_write_time double precision, OUT wal_records bigint, OUT wal_fpi bigint, OUT wal_bytes numeric, OUT jit_functions bigint, OUT jit_generation_time double precision, OUT jit_inlining_count bigint, OUT jit_inlining_time double precision, OUT jit_optimization_count bigint, OUT jit_optimization_time double precision, OUT jit_emission_count bigint, OUT jit_emission_time double precision, OUT jit_deform_count bigint, OUT jit_deform_time double precision, OUT stats_since timestamp with time zone, OUT minmax_stats_since timestamp with time zone) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pg_stat_statements(showtext boolean, OUT userid oid, OUT dbid oid, OUT toplevel boolean, OUT queryid bigint, OUT query text, OUT plans bigint, OUT total_plan_time double precision, OUT min_plan_time double precision, OUT max_plan_time double precision, OUT mean_plan_time double precision, OUT stddev_plan_time double precision, OUT calls bigint, OUT total_exec_time double precision, OUT min_exec_time double precision, OUT max_exec_time double precision, OUT mean_exec_time double precision, OUT stddev_exec_time double precision, OUT rows bigint, OUT shared_blks_hit bigint, OUT shared_blks_read bigint, OUT shared_blks_dirtied bigint, OUT shared_blks_written bigint, OUT local_blks_hit bigint, OUT local_blks_read bigint, OUT local_blks_dirtied bigint, OUT local_blks_written bigint, OUT temp_blks_read bigint, OUT temp_blks_written bigint, OUT shared_blk_read_time double precision, OUT shared_blk_write_time double precision, OUT local_blk_read_time double precision, OUT local_blk_write_time double precision, OUT temp_blk_read_time double precision, OUT temp_blk_write_time double precision, OUT wal_records bigint, OUT wal_fpi bigint, OUT wal_bytes numeric, OUT jit_functions bigint, OUT jit_generation_time double precision, OUT jit_inlining_count bigint, OUT jit_inlining_time double precision, OUT jit_optimization_count bigint, OUT jit_optimization_time double precision, OUT jit_emission_count bigint, OUT jit_emission_time double precision, OUT jit_deform_count bigint, OUT jit_deform_time double precision, OUT stats_since timestamp with time zone, OUT minmax_stats_since timestamp with time zone) TO dashboard_user;


--
-- Name: FUNCTION pg_stat_statements_info(OUT dealloc bigint, OUT stats_reset timestamp with time zone); Type: ACL; Schema: extensions; Owner: -
--

REVOKE ALL ON FUNCTION extensions.pg_stat_statements_info(OUT dealloc bigint, OUT stats_reset timestamp with time zone) FROM postgres;
GRANT ALL ON FUNCTION extensions.pg_stat_statements_info(OUT dealloc bigint, OUT stats_reset timestamp with time zone) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pg_stat_statements_info(OUT dealloc bigint, OUT stats_reset timestamp with time zone) TO dashboard_user;


--
-- Name: FUNCTION pg_stat_statements_reset(userid oid, dbid oid, queryid bigint, minmax_only boolean); Type: ACL; Schema: extensions; Owner: -
--

REVOKE ALL ON FUNCTION extensions.pg_stat_statements_reset(userid oid, dbid oid, queryid bigint, minmax_only boolean) FROM postgres;
GRANT ALL ON FUNCTION extensions.pg_stat_statements_reset(userid oid, dbid oid, queryid bigint, minmax_only boolean) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pg_stat_statements_reset(userid oid, dbid oid, queryid bigint, minmax_only boolean) TO dashboard_user;


--
-- Name: FUNCTION pgp_armor_headers(text, OUT key text, OUT value text); Type: ACL; Schema: extensions; Owner: -
--

REVOKE ALL ON FUNCTION extensions.pgp_armor_headers(text, OUT key text, OUT value text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_armor_headers(text, OUT key text, OUT value text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_armor_headers(text, OUT key text, OUT value text) TO dashboard_user;


--
-- Name: FUNCTION pgp_key_id(bytea); Type: ACL; Schema: extensions; Owner: -
--

REVOKE ALL ON FUNCTION extensions.pgp_key_id(bytea) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_key_id(bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_key_id(bytea) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_decrypt(bytea, bytea); Type: ACL; Schema: extensions; Owner: -
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_decrypt(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: -
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_decrypt(bytea, bytea, text, text); Type: ACL; Schema: extensions; Owner: -
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_decrypt_bytea(bytea, bytea); Type: ACL; Schema: extensions; Owner: -
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_decrypt_bytea(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: -
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_decrypt_bytea(bytea, bytea, text, text); Type: ACL; Schema: extensions; Owner: -
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_encrypt(text, bytea); Type: ACL; Schema: extensions; Owner: -
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_encrypt(text, bytea, text); Type: ACL; Schema: extensions; Owner: -
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_encrypt_bytea(bytea, bytea); Type: ACL; Schema: extensions; Owner: -
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_encrypt_bytea(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: -
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_decrypt(bytea, text); Type: ACL; Schema: extensions; Owner: -
--

REVOKE ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_decrypt(bytea, text, text); Type: ACL; Schema: extensions; Owner: -
--

REVOKE ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_decrypt_bytea(bytea, text); Type: ACL; Schema: extensions; Owner: -
--

REVOKE ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_decrypt_bytea(bytea, text, text); Type: ACL; Schema: extensions; Owner: -
--

REVOKE ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_encrypt(text, text); Type: ACL; Schema: extensions; Owner: -
--

REVOKE ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_encrypt(text, text, text); Type: ACL; Schema: extensions; Owner: -
--

REVOKE ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_encrypt_bytea(bytea, text); Type: ACL; Schema: extensions; Owner: -
--

REVOKE ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_encrypt_bytea(bytea, text, text); Type: ACL; Schema: extensions; Owner: -
--

REVOKE ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text, text) TO dashboard_user;


--
-- Name: FUNCTION pgrst_ddl_watch(); Type: ACL; Schema: extensions; Owner: -
--

GRANT ALL ON FUNCTION extensions.pgrst_ddl_watch() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pgrst_drop_watch(); Type: ACL; Schema: extensions; Owner: -
--

GRANT ALL ON FUNCTION extensions.pgrst_drop_watch() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION set_graphql_placeholder(); Type: ACL; Schema: extensions; Owner: -
--

GRANT ALL ON FUNCTION extensions.set_graphql_placeholder() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION uuid_generate_v1(); Type: ACL; Schema: extensions; Owner: -
--

REVOKE ALL ON FUNCTION extensions.uuid_generate_v1() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_generate_v1() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_generate_v1() TO dashboard_user;


--
-- Name: FUNCTION uuid_generate_v1mc(); Type: ACL; Schema: extensions; Owner: -
--

REVOKE ALL ON FUNCTION extensions.uuid_generate_v1mc() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_generate_v1mc() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_generate_v1mc() TO dashboard_user;


--
-- Name: FUNCTION uuid_generate_v3(namespace uuid, name text); Type: ACL; Schema: extensions; Owner: -
--

REVOKE ALL ON FUNCTION extensions.uuid_generate_v3(namespace uuid, name text) FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_generate_v3(namespace uuid, name text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_generate_v3(namespace uuid, name text) TO dashboard_user;


--
-- Name: FUNCTION uuid_generate_v4(); Type: ACL; Schema: extensions; Owner: -
--

REVOKE ALL ON FUNCTION extensions.uuid_generate_v4() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_generate_v4() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_generate_v4() TO dashboard_user;


--
-- Name: FUNCTION uuid_generate_v5(namespace uuid, name text); Type: ACL; Schema: extensions; Owner: -
--

REVOKE ALL ON FUNCTION extensions.uuid_generate_v5(namespace uuid, name text) FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_generate_v5(namespace uuid, name text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_generate_v5(namespace uuid, name text) TO dashboard_user;


--
-- Name: FUNCTION uuid_nil(); Type: ACL; Schema: extensions; Owner: -
--

REVOKE ALL ON FUNCTION extensions.uuid_nil() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_nil() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_nil() TO dashboard_user;


--
-- Name: FUNCTION uuid_ns_dns(); Type: ACL; Schema: extensions; Owner: -
--

REVOKE ALL ON FUNCTION extensions.uuid_ns_dns() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_ns_dns() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_ns_dns() TO dashboard_user;


--
-- Name: FUNCTION uuid_ns_oid(); Type: ACL; Schema: extensions; Owner: -
--

REVOKE ALL ON FUNCTION extensions.uuid_ns_oid() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_ns_oid() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_ns_oid() TO dashboard_user;


--
-- Name: FUNCTION uuid_ns_url(); Type: ACL; Schema: extensions; Owner: -
--

REVOKE ALL ON FUNCTION extensions.uuid_ns_url() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_ns_url() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_ns_url() TO dashboard_user;


--
-- Name: FUNCTION uuid_ns_x500(); Type: ACL; Schema: extensions; Owner: -
--

REVOKE ALL ON FUNCTION extensions.uuid_ns_x500() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_ns_x500() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_ns_x500() TO dashboard_user;


--
-- Name: FUNCTION graphql("operationName" text, query text, variables jsonb, extensions jsonb); Type: ACL; Schema: graphql_public; Owner: -
--

GRANT ALL ON FUNCTION graphql_public.graphql("operationName" text, query text, variables jsonb, extensions jsonb) TO postgres;
GRANT ALL ON FUNCTION graphql_public.graphql("operationName" text, query text, variables jsonb, extensions jsonb) TO anon;
GRANT ALL ON FUNCTION graphql_public.graphql("operationName" text, query text, variables jsonb, extensions jsonb) TO authenticated;
GRANT ALL ON FUNCTION graphql_public.graphql("operationName" text, query text, variables jsonb, extensions jsonb) TO service_role;


--
-- Name: FUNCTION pg_reload_conf(); Type: ACL; Schema: pg_catalog; Owner: -
--

GRANT ALL ON FUNCTION pg_catalog.pg_reload_conf() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION get_auth(p_usename text); Type: ACL; Schema: pgbouncer; Owner: -
--

REVOKE ALL ON FUNCTION pgbouncer.get_auth(p_usename text) FROM PUBLIC;
GRANT ALL ON FUNCTION pgbouncer.get_auth(p_usename text) TO pgbouncer;


--
-- Name: FUNCTION bootstrap_current_user(); Type: ACL; Schema: public; Owner: -
--

GRANT ALL ON FUNCTION public.bootstrap_current_user() TO anon;
GRANT ALL ON FUNCTION public.bootstrap_current_user() TO authenticated;
GRANT ALL ON FUNCTION public.bootstrap_current_user() TO service_role;


--
-- Name: FUNCTION apply_rls(wal jsonb, max_record_bytes integer); Type: ACL; Schema: realtime; Owner: -
--

GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO postgres;
GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO anon;
GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO authenticated;
GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO service_role;
GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO supabase_realtime_admin;


--
-- Name: FUNCTION broadcast_changes(topic_name text, event_name text, operation text, table_name text, table_schema text, new record, old record, level text); Type: ACL; Schema: realtime; Owner: -
--

GRANT ALL ON FUNCTION realtime.broadcast_changes(topic_name text, event_name text, operation text, table_name text, table_schema text, new record, old record, level text) TO postgres;
GRANT ALL ON FUNCTION realtime.broadcast_changes(topic_name text, event_name text, operation text, table_name text, table_schema text, new record, old record, level text) TO dashboard_user;


--
-- Name: FUNCTION build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]); Type: ACL; Schema: realtime; Owner: -
--

GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO postgres;
GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO anon;
GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO authenticated;
GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO service_role;
GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO supabase_realtime_admin;


--
-- Name: FUNCTION "cast"(val text, type_ regtype); Type: ACL; Schema: realtime; Owner: -
--

GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO postgres;
GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO dashboard_user;
GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO anon;
GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO authenticated;
GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO service_role;
GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO supabase_realtime_admin;


--
-- Name: FUNCTION check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text); Type: ACL; Schema: realtime; Owner: -
--

GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO postgres;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO anon;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO authenticated;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO service_role;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO supabase_realtime_admin;


--
-- Name: FUNCTION is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]); Type: ACL; Schema: realtime; Owner: -
--

GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO postgres;
GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO anon;
GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO authenticated;
GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO service_role;
GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO supabase_realtime_admin;


--
-- Name: FUNCTION list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer); Type: ACL; Schema: realtime; Owner: -
--

GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO postgres;
GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO dashboard_user;


--
-- Name: FUNCTION quote_wal2json(entity regclass); Type: ACL; Schema: realtime; Owner: -
--

GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO postgres;
GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO anon;
GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO authenticated;
GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO service_role;
GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO supabase_realtime_admin;


--
-- Name: FUNCTION send(payload jsonb, event text, topic text, private boolean); Type: ACL; Schema: realtime; Owner: -
--

GRANT ALL ON FUNCTION realtime.send(payload jsonb, event text, topic text, private boolean) TO postgres;
GRANT ALL ON FUNCTION realtime.send(payload jsonb, event text, topic text, private boolean) TO dashboard_user;


--
-- Name: FUNCTION subscription_check_filters(); Type: ACL; Schema: realtime; Owner: -
--

GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO postgres;
GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO dashboard_user;
GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO anon;
GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO authenticated;
GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO service_role;
GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO supabase_realtime_admin;


--
-- Name: FUNCTION to_regrole(role_name text); Type: ACL; Schema: realtime; Owner: -
--

GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO postgres;
GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO anon;
GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO authenticated;
GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO service_role;
GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO supabase_realtime_admin;


--
-- Name: FUNCTION topic(); Type: ACL; Schema: realtime; Owner: -
--

GRANT ALL ON FUNCTION realtime.topic() TO postgres;
GRANT ALL ON FUNCTION realtime.topic() TO dashboard_user;


--
-- Name: FUNCTION _crypto_aead_det_decrypt(message bytea, additional bytea, key_id bigint, context bytea, nonce bytea); Type: ACL; Schema: vault; Owner: -
--

GRANT ALL ON FUNCTION vault._crypto_aead_det_decrypt(message bytea, additional bytea, key_id bigint, context bytea, nonce bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION vault._crypto_aead_det_decrypt(message bytea, additional bytea, key_id bigint, context bytea, nonce bytea) TO service_role;


--
-- Name: FUNCTION create_secret(new_secret text, new_name text, new_description text, new_key_id uuid); Type: ACL; Schema: vault; Owner: -
--

GRANT ALL ON FUNCTION vault.create_secret(new_secret text, new_name text, new_description text, new_key_id uuid) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION vault.create_secret(new_secret text, new_name text, new_description text, new_key_id uuid) TO service_role;


--
-- Name: FUNCTION update_secret(secret_id uuid, new_secret text, new_name text, new_description text, new_key_id uuid); Type: ACL; Schema: vault; Owner: -
--

GRANT ALL ON FUNCTION vault.update_secret(secret_id uuid, new_secret text, new_name text, new_description text, new_key_id uuid) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION vault.update_secret(secret_id uuid, new_secret text, new_name text, new_description text, new_key_id uuid) TO service_role;


--
-- Name: TABLE audit_log_entries; Type: ACL; Schema: auth; Owner: -
--

GRANT ALL ON TABLE auth.audit_log_entries TO dashboard_user;
GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.audit_log_entries TO postgres;
GRANT SELECT ON TABLE auth.audit_log_entries TO postgres WITH GRANT OPTION;


--
-- Name: TABLE custom_oauth_providers; Type: ACL; Schema: auth; Owner: -
--

GRANT ALL ON TABLE auth.custom_oauth_providers TO postgres;
GRANT ALL ON TABLE auth.custom_oauth_providers TO dashboard_user;


--
-- Name: TABLE flow_state; Type: ACL; Schema: auth; Owner: -
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.flow_state TO postgres;
GRANT SELECT ON TABLE auth.flow_state TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.flow_state TO dashboard_user;


--
-- Name: TABLE identities; Type: ACL; Schema: auth; Owner: -
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.identities TO postgres;
GRANT SELECT ON TABLE auth.identities TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.identities TO dashboard_user;


--
-- Name: TABLE instances; Type: ACL; Schema: auth; Owner: -
--

GRANT ALL ON TABLE auth.instances TO dashboard_user;
GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.instances TO postgres;
GRANT SELECT ON TABLE auth.instances TO postgres WITH GRANT OPTION;


--
-- Name: TABLE mfa_amr_claims; Type: ACL; Schema: auth; Owner: -
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.mfa_amr_claims TO postgres;
GRANT SELECT ON TABLE auth.mfa_amr_claims TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.mfa_amr_claims TO dashboard_user;


--
-- Name: TABLE mfa_challenges; Type: ACL; Schema: auth; Owner: -
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.mfa_challenges TO postgres;
GRANT SELECT ON TABLE auth.mfa_challenges TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.mfa_challenges TO dashboard_user;


--
-- Name: TABLE mfa_factors; Type: ACL; Schema: auth; Owner: -
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.mfa_factors TO postgres;
GRANT SELECT ON TABLE auth.mfa_factors TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.mfa_factors TO dashboard_user;


--
-- Name: TABLE oauth_authorizations; Type: ACL; Schema: auth; Owner: -
--

GRANT ALL ON TABLE auth.oauth_authorizations TO postgres;
GRANT ALL ON TABLE auth.oauth_authorizations TO dashboard_user;


--
-- Name: TABLE oauth_client_states; Type: ACL; Schema: auth; Owner: -
--

GRANT ALL ON TABLE auth.oauth_client_states TO postgres;
GRANT ALL ON TABLE auth.oauth_client_states TO dashboard_user;


--
-- Name: TABLE oauth_clients; Type: ACL; Schema: auth; Owner: -
--

GRANT ALL ON TABLE auth.oauth_clients TO postgres;
GRANT ALL ON TABLE auth.oauth_clients TO dashboard_user;


--
-- Name: TABLE oauth_consents; Type: ACL; Schema: auth; Owner: -
--

GRANT ALL ON TABLE auth.oauth_consents TO postgres;
GRANT ALL ON TABLE auth.oauth_consents TO dashboard_user;


--
-- Name: TABLE one_time_tokens; Type: ACL; Schema: auth; Owner: -
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.one_time_tokens TO postgres;
GRANT SELECT ON TABLE auth.one_time_tokens TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.one_time_tokens TO dashboard_user;


--
-- Name: TABLE refresh_tokens; Type: ACL; Schema: auth; Owner: -
--

GRANT ALL ON TABLE auth.refresh_tokens TO dashboard_user;
GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.refresh_tokens TO postgres;
GRANT SELECT ON TABLE auth.refresh_tokens TO postgres WITH GRANT OPTION;


--
-- Name: SEQUENCE refresh_tokens_id_seq; Type: ACL; Schema: auth; Owner: -
--

GRANT ALL ON SEQUENCE auth.refresh_tokens_id_seq TO dashboard_user;
GRANT ALL ON SEQUENCE auth.refresh_tokens_id_seq TO postgres;


--
-- Name: TABLE saml_providers; Type: ACL; Schema: auth; Owner: -
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.saml_providers TO postgres;
GRANT SELECT ON TABLE auth.saml_providers TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.saml_providers TO dashboard_user;


--
-- Name: TABLE saml_relay_states; Type: ACL; Schema: auth; Owner: -
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.saml_relay_states TO postgres;
GRANT SELECT ON TABLE auth.saml_relay_states TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.saml_relay_states TO dashboard_user;


--
-- Name: TABLE schema_migrations; Type: ACL; Schema: auth; Owner: -
--

GRANT SELECT ON TABLE auth.schema_migrations TO postgres WITH GRANT OPTION;


--
-- Name: TABLE sessions; Type: ACL; Schema: auth; Owner: -
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.sessions TO postgres;
GRANT SELECT ON TABLE auth.sessions TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.sessions TO dashboard_user;


--
-- Name: TABLE sso_domains; Type: ACL; Schema: auth; Owner: -
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.sso_domains TO postgres;
GRANT SELECT ON TABLE auth.sso_domains TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.sso_domains TO dashboard_user;


--
-- Name: TABLE sso_providers; Type: ACL; Schema: auth; Owner: -
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.sso_providers TO postgres;
GRANT SELECT ON TABLE auth.sso_providers TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.sso_providers TO dashboard_user;


--
-- Name: TABLE users; Type: ACL; Schema: auth; Owner: -
--

GRANT ALL ON TABLE auth.users TO dashboard_user;
GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.users TO postgres;
GRANT SELECT ON TABLE auth.users TO postgres WITH GRANT OPTION;


--
-- Name: TABLE webauthn_challenges; Type: ACL; Schema: auth; Owner: -
--

GRANT ALL ON TABLE auth.webauthn_challenges TO postgres;
GRANT ALL ON TABLE auth.webauthn_challenges TO dashboard_user;


--
-- Name: TABLE webauthn_credentials; Type: ACL; Schema: auth; Owner: -
--

GRANT ALL ON TABLE auth.webauthn_credentials TO postgres;
GRANT ALL ON TABLE auth.webauthn_credentials TO dashboard_user;


--
-- Name: TABLE job; Type: ACL; Schema: cron; Owner: -
--

GRANT SELECT ON TABLE cron.job TO postgres WITH GRANT OPTION;


--
-- Name: TABLE job_run_details; Type: ACL; Schema: cron; Owner: -
--

GRANT ALL ON TABLE cron.job_run_details TO postgres WITH GRANT OPTION;


--
-- Name: TABLE pg_stat_statements; Type: ACL; Schema: extensions; Owner: -
--

REVOKE ALL ON TABLE extensions.pg_stat_statements FROM postgres;
GRANT ALL ON TABLE extensions.pg_stat_statements TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE extensions.pg_stat_statements TO dashboard_user;


--
-- Name: TABLE pg_stat_statements_info; Type: ACL; Schema: extensions; Owner: -
--

REVOKE ALL ON TABLE extensions.pg_stat_statements_info FROM postgres;
GRANT ALL ON TABLE extensions.pg_stat_statements_info TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE extensions.pg_stat_statements_info TO dashboard_user;


--
-- Name: TABLE keep_alive; Type: ACL; Schema: public; Owner: -
--

GRANT ALL ON TABLE public.keep_alive TO anon;
GRANT ALL ON TABLE public.keep_alive TO authenticated;
GRANT ALL ON TABLE public.keep_alive TO service_role;


--
-- Name: TABLE strategies; Type: ACL; Schema: public; Owner: -
--

GRANT ALL ON TABLE public.strategies TO anon;
GRANT ALL ON TABLE public.strategies TO authenticated;
GRANT ALL ON TABLE public.strategies TO service_role;


--
-- Name: TABLE tag_categories; Type: ACL; Schema: public; Owner: -
--

GRANT ALL ON TABLE public.tag_categories TO anon;
GRANT ALL ON TABLE public.tag_categories TO authenticated;
GRANT ALL ON TABLE public.tag_categories TO service_role;


--
-- Name: TABLE tags; Type: ACL; Schema: public; Owner: -
--

GRANT ALL ON TABLE public.tags TO anon;
GRANT ALL ON TABLE public.tags TO authenticated;
GRANT ALL ON TABLE public.tags TO service_role;


--
-- Name: TABLE trades; Type: ACL; Schema: public; Owner: -
--

GRANT ALL ON TABLE public.trades TO anon;
GRANT ALL ON TABLE public.trades TO authenticated;
GRANT ALL ON TABLE public.trades TO service_role;


--
-- Name: TABLE user_settings; Type: ACL; Schema: public; Owner: -
--

GRANT ALL ON TABLE public.user_settings TO anon;
GRANT ALL ON TABLE public.user_settings TO authenticated;
GRANT ALL ON TABLE public.user_settings TO service_role;


--
-- Name: SEQUENCE user_settings_id_seq; Type: ACL; Schema: public; Owner: -
--

GRANT ALL ON SEQUENCE public.user_settings_id_seq TO anon;
GRANT ALL ON SEQUENCE public.user_settings_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.user_settings_id_seq TO service_role;


--
-- Name: TABLE messages; Type: ACL; Schema: realtime; Owner: -
--

GRANT ALL ON TABLE realtime.messages TO postgres;
GRANT ALL ON TABLE realtime.messages TO dashboard_user;
GRANT SELECT,INSERT,UPDATE ON TABLE realtime.messages TO anon;
GRANT SELECT,INSERT,UPDATE ON TABLE realtime.messages TO authenticated;
GRANT SELECT,INSERT,UPDATE ON TABLE realtime.messages TO service_role;


--
-- Name: TABLE schema_migrations; Type: ACL; Schema: realtime; Owner: -
--

GRANT ALL ON TABLE realtime.schema_migrations TO postgres;
GRANT ALL ON TABLE realtime.schema_migrations TO dashboard_user;
GRANT SELECT ON TABLE realtime.schema_migrations TO anon;
GRANT SELECT ON TABLE realtime.schema_migrations TO authenticated;
GRANT SELECT ON TABLE realtime.schema_migrations TO service_role;
GRANT ALL ON TABLE realtime.schema_migrations TO supabase_realtime_admin;


--
-- Name: TABLE subscription; Type: ACL; Schema: realtime; Owner: -
--

GRANT ALL ON TABLE realtime.subscription TO postgres;
GRANT ALL ON TABLE realtime.subscription TO dashboard_user;
GRANT SELECT ON TABLE realtime.subscription TO anon;
GRANT SELECT ON TABLE realtime.subscription TO authenticated;
GRANT SELECT ON TABLE realtime.subscription TO service_role;
GRANT ALL ON TABLE realtime.subscription TO supabase_realtime_admin;


--
-- Name: SEQUENCE subscription_id_seq; Type: ACL; Schema: realtime; Owner: -
--

GRANT ALL ON SEQUENCE realtime.subscription_id_seq TO postgres;
GRANT ALL ON SEQUENCE realtime.subscription_id_seq TO dashboard_user;
GRANT USAGE ON SEQUENCE realtime.subscription_id_seq TO anon;
GRANT USAGE ON SEQUENCE realtime.subscription_id_seq TO authenticated;
GRANT USAGE ON SEQUENCE realtime.subscription_id_seq TO service_role;
GRANT ALL ON SEQUENCE realtime.subscription_id_seq TO supabase_realtime_admin;


--
-- Name: TABLE buckets; Type: ACL; Schema: storage; Owner: -
--

REVOKE ALL ON TABLE storage.buckets FROM supabase_storage_admin;
GRANT ALL ON TABLE storage.buckets TO supabase_storage_admin WITH GRANT OPTION;
GRANT ALL ON TABLE storage.buckets TO service_role;
GRANT ALL ON TABLE storage.buckets TO authenticated;
GRANT ALL ON TABLE storage.buckets TO anon;
GRANT ALL ON TABLE storage.buckets TO postgres WITH GRANT OPTION;


--
-- Name: TABLE buckets_analytics; Type: ACL; Schema: storage; Owner: -
--

GRANT ALL ON TABLE storage.buckets_analytics TO service_role;
GRANT ALL ON TABLE storage.buckets_analytics TO authenticated;
GRANT ALL ON TABLE storage.buckets_analytics TO anon;


--
-- Name: TABLE buckets_vectors; Type: ACL; Schema: storage; Owner: -
--

GRANT SELECT ON TABLE storage.buckets_vectors TO service_role;
GRANT SELECT ON TABLE storage.buckets_vectors TO authenticated;
GRANT SELECT ON TABLE storage.buckets_vectors TO anon;


--
-- Name: TABLE objects; Type: ACL; Schema: storage; Owner: -
--

REVOKE ALL ON TABLE storage.objects FROM supabase_storage_admin;
GRANT ALL ON TABLE storage.objects TO supabase_storage_admin WITH GRANT OPTION;
GRANT ALL ON TABLE storage.objects TO service_role;
GRANT ALL ON TABLE storage.objects TO authenticated;
GRANT ALL ON TABLE storage.objects TO anon;
GRANT ALL ON TABLE storage.objects TO postgres WITH GRANT OPTION;


--
-- Name: TABLE s3_multipart_uploads; Type: ACL; Schema: storage; Owner: -
--

GRANT ALL ON TABLE storage.s3_multipart_uploads TO service_role;
GRANT SELECT ON TABLE storage.s3_multipart_uploads TO authenticated;
GRANT SELECT ON TABLE storage.s3_multipart_uploads TO anon;


--
-- Name: TABLE s3_multipart_uploads_parts; Type: ACL; Schema: storage; Owner: -
--

GRANT ALL ON TABLE storage.s3_multipart_uploads_parts TO service_role;
GRANT SELECT ON TABLE storage.s3_multipart_uploads_parts TO authenticated;
GRANT SELECT ON TABLE storage.s3_multipart_uploads_parts TO anon;


--
-- Name: TABLE vector_indexes; Type: ACL; Schema: storage; Owner: -
--

GRANT SELECT ON TABLE storage.vector_indexes TO service_role;
GRANT SELECT ON TABLE storage.vector_indexes TO authenticated;
GRANT SELECT ON TABLE storage.vector_indexes TO anon;


--
-- Name: TABLE secrets; Type: ACL; Schema: vault; Owner: -
--

GRANT SELECT,REFERENCES,DELETE,TRUNCATE ON TABLE vault.secrets TO postgres WITH GRANT OPTION;
GRANT SELECT,DELETE ON TABLE vault.secrets TO service_role;


--
-- Name: TABLE decrypted_secrets; Type: ACL; Schema: vault; Owner: -
--

GRANT SELECT,REFERENCES,DELETE,TRUNCATE ON TABLE vault.decrypted_secrets TO postgres WITH GRANT OPTION;
GRANT SELECT,DELETE ON TABLE vault.decrypted_secrets TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: auth; Owner: -
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON SEQUENCES TO dashboard_user;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: auth; Owner: -
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON FUNCTIONS TO dashboard_user;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: auth; Owner: -
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON TABLES TO dashboard_user;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: cron; Owner: -
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA cron GRANT ALL ON SEQUENCES TO postgres WITH GRANT OPTION;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: cron; Owner: -
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA cron GRANT ALL ON FUNCTIONS TO postgres WITH GRANT OPTION;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: cron; Owner: -
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA cron GRANT ALL ON TABLES TO postgres WITH GRANT OPTION;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: extensions; Owner: -
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA extensions GRANT ALL ON SEQUENCES TO postgres WITH GRANT OPTION;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: extensions; Owner: -
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA extensions GRANT ALL ON FUNCTIONS TO postgres WITH GRANT OPTION;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: extensions; Owner: -
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA extensions GRANT ALL ON TABLES TO postgres WITH GRANT OPTION;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: graphql; Owner: -
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON SEQUENCES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON SEQUENCES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON SEQUENCES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: graphql; Owner: -
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON FUNCTIONS TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON FUNCTIONS TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON FUNCTIONS TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: graphql; Owner: -
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON TABLES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON TABLES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON TABLES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: graphql_public; Owner: -
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON SEQUENCES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON SEQUENCES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON SEQUENCES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: graphql_public; Owner: -
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON FUNCTIONS TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON FUNCTIONS TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON FUNCTIONS TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: graphql_public; Owner: -
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON TABLES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON TABLES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON TABLES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: public; Owner: -
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON SEQUENCES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON SEQUENCES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON SEQUENCES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: public; Owner: -
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON SEQUENCES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON SEQUENCES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON SEQUENCES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: public; Owner: -
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON FUNCTIONS TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON FUNCTIONS TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON FUNCTIONS TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: public; Owner: -
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON FUNCTIONS TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON FUNCTIONS TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON FUNCTIONS TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: public; Owner: -
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON TABLES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON TABLES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON TABLES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: public; Owner: -
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON TABLES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON TABLES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON TABLES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: realtime; Owner: -
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON SEQUENCES TO dashboard_user;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: realtime; Owner: -
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON FUNCTIONS TO dashboard_user;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: realtime; Owner: -
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON TABLES TO dashboard_user;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: storage; Owner: -
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON SEQUENCES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON SEQUENCES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON SEQUENCES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: storage; Owner: -
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON FUNCTIONS TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON FUNCTIONS TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON FUNCTIONS TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: storage; Owner: -
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON TABLES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON TABLES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON TABLES TO service_role;


--
-- Name: issue_graphql_placeholder; Type: EVENT TRIGGER; Schema: -; Owner: -
--

CREATE EVENT TRIGGER issue_graphql_placeholder ON sql_drop
         WHEN TAG IN ('DROP EXTENSION')
   EXECUTE FUNCTION extensions.set_graphql_placeholder();


--
-- Name: issue_pg_cron_access; Type: EVENT TRIGGER; Schema: -; Owner: -
--

CREATE EVENT TRIGGER issue_pg_cron_access ON ddl_command_end
         WHEN TAG IN ('CREATE EXTENSION')
   EXECUTE FUNCTION extensions.grant_pg_cron_access();


--
-- Name: issue_pg_graphql_access; Type: EVENT TRIGGER; Schema: -; Owner: -
--

CREATE EVENT TRIGGER issue_pg_graphql_access ON ddl_command_end
         WHEN TAG IN ('CREATE FUNCTION')
   EXECUTE FUNCTION extensions.grant_pg_graphql_access();


--
-- Name: issue_pg_net_access; Type: EVENT TRIGGER; Schema: -; Owner: -
--

CREATE EVENT TRIGGER issue_pg_net_access ON ddl_command_end
         WHEN TAG IN ('CREATE EXTENSION')
   EXECUTE FUNCTION extensions.grant_pg_net_access();


--
-- Name: pgrst_ddl_watch; Type: EVENT TRIGGER; Schema: -; Owner: -
--

CREATE EVENT TRIGGER pgrst_ddl_watch ON ddl_command_end
   EXECUTE FUNCTION extensions.pgrst_ddl_watch();


--
-- Name: pgrst_drop_watch; Type: EVENT TRIGGER; Schema: -; Owner: -
--

CREATE EVENT TRIGGER pgrst_drop_watch ON sql_drop
   EXECUTE FUNCTION extensions.pgrst_drop_watch();


--
-- PostgreSQL database dump complete
--

\unrestrict awlz9FpqJJSPmCdxZv0ESrtKp7Sv9cLjsdgmsJD3Fk92h8HKmxGGtSYmerXuxrr

