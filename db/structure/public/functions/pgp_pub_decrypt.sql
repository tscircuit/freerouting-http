CREATE
OR REPLACE FUNCTION public.pgp_pub_decrypt (bytea, bytea, text, text) RETURNS text LANGUAGE c IMMUTABLE PARALLEL SAFE STRICT AS '$libdir/pgcrypto',
$function$pgp_pub_decrypt_text$function$;