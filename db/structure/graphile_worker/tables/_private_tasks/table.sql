CREATE TABLE
  graphile_worker._private_tasks (
    id integer NOT NULL DEFAULT NULL,
    identifier text NOT NULL DEFAULT NULL
  );

;

CREATE UNIQUE INDEX tasks_pkey ON graphile_worker._private_tasks USING btree (id);

CREATE UNIQUE INDEX tasks_identifier_key ON graphile_worker._private_tasks USING btree (identifier);