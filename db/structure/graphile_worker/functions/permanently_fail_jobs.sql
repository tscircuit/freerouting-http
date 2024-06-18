CREATE
OR REPLACE FUNCTION graphile_worker.permanently_fail_jobs (
  job_ids bigint[],
  error_message text DEFAULT NULL::text
) RETURNS SETOF graphile_worker._private_jobs LANGUAGE sql AS $function$
  update "graphile_worker"._private_jobs as jobs
    set
      last_error = coalesce(error_message, 'Manually marked as failed'),
      attempts = max_attempts,
      updated_at = now()
    where id = any(job_ids)
    and (
      locked_at is null
    or
      locked_at < NOW() - interval '4 hours'
    )
    returning *;
$function$;