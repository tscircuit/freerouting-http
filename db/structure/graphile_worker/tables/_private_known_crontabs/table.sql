CREATE TABLE
  graphile_worker._private_known_crontabs (
    identifier text NOT NULL DEFAULT NULL,
    known_since timestamp with time zone NOT NULL DEFAULT NULL,
    last_execution timestamp with time zone NULL DEFAULT NULL
  );

;

CREATE UNIQUE INDEX known_crontabs_pkey ON graphile_worker._private_known_crontabs USING btree (identifier);