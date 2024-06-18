CREATE
OR REPLACE FUNCTION public.hmac (bytea, bytea, text) RETURNS bytea LANGUAGE c IMMUTABLE PARALLEL SAFE STRICT AS '$libdir/pgcrypto',
$function$pg_hmac$function$;