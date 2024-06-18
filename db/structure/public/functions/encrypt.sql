CREATE
OR REPLACE FUNCTION public.encrypt (bytea, bytea, text) RETURNS bytea LANGUAGE c IMMUTABLE PARALLEL SAFE STRICT AS '$libdir/pgcrypto',
$function$pg_encrypt$function$;