CREATE
OR REPLACE FUNCTION public.pgp_armor_headers (text, OUT key text, OUT value text) RETURNS SETOF record LANGUAGE c IMMUTABLE PARALLEL SAFE STRICT AS '$libdir/pgcrypto',
$function$pgp_armor_headers$function$;