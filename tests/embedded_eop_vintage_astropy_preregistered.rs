// SPDX-License-Identifier: AGPL-3.0-only
//! Pre-registered comparison (M035, round 2): the IERS vintage of every row of the offline
//! default Earth-orientation input, as Kshana classifies it, against astropy.
//!
//! # Pre-registration (written 2026-10-01, before astropy was run on the new extract)
//!
//! **Why a new comparison.** Round 1 (`tests/embedded_eop_census_astropy_oracle.rs`) found that
//! Kshana called a row "Bulletin A prediction-only" when its Bulletin B block was blank, and that
//! astropy reads all twelve such rows of the old 32-row extract as flag `I` (measured), none as
//! `P`. The old oracle therefore measured Kshana's blank-block rule against the IERS flags, and
//! the old extract held no real prediction at all. Kshana now classifies by the flags
//! (`kshana::eop::row_vintage`, `EopVintage::{Final, Rapid, Predicted}`) and the default input
//! is re-cut to span all three vintages, so both the input and the quantity change: this is a
//! new comparison, not a re-run.
//!
//! **Input.** `tools/finals2000A_20260930.txt` (byte-identical mirror at
//! `tests/fixtures/agency/eop/finals2000A_20260930.txt`), SHA-256
//! 37c20f3b387125d35a20d062fe9c213d78048537d91816a1b1003d5b3bfda953: a 14-line comment header
//! plus 174 consecutive daily rows (MJD 61224 to 61397) copied verbatim from the IERS
//! `finals2000A.all` frozen on 2026-09-30 (`kshana-oracles/data/iers/finals2000A.all`, SHA-256
//! cc80680ec05c91b65e7d02c6068fe0d44dd0998dc880551975092d2d14aa8e18, lines 19541 to 19714).
//! Disclosed: the cut was chosen with a plain column slice of that file (flags and the Bulletin B
//! block), which put 30 final, 54 rapid and 90 predicted rows in it; astropy has not been run.
//!
//! **Oracle.** astropy 8.0.1 (BSD-3-Clause), `astropy.utils.iers.IERS_A.read` with its bundled
//! finals2000A ReadMe, which parses the fixed columns and the flags itself, run by
//! `tests/fixtures/embedded_eop_vintage_astropy_preregistered/generate.py` (header stripped,
//! rows unchanged), output `census.json` with the SHA-256 of the bytes it read. In astropy's
//! terms: final = `UT1_UTC_B` present; rapid = `UT1_UTC_B` blank and `PolPMFlag_A` and
//! `UT1Flag_A` both `I`; predicted = `PolPMFlag_A` or `UT1Flag_A` is `P`.
//! Second reference: IERS Bulletin A Vol. XXXIX No. 039 (issued 2026-09-24), the frozen copy
//! `kshana-oracles/data/iers/bulletinA/bulletina-xxxix-039.txt`, SHA-256
//! 2ba7392d1f52fd664396d3595d4ec6b33124f866a43faa3dd122e2cd03499584, whose prediction table the
//! generator copies number for number.
//!
//! **Tolerance: exact**, every criterion.
//! 1. `census.json` was generated from the embedded bytes (SHA-256 equal).
//! 2. Row count: Kshana's readable rows equal astropy's rows.
//! 3. Final, rapid and predicted: for each vintage, Kshana's count, first and last MJD and the
//!    full MJD list equal astropy's.
//! 4. Every row Kshana calls predicted carries `P` in both the polar-motion and the UT1 flag in
//!    astropy.
//! 5. A bare default `realtime-frame-eop` run reports the same census: `eop_input.rows`,
//!    `eop_input.final_rows`, `eop_input.rapid_rows`, `eop_input.prediction_rows`, and
//!    `predicted_rows.n`, `.first_mjd`, `.last_mjd`.
//! 6. Every row Kshana calls predicted appears in the Bulletin A No. 039 prediction table, and
//!    its Bulletin A x, y and UT1-UTC agree with the bulletin within one unit of the bulletin's
//!    last printed digit (1e-4 arcsec, 1e-4 arcsec, 1e-5 s). The bulletin prints fewer digits
//!    than the file, so this one criterion has the rounding unit as its tolerance.
//!
//! Outcome rule: all six hold, the census claim of the row is supported by astropy.
//!
//! # Result (run 2026-10-01, after the pre-registration commit 6fdae01b)
//!
//! All six hold. astropy reads 174 rows: 30 final (MJD 61224-61253), 54 rapid (61254-61307) and
//! 90 predicted (61308-61397), each list equal to Kshana's; every predicted row is `P` in both
//! flags; the bare run reports the same census; the 90 predictions match Bulletin A No. 039
//! within its rounding (worst 5.0e-5 arcsec and 4.9e-6 s). Mutation: classifying a row with a
//! blank Bulletin B block as a prediction (the round-1 rule) turns the test red (rapid n 0
//! against 54).
//! Any "agreement with the Bulletin A prediction" figure the scenario reports is a separate
//! revision (it is scored against these real P rows), not part of this comparison.

use kshana::eop::{parse_line, row_vintage, EopVintage};
use kshana::realtime_frame_eop::RealtimeFrameEopScenario;
use serde_json::Value;

const EMBEDDED: &[u8] = include_bytes!("../tools/finals2000A_20260930.txt");

fn census() -> Value {
    let path = format!(
        "{}/tests/fixtures/embedded_eop_vintage_astropy_preregistered/census.json",
        env!("CARGO_MANIFEST_DIR")
    );
    let text = std::fs::read_to_string(&path).unwrap_or_else(|e| panic!("read {path}: {e}"));
    serde_json::from_str(&text).expect("census.json parses")
}

fn find<'a>(v: &'a Value, key: &str) -> Option<&'a Value> {
    match v {
        Value::Object(m) => m.get(key).or_else(|| m.values().find_map(|c| find(c, key))),
        Value::Array(a) => a.iter().find_map(|c| find(c, key)),
        _ => None,
    }
}

fn sha256_hex(bytes: &[u8]) -> String {
    use sha2::{Digest, Sha256};
    Sha256::digest(bytes)
        .iter()
        .map(|b| format!("{b:02x}"))
        .collect()
}

fn mjds(v: &Value) -> Vec<f64> {
    v["mjds"]
        .as_array()
        .expect("mjds")
        .iter()
        .map(|x| x.as_f64().expect("mjd"))
        .collect()
}

#[test]
fn vintage_of_every_row_matches_astropy_and_predictions_match_bulletin_a() {
    let c = census();
    // 1. Same bytes.
    assert_eq!(
        c["source_sha256"].as_str().unwrap(),
        sha256_hex(EMBEDDED),
        "census.json was generated from different bytes"
    );
    let body = std::str::from_utf8(EMBEDDED).unwrap();

    // Kshana's classification of every readable row.
    let mut ours: Vec<(f64, EopVintage, &str)> = Vec::new();
    for line in body.lines() {
        if let Some(v) = row_vintage(line) {
            ours.push((parse_line(line).unwrap().mjd, v, line));
        }
    }
    // 2. Row count.
    assert_eq!(ours.len() as u64, c["rows"].as_u64().unwrap(), "rows");

    // 3. Each vintage: count, span and the full MJD list.
    for (vintage, key) in [
        (EopVintage::Final, "final"),
        (EopVintage::Rapid, "rapid"),
        (EopVintage::Predicted, "predicted"),
    ] {
        let list: Vec<f64> = ours
            .iter()
            .filter(|r| r.1 == vintage)
            .map(|r| r.0)
            .collect();
        let theirs = &c[key];
        assert_eq!(list.len() as u64, theirs["n"].as_u64().unwrap(), "{key} n");
        assert_eq!(
            list.first().copied(),
            theirs["first_mjd"].as_f64(),
            "{key} first"
        );
        assert_eq!(
            list.last().copied(),
            theirs["last_mjd"].as_f64(),
            "{key} last"
        );
        assert_eq!(list, mjds(theirs), "{key} MJD list");
        println!(
            "{key}: n = {}, MJD {:?} .. {:?}",
            list.len(),
            list.first(),
            list.last()
        );
    }

    // 4. Every predicted row is P in both flags in astropy.
    for r in ours.iter().filter(|r| r.1 == EopVintage::Predicted) {
        let f = &c["flags_by_mjd"][format!("{:.0}", r.0)];
        assert_eq!(
            (f[0].as_str(), f[1].as_str()),
            (Some("P"), Some("P")),
            "MJD {}: astropy flags (PM, UT1) {f}",
            r.0
        );
    }

    // 5. The bare default run reports the same census.
    let (json, _summary) = RealtimeFrameEopScenario::default()
        .run_json()
        .expect("bare default run");
    let report: Value = serde_json::from_str(&json).unwrap();
    let eop_input = find(&report, "eop_input").expect("eop_input");
    let predicted = find(&report, "predicted_rows").expect("predicted_rows");
    assert_eq!(eop_input["rows"].as_u64(), c["rows"].as_u64());
    assert_eq!(eop_input["final_rows"].as_u64(), c["final"]["n"].as_u64());
    assert_eq!(eop_input["rapid_rows"].as_u64(), c["rapid"]["n"].as_u64());
    assert_eq!(
        eop_input["prediction_rows"].as_u64(),
        c["predicted"]["n"].as_u64()
    );
    assert_eq!(predicted["n"].as_u64(), c["predicted"]["n"].as_u64());
    assert_eq!(
        predicted["first_mjd"].as_f64(),
        c["predicted"]["first_mjd"].as_f64()
    );
    assert_eq!(
        predicted["last_mjd"].as_f64(),
        c["predicted"]["last_mjd"].as_f64()
    );

    // 6. The predicted rows are the Bulletin A No. 039 predictions.
    let table = c["bulletin_a"]["predictions"].as_array().unwrap();
    let mut worst = [0.0_f64; 3];
    for r in ours.iter().filter(|r| r.1 == EopVintage::Predicted) {
        let rec = parse_line(r.2).unwrap();
        let b = table
            .iter()
            .find(|b| b["mjd"].as_f64() == Some(r.0))
            .unwrap_or_else(|| panic!("MJD {} not in the Bulletin A table", r.0));
        let d = [
            (rec.xp_arcsec - b["x_arcsec"].as_f64().unwrap()).abs(),
            (rec.yp_arcsec - b["y_arcsec"].as_f64().unwrap()).abs(),
            (rec.ut1_utc_s - b["ut1_utc_s"].as_f64().unwrap()).abs(),
        ];
        for k in 0..3 {
            worst[k] = worst[k].max(d[k]);
        }
        assert!(
            d[0] <= 1e-4 + 1e-12 && d[1] <= 1e-4 + 1e-12 && d[2] <= 1e-5 + 1e-12,
            "MJD {}: file minus bulletin {d:?}",
            r.0
        );
    }
    println!(
        "worst |file - Bulletin A 039|: x {:.1e}\", y {:.1e}\", UT1 {:.1e} s",
        worst[0], worst[1], worst[2]
    );
}
