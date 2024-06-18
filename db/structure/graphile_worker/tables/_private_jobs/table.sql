CREATE TABLE
  graphile_worker._private_jobs (
    id bigint NOT NULL DEFAULT NULL,
    job_queue_id integer NULL DEFAULT NULL,
    task_id integer NOT NULL DEFAULT NULL,
    payload json NOT NULL DEFAULT '{}'::json,
    priority smallint NOT NULL DEFAULT 0,
    run_at timestamp with time zone NOT NULL DEFAULT now(),
    attempts smallint NOT NULL DEFAULT 0,
    max_attempts smallint NOT NULL DEFAULT 25,
    last_error text NULL DEFAULT NULL,
    created_at timestamp with time zone NOT NULL DEFAULT now(),
    updated_at timestamp with time zone NOT NULL DEFAULT now(),
    key text NULL DEFAULT NULL,
    locked_at timestamp with time zone NULL DEFAULT NULL,
    locked_by text NULL DEFAULT NULL,
    revision integer NOT NULL DEFAULT 0,
    flags jsonb NULL DEFAULT NULL,
    is_available boolean NOT NULL DEFAULT NULL
  );

;

CREATE UNIQUE INDEX jobs_pkey1 ON graphile_worker._private_jobs USING btree (id);

CREATE UNIQUE INDEX jobs_key_key1 ON graphile_worker._private_jobs USING btree (key);

CREATE INDEX jobs_main_index ON graphile_worker._private_jobs USING btree (priority, run_at) INCLUDE (id, task_id, job_queue_id)
WHERE
  (is_available = true);

CREATE INDEX jobs_no_queue_index ON graphile_worker._private_jobs USING btree (priority, run_at) INCLUDE (id, task_id)
WHERE
  (
    (is_available = true)
    AND (job_queue_id IS NULL)
  );