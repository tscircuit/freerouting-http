import { getDbClient } from "db/get-db-client"
import { Middleware } from "edgespec"

export const withDb: Middleware<{}> = async (req, ctx, next) => {
  return next(req, ctx)
}
