CREATE
OR REPLACE FUNCTION public.pgp_key_id (bytea) RETURNS text LANGUAGE c IMMUTABLE PARALLEL SAFE STRICT AS '$libdir/pgcrypto',
$function$pgp_key_id_w$function$;