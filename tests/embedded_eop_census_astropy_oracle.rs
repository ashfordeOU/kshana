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

use kshana::realtime_frame_eop::RealtimeFrameEopScenario;
use serde_json::Value;

const CENSUS: &str = include_str!("fixtures/embedded_eop_census_astropy_oracle/census.json");
const EMBEDDED: &[u8] = include_bytes!("../tools/finals2000A_2026.txt");

fn census() -> Value {
    serde_json::from_str(CENSUS).expect("census.json parses")
}

fn find<'a>(v: &'a Value, key: &str) -> Option<&'a Value> {
    match v {
        Value::Object(m) => m
            .get(key)
            .or_else(|| m.values().find_map(|c| find(c, key))),
        Value::Array(a) => a.iter().find_map(|c| find(c, key)),
        _ => None,
    }
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
        "census.json was generated from different bytes than the embedded extract"
    );

    let (json, _summary) = RealtimeFrameEopScenario::default()
        .run_json()
        .expect("bare default run");
    let report: Value = serde_json::from_str(&json).unwrap();
    let eop_input = find(&report, "eop_input").expect("eop_input block");
    let predicted = find(&report, "predicted_rows").expect("predicted_rows block");

    // (1) total rows, (2) final rows, (3) prediction-only rows and their span.
    assert_eq!(eop_input["rows"].as_u64(), c["rows"].as_u64(), "row count");
    assert_eq!(
        eop_input["final_rows"].as_u64(),
        c["final_rows"].as_u64(),
        "Bulletin B final rows"
    );
    assert_eq!(
        predicted["n"].as_u64(),
        c["prediction_rows"].as_u64(),
        "rows without a Bulletin B block"
    );
    assert_eq!(
        predicted["first_mjd"].as_f64(),
        c["prediction_first_mjd"].as_f64()
    );
    assert_eq!(
        predicted["last_mjd"].as_f64(),
        c["prediction_last_mjd"].as_f64()
    );

    // (4) the whole-file span the row claims, read by astropy.
    assert_eq!(c["first_mjd"].as_f64(), Some(61173.0));
    assert_eq!(c["last_mjd"].as_f64(), Some(61204.0));

    // The crate's own parser over the same bytes, epoch by epoch, against astropy's lists.
    let body = std::str::from_utf8(EMBEDDED).unwrap();
    let ours_pred: Vec<f64> = kshana::eop::parse_all_predicted(body)
        .iter()
        .map(|r| r.mjd)
        .collect();
    let theirs_pred: Vec<f64> = c["prediction_mjds"]
        .as_array()
        .unwrap()
        .iter()
        .map(|v| v.as_f64().unwrap())
        .collect();
    assert_eq!(ours_pred, theirs_pred, "prediction-only epochs");
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
