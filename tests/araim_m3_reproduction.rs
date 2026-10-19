// SPDX-License-Identifier: AGPL-3.0-only
//! The EU-US WG-C ARAIM Milestone 3 maximum-URA entries (Tables 5, 6 and 7, Depleted and
//! Baseline rows) against the coverages `src/bin/gen_araim_m3_study.rs` measured
//! (`xval/araim-m3/results.json`), under the bars of `xval/araim-m3/PREREGISTRATION.md`
//! (committed before any scored run). Each entry is exact. The result is MODELLED whatever it
//! is: the study runs under stated deviations (D1 to D6) from the report's setup.
//!
//! PIN-SCOPE:    the 12 printed entries and the measured coverage at the `sigma_URA` values the
//!               claims need.
//! PIN-EXCLUDES: Tables 8 to 13, the Optimistic rows, and every other `sigma_URA`.

use serde_json::Value;

/// (id, configuration, RNP column 0.1 or 0.3, printed entry).
#[derive(Clone, Copy)]
enum Printed {
    Above10,
    NotAvailable,
    Exactly(usize),
}

const CLAIMS: &[(&str, &str, u8, Printed)] = &[
    ("T5-B-01", "dual-baseline", 1, Printed::Above10),
    ("T5-B-03", "dual-baseline", 3, Printed::Above10),
    ("T5-D-01", "dual-depleted", 1, Printed::Exactly(9)),
    ("T5-D-03", "dual-depleted", 3, Printed::Above10),
    ("T6-B-01", "galileo-baseline", 1, Printed::Above10),
    ("T6-B-03", "galileo-baseline", 3, Printed::Above10),
    ("T6-D-01", "galileo-depleted", 1, Printed::NotAvailable),
    ("T6-D-03", "galileo-depleted", 3, Printed::NotAvailable),
    ("T7-D-01", "gps-depleted", 1, Printed::NotAvailable),
    ("T7-D-03", "gps-depleted", 3, Printed::Exactly(4)),
    ("T7-B-01", "gps-baseline", 1, Printed::Exactly(6)),
    ("T7-B-03", "gps-baseline", 3, Printed::Above10),
];

fn results() -> Value {
    let p = std::path::Path::new(env!("CARGO_MANIFEST_DIR")).join("xval/araim-m3/results.json");
    serde_json::from_str(&std::fs::read_to_string(p).expect("results.json")).unwrap()
}

fn coverage(r: &Value, cfg: &str, rnp: u8, ura: usize) -> f64 {
    let c = &r["configs"][cfg];
    let k = c["sigma_ura_m"]
        .as_array()
        .unwrap()
        .iter()
        .position(|u| u.as_u64() == Some(ura as u64))
        .unwrap_or_else(|| panic!("{cfg}: sigma_URA {ura} was not evaluated"));
    c[if rnp == 1 {
        "coverage_rnp01"
    } else {
        "coverage_rnp03"
    }][k]
        .as_f64()
        .unwrap()
}

fn status(r: &Value, cfg: &str, rnp: u8, p: Printed) -> bool {
    let cov = |u| coverage(r, cfg, rnp, u);
    match p {
        Printed::Above10 => cov(10) >= 0.90,
        Printed::NotAvailable => cov(1) < 0.90,
        Printed::Exactly(n) => cov(n) >= 0.90 && cov(n + 1) < 0.90,
    }
}

#[test]
fn the_study_ran_as_pre_registered() {
    let r = results();
    assert_eq!(r["schema"], "kshana.araim-m3-study/1");
    assert_eq!(r["study"]["lat_max_deg"], 70.0);
    assert_eq!(r["study"]["sidereal_days"], 10.0);
    assert_eq!(r["study"]["mask_deg"], 5.0);
    assert_eq!(r["study"]["step_s"], 1200.0);
    for (_, cfg, _, _) in CLAIMS {
        assert!(r["configs"][cfg].is_object(), "{cfg} missing");
    }
}

#[test]
fn pinned_outcomes_against_the_printed_entries() {
    let r = results();
    let got: Vec<(&str, bool)> = CLAIMS
        .iter()
        .map(|(id, cfg, rnp, p)| (*id, status(&r, cfg, *rnp, *p)))
        .collect();
    // 8 of 12 reproduced; 4 NOT MET, pinned: T5-D-01 (coverage 0.847 at 9 m, printed 9 m),
    // T7-D-03 (0.703 at 4 m), T7-B-01 (0.582 at 6 m) and T7-B-03 (0.654 at 10 m). The GPS-only
    // misses are large and all on the GPS Walker shell (D1: the real almanac slots are not the
    // uniform Walker pattern); no claim is made about which deviation causes any miss.
    let want: &[(&str, bool)] = &[
        ("T5-B-01", true),
        ("T5-B-03", true),
        ("T5-D-01", false),
        ("T5-D-03", true),
        ("T6-B-01", true),
        ("T6-B-03", true),
        ("T6-D-01", true),
        ("T6-D-03", true),
        ("T7-D-01", true),
        ("T7-D-03", false),
        ("T7-B-01", false),
        ("T7-B-03", false),
    ];
    assert_eq!(got, want, "{got:#?}");
}
