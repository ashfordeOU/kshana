// SPDX-License-Identifier: AGPL-3.0-only
//! Common Event Format (CEF) events against an independent open-source parser.
//!
//! The oracle is `pycef` 1.11 (PyPI, MIT licence, David J. Bianco), a CEF parser that shares no
//! code or author with this crate. `scripts/gen_cef_ref.py` parses every CEF line of the corpus
//! below with it and writes `tests/fixtures/cef/reference.json`; this test compares that reading
//! with what the events were made from. CI needs no Python.
//!
//! # PRE-REGISTERED bar
//!
//! Registered in this file's first commit, before `pycef` was run on any line of this corpus.
//! Not to be loosened after seeing a result; any amendment is disclosed in the verification row.
//!
//! **Disclosure.** Before registering, the author read `pycef`'s source (a short regex parser)
//! to learn its API. Two facts from it shape the bar and are stated here, not discovered later:
//! (1) `pycef` does not unescape anything: it returns the raw text of each header field and
//! extension value. The unescaping, by the CEF specification's rules, is done in
//! `scripts/gen_cef_ref.py` (Python, independent of this crate), so what `pycef` independently
//! checks is the *structure* of our lines (which text is a header field, which is a key, which
//! is a value) and the script's unescape then checks that our escaping inverts correctly.
//! (2) `pycef`'s header pattern cannot match a header field containing a backslash, an equals
//! sign or an escaped pipe, so escaping inside the *header* cannot be checked by it. That is
//! excluded from the claim (tier 2 below) in advance.
//!
//! **Corpus** (built by `corpus()` below, written to `tests/fixtures/cef/corpus.json`):
//! * Tier 1, real events: every band change, and every epoch, of the committed stream
//!   `tests/fixtures/telemetry_oracle/stream.jsonl`, with the header fields this crate really
//!   writes (version string `9.9.9-oracle`);
//! * Tier 1, adversarial extension text: hosts, reasons, time labels and gate names containing
//!   `=`, `\`, the sequence backslash-equals, a pipe, line feed, carriage return, carriage return
//!   and line feed, a tab, runs of spaces, multi-byte text and astral characters; extreme
//!   scores and offsets; every band, with and without a previous band;
//! * Tier 2, adversarial header text (a version string with a pipe, a backslash, an equals
//!   sign): recorded, **not** part of the claim.
//!
//! **What must hold for every tier 1 event, EXACTLY** (string equality; tolerance zero):
//! 1. `pycef` returns a result (it parses the line);
//! 2. header: `CEFVersion` = `0`; `DeviceVendor` = `Ashforde OU`; `DeviceProduct` = `Kshana`;
//!    `DeviceVersion` = the version string given; `DeviceEventClassID` = `gnss-trust.<band>`;
//!    `Name` = `GNSS trust <band>`; `Severity` = the documented number for the band
//!    (calibrating 0, nominal 1, degraded 5, untrusted 9, unknown 3);
//! 3. extension: after `pycef`'s own substitution of the custom-field labels, and after the
//!    CEF specification's unescaping (extension: backslash-backslash, backslash-equals,
//!    backslash-n, backslash-r) the set of keys equals EXACTLY `cat`, `dvchost`, `band`, and
//!    only where the event has them `reasons`, `previousBand`, `trustScore`, `epochOffsetSeconds`
//!    (always), `logTime`, `gate`; and every value equals the original text exactly: `cat` =
//!    `gnss-trust`; `dvchost` = the host; `band` = the band label; `reasons` = the reasons joined
//!    by a comma; `previousBand` = the previous band's label; `logTime` and `gate` as given;
//!    `trustScore` and `epochOffsetSeconds` parse as numbers that equal the original `f64`
//!    exactly (`==`);
//! 4. the line is a single line (no raw line feed or carriage return).
//!
//! If a second open-source parser (the Logstash CEF codec) is run, the same bar applies to it.

use kshana::telemetry::sample::{parse_live_line, Band, TrustSample};
use kshana::telemetry::syslog::cef;
use serde_json::{json, Value};
use std::collections::BTreeMap;
use std::path::{Path, PathBuf};

const VERSION: &str = "9.9.9-oracle";
const HOST: &str = "ops-gw1";

fn dir() -> PathBuf {
    Path::new(env!("CARGO_MANIFEST_DIR")).join("tests/fixtures/cef")
}

fn read(p: &Path) -> String {
    std::fs::read_to_string(p).unwrap_or_else(|e| {
        panic!(
            "fixture {} missing ({e}); run scripts/gen_cef_ref.py",
            p.display()
        )
    })
}

struct Case {
    id: String,
    tier: u8,
    sample: TrustSample,
    prev: Option<Band>,
    host: String,
    version: String,
}

fn sample(t_s: f64, score: Option<f64>, band: Band, reasons: &[&str]) -> TrustSample {
    TrustSample {
        t_s,
        time_label: None,
        score,
        band,
        reasons: reasons.iter().map(|s| s.to_string()).collect(),
        gate: None,
        position: None,
    }
}

fn corpus() -> Vec<Case> {
    let mut v = Vec::new();
    // Tier 1: the committed stream, every epoch; a band change is also an event on its own.
    let stream = read(
        &Path::new(env!("CARGO_MANIFEST_DIR")).join("tests/fixtures/telemetry_oracle/stream.jsonl"),
    );
    let mut prev: Option<Band> = None;
    let (mut n_epoch, mut n_change) = (0, 0);
    for line in stream.lines().filter(|l| !l.trim().is_empty()) {
        let Ok(s) = parse_live_line(line) else {
            continue;
        };
        if prev != Some(s.band) {
            v.push(Case {
                id: format!("band-change-{n_change:02}"),
                tier: 1,
                sample: s.clone(),
                prev,
                host: HOST.into(),
                version: VERSION.into(),
            });
            n_change += 1;
        }
        v.push(Case {
            id: format!("epoch-{n_epoch:03}"),
            tier: 1,
            sample: s.clone(),
            prev,
            host: HOST.into(),
            version: VERSION.into(),
        });
        n_epoch += 1;
        prev = Some(s.band);
    }
    // Tier 1: adversarial extension text.
    let nasty: &[(&str, &[&str])] = &[
        ("equals", &["a=b"]),
        ("backslash", &["back\\slash"]),
        ("backslash-equals", &["x\\=y"]),
        ("trailing-backslash", &["ends-with\\"]),
        ("line-feed", &["line\nfeed"]),
        ("carriage-return", &["cr\rhere"]),
        ("crlf", &["crlf\r\nboth"]),
        ("pipe", &["pipe|inside", "a|b|c"]),
        ("tab", &["tab\there"]),
        ("spaces", &["multi word reason", "two  spaces  inside"]),
        ("key-lookalike", &["looks like key=value", "cs1=fake"]),
        (
            "unicode",
            &[
                "r\u{e9}ason \u{2713}",
                "\u{1F6F0} satellite",
                "\u{65e5}\u{672c}\u{8a9e}",
            ],
        ),
        (
            "many",
            &[
                "r00", "r01", "r02", "r03", "r04", "r05", "r06", "r07", "r08", "r09", "r10", "r11",
                "r12", "r13", "r14", "r15", "r16", "r17", "r18", "r19",
            ],
        ),
        ("comma-in-reason", &["a,b", "c"]),
    ];
    for (i, (name, reasons)) in nasty.iter().enumerate() {
        let band = Band::ALL[i % 5];
        let mut s = sample(10.0 + i as f64, Some(40.0 + i as f64), band, reasons);
        s.gate = Some("withheld".into());
        v.push(Case {
            id: format!("nasty-reasons-{name}"),
            tier: 1,
            sample: s,
            prev: Some(Band::ALL[(i + 1) % 5]),
            host: HOST.into(),
            version: VERSION.into(),
        });
    }
    for (i, host) in [
        "host=name",
        "ho\\st",
        "a\\=b",
        "host with spaces",
        "h\u{f4}st-\u{2713}",
        "multi\nline",
        "pipe|host",
        "k=v k2=v2",
    ]
    .iter()
    .enumerate()
    {
        v.push(Case {
            id: format!("nasty-host-{i}"),
            tier: 1,
            sample: sample(1.0, Some(90.0), Band::Nominal, &[]),
            prev: None,
            host: host.to_string(),
            version: VERSION.into(),
        });
    }
    for (i, label) in [
        "2026-01-01T00:00:00Z",
        "hh:mm:ss.mmm UTC (date not in log)",
        "a=b c=d",
        "back\\slash",
        "new\nline",
        "x  y",
    ]
    .iter()
    .enumerate()
    {
        let mut s = sample(2.0, None, Band::Degraded, &["cn0-drop"]);
        s.time_label = Some(label.to_string());
        v.push(Case {
            id: format!("nasty-time-label-{i}"),
            tier: 1,
            sample: s,
            prev: Some(Band::Nominal),
            host: HOST.into(),
            version: VERSION.into(),
        });
    }
    for (i, gate) in ["a b", "x=y", "g\\h", "g\nh"].iter().enumerate() {
        let mut s = sample(3.0, Some(50.0), Band::Untrusted, &["kinematic"]);
        s.gate = Some(gate.to_string());
        v.push(Case {
            id: format!("nasty-gate-{i}"),
            tier: 1,
            sample: s,
            prev: Some(Band::Degraded),
            host: HOST.into(),
            version: VERSION.into(),
        });
    }
    // Numbers: extremes and awkward doubles, every band, with and without a previous band.
    let scores = [
        0.0,
        100.0,
        23.4,
        0.1 + 0.2,
        1e-7,
        123_456_789.125,
        99.99999999999999,
    ];
    let offsets = [0.0, 1e-3, 86_400.5, 1e15, 0.30000000000000004, 123.456];
    for (i, b) in Band::ALL.iter().enumerate() {
        for (j, &sc) in scores.iter().enumerate() {
            let t = offsets[(i + j) % offsets.len()];
            let prev = if j % 2 == 0 {
                None
            } else {
                Some(Band::ALL[(i + j) % 5])
            };
            v.push(Case {
                id: format!("numbers-{}-{j}", b.label()),
                tier: 1,
                sample: sample(t, Some(sc), *b, &["m"]),
                prev,
                host: HOST.into(),
                version: VERSION.into(),
            });
        }
    }
    // Tier 2: header text that needs escaping; recorded, not part of the claim.
    for (i, ver) in ["1|0", "a\\b", "x=y", "v|\\=|"].iter().enumerate() {
        v.push(Case {
            id: format!("header-{i}"),
            tier: 2,
            sample: sample(1.0, Some(80.0), Band::Nominal, &[]),
            prev: None,
            host: HOST.into(),
            version: ver.to_string(),
        });
    }
    v
}

fn line(c: &Case) -> String {
    cef(&c.sample, c.prev, &c.host, &c.version)
}

/// Write the corpus fixture when `KSHANA_WRITE_FIXTURES` is set (to refresh it), then read it.
fn committed_corpus() -> Value {
    let path = dir().join("corpus.json");
    if std::env::var_os("KSHANA_WRITE_FIXTURES").is_some() {
        let doc: Vec<Value> = corpus()
            .iter()
            .map(|c| json!({"id": c.id, "tier": c.tier, "version": c.version, "line": line(c)}))
            .collect();
        std::fs::write(&path, serde_json::to_string_pretty(&doc).unwrap() + "\n").unwrap();
    }
    serde_json::from_str(&read(&path)).unwrap()
}

#[test]
fn the_committed_corpus_is_what_this_crate_produces_and_covers_what_was_registered() {
    let committed = committed_corpus();
    let now = corpus();
    let c = committed.as_array().unwrap();
    assert_eq!(c.len(), now.len(), "corpus.json is stale");
    for (a, b) in c.iter().zip(&now) {
        assert_eq!(a["id"], b.id.as_str());
        assert_eq!(
            a["line"].as_str().unwrap(),
            line(b),
            "{}: line is stale",
            b.id
        );
    }
    let t1: Vec<&Case> = now.iter().filter(|c| c.tier == 1).collect();
    assert!(
        now.iter()
            .filter(|c| c.id.starts_with("band-change-"))
            .count()
            >= 4,
        "band changes of the stream"
    );
    assert!(t1.len() >= 100);
    // Every escape class actually occurs in some tier 1 line, and every severity.
    let all: String = t1.iter().map(|c| line(c)).collect::<Vec<_>>().join("\n");
    for needle in ["\\=", "\\\\", "\\n", "\\r"] {
        assert!(all.contains(needle), "no tier 1 line contains {needle:?}");
    }
    for sev in ["|0|", "|1|", "|5|", "|9|", "|3|"] {
        assert!(all.contains(sev), "no tier 1 line has severity {sev}");
    }
    assert!(
        t1.iter()
            .all(|c| !line(c).contains('\n') && !line(c).contains('\r')),
        "a tier 1 line is not a single line"
    );
}

const SEVERITY: [(Band, &str); 5] = [
    (Band::Calibrating, "0"),
    (Band::Nominal, "1"),
    (Band::Degraded, "5"),
    (Band::Untrusted, "9"),
    (Band::Unknown, "3"),
];

fn expected_extension(c: &Case) -> BTreeMap<String, String> {
    let s = &c.sample;
    let mut m = BTreeMap::new();
    m.insert("cat".to_string(), "gnss-trust".to_string());
    m.insert("dvchost".into(), c.host.clone());
    m.insert("band".into(), s.band.label().into());
    if !s.reasons.is_empty() {
        m.insert("reasons".into(), s.reasons.join(","));
    }
    if let Some(p) = c.prev {
        m.insert("previousBand".into(), p.label().into());
    }
    if let Some(sc) = s.score {
        m.insert("trustScore".into(), format!("{sc}"));
    }
    m.insert("epochOffsetSeconds".into(), format!("{}", s.t_s));
    if let Some(l) = &s.time_label {
        m.insert("logTime".into(), l.clone());
    }
    if let Some(g) = &s.gate {
        m.insert("gate".into(), g.clone());
    }
    m
}

#[test]
fn pycef_reads_every_tier_1_event_as_the_sample_implies() {
    let reference: Value = serde_json::from_str(&read(&dir().join("reference.json"))).unwrap();
    let cases = corpus();
    let mut bad: Vec<String> = Vec::new();
    let mut checked = 0;
    for c in cases.iter().filter(|c| c.tier == 1) {
        checked += 1;
        let r = &reference["cases"][c.id.as_str()];
        if r["parsed"] != true {
            bad.push(format!("{}: pycef did not parse the line", c.id));
            continue;
        }
        let h = &r["header"];
        let band = c.sample.band;
        let sev = SEVERITY.iter().find(|(b, _)| *b == band).unwrap().1;
        for (k, want) in [
            ("CEFVersion", "0".to_string()),
            ("DeviceVendor", "Ashforde OU".into()),
            ("DeviceProduct", "Kshana".into()),
            ("DeviceVersion", c.version.clone()),
            ("DeviceEventClassID", format!("gnss-trust.{}", band.label())),
            ("Name", format!("GNSS trust {}", band.label())),
            ("Severity", sev.to_string()),
        ] {
            if h[k] != want.as_str() {
                bad.push(format!(
                    "{}: header {k}: pycef {} expected {want:?}",
                    c.id, h[k]
                ));
            }
        }
        let got: BTreeMap<String, String> = r["extension"]
            .as_object()
            .unwrap()
            .iter()
            .map(|(k, v)| (k.clone(), v.as_str().unwrap().to_string()))
            .collect();
        let want = expected_extension(c);
        if got != want {
            bad.push(format!(
                "{}: extension: pycef+unescape {got:?} expected {want:?}",
                c.id
            ));
            continue;
        }
        for (k, orig) in [
            ("trustScore", c.sample.score),
            ("epochOffsetSeconds", Some(c.sample.t_s)),
        ] {
            if let Some(x) = orig {
                if got[k].parse::<f64>().ok() != Some(x) {
                    bad.push(format!(
                        "{}: {k} {} does not parse back to {x}",
                        c.id, got[k]
                    ));
                }
            }
        }
    }
    assert!(checked >= 100);
    assert!(
        bad.is_empty(),
        "{} disagreements:\n{}",
        bad.len(),
        bad.join("\n")
    );
}

#[test]
fn tier_2_header_cases_are_recorded_but_not_part_of_the_claim() {
    let reference: Value = serde_json::from_str(&read(&dir().join("reference.json"))).unwrap();
    let all = corpus();
    let t2: Vec<&Case> = all.iter().filter(|c| c.tier == 2).collect();
    assert_eq!(t2.len(), 4);
    for c in t2 {
        // Recorded for the verification row; deliberately not compared.
        assert!(
            reference["cases"].get(c.id.as_str()).is_some(),
            "{} missing from the reference",
            c.id
        );
    }
}
