// SPDX-License-Identifier: AGPL-3.0-only
//! B4a E5 v2 (`xval/bench-e/README.md`, E5v2-6): the B-iq thresholds `(τ_S, τ_P)` are the nearest-rank
//! 99th percentiles of the window statistics over 64 synthetic clean 1 s windows at 45 dB-Hz. This test
//! recomputes them and requires the committed constants, which were fixed before any TEXBAT byte was
//! read. It also checks the window score rule and the file-name classes. It reads no TEXBAT file.

use kshana::bench::texbat::{class_of, p99, synthetic_stats, window_score, THRESHOLDS};

#[test]
#[ignore = "about 16 minutes in release: run with --ignored"]
fn the_thresholds_are_the_synthetic_99th_percentiles() {
    // Windows that do not acquire are excluded and counted (amended E5v2-6).
    let stats: Vec<(f64, f64)> = (0..64).filter_map(synthetic_stats).collect();
    println!("acquired {} of 64 synthetic windows", stats.len());
    assert_eq!(stats.len(), 61);
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

#[test]
fn a_file_that_does_not_match_its_pin_writes_nothing() {
    // A small file under a pinned name: its hash and size differ from the manifest, so it is refused.
    let dir = temp_workdir("e5v2");
    // PATH-UNIQUE-WAIVER: inside the per-call directory above, which already carries a unique component.
    let f = dir.join("cleanStatic.bin");
    std::fs::write(&f, vec![0u8; 4096]).unwrap();
    assert!(kshana::bench::texbat::score_file(&f).is_err());
    // An unknown name is refused before reading.
    // PATH-UNIQUE-WAIVER: inside the per-call directory above, which already carries a unique component.
    let g = dir.join("other.bin");
    std::fs::write(&g, [0u8; 4]).unwrap();
    assert!(kshana::bench::texbat::score_file(&g).is_err());
    std::fs::remove_dir_all(&dir).ok();
}

/// Per-call working directory under the system temp dir. The sequence makes it unique
/// per call: every test in this binary shares the process id.
fn temp_workdir(label: &str) -> std::path::PathBuf {
    static SEQ: std::sync::atomic::AtomicU64 = std::sync::atomic::AtomicU64::new(0);
    let seq = SEQ.fetch_add(1, std::sync::atomic::Ordering::Relaxed);
    let dir = std::env::temp_dir().join(format!("kshana-{label}-{}-{seq}", std::process::id()));
    let _ = std::fs::remove_dir_all(&dir);
    std::fs::create_dir_all(&dir).unwrap();
    dir
}
