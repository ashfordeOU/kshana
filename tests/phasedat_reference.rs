// SPDX-License-Identifier: AGPL-3.0-only
//! Numeric-parity check of the Allan-family estimators against the **canonical
//! Stable32 PHASE.DAT reference dataset** — the 1001-point series distributed with
//! Stable32 (W. J. Riley) that independent tools (e.g. `allantools`) use as their
//! standard regression target.
//!
//! This complements `cs5071a_reference.rs` (real caesium hardware, ADEV+HDEV) by
//! pinning the **overlapping Allan, modified Allan, and time deviation** estimators
//! across the *full* averaging-factor ladder (139 factors) of a second, independent
//! real reference series. Kshana reproduces every Stable32 `Sigma` to < 1e-3
//! (observed ≤ 5e-5).
//!
//! PHASE.DAT ships with the commercial Stable32 tool, so the raw series is
//! **git-ignored**, not vendored; `scripts/fetch_phasedat.sh` reproduces it (via the
//! allantools mirror) into `realdata-cache/phasedat/`. Override the location with
//! `KSHANA_PHASEDAT_PATH`. When the raw file is absent the test prints a skip notice
//! and passes, so CI without the data stays green. Only the public Stable32
//! reference numbers are committed (`tests/fixtures/phasedat/`); no third-party code
//! is used.

use kshana::allan::{modified_adev, overlapping_adev, time_deviation};

const OADEV_ORACLE: &str = include_str!("fixtures/phasedat/phase_dat_oadev.txt");
const MDEV_ORACLE: &str = include_str!("fixtures/phasedat/phase_dat_mdev.txt");
const TDEV_ORACLE: &str = include_str!("fixtures/phasedat/phase_dat_tdev.txt");

/// One Stable32 reference row: averaging factor and the point-estimate deviation.
struct OracleRow {
    af: usize,
    sigma: f64,
}

/// Parse a Stable32 `phase_dat_*.txt` table: comments start with `#`; data rows are
/// `AF  Tau  #  Alpha  MinSigma  Sigma  MaxSigma` (Min/Max are 0 for this series).
fn parse_oracle(text: &str) -> Vec<OracleRow> {
    let mut rows = Vec::new();
    for line in text.lines() {
        let line = line.trim();
        if line.is_empty() || line.starts_with('#') {
            continue;
        }
        let c: Vec<&str> = line.split_whitespace().collect();
        if c.len() < 7 {
            continue;
        }
        rows.push(OracleRow {
            af: c[0].parse().expect("AF"),
            sigma: c[5].parse().expect("Sigma"),
        });
    }
    rows
}

fn phase_path() -> std::path::PathBuf {
    if let Ok(p) = std::env::var("KSHANA_PHASEDAT_PATH") {
        return std::path::PathBuf::from(p);
    }
    std::path::Path::new(env!("CARGO_MANIFEST_DIR")).join("realdata-cache/phasedat/PHASE.DAT")
}

/// Read the phase series (one dimensionless phase sample per line; `#` comments).
fn load_phase() -> Option<Vec<f64>> {
    let text = std::fs::read_to_string(phase_path()).ok()?;
    let phase: Vec<f64> = text
        .lines()
        .map(str::trim)
        .filter(|l| !l.is_empty() && !l.starts_with('#'))
        .map(|l| l.parse::<f64>().expect("phase sample"))
        .collect();
    Some(phase)
}

fn rel_err(got: f64, want: f64) -> f64 {
    ((got - want) / want).abs()
}

/// On this dataset Kshana reproduces every Stable32 deviation to ≤ 5e-5; 1e-3 is a
/// wide margin while still a tight parity bar.
const TOL: f64 = 1e-3;

fn check_estimator(
    name: &str,
    oracle: &str,
    phase: &[f64],
    est: impl Fn(&[f64], f64, usize) -> f64,
) {
    let rows = parse_oracle(oracle);
    assert!(
        rows.len() >= 100,
        "{name}: oracle table looks truncated ({})",
        rows.len()
    );
    let mut checked = 0;
    for r in &rows {
        // Need at least a few independent differences for the estimator to be defined.
        if r.af * 3 >= phase.len() || r.sigma == 0.0 {
            continue;
        }
        let got = est(phase, 1.0, r.af);
        let rel = rel_err(got, r.sigma);
        assert!(
            rel < TOL,
            "{name} AF={}: got {got:.6e}, Stable32 sigma {:.6e} (rel {rel:.2e} >= {TOL:.0e})",
            r.af,
            r.sigma
        );
        checked += 1;
    }
    assert!(
        checked >= 100,
        "{name}: only {checked} averaging factors checked"
    );
    eprintln!("[phasedat] {name}: {checked} averaging factors match Stable32");
}

#[test]
fn phasedat_estimators_match_stable32() {
    let Some(phase) = load_phase() else {
        eprintln!(
            "[phasedat] SKIP: PHASE.DAT not found at {} \
             (run scripts/fetch_phasedat.sh or set KSHANA_PHASEDAT_PATH); CI stays green.",
            phase_path().display()
        );
        return;
    };
    assert_eq!(
        phase.len(),
        1001,
        "expected the 1001-point PHASE.DAT series; got {}",
        phase.len()
    );

    check_estimator("OADEV", OADEV_ORACLE, &phase, overlapping_adev);
    check_estimator("MDEV", MDEV_ORACLE, &phase, modified_adev);
    check_estimator("TDEV", TDEV_ORACLE, &phase, time_deviation);
}

#[test]
fn phasedat_oracle_tables_are_well_formed() {
    // Hermetic guard: the committed Stable32 reference tables parse and are sane.
    for (name, txt) in [
        ("oadev", OADEV_ORACLE),
        ("mdev", MDEV_ORACLE),
        ("tdev", TDEV_ORACLE),
    ] {
        let rows = parse_oracle(txt);
        assert!(rows.len() >= 100, "{name}: too few rows ({})", rows.len());
        assert_eq!(rows[0].af, 1, "{name}: first row should be AF=1");
        assert!(rows[0].sigma > 0.0, "{name}: AF=1 sigma must be positive");
    }
}
