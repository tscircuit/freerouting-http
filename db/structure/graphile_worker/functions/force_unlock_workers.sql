CREATE
OR REPLACE FUNCTION graphile_worker.force_unlock_workers (worker_ids text[]) RETURNS void LANGUAGE sql AS $function$
update "graphile_worker"._private_jobs as jobs
set locked_at = null, locked_by = null
where locked_by = any(worker_ids);
update "graphile_worker"._private_job_queues as job_queues
set locked_at = null, locked_by = null
where locked_by = any(worker_ids);
$function$;