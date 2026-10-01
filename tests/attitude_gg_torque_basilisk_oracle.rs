// SPDX-License-Identifier: AGPL-3.0-only
//! Gravity-gradient disturbance torque against Basilisk 2.9.1 (ISC).
//!
//! ORACLE (Library): Basilisk's `GravityGradientEffector` on a `spacecraft.Spacecraft` hub, with a
//! point-mass Earth at mu = 3.986004418e14 m^3/s^2, evaluated at a set hub state (no propagation).
//! Basilisk computes the full-tensor torque in its own C++ code; Kshana computes only the scalar
//! peak `(3/2)(mu/R^3)|I_max - I_min|`.
//!
//! CLAIM CHECKED: the gravity-gradient torque peak of the attitude budget. The RSS pointing budget
//! (a quadrature sum of caller-supplied 1-sigma numbers) has no external truth and is outside this
//! comparison. Kshana emits no torque vector, so the comparison is on magnitudes.
//!
//! TOLERANCES (fixed before the first comparison, 2026-10-01):
//! 1. PEAK: Basilisk |torque| at the 45 deg attitude (body-frame direction to the spacecraft
//!    position halfway between the minimum- and maximum-inertia principal axes) equals
//!    `gravity_gradient_torque_max(h, dI)` within 1e-12 relative.
//! 2. BOUND: the largest Basilisk |torque| over 2000 random attitudes is at most the peak times
//!    (1 + 1e-12).
//!
//! Cases: altitudes 300 to 1200 km; three diagonal and five general non-diagonal inertia tensors.
//! Fixture, generator and provenance: `tests/fixtures/attitude_gg_torque_basilisk_oracle/`.

use kshana::attitude_budget::gravity_gradient_torque_max;

const REF: &str = include_str!(
    "fixtures/attitude_gg_torque_basilisk_oracle/attitude_gg_torque_basilisk_oracle.txt"
);

const PEAK_REL_TOL: f64 = 1e-12;
const BOUND_REL_TOL: f64 = 1e-12;

#[test]
fn gravity_gradient_torque_matches_basilisk() {
    let mut cases = 0usize;
    let mut worst_peak_rel = 0.0_f64;
    let mut failures = Vec::new();
    for line in REF.lines().filter(|l| l.starts_with("CASE ")) {
        let f: Vec<&str> = line["CASE ".len()..].split('|').map(str::trim).collect();
        assert_eq!(f.len(), 5, "malformed line: {line}");
        let name = f[0];
        let alt_m: f64 = f[1].parse::<f64>().unwrap() * 1e3;
        let d_inertia: f64 = f[2].parse().unwrap();
        let peak_bsk: f64 = f[3].parse().unwrap();
        let bound_bsk: f64 = f[4].parse().unwrap();

        let peak = gravity_gradient_torque_max(alt_m, d_inertia);
        let rel = (peak - peak_bsk).abs() / peak_bsk;
        worst_peak_rel = worst_peak_rel.max(rel);
        if rel > PEAK_REL_TOL {
            failures.push(format!(
                "{name} h={alt_m} m: peak kshana {peak:e} vs basilisk {peak_bsk:e} (rel {rel:e})"
            ));
        }
        if bound_bsk > peak * (1.0 + BOUND_REL_TOL) {
            failures.push(format!(
                "{name} h={alt_m} m: random-attitude torque {bound_bsk:e} exceeds the peak {peak:e}"
            ));
        }
        cases += 1;
    }
    assert_eq!(cases, 40, "expected 5 altitudes x 8 tensors");
    eprintln!("gravity-gradient vs Basilisk: {cases} cases, worst peak rel {worst_peak_rel:e}");
    assert!(
        failures.is_empty(),
        "disagreements:\n{}",
        failures.join("\n")
    );
}
