// SPDX-License-Identifier: AGPL-3.0-only
//! End-to-end MCP round-trip for the maritime-trust, training-NMEA and interference-map
//! tools, over an in-memory duplex pipe, on the repository's synthetic examples only (no
//! network, no file access by the server). Also pins the input caps and the refusal of a
//! `path` source in `assess_receiver_log`.

use kshana_mcp::marine::{MAX_REPLY_LINES, MAX_REPORT_LINES, MAX_UPLOAD_BYTES};
use kshana_mcp::server::KshanaServer;
use rmcp::ServiceExt;
use rmcp::model::CallToolRequestParams;
use serde_json::{Value, json};
use std::path::{Path, PathBuf};

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

fn root() -> PathBuf {
    Path::new(env!("CARGO_MANIFEST_DIR")).join("../..")
}

fn read(rel: &str) -> String {
    std::fs::read_to_string(root().join(rel)).unwrap_or_else(|e| panic!("{rel}: {e}"))
}

/// Call a tool; the texts of a successful reply, or the error message.
async fn call(client: &Client, name: &'static str, args: Value) -> Result<Vec<String>, String> {
    let params = CallToolRequestParams::new(name).with_arguments(args.as_object().unwrap().clone());
    match client.call_tool(params).await {
        Err(e) => Err(e.to_string()),
        Ok(r) if r.is_error == Some(true) => Err(format!("{:?}", r.content)),
        Ok(r) => Ok(r
            .content
            .iter()
            .filter_map(|c| c.as_text().map(|t| t.text.clone()))
            .collect()),
    }
}

/// Seconds 1400 to 1800 of the synthetic 3000-second ferry log (the drag-off starts at
/// 1500 s), and a session with a 60 s calibration window.
fn excerpt_and_session() -> (String, String) {
    let nmea = read("examples/maritime-trust/tallinn-helsinki.nmea");
    let at = |t: usize| nmea[..nmea.len() * t / 3000].rfind('\n').unwrap() + 1;
    let session = read("examples/maritime-trust/session.toml")
        .replace("path = \"tallinn-helsinki.nmea\"", "")
        .replace("calibration_s = 300.0", "calibration_s = 60.0");
    (nmea[at(1400)..at(1800)].to_string(), session)
}

fn custom() -> Value {
    json!({
        "dataset": "custom",
        "licence": "CC0-1.0",
        "licence_url": "https://creativecommons.org/publicdomain/zero/1.0/",
        "attribution": "Synthetic data generated for Kshana documentation. Not real observations.",
    })
}

#[tokio::test]
async fn the_new_tools_are_listed_with_their_caveats() {
    let client = connect().await;
    let tools = client.list_all_tools().await.expect("list tools");
    let desc = |n: &str| {
        tools
            .iter()
            .find(|t| t.name == n)
            .unwrap_or_else(|| panic!("tool {n} not served"))
            .description
            .clone()
            .unwrap_or_default()
            .to_string()
    };
    assert!(desc("assess_vessel_stream").contains("Advisory only"));
    assert!(desc("assess_vessel_log").contains("Advisory only"));
    assert!(desc("create_evidence_pack").contains("not a legal opinion"));
    assert!(desc("create_evidence_pack").contains("never returned or logged"));
    assert!(desc("verify_evidence_pack").contains("does not say what caused"));
    assert!(desc("verify_evidence_pack").contains("intact-signer-not-pinned"));
    assert!(desc("assess_vessel_stream").contains("MODELLED"));
    assert!(desc("generate_training_nmea").contains("TEXT ONLY"));
    assert!(desc("generate_training_nmea").contains("never for a vessel's live navigation"));
    assert!(desc("build_interference_map").contains("does not identify interference as the cause"));
    assert!(desc("route_exposure").contains("not a forecast"));
    for t in ["compliance_report", "compliance_mapping"] {
        let d = desc(t);
        assert!(d.contains("not a finding that a framework is met"), "{t}");
        assert!(d.contains("rated or approved by anyone"), "{t}");
    }
    client.cancel().await.ok();
}

#[tokio::test]
async fn vessel_stream_excerpt_is_scored() {
    let (nmea, session) = excerpt_and_session();
    let client = connect().await;
    let t = call(
        &client,
        "assess_vessel_stream",
        json!({"session_toml": session, "nmea": nmea}),
    )
    .await
    .expect("assess_vessel_stream");
    let v: Value = serde_json::from_str(&t[0]).unwrap();
    assert!(v["summary"]["epochs"].as_u64().unwrap() > 300, "{v}");
    assert!(v["summary"]["untrusted"].as_u64().unwrap() > 0);
    assert!(v["summary"]["lowest_score"].as_f64().unwrap() < 55.0);
    assert!(v["notice"].as_str().unwrap().contains("Advisory only"));
    assert!(v["last_pksht"].as_str().unwrap().starts_with("$PKSHT"));
    let lines: Vec<&str> = v["first_non_nominal_epochs_jsonl"]
        .as_str()
        .unwrap()
        .lines()
        .collect();
    assert!(!lines.is_empty() && lines.len() <= MAX_REPORT_LINES);
    let first: Value = serde_json::from_str(lines[0]).unwrap();
    assert!(first["score"].is_number() && first["state"] != "nominal");
    // A static platform is refused with the reason.
    let e = call(
        &client,
        "assess_vessel_stream",
        json!({"session_toml": "[platform]\nkind = \"static\"", "nmea": nmea}),
    )
    .await
    .unwrap_err();
    assert!(e.contains("vessel"), "{e}");
    client.cancel().await.ok();
}

#[tokio::test]
async fn vessel_log_batch_is_trimmed_to_counts_and_notable_epochs() {
    let (nmea, session) = excerpt_and_session();
    let client = connect().await;
    let t = call(
        &client,
        "assess_vessel_log",
        json!({"session_toml": session, "nmea": nmea}),
    )
    .await
    .expect("assess_vessel_log");
    let v: Value = serde_json::from_str(&t[0]).unwrap();
    let counts = &v["epochs"]["counts_by_state"];
    assert!(counts["untrusted"].as_u64().unwrap() > 0, "{counts}");
    let notable = v["epochs"]["first_degraded_or_untrusted"]
        .as_array()
        .unwrap();
    assert!(!notable.is_empty() && notable.len() <= MAX_REPORT_LINES);
    assert!(v["notice"].as_str().unwrap().contains("Advisory only"));
    client.cancel().await.ok();
}

#[tokio::test]
async fn evidence_pack_is_created_then_verified_and_tampering_is_caught() {
    let (nmea, session) = excerpt_and_session();
    let seed = "07".repeat(32);
    let client = connect().await;
    let t = call(
        &client,
        "create_evidence_pack",
        json!({"session_toml": session, "nmea": nmea, "from_s": 100.0, "to_s": 300.0,
               "title": "synthetic", "signing_key_seed_hex": seed}),
    )
    .await
    .expect("create_evidence_pack");
    // The seed is never in the reply.
    assert!(
        !t[0].contains(&seed),
        "the signing seed must not be returned"
    );
    let v: Value = serde_json::from_str(&t[0]).unwrap();
    assert!(
        v["notice"]
            .as_str()
            .unwrap()
            .contains("not a legal opinion")
    );
    let pk = v["public_key"].as_str().unwrap().to_string();
    assert_eq!(pk.len(), 64);
    assert!(v["epochs_in_window"].as_u64().unwrap() > 100);
    for f in [
        "manifest.json",
        "manifest.sig",
        "epochs.json",
        "summary.html",
        "log-slice.bin",
    ] {
        assert!(v["files"].get(f).is_some(), "{f}");
    }
    let ok = call(
        &client,
        "verify_evidence_pack",
        json!({"files": v["files"], "public_key": pk, "full_log": nmea}),
    )
    .await
    .expect("verify_evidence_pack");
    let rep: Value = serde_json::from_str(&ok[0]).unwrap();
    assert_eq!(rep["ok"], true, "{rep}");
    assert_eq!(rep["signer_pinned"], true);
    assert_eq!(rep["verdict"], "verified");
    // With no trusted key the pack is intact but the signer is not pinned: never "verified".
    let unpinned = call(
        &client,
        "verify_evidence_pack",
        json!({"files": v["files"]}),
    )
    .await
    .unwrap();
    let u: Value = serde_json::from_str(&unpinned[0]).unwrap();
    assert_eq!(u["verdict"], "intact-signer-not-pinned", "{u}");
    assert_eq!(u["signer_pinned"], false);
    assert!(u["message"].as_str().unwrap().contains("NOT PINNED"));
    // A timestamp can be required; this pack has none.
    let need = call(
        &client,
        "verify_evidence_pack",
        json!({"files": v["files"], "public_key": pk, "require_timestamp": true}),
    )
    .await
    .unwrap();
    assert_eq!(
        serde_json::from_str::<Value>(&need[0]).unwrap()["verdict"],
        "failed"
    );
    // One changed byte in epochs.json fails, naming the file.
    let mut files = v["files"].clone();
    let e = files["epochs.json"]["utf8"]
        .as_str()
        .unwrap()
        .replacen("nominal", "NOMINAL", 1);
    files["epochs.json"] = json!({"utf8": e});
    let bad = call(
        &client,
        "verify_evidence_pack",
        json!({"files": files, "public_key": pk}),
    )
    .await
    .unwrap();
    let rep: Value = serde_json::from_str(&bad[0]).unwrap();
    assert_eq!(rep["ok"], false);
    assert!(bad[0].contains("epochs.json"), "{}", bad[0]);
    // A different trusted key fails too.
    let other = call(
        &client,
        "verify_evidence_pack",
        json!({"files": v["files"], "public_key": "09".repeat(32)}),
    )
    .await
    .unwrap();
    assert_eq!(
        serde_json::from_str::<Value>(&other[0]).unwrap()["ok"],
        false
    );
    // Malformed input is an error, not a panic.
    assert!(
        call(&client, "verify_evidence_pack", json!({"files": [1]}))
            .await
            .is_err()
    );
    assert!(
        call(
            &client,
            "verify_evidence_pack",
            json!({"files": v["files"], "public_key": "zz"})
        )
        .await
        .is_err()
    );
    // Without a seed a one-time key is used and the reply says so; an empty window is refused.
    let t = call(
        &client,
        "create_evidence_pack",
        json!({"session_toml": session, "nmea": nmea, "from_s": 100.0, "to_s": 300.0}),
    )
    .await
    .unwrap();
    assert!(t[0].contains("one-time key"));
    assert!(
        call(
            &client,
            "create_evidence_pack",
            json!({"session_toml": session, "nmea": nmea, "from_s": 9000.0, "to_s": 9100.0})
        )
        .await
        .is_err()
    );
    client.cancel().await.ok();
}

#[tokio::test]
async fn oversize_inputs_are_refused() {
    let client = connect().await;
    let big = "x".repeat(MAX_UPLOAD_BYTES + 1);
    for (tool, args) in [
        (
            "assess_vessel_stream",
            json!({"session_toml": "[platform]\nkind = \"vessel\"", "nmea": big}),
        ),
        ("generate_training_nmea", json!({"toml": big})),
        (
            "assess_vessel_log",
            json!({"session_toml": "[platform]\nkind = \"vessel\"", "nmea": big}),
        ),
        (
            "create_evidence_pack",
            json!({"session_toml": "[platform]\nkind = \"vessel\"", "nmea": big, "from_s": 0.0, "to_s": 1.0}),
        ),
        ("verify_evidence_pack", json!({"files": {"a": big}})),
        (
            "build_interference_map",
            json!({"source": "adsb", "csv": big, "dataset": "adsb-lol"}),
        ),
        ("route_exposure", json!({"route": big, "maps": ["{}"]})),
        ("assess_receiver_log", json!({"toml": big})),
    ] {
        let e = call(&client, tool, args).await.unwrap_err();
        assert!(e.contains("limit"), "{tool}: {e}");
    }
    client.cancel().await.ok();
}

#[tokio::test]
async fn assess_receiver_log_takes_inline_content_only() {
    let client = connect().await;
    let toml = "kind = \"receiver-trust\"\n[log]\nformat = \"nmea\"\npath = \"/etc/passwd\"\n";
    let e = call(&client, "assess_receiver_log", json!({"toml": toml}))
        .await
        .unwrap_err();
    assert!(e.contains("path"), "{e}");
    client.cancel().await.ok();
}

#[tokio::test]
async fn training_nmea_is_deterministic_text_with_an_instructor_log() {
    let toml = read("scenarios/training/open-sea-jamming.toml");
    let client = connect().await;
    let a = call(&client, "generate_training_nmea", json!({"toml": toml}))
        .await
        .expect("generate_training_nmea");
    let b = call(&client, "generate_training_nmea", json!({"toml": toml}))
        .await
        .unwrap();
    assert_eq!(a[0], b[0], "deterministic per seed");
    let v: Value = serde_json::from_str(&a[0]).unwrap();
    assert_eq!(v["instructor_log"]["schema"], "kshana-nmea-training/1");
    assert!(
        v["nmea"].as_str().unwrap().contains("$GP") || v["nmea"].as_str().unwrap().contains("$GN")
    );
    assert!(v["nmea"].as_str().unwrap().lines().count() <= MAX_REPLY_LINES);
    assert!(v["notice"].as_str().unwrap().contains("never feed"));
    let seeded = call(
        &client,
        "generate_training_nmea",
        json!({"toml": toml, "seed": 7}),
    )
    .await
    .unwrap();
    assert_ne!(
        serde_json::from_str::<Value>(&seeded[0]).unwrap()["nmea"],
        v["nmea"]
    );
    let log_only = call(
        &client,
        "generate_training_nmea",
        json!({"toml": toml, "include_nmea": false}),
    )
    .await
    .unwrap();
    assert!(
        serde_json::from_str::<Value>(&log_only[0])
            .unwrap()
            .get("nmea")
            .is_none()
    );
    assert!(
        call(
            &client,
            "generate_training_nmea",
            json!({"toml": "[scenario]"})
        )
        .await
        .is_err()
    );
    client.cancel().await.ok();
}

#[tokio::test]
async fn interference_map_then_route_exposure_round_trip() {
    let client = connect().await;
    let mut args = custom();
    args["source"] = "adsb".into();
    args["csv"] = read("examples/interference-map/input/adsb.csv").into();
    let t = call(&client, "build_interference_map", args)
        .await
        .expect("build_interference_map");
    let head: Value = serde_json::from_str(&t[0]).unwrap();
    assert_eq!(head["days"][0]["date"], "2026-03-01");
    assert!(head["days"][0]["cells_flagged"].as_u64().unwrap() >= 1);
    assert!(head["caveats"].as_str().unwrap().contains("MODELLED"));
    let doc: Value = serde_json::from_str(&t[1]).unwrap();
    assert_eq!(
        doc["kshana_interference_map"]["schema"],
        "kshana-interference-map/v1"
    );
    // The sample the CLI wrote, normalised for the engine version.
    let mut sample: Value = serde_json::from_str(&read(
        "examples/interference-map/output/adsb-custom-2026-03-01.geojson",
    ))
    .unwrap();
    let mut got = doc.clone();
    for v in [&mut got, &mut sample] {
        v["kshana_interference_map"]["kshana_version"] = "X".into();
    }
    assert_eq!(got, sample);

    let route = r#"{"type":"LineString","coordinates":[[-50.0,30.2],[-47.0,30.2]]}"#;
    let r = call(
        &client,
        "route_exposure",
        json!({"route": route, "maps": [t[1]]}),
    )
    .await
    .expect("route_exposure");
    let rep: Value = serde_json::from_str(&r[0]).unwrap();
    assert!(rep.is_object());
    let e = call(
        &client,
        "route_exposure",
        json!({"route": route, "maps": [t[1]], "date_from": "2030-01-01"}),
    )
    .await
    .unwrap_err();
    assert!(e.contains("no map"), "{e}");
    client.cancel().await.ok();
}

#[tokio::test]
async fn interference_map_checks_the_dataset_and_the_source() {
    let client = connect().await;
    let csv = read("examples/interference-map/input/ais.csv");
    let e = call(
        &client,
        "build_interference_map",
        json!({"source": "ais", "csv": csv, "dataset": "custom"}),
    )
    .await
    .unwrap_err();
    assert!(e.contains("licence"), "{e}");
    let e = call(
        &client,
        "build_interference_map",
        json!({"source": "ais", "csv": csv, "dataset": "adsb-lol"}),
    )
    .await
    .unwrap_err();
    assert!(e.contains("data"), "{e}");
    let e = call(
        &client,
        "build_interference_map",
        json!({"source": "radar", "csv": "", "dataset": "custom"}),
    )
    .await
    .unwrap_err();
    assert!(e.contains("adsb"), "{e}");
    // AIS with the synthetic land file works and is labelled by source.
    let mut args = custom();
    args["source"] = "ais".into();
    args["csv"] = csv.into();
    args["land_geojson"] = read("examples/interference-map/input/land.geojson").into();
    let t = call(&client, "build_interference_map", args).await.unwrap();
    assert!(t[0].contains("ais-custom-2026-03-01"));
    client.cancel().await.ok();
}

/// Every tool that takes scenario text refuses a scenario that names a file for the engine to
/// read, before anything runs; the server accepts inline content only. The refusal comes from
/// the check, not from the engine failing to find the file: the message names the field.
#[tokio::test]
async fn every_scenario_tool_accepts_inline_content_only() {
    let with_file = [
        "kind = \"telecom-timing\"\ncsv_path = \"/definitely/not/a/file.csv\"\n",
        "kind = \"spectrum\"\n[recording]\nmeta_path = \"/definitely/not/a/file.sigmf-meta\"\n",
        "kind = \"realtime-frame-eop\"\neop_finals2000a = \"/definitely/not/a/file\"\n",
        "kind = \"lunar-service\"\nephemeris_path = \"/definitely/not/a/file\"\n",
        "kind = \"lunar-llr\"\ndata_dir = \"/definitely/not/a/dir\"\n",
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
            let e = call(&client, tool, args).await.unwrap_err();
            assert!(
                e.contains("accepts inline content only"),
                "{tool} on {toml:?}: {e}"
            );
        }
    }
    // An over-size scenario is refused by every one of them too.
    let big = format!("kind = \"clock\"\n# {}\n", "x".repeat(MAX_UPLOAD_BYTES));
    for tool in ["run_scenario", "report_scenario", "export_sp3"] {
        let e = call(&client, tool, json!({"toml": big})).await.unwrap_err();
        assert!(e.contains("limit"), "{tool}: {e}");
    }
    client.cancel().await.ok();
}

#[tokio::test]
async fn compliance_report_fills_the_mapping_and_keeps_the_statement() {
    let client = connect().await;
    let result = json!({
        "scenario_hash": "0123456789abcdef0123",
        "log": {"format": "nmea", "epochs": 10},
        "monitors_run": ["cn0"],
        "events_evaluable": 2, "events_detected": 2,
        "predictions_evaluable": 1, "predictions_agreeing": 1,
    })
    .to_string();
    let out = call(
        &client,
        "compliance_report",
        json!({"runs": [
            {"label": "trust.result.json", "result": result},
            {"label": "bad.json", "result": "not json"},
        ]}),
    )
    .await
    .unwrap();
    let v: Value = serde_json::from_str(&out[0]).unwrap();
    let statement = v["statement"].as_str().unwrap();
    assert!(statement.contains("is not a finding that a framework is met"));
    assert!(v["markdown"].as_str().unwrap().contains(statement));
    assert_eq!(v["runs"].as_array().unwrap().len(), 1);
    assert_eq!(v["unrecognised"].as_array().unwrap().len(), 1);
    assert!(
        v["rows"]
            .as_array()
            .unwrap()
            .iter()
            .all(|r| !r["gap"].as_str().unwrap().is_empty())
    );
    let low = out[0]
        .to_lowercase()
        .replace("conformance framework", "")
        .replace("conformance_framework", "");
    for banned in ["certif", "complies", "compliant", "conform"] {
        assert!(!low.contains(banned), "{banned}");
    }
    // The static tables and the sources.
    for sources in [false, true] {
        let m = call(&client, "compliance_mapping", json!({"sources": sources}))
            .await
            .unwrap();
        assert!(m[0].starts_with("> A row marked evidenced"));
    }
    // A run list over the cap is refused.
    let many: Vec<Value> = (0..65)
        .map(|i| json!({"label": format!("r{i}"), "result": "{}"}))
        .collect();
    assert!(
        call(&client, "compliance_report", json!({"runs": many}))
            .await
            .is_err()
    );
    client.cancel().await.ok();
}
