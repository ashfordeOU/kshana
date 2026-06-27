// SPDX-License-Identifier: AGPL-3.0-only
//! Externally validate the gravity-gradient disturbance-torque sub-claim of the
//! 3-DOF attitude / pointing error budget against an **independent third-party
//! authority**: Orekit 12.2 + Hipparchus 3.1 (CS GROUP / Hipparchus, Apache-2.0).
//!
//! THE QUANTITY: worst-case gravity-gradient disturbance-torque magnitude
//! `|T_max|` (N·m) as a function of (altitude, ΔI = |I_max − I_min|). kshana
//! ships the scalar peak closed form
//!     `|T_max| = (3/2)·(μ/R³)·|I_max − I_min|`
//! (`attitude_budget::gravity_gradient_torque_max`), the analytic maximum over
//! attitude of the rigid-body gravity-gradient torque.
//!
//! WHY THE ORACLE IS INDEPENDENT: the Orekit driver does NOT use that closed
//! form. It evaluates the FULL TENSOR torque `T = (3μ/R³)·(n̂ × (I·n̂))` with
//! Hipparchus `Vector3D`/`RealMatrix` linear algebra on a diagonal principal-
//! inertia tensor and then NUMERICALLY MAXIMISES `|T|` over a dense sweep of the
//! nadir direction in the body frame. The numeric peak of the tensor expression
//! comes from a different code path (matrix-vector product + cross product +
//! brute-force search) than kshana's `(3/2)` scalar form, so agreement
//! corroborates kshana's *peak-attitude claim* externally — it is not a
//! self-consistency tautology. (μ and the geocentric radius are pinned to
//! kshana's exact constants per the verification plan, so the comparison isolates
//! the torque physics; Orekit's WGS84 constants happen to equal them.)
//!
//! PUBLISHED CROSS-LIST: the closed form is the textbook one — Wertz (SMAD
//! lineage) and Sidi, "Spacecraft Dynamics and Control" (Cambridge, 1997),
//! `T_gg = (3/2)(μ/R_c³)|I_z − I_y| sin 2θ`, peak at θ = 45°. The published LEO
//! coefficient `(3/2)(μ/R³)` is O(1e-6) s⁻²; every reference row sits in that
//! published band, asserted below as an order-of-magnitude cross-check.
//!
//! HONEST SCOPE: this validates the gravity-gradient TORQUE sub-claim (magnitude
//! and peak attitude) ONLY. The RSS pointing-error budget (quadrature sum of 1σ
//! contributors) stays MODELLED — it has no external oracle here and is covered
//! by the module's own unit tests.
//!
//! Reference data, provenance and the committed generator + Java driver live in
//! `tests/fixtures/3_dof_attitude_pointing_error_budget/`.

use kshana::attitude_budget::gravity_gradient_torque_max;

const REF: &str =
    include_str!("fixtures/3_dof_attitude_pointing_error_budget/attitude_gg_torque_reference.txt");

/// Relative tolerance. Both sides are the same physical peak; kshana evaluates it
/// in closed form, the oracle by numerically maximising the tensor cross product,
/// so the residual is dominated by the oracle's brute-force search resolution.
/// 1e-9 is far tighter than the planned 1e-6 fallback and reflects the measured
/// sub-ppb agreement; a tiny absolute floor guards near-zero magnitudes.
const REL_TOL: f64 = 1e-9;
const ABS_TOL: f64 = 1e-18; // N·m

fn approx(got: f64, want: f64) -> bool {
    (got - want).abs() <= REL_TOL * want.abs() + ABS_TOL
}

#[test]
fn gravity_gradient_torque_matches_orekit_tensor_numeric_max() {
    let mut n = 0usize;
    let mut worst_rel = 0.0_f64;
    for line in REF.lines() {
        if !line.starts_with("GG ") {
            continue;
        }
        // GG name | altitude_km | delta_inertia_kg_m2 | T_max_Nm
        let parts: Vec<&str> = line.splitn(4, '|').collect();
        assert_eq!(parts.len(), 4, "GG row needs 4 |-fields: {line}");
        let name = parts[0].trim_start_matches("GG").trim();
        let altitude_km: f64 = parts[1].trim().parse().unwrap();
        let delta_inertia: f64 = parts[2].trim().parse().unwrap();
        let t_max_want: f64 = parts[3].trim().parse().unwrap();

        // kshana takes altitude in METRES.
        let t_max_got = gravity_gradient_torque_max(altitude_km * 1000.0, delta_inertia);

        let rel = (t_max_got - t_max_want).abs() / t_max_want.abs();
        worst_rel = worst_rel.max(rel);
        assert!(
            approx(t_max_got, t_max_want),
            "GG {name}: kshana {t_max_got:.15e} N·m vs Orekit-tensor {t_max_want:.15e} N·m \
             (rel={rel:.2e} > {REL_TOL:.0e})",
        );

        // Published (Wertz/Sidi) order-of-magnitude cross-check: the LEO gravity-
        // gradient coefficient (3/2)(μ/R³) is O(1e-6) s⁻², so for ΔI in [1,100]
        // kg·m² the peak torque is firmly in [1e-7, 1e-3] N·m. This brackets the
        // textbook magnitude without re-deriving the value.
        assert!(
            (1e-7..=1e-3).contains(&t_max_got),
            "GG {name}: T_max {t_max_got:.3e} N·m outside published LEO band [1e-7, 1e-3]",
        );

        n += 1;
    }
    assert!(
        n >= 8,
        "expected >=8 gravity-gradient reference cases, got {n}"
    );
    eprintln!(
        "attitude_gg_torque_reference: {n} cases vs Orekit/Hipparchus tensor numeric max, \
         worst rel = {worst_rel:.3e} (cross-listed vs Wertz/Sidi O(1e-6) s⁻² coefficient)"
    );
}
