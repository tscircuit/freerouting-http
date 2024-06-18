import { withEdgeSpec } from "http-api/middleware/with-edge-spec"
import { z } from "zod"

export default withEdgeSpec({
  auth: "none",
  methods: ["GET", "POST"],
  jsonResponse: z.object({ ok: z.boolean() }),
})((_req, ctx) => {
  return ctx.json({ ok: true })
})
