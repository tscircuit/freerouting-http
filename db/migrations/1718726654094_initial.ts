import { autorouting_job } from "http-api/models/autorouting_job"
import { ColumnDefinitions, MigrationBuilder, PgLiteral } from "node-pg-migrate"

export const shorthands: ColumnDefinitions = {
  primary_uuid: {
    type: "uuid",
    primaryKey: true,
    notNull: true,
    default: PgLiteral.create("gen_random_uuid()"),
  },
  created_or_modified_at: {
    type: "timestamptz",
    notNull: true,
    default: PgLiteral.create("current_timestamp"),
  },
}

export async function up(pgm: MigrationBuilder): Promise<void> {
  pgm.createExtension("pgcrypto", { ifNotExists: true })

  pgm.createTable("autorouting_job", {
    autorouting_job_id: "primary_uuid",

    is_running: { type: "boolean", notNull: true, default: false },
    was_successful: { type: "boolean", notNull: true, default: false },
    has_error: { type: "boolean", notNull: true, default: false },

    error: { type: "jsonb", notNull: false },

    input_dsn: { type: "text", notNull: true },
    output_dsn: { type: "text", notNull: true },

    created_at: "created_or_modified_at",
  })
}
