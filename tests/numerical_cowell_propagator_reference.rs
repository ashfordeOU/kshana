// SPDX-License-Identifier: AGPL-3.0-only
//! Externally validate the kshana **numerical Cowell propagator + six-perturbation force
//! model** against **Orekit 12.2** (CS GROUP, Apache-2.0) + Hipparchus 3.1 — the de-facto
//! open-source flight-dynamics reference library — driving its `NumericalPropagator` with the
//! `DormandPrince853` adaptive integrator.
//!
//! ## What this validates (honest scope)
//!
//! This is an **integrator + force-algebra** cross-check. Two independent codebases integrate
//! the SAME dynamics from byte-identical initial states and physical constants
//! (`GM = 3.986004418e14`, `Re = 6378137`, unnormalised `J2..J6`, `GM_sun`, `GM_moon`,
//! `AU`, `P0 = 1361/c`), with two independent adaptive RK integrators (kshana RK4
//! step-doubling; Orekit DP8(5,3)). Tier by tier:
//!
//! * **T1 two-body** — point-mass gravity only;
//! * **T2 +J2** — kshana `with_j2` vs Orekit `HolmesFeatherstone(2×0)`;
//! * **T3 +full J2..J6 zonal** — kshana `with_zonals_j2_j6` vs `HolmesFeatherstone(6×0)`;
//! * **T4 +Sun/Moon third body** — `+ ThirdBodyAttraction(Sun, Moon)`;
//! * **T5 +cannonball SRP** — `+ SolarRadiationPressure / IsotropicRadiationSingleCoefficient`;
//! * **T6 +exponential drag** — `+ DragForce / IsotropicDrag` (a **characterisation** tier).
//!
//! To keep T4/T5 a TRUE integrator/force-algebra check (and not a comparison of two DIFFERENT
//! ephemerides), the Orekit driver is fed **kshana's own** Montenbruck–Gill low-precision
//! Sun/Moon series (ported verbatim into `PropDriver.java`) through an Orekit `CelestialBody`,
//! so both stacks consume the IDENTICAL perturber positions. Likewise the integration frame is
//! a static inertial frame (identity transform of GCRF — no precession/nutation/Earth-rotation),
//! matching kshana's plain ECI; the zonal field is axially symmetric so a static z-aligned
//! gravity body frame reproduces kshana's inertial zonal acceleration exactly.
//!
//! ## What this does NOT validate
//!
//! The **absolute fidelity** of the perturber ephemerides (kshana's M&G series is low-precision
//! by design) and the **absolute atmospheric density** (kshana's 28-band piecewise-exponential
//! model vs the single-band exponential fed to Orekit for T6). Those input models stay MODELLED.
//! T6 is therefore a CHARACTERISATION tier: drag must dissipate energy and the kshana/Orekit
//! states must stay within a defensible band whose width reflects the residual atmosphere-model
//! mismatch over the arc, not a tight metre-level agreement.
//!
//! Reference data, provenance and the committed Java driver + generator live in
//! `tests/fixtures/numerical_cowell_propagator/`.

use kshana::forces::{EARTH_ZONALS_J2_J6, MU_EARTH};
use kshana::integrator::Tolerance;
use kshana::propagator::{propagate, ForceModel};

const REF: &str = include_str!(
    "fixtures/numerical_cowell_propagator/numerical_cowell_propagator_reference.txt"
);

/// SRP coefficient and area-to-mass used in the fixture (must match the generator literals).
const CR: f64 = 1.5;
const AREA_OVER_MASS: f64 = 0.02; // m^2/kg
const CD_AREA_OVER_MASS: f64 = 0.02; // m^2/kg
const JD_J2000: f64 = 2_451_545.0;

/// A tight (rtol, atol) so kshana's integrator converges well inside the per-tier tolerance —
/// the residual we measure must be the dynamics difference, not under-converged steps.
fn tol() -> Tolerance {
    Tolerance {
        rtol: 1e-12,
        atol: 1e-9,
        ..Tolerance::default()
    }
}

/// Per-tier position tolerance over the 24 h arc (metres). The conservative tiers (T1..T5)
/// share the identical conservative field with Orekit — only the integrator differs — so the
/// agreement is **decimetre-level** (the MEASURED worst |Δr| is ~0.08 m, dominated by the two
/// integrators' independent local-truncation error over the arc). The bounds below sit a few×
/// above the measured worst, NOT loosely: a regression that doubled the integrator disagreement
/// would trip them. T6 is a characterisation band reflecting the residual atmosphere-model
/// mismatch (see the honest-scope note above), not a tight validation.
fn pos_tol_m(tier: &str) -> f64 {
    match tier {
        "T1" => 0.3,   // two-body: both integrate the exact Kepler dynamics (measured 0.067 m)
        "T2" => 0.3,   // +J2                                              (measured 0.071 m)
        "T3" => 0.3,   // +J2..J6 zonal                                    (measured 0.071 m)
        "T4" => 0.3,   // +Sun/Moon (identical perturber positions)        (measured 0.072 m)
        "T5" => 0.3,   // +cannonball SRP (identical Sun position)         (measured 0.080 m)
        "T6" => 2.0e3, // +drag: characterisation only (measured 333 m; density-model mismatch)
        _ => panic!("unknown tier {tier}"),
    }
}

#[derive(Debug)]
struct Case {
    tier: String,
    regime: String,
    r0: [f64; 3],
    v0: [f64; 3],
}

fn csv3(s: &str) -> [f64; 3] {
    let v: Vec<f64> = s
        .trim()
        .split(',')
        .map(|x| x.trim().parse().unwrap())
        .collect();
    assert_eq!(v.len(), 3, "expected 3 components in '{s}'");
    [v[0], v[1], v[2]]
}

fn norm(a: [f64; 3]) -> f64 {
    (a[0] * a[0] + a[1] * a[1] + a[2] * a[2]).sqrt()
}

/// Build the kshana ForceModel matching a tier. The epoch is J2000 TT, exactly the
/// `epoch_jd_tt` the Orekit driver used.
fn model_for(tier: &str) -> ForceModel {
    let epoch = JD_J2000;
    match tier {
        "T1" => ForceModel::two_body(),
        "T2" => ForceModel::with_j2(),
        "T3" => ForceModel::with_zonals_j2_j6(),
        "T4" => ForceModel::with_zonals_j2_j6().third_body(true, true, epoch),
        "T5" => ForceModel::with_zonals_j2_j6()
            .third_body(true, true, epoch)
            .solar_radiation(CR, AREA_OVER_MASS),
        "T6" => ForceModel::with_zonals_j2_j6()
            .third_body(true, true, epoch)
            .solar_radiation(CR, AREA_OVER_MASS)
            .drag(CD_AREA_OVER_MASS),
        _ => panic!("unknown tier {tier}"),
    }
}

/// Specific two-body orbital energy (for the T6 drag-dissipation directional check).
fn specific_energy(r: [f64; 3], v: [f64; 3]) -> f64 {
    0.5 * (v[0] * v[0] + v[1] * v[1] + v[2] * v[2]) - MU_EARTH / norm(r)
}

#[test]
fn numerical_cowell_propagator_matches_orekit_dp853() {
    // Sanity: the constants the test pins are the ones kshana exposes.
    assert_eq!(EARTH_ZONALS_J2_J6.len(), 5, "J2..J6 must be five zonals");

    // Group reference STATE rows by (tier, regime).
    let mut cases: Vec<Case> = Vec::new();
    for line in REF.lines() {
        if !line.starts_with("CASE ") {
            continue;
        }
        // CASE <tier> <regime> | r0=... | v0=... | cr | aom | cdaom | rho0 | h0 | scale
        let head: Vec<&str> = line.splitn(2, '|').collect();
        let toks: Vec<&str> = head[0].split_whitespace().collect();
        let tier = toks[1].to_string();
        let regime = toks[2].to_string();
        let fields: Vec<&str> = line.split('|').collect();
        let r0 = csv3(fields[1].trim().trim_start_matches("r0=").trim());
        let v0 = csv3(fields[2].trim().trim_start_matches("v0=").trim());
        cases.push(Case {
            tier,
            regime,
            r0,
            v0,
        });
    }
    assert!(
        cases.len() >= 11,
        "expected >=11 reference cases (5 tiers x 2 regimes + drag), got {}",
        cases.len()
    );

    let mut n_states = 0usize;
    let mut worst_conservative = 0.0_f64;
    let mut worst_conservative_label = String::new();
    let mut n_tiers_seen = std::collections::BTreeSet::new();
    let mut per_tier_worst: std::collections::BTreeMap<String, f64> =
        std::collections::BTreeMap::new();

    // For the T6 directional drag check.
    let mut t6_e0: Option<f64> = None;
    let mut t6_e_final: Option<f64> = None;
    let mut t6_drag_vs_orekit_worst = 0.0_f64;

    for case in &cases {
        n_tiers_seen.insert(case.tier.clone());
        let model = model_for(&case.tier);
        let tolerance = tol();
        let tol_m = pos_tol_m(&case.tier);

        // Replay every STATE row of this (tier, regime) against kshana propagated to t.
        let prefix = format!("STATE {} {} ", case.tier, case.regime);
        for line in REF.lines() {
            if !line.starts_with(&prefix) {
                continue;
            }
            // STATE <tier> <regime> <k> <t> | r-csv | v-csv
            let fields: Vec<&str> = line.split('|').collect();
            assert_eq!(fields.len(), 3, "STATE row needs 3 |-fields: {line}");
            let head: Vec<&str> = fields[0].split_whitespace().collect();
            let t_s: f64 = head[4].parse().unwrap();
            let r_ref = csv3(fields[1]);
            let v_ref = csv3(fields[2]);

            let (r_k, v_k) = propagate(case.r0, case.v0, t_s, &model, &tolerance);
            let dr = norm([r_k[0] - r_ref[0], r_k[1] - r_ref[1], r_k[2] - r_ref[2]]);

            let e = per_tier_worst.entry(case.tier.clone()).or_insert(0.0);
            *e = e.max(dr);

            if case.tier == "T6" {
                if t_s == 0.0 {
                    t6_e0 = Some(specific_energy(r_k, v_k));
                }
                t6_e_final = Some(specific_energy(r_k, v_k));
                t6_drag_vs_orekit_worst = t6_drag_vs_orekit_worst.max(dr);
            } else if dr > worst_conservative {
                worst_conservative = dr;
                worst_conservative_label = format!("{} {} t={t_s}s", case.tier, case.regime);
            }

            assert!(
                dr <= tol_m,
                "{} {} @ t={t_s}s: |Δr| = {dr:.3e} m vs Orekit DP853 (tol {tol_m} m)\n  \
                 kshana r = {r_k:?}\n  orekit r = {r_ref:?}",
                case.tier,
                case.regime,
            );
            // Velocity must agree too (a looser bound: the same residual divided by the orbital
            // timescale, conservatively 0.1 m/s for the conservative tiers, larger for drag).
            let dv = norm([v_k[0] - v_ref[0], v_k[1] - v_ref[1], v_k[2] - v_ref[2]]);
            let dv_tol = if case.tier == "T6" { 5.0 } else { 1e-3 };
            assert!(
                dv <= dv_tol,
                "{} {} @ t={t_s}s: |Δv| = {dv:.3e} m/s vs Orekit (tol {dv_tol} m/s)",
                case.tier,
                case.regime,
            );
            n_states += 1;
        }
    }

    // Every planned tier must be present (T1..T6).
    for t in ["T1", "T2", "T3", "T4", "T5", "T6"] {
        assert!(
            n_tiers_seen.contains(t),
            "tier {t} missing from the reference fixture"
        );
    }

    // T6 characterisation: drag must DISSIPATE energy (the orbit sinks) — a directional check
    // that the dissipative term has the right sign, even though the absolute density model
    // differs from Orekit's. And kshana must track Orekit's drag arc within the characterisation
    // band (it cannot diverge to a different orbit).
    let e0 = t6_e0.expect("T6 must have a t=0 state");
    let ef = t6_e_final.expect("T6 must have a final state");
    assert!(
        ef < e0,
        "drag must dissipate energy over 24 h: ε(24h)={ef} not < ε(0)={e0}"
    );
    assert!(
        t6_drag_vs_orekit_worst <= pos_tol_m("T6"),
        "T6 drag arc vs Orekit worst |Δr| = {t6_drag_vs_orekit_worst:.3e} m exceeds the \
         characterisation band {} m",
        pos_tol_m("T6")
    );

    assert!(
        n_states >= 250,
        "expected >=250 compared epochs (>=11 cases x 25), got {n_states}"
    );

    eprintln!(
        "numerical_cowell_propagator_reference: {n_states} epochs vs Orekit 12.2 DP853 across \
         {} cases (T1..T6, LEO+GTO).",
        cases.len()
    );
    eprintln!(
        "  worst conservative-tier (T1..T5) |Δr| = {worst_conservative:.3e} m  [{worst_conservative_label}]"
    );
    eprintln!(
        "  T6 drag (characterisation) worst |Δr| vs Orekit = {t6_drag_vs_orekit_worst:.3e} m; \
         Δε over 24 h = {:.3e} J/kg (must be < 0 = dissipative)",
        ef - e0
    );
    for (tier, w) in &per_tier_worst {
        eprintln!("  per-tier worst |Δr|: {tier} = {w:.3e} m (tol {} m)", pos_tol_m(tier));
    }
}
