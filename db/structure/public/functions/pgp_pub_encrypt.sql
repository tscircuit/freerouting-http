CREATE
OR REPLACE FUNCTION public.pgp_pub_encrypt (text, bytea, text) RETURNS bytea LANGUAGE c PARALLEL SAFE STRICT AS '$libdir/pgcrypto',
$function$pgp_pub_encrypt_text$function$;