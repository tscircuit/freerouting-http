CREATE TABLE
  graphile_worker._private_job_queues (
    id integer NOT NULL DEFAULT NULL,
    queue_name text NOT NULL DEFAULT NULL,
    locked_at timestamp with time zone NULL DEFAULT NULL,
    locked_by text NULL DEFAULT NULL,
    is_available boolean NOT NULL DEFAULT NULL
  );

;

CREATE UNIQUE INDEX job_queues_pkey1 ON graphile_worker._private_job_queues USING btree (id);

CREATE UNIQUE INDEX job_queues_queue_name_key ON graphile_worker._private_job_queues USING btree (queue_name);