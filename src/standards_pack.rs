// SPDX-License-Identifier: AGPL-3.0-only
//! Standards packs: a named set of scenarios, each scored against bars stated in the pack
//! before it is run, and tied to the compliance-report rows it supports evidence for.
//!
//! A pack is `standards/<id>/pack.toml` plus the scenario files it names, embedded in the
//! library so every surface can list and run it without a file system. [`run`] runs each
//! scenario through [`crate::api::run_toml`], reads the result JSON at the bar's JSON pointer
//! and reports `MET` or `NOT MET` per bar. A test with no scenario is `NEEDS INPUT`: it names
//! what the operator must supply (a receiver log, a laboratory run) and is never scored.
//!
//! **A pack measures a modelled scenario against a stated bar. It does not rate a product,
//! and no result here says that anything is conformant, certified or compliant.** Bars are
//! the pack author's stated profile, committed in `standards/<id>/PREREGISTRATION.md` before
//! any scored run and never changed after one. Everything a pack runs is MODELLED.

use crate::compliance::STATEMENT;
use serde::Deserialize;
use serde_json::{json, Value};
use sha2::{Digest, Sha256};

/// The schema tag of a pack report.
pub const REPORT_SCHEMA: &str = "kshana.standards-pack-report/1";

/// What a pack report is and is not.
pub const NOTICE: &str = "A standards pack measures modelled scenarios against bars stated \
    before the run. It supports evidence for the framework rows it names; it does not rate or \
    approve any product, and a MET bar says only that the scenario's modelled output met the \
    stated bar.";

/// The advisory statement every pack report carries.
pub const ADVISORY: &str = "Advisory: analysis output from a research and engineering tool, \
    not type-approved navigation equipment and not a safety-of-life service; it must not be \
    the sole basis for any navigation or safety decision.";

/// A bar: one comparison on a result field, stated before the run.
#[derive(Clone, Debug, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct Bar {
    /// JSON pointer (RFC 6901) into the result.
    pub pointer: String,
    /// `eq`, `ne`, `ge`, `gt`, `le` or `lt`.
    pub op: String,
    /// Divide the value at `pointer` by the value at this pointer first (a fraction).
    #[serde(default)]
    pub over: Option<String>,
    /// The constant to compare with (a number, boolean or string).
    #[serde(default)]
    pub value: Option<toml::Value>,
    /// Compare with the value at this pointer instead of a constant.
    #[serde(default)]
    pub against: Option<String>,
    /// Why the bar is what it is (its source or reasoning), one sentence.
    pub why: String,
}

/// One test of a pack.
#[derive(Clone, Debug, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct Test {
    /// Identifier, unique in the pack.
    pub id: String,
    /// The profile (a level, a clause group) the test belongs to.
    pub profile: String,
    /// Title.
    pub title: String,
    /// The scenario file stem in the pack directory; absent for a test that needs input.
    #[serde(default)]
    pub scenario: Option<String>,
    /// Run the scenario twice and require byte-identical results.
    #[serde(default)]
    pub repeat: bool,
    /// What the operator must supply, for a test that is not run by the engine alone.
    #[serde(default)]
    pub needs_input: Option<String>,
    /// Compliance-report row ids (`kshana compliance-report --mapping`) this test supports
    /// evidence for.
    #[serde(default)]
    pub supports_rows: Vec<String>,
    /// The bars.
    #[serde(default, rename = "bar")]
    pub bars: Vec<Bar>,
    /// What the test does not show.
    #[serde(default)]
    pub gap: String,
}

/// A row the pack adds to the compliance mapping: one reference in the source document, in
/// the pack author's own words, with the tests that support evidence for it.
#[derive(Clone, Debug, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct Row {
    /// Identifier, unique across the pack and the static mapping.
    pub id: String,
    /// Where in the source document (a paragraph, table or section number).
    pub reference: String,
    /// What it asks, paraphrased and short (never a pasted clause).
    pub asks: String,
    /// What the pack's tests leave unshown.
    pub gap: String,
}

/// A pack manifest.
#[derive(Clone, Debug, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct Pack {
    /// Identifier (the directory name).
    pub id: String,
    /// Title.
    pub title: String,
    /// The compliance framework id the pack's rows belong to.
    pub framework: String,
    /// Sources the pack paraphrases, with what was and was not read.
    pub sources: Vec<String>,
    /// Rows the pack adds to the compliance mapping (tests may also name rows of the static
    /// mapping in `src/compliance/mapping.rs`).
    #[serde(default, rename = "row")]
    pub rows: Vec<Row>,
    /// The tests.
    #[serde(rename = "test")]
    pub tests: Vec<Test>,
}

type Scenarios = &'static [(&'static str, &'static str)];

macro_rules! scn {
    ($pack:literal, $stem:literal) => {
        (
            $stem,
            include_str!(concat!("../standards/", $pack, "/", $stem, ".toml")),
        )
    };
}

/// An embedded pack: manifest text and scenario texts by file stem.
struct Embedded {
    id: &'static str,
    manifest: &'static str,
    scenarios: Scenarios,
}

const EMBEDDED: &[Embedded] = &[
    Embedded {
        id: "dhs-rpcf",
        manifest: include_str!("../standards/dhs-rpcf/pack.toml"),
        scenarios: &[
            scn!("dhs-rpcf", "l1-repeatable-spoof-detect"),
            scn!("dhs-rpcf", "l2-spoof-position-push"),
            scn!("dhs-rpcf", "l2-jammer-1km"),
            scn!("dhs-rpcf", "l3-clock-holdover"),
            scn!("dhs-rpcf", "l3-combined-altpnt"),
            scn!("dhs-rpcf", "l4-conflict-resilience"),
        ],
    },
    Embedded {
        id: "imo-circ-1575",
        manifest: include_str!("../standards/imo-circ-1575/pack.toml"),
        scenarios: &[
            scn!("imo-circ-1575", "accuracy-a-open-water"),
            scn!("imo-circ-1575", "accuracy-b-open-water"),
            scn!("imo-circ-1575", "accuracy-b-multi-system"),
            scn!("imo-circ-1575", "accuracy-b-harbour"),
            scn!("imo-circ-1575", "integrity-consistency-spoof"),
        ],
    },
    Embedded {
        id: "icao-doc9849-appf",
        manifest: include_str!("../standards/icao-doc9849-appf/pack.toml"),
        scenarios: &[
            scn!("icao-doc9849-appf", "assess-jammer-1km"),
            scn!("icao-doc9849-appf", "assess-jammer-10km"),
            scn!("icao-doc9849-appf", "assess-jammer-100km"),
            scn!("icao-doc9849-appf", "mitigate-spoof-detect"),
            scn!("icao-doc9849-appf", "mitigate-combined-altpnt"),
            scn!("icao-doc9849-appf", "mitigate-clock-holdover"),
        ],
    },
];

/// Ids of the packs, in order.
pub fn ids() -> Vec<&'static str> {
    EMBEDDED.iter().map(|e| e.id).collect()
}

fn embedded(id: &str) -> Result<&'static Embedded, String> {
    EMBEDDED.iter().find(|e| e.id == id).ok_or_else(|| {
        crate::terr!(
            "e-standards-pack-no-standards-pack-named-the",
            id = id,
            ids = ids().join(", ")
        )
    })
}

/// Parse the manifest of pack `id`.
pub fn load(id: &str) -> Result<Pack, String> {
    let e = embedded(id)?;
    parse(e.manifest, e.scenarios)
}

/// Parse a manifest and check it against the scenarios it may name.
pub fn parse(manifest: &str, scenarios: Scenarios) -> Result<Pack, String> {
    let p: Pack = toml::from_str(manifest)
        .map_err(|e| crate::terr!("e-standards-pack-pack-manifest", e = e))?;
    let mut seen = std::collections::BTreeSet::new();
    for t in &p.tests {
        if !seen.insert(t.id.as_str()) {
            return Err(crate::terr!(
                "e-standards-pack-test-duplicate-id",
                id = t.id
            ));
        }
        match (&t.scenario, &t.needs_input) {
            (Some(s), None) => {
                if !scenarios.iter().any(|(n, _)| n == s) {
                    return Err(crate::terr!(
                        "e-standards-pack-test-scenario-is-not-in",
                        id = t.id,
                        s = s
                    ));
                }
                if t.bars.is_empty() && !t.repeat {
                    return Err(crate::terr!(
                        "e-standards-pack-test-scored-test-needs-bar",
                        id = t.id
                    ));
                }
            }
            (None, Some(_)) => {
                if !t.bars.is_empty() {
                    return Err(crate::terr!(
                        "e-standards-pack-test-test-that-needs-input",
                        id = t.id
                    ));
                }
            }
            _ => {
                return Err(crate::terr!(
                    "e-standards-pack-test-give-either-scenario-or",
                    id = t.id
                ))
            }
        }
        for r in &t.supports_rows {
            let known = p.rows.iter().any(|x| &x.id == r)
                || crate::compliance::mapping::rows().iter().any(|x| x.id == r);
            if !known {
                return Err(crate::terr!(
                    "e-standards-pack-test-supports-unknown-row",
                    id = t.id,
                    r = r
                ));
            }
        }
        for b in &t.bars {
            if !["eq", "ne", "ge", "gt", "le", "lt"].contains(&b.op.as_str()) {
                return Err(crate::terr!(
                    "e-standards-pack-test-unknown-op",
                    id = t.id,
                    op = b.op
                ));
            }
            if b.value.is_some() == b.against.is_some() {
                return Err(crate::terr!(
                    "e-standards-pack-test-bar-on-needs-exactly",
                    id = t.id,
                    pointer = b.pointer
                ));
            }
        }
    }
    let mut row_ids = std::collections::BTreeSet::new();
    for r in &p.rows {
        if !row_ids.insert(r.id.as_str())
            || crate::compliance::mapping::rows()
                .iter()
                .any(|x| x.id == r.id)
        {
            return Err(crate::terr!("e-standards-pack-row-duplicate-id", id = r.id));
        }
        if r.asks.len() >= 400 {
            return Err(crate::terr!(
                "e-standards-pack-row-asks-must-be-short",
                id = r.id
            ));
        }
        if !p.tests.iter().any(|t| t.supports_rows.contains(&r.id)) {
            return Err(crate::terr!(
                "e-standards-pack-row-no-test-supports-it",
                id = r.id
            ));
        }
    }
    Ok(p)
}

fn number(v: &Value) -> Option<f64> {
    v.as_f64().filter(|x| x.is_finite())
}

/// Evaluate one bar on a result: `(measured, expected, met)`.
fn eval_bar(b: &Bar, result: &Value) -> (Value, Value, Option<bool>) {
    let at = |p: &str| result.pointer(p).cloned();
    let mut measured = at(&b.pointer).unwrap_or(Value::Null);
    if let Some(over) = &b.over {
        measured = match (number(&measured), at(over).as_ref().and_then(number)) {
            (Some(n), Some(d)) if d != 0.0 => json!(n / d),
            _ => Value::Null,
        };
    }
    let expected = match (&b.value, &b.against) {
        (Some(v), _) => serde_json::to_value(v).unwrap_or(Value::Null),
        (None, Some(p)) => at(p).unwrap_or(Value::Null),
        _ => Value::Null,
    };
    let met = match (number(&measured), number(&expected)) {
        (Some(m), Some(e)) => Some(match b.op.as_str() {
            "eq" => m == e,
            "ne" => m != e,
            "ge" => m >= e,
            "gt" => m > e,
            "le" => m <= e,
            _ => m < e,
        }),
        _ if !measured.is_null() && !expected.is_null() => match b.op.as_str() {
            "eq" => Some(measured == expected),
            "ne" => Some(measured != expected),
            _ => None,
        },
        _ => None,
    };
    (measured, expected, met)
}

fn run_test(t: &Test, scenarios: Scenarios) -> Value {
    let base = json!({
        "id": t.id, "profile": t.profile, "title": t.title, "scenario": t.scenario,
        "supports_rows": t.supports_rows, "gap": t.gap,
    });
    let with = |extra: Value| {
        let mut v = base.clone();
        if let (Some(m), Some(x)) = (v.as_object_mut(), extra.as_object()) {
            m.extend(x.clone());
        }
        v
    };
    let Some(stem) = &t.scenario else {
        return with(json!({
            "status": "NEEDS INPUT",
            "needs_input": t.needs_input,
        }));
    };
    let src = scenarios
        .iter()
        .find(|(n, _)| n == stem)
        .map(|(_, s)| *s)
        .unwrap_or_default();
    let hash = hex::encode(Sha256::digest(src.as_bytes()));
    let out = match crate::api::run_toml(src) {
        Ok(o) => o,
        Err(e) => {
            return with(json!({"status": "ERROR", "error": e, "scenario_sha256": hash}));
        }
    };
    let result: Value = serde_json::from_str(&out.json).unwrap_or(Value::Null);
    let mut bars: Vec<Value> = t
        .bars
        .iter()
        .map(|b| {
            let (measured, expected, met) = eval_bar(b, &result);
            json!({
                "pointer": b.pointer, "op": b.op, "over": b.over, "measured": measured,
                "expected": expected, "met": met, "why": b.why,
            })
        })
        .collect();
    if t.repeat {
        let again = crate::api::run_toml(src).map(|o| o.json).ok();
        let same = again.as_deref() == Some(out.json.as_str());
        bars.push(json!({
            "pointer": "(whole result)", "op": "identical on a second run", "measured": same,
            "expected": true, "met": same,
            "why": "a run must be repeatable from its scenario, seed and engine version",
        }));
    }
    let all_met = bars.iter().all(|b| b["met"] == json!(true));
    with(json!({
        "status": if all_met { "MET" } else { "NOT MET" },
        "scenario_sha256": hash,
        "bars": bars,
    }))
}

/// Run a pack from its manifest text and scenarios. The report is JSON.
pub fn run_with(manifest: &str, scenarios: Scenarios) -> Result<Value, String> {
    let pack = parse(manifest, scenarios)?;
    let tests: Vec<Value> = pack.tests.iter().map(|t| run_test(t, scenarios)).collect();
    let count = |s: &str| tests.iter().filter(|t| t["status"] == json!(s)).count();
    Ok(json!({
        "schema": REPORT_SCHEMA,
        "engine_version": env!("CARGO_PKG_VERSION"),
        "pack": pack.id,
        "title": pack.title,
        "framework": pack.framework,
        "sources": pack.sources,
        "evidence_tier": "MODELLED",
        "notice": NOTICE,
        "advisory": ADVISORY,
        "statement": STATEMENT,
        "summary": {
            "met": count("MET"), "not_met": count("NOT MET"),
            "needs_input": count("NEEDS INPUT"), "error": count("ERROR"),
        },
        "tests": tests,
    }))
}

/// Run the embedded pack `id`.
pub fn run(id: &str) -> Result<Value, String> {
    let e = embedded(id)?;
    run_with(e.manifest, e.scenarios)
}

/// The packs as JSON: id, title, framework and test counts.
pub fn list() -> Value {
    let packs: Vec<Value> = EMBEDDED
        .iter()
        .filter_map(|e| parse(e.manifest, e.scenarios).ok())
        .map(|p| {
            json!({
                "id": p.id, "title": p.title, "framework": p.framework,
                "tests": p.tests.len(),
                "scored": p.tests.iter().filter(|t| t.scenario.is_some()).count(),
                "needs_input": p.tests.iter().filter(|t| t.needs_input.is_some()).count(),
            })
        })
        .collect();
    json!({ "packs": packs, "notice": NOTICE })
}

/// The pack's rows as a Markdown table (what `docs/compliance/<pack>.md` embeds): each row
/// with the tests of the pack that support evidence for it.
pub fn rows_markdown(pack: &Pack) -> String {
    let mut s = String::from(
        "| Reference | What it asks (paraphrased) | Pack tests that support evidence for it | Gap |\n|---|---|---|---|\n",
    );
    for r in &pack.rows {
        let tests = pack
            .tests
            .iter()
            .filter(|t| t.supports_rows.contains(&r.id))
            .map(|t| t.id.as_str())
            .collect::<Vec<_>>()
            .join(", ");
        s.push_str(&format!(
            "| {} | {} | {} | {} |\n",
            r.reference, r.asks, tests, r.gap
        ));
    }
    s
}

/// The pack's tests as a Markdown table, with the bars each one states.
pub fn tests_markdown(pack: &Pack) -> String {
    let mut s = String::from(
        "| Test | Profile | Scenario | Bars stated before the run |\n|---|---|---|---|\n",
    );
    for t in &pack.tests {
        let bars = if let Some(n) = &t.needs_input {
            crate::t!(
                "standards-pack-not-scored-needs-input",
                n = n.split(['.', ':']).next().unwrap_or("")
            )
        } else {
            let mut v: Vec<String> = t
                .bars
                .iter()
                .map(|b| {
                    let rhs = match (&b.value, &b.against) {
                        (Some(v), _) => v.to_string(),
                        (_, Some(a)) => format!("`{a}`"),
                        _ => String::new(),
                    };
                    let lhs = match &b.over {
                        Some(o) => format!("`{}` / `{o}`", b.pointer),
                        None => format!("`{}`", b.pointer),
                    };
                    format!("{lhs} {} {rhs}", b.op)
                })
                .collect();
            if t.repeat {
                v.push("identical on a second run".into());
            }
            v.join("; ")
        };
        s.push_str(&format!(
            "| {} {} | {} | {} | {} |\n",
            t.id,
            t.title,
            t.profile,
            t.scenario.as_deref().unwrap_or("none"),
            bars
        ));
    }
    s
}

/// The report as Markdown.
pub fn report_markdown(report: &Value) -> String {
    let mut s = format!(
        "# {}\n\n{}\n\n{}\n\n{}\n\n",
        report["title"].as_str().unwrap_or("Standards pack"),
        crate::legal::text("legal-standards-pack-notice"),
        crate::legal::text("legal-compliance-statement"),
        crate::legal::text("legal-standards-pack-advisory")
    );
    s.push_str("| Test | Profile | Status | Bars | Supports rows |\n|---|---|---|---|---|\n");
    for t in report["tests"].as_array().into_iter().flatten() {
        let bars = t["bars"]
            .as_array()
            .map(|b| {
                b.iter()
                    .map(|x| {
                        format!(
                            "`{}` {} {} (measured {})",
                            x["pointer"].as_str().unwrap_or(""),
                            x["op"].as_str().unwrap_or(""),
                            x["expected"],
                            x["measured"]
                        )
                    })
                    .collect::<Vec<_>>()
                    .join("; ")
            })
            .unwrap_or_else(|| t["needs_input"].as_str().unwrap_or("").to_string());
        let rows = t["supports_rows"]
            .as_array()
            .map(|r| {
                r.iter()
                    .filter_map(Value::as_str)
                    .collect::<Vec<_>>()
                    .join(", ")
            })
            .unwrap_or_default();
        s.push_str(&format!(
            "| {} {} | {} | {} | {} | {} |\n",
            t["id"].as_str().unwrap_or(""),
            t["title"].as_str().unwrap_or(""),
            t["profile"].as_str().unwrap_or(""),
            t["status"].as_str().unwrap_or(""),
            bars,
            rows
        ));
    }
    s
}

#[cfg(test)]
mod tests {
    use super::*;

    const MANIFEST: &str = r#"
id = "t"
title = "T"
framework = "dhs-rpcf"
sources = ["s"]
[[test]]
id = "a"
profile = "p"
title = "A"
scenario = "clock-holdover"
repeat = true
[[test.bar]]
pointer = "/quantum/fom/timing_p95_ns"
op = "le"
against = "/threshold_ns"
why = "w"
[[test]]
id = "b"
profile = "p"
title = "B"
needs_input = "a receiver log"
"#;

    fn scenarios() -> Scenarios {
        &[(
            "clock-holdover",
            include_str!("../scenarios/clock-holdover.toml"),
        )]
    }

    #[test]
    fn runs_scores_and_marks_input_tests() {
        let r = run_with(MANIFEST, scenarios()).unwrap();
        assert_eq!(r["schema"], REPORT_SCHEMA);
        assert_eq!(r["tests"][1]["status"], "NEEDS INPUT");
        let a = &r["tests"][0];
        assert!(a["status"] == "MET" || a["status"] == "NOT MET");
        // The repeat check is reported as a bar of its own.
        assert_eq!(a["bars"].as_array().unwrap().len(), 2);
        assert_eq!(a["bars"][1]["met"], true);
        assert!(r["statement"]
            .as_str()
            .unwrap()
            .contains("supports evidence"));
    }

    #[test]
    fn bad_manifests_are_refused() {
        for (bad, why) in [
            (
                MANIFEST.replace("clock-holdover", "nope"),
                "not in the pack",
            ),
            (
                MANIFEST.replace("op = \"le\"", "op = \"approx\""),
                "unknown op",
            ),
            (
                MANIFEST.replace("against = \"/threshold_ns\"", "value = 1\nagainst = \"/x\""),
                "exactly one",
            ),
            (MANIFEST.replace("id = \"b\"", "id = \"a\""), "duplicate"),
        ] {
            let e = parse(&bad, scenarios()).unwrap_err();
            assert!(e.contains(why), "{why}: {e}");
        }
    }

    #[test]
    fn a_missing_field_is_unmet_not_met() {
        let b = Bar {
            pointer: "/nothing".into(),
            op: "ge".into(),
            over: None,
            value: Some(toml::Value::Float(0.0)),
            against: None,
            why: "w".into(),
        };
        let (_, _, met) = eval_bar(&b, &json!({"x": 1}));
        assert_eq!(met, None);
    }
}
