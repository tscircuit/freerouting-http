CREATE
OR REPLACE FUNCTION public.decrypt_iv (bytea, bytea, bytea, text) RETURNS bytea LANGUAGE c IMMUTABLE PARALLEL SAFE STRICT AS '$libdir/pgcrypto',
$function$pg_decrypt_iv$function$;