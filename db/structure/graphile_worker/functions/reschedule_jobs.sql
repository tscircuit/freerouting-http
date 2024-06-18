CREATE
OR REPLACE FUNCTION graphile_worker.reschedule_jobs (
  job_ids bigint[],
  run_at timestamp with time zone DEFAULT NULL::timestamp with time zone,
  priority integer DEFAULT NULL::integer,
  attempts integer DEFAULT NULL::integer,
  max_attempts integer DEFAULT NULL::integer
) RETURNS SETOF graphile_worker._private_jobs LANGUAGE sql AS $function$
  update "graphile_worker"._private_jobs as jobs
    set
      run_at = coalesce(reschedule_jobs.run_at, jobs.run_at),
      priority = coalesce(reschedule_jobs.priority::smallint, jobs.priority),
      attempts = coalesce(reschedule_jobs.attempts::smallint, jobs.attempts),
      max_attempts = coalesce(reschedule_jobs.max_attempts::smallint, jobs.max_attempts),
      updated_at = now()
    where id = any(job_ids)
    and (
      locked_at is null
    or
      locked_at < NOW() - interval '4 hours'
    )
    returning *;
$function$;