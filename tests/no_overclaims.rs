// SPDX-License-Identifier: Apache-2.0
//! Overclaim regression guard.
//!
//! An earlier audit catalogued fourteen overclaims (`OC-0`…`OC-13`) — see
//! `docs/CLAIMS-VS-REALITY.md`. Each was closed either by de-claiming (correcting the
//! wording to match the code) or by superseding (building the real capability). This test
//! makes the de-claimed wording *enforceable*: it scans the live public-facing surfaces for
//! the exact retired bare overclaim phrases and fails if any reappears uncaveated, so a
//! GREEN row in the ledger cannot silently regress.
//!
//! The ledger doc and the CHANGELOG are deliberately **not** scanned — they quote the old
//! phrases on purpose to document the history.

/// The live public-facing surfaces a reader or procurement reviewer actually sees.
const SURFACES: &[(&str, &str)] = &[
    ("README.md", include_str!("../README.md")),
    ("docs/CAPABILITY.md", include_str!("../docs/CAPABILITY.md")),
    ("docs/GLOSSARY.md", include_str!("../docs/GLOSSARY.md")),
    (
        "web/capabilities.json",
        include_str!("../web/capabilities.json"),
    ),
    ("web/index.html", include_str!("../web/index.html")),
];

/// Retired bare overclaim phrases that must never reappear in a live surface. Each maps to
/// an OC row in `docs/CLAIMS-VS-REALITY.md`; the honest replacement wording is in that doc.
const RETIRED_OVERCLAIMS: &[(&str, &str)] = &[
    ("OC-0", "joint Kalman fusion estimator"),
    ("OC-1", "clock-aided spoof-detection RAIM"),
    ("OC-2", "jamming demonstrator"),
    ("OC-3", "Full IMU Allan-variance noise model"),
    ("OC-4", "Hybrid PNT integration"),
    ("OC-7", "hybrid quantum-classical PNT simulator"),
    ("OC-13", "research-grade v0.6.0"),
];

#[test]
fn no_retired_overclaim_phrase_reappears_in_a_public_surface() {
    let mut violations = Vec::new();
    for (oc, phrase) in RETIRED_OVERCLAIMS {
        let needle = phrase.to_lowercase();
        for (name, body) in SURFACES {
            if body.to_lowercase().contains(&needle) {
                violations.push(format!(
                    "{name}: retired overclaim {oc} phrase \"{phrase}\""
                ));
            }
        }
    }
    assert!(
        violations.is_empty(),
        "audit-flaggable overclaim(s) reappeared in a public surface:\n  {}\n\
         see docs/CLAIMS-VS-REALITY.md for the honest replacement wording",
        violations.join("\n  ")
    );
}

#[test]
fn the_four_superseded_capabilities_are_present_in_the_tree() {
    // OC-0/2/7/8 were closed by *landing the real capability*, not by softening wording.
    // Guard that those modules still exist so the ledger's "superseded" rows stay truthful.
    let modules: &[(&str, &str)] = &[
        (
            "OC-0 coupled fusion",
            include_str!("../src/fusion/coupled.rs"),
        ),
        ("OC-2 jamming", include_str!("../src/jamming.rs")),
        (
            "OC-7 CAI quantum physics",
            include_str!("../src/inertial/quantum_imu.rs"),
        ),
        ("OC-8 ARAIM HPL/VPL", include_str!("../src/raim.rs")),
    ];
    for (label, src) in modules {
        assert!(
            src.contains("#[test]"),
            "{label}: superseding module has no tests — ledger row would be unsupported"
        );
    }
}
