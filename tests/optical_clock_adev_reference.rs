// SPDX-License-Identifier: AGPL-3.0-only
//! Optical-clock measured-ADEV oracle.
//!
//! Validates the Kshana power-law noise fit (`quantum_trade::qparams_from_adev_curve`)
//! against a **real, peer-reviewed optical-clock stability measurement** — the optical
//! analogue of the caesium `cs5071a` oracle. The reference is the published Fig. 4
//! fractional-frequency Allan deviation σ_y(τ) of an ⁸⁸Sr optical-clock transition in a
//! tweezer array:
//!
//!   M. A. Norcia, A. W. Young, W. J. Eckner, E. Oelker, J. Ye, A. M. Kaufman,
//!   "Seconds-scale coherence on an optical clock transition in a tweezer array,"
//!   Science 366, 93–97 (2019), doi:10.1126/science.aay0644.
//!   Publication data: Zenodo 10.5281/zenodo.3382347 (CC-BY-4.0), `stability_dat.csv`.
//!
//! The curve is vendored verbatim under CC-BY-4.0 at
//! `tests/fixtures/optical_clock_adev/stability_dat.csv` (see the directory NOTICE.md).
//! We check that the kshana fit, fed the published measured σ_y(τ), (a) reconstructs
//! every measured point, (b) recovers the paper's headline short-τ white-FM coefficient
//! (≈ 4.7×10⁻¹⁶/√τ), and (c) sees a genuine long-τ red-noise floor (the curve flattens),
//! not the synthesised floor `holdover.rs` assumes for an optical class.

use kshana::quantum_trade::qparams_from_adev_curve;

const STABILITY_CSV: &str = include_str!("fixtures/optical_clock_adev/stability_dat.csv");

/// Pull the comma-separated numeric tail of the row whose first cell == `label`.
fn row_values(label: &str) -> Vec<f64> {
    for line in STABILITY_CSV.lines() {
        let mut cells = line.split(',');
        if cells.next().map(str::trim) == Some(label) {
            return cells
                .map(|c| c.trim().parse::<f64>().expect("numeric ADEV cell"))
                .collect();
        }
    }
    panic!("row labelled {label:?} not found in stability_dat.csv");
}

/// Reconstruct σ_y(τ) from the fitted power-law parameters in the basis the fit uses:
/// σ_y²(τ) = q_wf/τ + q_rw·τ/3 + q_drift·τ³/20.
fn sigma_model(q_wf: f64, q_rw: f64, q_drift: f64, tau: f64) -> f64 {
    (q_wf / tau + q_rw * tau / 3.0 + q_drift * tau * tau * tau / 20.0).sqrt()
}

#[test]
fn fit_reproduces_published_sr_optical_clock_adev_curve() {
    let taus = row_values("averaging time (s)");
    let adevs = row_values("fractional Allan deviation");
    assert_eq!(taus.len(), 8, "expected 8 averaging times");
    assert_eq!(adevs.len(), taus.len(), "τ and σ_y columns must align");

    // Sanity: this is the published curve, τ 0.92 s → 117.76 s, σ_y ~4.6e-16 → ~7.4e-17.
    assert!((taus[0] - 0.92).abs() < 1e-9 && (taus[7] - 117.76).abs() < 1e-6);
    assert!(adevs.iter().all(|&s| (1e-17..1e-15).contains(&s)));

    let q = qparams_from_adev_curve(&taus, &adevs);

    // (a) The fit reconstructs the measured curve. The published series has a noisy
    //     non-monotonic bump at 30→60 s (σ_y rises, then falls again — measurement
    //     scatter inside the 1-σ error bars), which a smooth 3-term power law cannot
    //     chase, so the worst single point sits near 21%; the curve as a whole is
    //     reproduced to ~10% RMS. Bounds anchored on the repo's own NNLS output.
    let rels: Vec<f64> = taus
        .iter()
        .zip(&adevs)
        .map(|(&t, &s)| (sigma_model(q.q_wf, q.q_rw, q.q_drift, t) - s).abs() / s)
        .collect();
    let worst_rel = rels.iter().cloned().fold(0.0_f64, f64::max);
    let rms_rel = (rels.iter().map(|r| r * r).sum::<f64>() / rels.len() as f64).sqrt();
    assert!(
        rms_rel < 0.12,
        "fit should reproduce the measured ADEV curve to <12% RMS, got {:.4}",
        rms_rel
    );
    assert!(
        worst_rel < 0.25,
        "worst single ADEV point should reconstruct to <25%, got {:.4}",
        worst_rel
    );

    // (b) The recovered white-FM coefficient √q_wf matches the paper's headline
    //     short-τ stability 4.7e-16/√τ (measured σ_y(0.92 s)·√0.92 = 4.42e-16).
    let white_coeff = q.q_wf.sqrt();
    assert!(
        (3.8e-16..5.2e-16).contains(&white_coeff),
        "√q_wf should reproduce the published ~4.4–4.7e-16/√τ scaling, got {:.3e}",
        white_coeff
    );

    // (c) A genuine measured long-τ red-noise floor — the curve flattens past ~30 s,
    //     so the fit must pick up random-walk-FM and/or drift, not pure white-FM.
    assert!(
        q.q_rw > 0.0 || q.q_drift > 0.0,
        "measured curve flattens at long τ; expected a non-zero red-noise floor, got {q:?}"
    );
}
