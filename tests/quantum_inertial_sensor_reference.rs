// SPDX-License-Identifier: AGPL-3.0-only
//! External-oracle validation of the cold-atom-interferometer (CAI) accelerometer
//! physics in `src/inertial/quantum_imu.rs`, against PUBLISHED PRIMARY-PAPER
//! quantities transcribed/recomputed in `tests/fixtures/quantum_inertial_sensor_performance/`.
//!
//! Three quantities, three different oracle kinds (see the generator header for the
//! full provenance and reproduce steps):
//!
//! 1. **Accel->phase transfer function `|H(w)|` (s^2)** — kshana's analytic closed
//!    form `(4/w^2)·sin²(wT/2)` (Cheinet et al., IEEE TIM 57, 2008) is checked
//!    against a NUMERIC TIME-DOMAIN INTEGRAL of Cheinet's centred antisymmetric
//!    sensitivity function `g(t)` (g=-1 on [-T,0], +1 on [0,T]) driven by a probe
//!    acceleration `a(t)=cos(wt)`. These are genuinely different computation paths
//!    (numeric integral of g(t) vs the analytic Fourier-transform result), so
//!    agreement validates that kshana's closed form is the correct evaluation of
//!    Cheinet's interferometer response — not a numeric integral of kshana's own
//!    formula. Validated to a tight relative tolerance.
//!
//! 2. **Effective wavevector `k_eff = 4π/λ` (rad/m)** — checked against `4π/λ` for
//!    published Steck line wavelengths (Rb-87 D2 780.241209 nm, Cs D2 852.347 nm).
//!    Definitional; tight tolerance.
//!
//! 3. **Coriolis equivalent bias `2vΩ` (m/s²)** — checked against the classical
//!    Coriolis acceleration `|2Ω×v| = 2v_⊥Ω`. Definitional; tight tolerance.
//!
//! 4. **Per-shot sensitivity `σ_a` / ASD `n_a`** — a ONE-SIDED bound: the kshana
//!    *ideal quantum-projection-noise (shot-noise) floor* must lie at or below the
//!    PUBLISHED ACHIEVED performance of real devices (Peters/Chung/Chu 2001 Cs
//!    gravimeter; Freier et al. 2016 mobile Rb-87 gravimeter), which carry
//!    technical/vibration noise above the quantum floor, AND be the same order of
//!    magnitude. This is the modelling reality the existing Freier unit-test row
//!    already encodes, made explicit against the published numbers.
//!
//! HONEST SCOPE. (1)-(3) are exact-match checks of the interferometer transfer
//! function, the wavevector, and the Coriolis bias against independent computations
//! of the published forms — these are genuinely validated. (4) is an order-of-
//! magnitude one-sided bound against published *device* numbers, not an exact match:
//! real CAI devices are technical/vibration-limited above the modelled quantum
//! floor, so this confirms the floor is physical and not optimistic by orders of
//! magnitude, but does NOT validate a full instrument noise model. Wavefront
//! aberration and fringe-ambiguity are out of scope (see docs/QUANTUM.md).

use kshana::inertial::quantum_imu::{
    accel_transfer_function, coriolis_accel_bias, effective_wavevector, CaiAccelerometer,
};

const REF: &str = include_str!(
    "fixtures/quantum_inertial_sensor_performance/quantum_inertial_sensor_performance_reference.txt"
);

/// Transfer-function / wavevector / Coriolis relative tolerance. The |H(w)| oracle
/// is a numeric quad integral (Cheinet g(t)); kshana is the analytic FT result, so
/// the residual is dominated by quad's quadrature error (~1e-9 typical, worse near
/// the nulls). 1e-6 rel is comfortably above quadrature noise yet far tighter than
/// any modelling slack. A small absolute floor lets the deep nulls (where both the
/// closed form and the integral are ~0) compare cleanly.
const REL_TOL: f64 = 1e-6;
/// Absolute floor (s² for |H|, dimensionless elsewhere): near the transfer-function
/// nulls (w = 2πn/T) sin²(wT/2)=0 exactly in kshana while the numeric integral
/// returns ~1e-20; this floor (a part in ~1e9 of the DC value T²≈1e-2..7e-2) lets
/// those genuine zeros match without masking any real disagreement.
const ABS_TOL_H: f64 = 1e-10;

fn approx(got: f64, want: f64, abs_floor: f64) -> bool {
    (got - want).abs() <= REL_TOL * want.abs() + abs_floor
}

fn after_bar(line: &str) -> Vec<&str> {
    line.split('|').collect()
}

#[test]
fn cai_transfer_function_matches_cheinet_sensitivity_integral() {
    let mut n = 0usize;
    let mut worst_rel = 0.0_f64;
    for line in REF.lines() {
        if !line.starts_with("HW ") {
            continue;
        }
        // HW T | w | |H(w)|
        let parts = after_bar(line);
        assert_eq!(parts.len(), 3, "HW row needs 3 |-fields: {line}");
        let t: f64 = parts[0].trim_start_matches("HW").trim().parse().unwrap();
        let w: f64 = parts[1].trim().parse().unwrap();
        let h_want: f64 = parts[2].trim().parse().unwrap();

        let h_got = accel_transfer_function(w, t);
        let denom = h_want.abs().max(ABS_TOL_H);
        let rel = (h_got - h_want).abs() / denom;
        worst_rel = worst_rel.max(rel);
        assert!(
            approx(h_got, h_want, ABS_TOL_H),
            "HW T={t} w={w}: kshana |H|={h_got:.9e} s^2 vs Cheinet-g(t) integral \
             {h_want:.9e} s^2 (|Δ|={:.2e} > {:.2e})",
            (h_got - h_want).abs(),
            REL_TOL * h_want.abs() + ABS_TOL_H,
        );
        n += 1;
    }
    assert!(n >= 8, "expected >=8 transfer-function cases, got {n}");
    eprintln!(
        "transfer-function: {n} cases vs Cheinet-2008 sensitivity-fn integral, worst rel = {worst_rel:.2e}"
    );
}

#[test]
fn cai_effective_wavevector_matches_published_line_data() {
    let mut n = 0usize;
    let mut worst_rel = 0.0_f64;
    for line in REF.lines() {
        if !line.starts_with("KEFF ") {
            continue;
        }
        // KEFF species lambda | k_eff
        let parts = after_bar(line);
        assert_eq!(parts.len(), 2, "KEFF row needs 2 |-fields: {line}");
        let lhs: Vec<&str> = parts[0].split_whitespace().collect();
        // lhs = ["KEFF", species, lambda]
        let lambda: f64 = lhs[2].parse().unwrap();
        let keff_want: f64 = parts[1].trim().parse().unwrap();

        let keff_got = effective_wavevector(lambda);
        let rel = (keff_got - keff_want).abs() / keff_want.abs();
        worst_rel = worst_rel.max(rel);
        assert!(
            approx(keff_got, keff_want, 0.0),
            "KEFF {}: kshana k_eff={keff_got:.9e} vs 4π/λ {keff_want:.9e} (rel={rel:.2e})",
            lhs[1],
        );
        n += 1;
    }
    assert!(n >= 2, "expected >=2 k_eff cases, got {n}");
    eprintln!("k_eff: {n} cases vs published 4π/λ, worst rel = {worst_rel:.2e}");
}

#[test]
fn cai_coriolis_bias_matches_classical_two_v_omega() {
    let mut n = 0usize;
    let mut worst_rel = 0.0_f64;
    for line in REF.lines() {
        if !line.starts_with("COR ") {
            continue;
        }
        // COR name v Omega | 2vOmega
        let parts = after_bar(line);
        assert_eq!(parts.len(), 2, "COR row needs 2 |-fields: {line}");
        let lhs: Vec<&str> = parts[0].split_whitespace().collect();
        // lhs = ["COR", name, v, Omega]
        let v: f64 = lhs[2].parse().unwrap();
        let omega: f64 = lhs[3].parse().unwrap();
        let bias_want: f64 = parts[1].trim().parse().unwrap();

        let bias_got = coriolis_accel_bias(v, omega);
        let rel = (bias_got - bias_want).abs() / bias_want.abs();
        worst_rel = worst_rel.max(rel);
        assert!(
            approx(bias_got, bias_want, 0.0),
            "COR {}: kshana 2vΩ={bias_got:.9e} vs classical {bias_want:.9e} (rel={rel:.2e})",
            lhs[1],
        );
        n += 1;
    }
    assert!(n >= 3, "expected >=3 Coriolis cases, got {n}");
    eprintln!("Coriolis: {n} cases vs classical 2vΩ, worst rel = {worst_rel:.2e}");
}

#[test]
fn cai_shot_noise_floor_is_below_and_near_published_devices() {
    // One-sided same-order bound: the modelled ideal quantum-projection-noise floor
    // must lie at/below the published achieved performance of a real device, and be
    // within ~3 orders (the real device is technical/vibration-limited above the SQL
    // — for Peters 2001 / Freier 2016 the headroom is ~1.5-2 orders).
    const MAX_HEADROOM: f64 = 1.0e3; // floor must be within 3 orders below published
    let mut n = 0usize;
    for line in REF.lines() {
        if !line.starts_with("SHOT ") {
            continue;
        }
        // SHOT device | lambda T N C Tc | published_per_shot published_asd
        let parts = after_bar(line);
        assert_eq!(parts.len(), 3, "SHOT row needs 3 |-fields: {line}");
        let device = parts[0].trim_start_matches("SHOT").trim();
        let cfg: Vec<f64> = parts[1]
            .split_whitespace()
            .map(|x| x.parse().unwrap())
            .collect();
        assert_eq!(cfg.len(), 5, "SHOT config needs 5 numbers: {line}");
        let pub_vals: Vec<f64> = parts[2]
            .split_whitespace()
            .map(|x| x.parse().unwrap_or(f64::NAN))
            .collect();
        assert_eq!(pub_vals.len(), 2, "SHOT pub needs 2 numbers: {line}");
        let (pub_per_shot, pub_asd) = (pub_vals[0], pub_vals[1]);

        let cai = CaiAccelerometer {
            wavelength_m: cfg[0],
            pulse_sep_t: cfg[1],
            atom_number: cfg[2],
            contrast: cfg[3],
            cycle_time_s: cfg[4],
        };

        // ASD floor: one-sided + same order.
        let asd_floor = cai.accel_asd();
        if pub_asd.is_finite() {
            assert!(
                asd_floor <= pub_asd,
                "SHOT {device}: ideal ASD floor {asd_floor:.3e} must be <= published \
                 achieved {pub_asd:.3e} m/s²/√Hz"
            );
            assert!(
                pub_asd <= MAX_HEADROOM * asd_floor,
                "SHOT {device}: published ASD {pub_asd:.3e} implausibly far above the \
                 floor {asd_floor:.3e} (headroom {:.1e} > {MAX_HEADROOM:.0e})",
                pub_asd / asd_floor
            );
        }

        // Per-shot sensitivity floor: one-sided + same order, when transcribed.
        let per_shot_floor = cai.accel_sensitivity_per_shot();
        if pub_per_shot.is_finite() {
            assert!(
                per_shot_floor <= pub_per_shot,
                "SHOT {device}: ideal per-shot floor {per_shot_floor:.3e} must be <= \
                 published achieved {pub_per_shot:.3e} m/s²"
            );
            assert!(
                pub_per_shot <= MAX_HEADROOM * per_shot_floor,
                "SHOT {device}: published per-shot {pub_per_shot:.3e} implausibly far \
                 above floor {per_shot_floor:.3e}"
            );
        }
        n += 1;
    }
    assert!(n >= 2, "expected >=2 published-device cases, got {n}");
    eprintln!("shot-noise floor: {n} devices, ideal floor <= published achieved (one-sided, same-order)");
}
