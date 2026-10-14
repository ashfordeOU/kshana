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
//! A second corpus, `telemetry_oracle_13` (schema 1.3: geometry series and the `class` label),
//! is pre-registered in `xval/telemetry-1.3/PREREGISTRATION.md` (fb226057) and judged by the
//! same two parsers (O1, O2) plus promtool 3.5.0 `check metrics` (O3) and the OpenTelemetry
//! Collector contrib 0.135.0 (O4), run by `xval/telemetry-1.3/run.sh`. First run, 2026-10-14:
//! every bar met (`xval/telemetry-1.3/RESULTS.md`).
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
// PIN-SCOPE:    a fixed Unix-nanosecond timestamp (the registry's clock is injected) so the committed oracle outputs are reproducible
// PIN-EXCLUDES: the wall clock, which the exporter reads only outside this code
const NOW_NANO: u64 = 1_790_000_100_000_000_000;

/// The schema-1.2 corpus (`telemetry_oracle`) and the schema-1.3 corpus (`telemetry_oracle_13`,
/// pre-registered in `xval/telemetry-1.3/PREREGISTRATION.md`).
const C12: &str = "telemetry_oracle";
const C13: &str = "telemetry_oracle_13";

fn dir_of(corpus: &str) -> PathBuf {
    Path::new(env!("CARGO_MANIFEST_DIR"))
        .join("tests/fixtures")
        .join(corpus)
}

fn read(name: &str) -> String {
    read_in(C12, name)
}

fn read_in(corpus: &str, name: &str) -> String {
    let p = dir_of(corpus).join(name);
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
    let (reg, last, bad, _) = registry_in(C12);
    (reg, last, bad)
}

/// The registry of a corpus, its last sample, the count of unparsable lines, and the latest
/// class each reason came with (read from the samples, not from the registry).
fn registry_in(
    corpus: &str,
) -> (
    Registry,
    TrustSample,
    usize,
    std::collections::BTreeMap<String, String>,
) {
    let mut reg = Registry::new(VERSION);
    reg.set_expose_position(true);
    let mut last = None;
    let mut bad = 0;
    let mut classes = std::collections::BTreeMap::new();
    for line in read_in(corpus, "stream.jsonl")
        .lines()
        .filter(|l| !l.trim().is_empty())
    {
        match parse_live_line(line) {
            Ok(s) => {
                reg.observe(&s, Some(NOW));
                for (r, c) in &s.reason_class {
                    classes.insert(r.clone(), c.to_string());
                }
                last = Some(s);
            }
            Err(_) => {
                reg.observe_input_error();
                bad += 1;
            }
        }
    }
    (reg, last.expect("stream has samples"), bad, classes)
}

#[test]
fn the_committed_outputs_are_what_this_crate_produces() {
    for corpus in [C12, C13] {
        let (reg, _, bad, _) = registry_in(corpus);
        assert!(bad > 0, "{corpus}: the stream includes unparsable lines");
        assert_eq!(
            reg.render(),
            read_in(corpus, "exposition.prom"),
            "{corpus}: exposition.prom is stale"
        );
        #[cfg(feature = "otlp")]
        {
            let want: Value = serde_json::from_str(&read_in(corpus, "otlp.json")).unwrap();
            assert_eq!(
                kshana::telemetry::otlp::build_payload(&reg, NOW_NANO),
                want,
                "{corpus}: otlp.json is stale"
            );
        }
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
    classes: &std::collections::BTreeMap<String, String>,
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
                let mut l = vec![("reason", r)];
                if let Some(c) = classes.get(r) {
                    l.push(("class", c.as_str()));
                }
                sample("kshana_trust_reason_active", &l, f64::from(u8::from(on)))
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
    if reg.geometry_seen() {
        expected_geometry(reg, &mut add);
    }
    m
}

const STATUSES: [&str; 3] = ["good", "degraded", "unknown"];
const LABELS: [&str; 4] = ["good", "fair", "poor", "unknown"];

/// The schema-1.3 geometry families the registry implies.
fn expected_geometry(reg: &Registry, add: &mut impl FnMut(&str, &'static str, &str, Vec<Sample>)) {
    let g = reg.geometry();
    let n = "kshana_trust_geometry";
    add(n, "gauge", "Satellite geometry at the latest epoch: 1 for the current status (good, degraded, unknown), 0 for the others.",
        STATUSES.iter().map(|st| sample(n, &[("status", st)], f64::from(u8::from(g.is_some_and(|g| g.status == *st))))).collect());
    if let Some(g) = g.filter(|g| g.status != "unknown") {
        let n = "kshana_trust_geometry_degraded";
        add(n, "gauge", "1 if the satellite geometry at the latest epoch is degraded, 0 if good; absent when unknown.",
            vec![sample(n, &[], f64::from(u8::from(g.status == "degraded")))]);
        if let Some(loss) = g.signal_loss {
            let n = "kshana_trust_geometry_signal_loss";
            add(n, "gauge", "1 if satellites in view are not tracked while their geometry is good: the signal was lost, not the sky (geometry still reads degraded); absent when unknown.",
                vec![sample(n, &[], f64::from(u8::from(loss)))]);
        }
    }
    for (n, help, v) in [
        (
            "kshana_trust_geometry_hdop",
            "Horizontal dilution of precision at the latest epoch.",
            g.and_then(|g| g.hdop),
        ),
        (
            "kshana_trust_geometry_pdop",
            "Position dilution of precision at the latest epoch.",
            g.and_then(|g| g.pdop),
        ),
        (
            "kshana_trust_geometry_used_satellites",
            "Satellites used (tracked, where derived from the sky) at the latest epoch.",
            g.and_then(|g| g.n_used),
        ),
        (
            "kshana_trust_geometry_vdop",
            "Vertical dilution of precision at the latest epoch.",
            g.and_then(|g| g.vdop),
        ),
    ] {
        if let Some(v) = v {
            add(n, "gauge", help, vec![sample(n, &[], v)]);
        }
    }
    let n = "kshana_trust_geometry_epochs_total";
    let counts = reg.geometry_epochs();
    add(
        n,
        "counter",
        "Epochs received, by geometry status.",
        STATUSES
            .iter()
            .zip(counts)
            .map(|(st, c)| sample(n, &[("status", st)], c as f64))
            .collect(),
    );
    if let Some(label) = g.and_then(|g| g.label) {
        let n = "kshana_trust_geometry_label";
        add(n, "gauge", "Geometry label at the latest epoch: 1 for the current one (good, fair, poor, unknown), 0 for the others; never scored, the score deducts only for poor.",
            LABELS.iter().map(|l| sample(n, &[("label", l)], f64::from(u8::from(label == *l)))).collect());
    }
}

#[test]
fn prometheus_client_reads_our_exposition_as_the_registry_implies() {
    prometheus_client_check(C12);
}

/// O1 of the schema-1.3 pre-registration.
#[test]
fn prometheus_client_reads_the_schema_13_exposition_as_the_registry_implies() {
    prometheus_client_check(C13);
}

fn prometheus_client_check(corpus: &str) {
    let (reg, last, _, classes) = registry_in(corpus);
    let want = expected_prometheus(&reg, &last, &classes);
    let got: Value = serde_json::from_str(&read_in(corpus, "prometheus_reference.json")).unwrap();
    let fams = got["families"].as_array().unwrap();
    let got_names: BTreeSet<&str> = fams.iter().map(|f| f["name"].as_str().unwrap()).collect();
    let want_names: BTreeSet<&str> = want.keys().map(String::as_str).collect();
    assert_eq!(got_names, want_names, "families differ");
    for f in fams {
        let name = f["name"].as_str().unwrap();
        let w = &want[name];
        assert_eq!(f["type"].as_str().unwrap(), w.ty, "{corpus} {name}: type");
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
    if reg.geometry_seen() {
        let g = reg.geometry();
        let gauge = |name: &str, desc: &str, points: Vec<Value>| json!({"name":name,"description":desc,"unit":"1","kind":"gauge","points":points});
        let int = |a: Value, v: bool| json!({"attributes":a,"value":u8::from(v),"value_kind":"int","start":Value::Null,"time":NOW_NANO});
        let dbl = |v: f64| json!({"attributes":{},"value":v,"value_kind":"double","start":Value::Null,"time":NOW_NANO});
        metrics.push(gauge("kshana.geometry.status", "1 for the current satellite-geometry status (good, degraded, unknown), 0 for the others.",
            STATUSES.iter().map(|st| int(attrs(&[("status", st)]), g.is_some_and(|g| g.status == *st))).collect()));
        if let Some(g) = g.filter(|g| g.status != "unknown") {
            metrics.push(gauge(
                "kshana.geometry.degraded",
                "1 if the satellite geometry is degraded, 0 if good.",
                vec![int(json!({}), g.status == "degraded")],
            ));
            if let Some(loss) = g.signal_loss {
                metrics.push(gauge("kshana.geometry.signal_loss", "1 if satellites in view are not tracked while their geometry is good: the signal was lost, not the sky.", vec![int(json!({}), loss)]));
            }
        }
        for (n, d, v) in [
            (
                "kshana.geometry.hdop",
                "Horizontal dilution of precision.",
                g.and_then(|g| g.hdop),
            ),
            (
                "kshana.geometry.pdop",
                "Position dilution of precision.",
                g.and_then(|g| g.pdop),
            ),
            (
                "kshana.geometry.used_satellites",
                "Satellites used.",
                g.and_then(|g| g.n_used),
            ),
        ] {
            if let Some(v) = v {
                metrics.push(gauge(n, d, vec![dbl(v)]));
            }
        }
        if let Some(label) = g.and_then(|g| g.label) {
            metrics.push(gauge("kshana.geometry.label", "1 for the current geometry label (good, fair, poor, unknown), 0 for the others; never scored, the score deducts only for poor.",
                LABELS.iter().map(|l| int(attrs(&[("label", l)]), label == *l)).collect()));
        }
        if let Some(v) = g.and_then(|g| g.vdop) {
            metrics.push(gauge(
                "kshana.geometry.vdop",
                "Vertical dilution of precision.",
                vec![dbl(v)],
            ));
        }
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
    otlp_proto_check(C12);
}

/// O2 of the schema-1.3 pre-registration.
#[test]
fn the_official_otlp_proto_reads_the_schema_13_json_as_the_registry_implies() {
    otlp_proto_check(C13);
}

fn otlp_proto_check(corpus: &str) {
    let (reg, _, _, _) = registry_in(corpus);
    let mut want = expected_otlp(&reg);
    let mut got: Value = serde_json::from_str(&read_in(corpus, "otlp_reference.json")).unwrap();
    assert_eq!(got["parsed_strictly"], true);
    let mut got = got["request"].take();
    sort_points(&mut want);
    sort_points(&mut got);
    assert_eq!(got, want, "{corpus}");
}

// ---- schema 1.3 corpus ---------------------------------------------------------------

/// The synthetic schema-1.3 stream of `telemetry_oracle_13/stream.jsonl` (see the
/// pre-registration for what it must cover). Written with `KSHANA_XVAL_WRITE=1`.
fn stream_13() -> String {
    let statuses = ["good", "degraded", "unknown", "obscured"];
    let labels = [
        Some("good"),
        Some("fair"),
        Some("poor"),
        Some("unknown"),
        Some("splendid"),
        None,
    ];
    let reasons = [
        ("pseudorange_residual", "inconsistency"),
        ("cn0_drop", "environment"),
        ("hdop_high", "geometry"),
        ("quote\"inside", "inconsistency"),
        ("back\\slash", "environment"),
        ("line\nfeed", "geometry"),
        ("r\u{e9}ason \u{2713}", "mystery"),
    ];
    let mut out: Vec<String> = Vec::new();
    let push = |out: &mut Vec<String>, v: Value| out.push(serde_json::to_string(&v).unwrap());
    for i in 0..64u32 {
        let t = f64::from(i);
        if i < 5 {
            // schema 1.2 lines: no geometry, no class
            push(
                &mut out,
                json!({"seq": i + 1, "t_s": t, "time": null, "state": "calibrating", "score": null,
                "deductions": [], "alarms": [], "gate": "off", "note": null}),
            );
            continue;
        }
        if i == 20 {
            out.push("{not json".to_string());
            continue;
        }
        if i == 30 {
            push(
                &mut out,
                json!({"seq": i + 1, "t_s": t, "state": "nominal", "score": 90.0,
                "geometry": {"status": "good", "hdop": -1.0}}),
            );
            continue;
        }
        if i == 40 {
            push(
                &mut out,
                json!({"seq": i + 1, "t_s": t, "state": "nominal", "score": 90.0,
                "geometry": "good"}),
            );
            continue;
        }
        let k = i as usize;
        let ded: Vec<Value> = (0..(k % 4))
            .map(|j| {
                let (m, c) = reasons[(k + j) % reasons.len()];
                json!({"monitor": m, "points": 5 + j, "class": c})
            })
            .collect();
        let state = ["nominal", "degraded", "untrusted"][k % 3];
        let gate = ["off", "passed", "withheld"][k % 3];
        let mut geo = serde_json::Map::new();
        geo.insert("status".into(), json!(statuses[k % 4]));
        let opt = |x: f64, keep: bool| if keep { json!(x) } else { Value::Null };
        if k % 5 != 0 {
            geo.insert("hdop".into(), opt(0.75 + 0.125 * t, k % 7 != 0));
        }
        if k % 6 != 0 {
            geo.insert("pdop".into(), opt(1.5 + 0.0625 * t, k % 5 != 1));
        }
        geo.insert("n_used".into(), opt(f64::from(4 + i % 9), k % 8 != 0));
        if k % 3 != 0 {
            geo.insert("vdop".into(), json!(1.0 + 0.03125 * t));
        }
        if let Some(l) = labels[k % labels.len()] {
            geo.insert("label".into(), json!(l));
        }
        match k % 4 {
            0 => {}
            1 => {
                geo.insert("signal_loss".into(), Value::Null);
            }
            2 => {
                geo.insert("signal_loss".into(), json!(true));
            }
            _ => {
                geo.insert("signal_loss".into(), json!(false));
            }
        }
        let mut line = json!({"seq": i + 1, "t_s": t, "time": format!("2026-10-14T00:00:{:02}Z", i % 60),
            "state": state, "score": 99.0 - t, "deductions": ded, "alarms": [], "gate": gate,
            "note": null, "position": {"lat_deg": 59.8 + 0.001 * t, "lon_deg": 24.9, "height_m": 39.5},
            "geometry": Value::Object(geo)});
        if i == 63 {
            // the last line carries every geometry field, so every series renders
            line["geometry"] = json!({"status": "degraded", "hdop": 2.5, "pdop": 3.75, "n_used": 7,
                "vdop": 1.0625, "label": "fair", "signal_loss": true});
            line["deductions"] = json!([
                {"monitor": "hdop_high", "points": 10, "class": "geometry"},
                {"monitor": "quote\"inside", "points": 5, "class": "inconsistency"}
            ]);
        }
        push(&mut out, line);
    }
    out.join("\n") + "\n"
}

#[test]
fn the_schema_13_stream_is_reproducible() {
    let p = dir_of(C13).join("stream.jsonl");
    if std::env::var("KSHANA_XVAL_WRITE").is_ok() {
        std::fs::create_dir_all(dir_of(C13)).unwrap();
        std::fs::write(&p, stream_13()).unwrap();
    }
    assert_eq!(read_in(C13, "stream.jsonl"), stream_13());
    let (reg, last, bad, classes) = registry_in(C13);
    assert_eq!(bad, 3);
    assert!(reg.geometry_seen() && last.geometry.as_ref().unwrap().vdop.is_some());
    assert!(classes.values().any(|c| c == "geometry"));
}

/// O3 of the schema-1.3 pre-registration: promtool 3.5.0 `check metrics` exits 0 and reports
/// nothing (no parse error, no lint problem).
#[test]
fn promtool_accepts_the_schema_13_exposition() {
    let t = read_in(C13, "promtool.txt");
    let mut lines = t.lines();
    assert_eq!(lines.next(), Some("tool=promtool 3.5.0 check metrics"));
    assert_eq!(lines.next(), Some("exit=0"), "{t}");
    let rest: Vec<&str> = lines.filter(|l| !l.trim().is_empty()).collect();
    assert!(rest.is_empty(), "promtool reported: {rest:?}");
}

/// O4 of the schema-1.3 pre-registration: the OpenTelemetry Collector contrib 0.135.0 accepts
/// the OTLP/HTTP JSON payload (status 200, nothing rejected) and its file exporter records
/// exactly what the official proto reads from `otlp.json`, which is what the registry implies.
#[test]
fn the_collector_receives_and_exports_the_schema_13_payload_unchanged() {
    let post = read_in(C13, "collector_post.txt");
    assert!(post.lines().any(|l| l == "status=200"), "{post}");
    let resp = post
        .lines()
        .find_map(|l| l.strip_prefix("response="))
        .unwrap_or("");
    if !resp.trim().is_empty() {
        let v: Value = serde_json::from_str(resp).unwrap();
        let rejected = v["partialSuccess"]["rejectedDataPoints"]
            .as_str()
            .and_then(|s| s.parse::<u64>().ok())
            .or_else(|| v["partialSuccess"]["rejectedDataPoints"].as_u64())
            .unwrap_or(0);
        assert_eq!(rejected, 0, "{resp}");
    }
    let mut via: Value = serde_json::from_str(&read_in(C13, "collector_reference.json")).unwrap();
    assert_eq!(via["parsed_strictly"], true);
    let mut via = via["request"].take();
    let mut direct: Value = serde_json::from_str(&read_in(C13, "otlp_reference.json")).unwrap();
    let mut direct = direct["request"].take();
    let (reg, _, _, _) = registry_in(C13);
    let mut want = expected_otlp(&reg);
    sort_points(&mut via);
    sort_points(&mut direct);
    sort_points(&mut want);
    assert_eq!(via, direct);
    assert_eq!(via, want);
}
