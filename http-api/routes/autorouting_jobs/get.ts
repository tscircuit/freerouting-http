import { withEdgeSpec } from "http-api/middleware/with-edge-spec"
import { z } from "zod"

export default withEdgeSpec({
  auth: "none",
  methods: ["GET", "POST"],
})(async (req, res) => {
  return new Response("TODO")
})
