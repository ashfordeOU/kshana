// SPDX-License-Identifier: AGPL-3.0-only
//! End-to-end MCP round-trip: drive the server with an in-process client over an
//! in-memory duplex pipe (no external process) and assert the real `tools/list` and
//! `tools/call` protocol exchanges. This is the headline "verify via tests" gate for
//! the MCP server.

use kshana_mcp::server::KshanaServer;
use rmcp::ServiceExt;
use rmcp::model::CallToolRequestParams;
use std::collections::BTreeSet;
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

/// All text content items joined — `run_scenario` returns the summary and the JSON as
/// separate items, so a check for a JSON key must scan both, not just the first.
fn all_text(res: &rmcp::model::CallToolResult) -> String {
    res.content
        .iter()
        .filter_map(|c| c.as_text().map(|t| t.text.clone()))
        .collect::<Vec<_>>()
        .join("\n")
}

/// Core `kshana::api` exports that are deliberately NOT served over MCP, each with the
/// reason. Empty on purpose: every public export function currently reaches an agent. An
/// entry here is a decision on the record, which is what the previous silence was not.
const EXPORTS_NOT_SERVED_OVER_MCP: &[(&str, &str)] = &[];

/// The served tool set must match EXACTLY, not merely contain the expected names.
///
/// The predecessor of this test asserted containment over a hard-coded list, which grades
/// neither direction of drift: `export_oem` shipped in the core, the CLI, the WASM bundle
/// and the web app while MCP never gained it, and the test stayed green throughout; a tool
/// dropped from the literal would likewise drop out of the gate with it.
#[tokio::test]
async fn serves_exactly_the_expected_tool_set() {
    let client = connect().await;
    let tools = client.list_all_tools().await.expect("list tools");
    let served: BTreeSet<&str> = tools.iter().map(|t| t.name.as_ref()).collect();
    let expected: BTreeSet<&str> = [
        "run_scenario",
        "list_scenario_kinds",
        "validate_scenario",
        "export_sp3",
        "export_omm",
        "export_oem",
    ]
    .into_iter()
    .collect();
    assert_eq!(
        served,
        expected,
        "MCP tool set drifted: only in server {:?}, only in this test {:?}",
        served.difference(&expected).collect::<Vec<_>>(),
        expected.difference(&served).collect::<Vec<_>>()
    );
    client.cancel().await.ok();
}

/// Cross-face gate: every `pub fn export_*` in the core `kshana::api` must reach an agent as
/// a tool, or be listed in `EXPORTS_NOT_SERVED_OVER_MCP` with a reason.
///
/// The core is read as TEXT rather than linked: this crate is workspace-excluded and cannot
/// enumerate another crate's items at runtime. Reading a path relative to CARGO_MANIFEST_DIR
/// is the same arrangement the scenario tests below already use.
#[tokio::test]
async fn every_core_export_function_is_served() {
    let api =
        std::fs::read_to_string(Path::new(env!("CARGO_MANIFEST_DIR")).join("../../src/api.rs"))
            .expect("read the core kshana::api source");
    // `auto_export_*` are the CLI's write-alongside helpers, not agent-facing entry points,
    // and they do not match this prefix.
    let core_exports: BTreeSet<&str> = api
        .lines()
        .filter_map(|l| l.strip_prefix("pub fn "))
        .filter(|rest| rest.starts_with("export_"))
        .filter_map(|rest| rest.split('(').next())
        .collect();
    // A prefix scan that silently matches nothing would read as a clean gate, so pin the
    // floor: SP3, OMM and OEM have all shipped since v0.16.0.
    assert!(
        core_exports.len() >= 3,
        "parsed only {core_exports:?} from src/api.rs — the scan, not the core, is broken"
    );

    let client = connect().await;
    let tools = client.list_all_tools().await.expect("list tools");
    let served: BTreeSet<&str> = tools.iter().map(|t| t.name.as_ref()).collect();
    client.cancel().await.ok();

    let missing: Vec<&str> = core_exports
        .iter()
        .copied()
        .filter(|n| !served.contains(n))
        .filter(|n| !EXPORTS_NOT_SERVED_OVER_MCP.iter().any(|(e, _)| e == n))
        .collect();
    assert!(
        missing.is_empty(),
        "core kshana::api exports with no MCP tool and no stated reason: {missing:?}"
    );
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
async fn run_scenario_reaches_conflict_resilience_per_vector_survival() {
    // P7-G5: the layered-PNT conflict-resilience analysis and its §4.2 per-vector
    // survival breakdown must be reachable through the MCP `run_scenario` tool, not only
    // from a unit test — the MCP server is a thin `run_toml` wrapper, so this guards that
    // the wiring stays intact.
    let client = connect().await;
    let toml = std::fs::read_to_string(
        Path::new(env!("CARGO_MANIFEST_DIR")).join("../../scenarios/conflict-resilience.toml"),
    )
    .expect("read bundled conflict-resilience scenario");
    let res = client
        .call_tool(call("run_scenario", serde_json::json!({ "toml": toml })))
        .await
        .expect("call run_scenario");
    assert_ne!(res.is_error, Some(true), "run_scenario returned an error");
    // The JSON is a separate content item from the summary, so scan both.
    let text = all_text(&res);
    assert!(
        text.contains("per_vector_survival") && text.contains("sharpest_vector"),
        "MCP run_scenario must surface the §4.2 per-vector survival block"
    );
    assert!(
        text.contains("conflict-resilience") && text.contains("resilience ratio"),
        "MCP run_scenario must carry the conflict-resilience result"
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
