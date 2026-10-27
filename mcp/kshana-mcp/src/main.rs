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

/// The usage text, in the language of the operator (see [`http::operator`]).
fn usage() -> String {
    http::operator(|| kshana::t!("mcp-main-usage"))
}

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
                let v = it.next().ok_or_else(|| {
                    anyhow::anyhow!(kshana::terr!("e-mcp-main-needs-value", a = a))
                })?;
                if a == "--http" {
                    cfg = Some(HttpConfig::new(http::parse_addr(v)?));
                } else {
                    rest.push((a.clone(), v.clone()));
                }
            }
            other => bail!(
                "{}\n\n{}",
                http::operator(|| kshana::terr!("e-mcp-main-unknown-argument", other = other)),
                usage()
            ),
        }
    }
    let Some(mut cfg) = cfg else {
        if allow_remote || !rest.is_empty() {
            bail!(
                "{}\n\n{}",
                http::operator(|| kshana::terr!("e-mcp-main-http-options-need-http")),
                usage()
            );
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
        print!("{}", usage());
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
