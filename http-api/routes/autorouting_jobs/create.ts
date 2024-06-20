import { withEdgeSpec } from "http-api/middleware/with-edge-spec"
import { z } from "zod"
import { quickAddJob } from "graphile-worker"
import { autorouting_job } from "http-api/models/autorouting_job"

export default withEdgeSpec({
  auth: "none",
  methods: ["POST"],
  jsonBody: z.object({
    input_dsn: z.string(),
  }),
  jsonResponse: autorouting_job,
})(async (req, res) => {
  // Queue job in database
})
