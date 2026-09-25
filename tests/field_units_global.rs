// SPDX-License-Identifier: AGPL-3.0-only
//! The global units-and-provenance gate.
//!
//! Individual packs have grown a `units` block, and several carry a per-scenario test
//! that fails if one of *their* fields lacks a unit or a provenance class. That is per
//! scenario, added by whoever remembered: a pack with no `units` block at all passed
//! silently. This file is the gate that grades every pack at once.
//!
//! It runs **every kind in [`kshana::registry::ids::all`]** — at its defaults where the
//! defaults are runnable, and otherwise from the repository's own example scenario — then
//! walks every numeric leaf of the emitted document and requires a matching entry in that
//! document's `units` block, carrying a unit and a provenance class from the closed
//! vocabulary in [`kshana::field_schema::ProvenanceClass`].
//!
//! ## The ratchet
//!
//! Applied at once to a codebase this size, that requirement lights up. It is not
//! weakened to make it pass. Instead the kinds not yet covered are named, one by one,
//! in [`UNCOVERED_KINDS`], with the reason each is still open, and the count is pinned by
//! [`UNCOVERED_KIND_CEILING`]. The list can only shrink:
//!
//! * every kind on it must still genuinely be uncovered — a kind that has been finished
//!   fails the gate until it is removed from the list, so the list cannot be padded;
//! * the list may never exceed the ceiling, and the ceiling is a one-way number;
//! * there is no wildcard, and a kind not in [`RUNNERS`] at all is a failure, so a new
//!   pack cannot slip in unexamined.
//!
//! The same shape as `scripts/check-doc-coverage.sh`, which this repository already uses
//! and trusts, and the count is printed on every run and written into the committed
//! schema so it cannot be overlooked. At the time of writing: **54 of 56 kinds fully
//! described, 1311 of 1354 emitted numeric fields**.
//!
//! ## What it does not grade
//!
//! One document shape per kind — the source named in [`RUNNERS`]. A field that only
//! appears under some other input is not reached here, and stays the business of the
//! pack's own test (several packs run four or five shapes against the same contract).
//! The gate is therefore a floor on coverage, not a ceiling.
//!
//! ## Cost
//!
//! Building the corpus runs all 56 kinds once, in one process, and takes ~28 s wall clock
//! in a debug build on an Apple-silicon laptop (dominated by `hybrid-ukf` ≈ 8 s,
//! `cislunar-observability` ≈ 7 s, `mars-pnt` ≈ 3 s). That is why this is its own
//! integration target and not a library test: it is built once and shared by every test
//! in this file through a [`OnceLock`].

use kshana::field_schema::{audit_document, DocumentAudit, EvidenceTier, ProvenanceClass};
use serde_json::{json, Map, Value};
use std::sync::OnceLock;

/// Where the committed machine-readable schema lives.
const SCHEMA_PATH: &str = "docs/field-units-schema.json";

/// Every registered kind and the source it is run from: `""` means the kind's own
/// defaults (`kind = "…"` and nothing else), anything else is a path to one of the
/// repository's example scenarios, used for the kinds whose defaults are incomplete.
///
/// The list is asserted equal to `registry::ids::all()`, in order, so a new pack cannot
/// be added without deciding how this gate runs it.
const RUNNERS: &[(&str, &str)] = &[
    ("clock", "scenarios/clock-holdover.toml"),
    ("inertial", "scenarios/imu-deadreckoning.toml"),
    ("integrity", "scenarios/integrity-raim.toml"),
    ("timetransfer", "scenarios/timetransfer.toml"),
    ("quantum-time-transfer", ""),
    ("quantum-gnss-free-nav", ""),
    ("quantum-anomaly-detect", ""),
    ("hybrid", "scenarios/hybrid-pnt.toml"),
    ("fusion", "scenarios/fusion-pnt.toml"),
    ("hybrid-ukf", "scenarios/hybrid-ukf.toml"),
    ("gnss-ins", "scenarios/gnss-ins.toml"),
    ("gnss-sim", "scenarios/gnss-sim-raim.toml"),
    ("jamming", "scenarios/jamming-demo.toml"),
    ("spoof", "scenarios/spoof-attack.toml"),
    ("spoof-detect", "scenarios/spoof-detect.toml"),
    ("sweep", "scenarios/sweep-clock-stability.toml"),
    ("sweep-nd", "scenarios/sweep-nd-inertial.toml"),
    ("orbit", "scenarios/orbit-multignss.toml"),
    ("ephemeris", "scenarios/ephemeris.toml"),
    ("lunar-integrity", ""),
    ("lunar-time-offset", ""),
    ("lunar-vlbi", ""),
    ("lunar-joint-od-clock", ""),
    ("lunar-frame-realisation", ""),
    ("lunar-frame-campaign", ""),
    ("moonlight-service-volume", ""),
    ("lunar-differential-pnt", ""),
    ("lunar-beacon", "scenarios/lunar-beacon.toml"),
    ("earth-gnss-lunar", "scenarios/earth-gnss-lunar.toml"),
    ("lunar-interop-export", ""),
    ("gravity-map", "scenarios/gravity-map-nav.toml"),
    ("terrain-nav", "scenarios/terrain-nav.toml"),
    ("terrain-slam", "scenarios/terrain-slam.toml"),
    ("combined-altpnt", "scenarios/combined-altpnt.toml"),
    ("pvt", "scenarios/pvt-abmf.toml"),
    ("mars-pnt", ""),
    ("impairment-eval", ""),
    ("quantum-trade", "scenarios/quantum-trade.toml"),
    ("space-weather", ""),
    ("oem-interop", ""),
    ("launch-window", ""),
    ("reentry", ""),
    ("eo-coverage", ""),
    ("space-packet", ""),
    ("attitude-budget", ""),
    ("passes", ""),
    ("link-budget", ""),
    ("lunar-time-budget", ""),
    ("realtime-frame-eop", ""),
    ("hybrid-optical-rf", ""),
    ("cislunar-observability", ""),
    ("cislunar-arc-recovery", ""),
    ("conflict-resilience", ""),
    ("lunar-attack-surface", ""),
    ("aperture-duty-cycle", ""),
    ("lunar-jamming", ""),
    ("ins-trn-coast", ""),
    ("lunar-vlbi-fim", ""),
    ("tracking-loop", ""),
    ("araim-reference-check", ""),
    ("lunar-llr-datum", ""),
    ("telecom-timing", "scenarios/telecom-prtc-holdover-24h.toml"),
];

/// The kinds whose reports do not yet describe every numeric field they emit, each with
/// the reason it is still open.
///
/// **This list is a one-way ratchet.** Removing a kind from it is the only edit that
/// should ever be made: the gate fails if a listed kind turns out to be fully covered, so
/// an entry cannot be left here to pad the budget, and it fails if the list grows past
/// [`UNCOVERED_KIND_CEILING`]. There is no wildcard — every uncovered kind is named.
const UNCOVERED_KINDS: &[(&str, &str)] = &[(
    "sweep-nd",
    "two of its three columns have no unit that is not itself data: \
         `points[].coords[]` carries one value per caller-chosen dotted scenario key and \
         `points[].metrics[]` one per caller-chosen dotted result path, so each is a \
         column of mixed units. Resolving them means looking each path up in the SWEPT \
         pack's own units table, which this pack does not consult. Its third column, \
         `shape[]`, is described — 2 fields",
)];

/// The pinned size of [`UNCOVERED_KINDS`]. Lower it whenever a kind is finished; never
/// raise it.
///
/// Was 2. `cislunar-observability` came off the list when its released document gained a
/// units block: the pin that had blocked it now proves the addition is additive (strip
/// `units` back off and the document still hashes to the value frozen before it existed)
/// instead of forbidding it outright.
const UNCOVERED_KIND_CEILING: usize = 1;

/// The pinned number of covered fields whose units entry carries no definition. The
/// entries that predate this gate largely have none; new entries must. Lower it as the
/// backlog is paid down; never raise it.
const DEFINITIONLESS_FIELD_CEILING: usize = 239;

/// One kind's run: the document it emitted and the audit of that document.
struct KindRun {
    kind: &'static str,
    source: &'static str,
    doc: Value,
    audit: DocumentAudit,
}

fn corpus() -> &'static Vec<KindRun> {
    static CORPUS: OnceLock<Vec<KindRun>> = OnceLock::new();
    CORPUS.get_or_init(|| {
        RUNNERS
            .iter()
            .map(|(kind, source)| {
                let src = if source.is_empty() {
                    format!("kind = \"{kind}\"\n")
                } else {
                    std::fs::read_to_string(source)
                        .unwrap_or_else(|e| panic!("{kind}: cannot read {source}: {e}"))
                };
                let out = kshana::api::run_toml(&src).unwrap_or_else(|e| {
                    panic!(
                        "{kind}: the gate could not run it (source {}): {e}",
                        if source.is_empty() {
                            "defaults"
                        } else {
                            source
                        }
                    )
                });
                let doc: Value = serde_json::from_str(&out.json)
                    .unwrap_or_else(|e| panic!("{kind}: result JSON did not parse: {e}"));
                let audit = audit_document(&doc);
                KindRun {
                    kind,
                    source,
                    doc,
                    audit,
                }
            })
            .collect()
    })
}

fn is_exempt(kind: &str) -> bool {
    UNCOVERED_KINDS.iter().any(|(k, _)| *k == kind)
}

#[test]
fn every_registered_kind_has_a_runner() {
    let registered: Vec<String> = kshana::registry::ids::all()
        .iter()
        .map(|i| i.as_str().to_string())
        .collect();
    let runners: Vec<String> = RUNNERS.iter().map(|(k, _)| (*k).to_string()).collect();
    assert_eq!(
        registered, runners,
        "RUNNERS has drifted from registry::ids::all(). A newly registered scenario kind \
         must be given a source here (its own defaults, or one of scenarios/*.toml) so the \
         global units gate runs it; a removed kind must be taken out."
    );
}

#[test]
fn the_exemption_list_is_explicit_and_can_only_shrink() {
    assert!(
        UNCOVERED_KINDS.len() <= UNCOVERED_KIND_CEILING,
        "UNCOVERED_KINDS has grown to {} entries, above the pinned ceiling of {}. The \
         ceiling is a one-way ratchet: cover the new kind instead of raising it.",
        UNCOVERED_KINDS.len(),
        UNCOVERED_KIND_CEILING
    );

    let mut seen: Vec<&str> = Vec::new();
    for (kind, reason) in UNCOVERED_KINDS {
        assert!(
            !kind.contains('*') && !kind.is_empty(),
            "the exemption list names kinds explicitly; {kind:?} is not a kind"
        );
        assert!(
            !reason.trim().is_empty(),
            "{kind} is exempt with no stated reason"
        );
        assert!(
            RUNNERS.iter().any(|(k, _)| k == kind),
            "{kind} is exempt but is not a registered kind"
        );
        assert!(
            !seen.contains(kind),
            "{kind} appears twice in the exemption list"
        );
        seen.push(kind);
    }
}

#[test]
fn every_emitted_numeric_field_carries_a_unit_and_a_provenance_class() {
    let runs = corpus();

    // A malformed units entry is a failure for EVERY kind, exempt or not: a partial
    // block still has to be a correct one.
    let mut malformed: Vec<String> = Vec::new();
    for r in runs {
        for m in &r.audit.malformed {
            malformed.push(format!("{}: `{}` — {}", r.kind, m.key, m.reason));
        }
    }
    assert!(
        malformed.is_empty(),
        "units entries that are present but unusable:\n  {}",
        malformed.join("\n  ")
    );

    // The gate proper, over every kind not on the exemption list.
    let mut failures: Vec<String> = Vec::new();
    for r in runs {
        if is_exempt(r.kind) {
            continue;
        }
        if !r.audit.missing.is_empty() {
            failures.push(format!(
                "{} — {} of {} numeric fields have no units entry:\n      {}",
                r.kind,
                r.audit.missing.len(),
                r.audit.field_count(),
                r.audit.missing.join("\n      ")
            ));
        }
    }
    assert!(
        failures.is_empty(),
        "emitted numeric fields with no unit and provenance class:\n  {}\n\n\
         Add the entries to that pack's own `units` block (see src/field_schema.rs for the \
         path grammar and the provenance vocabulary). Do not add the kind to \
         UNCOVERED_KINDS: that list only shrinks.",
        failures.join("\n  ")
    );

    // …and an exempt kind that is in fact finished must be taken off the list, so the
    // list can never be padded with kinds that cost nothing.
    let finished: Vec<&str> = runs
        .iter()
        .filter(|r| is_exempt(r.kind) && r.audit.is_complete())
        .map(|r| r.kind)
        .collect();
    assert!(
        finished.is_empty(),
        "these kinds are on UNCOVERED_KINDS but every field they emit is now described: \
         {finished:?}. Remove them from the list and lower UNCOVERED_KIND_CEILING to {}.",
        UNCOVERED_KINDS.len() - finished.len()
    );

    let covered = runs.iter().filter(|r| r.audit.is_complete()).count();
    println!(
        "field-units coverage: {covered} of {} kinds fully described; {} kinds on the \
         exemption list (ceiling {UNCOVERED_KIND_CEILING}); {} of {} emitted numeric \
         fields described.",
        runs.len(),
        UNCOVERED_KINDS.len(),
        runs.iter().map(|r| r.audit.covered.len()).sum::<usize>(),
        runs.iter().map(|r| r.audit.field_count()).sum::<usize>(),
    );
}

#[test]
fn the_definition_backlog_only_shrinks() {
    let without: usize = corpus()
        .iter()
        .flat_map(|r| r.audit.covered.iter())
        .filter(|f| f.definition.is_none())
        .count();
    assert!(
        without <= DEFINITIONLESS_FIELD_CEILING,
        "{without} described fields carry no definition, above the pinned ceiling of \
         {DEFINITIONLESS_FIELD_CEILING}. Every new units entry must state what the \
         quantity is; the ceiling is a one-way ratchet."
    );
    if without < DEFINITIONLESS_FIELD_CEILING {
        println!(
            "definition backlog improved ({without} < {DEFINITIONLESS_FIELD_CEILING}); \
             lower DEFINITIONLESS_FIELD_CEILING to {without} to lock the gain in."
        );
    }
}

/// The machine-readable schema, built from the corpus: for every kind, every emitted
/// numeric field with its unit, provenance class, evidence tier and definition — and, by
/// name, every field that has none yet.
fn build_schema() -> Value {
    let runs = corpus();

    let mut classes = Map::new();
    for c in ProvenanceClass::ALL {
        classes.insert(
            c.as_str().to_string(),
            json!({ "evidence_tier": c.evidence_tier().as_str() }),
        );
    }

    let mut tiers = Map::new();
    for t in [
        EvidenceTier::Validated,
        EvidenceTier::Modelled,
        EvidenceTier::Illustrative,
        EvidenceTier::InheritsScenarioLabel,
        EvidenceTier::DependsOnInput,
    ] {
        tiers.insert(
            t.as_str().to_string(),
            Value::from(match t {
                EvidenceTier::Validated => {
                    "checkable against an oracle outside the run: a published figure, a \
                     stated device spec, algebra, a defined constant, or a real observed \
                     series"
                }
                EvidenceTier::Modelled => "a documented model or allocation, not a measurement",
                EvidenceTier::Illustrative => {
                    "an example value chosen to make the scenario runnable"
                }
                EvidenceTier::InheritsScenarioLabel => {
                    "derived: the tier is the one the report's own honesty label states"
                }
                EvidenceTier::DependsOnInput => {
                    "the provenance class is a disjunction, so the tier is one too"
                }
            }),
        );
    }

    let mut kinds = Map::new();
    for r in runs {
        let mut fields = Map::new();
        for f in &r.audit.covered {
            let mut entry = json!({
                "unit": f.unit,
                "provenance": f.provenance.as_str(),
                "evidence_tier": f.provenance.evidence_tier().as_str(),
                "definition": f.definition,
            });
            // Only worth recording when the block spells the path some other way — a
            // legacy unsuffixed array segment, or a wildcard.
            if f.matched_by != f.path {
                entry["declared_as"] = Value::from(f.matched_by.clone());
            }
            fields.insert(f.path.clone(), entry);
        }
        kinds.insert(
            r.kind.to_string(),
            json!({
                "source": if r.source.is_empty() { "defaults" } else { r.source },
                "label": r.doc.get("label").and_then(|l| l.as_str()),
                "complete": r.audit.is_complete(),
                "fields_total": r.audit.field_count(),
                "fields_described": r.audit.covered.len(),
                "fields": fields,
                "fields_without_units": r.audit.missing,
            }),
        );
    }

    let uncovered: Vec<Value> = UNCOVERED_KINDS
        .iter()
        .map(|(kind, reason)| {
            let missing = runs
                .iter()
                .find(|r| r.kind == *kind)
                .map(|r| r.audit.missing.len())
                .unwrap_or(0);
            json!({ "kind": kind, "reason": reason, "fields_without_units": missing })
        })
        .collect();

    json!({
        "schema": "kshana-field-units",
        "schema_version": "1",
        "generated_by": "cargo test --test field_units_global zzz_emit_field_units_schema -- --ignored",
        "statement": "Unit, provenance class, evidence tier and definition for every \
                      numeric field every built-in scenario kind emits at the source named \
                      per kind. Fields listed under `fields_without_units` are NOT \
                      described yet — they are named rather than omitted.",
        "coverage": {
            "kinds_total": runs.len(),
            "kinds_complete": runs.iter().filter(|r| r.audit.is_complete()).count(),
            "kinds_uncovered": UNCOVERED_KINDS.len(),
            "uncovered_kind_ceiling": UNCOVERED_KIND_CEILING,
            "fields_total": runs.iter().map(|r| r.audit.field_count()).sum::<usize>(),
            "fields_described": runs.iter().map(|r| r.audit.covered.len()).sum::<usize>(),
            "fields_without_units": runs.iter().map(|r| r.audit.missing.len()).sum::<usize>(),
            "described_fields_without_definition": runs
                .iter()
                .flat_map(|r| r.audit.covered.iter())
                .filter(|f| f.definition.is_none())
                .count(),
            "uncovered_kinds": uncovered,
        },
        "provenance_classes": classes,
        "evidence_tiers": tiers,
        "kinds": kinds,
    })
}

#[test]
fn the_committed_field_units_schema_is_current() {
    let want = build_schema();
    let have_text = std::fs::read_to_string(SCHEMA_PATH).unwrap_or_else(|e| {
        panic!("{SCHEMA_PATH} is missing ({e}); re-emit it with the zzz_ test in this file")
    });
    let have: Value = serde_json::from_str(&have_text)
        .unwrap_or_else(|e| panic!("{SCHEMA_PATH} is not valid JSON: {e}"));

    if have == want {
        return;
    }

    // Say what moved, rather than dumping two large documents.
    let mut diffs: Vec<String> = Vec::new();
    let (hk, wk) = (have.get("kinds"), want.get("kinds"));
    if let (Some(Value::Object(h)), Some(Value::Object(w))) = (hk, wk) {
        for (kind, wv) in w {
            match h.get(kind) {
                None => diffs.push(format!("{kind}: absent from the committed schema")),
                Some(hv) if hv != wv => diffs.push(format!("{kind}: changed")),
                _ => {}
            }
        }
        for kind in h.keys() {
            if !w.contains_key(kind) {
                diffs.push(format!(
                    "{kind}: in the committed schema but no longer emitted"
                ));
            }
        }
    }
    if have.get("coverage") != want.get("coverage") {
        diffs.push(format!(
            "coverage block changed: committed {}, computed {}",
            have.get("coverage").unwrap_or(&Value::Null),
            want.get("coverage").unwrap_or(&Value::Null)
        ));
    }
    panic!(
        "{SCHEMA_PATH} is stale — it is a drift detector over the emitted documents, not a \
         correctness oracle, so re-emit it whenever a report's shape or its units block \
         changes:\n  cargo test --test field_units_global zzz_emit_field_units_schema -- \
         --ignored\n\nwhat moved:\n  {}",
        diffs.join("\n  ")
    );
}

/// Write the committed schema. Run with `--ignored` after any change to a report's shape
/// or to a `units` block.
#[test]
#[ignore]
fn zzz_emit_field_units_schema() {
    let schema = build_schema();
    let text = format!(
        "{}\n",
        serde_json::to_string_pretty(&schema).expect("the schema is plain JSON")
    );
    std::fs::write(SCHEMA_PATH, &text).unwrap_or_else(|e| panic!("write {SCHEMA_PATH}: {e}"));
    println!(
        "wrote {SCHEMA_PATH} ({} bytes)\n{}",
        text.len(),
        serde_json::to_string_pretty(&schema["coverage"]).expect("plain JSON")
    );
}
