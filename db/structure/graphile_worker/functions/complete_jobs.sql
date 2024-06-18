CREATE
OR REPLACE FUNCTION graphile_worker.complete_jobs (job_ids bigint[]) RETURNS SETOF graphile_worker._private_jobs LANGUAGE sql AS $function$
  delete from "graphile_worker"._private_jobs as jobs
    where id = any(job_ids)
    and (
      locked_at is null
    or
      locked_at < now() - interval '4 hours'
    )
    returning *;
$function$;