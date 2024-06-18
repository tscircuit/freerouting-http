CREATE
OR REPLACE FUNCTION public.pgp_pub_decrypt_bytea (bytea, bytea, text, text) RETURNS bytea LANGUAGE c IMMUTABLE PARALLEL SAFE STRICT AS '$libdir/pgcrypto',
$function$pgp_pub_decrypt_bytea$function$;