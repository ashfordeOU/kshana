// SPDX-License-Identifier: AGPL-3.0-only
//! The `fusion` and `hybrid` kinds without a `[coupled]` table are unchanged by FUT-16.
//!
//! FUT-16 adds an optional `[coupled]` table to the shared hybrid scenario: the `fusion` pack
//! then runs the coupled pseudorange filter. Without it both kinds must take exactly their old
//! code paths. The hashes below were taken on `e74504b` (branch `feat/fusion-ins-0.36`) BEFORE
//! the table existed.
//!
//! PIN-SCOPE:    the CLI-level JSON (engine_version blanked), SVG and summary of the bundled
//!               scenarios fusion-pnt and hybrid-pnt as `api::run_toml` produces them.
//! PIN-EXCLUDES: the engine_version string (it moves every release); any scenario with a
//!               `[coupled]` table.

use sha2::{Digest, Sha256};

fn sha(s: &str) -> String {
    hex::encode(Sha256::digest(s.as_bytes()))
}

fn hashes(name: &str) -> (String, String, String) {
    let path = format!("{}/scenarios/{name}.toml", env!("CARGO_MANIFEST_DIR"));
    let src = std::fs::read_to_string(path).unwrap();
    let out = kshana::api::run_toml(&src).unwrap();
    let v = env!("CARGO_PKG_VERSION");
    let json = out.json.replace(
        &format!("\"engine_version\": \"{v}\""),
        "\"engine_version\": \"X\"",
    );
    (sha(&json), sha(&out.svg), sha(&out.summary))
}

const PINS: &[(&str, &str, &str, &str)] = &[
    (
        "fusion-pnt",
        "5868cec8cc51bba22303b906478d5e22a9821e265b7309ecebf5c2feb40f7cb9",
        "3cfdcf6fee46584898db6b5bb5acce9cbc776a1ced8682771b75480064c5e37a",
        "3fe331cc646598792a8d1a65afddc8382a064f1ff2144c8410a84a9429f842e2",
    ),
    (
        "hybrid-pnt",
        "9e8a849d117c80c69f70c45d725bab25153b82e6176034c599c40e2ee1666db8",
        "699add2a833b545baabffbc9f13094f07063c365422b078ed0bcb69aa66e9901",
        "e718dafc2940a571df579c16a1d62e446c6e3f711d9c4030b22da7a9b0c493dc",
    ),
];

#[test]
fn fusion_and_hybrid_without_coupled_are_bit_identical_to_the_base() {
    let mut bad = Vec::new();
    for (name, j, s, u) in PINS {
        let h = hashes(name);
        println!("{name}: json {} svg {} summary {}", h.0, h.1, h.2);
        if (h.0.as_str(), h.1.as_str(), h.2.as_str()) != (*j, *s, *u) {
            bad.push(name.to_string());
        }
    }
    assert!(bad.is_empty(), "moved: {bad:?}");
}
