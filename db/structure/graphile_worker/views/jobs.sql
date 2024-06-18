CREATE VIEW
  graphile_worker.jobs AS
SELECT
  jobs.id,
  job_queues.queue_name,
  tasks.identifier AS task_identifier,
  jobs.priority,
  jobs.run_at,
  jobs.attempts,
  jobs.max_attempts,
  jobs.last_error,
  jobs.created_at,
  jobs.updated_at,
  jobs.key,
  jobs.locked_at,
  jobs.locked_by,
  jobs.revision,
  jobs.flags
FROM
  (
    (
      graphile_worker._private_jobs jobs
      JOIN graphile_worker._private_tasks tasks ON ((tasks.id = jobs.task_id))
    )
    LEFT JOIN graphile_worker._private_job_queues job_queues ON ((job_queues.id = jobs.job_queue_id))
  );

;