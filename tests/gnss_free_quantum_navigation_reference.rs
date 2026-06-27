// SPDX-License-Identifier: AGPL-3.0-only
//! Externally validate the **GNSS-free quantum-navigation** primitives (module
//! `quantum_nav_od`: [`QuantumNavOdScenario`] composes
//! [`inertial::quantum_imu::QuantumNavBudget`] and
//! [`quantum_trade::ClassicalInsBudget`] through the [`quantum_trade::PositionDrift`]
//! trait) against two INDEPENDENT external authorities.
//!
//! * **(A) Shot-noise floor vs Freier-2016 (published-vectors + Octave geometry).**
//!   kshana's shot-noise- (standard-quantum-) limited acceleration ASD `n_a`
//!   ([`CaiAccelerometer::accel_asd`]) for the Freier-2016 "GAIN" published config
//!   `(λ, T, N, C, T_c)` is checked two ways. (i) An **independent Octave**
//!   recomputation of `n_a = (1/(C·√N))/(k_eff·T²)·√T_c` (k_eff = 4π/λ) must agree
//!   with kshana to <1e-9 rel — a genuine cross-engine check of the SQL geometry.
//!   (ii) The PUBLISHED Freier short-term noise (96 nm/s²/√Hz; C. Freier et al.,
//!   J. Phys.: Conf. Ser. 723, 012050 (2016), arXiv:1512.05660) must lie in
//!   `[10×, 100×]` of that floor — a real device is vibration-/technical-limited
//!   and so sits ABOVE, but within ~2 orders of, its quantum-projection-noise floor
//!   (the measured ratio here is ~62.7×). One-sided bracket ⇒ the device physics is
//!   MODELLED, not Validated.
//!
//! * **(B) Dead-reckoning position error vs an independent Octave propagator.**
//!   For the EXACT quantum CAI and classical INS budgets the `quantum_nav_od`
//!   scenario uses, at t ∈ {60,120,300,600,1000}s, kshana's `drift_m(t)` is
//!   decomposed and checked against Octave: the deterministic bias term `½·b·t²`
//!   and scale-factor term `½·ε·a_ref·t²` are reproduced to <1e-9 rel (closed-form
//!   double-integration), and the velocity-random-walk term `√(q_va·t³/3)` is
//!   checked to land inside a ±3% band of an **independent Octave Monte-Carlo
//!   double-integration** of M=2·10⁵ white-acceleration paths (per-step velocity
//!   increment std `√(q_va·dt)`, double-cumulative-summed — exactly the continuum
//!   of kshana's own `AccelModel::step`, but written in a different runtime with no
//!   closed form). The composed RSS `drift_m(t)` is then checked end-to-end.
//!
//! HONEST SCOPE — what this DOES validate: the PRIMITIVES of the GNSS-free
//! navigation scenario — the Freier-anchored shot-noise floor geometry (one-sided
//! bracket) and the dead-reckoning error growth of BOTH the quantum and the
//! classical budgets (double-integration of white noise, of a constant bias, and
//! of a scale-factor force, plus their root-sum-square) against an independent
//! Octave propagator. Notably it covers [`ClassicalInsBudget`]'s VRW, which the
//! quantum-only numpy fixture does not. What it does NOT validate: the composite
//! claim that the quantum budget BEATS the classical one (that rests on the chosen
//! public-source device parameters, not an external authority, and stays MODELLED),
//! nor the cold-atom device hardware, the RSS-independence assumption, or any
//! flight/TRL heritage.
//!
//! Reference data, provenance and the committed Octave generator live in
//! `tests/fixtures/gnss_free_quantum_navigation/`.

use kshana::inertial::quantum_imu::{CaiAccelerometer, QuantumNavBudget};
use kshana::quantum_trade::{ClassicalInsBudget, PositionDrift};

const REF: &str = include_str!(
    "fixtures/gnss_free_quantum_navigation/gnss_free_quantum_navigation_reference.txt"
);

/// Exact-arithmetic relative tolerance for the shot-noise floor and the
/// deterministic (bias / scale-factor) double-integration: both are pure `f64`
/// algebra of the same closed form reached independently in Octave, so the residual
/// is float round-off only.
const EXACT_REL: f64 = 1e-9;
const EXACT_ABS: f64 = 1e-12; // m / (m/s²/√Hz) — floor for terms that are exactly 0
/// VRW Monte-Carlo acceptance half-width: kshana's analytic `√(q_va·t³/3)` must lie
/// within ±3% of the empirical Octave-MC 1-σ (M=2·10⁵ sampling noise ~0.16% and the
/// 2000-step discretisation bias <0.1% both sit far inside this).
const VRW_BAND: f64 = 0.03;
/// Freier published/SQL bracket: a real, vibration-limited device sits ABOVE its
/// quantum floor (ratio > 10×) but within ~2 orders of it (ratio < 100×).
const FREIER_RATIO_LO: f64 = 10.0;
const FREIER_RATIO_HI: f64 = 100.0;

fn parse(s: &str) -> f64 {
    s.trim()
        .parse()
        .unwrap_or_else(|_| panic!("not a float: '{s}'"))
}

fn rel(got: f64, want: f64) -> f64 {
    if want == 0.0 {
        got.abs()
    } else {
        (got - want).abs() / want.abs()
    }
}

#[derive(Clone, Copy)]
struct QCfg {
    cai: CaiAccelerometer,
    bias: f64,
    ppm: f64,
    a_ref: f64,
}

#[test]
fn gnss_free_quantum_navigation_matches_octave_and_freier() {
    let mut qcfg: Option<QCfg> = None;
    let mut ccfg: Option<ClassicalInsBudget> = None;

    let mut n_freier = 0usize;
    let mut n_det = 0usize; // deterministic (bias/scale-factor) component checks
    let mut n_vrw = 0usize; // Monte-Carlo VRW band checks
    let mut n_rss = 0usize; // end-to-end drift_m RSS checks

    let mut worst_sql_rel = 0.0_f64;
    let mut worst_det_rel = 0.0_f64;
    let mut worst_vrw_dev = 0.0_f64;
    let mut worst_rss_rel = 0.0_f64;
    let mut freier_ratio = 0.0_f64;

    // ── Pass 1: read the budget configs so DRIFT rows can rebuild them. ──────
    for line in REF.lines() {
        if let Some(rest) = line.strip_prefix("QCFG ") {
            // QCFG lambda | T | N | C | Tc | q_va | bias | ppm | a_ref
            let p: Vec<&str> = rest.split('|').collect();
            assert_eq!(p.len(), 9, "QCFG needs 9 |-fields: {line}");
            let cai = CaiAccelerometer {
                wavelength_m: parse(p[0]),
                pulse_sep_t: parse(p[1]),
                atom_number: parse(p[2]),
                contrast: parse(p[3]),
                cycle_time_s: parse(p[4]),
            };
            // kshana's derived q_va must equal the value Octave ran its MC at, else
            // the band would apply to a different physics (also re-checks q_va()).
            let q_oracle = parse(p[5]);
            let q_rust = cai.q_va();
            assert!(
                rel(q_rust, q_oracle) < EXACT_REL,
                "QCFG: kshana q_va {q_rust:.6e} vs Octave {q_oracle:.6e}"
            );
            qcfg = Some(QCfg {
                cai,
                bias: parse(p[6]),
                ppm: parse(p[7]),
                a_ref: parse(p[8]),
            });
        } else if let Some(rest) = line.strip_prefix("CCFG ") {
            // CCFG vrw_psd | bias | ppm | a_ref
            let p: Vec<&str> = rest.split('|').collect();
            assert_eq!(p.len(), 4, "CCFG needs 4 |-fields: {line}");
            ccfg = Some(ClassicalInsBudget {
                vrw_psd: parse(p[0]),
                bias_m_s2: parse(p[1]),
                scale_factor_ppm: parse(p[2]),
                ref_accel_m_s2: parse(p[3]),
            });
        }
    }
    let qcfg = qcfg.expect("QCFG row missing from fixture");
    let ccfg = ccfg.expect("CCFG row missing from fixture");

    let qbudget = QuantumNavBudget {
        cai: qcfg.cai,
        bias_m_s2: qcfg.bias,
        scale_factor_ppm: qcfg.ppm,
        ref_accel_m_s2: qcfg.a_ref,
        tau_stability_s: 0.0,
    };

    // ── Pass 2: Freier anchor + per-time double-integration for both budgets. ─
    for line in REF.lines() {
        if let Some(rest) = line.strip_prefix("FREIER ") {
            // FREIER lambda | T | N | C | Tc | sql_n_a | published_n_a | ratio
            let p: Vec<&str> = rest.split('|').collect();
            assert_eq!(p.len(), 8, "FREIER needs 8 |-fields: {line}");
            let freier = CaiAccelerometer {
                wavelength_m: parse(p[0]),
                pulse_sep_t: parse(p[1]),
                atom_number: parse(p[2]),
                contrast: parse(p[3]),
                cycle_time_s: parse(p[4]),
            };
            let sql_oracle = parse(p[5]);
            let published = parse(p[6]);

            // (A.i) kshana's accel_asd must reproduce the Octave SQL geometry.
            let sql_kshana = freier.accel_asd();
            let r = rel(sql_kshana, sql_oracle);
            worst_sql_rel = worst_sql_rel.max(r);
            assert!(
                r < EXACT_REL,
                "FREIER: kshana accel_asd {sql_kshana:.9e} vs Octave SQL {sql_oracle:.9e} \
                 (rel {r:.2e} > {EXACT_REL:.0e})"
            );

            // (A.ii) Published achieved noise must sit in [10×, 100×] of the floor.
            freier_ratio = published / sql_kshana;
            assert!(
                sql_kshana < published,
                "FREIER: SQL floor {sql_kshana:.3e} must be below published achieved \
                 {published:.3e} m/s²/√Hz (a device cannot beat its own quantum floor)"
            );
            assert!(
                (FREIER_RATIO_LO..=FREIER_RATIO_HI).contains(&freier_ratio),
                "FREIER: published/SQL ratio {freier_ratio:.2} outside vibration-limited \
                 bracket [{FREIER_RATIO_LO}×, {FREIER_RATIO_HI}×]"
            );
            n_freier += 1;
        } else if let Some(rest) = line.strip_prefix("DRIFT ") {
            // DRIFT Q|C | t | bias_pos | sf_pos | vrw_analytic | vrw_mc | drift_rss
            let p: Vec<&str> = rest.split('|').collect();
            assert_eq!(p.len(), 7, "DRIFT needs 7 |-fields: {line}");
            let which = p[0].trim();
            let t = parse(p[1]);
            let bias_pos = parse(p[2]);
            let sf_pos = parse(p[3]);
            let vrw_analytic = parse(p[4]);
            let vrw_mc = parse(p[5]);
            let drift_rss = parse(p[6]);

            // kshana's component values on the IDENTICAL budget.
            let (k_bias, k_sf, k_vrw, k_rss): (f64, f64, f64, f64) = match which {
                "Q" => (
                    qbudget.bias_drift_m(t),
                    qbudget.scale_factor_drift_m(t),
                    qbudget.vrw_drift_m(t),
                    qbudget.drift_m(t),
                ),
                "C" => {
                    // ClassicalInsBudget exposes only the composed drift_m; rebuild
                    // its components from the (public) fields with the same algebra
                    // the struct documents, so each mechanism is checked separately.
                    let b = 0.5 * ccfg.bias_m_s2 * t * t;
                    let sf = 0.5 * (ccfg.scale_factor_ppm * 1e-6) * ccfg.ref_accel_m_s2 * t * t;
                    let vrw = (ccfg.vrw_psd * t.powi(3) / 3.0).sqrt();
                    (b, sf, vrw, ccfg.drift_m(t))
                }
                other => panic!("DRIFT budget tag must be Q or C, got '{other}'"),
            };

            // Deterministic terms: <1e-9 rel vs the Octave closed-form integration.
            for (lbl, got, want) in [("bias", k_bias, bias_pos), ("scale_factor", k_sf, sf_pos)] {
                let r = rel(got, want);
                let tol = EXACT_REL * want.abs() + EXACT_ABS;
                if want != 0.0 {
                    worst_det_rel = worst_det_rel.max(r);
                }
                assert!(
                    (got - want).abs() <= tol,
                    "DRIFT {which} {lbl} t={t}: kshana {got:.9e} m vs Octave {want:.9e} m \
                     (|Δ|={:.2e} > {tol:.2e})",
                    (got - want).abs()
                );
                n_det += 1;
            }

            // VRW: kshana analytic must equal the fixture's analytic to float
            // precision, AND land inside the ±3% Octave Monte-Carlo band.
            assert!(
                rel(k_vrw, vrw_analytic) < EXACT_REL,
                "DRIFT {which} vrw t={t}: kshana {k_vrw:.6e} vs analytic {vrw_analytic:.6e}"
            );
            let dev = rel(k_vrw, vrw_mc);
            worst_vrw_dev = worst_vrw_dev.max(dev);
            assert!(
                dev < VRW_BAND,
                "DRIFT {which} vrw t={t}: kshana {k_vrw:.6e} m outside ±{:.0}% MC band of \
                 Octave empirical {vrw_mc:.6e} m (dev {dev:.3e})",
                VRW_BAND * 100.0
            );
            n_vrw += 1;

            // End-to-end composed drift_m RSS vs the Octave RSS (tight: the MC noise
            // enters only the VRW component, which the RSS recombines analytically).
            let r = rel(k_rss, drift_rss);
            worst_rss_rel = worst_rss_rel.max(r);
            assert!(
                r < EXACT_REL,
                "DRIFT {which} rss t={t}: kshana drift_m {k_rss:.9e} m vs Octave RSS \
                 {drift_rss:.9e} m (rel {r:.2e} > {EXACT_REL:.0e})"
            );
            n_rss += 1;
        }
    }

    // Quantity gates from the validation plan.
    assert_eq!(
        n_freier, 1,
        "expected exactly 1 Freier anchor row, got {n_freier}"
    );
    assert!(
        n_vrw >= 10,
        "expected >=10 VRW cases (2 budgets × 5 times), got {n_vrw}"
    );
    assert!(
        n_det >= 20,
        "expected >=20 deterministic component checks, got {n_det}"
    );
    assert!(
        n_rss >= 10,
        "expected >=10 end-to-end RSS checks, got {n_rss}"
    );

    eprintln!(
        "gnss_free_quantum_navigation: Freier-2016 published/SQL = {freier_ratio:.1}× \
         (in [{FREIER_RATIO_LO}×,{FREIER_RATIO_HI}×]; SQL geometry rel {worst_sql_rel:.1e}); \
         {n_det} deterministic terms (worst rel {worst_det_rel:.1e} < {EXACT_REL:.0e}); \
         {n_vrw} VRW Monte-Carlo (worst dev {:.2}% < {:.0}%) across quantum+classical budgets; \
         {n_rss} end-to-end drift_m RSS (worst rel {worst_rss_rel:.1e})",
        worst_vrw_dev * 100.0,
        VRW_BAND * 100.0,
    );
}
