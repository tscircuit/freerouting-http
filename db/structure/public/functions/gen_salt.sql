CREATE
OR REPLACE FUNCTION public.gen_salt (text, integer) RETURNS text LANGUAGE c PARALLEL SAFE STRICT AS '$libdir/pgcrypto',
$function$pg_gen_salt_rounds$function$;