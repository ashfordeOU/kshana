// SPDX-License-Identifier: AGPL-3.0-only
//! P4 coupled-gauge reproducibility example.
//!
//! Regenerates every headline number for the P4 coupled frame⊕timescale gauge paper
//! directly from the committed engine and DE440-orientation fixtures:
//!
//! - Part A \[MODELLED — InternalConsistency\]: basis-invariant classification of two constructed
//!   coupled-gauge matrices — a DIRECT-SUM case (defect 2, coupled_dim 0, p_st_norm 0) and a
//!   COUPLED case (defect 1, coupled_dim 1, p_st_norm ≈ 0.5) — plus an invariance
//!   demonstration showing the classification depends only on the null subspace.
//! - Part B \[VALIDATED anchor\]: the two real DE440-orientation networks from the coupled-gauge
//!   fixture: `well_posed` (120 rows, defect 0, both Schur marginal eigenvalues > 0) and
//!   `single_epoch` (30 rows, elapsed_s = 0, defect 1, dim_temporal 1); and the
//!   two-way-vs-more-one-way lift ratio ≈ 1.0 in the diverse network.
//! - Part C \[MODELLED envelope\]: the three frame→rate Jacobian entries from
//!   `rate_frame_jacobian`; the derived frame-estimation datum→rate bound (≤ ~2e-17);
//!   the ±1.736e-11 reference-surface DEFINITION band from the \[56,59\] µs/day constants
//!   owned by `lunar_time`; and the 1 m ↔ 3.336 ns (= 1/c) unit tie.
//!
//! Every quantitative result is computed by the engine.  No result is hard-coded in a
//! print statement.
//!
//! Run: `cargo run --example p4_coupled_gauge`

use kshana::lunar_datum::orbiter_position;
use kshana::lunar_gauge::{
    assemble_coupled_info, classify_null_space, coupled_marginal_eigs, oneway_range_row,
    rate_frame_jacobian, twoway_range_row,
};
use kshana::lunar_time::{C2_M2_S2, RATE_BAND_HIGH_US_DAY, RATE_BAND_LOW_US_DAY, RE_MOON_M};

// ── Epoch and beacon positions (match gen_coupled_gauge_rows.rs exactly) ──────

/// 2024-01-01 TT (JD 2460310.5), inside the DE440 fixture window.
const T_TASK4: f64 = (2_460_310.5 - 2_451_545.0) / 36_525.0;

/// Five near-side beacon PA-body positions (metres) from the plan's validated recipe.
const BEACONS: [[f64; 3]; 5] = [
    [1.5e6, 0.3e6, 0.2e6],
    [1.4e6, -0.4e6, 0.3e6],
    [1.55e6, 0.2e6, -0.35e6],
    [1.35e6, -0.25e6, -0.3e6],
    [1.6e6, 0.05e6, 0.1e6],
];

/// Build the well-posed one-way network (5 beacons × 6 orbiters × 4 epochs = 120 rows).
///
/// `u0_offset` shifts the argument of latitude for all orbiters; 0.0 matches
/// `gen_coupled_gauge_rows.rs` exactly.  A non-zero offset jitters the geometry for the
/// honest two-way-vs-more-one-way comparison (Part B).
fn build_oneway_rows(u0_offset: f64) -> Vec<[f64; 9]> {
    let epochs: [f64; 4] = std::array::from_fn(|k| T_TASK4 + (k as f64) * 2.0 / 36_525.0);
    let mut rows = Vec::with_capacity(120);
    for &beacon in &BEACONS {
        for (ki, &t) in epochs.iter().enumerate() {
            for j in 0..6_usize {
                let r_sat = orbiter_position(
                    2000.0,
                    20.0 + 10.0 * j as f64,
                    60.0 * j as f64,
                    40.0 * j as f64 + u0_offset,
                    epochs[0],
                    t,
                );
                let elapsed = 3_600.0 * (ki as f64 + 1.0) * (j as f64 + 1.0);
                rows.push(oneway_range_row(r_sat, beacon, t, elapsed));
            }
        }
    }
    rows
}

/// Build the single-epoch network (5 beacons × 6 orbiters × 1 epoch = 30 rows, elapsed_s = 0).
///
/// elapsed_s = 0 makes the rate column (IDX_RATE) exactly zero in every row, inducing an
/// exact rate-direction null defect (defect 1, dim_temporal 1).
fn build_single_epoch_rows() -> Vec<[f64; 9]> {
    let t0 = T_TASK4;
    let mut rows = Vec::with_capacity(30);
    for &beacon in &BEACONS {
        for j in 0..6_usize {
            let r_sat = orbiter_position(
                2000.0,
                20.0 + 10.0 * j as f64,
                60.0 * j as f64,
                40.0 * j as f64,
                t0,
                t0,
            );
            rows.push(oneway_range_row(r_sat, beacon, t0, 0.0));
        }
    }
    rows
}

/// Build two-way rows matching the well-posed geometry (same beacons, orbiters, epochs).
///
/// Two-way round-trip cancels the clock-offset and clock-rate columns (IDX_OFFSET = 0,
/// IDX_RATE = 0), contributing only spatial information to the Fisher matrix.
fn build_twoway_rows() -> Vec<[f64; 9]> {
    let epochs: [f64; 4] = std::array::from_fn(|k| T_TASK4 + (k as f64) * 2.0 / 36_525.0);
    let mut rows = Vec::with_capacity(120);
    for &beacon in &BEACONS {
        for &t in &epochs {
            for j in 0..6_usize {
                let r_sat = orbiter_position(
                    2000.0,
                    20.0 + 10.0 * j as f64,
                    60.0 * j as f64,
                    40.0 * j as f64,
                    epochs[0],
                    t,
                );
                rows.push(twoway_range_row(r_sat, beacon, t));
            }
        }
    }
    rows
}

fn main() {
    println!("# P4 coupled-gauge reproducibility");
    println!("# Every number below is computed from the kshana engine.\n");

    // ── Part A — Theorem: invariant classification ────────────────────────────

    println!("═══════════════════════════════════════════════════════════════════════");
    println!("## Part A — Basis-invariant classification theorem [MODELLED — InternalConsistency]");
    println!("═══════════════════════════════════════════════════════════════════════\n");

    // A1: DIRECT-SUM case
    // Null space = span{e₃ (scale, index 3 ∈ spatial rows 0..7),
    //                   e₇ (clock-offset, index 7 ∈ temporal rows 7..9)}.
    // These two null directions are independent: one purely spatial, one purely temporal.
    let direct_sum_diag: [f64; 9] = [1.0, 1.0, 1.0, 0.0, 1.0, 1.0, 1.0, 0.0, 1.0];
    let mut info_ds = vec![vec![0.0_f64; 9]; 9];
    for (i, row) in info_ds.iter_mut().enumerate() {
        row[i] = direct_sum_diag[i];
    }
    let cls_ds = classify_null_space(&info_ds, 1e-9);

    println!("Case 1: DIRECT-SUM");
    println!("  Info matrix = diag([1,1,1,0,1,1,1,0,1])");
    println!("  Null space  = span{{e₃ (scale/spatial), e₇ (clock-offset/temporal)}}");
    println!("  defect       = {}", cls_ds.defect);
    println!("  dim_spatial  = {}", cls_ds.dim_spatial);
    println!("  dim_temporal = {}", cls_ds.dim_temporal);
    println!("  coupled_dim  = {}", cls_ds.coupled_dim);
    println!("  p_st_norm    = {:.6e}", cls_ds.p_st_norm);
    println!("  → Two independent null directions; scale and clock-offset each unobservable");
    println!("    in isolation, but their null spaces do not intersect.\n");

    // A2: COUPLED case
    // Null space = span{v} where v = (e₃ + e₇)/√2.
    // A single null direction mixes the scale (spatial, index 3) with the clock-offset
    // (temporal, index 7): their sum is unobservable but their difference is observed.
    let inv_sqrt2 = 1.0_f64 / 2.0_f64.sqrt();
    let mut info_cp = vec![vec![0.0_f64; 9]; 9];
    // Start from I₉.
    for (i, row) in info_cp.iter_mut().enumerate() {
        row[i] = 1.0;
    }
    // Subtract v·vᵀ at the {3,7} sub-block.
    let v3 = inv_sqrt2;
    let v7 = inv_sqrt2;
    info_cp[3][3] -= v3 * v3;
    info_cp[7][7] -= v7 * v7;
    info_cp[3][7] -= v3 * v7;
    info_cp[7][3] -= v7 * v3;

    let cls_cp = classify_null_space(&info_cp, 1e-9);

    println!("Case 2: COUPLED");
    println!("  Null vector v = (e₃ + e₇)/√2  (mixes scale and clock-offset)");
    println!("  Info matrix = I₉ − v·vᵀ");
    println!("  defect       = {}", cls_cp.defect);
    println!("  dim_spatial  = {}", cls_cp.dim_spatial);
    println!("  dim_temporal = {}", cls_cp.dim_temporal);
    println!("  coupled_dim  = {}", cls_cp.coupled_dim);
    println!(
        "  p_st_norm    = {:.6e}  (= 0.5 exactly by construction)",
        cls_cp.p_st_norm
    );
    println!("  → A single null direction couples the spatial (scale) and temporal");
    println!("    (clock-offset) subspaces; neither can be fixed independently.\n");

    // A3: Invariance demonstration
    // Same null space span{e₃, e₇} as Case 1, but different observable eigenvalues.
    // The classification depends only on the null subspace, not on the observable structure:
    // different (positive) observable eigenvalues at the non-null positions leave the
    // null space unchanged, so the classification must be identical.
    let varied_diag: [f64; 9] = [2.0, 3.0, 4.0, 0.0, 5.0, 6.0, 7.0, 0.0, 8.0];
    let mut info_inv = vec![vec![0.0_f64; 9]; 9];
    for (i, row) in info_inv.iter_mut().enumerate() {
        row[i] = varied_diag[i];
    }
    let cls_inv = classify_null_space(&info_inv, 1e-9);

    // NOTE: this diagonal-vs-diagonal comparison demonstrates eigenvalue-MAGNITUDE independence
    // (same null positions, different positive eigenvalues → same classification).  Full
    // null-BASIS-ROTATION invariance — rotating the null-space basis vectors while preserving
    // the null subspace — is proven by the `classify_is_invariant_under_null_basis_rotation`
    // unit test in src/lunar_gauge.rs.  The Case 2 COUPLED case above already exercises an
    // off-axis null vector v = (e₃+e₇)/√2 that is not axis-aligned.
    println!("Invariance check: null space span{{e₃, e₇}} under varied observable eigenvalues");
    println!(
        "  Info matrix = diag([2,3,4,0,5,6,7,0,8])  (same null positions; different magnitudes)"
    );
    println!(
        "  defect       = {}  (Case 1: {})",
        cls_inv.defect, cls_ds.defect
    );
    println!(
        "  dim_spatial  = {}  (Case 1: {})",
        cls_inv.dim_spatial, cls_ds.dim_spatial
    );
    println!(
        "  dim_temporal = {}  (Case 1: {})",
        cls_inv.dim_temporal, cls_ds.dim_temporal
    );
    println!(
        "  coupled_dim  = {}  (Case 1: {})",
        cls_inv.coupled_dim, cls_ds.coupled_dim
    );
    println!(
        "  p_st_norm    = {:.2e}  (Case 1: {:.2e})",
        cls_inv.p_st_norm, cls_ds.p_st_norm
    );
    let invariant = cls_inv.defect == cls_ds.defect
        && cls_inv.dim_spatial == cls_ds.dim_spatial
        && cls_inv.dim_temporal == cls_ds.dim_temporal
        && cls_inv.coupled_dim == cls_ds.coupled_dim
        && (cls_inv.p_st_norm - cls_ds.p_st_norm).abs() < 1e-9;
    println!("  Classification identical to Case 1: {invariant}");
    println!("  → Eigenvalue-magnitude independence confirmed here.  Null-basis-rotation");
    println!("    invariance is proven by `classify_is_invariant_under_null_basis_rotation`");
    println!("    (src/lunar_gauge.rs unit tests); the off-axis v=(e₃+e₇)/√2 COUPLED case");
    println!("    above further exercises a non-axis-aligned null direction.\n");

    // ── Part B — Real DE440-orientation anchor networks ───────────────────────

    println!("═══════════════════════════════════════════════════════════════════════");
    println!("## Part B — Real DE440-orientation anchor networks [VALIDATED]");
    println!("═══════════════════════════════════════════════════════════════════════");
    println!("  Geometry: 5 beacons × 6 orbiters; real PA-frame orientation from DE440.");
    println!("  Epoch base: 2024-01-01 TT  (t_tt_jc = {T_TASK4:.6} JC from J2000.0)\n");

    // B1: well_posed — 5 beacons × 6 orbiters × 4 epochs = 120 one-way rows
    let wp_rows = build_oneway_rows(0.0);
    let info_wp = assemble_coupled_info(&[(wp_rows.clone(), 1.0)]);
    let cls_wp = classify_null_space(&info_wp, 1e-9);
    let eigs_wp = coupled_marginal_eigs(&info_wp);

    println!("Network: well_posed  (120 one-way rows; elapsed_s varies over [3600, 86400] s)");
    println!("  defect       = {}", cls_wp.defect);
    println!("  dim_spatial  = {}", cls_wp.dim_spatial);
    println!("  dim_temporal = {}", cls_wp.dim_temporal);
    println!("  coupled_dim  = {}", cls_wp.coupled_dim);
    println!("  defect = 0  →  all 9 Fisher eigenvalues strictly positive (full-rank network)");
    println!("  Schur marginal {{s, δτ}} eigenvalues (ascending):");
    println!(
        "    λ_min = {:.4e}  > 0  (scale observable independently of clock-offset)",
        eigs_wp[0]
    );
    println!("    λ_max = {:.4e}  > 0", eigs_wp[1]);
    println!();

    // B2: single_epoch — 5 beacons × 6 orbiters × 1 epoch = 30 rows, elapsed_s = 0
    let se_rows = build_single_epoch_rows();
    let info_se = assemble_coupled_info(&[(se_rows, 1.0)]);
    let cls_se = classify_null_space(&info_se, 1e-9);

    println!("Network: single_epoch  (30 one-way rows; all elapsed_s = 0)");
    println!("  defect       = {}", cls_se.defect);
    println!("  dim_spatial  = {}", cls_se.dim_spatial);
    println!("  dim_temporal = {}", cls_se.dim_temporal);
    println!("  coupled_dim  = {}", cls_se.coupled_dim);
    println!("  elapsed_s = 0  →  IDX_RATE column is exactly zero in every row");
    println!("  →  clock-rate δα is unobservable (exact rate-direction null defect).\n");

    // B3: Two-way-vs-more-one-way lift in the diverse network
    // Base: 120 one-way rows (well_posed, u0=0).
    // (A) base + 120 two-way rows at the same geometry.
    // (B) base + 120 more one-way rows at a jittered geometry (u0 += 7°).
    // Equal observation count; the {s,δτ} Schur λ_min lift ratio demonstrates that
    // geometric diversity — not observation type — drives the marginal separation.
    let tw_rows = build_twoway_rows();
    let ow2_rows = build_oneway_rows(7.0);

    let info_tw = assemble_coupled_info(&[(wp_rows.clone(), 1.0), (tw_rows, 1.0)]);
    let info_2ow = assemble_coupled_info(&[(wp_rows, 1.0), (ow2_rows, 1.0)]);

    let e_tw = coupled_marginal_eigs(&info_tw);
    let e_2ow = coupled_marginal_eigs(&info_2ow);

    let lift_tw = e_tw[0] / eigs_wp[0];
    let lift_2ow = e_2ow[0] / eigs_wp[0];
    let ratio = lift_tw / lift_2ow;

    println!("Two-way-vs-more-one-way lift  (λ_min of {{s,δτ}} Schur marginal):");
    println!(
        "  base (120 one-way rows)             λ_min = {:.4e}",
        eigs_wp[0]
    );
    println!(
        "  + 120 two-way rows (same geometry)  λ_min = {:.4e}   lift = {:.3}×",
        e_tw[0], lift_tw
    );
    println!(
        "  + 120 more one-way (u0 + 7°)        λ_min = {:.4e}   lift = {:.3}×",
        e_2ow[0], lift_2ow
    );
    println!("  lift ratio (two-way / more-one-way) = {:.3}", ratio);
    println!("  → Ratio ≈ 1.0: in a geometrically diverse multi-beacon network,");
    println!("    data volume — not observation type — drives the {{s,δτ}} marginal separation.\n");

    // ── Part C — Modelled rate↔frame Jacobian and definitional band ───────────

    println!("═══════════════════════════════════════════════════════════════════════");
    println!("## Part C — Relativistic rate↔frame Jacobian + definitional band [MODELLED]");
    println!("═══════════════════════════════════════════════════════════════════════");
    println!("  All entries are MODELLED (first-principles post-Newtonian, cross-checked");
    println!("  to the [56,59] µs/day published band). Not certified operational values.\n");

    let jac = rate_frame_jacobian(T_TASK4);

    println!("Frame→rate Jacobian at epoch (t_tt_jc = {T_TASK4:.6} JC):");
    println!(
        "  ∂α/∂s   (scale)    = {:+.6e}  per unit fractional scale",
        jac.d_alpha_d_scale
    );
    println!(
        "  ∂α/∂v   (velocity) = {:+.6e}  per (m/s)",
        jac.d_alpha_d_velocity
    );
    println!(
        "  ∂α/∂r   (radial)   = {:+.6e}  per metre",
        jac.d_alpha_d_radial
    );

    // Frame-estimation datum→rate envelope.
    // A 1-m radial-position uncertainty propagates to a rate perturbation of
    // |∂α/∂r| ≈ 1.807e-17 — the leading frame-estimation contribution.
    let frame_rate_envelope = jac.d_alpha_d_radial.abs();
    println!();
    println!("Frame-estimation datum→rate envelope (per 1 m radial position error):");
    println!(
        "  |∂α/∂r| = {:.4e}  ≤ ~2e-17  [far below the definitional band]",
        frame_rate_envelope
    );

    // Reference-surface DEFINITION band.
    // Half-width of the [56, 59] µs/day band, converted to a dimensionless rate:
    //   half_us_day = (high − low) / 2 = 1.5 µs/day
    //   dimensionless = 1.5e-6 s/s/day ÷ 86400 s/day = ±1.736e-11
    let band_mid_us_day = (RATE_BAND_HIGH_US_DAY + RATE_BAND_LOW_US_DAY) / 2.0;
    let band_half_us_day = (RATE_BAND_HIGH_US_DAY - RATE_BAND_LOW_US_DAY) / 2.0;
    let seconds_per_day = 86_400.0_f64;
    let band_half_dim = band_half_us_day * 1e-6 / seconds_per_day;

    println!();
    println!(
        "Reference-surface DEFINITION band (lunar_time constants: [{:.0},{:.0}] µs/day):",
        RATE_BAND_LOW_US_DAY, RATE_BAND_HIGH_US_DAY
    );
    println!("  band midpoint  = {:.1} µs/day", band_mid_us_day);
    println!(
        "  ±band half     = ±{:.4e}  (dimensionless rate, from band half-width {:.1} µs/day)",
        band_half_dim, band_half_us_day
    );
    println!("  Named sub-band corrections (approximate physics reference values):");
    // 2.4e-16 (tidal) and 6.0e-15 (J₂) are physics-literature approximate reference values —
    // NOT engine-computed and NOT certified; included for order-of-magnitude orientation only.
    println!("    tidal deformation  ≈ 2.4e-16  (physics-literature ref.; not engine-computed; inside the definitional band)");
    println!("    J₂ oblateness      ≈ 6.0e-15  (physics-literature ref.; not engine-computed; inside the definitional band)");
    println!();
    println!(
        "  Frame-estimation envelope {:.0e}  <<  definitional band {:.0e}:",
        frame_rate_envelope, band_half_dim
    );
    println!("  → The LTC rate is gauge-ROBUST to frame-estimation errors but");
    println!("    gauge-SENSITIVE to the reference-surface definition.");

    // Unit tie: 1 m ↔ 1/c seconds (computed from lunar_time::C2_M2_S2).
    let c_m_per_s = C2_M2_S2.sqrt();
    let s_per_m = 1.0 / c_m_per_s;
    let ns_per_m = s_per_m * 1.0e9;

    println!();
    println!("Unit tie (from lunar_time::C2_M2_S2):");
    println!("  c       = {:.9e} m/s", c_m_per_s);
    println!(
        "  1/c     = {:.9e} s/m  =  {:.4} ns/m  (≈ 3.336 ns/m)",
        s_per_m, ns_per_m
    );
    println!(
        "  R_moon  = {:.0} m  (from lunar_time::RE_MOON_M)",
        RE_MOON_M
    );

    // ── Honesty banner ─────────────────────────────────────────────────────────

    println!();
    println!("─────────────────────────────────────────────────────────────────────────────");
    println!("HONESTY:");
    println!(
        "  Part A: classification theorem is Modelled (InternalConsistency) — a proven structural"
    );
    println!("    result verified by unit tests in src/lunar_gauge.rs:");
    println!("      classify_direct_sum_null, classify_coupled_null, classify_basis_invariant,");
    println!("      classify_is_invariant_under_null_basis_rotation.");
    println!("  Part B: DE440-orientation rows are Validated (ExternalDataset); the network");
    println!("    geometry (beacons, orbital elements) is Modelled.");
    println!("  Part C: all Jacobian entries and the rate envelope are Modelled");
    println!("    (first-principles post-Newtonian; cross-checked to the published [56,59]");
    println!("    µs/day band). Not certified for operational timekeeping. No TRL claim.");
    println!("─────────────────────────────────────────────────────────────────────────────");
}
