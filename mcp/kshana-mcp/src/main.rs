// SPDX-License-Identifier: AGPL-3.0-only
//! `kshana-mcp` — serve the Kshana PNT simulator to MCP clients over stdio.
//!
//! Register it with any MCP client (Cursor, JetBrains AI Assistant, and other
//! MCP-compatible assistants/agents) as a `command` pointing at this binary. See the
//! crate README for config snippets.

use anyhow::Result;
use kshana_mcp::server::KshanaServer;
use rmcp::ServiceExt;
use rmcp::transport::stdio;

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

    let service = KshanaServer::new()
        .serve(stdio())
        .await
        .inspect_err(|e| tracing::error!("serving error: {e:?}"))?;
    service.waiting().await?;
    Ok(())
}
