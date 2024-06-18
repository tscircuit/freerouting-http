CREATE
OR REPLACE FUNCTION public.pgp_sym_decrypt_bytea (bytea, text, text) RETURNS bytea LANGUAGE c IMMUTABLE PARALLEL SAFE STRICT AS '$libdir/pgcrypto',
$function$pgp_sym_decrypt_bytea$function$;