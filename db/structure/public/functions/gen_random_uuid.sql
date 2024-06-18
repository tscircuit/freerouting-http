CREATE
OR REPLACE FUNCTION public.gen_random_uuid () RETURNS uuid LANGUAGE c PARALLEL SAFE AS '$libdir/pgcrypto',
$function$pg_random_uuid$function$;