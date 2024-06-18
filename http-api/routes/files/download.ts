import { withEdgeSpec } from "http-api/middleware/with-edge-spec"
import { z } from "zod"

export default withEdgeSpec({
  auth: "none",
  methods: ["GET"],
  queryParams: z
    .object({
      file_id: z.string().uuid(),
    })
    .or(
      z.object({
        autorouting_job_id: z.string().uuid(),
        job_file_type: z.enum(["input_dsn", "output_dsn"]),
      })
    ),
})(async (req, res) => {
  return new Response("TODO")
})
