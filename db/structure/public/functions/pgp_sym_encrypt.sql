CREATE
OR REPLACE FUNCTION public.pgp_sym_encrypt (text, text, text) RETURNS bytea LANGUAGE c PARALLEL SAFE STRICT AS '$libdir/pgcrypto',
$function$pgp_sym_encrypt_text$function$;