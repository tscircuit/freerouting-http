CREATE
OR REPLACE FUNCTION public.digest (bytea, text) RETURNS bytea LANGUAGE c IMMUTABLE PARALLEL SAFE STRICT AS '$libdir/pgcrypto',
$function$pg_digest$function$;