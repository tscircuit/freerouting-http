import { getConnectionStringFromEnv } from "pg-connection-from-env"

export default {
  worker: {
    connectionString: getConnectionStringFromEnv({
      fallbackDefaults: {
        database: "frh" // freerouting-http ~ frh
      }
    }),
    maxPoolSize: 10,
    pollInterval: 2000,
    preparedStatements: true,
    schema: "graphile_worker",
    crontabFile: "crontab",
    concurrentJobs: 1,
    fileExtensions: [".js", ".cjs", ".mjs", ".ts"],
  },
};