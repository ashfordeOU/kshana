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
        "list_example_scenarios",
        "get_example_scenario",
        "report_scenario",
        "animate_scenario",
        "list_export_formats",
        "export_interop",
        "import_route",
        "export_sp3",
        "export_omm",
        "export_oem",
        "export_table_csv",
        "assess_receiver_log",
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

#[tokio::test]
async fn export_table_csv_returns_the_golden_table_and_names_the_kinds_on_refusal() {
    let root = Path::new(env!("CARGO_MANIFEST_DIR")).join("../..");
    let client = connect().await;

    // A kind that publishes a table: the tool must return the exact golden-pinned bytes
    // the CLI writes as `<scenario>.table.csv`, not a re-rendering of them.
    let toml = std::fs::read_to_string(root.join("scenarios/realtime-frame-eop.toml"))
        .expect("read bundled realtime-frame-eop scenario");
    let golden = std::fs::read_to_string(root.join("tests/golden/realtime-frame-eop.csv"))
        .expect("read the realtime-frame-eop golden table");
    let res = client
        .call_tool(call(
            "export_table_csv",
            serde_json::json!({ "toml": toml }),
        ))
        .await
        .expect("call export_table_csv");
    assert_ne!(
        res.is_error,
        Some(true),
        "export_table_csv returned an error"
    );
    assert_eq!(
        first_text(&res),
        golden,
        "MCP CSV must equal the golden table byte for byte"
    );

    // A kind with no table must be refused with a message naming the kinds that have one,
    // never answered with an empty success.
    let clock = std::fs::read_to_string(root.join("scenarios/clock-holdover.toml"))
        .expect("read bundled clock scenario");
    let err = client
        .call_tool(call(
            "export_table_csv",
            serde_json::json!({ "toml": clock }),
        ))
        .await
        .expect_err("a kind with no CSV table must be a tool error");
    let msg = err.to_string();
    for kind in [
        "realtime-frame-eop",
        "lunar-time-budget",
        "lunar-jamming",
        "telecom-timing",
        "leo-navmsg",
        "moonlight-service-volume",
    ] {
        assert!(msg.contains(kind), "refusal must name `{kind}`: {msg}");
    }
    client.cancel().await.ok();
}

// ---------------------------------------------------------------------------------------
// The kinds and capabilities added with the spectrum, solar-system, constellation,
// campaign, animation, report, interoperability and low Earth orbit (LEO) navigation work.
//
// Each test drives the tools the way an agent does: it fetches a bundled reference
// scenario with `get_example_scenario`, hands that text to the tool under test, and checks
// numbers the engine computed. Floating-point figures are compared with a relative
// tolerance, because results are pinned per platform and the last digits may differ
// between an operating system and the next; counts, names and digests are compared exactly.
// ---------------------------------------------------------------------------------------

type Client = rmcp::service::RunningService<rmcp::RoleClient, ()>;

/// The text of content item `i`.
fn text_at(res: &rmcp::model::CallToolResult, i: usize) -> String {
    res.content
        .get(i)
        .and_then(|c| c.as_text())
        .map(|t| t.text.clone())
        .unwrap_or_else(|| panic!("no text content item {i}"))
}

/// Content item `i` parsed as JSON.
fn json_at(res: &rmcp::model::CallToolResult, i: usize) -> serde_json::Value {
    serde_json::from_str(&text_at(res, i))
        .unwrap_or_else(|e| panic!("content item {i} is not JSON: {e}"))
}

/// Fetch a bundled scenario through the server, as an agent would.
async fn example(client: &Client, name: &'static str) -> String {
    let res = client
        .call_tool(call(
            "get_example_scenario",
            serde_json::json!({ "name": name }),
        ))
        .await
        .unwrap_or_else(|e| panic!("get_example_scenario {name}: {e}"));
    assert_ne!(res.is_error, Some(true), "get_example_scenario {name}");
    text_at(&res, 0)
}

/// Run a bundled scenario through `run_scenario`; returns the summary and the result JSON.
async fn run_example(client: &Client, name: &'static str) -> (String, serde_json::Value) {
    let toml = example(client, name).await;
    let res = client
        .call_tool(call("run_scenario", serde_json::json!({ "toml": toml })))
        .await
        .unwrap_or_else(|e| panic!("run_scenario {name}: {e}"));
    assert_ne!(res.is_error, Some(true), "run_scenario {name}");
    (text_at(&res, 0), json_at(&res, 1))
}

/// The error message of a call that must be refused.
async fn refusal(client: &Client, name: &'static str, args: serde_json::Value) -> String {
    client
        .call_tool(call(name, args))
        .await
        .expect_err("the call must be refused")
        .to_string()
}

/// `got` within a relative `1e-6` of `want`.
fn close(got: &serde_json::Value, want: f64) -> bool {
    match got.as_f64() {
        Some(g) => (g - want).abs() <= 1e-6 * want.abs().max(1.0),
        None => false,
    }
}

/// A plain base64 decoder, written independently of the server's encoder so the SigMF
/// sample file is checked by a second implementation.
fn base64_decode(text: &str) -> Vec<u8> {
    let value = |c: u8| -> u32 {
        match c {
            b'A'..=b'Z' => u32::from(c - b'A'),
            b'a'..=b'z' => u32::from(c - b'a') + 26,
            b'0'..=b'9' => u32::from(c - b'0') + 52,
            b'+' => 62,
            b'/' => 63,
            other => panic!("not a base64 character: {other}"),
        }
    };
    let mut out = Vec::with_capacity(text.len() / 4 * 3);
    for quad in text.as_bytes().chunks(4) {
        assert_eq!(quad.len(), 4, "base64 length must be a multiple of four");
        let pad = quad.iter().filter(|&&c| c == b'=').count();
        let n = quad
            .iter()
            .map(|&c| if c == b'=' { 0 } else { value(c) })
            .fold(0u32, |acc, v| (acc << 6) | v);
        out.push((n >> 16) as u8);
        if pad < 2 {
            out.push((n >> 8) as u8);
        }
        if pad < 1 {
            out.push(n as u8);
        }
    }
    out
}

/// Every scenario file in the repository is either served byte for byte or refused with
/// the reason it is not bundled, and the listing names exactly the served ones.
#[tokio::test]
async fn example_tools_serve_every_bundled_scenario_byte_for_byte() {
    let root = Path::new(env!("CARGO_MANIFEST_DIR")).join("../..");
    let client = connect().await;
    let listing = client
        .call_tool(call("list_example_scenarios", serde_json::json!({})))
        .await
        .expect("call list_example_scenarios");
    let listing = json_at(&listing, 0);
    let listed: BTreeSet<String> = listing["scenarios"]
        .as_array()
        .expect("scenarios array")
        .iter()
        .map(|s| s["name"].as_str().expect("name").to_string())
        .collect();
    assert_eq!(listing["count"].as_u64(), Some(listed.len() as u64));

    let mut served = BTreeSet::new();
    let mut refused = 0usize;
    for entry in std::fs::read_dir(root.join("scenarios")).expect("read scenarios/") {
        let path = entry.expect("dir entry").path();
        if path.extension().and_then(|e| e.to_str()) != Some("toml") {
            continue;
        }
        let stem = path.file_stem().unwrap().to_str().unwrap().to_string();
        let on_disk = std::fs::read_to_string(&path).expect("read scenario");
        match client
            .call_tool(call(
                "get_example_scenario",
                serde_json::json!({ "name": stem }),
            ))
            .await
        {
            Ok(res) => {
                assert_eq!(
                    text_at(&res, 0),
                    on_disk,
                    "{stem} must be served byte for byte"
                );
                served.insert(stem);
            }
            Err(e) => {
                assert!(
                    e.to_string().contains("is not bundled"),
                    "{stem} is neither served nor refused with a reason: {e}"
                );
                refused += 1;
            }
        }
    }
    assert_eq!(
        served, listed,
        "the listing must name exactly the served scenarios"
    );
    // A directory scan that matched nothing would make both sets empty and equal.
    assert!(
        served.len() >= 100,
        "only {} scenarios served",
        served.len()
    );
    // The archived lunar laser-ranging scenario reads a data slice the packages do not
    // ship, so it is one of the refused ones whichever optional preset is present.
    assert!(refused >= 1);
    let why = refusal(
        &client,
        "get_example_scenario",
        serde_json::json!({ "name": "lunar-llr-datum" }),
    )
    .await;
    assert!(why.contains("is not bundled") && why.contains("tests/fixtures/lunar_llr"));
    let unknown = refusal(
        &client,
        "get_example_scenario",
        serde_json::json!({ "name": "no-such-scenario" }),
    )
    .await;
    assert!(unknown.contains("list_example_scenarios"), "{unknown}");
    client.cancel().await.ok();
}

/// Every listed example says what it shows: `about` is a whole sentence of the file's own
/// header, never empty and never cut at the full stop of an abbreviation.
#[tokio::test]
async fn every_listed_example_carries_a_whole_sentence_about_it() {
    let client = connect().await;
    let listing = client
        .call_tool(call("list_example_scenarios", serde_json::json!({})))
        .await
        .expect("call list_example_scenarios");
    let listing = json_at(&listing, 0);
    let scenarios = listing["scenarios"].as_array().expect("scenarios array");
    assert!(scenarios.len() >= 100, "only {} listed", scenarios.len());
    let about = |name: &str| -> String {
        scenarios
            .iter()
            .find(|s| s["name"] == name)
            .unwrap_or_else(|| panic!("{name} is not listed"))["about"]
            .as_str()
            .expect("about")
            .to_string()
    };
    for s in scenarios {
        let name = s["name"].as_str().expect("name");
        let text = about(name);
        assert!(!text.trim().is_empty(), "{name} has an empty `about`");
        for cut in ["et al.", "e.g.", "i.e.", " vs.", " cf."] {
            assert!(
                !text.ends_with(cut),
                "{name}: `about` is cut at an abbreviation: {text}"
            );
        }
    }
    // The one file whose header sits below its `kind` line.
    assert!(
        about("ephemeris").starts_with("Ephemeris & ground track"),
        "{}",
        about("ephemeris")
    );
    // The one header whose first sentence cites a paper with "et al.".
    assert_eq!(
        about("leo-navmsg-model-comparison"),
        "LEO navigation message: four ephemeris models on one orbit, and the Liu et al. 2025 \
         SISRE-versus-altitude table."
    );
    client.cancel().await.ok();
}

/// The listing's `kind` is the kind the engine detects, the filter returns that kind's
/// examples only, and every kind an agent can discover has an example to start from.
#[tokio::test]
async fn every_kind_is_discoverable_classified_and_has_an_example() {
    let client = connect().await;
    let kinds = client
        .call_tool(call("list_scenario_kinds", serde_json::json!({})))
        .await
        .expect("call list_scenario_kinds");
    let kinds: Vec<String> = json_at(&kinds, 0)
        .as_array()
        .expect("kinds array")
        .iter()
        .map(|k| k["name"].as_str().expect("kind name").to_string())
        .collect();
    assert_eq!(
        kinds.len(),
        kshana::api::list_scenario_kinds().len(),
        "the tool must list every kind the engine dispatches"
    );
    for family in [
        "spectrum",
        "solar-system",
        "body-pnt",
        "constellation-design",
        "campaign",
        "leo-signal",
        "leo-pass",
        "leo-navmsg",
        "leo-pvt",
        "leo-ppp",
        "ntn-positioning",
        "leo-pnt-chain",
    ] {
        assert!(kinds.iter().any(|k| k == family), "kind `{family}` missing");
    }

    // Every listed kind is one `validate_scenario` detects from its `kind =` line, so no
    // name in the catalogue falls back to another pack.
    for kind in &kinds {
        let res = client
            .call_tool(call(
                "validate_scenario",
                serde_json::json!({ "toml": format!("kind = \"{kind}\"\n") }),
            ))
            .await
            .unwrap_or_else(|e| panic!("validate_scenario {kind}: {e}"));
        assert_eq!(
            text_at(&res, 0),
            format!("valid: detected scenario kind `{kind}`")
        );
    }

    let all = client
        .call_tool(call("list_example_scenarios", serde_json::json!({})))
        .await
        .expect("call list_example_scenarios");
    let all = json_at(&all, 0);
    let with_example: BTreeSet<&str> = all["scenarios"]
        .as_array()
        .expect("scenarios array")
        .iter()
        .map(|s| s["kind"].as_str().expect("kind"))
        .collect();
    let without: Vec<&String> = kinds
        .iter()
        .filter(|k| !with_example.contains(k.as_str()))
        .collect();
    // `lunar-llr-datum` reads an archived data slice that ships with the repository only.
    assert_eq!(
        without,
        vec!["lunar-llr-datum"],
        "kinds with no bundled example an agent can fetch"
    );

    let spectrum = client
        .call_tool(call(
            "list_example_scenarios",
            serde_json::json!({ "kind": "spectrum" }),
        ))
        .await
        .expect("call list_example_scenarios with a kind");
    let spectrum = json_at(&spectrum, 0);
    let names: Vec<&str> = spectrum["scenarios"]
        .as_array()
        .expect("scenarios array")
        .iter()
        .map(|s| s["name"].as_str().expect("name"))
        .collect();
    assert_eq!(
        names,
        [
            "l-band-waterfall-jamming",
            "leo-resilience-js-margin",
            "multi-band-jamming-waterfall"
        ]
    );
    assert_eq!(spectrum["count"].as_u64(), Some(3));
    assert!(
        spectrum["scenarios"][0]["about"]
            .as_str()
            .expect("about")
            .starts_with("L-band waterfall under jamming"),
        "about must quote the file's own header"
    );
    let unknown = refusal(
        &client,
        "list_example_scenarios",
        serde_json::json!({ "kind": "no-such-kind" }),
    )
    .await;
    assert!(unknown.contains("list_scenario_kinds"), "{unknown}");
    client.cancel().await.ok();
}

#[tokio::test]
async fn run_scenario_reaches_spectrum_and_the_solar_system() {
    let client = connect().await;

    let (summary, doc) = run_example(&client, "l-band-waterfall-jamming").await;
    assert!(
        summary.contains("5 bands | 3 jammers")
            && summary.contains("worst band gps-l1ca min C/N0 3.2 dB-Hz (J/S 60.2 dB)"),
        "{summary}"
    );
    let bands: Vec<&str> = doc["bands"]
        .as_array()
        .expect("bands")
        .iter()
        .map(|b| b["name"].as_str().expect("band name"))
        .collect();
    assert_eq!(
        bands,
        ["gps-l1ca", "galileo-e1", "gps-l2c", "gps-l5", "galileo-e5a"]
    );
    assert_eq!(doc["iq"]["n_samples"].as_u64(), Some(65536));
    let l1 = &doc["timeline"]["bands"][0];
    assert!(close(&l1["min_cn0_dbhz"], 3.232_858_659_210_611_7));
    assert!(close(&l1["worst_js_db"], 60.239_416_028_783_04));
    assert!(close(&doc["iq"]["sample_rate_hz"], 20_480_000.0));

    let (summary, doc) = run_example(&client, "solar-system-tour").await;
    assert!(summary.contains("18 bodies, observer Earth"), "{summary}");
    assert_eq!(doc["n_bodies"].as_u64(), Some(18));
    let mars = doc["bodies"]
        .as_array()
        .expect("bodies")
        .iter()
        .find(|b| b["name"] == "Mars")
        .expect("Mars");
    assert!(close(
        &mars["heliocentric_distance_au"],
        1.554_439_195_324_481_4
    ));
    assert_eq!(mars["label"], "VALIDATED");
    client.cancel().await.ok();
}

#[tokio::test]
async fn run_scenario_reaches_constellations_around_other_bodies() {
    let client = connect().await;

    let (summary, doc) = run_example(&client, "lunar-relay-constellation").await;
    assert!(
        summary.contains("14 satellites (Lunar relay) around the Moon"),
        "{summary}"
    );
    assert_eq!(doc["body"]["name"], "Moon");
    assert_eq!(doc["constellations"][0]["satellites"].as_u64(), Some(14));
    assert!(close(&doc["global"]["availability_pct"], 21.3286));

    let (summary, doc) = run_example(&client, "europa-surface-pnt").await;
    assert!(
        summary.contains("Positioning around Europa") && summary.contains("12 relays at 4500 km"),
        "{summary}"
    );
    assert_eq!(doc["body"]["name"], "Europa");
    assert_eq!(doc["n_relays"].as_u64(), Some(12));
    assert_eq!(doc["fom"]["n_epochs"].as_u64(), Some(171));
    assert!(close(
        &doc["fom"]["availability_relays"],
        0.479_532_163_742_690_03
    ));
    client.cancel().await.ok();
}

#[tokio::test]
async fn run_scenario_reaches_campaigns() {
    let client = connect().await;
    let (summary, doc) = run_example(&client, "campaign-sweep-jammer-power").await;
    assert!(
        summary.contains("sweep of `jamming`: 13 nodes over [jammer_power]")
            && summary.contains("13 member runs"),
        "{summary}"
    );
    assert_eq!(doc["kind"], "campaign");
    assert_eq!(doc["sweep"]["scenario_kind"], "jamming");
    assert_eq!(doc["reproducibility"]["runs_total"].as_u64(), Some(13));
    let nodes = doc["sweep"]["nodes"].as_array().expect("sweep nodes");
    assert_eq!(nodes.len(), 13);
    // The weakest jammer leaves every link tracking; the strongest denies all of them.
    assert!(close(&nodes[0]["coords"]["jammer_power"], -50.0));
    assert!(close(&nodes[0]["metrics"]["availability"], 1.0));
    assert!(close(
        &nodes[0]["metrics"]["mean_js"],
        12.166_505_692_193_981
    ));
    assert!(close(&nodes[12]["coords"]["jammer_power"], 10.0));
    assert!(close(&nodes[12]["metrics"]["availability"], 0.0));
    assert!(close(
        &nodes[12]["metrics"]["mean_js"],
        72.166_505_692_194_01
    ));
    client.cancel().await.ok();
}

#[tokio::test]
async fn run_scenario_reaches_the_leo_signal_link_and_message_kinds() {
    let client = connect().await;

    // Signal design.
    let (summary, doc) = run_example(&client, "leo-band-trade").await;
    assert!(
        summary.contains("5 signals")
            && summary.contains("finest ranging generic-c-wide 0.022 m at 45.0 dB-Hz"),
        "{summary}"
    );
    assert_eq!(doc["kind"], "leo-signal");
    assert_eq!(doc["signals"].as_array().map(Vec::len), Some(5));
    assert_eq!(doc["trade"]["reference_signal"], "generic-l");
    assert_eq!(doc["shape_checks_pass"], true);

    // Pass link budget.
    let (summary, doc) = run_example(&client, "leo-pass-iridium").await;
    assert!(
        summary.contains("LEO STL peak 80.5 dB-Hz is 34.3 dB above the GNSS median"),
        "{summary}"
    );
    assert_eq!(doc["comparison"]["leo_satellite"], "Iridium-pass");
    assert!(close(
        &doc["comparison"]["leo_peak_cn0_dbhz"],
        80.488_227_185_908_74
    ));
    assert!(close(&doc["comparison"]["leo_pass_duration_s"], 750.0));
    assert!(close(
        &doc["gnss"]["median_cn0_dbhz"],
        46.194_130_064_276_92
    ));

    // Navigation message.
    let (summary, doc) = run_example(&client, "leo-navmsg-encode-decode").await;
    assert!(
        summary.contains("frame 171 bytes (1310 payload bits, 1045 ephemeris+clock bits)"),
        "{summary}"
    );
    let ed = &doc["encode_decode"];
    assert_eq!(ed["model"], "kepler-rac");
    assert_eq!(ed["frame_bytes"].as_u64(), Some(171));
    assert_eq!(ed["payload_bits"].as_u64(), Some(1310));
    // The frame's own checksum depends on the last bit of the fitted elements, which an
    // unoptimised build and an optimised one do not share, so its value is not pinned
    // here; its shape is, and so is the published CRC-24Q check value of the ASCII string
    // "123456789", which is a constant of the polynomial.
    let crc = ed["crc24q"].as_str().expect("crc24q");
    assert!(
        crc.len() == 8 && crc.starts_with("0x") && crc[2..].bytes().all(|b| b.is_ascii_hexdigit()),
        "{crc}"
    );
    assert_eq!(ed["frame_hex"].as_str().map(str::len), Some(2 * 171));
    assert_eq!(ed["crc24q_check_value_123456789"], "0xCDE703");
    assert_eq!(ed["corrupted_frame_rejected"], true);
    client.cancel().await.ok();
}

#[tokio::test]
async fn run_scenario_reaches_the_leo_fusion_kinds() {
    let client = connect().await;

    // leo-pvt: a Doppler-only fix.
    let (summary, doc) = run_example(&client, "leo-doppler-positioning").await;
    assert!(
        summary.contains("Doppler fix: 811 measurements from 26 satellites"),
        "{summary}"
    );
    assert_eq!(doc["doppler"]["n_obs"].as_u64(), Some(811));
    assert_eq!(doc["doppler"]["n_sats"].as_u64(), Some(26));
    assert_eq!(doc["doppler"]["windows"].as_array().map(Vec::len), Some(7));
    assert!(close(&doc["doppler"]["error_3d_m"], 7.504_930_419_387_335));

    // ntn-positioning: a 5G non-terrestrial network downlink.
    let (summary, doc) = run_example(&client, "ntn-5g-positioning").await;
    assert!(
        summary.contains("5G NTN positioning at 2172.5 MHz") && summary.contains("324 satellites"),
        "{summary}"
    );
    assert_eq!(doc["n_satellites"].as_u64(), Some(324));
    assert!(close(&doc["carrier_hz"], 2_172_500_000.0));
    assert_eq!(doc["doppler_pass"]["n_obs"].as_u64(), Some(53));
    assert_eq!(doc["signals"].as_array().map(Vec::len), Some(2));

    // leo-ppp: precise point positioning with and without a LEO layer. The bundled
    // scenario runs 60 convergence filters, which an unoptimised build takes minutes
    // over, so it is cut down the way an agent edits an example: one site, one GNSS, one
    // LEO case, one run, ten minutes.
    let mut ppp: toml::Table =
        toml::from_str(&example(&client, "leo-ppp-convergence").await).expect("example is TOML");
    ppp.insert("runs".into(), toml::Value::Integer(1));
    ppp.insert("duration_s".into(), toml::Value::Float(600.0));
    ppp.insert("compare_li_2019".into(), toml::Value::Boolean(false));
    for list in ["site", "gnss", "case"] {
        ppp[list]
            .as_array_mut()
            .expect("an array of tables")
            .truncate(1);
    }
    let res = client
        .call_tool(call(
            "run_scenario",
            serde_json::json!({ "toml": toml::to_string(&ppp).expect("serialise") }),
        ))
        .await
        .expect("run the reduced leo-ppp scenario");
    let summary = text_at(&res, 0);
    assert!(
        summary.contains("1 runs per case, 24 GNSS satellites"),
        "{summary}"
    );
    let doc = json_at(&res, 1);
    let cases = doc["cases"].as_array().expect("cases");
    assert_eq!(cases.len(), 2);
    assert_eq!(cases[0]["name"], "GNSS only");
    assert_eq!(cases[0]["n_leo"].as_u64(), Some(0));
    assert_eq!(cases[1]["name"], "60 LEO");
    assert_eq!(cases[1]["n_leo"].as_u64(), Some(60));
    assert!(close(&cases[0]["mean_sats"], 8.934_426_229_508_198));
    assert!(close(&cases[1]["mean_sats"], 11.721_311_475_409_836));
    assert_eq!(cases[1]["t_min"].as_array().map(Vec::len), Some(11));

    // leo-pnt-chain: signal, pass, message, fused fix and convergence in one run.
    let (summary, doc) = run_example(&client, "leo-pnt-end-to-end").await;
    assert!(
        summary.contains("11 values handed between stages")
            && summary.contains(
                "GNSS only PDOP 1.47 RMS 3D 1.60 m -> GNSS + LEO PDOP 1.06 RMS 3D 0.43 m"
            ),
        "{summary}"
    );
    assert_eq!(doc["kind"], "leo-pnt-chain");
    assert_eq!(doc["handoffs"].as_array().map(Vec::len), Some(11));
    assert!(
        doc["fusion"]["fused"]["median_pdop"]
            .as_f64()
            .expect("fused PDOP")
            < doc["fusion"]["gnss"]["median_pdop"]
                .as_f64()
                .expect("GNSS PDOP")
    );
    client.cancel().await.ok();
}

#[tokio::test]
async fn report_scenario_returns_the_report_with_its_reproducibility_record() {
    let client = connect().await;
    let toml = example(&client, "campaign-sweep-jammer-power").await;

    let res = client
        .call_tool(call("report_scenario", serde_json::json!({ "toml": toml })))
        .await
        .expect("call report_scenario");
    assert_ne!(res.is_error, Some(true));
    let report = json_at(&res, 0);
    assert_eq!(report["report_schema"], "kshana-report");
    assert_eq!(report["kind"], "campaign");
    assert_eq!(
        report["title"],
        "Jammer power sweep: availability and J/S against transmit power"
    );
    assert_eq!(
        report["executive_summary"]["member_runs"].as_u64(),
        Some(13)
    );
    assert_eq!(report["aggregation"]["runs_total"].as_u64(), Some(13));
    assert_eq!(report["aggregation"]["member_kind"], "jamming");
    // The record digests the scenario text the caller sent, and names the default file.
    let record = &report["reproducibility"];
    assert_eq!(
        record["scenario_sha256"],
        kshana::advanced_report::sha256_hex(toml.as_bytes())
    );
    assert_eq!(record["seed"].as_u64(), Some(20_260_928));
    assert_eq!(record["command"], "kshana scenario.toml");
    assert_eq!(record["engine_version"], env!("CARGO_PKG_VERSION"));
    // Every export format is listed with whether it applies; the server writes no file.
    let exports = report["companions"]["exports"].as_array().expect("exports");
    assert_eq!(exports.len(), 5);
    assert!(
        exports
            .iter()
            .all(|e| e["files"].as_array().is_some_and(Vec::is_empty))
    );

    // The HTML page carries the same title, and the caller's file name in its command.
    let res = client
        .call_tool(call(
            "report_scenario",
            serde_json::json!({
                "toml": toml,
                "format": "html",
                "scenario_file": "jammer-sweep.toml"
            }),
        ))
        .await
        .expect("call report_scenario html");
    let html = text_at(&res, 0);
    assert!(html.starts_with("<!doctype html>"), "{html:.80}");
    assert!(html.contains("Jammer power sweep: availability and J/S against transmit power"));
    assert!(html.contains("kshana jammer-sweep.toml"));

    let bad = refusal(
        &client,
        "report_scenario",
        serde_json::json!({ "toml": toml, "format": "pdf" }),
    )
    .await;
    assert!(bad.contains("expected json or html"), "{bad}");
    client.cancel().await.ok();
}

#[tokio::test]
async fn animate_scenario_returns_the_drawn_series_and_refuses_what_it_cannot_draw() {
    let client = connect().await;
    let spectrum = example(&client, "l-band-waterfall-jamming").await;

    // Default format: one animated SVG, with the waterfall.
    let res = client
        .call_tool(call(
            "animate_scenario",
            serde_json::json!({ "toml": spectrum }),
        ))
        .await
        .expect("call animate_scenario");
    assert_ne!(res.is_error, Some(true));
    assert_eq!(res.content.len(), 2, "a summary and one file");
    let summary = json_at(&res, 0);
    assert_eq!(summary["formats"], serde_json::json!(["svg"]));
    assert_eq!(summary["files"], serde_json::json!(["animation.svg"]));
    assert_eq!(summary["waterfall"], true);
    assert_eq!(summary["events"].as_u64(), Some(7));
    assert_eq!(
        summary["charts"],
        serde_json::json!(["cn0 effective [dB-Hz]", "js [dB]"])
    );
    assert!(close(&summary["t_start"], 0.0) && close(&summary["t_end"], 59.0));
    assert_eq!(summary["t_unit"], "s");
    assert_eq!(summary["frame_count"].as_u64(), Some(0));
    assert_eq!(summary["tier"], "MODELLED");
    let svg = text_at(&res, 1);
    assert!(svg.starts_with("<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"960\""));
    assert!(svg.contains("@keyframes") && svg.trim_end().ends_with("</svg>"));

    // Frames: duration x fps frames, then the manifest, at the width asked for.
    let res = client
        .call_tool(call(
            "animate_scenario",
            serde_json::json!({
                "toml": spectrum, "format": "frames", "fps": 4, "duration_s": 1.0, "width": 640
            }),
        ))
        .await
        .expect("call animate_scenario frames");
    let summary = json_at(&res, 0);
    assert_eq!(summary["frame_count"].as_u64(), Some(4));
    assert_eq!(
        summary["files"],
        serde_json::json!([
            "frame_0000.svg",
            "frame_0001.svg",
            "frame_0002.svg",
            "frame_0003.svg",
            "manifest.json"
        ])
    );
    assert_eq!(
        res.content.len(),
        6,
        "a summary, four frames and the manifest"
    );
    assert!(
        text_at(&res, 1).starts_with("<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"640\"")
    );
    let manifest = json_at(&res, 5);
    assert_eq!(manifest["fps"].as_u64(), Some(4));
    assert_eq!(manifest["frame_count"].as_u64(), Some(4));

    // A sequence longer than a reply carries is refused before the scenario runs.
    let too_long = refusal(
        &client,
        "animate_scenario",
        serde_json::json!({ "toml": spectrum, "format": "frames", "fps": 30, "duration_s": 10.0 }),
    )
    .await;
    assert!(
        too_long.contains("300 frames") && too_long.contains("at most 120"),
        "{too_long}"
    );
    let bad_fps = refusal(
        &client,
        "animate_scenario",
        serde_json::json!({ "toml": spectrum, "fps": 0 }),
    )
    .await;
    assert!(
        bad_fps.contains("fps must be between 1 and 60"),
        "{bad_fps}"
    );

    // A kind with no sampled time axis says so.
    let solar = example(&client, "solar-system-tour").await;
    let no_axis = refusal(
        &client,
        "animate_scenario",
        serde_json::json!({ "toml": solar, "format": "html" }),
    )
    .await;
    assert!(
        no_axis.contains("the solar-system result carries no sampled time axis"),
        "{no_axis}"
    );
    client.cancel().await.ok();
}

#[tokio::test]
async fn animate_scenario_draws_a_campaign_with_its_phases() {
    let client = connect().await;
    let campaign = example(&client, "campaign-jam-spoof-holdover-integrity").await;
    let res = client
        .call_tool(call(
            "animate_scenario",
            serde_json::json!({ "toml": campaign, "format": "html" }),
        ))
        .await
        .expect("call animate_scenario on a campaign");
    let summary = json_at(&res, 0);
    assert_eq!(summary["files"], serde_json::json!(["animation.html"]));
    assert_eq!(summary["phases"].as_u64(), Some(6));
    assert_eq!(summary["events"].as_u64(), Some(2));
    assert_eq!(summary["charts"].as_array().map(Vec::len), Some(6));
    assert!(close(&summary["t_end"], 4570.0));
    let html = text_at(&res, 1);
    assert!(html.starts_with("<!doctype html>"), "{html:.80}");
    assert!(html.contains("<script>") && !html.contains("src=\"http"));
    client.cancel().await.ok();
}

#[tokio::test]
async fn interop_tools_plan_and_export_geometry() {
    let client = connect().await;
    let pass = example(&client, "leo-pass-iridium").await;

    let plan = client
        .call_tool(call(
            "list_export_formats",
            serde_json::json!({ "toml": pass }),
        ))
        .await
        .expect("call list_export_formats");
    let plan = json_at(&plan, 0);
    let rows = plan.as_array().expect("one row per format");
    let applies: Vec<(&str, bool)> = rows
        .iter()
        .map(|r| {
            (
                r["format"].as_str().unwrap(),
                r["applies"].as_bool().unwrap(),
            )
        })
        .collect();
    assert_eq!(
        applies,
        [
            ("czml", true),
            ("kml", true),
            ("geojson", true),
            ("stk", true),
            ("sigmf", false)
        ]
    );
    assert!(
        rows[4]["reason"]
            .as_str()
            .unwrap()
            .contains("`spectrum` kind")
    );
    assert_eq!(
        rows[2]["spec_url"],
        "https://www.rfc-editor.org/rfc/rfc7946"
    );

    // STK: one ephemeris per moving object, each digest matching the text that follows.
    let res = client
        .call_tool(call(
            "export_interop",
            serde_json::json!({ "toml": pass, "format": "stk" }),
        ))
        .await
        .expect("call export_interop stk");
    let index = json_at(&res, 0);
    assert_eq!(index["format"], "stk");
    let files = index["files"].as_array().expect("files");
    let suffixes: Vec<&str> = files
        .iter()
        .map(|f| f["suffix"].as_str().unwrap())
        .collect();
    assert_eq!(suffixes, [".Iridium-pass.e", ".user.e"]);
    assert_eq!(res.content.len(), 3);
    for (i, file) in files.iter().enumerate() {
        let body = text_at(&res, i + 1);
        assert_eq!(file["encoding"], "utf-8");
        assert_eq!(file["bytes"].as_u64(), Some(body.len() as u64));
        assert_eq!(
            file["sha256"],
            kshana::advanced_report::sha256_hex(body.as_bytes())
        );
        assert!(body.starts_with("stk.v.11.0\n"), "{body:.40}");
        assert!(body.contains("EphemerisTimePosVel"));
    }
    assert!(text_at(&res, 1).contains("the scenario's `epoch` 2026-09-28T14:00:00, read as UTC"));

    // CZML: a JSON array of packets opening with the document packet, on the pass's epoch.
    let res = client
        .call_tool(call(
            "export_interop",
            serde_json::json!({ "toml": pass, "format": "czml" }),
        ))
        .await
        .expect("call export_interop czml");
    assert_eq!(json_at(&res, 0)["files"][0]["suffix"], ".czml");
    let czml = json_at(&res, 1);
    let packets = czml.as_array().expect("CZML is an array of packets");
    assert_eq!(packets[0]["id"], "document");
    assert_eq!(
        packets[0]["clock"]["interval"],
        "2026-09-28T14:00:00.000013Z/2026-09-28T14:15:00.000013Z"
    );
    assert!(packets.iter().any(|p| {
        p["id"]
            .as_str()
            .is_some_and(|id| id.contains("Iridium-pass"))
    }));

    // GeoJSON: a feature collection.
    let res = client
        .call_tool(call(
            "export_interop",
            serde_json::json!({ "toml": pass, "format": "geojson" }),
        ))
        .await
        .expect("call export_interop geojson");
    let geo = json_at(&res, 1);
    assert_eq!(geo["type"], "FeatureCollection");
    assert!(!geo["features"].as_array().expect("features").is_empty());

    // A format that does not apply is refused with the engine's reason.
    let clock = example(&client, "clock-holdover").await;
    let why = refusal(
        &client,
        "export_interop",
        serde_json::json!({ "toml": clock, "format": "kml" }),
    )
    .await;
    assert!(
        why.contains("not applicable") && why.contains("no horizontal position"),
        "{why}"
    );
    let unknown = refusal(
        &client,
        "export_interop",
        serde_json::json!({ "toml": clock, "format": "shapefile" }),
    )
    .await;
    assert!(
        unknown.contains("expected one of czml, kml, geojson, stk or sigmf"),
        "{unknown}"
    );
    client.cancel().await.ok();
}

#[tokio::test]
async fn export_interop_returns_a_spectrum_recording_as_sigmf() {
    let client = connect().await;
    let spectrum = example(&client, "l-band-waterfall-jamming").await;

    let plan = client
        .call_tool(call(
            "list_export_formats",
            serde_json::json!({ "toml": spectrum }),
        ))
        .await
        .expect("call list_export_formats");
    let applies: Vec<bool> = json_at(&plan, 0)
        .as_array()
        .expect("rows")
        .iter()
        .map(|r| r["applies"].as_bool().unwrap())
        .collect();
    assert_eq!(
        applies,
        [false, false, false, false, true],
        "only SigMF applies"
    );

    let res = client
        .call_tool(call(
            "export_interop",
            serde_json::json!({ "toml": spectrum, "format": "sigmf" }),
        ))
        .await
        .expect("call export_interop sigmf");
    let index = json_at(&res, 0);
    let files = index["files"].as_array().expect("files");
    assert_eq!(files[0]["suffix"], ".sigmf-meta");
    assert_eq!(files[0]["encoding"], "utf-8");
    assert_eq!(files[1]["suffix"], ".sigmf-data");
    assert_eq!(files[1]["encoding"], "base64");
    // 65 536 complex samples of two little-endian 32-bit floats each.
    assert_eq!(files[1]["bytes"].as_u64(), Some(65_536 * 8));

    let meta = json_at(&res, 1);
    assert_eq!(meta["global"]["core:datatype"], "cf32_le");
    assert!(close(&meta["global"]["core:sample_rate"], 20_480_000.0));
    assert!(close(
        &meta["captures"][0]["core:frequency"],
        1_575_420_000.0
    ));

    // Decoded by an independent decoder, the sample file has the size and digest indexed.
    let data = base64_decode(&text_at(&res, 2));
    assert_eq!(data.len(), 65_536 * 8);
    assert_eq!(
        files[1]["sha256"],
        kshana::advanced_report::sha256_hex(&data)
    );
    // The samples are finite floats with signal in them, not zero padding.
    let power: f64 = data
        .chunks_exact(4)
        .map(|b| f64::from(f32::from_le_bytes([b[0], b[1], b[2], b[3]])))
        .map(|x| {
            assert!(x.is_finite());
            x * x
        })
        .sum();
    assert!(power > 0.0);
    client.cancel().await.ok();
}

#[tokio::test]
async fn import_route_rewrites_a_track_and_the_result_runs() {
    let client = connect().await;
    let terrain = example(&client, "terrain-nav").await;
    // Two ends, longitude first as GeoJSON requires; the scenario's 60 waypoints are kept.
    let route = r#"{"type":"LineString","coordinates":[[20.5,12.5],[20.677,12.736]]}"#;
    let res = client
        .call_tool(call(
            "import_route",
            serde_json::json!({ "toml": terrain, "geojson": route }),
        ))
        .await
        .expect("call import_route");
    let merged = text_at(&res, 0);
    let table: toml::Value = toml::from_str(&merged).expect("the merged scenario is TOML");
    let num = |k: &str| table[k].as_float().unwrap_or_else(|| panic!("{k}"));
    assert!((num("start_lat_deg") - 12.5).abs() < 1e-12);
    assert!((num("start_lon_deg") - 20.5).abs() < 1e-12);
    assert!((num("step_lat_deg") - 0.236 / 59.0).abs() < 1e-12);
    assert!((num("step_lon_deg") - 0.177 / 59.0).abs() < 1e-12);
    assert_eq!(table["waypoints"].as_integer(), Some(60));
    assert_eq!(table["kind"].as_str(), Some("terrain-nav"));

    // The rewritten scenario is a scenario: it runs, as the kind it was.
    let run = client
        .call_tool(call("run_scenario", serde_json::json!({ "toml": merged })))
        .await
        .expect("run the rewritten scenario");
    assert!(text_at(&run, 0).starts_with("terrain-nav | free-inertial drift"));

    // A kind that flies no track is refused, with the kinds that do.
    let clock = example(&client, "clock-holdover").await;
    let why = refusal(
        &client,
        "import_route",
        serde_json::json!({ "toml": clock, "geojson": route }),
    )
    .await;
    assert!(
        why.contains("terrain-nav, terrain-slam, gravity-map, combined-altpnt")
            && why.contains("`clock` takes no trajectory input"),
        "{why}"
    );
    // A bent route is refused: the track kinds fly a straight line.
    let bent = r#"{"type":"LineString","coordinates":[[20.0,12.0],[20.1,12.3],[20.2,12.2]]}"#;
    let why = refusal(
        &client,
        "import_route",
        serde_json::json!({ "toml": terrain, "geojson": bent }),
    )
    .await;
    assert!(why.contains("evenly spaced straight track"), "{why}");
    client.cancel().await.ok();
}

#[tokio::test]
async fn export_table_csv_returns_the_leo_navigation_message_and_telecom_tables() {
    let client = connect().await;
    let toml = example(&client, "leo-navmsg-encode-decode").await;
    let res = client
        .call_tool(call(
            "export_table_csv",
            serde_json::json!({ "toml": toml }),
        ))
        .await
        .expect("call export_table_csv");
    let csv = text_at(&res, 0);
    let mut lines = csv.lines();
    let header: Vec<&str> = lines.next().expect("header").split(',').collect();
    assert_eq!(
        header[..6],
        ["SVID", "IOD", "Band", "WeekNumber", "ToW", "Health"]
    );
    assert_eq!(header.len(), 48);
    // Three messages, each a full row of the header's width.
    let rows: Vec<Vec<&str>> = lines.map(|l| l.split(',').collect()).collect();
    assert_eq!(rows.len(), 3);
    assert!(rows.iter().all(|r| r.len() == header.len()));
    assert_eq!(rows[0][0].parse::<f64>().ok(), Some(4.0));
    assert_eq!(rows[2][1].parse::<f64>().ok(), Some(2.0));
    // `telecom-timing` publishes its mask table too: one row per averaging time, with the
    // measured time-error figures and the ITU-T limit columns.
    let toml = example(&client, "telecom-tie-ingest").await;
    let res = client
        .call_tool(call(
            "export_table_csv",
            serde_json::json!({ "toml": toml }),
        ))
        .await
        .expect("call export_table_csv on telecom-timing");
    let csv = text_at(&res, 0);
    let mut lines = csv.lines();
    let header = lines.next().expect("header");
    assert!(
        header.starts_with("tau_s,mtie_ns,tdev_ns,prtc-a_mtie_limit_ns,"),
        "{header}"
    );
    let first: Vec<&str> = lines.next().expect("first row").split(',').collect();
    assert_eq!(first[0], "1");
    assert_eq!(first[1].parse::<f64>().ok(), Some(4.385));
    assert_eq!(csv.lines().count(), 18);
    client.cancel().await.ok();
}

/// An NMEA sentence with its checksum (XOR of the bytes between `$` and `*`).
fn nmea(body: &str) -> String {
    let ck = body.bytes().fold(0u8, |a, b| a ^ b);
    format!("${body}*{ck:02X}\n")
}

#[tokio::test]
async fn assess_receiver_log_scores_an_inline_nmea_log() {
    // Ten seconds clean (six satellites near 45 dB-Hz), then a 15 dB drop on every one of
    // them from t = 10 s: the stated jamming event at 10 s must be detected at once.
    let mut log = String::new();
    for s in 0..20u32 {
        let cn0 = if s < 10 { 45 } else { 30 };
        log.push_str(&nmea(&format!(
            "GPGGA,1200{s:02}.00,4807.038,N,01131.000,E,1,06,1.0,500.0,M,47.0,M,,"
        )));
        log.push_str(&nmea(&format!(
            "GPGSV,2,1,06,01,40,083,{cn0},02,17,308,{cn0},03,07,344,{cn0},04,75,123,{cn0}"
        )));
        log.push_str(&nmea(&format!(
            "GPGSV,2,2,06,05,30,210,{cn0},06,55,045,{cn0}"
        )));
    }
    let toml = format!(
        "kind = \"receiver-trust\"\n[log]\nformat = \"nmea\"\ntext = '''\n{log}'''\n[monitors]\ncalibration_s = 5.0\n[[events]]\nlabel = \"jammer on\"\nkind = \"jamming\"\nonset_s = 10.0\npredicted_cn0_drop_db = 14.0\n"
    );
    let client = connect().await;
    let res = client
        .call_tool(call(
            "assess_receiver_log",
            serde_json::json!({ "toml": toml, "include_csv": true }),
        ))
        .await
        .expect("call assess_receiver_log");
    assert_ne!(res.is_error, Some(true));
    let texts: Vec<String> = res
        .content
        .iter()
        .filter_map(|c| c.as_text().map(|t| t.text.clone()))
        .collect();
    assert!(texts[0].contains("receiver-trust"), "summary: {}", texts[0]);
    let doc: serde_json::Value = serde_json::from_str(&texts[1]).expect("result json");
    let ev = &doc["events"][0];
    assert_eq!(ev["outcome"], "detected", "{ev}");
    assert_eq!(ev["latency_s"], 0.0, "{ev}");
    assert_eq!(ev["cn0_verdict"], "agree", "{ev}");
    assert!(
        texts.iter().any(|t| t.starts_with("t_s,state,")),
        "the CSV block"
    );
    client.cancel().await.ok();
}
