# Running kshana-mcp over HTTP (self-hosted)

`kshana-mcp` speaks stdio by default, which is what Claude Desktop, Cursor, VS Code and the other
desktop clients launch. For a client that talks to a URL, `kshana-mcp --http <addr>` serves the same
tools over **streamable HTTP** at `http://<addr>/mcp`.

**Kshana does not host an endpoint.** There is no shared `kshana` server to point a client at. You run
it on your own machine, container or cloud project, and you own its access control and cost.
The 0.35.0 server is the one in this repository: its figures carry their VALIDATED or MODELLED labels
exactly as over stdio.

## The safe defaults

| Control | Behaviour |
|---|---|
| Bind address | Loopback only (`127.0.0.1`, `::1`). A bare port (`--http 8080`) means `127.0.0.1:8080`. |
| Non-loopback | Needs `--allow-remote` **and** a bearer token in the `KSHANA_MCP_HTTP_TOKEN` environment variable (16 characters or more). Without both, the server refuses to start. With both it prints a warning that it is listening beyond this machine. |
| Authentication | `Authorization: Bearer <token>` on every request when a token is set (it can be set on loopback too). Compared in constant time. Missing or wrong: `401`. |
| Filesystem | None. The IQ file tools (`iq_*`) are switched off in HTTP mode whatever `KSHANA_MCP_IQ_DIR` says; every other tool takes its scenario inline and refuses one that names a file. No tool argument reads or writes a path. |
| Body size | `--max-body-bytes`, default 5 MiB (the scenario cap is 4 MiB). Over it: `413`. |
| Time | `--request-timeout-secs`, default 120. Over it: `408`. |
| Concurrency | `--max-concurrent`, default 8 requests at once; the rest wait. |
| CORS | No `Access-Control-*` header is ever sent. A request carrying an `Origin` header is refused (`403`) unless named with `--allow-origin <scheme://host[:port]>`; `*` is not accepted. |
| Host header | Checked against loopback names, or the bind address plus each `--allowed-host`. Behind a proxy or on a platform URL, pass `--allowed-host your.domain`. Anything else: `403`. |
| Sessions | None. Every POST gets a JSON reply; no session table and no server-sent-event stream is kept open. |

TLS is not terminated by `kshana-mcp`. When it is reachable beyond one machine, put HTTPS in front of it
(your platform's TLS, or a reverse proxy) and keep the token secret; a bearer token over plain HTTP can
be read on the wire.

## Local

```bash
kshana-mcp --http 127.0.0.1:8080
```

Client config (a URL client; add the header only when a token is set):

```json
{ "mcpServers": { "kshana": { "url": "http://127.0.0.1:8080/mcp",
    "headers": { "Authorization": "Bearer ${KSHANA_MCP_HTTP_TOKEN}" } } } }
```

## Docker

```bash
export KSHANA_MCP_HTTP_TOKEN="$(openssl rand -hex 32)"
docker run --rm -p 127.0.0.1:8080:8080 -e KSHANA_MCP_HTTP_TOKEN \
  ghcr.io/ashfordeou/kshana-mcp:0.35.0 \
  --http 0.0.0.0:8080 --allow-remote --allowed-host localhost:8080 --allowed-host 127.0.0.1:8080
```

Inside the container the server must listen on `0.0.0.0`, so it needs `--allow-remote` and the token.
Publishing the port as `127.0.0.1:8080:8080` keeps it on your machine; drop the `127.0.0.1:` only when you
mean to expose it, and then terminate TLS in front of it. `docker compose` and Fly.io and Cloud Run
templates are in [`mcp-http/`](mcp-http/).

## Templates (you deploy them; Kshana runs none)

* [`mcp-http/docker-compose.yml`](mcp-http/docker-compose.yml)
* [`mcp-http/fly.toml`](mcp-http/fly.toml): set the token with `fly secrets set KSHANA_MCP_HTTP_TOKEN=...`
* [`mcp-http/cloudrun.service.yaml`](mcp-http/cloudrun.service.yaml): take the token from Secret Manager

Each runs the published image, sets `--allowed-host` to the platform hostname you replace in the file,
and relies on the platform for HTTPS.

## What it is not

* Not a multi-tenant service. Anyone holding the token runs simulations on your hardware; there are no
  per-user quotas beyond the limits above.
* Not an advisory for any operational decision: the simulator's outputs are modelled or validated
  figures for analysis, as everywhere else in Kshana.
