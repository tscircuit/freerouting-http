CREATE
OR REPLACE FUNCTION public.dearmor (text) RETURNS bytea LANGUAGE c IMMUTABLE PARALLEL SAFE STRICT AS '$libdir/pgcrypto',
$function$pg_dearmor$function$;