// SPDX-License-Identifier: AGPL-3.0-only
//! Representative multi-technique lunar datum-measurement menu + additive Fisher
//! combiner (**Modelled**).
//!
//! Provides a representative menu of candidate measurement campaigns for the lunar
//! datum problem — each holding a 7×7 Fisher information contribution and a scalar
//! relative cost — plus the additive combination rule for their information. The
//! budget-constrained *design optimizer* that consumes this menu (greedy / exact
//! subset selection and the cost/degeneracy trade frontier) is a commercial
//! (kshana-pro) capability and is not part of this open crate.
//!
//! All beacon locations, orbiter geometry, per-technique precisions, and relative
//! costs are representative choices, not mission values (see
//! `tests/fixtures/llr_geometry/NOTICE.md`); every degeneracy metric and CRLB figure
//! inherits the **Modelled** status from `crate::lunar_identifiability::decompose`.

/// One candidate measurement campaign for the datum experiment-design problem.
///
/// `info` is its 7×7 Fisher information contribution (already preconditioned via
/// [`crate::lunar_identifiability::assemble_multi_info`]); `cost` is a
/// caller-defined relative cost (**Modelled**).
#[derive(Clone, Debug)]
pub struct MeasurementBlock {
    pub label: String,
    pub info: Vec<Vec<f64>>,
    pub cost: f64,
}

/// Convenience: build a block from raw datum-Jacobian rows + a noise sigma + a cost.
///
/// Uses [`crate::lunar_identifiability::assemble_multi_info`] so the block's info
/// is preconditioned identically to every other block.
pub fn block_from_rows(
    label: &str,
    rows: Vec<[f64; 7]>,
    sigma: f64,
    cost: f64,
) -> MeasurementBlock {
    let info = crate::lunar_identifiability::assemble_multi_info(&[(rows, sigma)]);
    MeasurementBlock {
        label: label.to_string(),
        info,
        cost,
    }
}

/// Sum the 7×7 `info` of the chosen blocks (zero matrix if none).
///
/// Fisher information is additive across independent measurements; this is the
/// correct combination rule for blocks built via `assemble_multi_info`.
pub fn combine(blocks: &[MeasurementBlock], chosen: &[usize]) -> Vec<Vec<f64>> {
    let mut combined = vec![vec![0.0_f64; 7]; 7];
    for &idx in chosen {
        for (i, row) in blocks[idx].info.iter().enumerate() {
            for (j, &v) in row.iter().enumerate() {
                combined[i][j] += v;
            }
        }
    }
    combined
}

/// Build a representative menu of measurement campaigns for the lunar datum problem.
///
/// **MODELLED:** beacon locations, orbiter geometry, per-technique precisions, and
/// relative costs are representative choices, not mission values (see
/// `tests/fixtures/llr_geometry/NOTICE.md`). Returns four blocks:
/// - `"LLR"` — baseline; establishes observability but does NOT break the X↔scale pair.
/// - `"VLBI-limb"` — limb beacon at selenographic lon ~60°; breaks degeneracy
///   transversely (Y-direction, Schur monotonicity).
/// - `"Orbiter-nearside"` — orbiter ranging to a near-side beacon.
/// - `"Orbiter-farside"` — orbiter ranging to a far-side beacon (negative body-frame X);
///   the primary radial-diversity breaker for the X↔scale degeneracy.
pub fn representative_lunar_menu() -> Vec<MeasurementBlock> {
    const R: f64 = 1_737_400.0_f64;
    let t0 = (2_460_310.5_f64 - 2_451_545.0) / 36_525.0;
    let step_jc = 6.0 / (24.0 * 36_525.0);
    // ≈ 1 synodic month (29.5 d) at 6 h cadence; same schedule as the B3 demo.
    let n_steps = (29.5_f64 * 24.0 / 6.0).ceil() as usize + 1;

    // ── LLR block (baseline; established infrastructure) ────────────────────
    let (llr_rows, _) = crate::lunar_identifiability::llr_datum_rows(0.003, t0, 29.5, 6.0);
    let llr_block = block_from_rows("LLR", llr_rows, 0.003, 1.0);

    // ── VLBI-limb block (transverse content; limb beacon lon ~60°) ──────────
    let beacon_vlbi: [f64; 3] = [0.5 * R, 0.866 * R, 0.0];
    let st1 = crate::lunar_llr_geometry::stations()[1]; // APOLLO
    let st2 = crate::lunar_llr_geometry::stations()[0]; // Grasse (long transatlantic baseline)
    let mut vlbi_rows: Vec<[f64; 7]> = Vec::new();
    for k in 0..n_steps {
        let t = t0 + k as f64 * step_jc;
        let r_moon = crate::ephem::moon_position(t);
        let r_b = crate::lunar_llr_geometry::reflector_inertial(beacon_vlbi, t);
        // Earth-facing gate: beacon must be on the hemisphere facing Earth.
        let earth_facing = (r_b[0] - r_moon[0]) * (-r_moon[0])
            + (r_b[1] - r_moon[1]) * (-r_moon[1])
            + (r_b[2] - r_moon[2]) * (-r_moon[2]);
        if earth_facing <= 0.0 {
            continue;
        }
        let jd_ut1 = t * 36_525.0 + 2_451_545.0;
        vlbi_rows.push(crate::lunar_datum::vlbi_row_datum7(
            &st1,
            &st2,
            beacon_vlbi,
            t,
            jd_ut1,
        ));
    }
    let vlbi_block = block_from_rows("VLBI-limb", vlbi_rows, 1e-11, 3.0);

    // ── Orbiter-nearside block (radial diversity, near hemisphere) ───────────
    let beacon_near: [f64; 3] = [0.9 * R, 0.2 * R, 0.2 * R];
    let mut orb_near_rows: Vec<[f64; 7]> = Vec::new();
    for k in 0..n_steps {
        let t = t0 + k as f64 * step_jc;
        let r_moon = crate::ephem::moon_position(t);
        let r_orb = crate::lunar_datum::orbiter_position(100.0, 88.0, 30.0, k as f64 * 13.0, t0, t);
        let r_b = crate::lunar_llr_geometry::reflector_inertial(beacon_near, t);
        // LOS gate: beacon and orbiter on same hemisphere relative to Moon centre.
        let los = (r_b[0] - r_moon[0]) * (r_orb[0] - r_moon[0])
            + (r_b[1] - r_moon[1]) * (r_orb[1] - r_moon[1])
            + (r_b[2] - r_moon[2]) * (r_orb[2] - r_moon[2]);
        if los <= 0.0 {
            continue;
        }
        orb_near_rows.push(crate::lunar_datum::orbiter_range_row_datum7(
            r_orb,
            beacon_near,
            t,
        ));
    }
    let orb_near_block = block_from_rows("Orbiter-nearside", orb_near_rows, 0.05, 4.0);

    // ── Orbiter-farside block (primary radial-diversity breaker) ────────────
    // Negative body-frame X → anti-Earth hemisphere; ranging from polar orbit provides
    // direct radial information that breaks the lunocenter-X ↔ scale near-degeneracy.
    let beacon_far: [f64; 3] = [-0.9 * R, 0.2 * R, 0.2 * R];
    let mut orb_far_rows: Vec<[f64; 7]> = Vec::new();
    for k in 0..n_steps {
        let t = t0 + k as f64 * step_jc;
        let r_moon = crate::ephem::moon_position(t);
        let r_orb = crate::lunar_datum::orbiter_position(100.0, 88.0, 30.0, k as f64 * 13.0, t0, t);
        let r_b = crate::lunar_llr_geometry::reflector_inertial(beacon_far, t);
        // LOS gate: orbiter must be on the far-side hemisphere to range the beacon.
        let los = (r_b[0] - r_moon[0]) * (r_orb[0] - r_moon[0])
            + (r_b[1] - r_moon[1]) * (r_orb[1] - r_moon[1])
            + (r_b[2] - r_moon[2]) * (r_orb[2] - r_moon[2]);
        if los <= 0.0 {
            continue;
        }
        orb_far_rows.push(crate::lunar_datum::orbiter_range_row_datum7(
            r_orb, beacon_far, t,
        ));
    }
    let orb_far_block = block_from_rows("Orbiter-farside", orb_far_rows, 0.05, 5.0);

    vec![llr_block, vlbi_block, orb_near_block, orb_far_block]
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn radial_diversity_beats_transverse_for_breaking_the_degeneracy() {
        // The Part-B finding, operationalised: per unit of degeneracy-metric gain, an orbiter
        // (radial/depth diversity) block beats the VLBI (transverse) block. Compare LLR+each.
        use crate::lunar_identifiability::{assemble_multi_info, decompose, llr_datum_rows};
        let blocks = super::representative_lunar_menu();
        let find = |name: &str| blocks.iter().find(|b| b.label == name).unwrap().clone();
        let llr = find("LLR");
        let vlbi = find("VLBI-limb");
        let orb = find("Orbiter-farside");
        // Combine through `combine` rather than re-summing inline. Summing the two
        // `info` matrices by hand here is the same arithmetic the combiner performs,
        // so a broken combiner would leave this test green — the duplicate WAS the
        // reason nothing in the module exercised its own combination rule.
        let metric_of = |extra: &MeasurementBlock| {
            let pair = [llr.clone(), extra.clone()];
            decompose(&combine(&pair, &[0, 1]), 1e-12).degeneracy_metric
        };
        let base = decompose(&llr.info, 1e-12).degeneracy_metric;
        let gain_vlbi = metric_of(&vlbi) - base;
        let gain_orb = metric_of(&orb) - base;
        assert!(
            gain_orb > gain_vlbi,
            "radial-diversity orbiter must break the degeneracy more than transverse VLBI: orb {} vs vlbi {}",
            gain_orb,
            gain_vlbi
        );
        eprintln!(
            "radial vs transverse: base={:.6e} gain_vlbi={:.6e} gain_orb={:.6e} ratio={:.1}x",
            base,
            gain_vlbi,
            gain_orb,
            gain_orb / gain_vlbi
        );
        let _ = assemble_multi_info;
        let _ = llr_datum_rows; // (imports used above/by builder)
    }

    /// The module's stated combination rule is that Fisher information is ADDITIVE
    /// across independent measurements. That claim was carried only by a doc comment:
    /// `combine` had no test, and the one test in this module summed the matrices
    /// inline instead of calling it. These pin the rule itself.
    #[test]
    fn combine_is_additive_order_independent_and_empty_is_zero() {
        let blocks = super::representative_lunar_menu();
        assert!(blocks.len() >= 2, "menu must offer at least two blocks");

        // Empty selection is the additive identity, not an arbitrary matrix.
        let zero = combine(&blocks, &[]);
        assert_eq!(zero.len(), 7);
        for row in &zero {
            assert_eq!(row.len(), 7);
            for &v in row {
                assert_eq!(v, 0.0, "an empty selection must give the zero matrix");
            }
        }

        // A single-element selection returns that block's information unchanged.
        let single = combine(&blocks, &[1]);
        for (i, row) in single.iter().enumerate() {
            for (j, &v) in row.iter().enumerate() {
                assert_eq!(
                    v, blocks[1].info[i][j],
                    "combining one block must be the identity at ({i},{j})"
                );
            }
        }

        // Additivity, checked against an independently written element-wise sum.
        let pair = combine(&blocks, &[0, 2]);
        for i in 0..7 {
            for j in 0..7 {
                let expect = blocks[0].info[i][j] + blocks[2].info[i][j];
                assert!(
                    (pair[i][j] - expect).abs() <= 1e-12 * expect.abs().max(1.0),
                    "combine must add independent information at ({i},{j}): got {} want {expect}",
                    pair[i][j]
                );
            }
        }

        // Addition commutes, so the selection order must not matter. A combiner that
        // accumulated in place into blocks[chosen[0]] would pass every check above
        // and fail this one.
        let reversed = combine(&blocks, &[2, 0]);
        for i in 0..7 {
            for j in 0..7 {
                assert_eq!(
                    pair[i][j], reversed[i][j],
                    "selection order must not change the combined information at ({i},{j})"
                );
            }
        }
    }

    /// Adding information can never make a datum LESS identifiable: the degeneracy
    /// metric is monotone under adding a block. If this fails, either the combiner is
    /// subtracting somewhere or a block carries a non-PSD information matrix.
    #[test]
    fn adding_a_block_never_reduces_the_degeneracy_metric() {
        use crate::lunar_identifiability::decompose;
        let blocks = super::representative_lunar_menu();
        let base = decompose(&combine(&blocks, &[0]), 1e-12).degeneracy_metric;
        for k in 1..blocks.len() {
            let with = decompose(&combine(&blocks, &[0, k]), 1e-12).degeneracy_metric;
            assert!(
                with >= base * (1.0 - 1e-12),
                "adding block {} ({}) reduced the degeneracy metric: {base:.6e} -> {with:.6e}",
                k,
                blocks[k].label
            );
        }
    }
}
