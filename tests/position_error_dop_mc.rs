// SPDX-License-Identifier: AGPL-3.0-only
//! Position error ≈ σ_UERE × DOP on the engine's own least-squares fix, by seeded Monte Carlo
//! against the analytic covariance from the DOP kernel (`kshana::dop_error_mc`).
//!
//! A consistency check, MODELLED: it shows the engine's fix realises σ·DOP under the textbook
//! error model (independent, zero-mean, equal-variance Gaussian ranging errors). The DOP kernel
//! it compares with is VALIDATED against gnss_lib_py in `tests/dop_reference.rs`; σ_UERE is an
//! input with no oracle. Tolerances are confidence intervals at a stated false-failure
//! probability, explained in the module docs; nothing here was tuned to the run.

use kshana::dop_error_mc::{run, McConfig};

#[test]
fn position_error_is_sigma_times_dop_on_four_geometries() {
    let r = run(&McConfig::default()).unwrap();
    for g in &r.geometries {
        for c in &g.checks {
            eprintln!(
                "{:<9} {:<5} DOP {:>8.3}  predicted {:>8.3} m  empirical {:>8.3} m  ratio {:.4} in [{:.4}, {:.4}] {}",
                g.name,
                c.quantity,
                c.dop,
                c.predicted_rms_m,
                c.empirical_rms_m,
                c.variance_ratio,
                c.lo,
                c.hi,
                if c.pass { "ok" } else { "FAIL" }
            );
        }
        eprintln!(
            "{:<9} solver vs kernel PDOP/GDOP {:.1e}, max iterations {}",
            g.name, g.solver_dop_rel_diff, g.max_iterations
        );
    }
    assert!(r.all_pass, "{r:#?}");
    // The intervals are what the module docs state: about ±5.6 % on a single axis and ±5.4 %
    // on several at 20,000 trials, 1e-6 in total over 20 checks.
    assert_eq!(r.alpha_per_check, 5e-8);
    let c = &r.geometries[0].checks;
    assert!((c[1].hi - 1.0 - 0.056).abs() < 0.003, "{:?}", c[1]);
    assert!((c[0].hi - 1.0 - 0.054).abs() < 0.003, "{:?}", c[0]);
    // The geometries span the conditioning they claim: the open sky has the best horizontal
    // geometry, and each of the others at least doubles its HDOP.
    let hdop = |i: usize| r.geometries[i].checks[0].dop;
    assert!(hdop(0) < 1.0, "open sky HDOP {}", hdop(0));
    for i in 1..4 {
        assert!(
            hdop(i) > 2.0 * hdop(0),
            "{} HDOP {}",
            r.geometries[i].name,
            hdop(i)
        );
    }
}

#[test]
fn the_relation_scales_with_sigma() {
    // The relation is linear in sigma: a 5 m ranging error passes the same intervals.
    let r = run(&McConfig {
        sigma_m: 5.0,
        seed: 7,
        ..McConfig::default()
    })
    .unwrap();
    assert!(r.all_pass, "{r:#?}");
}

#[test]
fn the_check_can_fail_negative_controls() {
    // A DOP wrong by 10 % (a variance ratio off by 1.21) falls outside every interval: the
    // intervals are narrow enough to see an error far smaller than the 100 % a one-sided
    // availability floor could not (docs/VERIFICATION-MATRIX.md, coverage row, 0.30 finding).
    let r = run(&McConfig::default()).unwrap();
    for g in &r.geometries {
        for c in &g.checks {
            let off = c.variance_ratio / 1.21;
            assert!(
                off < c.lo,
                "{} {}: {off} not below {}",
                g.name,
                c.quantity,
                c.lo
            );
        }
    }
    // Errors that grow at low elevation break the equal-variance model the unweighted Q
    // assumes: the report fails, and on the open sky (satellites down to 15 deg) every
    // quantity fails.
    let r = run(&McConfig {
        elevation_dependent_errors: true,
        ..McConfig::default()
    })
    .unwrap();
    assert!(!r.all_pass);
    assert!(
        r.geometries[0].checks.iter().all(|c| !c.pass),
        "{:#?}",
        r.geometries[0]
    );
}
