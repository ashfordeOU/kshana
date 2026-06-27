// SPDX-License-Identifier: AGPL-3.0-only
//! Externally validate the quantum-inertial dead-reckoning error budget
//! (`inertial::quantum_imu::QuantumNavBudget`) over a GNSS-denied holdover
//! against two INDEPENDENT authorities.
//!
//! * **VRW (velocity random walk).** kshana carries the analytic position-error
//!   1-sigma `vrw_drift_m(t) = sqrt(q_va·t³/3)` for the double-integrated white
//!   acceleration noise. The oracle is an **independent numpy Monte-Carlo SDE
//!   integration**: M=2·10⁵ white-acceleration paths drawn with per-step std
//!   `sqrt(q_va/dt)`, each double-integrated (two cumulative sums × dt), with the
//!   empirical 1-σ of the final position taken over the realisations. The MC uses
//!   no closed form, so its agreement with `sqrt(q_va·t³/3)` is a genuine external
//!   check of the analytic variance — the same library-vs-independent-algorithm
//!   spirit as the Lambert/scipy fixtures. Checked across **6 coast times**
//!   {30,60,120,300,600,1200}s and **>3 q_va decades** (here ~5.2).
//!
//! * **Bias / scale-factor (deterministic).** `bias_drift_m(t)=½·b·t²` and
//!   `scale_factor_drift_m(t)=½·ε·a_ref·t²` are the Groves 2013 closed-form INS
//!   error-propagation identities (Groves, *Principles of GNSS, Inertial &
//!   Multisensor Integrated Navigation*, 2nd ed., Artech House, ISBN
//!   978-1-60807-005-3), pinned in the fixture and matched to a tight relative
//!   tolerance. (The fixture also carries an independent numpy double-integration
//!   of the constant error; the ~0.08% forward-Euler bias it shows confirms the
//!   closed forms are the correct continuum limit.)
//!
//! * **Holdover round-trip.** `holdover_seconds(thr)` inverts the (monotone) total
//!   drift; the test checks `position_drift_1sigma(holdover) == thr`.
//!
//! Honest scope: this validates the **error-budget arithmetic** — the
//! double-integration of white noise (VRW), of a constant bias, and of a
//! scale-factor specific-force error, plus the holdover inversion. It does NOT
//! validate the cold-atom-interferometer device physics that *produces* `q_va`
//! (that is the separate `inertial::quantum_imu` / `inertial::cai_params`
//! capability, anchored to the Freier-2016 bracket), nor the root-sum-square
//! independence assumption of the composed budget. The VRW check is statistical
//! (Monte-Carlo band); the bias/scale-factor/holdover checks are tight.
//!
//! Reference data, provenance and the committed generator live in
//! `tests/fixtures/quantum_inertial_dead_reckoning/`.

use kshana::inertial::quantum_imu::{CaiAccelerometer, QuantumNavBudget};
use std::collections::HashMap;

const REF: &str = include_str!(
    "fixtures/quantum_inertial_dead_reckoning/quantum_inertial_dead_reckoning_reference.txt"
);

/// VRW Monte-Carlo acceptance half-width: the empirical std must lie within ±3% of
/// the analytic `sqrt(q_va·t³/3)` (combined MC sampling noise ~0.2% at M=2·10⁵ and
/// discretisation bias <0.15% at 1200 steps both sit far inside this).
const VRW_BAND: f64 = 0.03;
/// Deterministic (bias / scale-factor) relative tolerance vs the Groves closed
/// form. Both are exact algebraic identities, so this is float round-off only.
const DET_REL: f64 = 1e-9;
const DET_ABS: f64 = 1e-12; // m, floor for terms that are exactly 0
/// Holdover round-trip relative tolerance (bisection converges to ~2⁻¹⁰⁰ of the
/// bracket; the residual is the threshold rel error).
const HOLD_REL: f64 = 1e-6;

fn parse(s: &str) -> f64 {
    s.trim()
        .parse()
        .unwrap_or_else(|_| panic!("not a float: '{s}'"))
}

#[derive(Clone, Copy)]
struct Cfg {
    wavelength_m: f64,
    pulse_sep_t: f64,
    atom_number: f64,
    contrast: f64,
    cycle_time_s: f64,
    q_va: f64,
}

impl Cfg {
    fn cai(&self) -> CaiAccelerometer {
        CaiAccelerometer {
            wavelength_m: self.wavelength_m,
            pulse_sep_t: self.pulse_sep_t,
            atom_number: self.atom_number,
            contrast: self.contrast,
            cycle_time_s: self.cycle_time_s,
        }
    }
}

#[test]
fn quantum_inertial_dead_reckoning_matches_independent_oracles() {
    // ── Pass 1: read the CAI configs (so VRW/HOLD rows can rebuild the budget). ──
    let mut cfgs: HashMap<String, Cfg> = HashMap::new();
    for line in REF.lines() {
        if let Some(rest) = line.strip_prefix("CAI ") {
            let p: Vec<&str> = rest.split('|').collect();
            assert_eq!(p.len(), 7, "CAI row needs 7 |-fields: {line}");
            let name = p[0].trim().to_string();
            let cfg = Cfg {
                wavelength_m: parse(p[1]),
                pulse_sep_t: parse(p[2]),
                atom_number: parse(p[3]),
                contrast: parse(p[4]),
                cycle_time_s: parse(p[5]),
                q_va: parse(p[6]),
            };
            // The Rust-derived q_va must equal the value the oracle ran its
            // Monte-Carlo at — otherwise the MC band would apply to a different
            // physics. This also re-checks CaiAccelerometer::q_va() in passing.
            let q_rust = cfg.cai().q_va();
            let rel = (q_rust - cfg.q_va).abs() / cfg.q_va;
            assert!(
                rel < 1e-12,
                "CAI {name}: kshana q_va {q_rust:.6e} vs oracle {:.6e} (rel {rel:.2e})",
                cfg.q_va
            );
            cfgs.insert(name, cfg);
        }
    }
    assert!(
        cfgs.len() >= 3,
        "need >=3 CAI configs (q_va decades), got {}",
        cfgs.len()
    );

    let budget_with = |cfg: &Cfg, bias: f64, ppm: f64, a_ref: f64| QuantumNavBudget {
        cai: cfg.cai(),
        bias_m_s2: bias,
        scale_factor_ppm: ppm,
        ref_accel_m_s2: a_ref,
        tau_stability_s: 0.0,
    };

    // ── Pass 2: VRW Monte-Carlo band, deterministic Groves terms, holdover. ──
    let mut n_vrw = 0usize;
    let mut n_det = 0usize;
    let mut n_hold = 0usize;
    let mut worst_vrw = 0.0_f64; // worst MC-vs-kshana relative deviation
    let mut worst_det = 0.0_f64; // worst deterministic relative deviation
    let mut worst_hold = 0.0_f64; // worst holdover round-trip relative deviation
    let mut q_decades_lo = f64::INFINITY;
    let mut q_decades_hi = 0.0_f64;

    for line in REF.lines() {
        if let Some(rest) = line.strip_prefix("VRW ") {
            // VRW cfgname | t | q_va | mc_std_m | analytic | rel_mc_vs_analytic
            let p: Vec<&str> = rest.split('|').collect();
            assert_eq!(p.len(), 6, "VRW row needs 6 |-fields: {line}");
            let cfg = &cfgs[p[0].trim()];
            let t = parse(p[1]);
            let q_va = parse(p[2]);
            let mc_std = parse(p[3]);
            q_decades_lo = q_decades_lo.min(q_va);
            q_decades_hi = q_decades_hi.max(q_va);

            // kshana's analytic VRW drift on the IDENTICAL budget.
            let budget = budget_with(cfg, 0.0, 0.0, 0.0);
            let kshana = budget.vrw_drift_m(t);

            // kshana must reproduce sqrt(q_va·t³/3) to float precision …
            let closed = (q_va * t.powi(3) / 3.0).sqrt();
            assert!(
                (kshana - closed).abs() / closed < 1e-12,
                "VRW {}: kshana vrw_drift_m {kshana:.6e} vs sqrt(q t³/3) {closed:.6e}",
                p[0].trim()
            );
            // … and lie within the ±3% Monte-Carlo band of the empirical std.
            let rel = (kshana - mc_std).abs() / mc_std;
            worst_vrw = worst_vrw.max(rel);
            assert!(
                rel < VRW_BAND,
                "VRW {} t={t}: kshana {kshana:.6e} m outside ±{:.0}% MC band of \
                 empirical {mc_std:.6e} m (rel {rel:.3e})",
                p[0].trim(),
                VRW_BAND * 100.0
            );
            n_vrw += 1;
        } else if let Some(rest) = line.strip_prefix("DET ") {
            // DET name | bias | ppm | a_ref | t | bias_groves | sf_groves | bias_num | sf_num
            let p: Vec<&str> = rest.split('|').collect();
            assert_eq!(p.len(), 9, "DET row needs 9 |-fields: {line}");
            let bias = parse(p[1]);
            let ppm = parse(p[2]);
            let a_ref = parse(p[3]);
            let t = parse(p[4]);
            let bias_groves = parse(p[5]);
            let sf_groves = parse(p[6]);

            // Any CAI is fine for the deterministic terms (q_va does not enter them).
            let cfg = cfgs.values().next().unwrap();
            let budget = budget_with(cfg, bias, ppm, a_ref);

            for (lbl, got, want) in [
                ("bias", budget.bias_drift_m(t), bias_groves),
                ("scale_factor", budget.scale_factor_drift_m(t), sf_groves),
            ] {
                let tol = DET_REL * want.abs() + DET_ABS;
                let d = (got - want).abs();
                if want != 0.0 {
                    worst_det = worst_det.max(d / want.abs());
                }
                assert!(
                    d <= tol,
                    "DET {} {lbl} t={t}: kshana {got:.9e} m vs Groves {want:.9e} m \
                     (|Δ|={d:.2e} > {tol:.2e})",
                    p[0].trim()
                );
            }
            n_det += 1;
        } else if let Some(rest) = line.strip_prefix("HOLD ") {
            // HOLD name | bias | ppm | a_ref | threshold_m  (cai = Tlong)
            let p: Vec<&str> = rest.split('|').collect();
            assert_eq!(p.len(), 5, "HOLD row needs 5 |-fields: {line}");
            let bias = parse(p[1]);
            let ppm = parse(p[2]);
            let a_ref = parse(p[3]);
            let thr = parse(p[4]);
            let cfg = &cfgs["Tlong"];
            let budget = budget_with(cfg, bias, ppm, a_ref);

            let hold = budget.holdover_seconds(thr);
            assert!(
                hold.is_finite() && hold > 0.0,
                "HOLD {}: bad holdover {hold}",
                p[0].trim()
            );
            let drift = budget.position_drift_1sigma(hold);
            let rel = (drift - thr).abs() / thr;
            worst_hold = worst_hold.max(rel);
            assert!(
                rel < HOLD_REL,
                "HOLD {} thr={thr}: drift(holdover={hold:.3}) = {drift:.6} m, \
                 round-trip rel {rel:.2e} > {HOLD_REL:.0e}",
                p[0].trim()
            );
            n_hold += 1;
        }
    }

    // Quantity gates from the validation plan.
    assert!(
        n_vrw >= 18,
        "expected >=18 VRW (6 times × >=3 decades), got {n_vrw}"
    );
    assert!(
        n_det >= 8,
        "expected >=8 deterministic Groves cases, got {n_det}"
    );
    assert!(
        n_hold >= 4,
        "expected >=4 holdover round-trip cases, got {n_hold}"
    );
    let decades = (q_decades_hi / q_decades_lo).log10();
    assert!(
        decades >= 3.0,
        "VRW must span >=3 q_va decades, got {decades:.2}"
    );

    eprintln!(
        "quantum_inertial_dead_reckoning: {n_vrw} VRW (worst MC dev {:.2}% < {:.0}%, \
         {decades:.1} q_va decades), {n_det} bias/scale-factor (worst rel {:.1e} < {:.0e} vs Groves), \
         {n_hold} holdover round-trips (worst rel {:.1e})",
        worst_vrw * 100.0,
        VRW_BAND * 100.0,
        worst_det,
        DET_REL,
        worst_hold,
    );
}
