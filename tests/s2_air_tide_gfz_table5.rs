// SPDX-License-Identifier: AGPL-3.0-only
//! The S2 air-tide waves `tides::atmospheric_tide` uses, against the **published** fully-normalised,
//! sine-lead form of the same model: model A2 of R. Biancale and A. Bode, *Mean annual and seasonal
//! atmospheric tide models based on 3-hourly and 6-hourly ECMWF surface pressure data*, GFZ
//! Scientific Technical Report STR06/01 (2006), doi:10.2312/GFZ.b103-06011, Table 5 (model A2 is
//! Ray 2001). Amplitudes there are equivalent water height (cm, ρw = 1025 kg/m³), phases are sine
//! leads (degrees). The 21 rows of Ray's waves at degrees 2 to 4 are transcribed below as printed.
//! Bars pre-registered in `xval/s2-air-tide-fix/PREREGISTRATION.md` (5e31c37a): 0.0006 cm and 0.1°.
//!
//! PIN-SCOPE:    the 21 transcribed Table 5 model A2 rows (n, m, prograde/retrograde, amplitude,
//!               phase) and the pre-registered 0.0006 cm / 0.1° agreement with tides::s2_air_waves.
//! PIN-EXCLUDES: every kshana report and scenario output; Table 5's degree-1 and degree 5-10 rows
//!               (not in the n <= 4 coefficient file kshana carries); models A1 and A3.

use kshana::tides::s2_air_waves;

/// (n, m, prograde, C [cm], E [deg]) — Table 5, model A2, as printed.
const TABLE5_A2: [(usize, usize, bool, f64, f64); 21] = [
    // retrograde
    (2, 1, false, 0.016, 40.6),
    (3, 1, false, 0.006, 204.7),
    (4, 1, false, 0.003, 210.6),
    (2, 2, false, 0.010, 157.2),
    (3, 2, false, 0.010, 153.7),
    (4, 2, false, 0.010, 322.4),
    (3, 3, false, 0.007, 161.8),
    (4, 3, false, 0.008, 111.1),
    (4, 4, false, 0.003, 222.2),
    // prograde
    (2, 0, true, 0.023, 125.9),
    (3, 0, true, 0.014, 108.2),
    (4, 0, true, 0.006, 358.3),
    (2, 1, true, 0.003, 249.6),
    (3, 1, true, 0.002, 219.1),
    (4, 1, true, 0.003, 122.5),
    (2, 2, true, 0.563, 157.2),
    (3, 2, true, 0.023, 67.1),
    (4, 2, true, 0.073, 331.0),
    (3, 3, true, 0.027, 71.8),
    (4, 3, true, 0.007, 63.5),
    (4, 4, true, 0.007, 358.8),
];

const AMP_BAR_CM: f64 = 0.0006;
const PHASE_BAR_DEG: f64 = 0.1;

#[test]
fn s2_air_waves_reproduce_gfz_str0601_table5_model_a2() {
    let waves = s2_air_waves();
    assert_eq!(waves.len(), 21, "Ray's n <= 4 file carries 21 waves");
    // µbar of pressure → cm of equivalent water height: Δp / (ρw g).
    let to_cm = 0.1 / (1025.0 * 9.806_65) * 100.0;
    let (mut worst_a, mut worst_p) = (0.0_f64, 0.0_f64);
    for &(n, m, pro, c, e) in &TABLE5_A2 {
        let w = waves
            .iter()
            .find(|w| w.n == n && w.m == m && w.prograde == pro)
            .unwrap_or_else(|| panic!("no wave ({n},{m},{pro})"));
        let da = (w.amplitude_ubar * to_cm - c).abs();
        let dp = (w.epsilon_deg - e).rem_euclid(360.0);
        let dp = dp.min(360.0 - dp);
        println!(
            "({n},{m},{}) {:.4} cm {:6.2} deg vs {c} cm {e} deg",
            if pro { '+' } else { '-' },
            w.amplitude_ubar * to_cm,
            w.epsilon_deg
        );
        assert!(da <= AMP_BAR_CM, "({n},{m},{pro}) amplitude off by {da} cm");
        assert!(dp <= PHASE_BAR_DEG, "({n},{m},{pro}) phase off by {dp} deg");
        worst_a = worst_a.max(da);
        worst_p = worst_p.max(dp);
    }
    println!("worst: {worst_a:.5} cm, {worst_p:.3} deg over 21 waves");
}
