// SPDX-License-Identifier: AGPL-3.0-only
//! Oracle for the matrix row "Heterogeneous UTC(k) traceability-bias integrity overbound"
//! (row 147): the overbound `b = (U/k)·Φ⁻¹(1 − tail/2) + ageing` evaluated by
//! `integrity::hetero_budget::integrity_bias_overbound` on the real BIPM [UTC−UTC(k)]
//! series, with each row's own published uncertainty.
//!
//! ORACLE (Measured): BIPM Time Department per-laboratory [UTC−UTC(k)] files with their
//! published uncertainties uA, uB, u (ns), https://webtai.bipm.org/ftp/pub/tai/other-products/utcr/
//! (free use with citation), retrieved 2026-09-30: 113 files, 102 with uncertainty columns,
//! 105 024 rows carrying both a value and its uncertainties (rows printed with `-` in place
//! of a value are not used). The files are too large to vendor; the test reads them from
//! `$KSHANA_ORACLES/data/bipm/utclab/` (default `~/Code/kshana-oracles/...`), refuses any file
//! whose SHA-256 differs from `tests/fixtures/hetero_budget_utc_k_oracle/utclab.sha256`, and
//! skips, saying so, when the directory is absent.
//!
//! TOLERANCE, fixed before the first comparison (record B3-PREREGISTRATION.md): with
//! expanded uncertainty = the published u, coverage factor 1, ageing 0 and tail 1e-2, the
//! pooled fraction of rows with |UTC−UTC(k)| > b is at most 1e-2. (Informational only: the
//! same with uB in place of u, and the per-laboratory rates.)
//!
//! VERDICT (first and only run, 2026-10-01): DISAGREES, the row stays MODELLED. 53 306 of
//! 105 024 rows exceed the overbound: 0.5076 (Clopper-Pearson 95 %: 0.5045 to 0.5106),
//! against an allocation of 0.01; 101 of the 102 laboratories exceed 0.01 on their own
//! (0.5131 with uB). The published u is the uncertainty of the BIPM's determination of
//! UTC−UTC(k), not a bound on the offset UTC−UTC(k) itself, which routinely runs to many
//! times u. An overbound of the real offset needs the offset's own distribution (for
//! example the laboratory's steering record), not the Circular T uncertainty. The test pins
//! the measured count so a change on either side is noticed; it does not promote.

use kshana::integrity::hetero_budget::{integrity_bias_overbound, SourceBias, UtcRealizer};
use std::path::PathBuf;

// PIN-SCOPE:    the SHA-256 of each BIPM UTC-UTC(k) laboratory file read from the oracle data
//               directory, so a changed download is refused rather than silently compared
// PIN-EXCLUDES: every other file; the series themselves are not committed
const PINS: &str = include_str!("fixtures/hetero_budget_utc_k_oracle/utclab.sha256");
const TAIL: f64 = 1e-2;
const ALLOCATION: f64 = 1e-2;

struct Row {
    value_ns: f64,
    ub_ns: f64,
    u_ns: f64,
}

fn data_dir() -> PathBuf {
    let root = std::env::var_os("KSHANA_ORACLES")
        .map(PathBuf::from)
        .unwrap_or_else(|| {
            PathBuf::from(std::env::var_os("HOME").unwrap_or_default()).join("Code/kshana-oracles")
        });
    root.join("data/bipm/utclab")
}

fn sha256_hex(bytes: &[u8]) -> String {
    use sha2::{Digest, Sha256};
    Sha256::digest(bytes)
        .iter()
        .map(|b| format!("{b:02x}"))
        .collect()
}

/// Every pinned laboratory file with uncertainty rows, or `None` when the data is absent.
fn load() -> Option<Vec<(String, Vec<Row>)>> {
    let dir = data_dir();
    if !dir.is_dir() {
        return None;
    }
    let mut labs = Vec::new();
    for pin in PINS.lines().filter(|l| !l.trim().is_empty()) {
        let (hash, name) = pin.split_once("  ").expect("sha256 line");
        let bytes = std::fs::read(dir.join(name)).unwrap_or_else(|e| panic!("{name}: {e}"));
        assert_eq!(
            sha256_hex(&bytes),
            hash,
            "{name} differs from the pinned bytes"
        );
        let text = String::from_utf8_lossy(&bytes);
        let rows: Vec<Row> = text
            .lines()
            .filter_map(|l| {
                let f: Vec<&str> = l.split_whitespace().collect();
                if f.len() < 6 || f[2] != "+/-" {
                    return None;
                }
                f[0].parse::<i64>().ok()?;
                Some(Row {
                    value_ns: f[1].parse().ok()?,
                    ub_ns: f[4].parse().ok()?,
                    u_ns: f[5].parse().ok()?,
                })
            })
            .collect();
        if !rows.is_empty() {
            labs.push((name.trim_start_matches("utc-").to_string(), rows));
        }
    }
    Some(labs)
}

fn overbound_ns(u_ns: f64) -> f64 {
    let bias = SourceBias {
        expanded_uncertainty_s: u_ns * 1e-9,
        coverage_factor: 1.0,
        ageing_inflation_s: 0.0,
        realizer: UtcRealizer(0),
    };
    integrity_bias_overbound(&bias, TAIL) * 1e9
}

#[test]
fn overbound_exceedance_on_real_utc_k_finding() {
    let Some(labs) = load() else {
        eprintln!(
            "SKIPPED: BIPM UTC(k) files not found under {} (set KSHANA_ORACLES); this oracle \
             did not run",
            data_dir().display()
        );
        return;
    };
    let mut cache: std::collections::HashMap<u64, f64> = std::collections::HashMap::new();
    let mut overbound_ns = |u: f64| *cache.entry(u.to_bits()).or_insert_with(|| overbound_ns(u));
    let (mut n, mut exc, mut exc_ub) = (0usize, 0usize, 0usize);
    let mut per_lab = Vec::new();
    for (lab, rows) in &labs {
        let e = rows
            .iter()
            .filter(|r| r.value_ns.abs() > overbound_ns(r.u_ns))
            .count();
        exc_ub += rows
            .iter()
            .filter(|r| r.value_ns.abs() > overbound_ns(r.ub_ns))
            .count();
        n += rows.len();
        exc += e;
        per_lab.push((lab.clone(), rows.len(), e as f64 / rows.len() as f64));
    }
    let frac = exc as f64 / n as f64;
    per_lab.sort_by(|a, b| b.2.total_cmp(&a.2));
    let labs_over = per_lab.iter().filter(|l| l.2 > ALLOCATION).count();
    println!(
        "labs {} rows {n} exceedances {exc} fraction {frac:.4} (uB instead of u: {:.4}); \
         labs above the allocation {labs_over}",
        labs.len(),
        exc_ub as f64 / n as f64
    );
    println!(
        "worst laboratories: {:?}",
        &per_lab[..10.min(per_lab.len())]
    );
    assert_eq!(labs.len(), 102);
    assert_eq!(n, 105_024);
    // Pre-registered verdict: PASS only if frac <= ALLOCATION. Recorded finding:
    assert!(frac > ALLOCATION);
    assert_eq!(exc, 53_306, "recorded finding changed, re-examine the row");
    assert_eq!(labs_over, 101);
}
