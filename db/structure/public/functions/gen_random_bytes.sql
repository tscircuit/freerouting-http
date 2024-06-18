CREATE
OR REPLACE FUNCTION public.gen_random_bytes (integer) RETURNS bytea LANGUAGE c PARALLEL SAFE STRICT AS '$libdir/pgcrypto',
$function$pg_random_bytes$function$;