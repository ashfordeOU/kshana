// SPDX-License-Identifier: AGPL-3.0-only
//! Reproducibility generator for the P1 lunar-datum-identifiability manuscript.
//!
//! Regenerates every quantitative result the paper reports, directly from the
//! committed engine, so each table and figure number is traceable to one run:
//!   - the null-space classification anchors (single-range rank/defect);
//!   - the LLR-only degeneracy figures (metric, origin↔scale correlation, CRLB);
//!   - the marginal degeneracy-metric gain of adding transverse VLBI vs. a
//!     radial/depth-diverse far-side orbiter range (the Part-B finding);
//!   - the per-parameter fractional-CRLB improvement showing VLBI helps the
//!     transverse translation more than the radial one (the mechanism);
//!   - the cost/degeneracy Pareto frontier (Part C).
//!
//! All magnitudes are MODELLED (representative beacon/schedule/noise/cost — see
//! `tests/fixtures/llr_geometry/NOTICE.md`); only the STRUCTURE (ordering, sign,
//! rank, and the SciPy-cross-checked decomposition linear algebra) is Validated.
//!
//! Run: `cargo run --example p1_datum_identifiability`

use kshana::fim::{crlb, information_matrix};
use kshana::lunar_identifiability::decompose;
use kshana::lunar_oed::{combine, pareto_frontier, representative_lunar_menu, MeasurementBlock};

const REL_TOL: f64 = 1e-12;

fn block<'a>(menu: &'a [MeasurementBlock], label: &str) -> &'a MeasurementBlock {
    menu.iter()
        .find(|b| b.label == label)
        .unwrap_or_else(|| panic!("menu is missing block {label}"))
}

/// Sum two 7×7 Fisher matrices (information is additive across measurements).
fn add_info(a: &[Vec<f64>], b: &[Vec<f64>]) -> Vec<Vec<f64>> {
    a.iter()
        .zip(b.iter())
        .map(|(ra, rb)| ra.iter().zip(rb.iter()).map(|(x, y)| x + y).collect())
        .collect()
}

/// Metric of LLR plus one extra block (Fisher information is additive).
fn metric_of(llr: &MeasurementBlock, extra: &MeasurementBlock) -> f64 {
    decompose(&add_info(&llr.info, &extra.info), REL_TOL).degeneracy_metric
}

fn main() {
    println!("# P1 datum-identifiability — canonical numbers (all magnitudes MODELLED)\n");

    // --- Part A: single internal range observation => rank 1, datum defect 6 ---
    // A lone Earth-station -> reflector sightline contributes one Jacobian row; its
    // rank-1 outer product leaves a 6-dimensional datum null space.
    let one_row = vec![vec![1.0_f64, 0.2, -0.4, 0.9, 0.1, -0.3, 0.05]];
    let info1 = information_matrix(&one_row, &[1.0]);
    let defect1 = crlb(&info1, 1e-9).defect;
    println!("## Part A — null-space classification anchor");
    println!("single internal range row: defect = {defect1} (expect 6)\n");

    // --- Part B: multi-technique degeneracy collapse over the representative menu ---
    let menu = representative_lunar_menu();
    let llr = block(&menu, "LLR").clone();
    let vlbi = block(&menu, "VLBI-limb");
    let orb_far = block(&menu, "Orbiter-farside");

    let base = decompose(&llr.info, REL_TOL);
    let base_metric = base.degeneracy_metric;
    println!("## Part B — LLR-only baseline and marginal gains");
    println!(
        "LLR-only: defect={}, metric={:.6e}, origin_scale_corr={:.6}, origin_crlb_m={:.6e}",
        base.defect, base_metric, base.origin_scale_corr, base.origin_crlb_m
    );

    let gain_vlbi = metric_of(&llr, vlbi) - base_metric;
    let gain_orb = metric_of(&llr, orb_far) - base_metric;
    println!("gain(+VLBI-limb, transverse)     = {gain_vlbi:.6e}");
    println!("gain(+Orbiter-farside, radial)   = {gain_orb:.6e}");
    println!(
        "radial/transverse gain ratio     = {:.2}x  (per unit cost: {:.2}x)\n",
        gain_orb / gain_vlbi,
        (gain_orb / orb_far.cost) / (gain_vlbi / vlbi.cost)
    );

    // Mechanism: per-parameter fractional CRLB improvement under VLBI. The
    // origin-X<->scale pair is a RADIAL ambiguity, so VLBI's transverse delay
    // content improves the transverse translation (t_y) more than the radial (t_x).
    let dv = decompose(&add_info(&llr.info, &vlbi.info), REL_TOL);
    let frac = |k: usize| (base.crlb_diag[k] - dv.crlb_diag[k]) / base.crlb_diag[k];
    println!("## Part B — mechanism (fractional CRLB improvement under VLBI)");
    println!(
        "frac(t_x, radial)     = {:.3e}\nfrac(t_y, transverse) = {:.3e}   (transverse/radial = {:.2}x)\n",
        frac(0),
        frac(1),
        frac(1) / frac(0)
    );

    // --- Part C: cost/degeneracy Pareto frontier ---
    let budgets = [1.0, 4.0, 8.0, 13.0];
    let frontier = pareto_frontier(&menu, &budgets, REL_TOL);
    println!("## Part C — cost/degeneracy Pareto frontier");
    println!("budget  cost   metric        chosen");
    for p in &frontier {
        println!(
            "{:5.1}  {:5.1}  {:.6e}  {:?}",
            p.budget, p.total_cost, p.degeneracy_metric, p.chosen
        );
    }

    // Consistency check: additive combine matches the frontier's full-menu metric.
    let all: Vec<usize> = (0..menu.len()).collect();
    let full = decompose(&combine(&menu, &all), REL_TOL).degeneracy_metric;
    println!("\nfull-menu metric (all blocks) = {full:.6e}");
}
