// SPDX-License-Identifier: AGPL-3.0-only
//! Allen-Eggers ballistic entry against a reconstructed flight entry.
//!
//! ORACLE (Measured, with a caveat): the Stardust sample-return capsule entry of 2006-01-15,
//! Desai and Qualls, "Stardust Entry Reconstruction", AIAA 2008-1198 (public copy NASA NTRS
//! 20080008567). The paper prints the entry-interface state (inertial speed 12.9 km/s, inertial
//! flight-path angle -8.2 deg) and the maximum deceleration of its best estimated trajectory,
//! 32.89 Earth g. Caveat: Stardust carried no accelerometer; that trajectory is the project's
//! entry simulation with a 0.83 % drag multiplier fitted to the navigation state at entry and
//! to radar tracking at drogue deployment. Only an inertial entry state is printed, so it is the
//! input (disclosed). The speed at peak g is shown only in a plot and is not used.
//!
//! KSHANA SIDE: `reentry::peak_deceleration` with Kshana's own default scale height
//! `SCALE_HEIGHT_EARTH_M` = 7200 m (not fitted), divided by `G0`.
//!
//! TOLERANCE (fixed before any reconstruction value was read, 2026-10-01): peak deceleration (and
//! speed at peak g where printed) within 15 % relative of every reconstructed entry obtained.
//!
//! VERDICT (2026-10-01): DISAGREES. Kshana gives 61.8 g against 32.89 g, +88 %. Using an
//! atmosphere-relative speed instead (about 0.35 km/s lower at the site) would not close it. The
//! constant-flight-path-angle, no-gravity Allen-Eggers solution overpredicts the peak for a shallow,
//! faster-than-escape entry, whose path flattens before the peak. The row stays MODELLED. The strict
//! comparison is an ignored test; the gated test pins the finding.
//!
//! Fixture and provenance: `tests/fixtures/reentry_reconstruction_oracle/`.

use kshana::reentry::{peak_deceleration, G0, SCALE_HEIGHT_EARTH_M};

const REF: &str = include_str!("fixtures/reentry_reconstruction_oracle/reconstructed_entries.txt");

const REL_TOL: f64 = 0.15;

/// (id, Kshana peak g, reconstructed peak g).
fn peaks() -> Vec<(String, f64, f64)> {
    REF.lines()
        .filter_map(|l| l.strip_prefix("ENTRY "))
        .map(|rest| {
            let f: Vec<&str> = rest.split('|').map(str::trim).collect();
            let v: f64 = f[1].parse().unwrap();
            let gamma_deg: f64 = f[2].parse().unwrap();
            let recon_g: f64 = f[4].parse().unwrap();
            let g = peak_deceleration(v, gamma_deg.to_radians(), SCALE_HEIGHT_EARTH_M) / G0;
            (f[0].to_string(), g, recon_g)
        })
        .collect()
}

#[test]
#[ignore = "DISAGREES: Allen-Eggers 61.8 g vs the Stardust reconstruction 32.89 g (+88 %); row stays MODELLED"]
fn peak_deceleration_matches_reconstructed_entries() {
    let failures: Vec<String> = peaks()
        .into_iter()
        .filter(|(_, g, r)| (g - r).abs() / r > REL_TOL)
        .map(|(id, g, r)| format!("{id}: kshana {g:.2} g vs reconstruction {r:.2} g"))
        .collect();
    assert!(
        failures.is_empty(),
        "disagreements:\n{}",
        failures.join("\n")
    );
}

/// The finding, pinned in the gate: the Stardust peak misses the 15 % tolerance, overpredicted by
/// between 50 % and 120 % (an envelope chosen after the comparison; never a promotion basis).
#[test]
fn reentry_overprediction_is_recorded_as_a_finding() {
    let p = peaks();
    assert_eq!(p.len(), 1);
    for (id, g, r) in &p {
        let rel = (g - r) / r;
        eprintln!(
            "{id}: kshana {g:.2} g vs reconstruction {r:.2} g ({:+.1} %)",
            100.0 * rel
        );
        assert!(
            rel > REL_TOL,
            "{id}: now within tolerance; the M019 record says DISAGREES"
        );
        assert!(
            rel > 0.5 && rel < 1.2,
            "{id}: {rel} outside the characterisation envelope"
        );
    }
}
