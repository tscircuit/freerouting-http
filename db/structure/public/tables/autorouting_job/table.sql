CREATE TABLE
  public.autorouting_job (
    autorouting_job_id uuid NOT NULL DEFAULT gen_random_uuid (),
    is_running boolean NOT NULL DEFAULT false,
    was_successful boolean NOT NULL DEFAULT false,
    has_error boolean NOT NULL DEFAULT false,
    error jsonb NULL DEFAULT NULL,
    input_dsn text NOT NULL DEFAULT NULL,
    output_dsn text NOT NULL DEFAULT NULL,
    created_at timestamp with time zone NOT NULL DEFAULT CURRENT_TIMESTAMP
  );

;

CREATE UNIQUE INDEX autorouting_job_pkey ON public.autorouting_job USING btree (autorouting_job_id);