// SPDX-License-Identifier: AGPL-3.0-only
//! B4a E5 v2 (`xval/bench-e/README.md`, E5v2-6): the B-iq thresholds `(τ_S, τ_P)` are the nearest-rank
//! 99th percentiles of the window statistics over 64 synthetic clean 1 s windows at 45 dB-Hz. This test
//! recomputes them and requires the committed constants, which were fixed before any TEXBAT byte was
//! read. It also checks the window score rule and the file-name classes. It reads no TEXBAT file.

use kshana::bench::texbat::{class_of, p99, synthetic_stats, window_score, THRESHOLDS};

#[test]
fn the_thresholds_are_the_synthetic_99th_percentiles() {
    let stats: Vec<(f64, f64)> = (0..64)
        .map(|i| synthetic_stats(i).unwrap_or_else(|| panic!("synthetic window {i} must acquire")))
        .collect();
    let tau = (
        p99(stats.iter().map(|x| x.0).collect()),
        p99(stats.iter().map(|x| x.1).collect()),
    );
    println!("tau_s {:.17e} tau_p {:.17e}", tau.0, tau.1);
    assert_eq!(tau.0.to_bits(), THRESHOLDS.0.to_bits(), "{tau:?}");
    assert_eq!(tau.1.to_bits(), THRESHOLDS.1.to_bits(), "{tau:?}");
}

#[test]
fn the_score_rule_and_classes() {
    let tau = (0.1, 2.0);
    assert_eq!(window_score(&[(0.05, 3.0), (0.2, 1.0)], tau), 2.0);
    assert!(window_score(&[], tau).is_infinite());
    assert_eq!(class_of("cleanDynamic.bin"), Some("nominal"));
    assert_eq!(class_of("ds8.bin"), Some("spoofing"));
    assert_eq!(class_of("ds9.bin"), None);
}
