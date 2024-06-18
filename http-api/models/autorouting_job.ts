import { z } from "zod"
import { string_timestamp } from "./timestamp"

export const autorouting_job = z.object({
  autorouting_job_id: z.string(),

  is_running: z.boolean(),
  was_successful: z.boolean(),
  has_error: z.boolean(),

  error: z.object({
    error_code: z.string(),
    message: z.string(),
  }),

  input_dsn_url: z.string().optional().nullable(),
  output_dsn_url: z.string().optional().nullable(),

  created_at: string_timestamp,
})
