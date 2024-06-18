import { createWithEdgeSpec } from "edgespec"

export const withEdgeSpec = createWithEdgeSpec({
  beforeAuthMiddleware: [],
  authMiddleware: {},
  afterAuthMiddleware: [],

  // Defaults to true. When true, all JSON responses are validated against the route's response schema.
  shouldValidateResponses: false,
})
