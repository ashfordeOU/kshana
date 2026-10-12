// SPDX-License-Identifier: AGPL-3.0-only
//! `kshana-mcp` — serve the Kshana PNT simulator to MCP clients over stdio.
//!
//! Register it with any MCP client (Cursor, JetBrains AI Assistant, and other
//! MCP-compatible assistants/agents) as a `command` pointing at this binary. See the
//! crate README for config snippets. `--http <addr>` serves the same tools over
//! streamable HTTP instead (see [`kshana_mcp::http`] for its security model).

use anyhow::{Result, bail};
use kshana_mcp::http::{self, HttpConfig};
use kshana_mcp::server::KshanaServer;
use rmcp::ServiceExt;
use rmcp::transport::stdio;

const USAGE: &str = "\
kshana-mcp: Model Context Protocol server for the Kshana PNT-resilience simulator.

USAGE:
    kshana-mcp                      serve over stdio (the default; what MCP clients launch)
    kshana-mcp --http <addr>        serve streamable HTTP at http://<addr>/mcp

HTTP OPTIONS:
    --http <addr>               bind address, e.g. 127.0.0.1:8080 (loopback only by default)
    --allow-remote              permit a non-loopback address; needs KSHANA_MCP_HTTP_TOKEN
    --allowed-host <host[:port]>  extra Host header accepted (repeatable)
    --allow-origin <origin>     browser origin accepted (repeatable; none by default)
    --max-body-bytes <n>        request body cap (default 5242880)
    --request-timeout-secs <n>  per-request time limit (default 120)
    --max-concurrent <n>        requests served at once (default 8)

The HTTP transport turns the IQ file tools off. Kshana does not host an endpoint: run it yourself.
";

fn parse_http(args: &[String]) -> Result<Option<HttpConfig>> {
    let mut it = args.iter();
    let mut cfg: Option<HttpConfig> = None;
    let mut rest: Vec<(String, String)> = Vec::new();
    let mut allow_remote = false;
    while let Some(a) = it.next() {
        match a.as_str() {
            "--allow-remote" => allow_remote = true,
            "--http"
            | "--allowed-host"
            | "--allow-origin"
            | "--max-body-bytes"
            | "--request-timeout-secs"
            | "--max-concurrent" => {
                let v = it
                    .next()
                    .ok_or_else(|| anyhow::anyhow!("{a} needs a value"))?;
                if a == "--http" {
                    cfg = Some(HttpConfig::new(http::parse_addr(v)?));
                } else {
                    rest.push((a.clone(), v.clone()));
                }
            }
            other => bail!("unknown argument `{other}`\n\n{USAGE}"),
        }
    }
    let Some(mut cfg) = cfg else {
        if allow_remote || !rest.is_empty() {
            bail!("HTTP options need --http <addr>\n\n{USAGE}");
        }
        return Ok(None);
    };
    cfg.allow_remote = allow_remote;
    cfg.token = std::env::var(http::TOKEN_ENV)
        .ok()
        .filter(|t| !t.is_empty());
    for (k, v) in rest {
        match k.as_str() {
            "--allowed-host" => cfg.allowed_hosts.push(v),
            "--allow-origin" => cfg.allowed_origins.push(v),
            "--max-body-bytes" => cfg.max_body_bytes = v.parse()?,
            "--request-timeout-secs" => {
                cfg.request_timeout = std::time::Duration::from_secs(v.parse()?)
            }
            "--max-concurrent" => cfg.max_concurrent = v.parse()?,
            _ => unreachable!(),
        }
    }
    Ok(Some(cfg))
}

#[tokio::main]
async fn main() -> Result<()> {
    // Logs MUST go to stderr — stdout is the JSON-RPC channel for the MCP protocol.
    tracing_subscriber::fmt()
        .with_writer(std::io::stderr)
        .with_ansi(false)
        .with_env_filter(
            tracing_subscriber::EnvFilter::try_from_default_env()
                .unwrap_or_else(|_| tracing_subscriber::EnvFilter::new("info")),
        )
        .init();

    let args: Vec<String> = std::env::args().skip(1).collect();
    if args.iter().any(|a| a == "--help" || a == "-h") {
        print!("{USAGE}");
        return Ok(());
    }
    if args.iter().any(|a| a == "--version" || a == "-V") {
        println!("kshana-mcp {}", env!("CARGO_PKG_VERSION"));
        return Ok(());
    }
    if let Some(cfg) = parse_http(&args)? {
        return http::serve(cfg).await;
    }

    let service = KshanaServer::new()
        .serve(stdio())
        .await
        .inspect_err(|e| tracing::error!("serving error: {e:?}"))?;
    service.waiting().await?;
    Ok(())
}
