CREATE TABLE
  graphile_worker.migrations (
    id integer NOT NULL DEFAULT NULL,
    ts timestamp with time zone NOT NULL DEFAULT now(),
    breaking boolean NOT NULL DEFAULT false
  );

;

CREATE UNIQUE INDEX migrations_pkey ON graphile_worker.migrations USING btree (id);