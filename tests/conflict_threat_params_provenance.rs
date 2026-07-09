// SPDX-License-Identifier: AGPL-3.0-only
//! P7-G4 — the conflict-resilience threat-parameter catalog must have a documented,
//! cited fixture a reviewer can trace, and that fixture must NOT be allowed to drift from
//! the in-code catalog.
//!
//! `src/conflict_threat_params.rs` is the single source of truth for every per-layer
//! prior the P7 scenario consumes. This test pins that catalog to two committed fixtures:
//!
//! * `tests/fixtures/conflict_resilience/threat_parameters.json` — a machine-readable
//!   snapshot of every layer's availability, sigma, `[min, nominal, max]` vulnerability
//!   triple, per-vector susceptibility profile and citation. The test rebuilds this from
//!   the live catalog and asserts byte-equality, so any change to a prior must be
//!   accompanied by an intentional fixture re-emit (`--ignored` emitter below).
//! * `tests/fixtures/conflict_resilience/threat_parameters.md` — the human-readable
//!   provenance catalog. The test asserts it names every layer and every cited source, so
//!   a layer or citation can never be dropped from the documentation silently.

use kshana::conflict_threat_params::{threat_catalog, THREAT_VECTORS};

const JSON_FIXTURE: &str = "tests/fixtures/conflict_resilience/threat_parameters.json";
const MD_FIXTURE: &str = "tests/fixtures/conflict_resilience/threat_parameters.md";

/// Canonical JSON snapshot of the in-code catalog (the fixture format).
fn catalog_json() -> String {
    let layers: Vec<serde_json::Value> = threat_catalog()
        .iter()
        .map(|p| {
            let prof = p.vector_profile;
            serde_json::json!({
                "layer": p.layer,
                "availability": p.availability,
                "sigma_m": p.sigma_m,
                "vulnerability_min": p.vulnerability_min,
                "vulnerability_nominal": p.vulnerability_nominal,
                "vulnerability_max": p.vulnerability_max,
                "vector_weight": p.vector_weight,
                "vector_profile": {
                    "jamming": prof.jamming,
                    "spoofing": prof.spoofing,
                    "kinetic": prof.kinetic,
                    "cyber": prof.cyber,
                },
                // Whitespace-normalise the citation so the multi-line source string in the
                // catalog compares stably regardless of Rust line-continuation layout.
                "citation": p.citation.split_whitespace().collect::<Vec<_>>().join(" "),
            })
        })
        .collect();
    let doc = serde_json::json!({
        "_comment": "SNAPSHOT of src/conflict_threat_params.rs::threat_catalog(). Regenerate with: cargo test --test conflict_threat_params_provenance emit_threat_parameters_fixture -- --ignored",
        "threat_vectors": THREAT_VECTORS,
        "layers": layers,
    });
    serde_json::to_string_pretty(&doc).unwrap() + "\n"
}

#[test]
fn json_fixture_matches_the_in_code_catalog() {
    let expected = catalog_json();
    let actual = std::fs::read_to_string(JSON_FIXTURE)
        .expect("threat_parameters.json fixture must exist (emit it with --ignored)");
    assert_eq!(
        actual, expected,
        "the committed threat_parameters.json fixture has drifted from the in-code catalog; \
         re-emit with: cargo test --test conflict_threat_params_provenance \
         emit_threat_parameters_fixture -- --ignored"
    );
}

#[test]
fn markdown_provenance_names_every_layer_and_source() {
    let md = std::fs::read_to_string(MD_FIXTURE)
        .expect("threat_parameters.md provenance doc must exist");
    // Every catalog layer must be documented by name.
    for p in threat_catalog() {
        assert!(
            md.contains(p.layer),
            "provenance doc is missing layer `{}`",
            p.layer
        );
    }
    // Every named threat vector must be documented.
    for v in THREAT_VECTORS {
        assert!(md.contains(v), "provenance doc is missing vector `{v}`");
    }
    // Every cited primary source must be named (drift-guard the citations).
    for src in [
        "JammerTest 2024",
        "TEXBAT",
        "EASA",
        "RTCA DO-229",
        "LunaNet",
        "IOAG",
        "zenodo",
        "DHS/CISA",
        "DARPA",
    ] {
        assert!(md.contains(src), "provenance doc is missing source `{src}`");
    }
    // The honesty scope must be stated: Modelled, not Validated.
    assert!(md.contains("Modelled") && md.contains("Validated"));
    assert!(md.to_lowercase().contains("not a certif"));
}

#[test]
#[ignore = "regenerates tests/fixtures/conflict_resilience/threat_parameters.json; run with --ignored"]
fn emit_threat_parameters_fixture() {
    std::fs::write(JSON_FIXTURE, catalog_json()).expect("write JSON fixture");
    eprintln!("wrote {JSON_FIXTURE}");
}
