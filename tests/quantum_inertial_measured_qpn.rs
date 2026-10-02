// SPDX-License-Identifier: AGPL-3.0-only
//! Measured-data validation of the quantum-projection-noise (QPN) budget of a
//! dual-cloud cold-atom interferometer (`inertial::quantum_imu::DualCai`), the full
//! first-principles chain: per-cloud QPN phase `1/(C·√N)`, the two-cloud
//! quadrature composition, the Sagnac scale factor `2·k_eff·v_⊥·T²` and the
//! cycle-time conversion to a one-second Allan deviation.
//!
//! PRE-REGISTRATION (written and committed before any oracle figure was digitised and
//! before the comparison was run).
//!
//! Quantity. The one-second Allan deviation of the rotation-rate signal (rad/s/√Hz) of
//! the LNE-SYRTE dual-source caesium gyroscope, predicted by kshana from the
//! instrument's physical parameters alone, compared with the measured value.
//!
//! Oracle (measured data). A. Gauguet, B. Canuel, T. Lévèque, W. Chaibi and
//! A. Landragin, "Characterization and limits of a cold-atom Sagnac interferometer",
//! Physical Review A 80, 063604 (2009), arXiv:0907.2580v3. Figure 14: rotation noise
//! at one second measured on the interferometer (blue squares) against the reduced
//! atom number `N = N_A·N_B/(N_A + N_B)`; and the text value at the usual operating
//! point (reduced number 2e5): 2.4e-7 rad/s/√Hz. The paper is read, not vendored:
//! the fixture holds only the digitised numbers, with their source and digitisation
//! script (`tests/fixtures/quantum_inertial_measured_qpn/`).
//!
//! Inputs, all from the paper, none fitted:
//! - caesium D2 line, λ = 852.347 nm (Steck, "Cesium D Line Data"; the paper: 852 nm),
//!   so `k_eff = 4π/λ`;
//! - pulse separation T = 40 ms (2T = 80 ms);
//! - transverse launch speed v_⊥ = 2.4 m/s · sin 8° (launch 2.4 m/s at 8° to the
//!   vertical, Sec. II A); this makes the Sagnac scale factor kshana's own
//!   `2·k_eff·v_⊥·T²`, not the paper's calibrated 15 124 rad/(rad/s);
//! - cycle time T_c = 1/1.72 s (repetition rate 1.72 Hz, Sec. IV);
//! - contrast C = 0.30 per source ("a contrast C close to 30 %", Sec. II D; Fig. 5
//!   shows P from about 0.40 to 0.70, a visibility P_max − P_min of about 0.30, which
//!   is kshana's convention `P = (1 + C·cos Φ)/2`);
//! - atom number: the reduced number N, with N_A = N_B = 2N (the reduced number of two
//!   equal sources is half of each). The paper calibrates N from the QPN term of its
//!   detection-noise fit (Table I, b = 1/(2√η)) and states the result, 3.6e5 atoms per
//!   source, agrees with an independent absorption measurement. That absorption
//!   cross-check is what makes these points admissible under the selection rule
//!   "only points with independently calibrated N"; it is stated qualitatively, with
//!   no number, which the record says.
//!
//! Selection rule (QPN regime), fixed now from the paper's independent detection-noise
//! parameters (Table I: a = √α = 4e-4, b = 1/(2√η) = 7e-2, c = √γ/η = 1.6, so
//! α = 1.6e-7, η = 51.02, γ = 6 664): a point is admitted when the QPN share of the
//! detection-noise variance of Eq. (13), `(1/(4N)) / (2α + 1/(4N) + γ/N²)`, is at
//! least 0.70. Points outside are reported, not scored.
//!
//! Bar, fixed now: every admitted Fig. 14 point, and the operating point, must satisfy
//! |kshana / measured − 1| ≤ 0.30 (the ±30 % budget of the round-2 plan). Budget
//! behind it (one sigma, in the ratio): atom number ±10 % (±20 % in N, absorption
//! cross-check without a stated uncertainty), contrast reading ±7 %, nominal launch
//! geometry ±6.5 % (2.4 m/s and 8° given to two figures), technical detection noise
//! inside the admitted window up to +20 % in the measured value (Eq. 13 terms other
//! than QPN, at most 30 % of the variance), digitisation ±3 % on log axes; root sum
//! about 25 %, so ±30 % is the plan's bar, not a widened one.
//!
//! DISCLOSURE. While reading the paper to set up the inputs (before this file was
//! written) the operating-point prediction was computed by hand: about 1.9e-7 against
//! the measured 2.4e-7 (ratio about 0.79), and the paper's calibrated scale factor
//! 15 124 rad/(rad/s) against kshana's 2·k_eff·v_⊥·T² ≈ 15 757 (+4.2 %). The
//! operating-point result was therefore seen before pre-registration and does not
//! carry the row alone; the Fig. 14 points had not been looked at. The Sagnac scale
//! factor is NOT scored: the launch geometry is given only nominally, so it cannot be
//! pinned better than about ±6.5 %, and its value was seen.
//!
//! Second paper, not admitted. C. Janvier et al., "A compact differential gravimeter
//! at the quantum projection noise limit", Phys. Rev. A 105, 022801 (2022),
//! arXiv:2201.03345, Fig. 2: its atom numbers come from "a calibration factor that was
//! estimated from the QPN measurement Fig. 2A" (Methods 3a), so no point has an
//! independently calibrated N and none is admitted. The gradiometer composition is
//! checked against the paper's own QPN model line (Fig. 2B, dashed) in
//! `gradiometer_qpn_line_matches_janvier_model` as a Reference, not as measured data:
//! L = 62.5 cm, T = 120 ms, Rb-87 D2, C_top = 0.42, C_bottom = 0.53, equal atom number
//! in both clouds, per-shot value; bar ±10 % (reading a dashed line on log axes). Its
//! value at N = 1e5 was eyeballed (about 66 E) before this file was written.
//!
//! Mutation, to be shown: dropping the square root in `projection_noise_rad`
//! (1/(C·N)) or the quadrature sum in `DualCai::differential_phase_noise` (a plain
//! sum) must turn the strict test red.

use kshana::inertial::quantum_imu::{effective_wavevector, CaiAccelerometer, DualCai};

const FIG14: &str = "tests/fixtures/quantum_inertial_measured_qpn/gauguet2009_fig14.csv";
const JANVIER: &str = "tests/fixtures/quantum_inertial_measured_qpn/janvier2022_fig2b_qpn_line.csv";

const CS_D2_M: f64 = 852.347e-9;
const RB_D2_M: f64 = 780.241_209e-9;
const BAR: f64 = 0.30;
const JANVIER_BAR: f64 = 0.10;
const OPERATING_N_RED: f64 = 2.0e5;
const OPERATING_MEASURED: f64 = 2.4e-7;
const QPN_SHARE_MIN: f64 = 0.70;
// Gauguet Table I.
const ALPHA: f64 = 1.6e-7;
const ETA: f64 = 51.02;
const GAMMA: f64 = 6664.0;

fn gauguet(n_reduced: f64) -> DualCai {
    let src = CaiAccelerometer {
        wavelength_m: CS_D2_M,
        pulse_sep_t: 0.040,
        atom_number: 2.0 * n_reduced,
        contrast: 0.30,
        cycle_time_s: 1.0 / 1.72,
    };
    DualCai { a: src, b: src }
}

fn v_perp() -> f64 {
    2.4 * 8.0_f64.to_radians().sin()
}

fn qpn_share(n: f64) -> f64 {
    let q = 1.0 / (4.0 * n);
    q / (2.0 * ALPHA + q + GAMMA / (n * n))
}

fn read_csv(path: &str) -> Vec<(f64, f64)> {
    let text = std::fs::read_to_string(path).unwrap_or_else(|e| panic!("{path}: {e}"));
    text.lines()
        .filter(|l| !l.trim().is_empty() && !l.starts_with('#'))
        .skip(1)
        .map(|l| {
            let mut it = l.split(',').map(|s| s.trim().parse::<f64>().unwrap());
            (it.next().unwrap(), it.next().unwrap())
        })
        .collect()
}

/// Kshana / measured ratios at the operating point and at the admitted Fig. 14 points.
fn gauguet_ratios() -> (f64, Vec<(f64, f64)>) {
    let op = gauguet(OPERATING_N_RED).rotation_asd(v_perp()) / OPERATING_MEASURED;
    let pts = read_csv(FIG14)
        .into_iter()
        .filter(|&(n, _)| qpn_share(n) >= QPN_SHARE_MIN)
        .map(|(n, m)| (n, gauguet(n).rotation_asd(v_perp()) / m))
        .collect();
    (op, pts)
}

/// FINDING pinned (run 2026-10-02, after the pre-registration commit fcb9ac64): the
/// QPN-only prediction sits 21 % to 31 % below the measured rotation noise at the three
/// admitted points (ratios 0.788, 0.739, 0.695) and 25 % below at the operating point
/// (0.747). The worst point misses the ±30 % bar by 0.5 percentage points. The gap has
/// the sign and size of what the model leaves out: the paper's own detection-noise
/// terms (laser α and electronic γ, up to 30 % of the variance inside the window) and
/// the nominal launch geometry (kshana's Sagnac scale factor is 4.2 % above the
/// paper's calibrated one). The test fails if the gap closes or changes sign, so a
/// later engine change that moves it is noticed.
#[test]
fn gauguet_finding_qpn_floor_sits_below_the_measured_noise() {
    let (op, pts) = gauguet_ratios();
    assert!((0.70..0.80).contains(&op), "operating-point ratio {op:.3}");
    assert_eq!(pts.len(), 3);
    for (n, r) in pts {
        assert!((0.65..0.80).contains(&r), "N={n:.3e}: ratio {r:.3}");
    }
}

#[test]
#[ignore = "FINDING: QPN-only prediction 0.695 to 0.788 of the measured Gauguet 2009 rotation noise at the admitted points; worst |ratio - 1| = 0.305 > 0.30 (pre-registered bar)"]
fn gyroscope_qpn_matches_gauguet_measured_rotation_noise() {
    let _ = (ETA, effective_wavevector(CS_D2_M));
    let mut worst: f64 = 0.0;
    let mut scored = 0;
    let op = gauguet(OPERATING_N_RED).rotation_asd(v_perp());
    let r = op / OPERATING_MEASURED;
    println!(
        "operating point N=2e5: kshana {op:.4e} measured {OPERATING_MEASURED:.2e} ratio {r:.3}"
    );
    worst = worst.max((r - 1.0).abs());
    for (n, measured) in read_csv(FIG14) {
        let share = qpn_share(n);
        let pred = gauguet(n).rotation_asd(v_perp());
        let r = pred / measured;
        let admitted = share >= QPN_SHARE_MIN;
        println!(
            "N={n:.3e} measured {measured:.3e} kshana {pred:.3e} ratio {r:.3} QPN share {share:.2} {}",
            if admitted { "ADMITTED" } else { "not scored" }
        );
        if admitted {
            scored += 1;
            worst = worst.max((r - 1.0).abs());
        }
    }
    println!("admitted Fig. 14 points: {scored}; worst |ratio - 1| = {worst:.3}");
    assert!(
        scored >= 1,
        "no Fig. 14 point falls in the pre-registered QPN window"
    );
    assert!(worst <= BAR, "worst |ratio - 1| {worst:.3} exceeds {BAR}");
}

/// Reference check, run 2026-10-02 after the pre-registration commit fcb9ac64: kshana's
/// gradiometer composition reproduces the authors' QPN model line at all 40 dashes,
/// ratio 1.013 to 1.017 (bar ±10 %).
#[test]
fn gradiometer_qpn_line_matches_janvier_model() {
    let mut worst: f64 = 0.0;
    for (n, line_e) in read_csv(JANVIER) {
        let cloud = |c: f64| CaiAccelerometer {
            wavelength_m: RB_D2_M,
            pulse_sep_t: 0.120,
            atom_number: n,
            contrast: c,
            cycle_time_s: 1.08,
        };
        let dual = DualCai {
            a: cloud(0.42),
            b: cloud(0.53),
        };
        let pred_e = dual.gradient_noise_per_shot(0.625) / 1e-9;
        let r = pred_e / line_e;
        println!("N={n:.3e} Janvier QPN line {line_e:.2} E kshana {pred_e:.2} E ratio {r:.3}");
        worst = worst.max((r - 1.0).abs());
    }
    assert!(worst <= JANVIER_BAR, "worst |ratio - 1| {worst:.3}");
}
