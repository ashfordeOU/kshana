// SPDX-License-Identifier: AGPL-3.0-only
//! External-receiver oracle for the tracking-loop model (`kshana::tracking_loop`, verification row
//! "Tracking-loop loss of lock and spoof pull-in under interference").
//!
//! Pre-registration (validation 0.30, round 2, batch "tools"; written 2026-10-02 before any
//! intermediate-frequency (IF) recording below was generated and before GNSS-SDR was run on one).
//!
//! Oracle (Library): GNSS-SDR 0.0.19 (Centre Tecnològic de Telecomunicacions de Catalunya,
//! GPL-3.0-or-later), the open software receiver, run as a separate program; its
//! `GPS_L1_CA_DLL_PLL_Tracking` block (Costas carrier loop with a two-quadrant arctangent
//! discriminator, non-coherent normalised early-minus-late code loop, carrier-aided code loop)
//! tracks recordings that are generated independently of the engine, in numpy, by
//! `tests/fixtures/tracking_loop_gnss_sdr_oracle/make_fixture.py`. Only the numbers derived from
//! its tracking dumps are committed; no GNSS-SDR code is in the crate.
//!
//! Recordings: complex baseband at 4 Msample/s, interleaved signed 8-bit I/Q, one GPS L1 C/A
//! signal (PRN 1; code generated from the IS-GPS-200 generator polynomials) with random 50 bit/s
//! data, Doppler 1500 Hz, code Doppler consistent with it, white complex Gaussian noise; the C/N₀
//! is set by the signal amplitude against the noise density (`C/N₀ = A²·f_s/σ²`). Each recording
//! starts with 4 s at 45 dB-Hz so the receiver acquires and converges, then steps to the test
//! C/N₀; statistics use only the part from 6 s on. The true carrier phase and code phase are
//! known analytically at every sample.
//!
//! Receiver configuration (the engine's scenario defaults): carrier loop noise bandwidth
//! `B_PLL = 10 Hz`, second order (`pll_filter_order = 2`); code loop `B_DLL = 1 Hz`, first order
//! (`dll_filter_order = 1`); predetection integration `T = 1 ms` (`extend_correlation_symbols =
//! 1`); early-to-late spacing `d = 0.5` chip (GNSS-SDR's `early_late_space_chips = 0.25` is the
//! early-to-prompt half spacing); frequency-locked loop off; the receiver's own lock detectors
//! disabled (`cn0_min`, `carrier_lock_th`, `max_lock_fail` set so they never fire), because the
//! physical loop behaviour, not a lock-detector choice, is the quantity. The pull-in (re-lock)
//! configuration is the same with `B_PLL = 20 Hz` (the engine's pull-in ratio 2).
//!
//! Convention calibration (part of this pre-registration): one recording at 60 dB-Hz fixes the
//! sign of GNSS-SDR's accumulated carrier phase, which sample each dump record refers to, and the
//! constant phase and code offsets; nothing is scaled. Those conventions are then frozen for every
//! other recording. The calibration run must show carrier error below 1 degree and code error
//! below 0.005 chip root mean square, or the comparison is reported as not run.
//!
//! Measured quantities (oracle side, per recording, over the window from 6 s):
//! - carrier phase error = (receiver phase − true phase), wrapped to ±90° (the Costas
//!   ambiguity) about its mean; `σ_PLL` is its standard deviation in degrees;
//! - code error = (receiver code phase − true code phase) in chips; `σ_DLL` its standard
//!   deviation;
//! - carrier threshold: on a sweep of C/N₀ from 22 to 34 dB-Hz in 1 dB steps (60 s each), the
//!   C/N₀ at which the measured `3·σ_PLL` crosses 45° (linear interpolation in dB-Hz between the
//!   bracketing points), for `B_PLL = 10 Hz` (drop) and `20 Hz` (re-lock);
//! - dynamic stress: a recording at 45 dB-Hz with a Doppler rate of 10 Hz/s: the mean carrier
//!   phase error (degrees, magnitude);
//! - code ramp lag: a recording at 45 dB-Hz whose code drifts against the carrier-implied code
//!   rate by 0.1 chip/s (a code-carrier divergence, which carrier aiding does not remove): the
//!   mean code error (chips, magnitude);
//! - mean time between carrier slips: on the sweep recordings, a slip is a change of
//!   `round(ē/180°)` where `ē` is the 100 ms moving average of the UNwrapped carrier error; the
//!   mean time is the window length over the slip count, at every sweep point with at least 10
//!   slips.
//!
//! Amendment 1 (2026-10-02, written after the convention calibration and before any test
//! recording was generated; disclosed): the 60 dB-Hz calibration fixed the code reference (the
//! local code epoch starts at `PRN_start_sample_count + aux1`; 0.0004 chip root mean square) and
//! the carrier sign (the receiver phase is minus `acc_carrier_phase_rad`; 0.22° root mean
//! square), but with a constant Doppler it cannot tell which sample the accumulated phase refers
//! to. A second calibration recording at 60 dB-Hz with a 10 Hz/s Doppler rate was therefore run:
//! the accumulated-phase error drifts (−1.28°/s or −4.88°/s, depending on the reference sample),
//! while the prompt-correlator phase `atan(Q/I)` stays constant (trend 0.003°/s). So the
//! accumulated phase is used only where the Doppler is constant (jitter, thresholds, slips), and
//! the dynamic-stress mean is measured as the mean prompt-correlator phase, which is the mean
//! carrier error over each integration. That calibration showed a mean prompt phase of 10.12° at
//! 60 dB-Hz, so a dynamic-stress value was seen before this amendment; the graded recording is
//! the separate 45 dB-Hz one. Quantities, recordings and tolerances are otherwise unchanged.
//!
//! Engine quantities: `pll_thermal_jitter_rad`, `dll_thermal_jitter_chips` (with `T`, `d`, `B`
//! above), `LoopConfig::thresholds` (drop and re-lock, static user), `pll_dynamic_stress_deg`,
//! `dll_ramp_lag_chips`, `log10_mean_time_to_cycle_slip_s`.
//!
//! Tolerances (the planned bars of the 0.30 validation plan for this row, unchanged, plus bars
//! for the parts that plan did not name, all fixed now):
//! - (1) `σ_PLL` at 30, 35, 40 and 45 dB-Hz within 10 % of the engine;
//! - (2) `σ_DLL` at 30, 35, 40 and 45 dB-Hz within 10 % of the engine;
//! - (3) drop and re-lock carrier thresholds each within 1 dB-Hz of the engine;
//! - (4) the binding loop: at the measured drop threshold, the measured `3·σ_DLL` is below the
//!   code allowance `d/2 = 0.25` chip, so the carrier loop binds, as the engine names it;
//! - (5) dynamic stress within 10 % of `pll_dynamic_stress_deg(10 Hz/s, 10 Hz)`;
//! - (6) code ramp lag within 10 % of `dll_ramp_lag_chips(0.1 chip/s, 1 Hz)`;
//! - (7) mean time between slips: `|log₁₀ T_measured − log₁₀ T_engine| ≤ 0.5` at every
//!   qualifying sweep point (Viterbi's expression is exact for a first-order loop; a second-order
//!   loop slips somewhat more often, by up to about a factor of 3 at the loop signal-to-noise
//!   ratios involved; Gardner, Phaselock Techniques, 3rd ed., ch. 9), and at least two
//!   qualifying points.
//!
//! Not compared, by construction: the declared lock-detector time and dwells (a configuration
//! choice with no physical truth; the row says so), and the denial radius (the closed-form link
//! budget composed with the threshold validated here).
//!
//! Discrimination check, pre-registered: dropping the squaring-loss factor from
//! `pll_thermal_jitter_rad` must turn this test red.

use kshana::tracking_loop::{
    dll_ramp_lag_chips, dll_thermal_jitter_chips, log10_mean_time_to_cycle_slip_s,
    pll_dynamic_stress_deg, pll_thermal_jitter_rad, LoopConfig, COSTAS_THRESHOLD_DEG,
};
use std::path::PathBuf;

const T_S: f64 = 1e-3;
const D_CHIPS: f64 = 0.5;
const B_PLL: f64 = 10.0;
const B_DLL: f64 = 1.0;
const PULLIN_RATIO: f64 = 2.0;
const DOPPLER_RATE: f64 = 10.0;
const CODE_SLEW: f64 = 0.1;
const TOL_REL: f64 = 0.10;
const TOL_DB: f64 = 1.0;
const TOL_LOG10: f64 = 0.5;

fn rows() -> Vec<Vec<String>> {
    let p = PathBuf::from(env!("CARGO_MANIFEST_DIR"))
        .join("tests/fixtures/tracking_loop_gnss_sdr_oracle/gnss_sdr_results.csv");
    let s = std::fs::read_to_string(&p).unwrap_or_else(|e| panic!("{}: {e}", p.display()));
    s.lines()
        .filter(|l| !l.starts_with('#') && !l.trim().is_empty())
        .map(|l| l.split(',').map(|x| x.trim().to_string()).collect())
        .collect()
}

fn num(s: &str) -> f64 {
    s.parse().unwrap_or_else(|_| panic!("number {s:?}"))
}

fn cfg(bn: f64) -> LoopConfig {
    LoopConfig {
        pll_bandwidth_hz: bn,
        dll_bandwidth_hz: B_DLL,
        integration_s: T_S,
        spacing_chips: D_CHIPS,
        carrier_allowance_deg: COSTAS_THRESHOLD_DEG,
        code_allowance_chips: D_CHIPS / 2.0,
        pullin_bandwidth_ratio: PULLIN_RATIO,
    }
}

#[test]
#[ignore = "pre-registered; not yet run"]
fn tracking_loops_match_gnss_sdr_on_independent_if() {
    let r = rows();
    let mut fails = Vec::new();
    let mut seen = [0usize; 7];
    let rel = |m: f64, e: f64| (m / e - 1.0).abs();
    let thr = cfg(B_PLL).thresholds(0.0, 0.0);
    let mut drop_meas = None;
    for f in &r {
        match f[0].as_str() {
            "pll_jitter_deg" => {
                let (bn, cn0, m) = (num(&f[1]), num(&f[2]), num(&f[3]));
                let e = pll_thermal_jitter_rad(cn0, bn, T_S).to_degrees();
                eprintln!(
                    "PLL sigma at {cn0} dB-Hz: GNSS-SDR {m:.3} deg, Kshana {e:.3} deg, rel {:+.3}",
                    m / e - 1.0
                );
                seen[0] += 1;
                if rel(m, e) > TOL_REL {
                    fails.push(format!("PLL sigma at {cn0}: {m} vs {e}"));
                }
            }
            "dll_jitter_chips" => {
                let (bn, cn0, m) = (num(&f[1]), num(&f[2]), num(&f[3]));
                let e = dll_thermal_jitter_chips(cn0, bn, T_S, D_CHIPS);
                eprintln!("DLL sigma at {cn0} dB-Hz: GNSS-SDR {m:.5} chip, Kshana {e:.5} chip, rel {:+.3}", m / e - 1.0);
                seen[1] += 1;
                if rel(m, e) > TOL_REL {
                    fails.push(format!("DLL sigma at {cn0}: {m} vs {e}"));
                }
            }
            "carrier_threshold_dbhz" => {
                let (bn, m) = (num(&f[1]), num(&f[2]));
                let e = if (bn - B_PLL).abs() < 1e-9 {
                    drop_meas = Some(m);
                    thr.drop_cn0_dbhz.expect("drop threshold")
                } else {
                    thr.relock_cn0_dbhz.expect("re-lock threshold")
                };
                eprintln!(
                    "carrier threshold at B = {bn} Hz: GNSS-SDR {m:.2} dB-Hz, Kshana {e:.2} dB-Hz"
                );
                seen[2] += 1;
                if (m - e).abs() > TOL_DB {
                    fails.push(format!("threshold at {bn} Hz: {m} vs {e}"));
                }
            }
            "dll_3sigma_at_drop_chips" => {
                let m = num(&f[2]);
                eprintln!("3 sigma DLL at the measured drop threshold: {m:.4} chip (allowance 0.25); engine binding loop {}", thr.binding_loop);
                seen[3] += 1;
                if !(m < D_CHIPS / 2.0 && thr.binding_loop == "carrier") {
                    fails.push(format!(
                        "binding loop: 3 sigma DLL {m}, engine {}",
                        thr.binding_loop
                    ));
                }
            }
            "doppler_rate_mean_error_deg" => {
                let m = num(&f[3]);
                let e = pll_dynamic_stress_deg(DOPPLER_RATE, B_PLL);
                eprintln!("dynamic stress: GNSS-SDR {m:.3} deg, Kshana {e:.3} deg");
                seen[4] += 1;
                if rel(m, e) > TOL_REL {
                    fails.push(format!("dynamic stress {m} vs {e}"));
                }
            }
            "code_ramp_lag_chips" => {
                let m = num(&f[3]);
                let e = dll_ramp_lag_chips(CODE_SLEW, B_DLL);
                eprintln!("code ramp lag: GNSS-SDR {m:.5} chip, Kshana {e:.5} chip");
                seen[5] += 1;
                if rel(m, e) > TOL_REL {
                    fails.push(format!("ramp lag {m} vs {e}"));
                }
            }
            "slip_log10_mean_time_s" => {
                let (bn, cn0, n, m) = (num(&f[1]), num(&f[2]), num(&f[3]), num(&f[4]));
                if n < 10.0 {
                    continue;
                }
                let e = log10_mean_time_to_cycle_slip_s(cn0, bn, T_S);
                eprintln!("slips at {cn0} dB-Hz, B = {bn} Hz: {n} slips, log10 T GNSS-SDR {m:.2}, Kshana {e:.2}");
                seen[6] += 1;
                if (m - e).abs() > TOL_LOG10 {
                    fails.push(format!("slip time at {cn0}/{bn}: {m} vs {e}"));
                }
            }
            other => panic!("unknown row {other}"),
        }
    }
    assert!(drop_meas.is_some(), "no measured drop threshold");
    assert_eq!(
        &seen[..6],
        &[4, 4, 2, 1, 1, 1],
        "every pre-registered quantity present"
    );
    assert!(
        seen[6] >= 2,
        "at least two qualifying slip points, got {}",
        seen[6]
    );
    assert!(
        fails.is_empty(),
        "outside the pre-registered bars: {fails:#?}"
    );
}
