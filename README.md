# freerouting-http

This is an HTTP API and web server that wraps the freerouting autorouter.

- [freerouting-http](#freerouting-http)
  - [Installation](#installation)
  - [Web Interface](#web-interface)
  - [HTTP API](#http-api)
    - [`/autorouting_jobs/create`](#autorouting_jobscreate)
    - [`/autorouting_jobs/get`](#autorouting_jobsget)
  - [Development](#development)

## Installation

`npm install -g freerouting-http`

## Web Interface

The web interface is a simple form that allows you to create an autorouting job
and view its progress.

TODO

## HTTP API

- All endpoints accept `POST` requests
- `*/get` endpoints accept `GET` or `POST`
- All endpoints return JSON

| Endpoint                   | Description                                         |
| -------------------------- | --------------------------------------------------- |
| `/autorouting_jobs/create` | Create a new autorouting job.                       |
| `/autorouting_jobs/get`    | Get the autorouting job progress, output and result |

### `/autorouting_jobs/create`

Create a new autorouting job. Takes an `input_dsn` in the Specctra DSN format.
Returns an `autorouting_job` object, use `autorouting_job.autorouting_job_id`
to track the job progress.

`POST` Request Body:

```json
{
  "input_dsn": "(PCB "untitled.brd"\n(parser..."
}
```

Response body:

```json
{
  "autorouting_job_id": "1",
  "display_status": "Autorouting",
  "is_running": true,
  "has_error": false,
  "was_successful": false,

  // Path to input file, uses FREEROUTING_HTTP_BASE_URL
  "input_dsn_url": "http://localhost:3000/files/ece12a7c.dsn",

  // Populated when successful
  "output_dsn_url": null
}
```

### `/autorouting_jobs/get`

Get all the information associated with an existing autorouting job. You can
use `GET` or `POST`

Example call:

```bash
curl http://localhost:3000/autorouting_jobs/get?autorouting_job_id=1
```

Response body after job completes:

```json
{
  "autorouting_job_id": "1",
  "display_status": "Autorouting",
  "is_running": false,
  "has_error": false,
  "was_successful": true,
  "input_dsn_url": "http://localhost:3000/files/ece12a7c.dsn",
  "output_dsn_url": "http://localhost:3000/files/k9f9911c.dsn"
}
```

Response body after job failure:

```json
{
  "autorouting_job_id": "1",
  "display_status": "Autorouting",
  "is_running": false,
  "has_error": true,
  "was_successful": false,
  "input_dsn_url": "http://localhost:3000/files/ece12a7c.dsn",
  "output_dsn_url": null,
  "error": {
    "error_code": "invalid_dsn",
    "message": "DSN file could not be parsed"
  }
}
```

## Development

TODO
