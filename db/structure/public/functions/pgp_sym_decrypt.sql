CREATE
OR REPLACE FUNCTION public.pgp_sym_decrypt (bytea, text, text) RETURNS text LANGUAGE c IMMUTABLE PARALLEL SAFE STRICT AS '$libdir/pgcrypto',
$function$pgp_sym_decrypt_text$function$;