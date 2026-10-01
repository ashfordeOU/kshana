// SPDX-License-Identifier: AGPL-3.0-only
//! Published-value (P1) comparison for the relativistic clock-rate to frame coupling,
//! `lunar_gauge::rate_frame_jacobian`, entry `d_alpha_d_scale = +U_moon / c^2`.
//!
//! ## Pre-registration (fixed 2026-09-30 in the validation plan, before this comparison)
//!
//! * Oracle (P1, a published worked value): Ashby and Patla 2024, The Astronomical Journal
//!   167:149, arXiv:2402.11150, Eq. (10) and Table I: L_m = -Phi0m / c^2 = 3.13881(15)e-11.
//!   The five printed numbers this test reads are in
//!   `tests/fixtures/lunar_rate_frame_coupling_oracle/reference.txt` (provenance in `NOTICE.md`).
//! * Kshana value: `rate_frame_jacobian(t).d_alpha_d_scale`, which is epoch-independent.
//! * Tolerance: relative difference at most **1e-4**.
//! * P1 precondition: Kshana must compute the value from the publication's inputs.
//!   `rate_frame_jacobian` takes no GM or radius argument; it uses Kshana's own
//!   `forces::MU_MOON` and `lunar_time::RE_MOON_M`, so the precondition is not met.
//!
//! ## Result (recorded, not tuned)
//!
//! Kshana gives 3.139807e-11; the paper prints 3.13881(15)e-11. The relative difference is
//! 3.18e-4, three times the tolerance and about seven times the paper's own stated uncertainty.
//! The row therefore stays MODELLED. Cause: Kshana evaluates a point-mass potential GM/R at the
//! 1737.4 km mean radius; the paper evaluates a degree-350 lunar potential on the equator
//! (a_m = 1738.14 km) and adds the rotation term. The two are not the same closed form, so this is
//! also not a P1 situation: no single published number computed from Kshana's formula exists.
//!
//! The test pins that finding: it fails if the gap closes (then the row should be re-examined
//! for promotion) or if it moves (then the constants changed and the record is stale).

use kshana::lunar_gauge::rate_frame_jacobian;

const REF: &str = include_str!("fixtures/lunar_rate_frame_coupling_oracle/reference.txt");

/// The tolerance stated before the comparison (relative).
const TOL_REL: f64 = 1.0e-4;

fn value(key: &str) -> f64 {
    for line in REF.lines() {
        if line.starts_with('#') || line.trim().is_empty() {
            continue;
        }
        let f: Vec<&str> = line.split('|').map(str::trim).collect();
        if f[0] == key {
            return f[1]
                .parse()
                .unwrap_or_else(|e| panic!("{key}: bad value {}: {e}", f[1]));
        }
    }
    panic!("{key} not in reference.txt");
}

#[test]
fn rate_frame_jacobian_disagrees_with_the_published_self_potential_beyond_1e_4() {
    let l_m = value("L_m");
    let sigma = value("L_m_uncertainty");
    assert_eq!(l_m, 3.13881e-11, "the fixture is the printed value");

    // Epoch-independent: check two epochs give the same entry before comparing.
    let k0 = rate_frame_jacobian(0.0).d_alpha_d_scale;
    let k1 = rate_frame_jacobian(0.25).d_alpha_d_scale;
    assert_eq!(k0, k1, "d_alpha_d_scale must not depend on the epoch");

    let rel = (k0 - l_m).abs() / l_m;
    eprintln!(
        "M093: kshana d_alpha/d_scale = {k0:.7e}, Ashby-Patla L_m = {l_m:.5e} +/- {sigma:.1e}; \
         relative gap {rel:.3e} (tolerance {TOL_REL:.0e}); gap / paper sigma = {:.1}",
        (k0 - l_m).abs() / sigma
    );

    // The pre-registered comparison: it does NOT pass.
    assert!(
        rel > TOL_REL,
        "the gap closed ({rel:.3e} <= {TOL_REL:.0e}): re-examine the row for promotion"
    );
    // The recorded finding: 3.18e-4 relative, Kshana high.
    assert!(k0 > l_m, "Kshana's value sits above the published one");
    assert!(
        (3.1e-4..3.3e-4).contains(&rel),
        "the recorded gap was 3.18e-4; it is now {rel:.3e}, so the record is stale"
    );
}
