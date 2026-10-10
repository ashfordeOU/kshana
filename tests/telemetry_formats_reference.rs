// SPDX-License-Identifier: AGPL-3.0-only
//! Telemetry wire formats against independent parsers.
//!
//! * Prometheus text exposition: parsed by the official Python client's text parser,
//!   `prometheus_client.parser.text_string_to_metric_families`.
//! * OpenTelemetry OTLP/HTTP JSON: parsed into the official `ExportMetricsServiceRequest`
//!   message from `opentelemetry-proto` with protobuf's `json_format.Parse`, strictly (no
//!   unknown fields).
//!
//! `scripts/gen_telemetry_formats_ref.py` runs both on the committed outputs of this crate
//! (`tests/fixtures/telemetry_oracle/exposition.prom` and `otlp.json`) and writes
//! `prometheus_reference.json` and `otlp_reference.json`. This test (1) checks the committed
//! outputs are what this crate produces now, from the committed synthetic stream
//! `stream.jsonl`, and (2) compares the independent parsers' reading of them with the state
//! of the `Registry`, which the test reads through its accessors and never by parsing the
//! text. CI needs no Python.
//!
//! PIN-SCOPE:    the fixed wall-clock inputs this test stamps its registry and OTLP payload with
//!               (`NOW`, `NOW_NANO`): they make the committed `exposition.prom` and `otlp.json`
//!               reproducible. They are inputs, not expected results.
//! PIN-EXCLUDES: every expected value: those are read from the registry, never from a literal.
//!
//! The oracles check the **syntax and the values** of the formats. They do not check that the
//! metric names suit any dashboard, and they say nothing about CEF or LEEF.
//!
//! # PRE-REGISTERED comparison rules
//!
//! Registered in this file's first commit, before either oracle was run. Not to be loosened
//! after seeing a result.
//!
//! * **Parse**: both parsers accept their file with no error and no unknown field.
//! * **Prometheus**: the set of metric families, each family's name, type and help text, and
//!   the set of samples of each (sample name, label set, value) equal those the registry
//!   implies, EXACTLY: names, types, help and labels by string equality, values by `f64`
//!   `==` (tolerance zero). No extra and no missing family or sample. Label values with
//!   quotes, backslashes, line feeds and non-ASCII text must come back from the parser as the
//!   original strings.
//! * **OTLP**: every metric's name, description, unit, kind (gauge or sum), monotonicity and
//!   aggregation temporality, and every data point's attributes, value (`asInt` equal as an
//!   integer, `asDouble` by `f64` `==`), start time and time (as integers) equal those the
//!   registry implies, EXACTLY, with no extra or missing metric or point; the resource carries
//!   `service.name` = `kshana` and `service.version` = the registry's version.

use kshana::telemetry::prometheus::Registry;
use kshana::telemetry::sample::{parse_live_line, Band, TrustSample};
use serde_json::{json, Value};
use std::collections::BTreeSet;
use std::path::{Path, PathBuf};

const VERSION: &str = "9.9.9-oracle";
/// Wall-clock time given to the registry for every epoch, Unix seconds (a fixed value keeps
/// the committed outputs reproducible).
const NOW: f64 = 1_790_000_000.0;
/// The time the OTLP payload is stamped with, Unix nanoseconds.
const NOW_NANO: u64 = 1_790_000_100_000_000_000;

fn dir() -> PathBuf {
    Path::new(env!("CARGO_MANIFEST_DIR")).join("tests/fixtures/telemetry_oracle")
}

fn read(name: &str) -> String {
    let p = dir().join(name);
    std::fs::read_to_string(&p).unwrap_or_else(|e| {
        panic!(
            "fixture {} missing ({e}); run scripts/gen_telemetry_formats_ref.py",
            p.display()
        )
    })
}

/// Build the registry the fixtures were made from: the committed stream, the same way the
/// command line feeds it (a line that does not parse is counted, not dropped silently).
fn registry() -> (Registry, TrustSample, usize) {
    let mut reg = Registry::new(VERSION);
    reg.set_expose_position(true);
    let mut last = None;
    let mut bad = 0;
    for line in read("stream.jsonl")
        .lines()
        .filter(|l| !l.trim().is_empty())
    {
        match parse_live_line(line) {
            Ok(s) => {
                reg.observe(&s, Some(NOW));
                last = Some(s);
            }
            Err(_) => {
                reg.observe_input_error();
                bad += 1;
            }
        }
    }
    (reg, last.expect("stream has samples"), bad)
}

#[test]
fn the_committed_outputs_are_what_this_crate_produces() {
    let (reg, _, bad) = registry();
    assert!(bad > 0, "the stream includes unparsable lines");
    assert_eq!(
        reg.render(),
        read("exposition.prom"),
        "exposition.prom is stale"
    );
    #[cfg(feature = "otlp")]
    {
        let want: Value = serde_json::from_str(&read("otlp.json")).unwrap();
        assert_eq!(kshana::telemetry::otlp::build_payload(&reg, NOW_NANO), want);
    }
}

// ---- Prometheus ----------------------------------------------------------------------

type Sample = (String, BTreeSet<(String, String)>, u64); // value as f64 bits for exact equality

fn sample(name: &str, labels: &[(&str, &str)], v: f64) -> Sample {
    (
        name.to_string(),
        labels
            .iter()
            .map(|(k, x)| (k.to_string(), x.to_string()))
            .collect(),
        v.to_bits(),
    )
}

struct Family {
    ty: &'static str,
    help: String,
    samples: BTreeSet<Sample>,
}

/// The families the registry implies, built from its accessors and the last sample.
fn expected_prometheus(
    reg: &Registry,
    last: &TrustSample,
) -> std::collections::BTreeMap<String, Family> {
    let mut m = std::collections::BTreeMap::new();
    let mut add = |name: &str, ty: &'static str, help: &str, samples: Vec<Sample>| {
        m.insert(
            name.to_string(),
            Family {
                ty,
                help: help.to_string(),
                samples: samples.into_iter().collect(),
            },
        );
    };
    add(
        "kshana_build_info",
        "gauge",
        "Engine version; constant 1.",
        vec![sample(
            "kshana_build_info",
            &[("version", reg.version())],
            1.0,
        )],
    );
    if let Some(sc) = reg.score() {
        add("kshana_trust_score", "gauge", "Latest GNSS trust score, 0 (no trust) to 100 (full trust). Absent when the source computes none.", vec![sample("kshana_trust_score", &[], sc)]);
    }
    add(
        "kshana_trust_band",
        "gauge",
        "Latest GNSS trust band: 1 for the current band, 0 for the others.",
        Band::ALL
            .iter()
            .map(|b| {
                sample(
                    "kshana_trust_band",
                    &[("band", b.label())],
                    f64::from(u8::from(reg.band() == Some(*b))),
                )
            })
            .collect(),
    );
    let cur = match last.gate.as_deref() {
        Some(g) if ["off", "passed", "withheld"].contains(&g) => g,
        _ => "unknown",
    };
    if last.gate.is_some() {
        add(
            "kshana_trust_gate",
            "gauge",
            "Latest gate state of the live stream: 1 for the current state, 0 for the others.",
            ["off", "passed", "withheld", "unknown"]
                .iter()
                .map(|g| {
                    sample(
                        "kshana_trust_gate",
                        &[("gate", g)],
                        f64::from(u8::from(*g == cur)),
                    )
                })
                .collect(),
        );
    }
    if let Some(p) = last.position {
        add(
            "kshana_trust_position_latitude_degrees",
            "gauge",
            "Latitude the receiver reported at the latest epoch, degrees.",
            vec![sample(
                "kshana_trust_position_latitude_degrees",
                &[],
                p.lat_deg,
            )],
        );
        add(
            "kshana_trust_position_longitude_degrees",
            "gauge",
            "Longitude the receiver reported at the latest epoch, degrees.",
            vec![sample(
                "kshana_trust_position_longitude_degrees",
                &[],
                p.lon_deg,
            )],
        );
        add(
            "kshana_trust_position_height_meters",
            "gauge",
            "Height the receiver reported at the latest epoch, metres.",
            vec![sample(
                "kshana_trust_position_height_meters",
                &[],
                p.height_m,
            )],
        );
    }
    add(
        "kshana_trust_reason_active",
        "gauge",
        "1 if the reason was present at the latest epoch, 0 if it was seen earlier but is not now.",
        reg.reasons_active()
            .map(|(r, on)| {
                sample(
                    "kshana_trust_reason_active",
                    &[("reason", r)],
                    f64::from(u8::from(on)),
                )
            })
            .collect(),
    );
    add(
        "kshana_trust_epochs_total",
        "counter",
        "Epochs received, by trust band.",
        Band::ALL
            .iter()
            .map(|b| {
                sample(
                    "kshana_trust_epochs_total",
                    &[("band", b.label())],
                    reg.epochs_in(*b) as f64,
                )
            })
            .collect(),
    );
    add(
        "kshana_trust_reason_epochs_total",
        "counter",
        "Epochs in which a reason was present, by reason.",
        reg.reason_epochs()
            .map(|(r, n)| {
                sample(
                    "kshana_trust_reason_epochs_total",
                    &[("reason", r)],
                    n as f64,
                )
            })
            .collect(),
    );
    add(
        "kshana_trust_input_errors_total",
        "counter",
        "Input lines that could not be parsed as trust samples.",
        vec![sample(
            "kshana_trust_input_errors_total",
            &[],
            reg.input_errors() as f64,
        )],
    );
    add("kshana_trust_reason_overflow_total", "counter", "Reason occurrences folded into reason=\"other\" because 64 distinct reasons were already in use.", vec![sample("kshana_trust_reason_overflow_total", &[], reg.reason_overflow() as f64)]);
    add(
        "kshana_trust_syslog_send_failures_total",
        "counter",
        "Syslog events not delivered (queue full, collector down or stalled).",
        vec![sample("kshana_trust_syslog_send_failures_total", &[], 0.0)],
    );
    if let Some(t) = reg.epoch_offset_s() {
        add(
            "kshana_trust_epoch_offset_seconds",
            "gauge",
            "Offset of the latest epoch from the start of the log or session, seconds.",
            vec![sample("kshana_trust_epoch_offset_seconds", &[], t)],
        );
    }
    if let Some(u) = reg.last_sample_unix() {
        add("kshana_trust_last_sample_timestamp_seconds", "gauge", "Wall-clock time the latest epoch was received, Unix seconds. Alert on its age to detect a stalled stream.", vec![sample("kshana_trust_last_sample_timestamp_seconds", &[], u)]);
    }
    m
}

#[test]
fn prometheus_client_reads_our_exposition_as_the_registry_implies() {
    let (reg, last, _) = registry();
    let want = expected_prometheus(&reg, &last);
    let got: Value = serde_json::from_str(&read("prometheus_reference.json")).unwrap();
    let fams = got["families"].as_array().unwrap();
    let got_names: BTreeSet<&str> = fams.iter().map(|f| f["name"].as_str().unwrap()).collect();
    let want_names: BTreeSet<&str> = want.keys().map(String::as_str).collect();
    assert_eq!(got_names, want_names, "families differ");
    for f in fams {
        let name = f["name"].as_str().unwrap();
        let w = &want[name];
        assert_eq!(f["type"].as_str().unwrap(), w.ty, "{name}: type");
        assert_eq!(f["help"].as_str().unwrap(), w.help, "{name}: help");
        let samples: BTreeSet<Sample> = f["samples"]
            .as_array()
            .unwrap()
            .iter()
            .map(|s| {
                (
                    s["name"].as_str().unwrap().to_string(),
                    s["labels"]
                        .as_object()
                        .unwrap()
                        .iter()
                        .map(|(k, v)| (k.clone(), v.as_str().unwrap().to_string()))
                        .collect(),
                    s["value"].as_f64().unwrap().to_bits(),
                )
            })
            .collect();
        assert_eq!(
            samples.len(),
            f["samples"].as_array().unwrap().len(),
            "{name}: duplicate samples"
        );
        assert_eq!(samples, w.samples, "{name}: samples differ");
    }
}

#[test]
fn awkward_reason_text_survives_the_parser() {
    let got: Value = serde_json::from_str(&read("prometheus_reference.json")).unwrap();
    let reasons: BTreeSet<String> = got["families"]
        .as_array()
        .unwrap()
        .iter()
        .filter(|f| f["name"] == "kshana_trust_reason_epochs_total")
        .flat_map(|f| f["samples"].as_array().unwrap().iter())
        .map(|s| s["labels"]["reason"].as_str().unwrap().to_string())
        .collect();
    for must in [
        "quote\"inside",
        "back\\slash",
        "line\nfeed",
        "r\u{e9}ason \u{2713}",
    ] {
        assert!(
            reasons.contains(must),
            "{must:?} not recovered; got {reasons:?}"
        );
    }
}

// ---- OTLP ----------------------------------------------------------------------------

fn attrs(pairs: &[(&str, &str)]) -> Value {
    Value::Object(
        pairs
            .iter()
            .map(|(k, v)| (k.to_string(), json!(v)))
            .collect(),
    )
}

/// The OTLP metrics the registry implies, in the oracle's normalised form.
fn expected_otlp(reg: &Registry) -> Value {
    let started = reg.started_unix_nano().unwrap();
    let mut metrics = Vec::new();
    if let Some(sc) = reg.score() {
        metrics.push(json!({"name":"kshana.trust.score","description":"Latest GNSS trust score, 0 to 100.","unit":"1","kind":"gauge",
            "points":[{"attributes":{},"value":sc,"value_kind":"double","start":Value::Null,"time":NOW_NANO}]}));
    }
    metrics.push(json!({"name":"kshana.trust.band","description":"1 for the current trust band, 0 for the others.","unit":"1","kind":"gauge",
        "points": Band::ALL.iter().map(|b| json!({"attributes":attrs(&[("band",b.label())]),"value":u8::from(reg.band()==Some(*b)),"value_kind":"int","start":Value::Null,"time":NOW_NANO})).collect::<Vec<_>>()}));
    metrics.push(json!({"name":"kshana.trust.epochs","description":"Epochs received, by trust band.","unit":"1","kind":"sum","is_monotonic":true,"temporality":2,
        "points": Band::ALL.iter().map(|b| json!({"attributes":attrs(&[("band",b.label())]),"value":reg.epochs_in(*b),"value_kind":"int","start":started,"time":NOW_NANO})).collect::<Vec<_>>()}));
    let rs: Vec<Value> = reg.reason_epochs().map(|(r, n)| json!({"attributes":attrs(&[("reason",r)]),"value":n,"value_kind":"int","start":started,"time":NOW_NANO})).collect();
    if !rs.is_empty() {
        metrics.push(json!({"name":"kshana.trust.reason.epochs","description":"Epochs in which a reason was present, by reason.","unit":"1","kind":"sum","is_monotonic":true,"temporality":2,"points":rs}));
    }
    json!({"resource":{"service.name":"kshana","service.version":VERSION},"scope":"kshana.telemetry","metrics":metrics})
}

fn sort_points(v: &mut Value) {
    for m in v["metrics"].as_array_mut().unwrap() {
        m["points"]
            .as_array_mut()
            .unwrap()
            .sort_by_key(|p| p["attributes"].to_string());
    }
}

#[test]
fn the_official_otlp_proto_reads_our_json_as_the_registry_implies() {
    let (reg, _, _) = registry();
    let mut want = expected_otlp(&reg);
    let mut got: Value = serde_json::from_str(&read("otlp_reference.json")).unwrap();
    assert_eq!(got["parsed_strictly"], true);
    let mut got = got["request"].take();
    sort_points(&mut want);
    sort_points(&mut got);
    assert_eq!(got, want);
}
