// SPDX-License-Identifier: AGPL-3.0-only
//! Oracle for the matrix row "Offline default Earth-orientation input is a real IERS
//! product" (row 87): the row census of the embedded `tools/finals2000A_2026.txt`, read by
//! an independent finals2000A parser.
//!
//! ORACLE (Library): astropy 8.0.1, `astropy.utils.iers` (BSD-3-Clause), the CDS reader with
//! astropy's bundled finals2000A ReadMe, which parses the fixed columns and the IERS `I`/`P`
//! vintage flags itself. Generator: `tests/fixtures/embedded_eop_census_astropy_oracle/
//! generate.py`; committed output `census.json` (with the SHA-256 of the bytes it read).
//!
//! TOLERANCE, fixed before the first comparison: exact. (1) total rows, (2) rows with a
//! Bulletin B final block, (3) rows with a Bulletin A value and no Bulletin B block, with
//! their first and last MJD, (4) the whole-file MJD span 61173-61204, all equal to what the
//! bare default `realtime-frame-eop` run reports; (5) every row the run calls
//! "prediction-only" carries the IERS `P` flag for UT1 and polar motion.
//!
//! VERDICT: (1)-(4) agree exactly. (5) DISAGREES: astropy reads all 32 rows as flag `I`
//! (IERS rapid-service measured values) and none as `P`. The 12 rows without a Bulletin B
//! block are measured rapid values not yet superseded by the final series, not Bulletin A
//! predictions. The second test pins that finding so it cannot drift silently.

//!
//! ROUND 2 (2026-10-01): superseded as the row's comparison. Kshana now classifies rows by the
//! IERS I/P flags and the offline default moved to `tools/finals2000A_20260930.txt`; the new
//! pre-registered comparison is `tests/embedded_eop_vintage_astropy_preregistered.rs`. This file
//! keeps the round-1 census of the OLD extract and now checks Kshana's flag-based classification
//! of that same file against it: 20 final rows, the 12 blank-Bulletin-B rows as rapid (flag I),
//! and no prediction. Those expectations were written after the round-1 result was known, so
//! this is a regression pin, not a promotion basis.

use kshana::eop::{parse_line, row_vintage, EopVintage};
use serde_json::Value;

const CENSUS: &str = include_str!("fixtures/embedded_eop_census_astropy_oracle/census.json");
const EMBEDDED: &[u8] = include_bytes!("../tools/finals2000A_2026.txt");

fn census() -> Value {
    serde_json::from_str(CENSUS).expect("census.json parses")
}

fn sha256_hex(bytes: &[u8]) -> String {
    use sha2::{Digest, Sha256};
    let d = Sha256::digest(bytes);
    d.iter().map(|b| format!("{b:02x}")).collect()
}

#[test]
fn vintage_census_matches_astropy() {
    let c = census();
    assert_eq!(
        c["source_sha256"].as_str().unwrap(),
        sha256_hex(EMBEDDED),
        "census.json was generated from different bytes than the old extract"
    );
    let body = std::str::from_utf8(EMBEDDED).unwrap();
    let classified: Vec<(f64, EopVintage)> = body
        .lines()
        .filter_map(|l| Some((parse_line(l)?.mjd, row_vintage(l)?)))
        .collect();
    let list = |v: EopVintage| -> Vec<f64> {
        classified
            .iter()
            .filter(|r| r.1 == v)
            .map(|r| r.0)
            .collect()
    };
    let json_list = |k: &str| -> Vec<f64> {
        c[k].as_array()
            .unwrap()
            .iter()
            .map(|v| v.as_f64().unwrap())
            .collect()
    };
    assert_eq!(classified.len() as u64, c["rows"].as_u64().unwrap());
    assert_eq!(list(EopVintage::Final), json_list("final_mjds"));
    // The rows round 1 called "prediction-only" (blank Bulletin B) are rapid measured rows.
    assert_eq!(list(EopVintage::Rapid), json_list("prediction_mjds"));
    assert!(list(EopVintage::Predicted).is_empty());
    assert!(c["ut1_flag_census"].get("P").is_none());
    assert!(kshana::eop::parse_all_predicted(body).is_empty());
}

/// Criterion (5), the disagreement: the IERS vintage flag of the rows the row text calls
/// "Bulletin A prediction-only" is `I` (measured), never `P` (predicted). This test pins
/// the finding; if astropy or the extract ever reports `P` for them, it fails and the row
/// should be re-examined for promotion.
#[test]
fn rows_called_prediction_only_are_flagged_measured_by_astropy() {
    let c = census();
    let flags = |k: &str| -> Vec<String> {
        c[k].as_array()
            .unwrap()
            .iter()
            .map(|v| v.as_str().unwrap().to_string())
            .collect()
    };
    assert_eq!(flags("ut1_flag_of_prediction_rows"), vec!["I".to_string()]);
    assert_eq!(flags("pm_flag_of_prediction_rows"), vec!["I".to_string()]);
    assert_eq!(c["ut1_flag_census"]["I"].as_u64(), Some(32));
    assert!(c["ut1_flag_census"].get("P").is_none());
}
