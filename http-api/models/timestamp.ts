import { z } from "zod"
export const string_timestamp = z
  .union([z.date(), z.string(), z.number()])
  .transform((a) => {
    if (typeof a === "number") {
      return new Date(a).toISOString()
    }
    if (typeof a === "string") {
      return a
    }
    if (a instanceof Date) {
      return a.toISOString()
    }

    throw new Error("Invalid timestamp")
  })
  .pipe(z.string())
