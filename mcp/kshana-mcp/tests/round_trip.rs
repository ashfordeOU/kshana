// SPDX-License-Identifier: Apache-2.0
//! End-to-end MCP round-trip: drive the server with an in-process client over an
//! in-memory duplex pipe (no external process) and assert the real `tools/list` and
//! `tools/call` protocol exchanges. This is the headline "verify via tests" gate for
//! the MCP server.

use kshana_mcp::server::KshanaServer;
use rmcp::ServiceExt;
use rmcp::model::CallToolRequestParams;
use std::path::Path;

/// Spawn the server on one end of a duplex pipe and return a connected client.
async fn connect() -> rmcp::service::RunningService<rmcp::RoleClient, ()> {
    let (server_t, client_t) = tokio::io::duplex(64 * 1024);
    tokio::spawn(async move {
        let svc = KshanaServer::new()
            .serve(server_t)
            .await
            .expect("server serve");
        let _ = svc.waiting().await;
    });
    ().serve(client_t).await.expect("client connect")
}

fn call(name: &'static str, args: serde_json::Value) -> CallToolRequestParams {
    let params = CallToolRequestParams::new(name);
    match args.as_object() {
        Some(map) if !map.is_empty() => params.with_arguments(map.clone()),
        _ => params,
    }
}

fn first_text(res: &rmcp::model::CallToolResult) -> String {
    res.content
        .iter()
        .find_map(|c| c.as_text().map(|t| t.text.clone()))
        .unwrap_or_default()
}

#[tokio::test]
async fn lists_all_five_tools() {
    let client = connect().await;
    let tools = client.list_all_tools().await.expect("list tools");
    let names: Vec<&str> = tools.iter().map(|t| t.name.as_ref()).collect();
    for expected in [
        "run_scenario",
        "list_scenario_kinds",
        "validate_scenario",
        "export_sp3",
        "export_omm",
    ] {
        assert!(
            names.contains(&expected),
            "missing tool {expected}; got {names:?}"
        );
    }
    client.cancel().await.ok();
}

#[tokio::test]
async fn list_scenario_kinds_returns_the_catalogue() {
    let client = connect().await;
    let res = client
        .call_tool(call("list_scenario_kinds", serde_json::json!({})))
        .await
        .expect("call list_scenario_kinds");
    assert_ne!(
        res.is_error,
        Some(true),
        "list_scenario_kinds returned an error"
    );
    let text = first_text(&res);
    // The JSON catalogue must name representative kinds and the field metadata.
    for token in ["clock", "orbit", "gnss-ins", "required_fields"] {
        assert!(text.contains(token), "catalogue missing {token}");
    }
    client.cancel().await.ok();
}

#[tokio::test]
async fn run_scenario_executes_a_real_clock_scenario() {
    let client = connect().await;
    let toml = std::fs::read_to_string(
        Path::new(env!("CARGO_MANIFEST_DIR")).join("../../scenarios/clock-holdover.toml"),
    )
    .expect("read bundled clock scenario");
    let res = client
        .call_tool(call("run_scenario", serde_json::json!({ "toml": toml })))
        .await
        .expect("call run_scenario");
    assert_ne!(
        res.is_error,
        Some(true),
        "run_scenario returned an error result"
    );
    let text = first_text(&res);
    assert!(!text.is_empty(), "run_scenario returned no content");
    // The result must carry a recognizable figure-of-merit term from the clock pack.
    let lower = text.to_lowercase();
    assert!(
        lower.contains("holdover") || lower.contains("quantum") || lower.contains("ns"),
        "run_scenario output missing expected clock FoM tokens: {text:.200}"
    );
    client.cancel().await.ok();
}

#[tokio::test]
async fn validate_scenario_classifies_a_valid_toml_and_rejects_garbage() {
    let client = connect().await;
    let toml = std::fs::read_to_string(
        Path::new(env!("CARGO_MANIFEST_DIR")).join("../../scenarios/clock-holdover.toml"),
    )
    .expect("read bundled clock scenario");
    let ok = client
        .call_tool(call(
            "validate_scenario",
            serde_json::json!({ "toml": toml }),
        ))
        .await
        .expect("call validate_scenario");
    assert_ne!(ok.is_error, Some(true));
    assert!(
        first_text(&ok).contains("clock"),
        "should detect the clock kind"
    );

    // Garbage TOML must come back as a tool error, not a panic.
    let bad = client
        .call_tool(call(
            "validate_scenario",
            serde_json::json!({ "toml": "not a scenario" }),
        ))
        .await;
    assert!(
        bad.is_err() || bad.unwrap().is_error == Some(true),
        "garbage scenario must be rejected"
    );
    client.cancel().await.ok();
}
