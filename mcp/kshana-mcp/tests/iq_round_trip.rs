// SPDX-License-Identifier: AGPL-3.0-only
//! End-to-end MCP round-trip for the GNSS IQ tools: generate a short synthetic scene into
//! a work directory, then describe, acquire, track and filter it — every step through the
//! real `tools/call` protocol exchange over an in-memory duplex pipe — and check the file
//! contract (paths confined to the work directory, the sample budget, no overwrite without
//! asking, no scratch left behind) on the way.

use kshana_mcp::iq::IqConfig;
use kshana_mcp::server::KshanaServer;
use rmcp::ServiceExt;
use rmcp::model::CallToolRequestParams;
use serde_json::{Value, json};
use std::path::{Path, PathBuf};

type Client = rmcp::service::RunningService<rmcp::RoleClient, ()>;

/// Spawn the server with `iq` on one end of a duplex pipe and return a connected client.
async fn connect(iq: IqConfig) -> Client {
    let (server_t, client_t) = tokio::io::duplex(64 * 1024);
    tokio::spawn(async move {
        let svc = KshanaServer::with_iq_config(iq)
            .serve(server_t)
            .await
            .expect("server serve");
        let _ = svc.waiting().await;
    });
    ().serve(client_t).await.expect("client connect")
}

/// A fresh, empty work directory for one test.
fn work_dir(name: &str) -> PathBuf {
    let dir = std::env::temp_dir().join(format!("kshana-mcp-iq-{name}-{}", std::process::id()));
    let _ = std::fs::remove_dir_all(&dir);
    std::fs::create_dir_all(&dir).expect("create work dir");
    dir
}

/// Call `name` and return its JSON reply, or the error message.
async fn call(client: &Client, name: &'static str, args: Value) -> Result<Value, String> {
    let mut params = CallToolRequestParams::new(name);
    if let Some(map) = args.as_object().filter(|m| !m.is_empty()) {
        params = params.with_arguments(map.clone());
    }
    match client.call_tool(params).await {
        Ok(res) => {
            let failed = res.is_error == Some(true);
            let text = res
                .content
                .iter()
                .find_map(|c| c.as_text().map(|t| t.text.clone()))
                .unwrap_or_default();
            if failed {
                return Err(text);
            }
            Ok(serde_json::from_str(&text).unwrap_or(Value::String(text)))
        }
        Err(e) => Err(e.to_string()),
    }
}

/// The short synthetic scene every test starts from: two GPS L1 C/A satellites at
/// 45 dB-Hz with distinct Dopplers, 2.046 MHz (two samples per chip), 0.2 s.
/// (`scene_acquire_track_frontend_round_trip` lengthens it to 1.5 s, since the tracking
/// bank's C/N0 estimate averages 50 windows of 20 ms before its first value.)
fn scene_args(out: &str) -> Value {
    json!({
        "out": out,
        "rate_hz": 2.046e6,
        "duration_s": 0.2,
        "signal": "gps-l1ca",
        "prns": [3, 17],
        "dopplers_hz": [1250.0, -2400.0],
        "cn0_dbhz": 45.0,
        "seed": 7,
    })
}

fn bytes_of(dir: &Path, rel: &str) -> u64 {
    std::fs::metadata(dir.join(rel))
        .expect("written file")
        .len()
}

/// The files a reply lists, as `path -> bytes`.
fn files(v: &Value) -> Vec<(String, u64)> {
    v["files"]
        .as_array()
        .expect("files array")
        .iter()
        .map(|f| {
            (
                f["path"].as_str().unwrap().to_string(),
                f["bytes"].as_u64().unwrap(),
            )
        })
        .collect()
}

#[tokio::test]
async fn scene_acquire_track_frontend_round_trip() {
    let dir = work_dir("round-trip");
    let client = connect(IqConfig::new(&dir, 5_000_000).unwrap()).await;

    // Set-up: on, confined to the work directory, with the signal list.
    let setup = call(&client, "iq_signals", json!({})).await.unwrap();
    assert_eq!(setup["enabled"], true);
    assert_eq!(setup["max_samples"], 5_000_000);
    assert!(
        setup["signals"]
            .as_array()
            .unwrap()
            .iter()
            .any(|s| s == "gps-l1ca")
    );

    // Scene: the recording, its sidecar and the truth, each reported with its byte count.
    let mut args = scene_args("scene.bin");
    args["duration_s"] = json!(1.5);
    let scene = call(&client, "iq_scene", args).await.unwrap();
    assert_eq!(scene["recording"], "scene.bin");
    assert_eq!(scene["samples"], 3_069_000);
    assert_eq!(scene["sample_rate_hz"], 2.046e6);
    let written = files(&scene);
    let names: Vec<&str> = written.iter().map(|(p, _)| p.as_str()).collect();
    assert_eq!(
        names,
        ["scene.bin", "scene.bin.json", "scene.bin.truth.csv"]
    );
    for (p, n) in &written {
        assert_eq!(*n, bytes_of(&dir, p), "{p}: reported bytes");
    }
    // cf32_le: 8 bytes per complex sample.
    assert_eq!(written[0].1, 3_069_000 * 8);
    assert!(scene["truth_records"].as_u64().unwrap() > 0);
    let truth = scene["truth_first_epoch"].as_array().unwrap();
    assert_eq!(truth.len(), 2);
    assert!(
        !scene["message"]
            .as_str()
            .unwrap()
            .contains(dir.to_str().unwrap()),
        "replies name paths relative to the work directory"
    );

    // Info: the recording as the inventory sees it.
    let info = call(&client, "iq_info", json!({ "recording": "scene.bin" }))
        .await
        .unwrap();
    assert_eq!(info["format"], "cf32_le");
    assert_eq!(info["n_samples"], 3_069_000);
    assert_eq!(info["path"], "scene.bin");

    // Acquire: both PRNs found at the Doppler and code phase the truth says went in.
    let acq = call(
        &client,
        "iq_acquire",
        json!({ "recording": "scene.bin", "signal": "gps-l1ca", "prns": [3, 17], "coherent": 2 }),
    )
    .await
    .unwrap();
    assert_eq!(acq["acquired"], 2, "{acq:#}");
    assert!(
        acq["files"].as_array().unwrap().is_empty(),
        "nothing kept unless asked"
    );
    for (det, t) in acq["detections"].as_array().unwrap().iter().zip(truth) {
        let dd = det["doppler_hz"].as_f64().unwrap() - t["doppler_hz"].as_f64().unwrap();
        assert!(dd.abs() <= 250.0, "Doppler off by {dd} Hz: {det} vs {t}");
        let dc =
            det["code_phase_chips"].as_f64().unwrap() - t["code_phase_chips"].as_f64().unwrap();
        let dc = (dc + 511.5).rem_euclid(1023.0) - 511.5;
        assert!(
            dc.abs() <= 1.0,
            "code phase off by {dc} chips: {det} vs {t}"
        );
        assert!(det["statistic"].as_f64() > det["threshold"].as_f64());
    }

    // Track: both channels locked at the end, C/N0 near what went in; per-epoch files kept.
    // C/N0 is the NWPR estimate (dB-Hz) the loop bank reports once its 50 windows fill.
    let trk = call(
        &client,
        "iq_track",
        json!({
            "recording": "scene.bin", "signal": "gps-l1ca", "prns": [3, 17],
            // No acq_coherent: the default hand-off (auto, ≈4 ms coherent) locks both
            // channels. A one-period search false-locked PRN 17 ~500 Hz off on this scene
            // (`tests/iq_cli.rs::track_default_handoff_does_not_false_lock_where_one_period_did`).
            "json_out": "track.json", "csv_out": "track.csv",
        }),
    )
    .await
    .unwrap();
    assert_eq!(trk["samples_tracked"], 3_069_000);
    for ch in trk["channels"].as_array().unwrap() {
        assert_eq!(ch["locked_at_end"], true, "{ch}");
        assert!(ch["epochs"].as_u64().unwrap() >= 1_400, "{ch}");
        let cn0 = ch["mean_cn0_dbhz"].as_f64().unwrap();
        assert!((cn0 - 45.0).abs() < 4.0, "mean C/N0 {cn0}: {ch}");
    }
    let kept: Vec<&str> = trk["files"]
        .as_array()
        .unwrap()
        .iter()
        .map(|f| f["path"].as_str().unwrap())
        .collect();
    assert_eq!(kept, ["track.json", "track.csv"]);
    let csv = std::fs::read_to_string(dir.join("track.csv")).unwrap();
    assert!(csv.starts_with("code,epoch,"));

    // Front end: a 2-bit quantiser, written as a new recording that acquires again.
    let fe = call(
        &client,
        "iq_frontend",
        json!({ "input": "scene.bin", "out": "scene-2bit.bin", "stages": { "bits": 2 } }),
    )
    .await
    .unwrap();
    assert_eq!(fe["samples"], 3_069_000);
    let fe_files: Vec<String> = files(&fe).into_iter().map(|(p, _)| p).collect();
    assert_eq!(fe_files, ["scene-2bit.bin", "scene-2bit.bin.json"]);
    let again = call(
        &client,
        "iq_acquire",
        json!({ "recording": "scene-2bit.bin", "signal": "gps-l1ca", "prns": [3] }),
    )
    .await
    .unwrap();
    assert_eq!(again["acquired"], 1, "{again:#}");

    // No scratch artifact is left behind.
    let leftovers: Vec<String> = std::fs::read_dir(&dir)
        .unwrap()
        .filter_map(|e| e.ok()?.file_name().into_string().ok())
        .filter(|n| n.starts_with(".kshana-mcp-"))
        .collect();
    assert!(leftovers.is_empty(), "scratch left: {leftovers:?}");

    client.cancel().await.ok();
    std::fs::remove_dir_all(&dir).ok();
}

#[tokio::test]
async fn a_sigmf_scene_is_written_as_a_pair_and_described() {
    let dir = work_dir("sigmf");
    let client = connect(IqConfig::new(&dir, 5_000_000).unwrap()).await;
    let mut args = scene_args("scene.sigmf-meta");
    args["duration_s"] = json!(0.01);
    args["truth_format"] = json!("jsonl");
    let scene = call(&client, "iq_scene", args).await.unwrap();
    assert_eq!(scene["recording"], "scene.sigmf-meta");
    let names: Vec<String> = files(&scene).into_iter().map(|(p, _)| p).collect();
    assert_eq!(
        names,
        [
            "scene.sigmf-data",
            "scene.sigmf-meta",
            "scene.sigmf-meta.truth.jsonl"
        ]
    );
    assert_eq!(scene["truth_first_epoch"].as_array().unwrap().len(), 2);
    let info = call(
        &client,
        "iq_info",
        json!({ "recording": "scene.sigmf-meta" }),
    )
    .await
    .unwrap();
    assert_eq!(info["kind"], "sigmf");
    assert_eq!(info["n_samples"], 20_460);
    client.cancel().await.ok();
    std::fs::remove_dir_all(&dir).ok();
}

#[tokio::test]
async fn the_sample_budget_refuses_before_any_work() {
    let dir = work_dir("budget");
    let client = connect(IqConfig::new(&dir, 100_000).unwrap()).await;
    let err = call(&client, "iq_scene", scene_args("big.bin"))
        .await
        .unwrap_err();
    assert!(
        err.contains("409200 samples") && err.contains("100000"),
        "{err}"
    );
    assert!(!dir.join("big.bin").exists(), "nothing written");

    // A recording longer than the budget tracks only when narrowed to fit.
    let mut small = scene_args("small.bin");
    small["duration_s"] = json!(0.04);
    call(&client, "iq_scene", small).await.unwrap();
    let client2 = connect(IqConfig::new(&dir, 50_000).unwrap()).await;
    let err = call(
        &client2,
        "iq_track",
        json!({ "recording": "small.bin", "signal": "gps-l1ca", "prns": [3] }),
    )
    .await
    .unwrap_err();
    assert!(err.contains("max_seconds"), "{err}");
    let err = call(
        &client2,
        "iq_frontend",
        json!({ "input": "small.bin", "out": "f.bin", "stages": { "agc": true } }),
    )
    .await
    .unwrap_err();
    assert!(err.contains("50000"), "{err}");
    client.cancel().await.ok();
    client2.cancel().await.ok();
    std::fs::remove_dir_all(&dir).ok();
}

#[tokio::test]
async fn paths_stay_inside_the_work_dir_and_outputs_are_not_clobbered() {
    let dir = work_dir("paths");
    let client = connect(IqConfig::new(&dir, 5_000_000).unwrap()).await;
    for out in ["../escape.bin", "/tmp/escape.bin", "no-such-folder/x.bin"] {
        let err = call(&client, "iq_scene", scene_args(out))
            .await
            .unwrap_err();
        assert!(!err.is_empty(), "{out} refused");
    }
    let err = call(
        &client,
        "iq_info",
        json!({ "recording": "../../../../etc/hostname" }),
    )
    .await
    .unwrap_err();
    assert!(
        err.contains("outside") || err.contains("No such file"),
        "{err}"
    );

    let mut short = scene_args("once.bin");
    short["duration_s"] = json!(0.005);
    call(&client, "iq_scene", short.clone()).await.unwrap();
    let err = call(&client, "iq_scene", short.clone()).await.unwrap_err();
    assert!(err.contains("already exists"), "{err}");
    short["overwrite"] = json!(true);
    call(&client, "iq_scene", short).await.unwrap();

    // Unknown arguments are refused, not ignored: there is no transmit switch to find.
    let mut args = scene_args("x.bin");
    args["transmit"] = json!(true);
    let err = call(&client, "iq_scene", args).await.unwrap_err();
    assert!(err.contains("transmit"), "{err}");
    client.cancel().await.ok();
    std::fs::remove_dir_all(&dir).ok();
}

#[tokio::test]
async fn without_a_work_dir_the_file_tools_say_how_to_enable_them() {
    let client = connect(IqConfig::disabled(
        "no IQ work directory is configured; set KSHANA_MCP_IQ_DIR",
    ))
    .await;
    let setup = call(&client, "iq_signals", json!({})).await.unwrap();
    assert_eq!(setup["enabled"], false);
    assert!(
        setup["reason"]
            .as_str()
            .unwrap()
            .contains("KSHANA_MCP_IQ_DIR")
    );
    let err = call(&client, "iq_scene", scene_args("x.bin"))
        .await
        .unwrap_err();
    assert!(err.contains("KSHANA_MCP_IQ_DIR"), "{err}");
    client.cancel().await.ok();
}

#[tokio::test]
async fn a_campaign_runs_incrementally_within_the_budget_and_reports_its_status() {
    let dir = work_dir("campaign");
    // A 1.5 s scene: 3_069_000 samples. The budget fits one cell per call.
    let client = connect(IqConfig::new(&dir, 3_100_000).unwrap()).await;
    let mut args = scene_args("rec.bin");
    args["duration_s"] = json!(1.5);
    call(&client, "iq_scene", args).await.unwrap();
    std::fs::write(
        dir.join("rec.toml"),
        "schema = \"kshana.test-conditions/1\"\n[recording]\nid = \"rec\"\npath = \"rec.bin\"\n\
         settle_s = 0.5\n[[expected]]\nsignal = \"gps-l1ca\"\nids = [3, 17]\n",
    )
    .unwrap();
    std::fs::write(
        dir.join("c.toml"),
        "schema = \"kshana.campaign/1\"\nname = \"mcp\"\n[inputs]\nconditions = [\"rec.toml\"]\n\
         [[frontend]]\nname = \"raw\"\n[[frontend]]\nname = \"q2\"\nbits = 2\n",
    )
    .unwrap();

    let dry = call(
        &client,
        "iq_campaign",
        json!({ "campaign": "c.toml", "out_dir": "out", "dry_run": true }),
    )
    .await
    .unwrap();
    assert_eq!(
        (dry["cells_total"].as_u64(), dry["cells_run"].as_u64()),
        (Some(2), Some(0))
    );

    let first = call(
        &client,
        "iq_campaign",
        json!({ "campaign": "c.toml", "out_dir": "out" }),
    )
    .await
    .unwrap();
    assert_eq!(first["cells_run"], 1, "{first:#}");
    assert_eq!(first["cells_pending"], 1);
    assert_eq!(first["samples_budgeted"], 3_069_000);
    assert!(first["digest"].is_null());
    let status = call(&client, "iq_campaign_status", json!({ "out_dir": "out" }))
        .await
        .unwrap();
    assert_eq!(
        (
            status["cells_done"].as_u64(),
            status["cells_pending"].as_u64()
        ),
        (Some(1), Some(1))
    );

    let second = call(
        &client,
        "iq_campaign",
        json!({ "campaign": "c.toml", "out_dir": "out" }),
    )
    .await
    .unwrap();
    assert_eq!(
        (
            second["cells_run"].as_u64(),
            second["cells_skipped"].as_u64()
        ),
        (Some(1), Some(1))
    );
    let digest = second["digest"].as_str().unwrap().to_string();
    assert_eq!(digest.len(), 64);
    let names: Vec<String> = files(&second).into_iter().map(|(p, _)| p).collect();
    assert!(names.contains(&"out/report.html".to_string()), "{names:?}");
    let status = call(&client, "iq_campaign_status", json!({ "out_dir": "out" }))
        .await
        .unwrap();
    assert_eq!(status["digest"], json!(digest));

    // A campaign naming a recording outside the work directory is refused.
    std::fs::write(
        dir.join("escape.toml"),
        "schema = \"kshana.test-conditions/1\"\n[recording]\nid = \"x\"\npath = \"/etc/hostname\"\n\
         format = \"ci8\"\nsample_rate_hz = 1e6\n[[expected]]\nsignal = \"gps-l1ca\"\nids = [1]\n",
    )
    .unwrap();
    std::fs::write(
        dir.join("bad.toml"),
        "schema = \"kshana.campaign/1\"\nname = \"bad\"\n[inputs]\nconditions = [\"escape.toml\"]\n",
    )
    .unwrap();
    let err = call(
        &client,
        "iq_campaign",
        json!({ "campaign": "bad.toml", "out_dir": "out2" }),
    )
    .await
    .unwrap_err();
    assert!(err.contains("outside the IQ work directory"), "{err}");
    assert!(
        !dir.join("out2").exists(),
        "nothing created for a refused campaign"
    );
    client.cancel().await.ok();
    std::fs::remove_dir_all(&dir).ok();
}
