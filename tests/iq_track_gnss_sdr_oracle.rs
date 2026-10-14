// SPDX-License-Identifier: AGPL-3.0-only
//! PRO-33: the IQ tracking engine (`kshana::iq::track`, run as `kshana iq track`) against
//! GNSS-SDR 0.0.19 on the same independent numpy recordings, under the bars of
//! `tests/fixtures/iq_track_gnss_sdr_oracle/PREREGISTRATION.md` (48edd4a5) as amended by
//! `AMENDMENT-1.md` (1e4288c4: a 10 Hz FLL during pull-in only in both receivers, committed
//! before any test recording; the bars are unchanged).
//!
//! The numbers come from `make_fixture.py` (GNSS-SDR from the Ubuntu 24.04 package
//! 0.0.19-1build3, the engine's release binary), measured against the analytic truth of the
//! recordings; only the derived numbers are committed (`results.csv`, `calibration.csv`,
//! `engine_epochs.sha256`). This test grades them with the registered bars and asserts the
//! recorded verdict (run 2026-10-14), so it fails if the committed results move:
//! B1 (carrier jitter), B2 (code jitter) and B3 (Doppler) are MET at 30, 35, 40 and 45 dB-Hz;
//! B4 (C/N0: the engine's NWPR against GNSS-SDR's SNV) is NOT MET at any of them; B5 (phase
//! lock indicator) is NOT MET at 30, 35 and 40 dB-Hz; B6 (lock held) is NOT MET at 30 dB-Hz.
//! Findings in `tests/fixtures/iq_track_gnss_sdr_oracle/RESULTS.md`.
//!
//! PIN-SCOPE:    the committed derived numbers of the PRO-33 comparison and the verdict of
//!               every registered bar on them.
//! PIN-EXCLUDES: the recordings and the receivers' dumps (regenerated, not committed).

use std::collections::BTreeMap;

const RESULTS: &str = include_str!("fixtures/iq_track_gnss_sdr_oracle/results.csv");
const CALIBRATION: &str = include_str!("fixtures/iq_track_gnss_sdr_oracle/calibration.csv");

type Row = BTreeMap<String, f64>;

fn table(text: &str) -> Vec<(String, String, Row)> {
    // The last `#` line of the header block is the column row.
    let header: Vec<String> = text
        .lines()
        .rfind(|l| l.starts_with('#'))
        .expect("a header row")
        .trim_start_matches('#')
        .split(',')
        .map(|s| s.trim().to_string())
        .collect();
    text.lines()
        .filter(|l| !l.starts_with('#') && !l.trim().is_empty())
        .map(|l| {
            let f: Vec<&str> = l.split(',').collect();
            let row: Row = header
                .iter()
                .zip(&f)
                .filter_map(|(k, v)| v.parse::<f64>().ok().map(|x| (k.clone(), x)))
                .collect();
            (f[0].to_string(), f[2].to_string(), row)
        })
        .collect()
}

fn results() -> BTreeMap<(String, String), Row> {
    table(RESULTS)
        .into_iter()
        .map(|(rec, rx, row)| ((rec, rx), row))
        .collect()
}

/// The registered convention calibration held for both receivers.
#[test]
fn calibration_passes_for_both_receivers() {
    let rows: Vec<Vec<&str>> = CALIBRATION
        .lines()
        .filter(|l| !l.starts_with('#') && !l.trim().is_empty())
        .map(|l| l.split(',').collect())
        .collect();
    assert_eq!(rows.len(), 2);
    for r in rows {
        let (car, code, ppx): (f64, f64, f64) = (
            r[1].parse().unwrap(),
            r[2].parse().unwrap(),
            r[3].parse().unwrap(),
        );
        assert!(
            car < 1.0 && code < 0.005 && (ppx - 1.0).abs() <= 0.01,
            "{r:?}"
        );
    }
}

/// Every registered bar, graded on the committed numbers, gives the recorded verdict.
#[test]
fn registered_bars_give_the_recorded_verdict() {
    let r = results();
    let mut verdict = Vec::new();
    for rec in ["t30", "t35", "t40", "t45"] {
        let g = &r[&(rec.to_string(), "gnss-sdr".to_string())];
        let k = &r[&(rec.to_string(), "kshana".to_string())];
        let ratio = |f: &str| k[f] / g[f] - 1.0;
        let b1 = ratio("sigma_pll_deg").abs() <= 0.10;
        let b2 = ratio("sigma_dll_chips").abs() <= 0.10;
        let b3 = (k["doppler_mean_hz"] - g["doppler_mean_hz"]).abs() <= 0.5
            && ratio("doppler_std_hz").abs() <= 0.15;
        let b4 = (k["cn0_mean_dbhz"] - g["cn0_mean_dbhz"]).abs() <= 1.0;
        let b5 = (k["pli_mean"] - g["pli_mean"]).abs() <= 0.05;
        let b6 = k["lock_held"] == g["lock_held"];
        // Amendment 1: the engine's FLL never met its re-engage condition in the window.
        assert_eq!(k["engine_fll_reengage_condition"], 0.0, "{rec}");
        verdict.push((rec, [b1, b2, b3, b4, b5, b6]));
    }
    assert_eq!(
        verdict,
        [
            ("t30", [true, true, true, false, false, false]),
            ("t35", [true, true, true, false, false, true]),
            ("t40", [true, true, true, false, false, true]),
            ("t45", [true, true, true, false, true, true]),
        ],
        "the registered verdict moved"
    );
}

/// The recorded numbers behind the verdict, to the precision the findings quote.
#[test]
fn recorded_numbers_are_pinned() {
    let r = results();
    let get = |rec: &str, rx: &str, f: &str| r[&(rec.to_string(), rx.to_string())][f];
    // B1 carrier jitter (deg), engine vs GNSS-SDR.
    for (rec, k, g) in [
        ("t30", 10.15769, 10.56208),
        ("t35", 4.570155, 4.750786),
        ("t40", 2.336519, 2.439623),
        ("t45", 1.268578, 1.273134),
    ] {
        assert!(
            (get(rec, "kshana", "sigma_pll_deg") - k).abs() < 1e-4,
            "{rec}"
        );
        assert!(
            (get(rec, "gnss-sdr", "sigma_pll_deg") - g).abs() < 1e-4,
            "{rec}"
        );
    }
    // B4 C/N0 (dB-Hz): the engine's NWPR, GNSS-SDR's SNV and the engine's M2M4.
    for (rec, nwpr, snv, m2m4) in [
        ("t30", 28.7571, 31.36024, 29.94537),
        ("t35", 33.09736, 35.40494, 34.87994),
        ("t40", 36.49295, 40.44462, 39.95404),
        ("t45", 38.33717, 45.4265, 44.98715),
    ] {
        assert!(
            (get(rec, "kshana", "cn0_mean_dbhz") - nwpr).abs() < 1e-3,
            "{rec}"
        );
        assert!(
            (get(rec, "gnss-sdr", "cn0_mean_dbhz") - snv).abs() < 1e-3,
            "{rec}"
        );
        assert!(
            (get(rec, "kshana", "cn0_m2m4_mean_dbhz") - m2m4).abs() < 1e-3,
            "{rec}"
        );
    }
    // B6 at 30 dB-Hz: GNSS-SDR two half-cycle slips, the engine none.
    assert_eq!(get("t30", "gnss-sdr", "slips"), 2.0);
    assert_eq!(get("t30", "kshana", "slips"), 0.0);
}
