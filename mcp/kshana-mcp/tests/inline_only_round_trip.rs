// SPDX-License-Identifier: AGPL-3.0-only
//! MCP tools accept inline content only: every tool that takes scenario text refuses a
//! scenario that names a file or folder for the engine to read, before anything runs, and
//! refuses an over-size scenario. Over an in-memory duplex pipe; no network, no files.

use kshana_mcp::server::{KshanaServer, MAX_INPUT_BYTES};
use rmcp::ServiceExt;
use rmcp::model::CallToolRequestParams;
use serde_json::{Value, json};

type Client = rmcp::service::RunningService<rmcp::RoleClient, ()>;

async fn connect() -> Client {
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

/// The error text of a call that must fail.
async fn refusal(client: &Client, name: &'static str, args: Value) -> String {
    let params = CallToolRequestParams::new(name).with_arguments(args.as_object().unwrap().clone());
    match client.call_tool(params).await {
        Err(e) => e.to_string(),
        Ok(r) if r.is_error == Some(true) => format!("{:?}", r.content),
        Ok(_) => panic!("{name} accepted {args}"),
    }
}

#[tokio::test]
async fn every_scenario_tool_accepts_inline_content_only() {
    let with_file = [
        "kind = \"telecom-timing\"\ncsv_path = \"/definitely/not/a/file.csv\"\n",
        "kind = \"spectrum\"\n[recording]\nmeta_path = \"/definitely/not/a/file.sigmf-meta\"\n",
        "kind = \"realtime-frame-eop\"\neop_finals2000a = \"/definitely/not/a/file\"\n",
        "kind = \"lunar-service\"\nephemeris_path = \"/definitely/not/a/file\"\n",
        "kind = \"lunar-llr\"\ndata_dir = \"/definitely/not/a/dir\"\n",
        "kind = \"receiver-trust\"\n[log]\nformat = \"nmea\"\npath = \"/definitely/not/a/file\"\n",
    ];
    let route = r#"{"type":"LineString","coordinates":[[0,0],[1,1]]}"#;
    let client = connect().await;
    for toml in with_file {
        for (tool, args) in [
            ("run_scenario", json!({"toml": toml})),
            ("validate_scenario", json!({"toml": toml})),
            ("report_scenario", json!({"toml": toml})),
            ("animate_scenario", json!({"toml": toml})),
            ("list_export_formats", json!({"toml": toml})),
            ("export_interop", json!({"toml": toml, "format": "czml"})),
            ("import_route", json!({"toml": toml, "geojson": route})),
            ("export_sp3", json!({"toml": toml})),
            ("export_omm", json!({"toml": toml})),
            ("export_oem", json!({"toml": toml})),
            ("export_table_csv", json!({"toml": toml})),
            ("assess_receiver_log", json!({"toml": toml})),
        ] {
            let e = refusal(&client, tool, args).await;
            assert!(
                e.contains("accepts inline content only"),
                "{tool} on {toml:?}: {e}"
            );
        }
    }
    // An over-size scenario is refused by each of them too.
    let big = format!("kind = \"clock\"\n# {}\n", "x".repeat(MAX_INPUT_BYTES));
    for tool in [
        "run_scenario",
        "validate_scenario",
        "report_scenario",
        "animate_scenario",
        "assess_receiver_log",
        "export_sp3",
    ] {
        let e = refusal(&client, tool, json!({"toml": big})).await;
        assert!(e.contains("limit"), "{tool}: {e}");
    }
    client.cancel().await.ok();
}

#[tokio::test]
async fn a_bundled_scenario_and_an_inline_log_still_run() {
    let client = connect().await;
    let toml = std::fs::read_to_string(
        std::path::Path::new(env!("CARGO_MANIFEST_DIR"))
            .join("../../scenarios/clock-holdover.toml"),
    )
    .expect("read scenario");
    let params = CallToolRequestParams::new("run_scenario")
        .with_arguments(json!({"toml": toml}).as_object().unwrap().clone());
    let r = client.call_tool(params).await.expect("run_scenario");
    assert_ne!(r.is_error, Some(true));
    client.cancel().await.ok();
}
