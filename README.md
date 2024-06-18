# freerouting-http

This is an HTTP API and web server that wraps the freerouting autorouter.

- [freerouting-http](#freerouting-http)
  - [Installation](#installation)
  - [Web Interface](#web-interface)
  - [HTTP API](#http-api)
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
| `/autorouting_jobs/create` | Create a new autoroute job.                         |
| `/autorouting_jobs/get`    | Get the autorouting job progress, output and result |

## Development

TODO
