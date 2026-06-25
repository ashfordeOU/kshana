// SPDX-License-Identifier: AGPL-3.0-only
//! Real-hardware numeric-parity check of the Allan-family estimators against a
//! **measured atomic clock**, not a synthetic test vector.
//!
//! Where `allan_reference.rs` / `allan_nist_sp1065_1000point.rs` validate the
//! estimators on the canonical *synthetic* NBS14 data, this island validates them
//! on **556 990 phase samples of a real 5071A caesium primary standard measured
//! against a hydrogen maser** (1 PPS into a 53230A time-interval counter, τ₀ = 1 s,
//! Feb 2014; collected by A. Wallin, distributed with `allantools`).
//!
//! The reference deviations are the ones **Stable32** (W. J. Riley; the de-facto
//! reference frequency-stability tool) computes for the same file, with its 1‑σ
//! (0.683) confidence band — committed under `tests/fixtures/cs5071a/`
//! (`oadev_decade.txt`, `ohdev_decade.txt`; see the `NOTICE.md` there).
//!
//! The raw phase file is third-party data without an explicit redistribution
//! licence, so it is **git-ignored**, not vendored. Fetch it with
//! `scripts/fetch_cs5071a.sh` (downloads into `realdata-cache/cs5071a/`); override
//! the location with `KSHANA_CS5071A_PATH`. When the raw file is absent the test
//! prints a skip notice and passes, so CI without the data stays green; when it is
//! present the estimators are checked against the Stable32 reference across the
//! whole decade τ ladder. Only the public reference numbers are committed; no
//! third-party code is used.

use kshana::allan::{hadamard_adev, overlapping_adev};

const OADEV_ORACLE: &str = include_str!("fixtures/cs5071a/oadev_decade.txt");
const OHDEV_ORACLE: &str = include_str!("fixtures/cs5071a/ohdev_decade.txt");

/// One Stable32 reference row: averaging factor, point count, and the
/// `[min, sigma, max]` deviation with its confidence band.
struct OracleRow {
    af: usize,
    npts: u64,
    min: f64,
    sigma: f64,
    max: f64,
}

/// Parse a Stable32 `*_decade.txt` table: comment lines start with `#`; data rows
/// are `AF  Tau  #  Alpha  MinSigma  Sigma  MaxSigma`.
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
            npts: c[2].parse().expect("# count"),
            min: c[4].parse().expect("MinSigma"),
            sigma: c[5].parse().expect("Sigma"),
            max: c[6].parse().expect("MaxSigma"),
        });
    }
    rows
}

/// Locate the git-ignored raw phase file, if it has been fetched.
fn phase_path() -> std::path::PathBuf {
    if let Ok(p) = std::env::var("KSHANA_CS5071A_PATH") {
        return std::path::PathBuf::from(p);
    }
    std::path::Path::new(env!("CARGO_MANIFEST_DIR")).join("realdata-cache/cs5071a/5071A_phase.txt")
}

/// Read the phase series (one dimensionless phase sample per line; `#` comments).
fn load_phase() -> Option<Vec<f64>> {
    let path = phase_path();
    let text = std::fs::read_to_string(&path).ok()?;
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

/// Relative tolerance for well-sampled averaging factors. On this dataset Kshana
/// reproduces every Stable32 deviation to < 3e-5; 1e-3 leaves a wide margin while
/// still being a tight parity bar.
const TOL: f64 = 1e-3;
/// Averaging factors with at least this many analysis points are checked to `TOL`;
/// sparser (long-τ) rows are only required to land inside Stable32's own
/// confidence band, where the point estimate itself is statistically loose.
const WELL_SAMPLED: u64 = 100;

/// Check one estimator against its Stable32 reference table over the decade ladder.
fn check_estimator(
    name: &str,
    oracle: &str,
    phase: &[f64],
    est: impl Fn(&[f64], f64, usize) -> f64,
) {
    let rows = parse_oracle(oracle);
    assert!(rows.len() >= 10, "{name}: oracle table looks truncated");
    let mut checked = 0;
    for r in &rows {
        // Need at least a few independent differences for the estimator to be defined.
        if r.af * 3 >= phase.len() {
            continue;
        }
        let got = est(phase, 1.0, r.af);
        if r.npts >= WELL_SAMPLED {
            let rel = rel_err(got, r.sigma);
            assert!(
                rel < TOL,
                "{name} AF={}: got {got:.6e}, Stable32 sigma {:.6e} (rel {rel:.2e} >= {TOL:.0e})",
                r.af,
                r.sigma
            );
        } else {
            // Allow a hair of slack on the reported band edges (Stable32 prints 5 sig figs).
            let lo = r.min * (1.0 - 1e-3);
            let hi = r.max * (1.0 + 1e-3);
            assert!(
                got >= lo && got <= hi,
                "{name} AF={}: got {got:.6e} outside Stable32 band [{:.6e}, {:.6e}]",
                r.af,
                r.min,
                r.max
            );
        }
        checked += 1;
    }
    assert!(
        checked >= 10,
        "{name}: only {checked} averaging factors checked"
    );
    eprintln!("[cs5071a] {name}: {checked} averaging factors match Stable32");
}

#[test]
fn cs5071a_real_caesium_estimators_match_stable32() {
    let Some(phase) = load_phase() else {
        eprintln!(
            "[cs5071a] SKIP: raw phase data not found at {} \
             (run scripts/fetch_cs5071a.sh or set KSHANA_CS5071A_PATH); CI stays green.",
            phase_path().display()
        );
        return;
    };
    assert_eq!(
        phase.len(),
        556_990,
        "expected the full 556 990-point 5071A series; got {}",
        phase.len()
    );

    check_estimator("OADEV", OADEV_ORACLE, &phase, overlapping_adev);
    check_estimator("OHDEV", OHDEV_ORACLE, &phase, hadamard_adev);
}

#[test]
fn cs5071a_oracle_tables_are_well_formed() {
    // Hermetic guard: the committed Stable32 reference tables parse and are sane,
    // so the island is meaningful even on a machine that never fetches the raw data.
    for (name, txt) in [("oadev", OADEV_ORACLE), ("ohdev", OHDEV_ORACLE)] {
        let rows = parse_oracle(txt);
        assert!(rows.len() >= 15, "{name}: too few rows ({})", rows.len());
        // τ=1 s overlapping ADEV of this caesium standard is ~3.3e-10.
        let first = &rows[0];
        assert_eq!(first.af, 1, "{name}: first row should be AF=1");
        assert!(
            first.min <= first.sigma && first.sigma <= first.max,
            "{name}: AF=1 band is not ordered"
        );
        for r in &rows {
            assert!(
                r.sigma > 0.0 && r.min > 0.0 && r.max > 0.0,
                "{name}: nonpositive deviation"
            );
            assert!(r.min <= r.max, "{name}: AF={} band inverted", r.af);
        }
    }
}
