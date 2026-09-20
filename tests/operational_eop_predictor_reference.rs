// SPDX-License-Identifier: AGPL-3.0-only
//! G13 reference — the operational-style Earth-orientation predictor is **additive**, and
//! its errors are genuine predictions.
//!
//! Three guarantees, each with its own oracle:
//!
//! * **Additivity (R1).** `tests/golden/realtime-frame-eop.pre-g13.json` is a frozen
//!   capture of the default `realtime-frame-eop` report as it stood *before* the
//!   operational predictor existed. Every field it contains must still be present in
//!   today's default report with the identical value: no released figure changed, no field
//!   removed. The file is a historical record — it must **never** be regenerated. The
//!   committed golden CSV is likewise byte-identical, because the new table is emitted in
//!   the JSON only and the reproducibility CSV was deliberately left alone.
//! * **No look-ahead.** A prediction fitted on data that includes the epoch it predicts is
//!   not a prediction. Every real row later than the issue epoch — the target row's own
//!   rapid value included — is wrecked, while the Bulletin B finals the forecast is scored
//!   against are left alone, and every emitted figure must come back identical.
//! * **A real, published predictor.** The three new inputs reach the report, the emitted
//!   per-row lead proves the fit window closed before the target, and the operational and
//!   persistence columns are different numbers measured over one identical epoch set.

use kshana::api::run_toml;
use kshana::frame_eop::{
    operational_vs_persistence_vs_horizon, Horizon, OperationalPredictorConfig,
};
use kshana::realtime_frame_eop::RealtimeFrameEopScenario;
use serde_json::Value;

/// The frozen pre-G13 default report. Never regenerate this file.
const PRE_G13: &str = include_str!("golden/realtime-frame-eop.pre-g13.json");
/// The committed byte-stable reproducibility table.
const GOLDEN_CSV: &str = include_str!("golden/realtime-frame-eop.csv");
/// The real 45-row verbatim IERS extract — the longest series committed here.
const LONGSPAN: &str = "tests/fixtures/agency/eop/finals2000A_2022001_longspan.txt";

/// Every field of `base` must be present in `now` with the identical value. Reports the
/// full list of violations rather than only the first, so an additivity regression is
/// diagnosed in one run.
fn assert_superset(base: &Value, now: &Value, path: &str, bad: &mut Vec<String>) {
    match base {
        Value::Object(o) => {
            let Some(n) = now.as_object() else {
                bad.push(format!("{path}: was an object, is not"));
                return;
            };
            for (k, v) in o {
                match n.get(k) {
                    None => bad.push(format!("{path}.{k}: REMOVED")),
                    Some(x) => assert_superset(v, x, &format!("{path}.{k}"), bad),
                }
            }
        }
        Value::Array(a) => {
            let Some(n) = now.as_array() else {
                bad.push(format!("{path}: was an array, is not"));
                return;
            };
            if a.len() != n.len() {
                bad.push(format!(
                    "{path}: length {} -> {} (a released array may not change length)",
                    a.len(),
                    n.len()
                ));
                return;
            }
            for (i, v) in a.iter().enumerate() {
                assert_superset(v, &n[i], &format!("{path}[{i}]"), bad);
            }
        }
        _ => {
            if base != now {
                bad.push(format!("{path}: {base} -> {now}"));
            }
        }
    }
}

#[test]
fn the_defaults_still_emit_every_pre_g13_field_with_its_pre_g13_value() {
    let base: Value = serde_json::from_str(PRE_G13).expect("the frozen capture parses");
    let now: Value =
        serde_json::from_str(&run_toml("kind=\"realtime-frame-eop\"\n").unwrap().json).unwrap();
    let mut bad = Vec::new();
    assert_superset(&base, &now, "$", &mut bad);
    assert!(
        bad.is_empty(),
        "the additive-only rule was broken — {} change(s):\n{}",
        bad.len(),
        bad.join("\n")
    );
    // And the capture really is the pre-G13 document: it must NOT already contain the
    // new blocks, or this test would be comparing the change against itself.
    for added in [
        "operational_predictor_model",
        "table5_operational_vs_persistence",
        "table6_archived_vintage_predicted_vs_final",
        "units",
    ] {
        assert!(
            base.get(added).is_none(),
            "the frozen pre-G13 capture already contains `{added}` — it has been \
             regenerated, and no longer proves anything"
        );
        assert!(now.get(added).is_some(), "`{added}` is not emitted");
    }
}

#[test]
fn the_persistence_reproducibility_table_is_byte_identical() {
    // The CSV carries P4 Tables 1 and 2 — the persistence curve among them. G13 adds no
    // row to it, so the committed golden must still be reproduced byte-for-byte.
    let out = run_toml("kind=\"realtime-frame-eop\"\n").unwrap();
    let csv = out.csv.as_ref().expect("a CSV artifact");
    assert_eq!(
        csv, GOLDEN_CSV,
        "the golden reproducibility CSV moved; G13 must not touch it"
    );
    assert_eq!(
        csv,
        &RealtimeFrameEopScenario::default().to_csv().unwrap(),
        "the runtime CSV and the scenario's own CSV diverged"
    );
}

/// The G13 configuration every reported number comes from: the real 45-row series at five
/// horizons, everything else default.
fn longspan_toml(extra: &str) -> String {
    format!("kind=\"realtime-frame-eop\"\nhorizons_days=[1,2,3,5,10]\neop_finals2000a=\"{LONGSPAN}\"\n{extra}")
}

#[test]
fn the_operational_columns_are_measured_and_differ_from_persistence() {
    let v: Value = serde_json::from_str(&run_toml(&longspan_toml("")).unwrap().json).unwrap();
    let t5 = &v["table5_operational_vs_persistence"];
    assert_eq!(t5["status"], "measured", "{}", t5["statement"]);
    let rows = t5["rows"].as_array().unwrap();
    assert_eq!(rows.len(), 5);
    for r in rows {
        // One epoch set, both predictors — and two genuinely different numbers.
        let o = r["combined"]["operational"]["rms_position_m"]
            .as_f64()
            .unwrap();
        let p = r["combined"]["persistence"]["rms_position_m"]
            .as_f64()
            .unwrap();
        assert!(o > 0.0 && p > 0.0);
        assert!(
            (o - p).abs() / p > 1e-3,
            "horizon {}: the two predictors produced the same error ({o} vs {p}) — the \
             comparison has stopped comparing anything",
            r["horizon"]
        );
        assert_eq!(
            r["combined"]["operational"]["n"],
            r["combined"]["persistence"]["n"]
        );
        // Emitted proof that the fit closed before the target.
        assert!(r["min_fit_lead_days"].as_f64().unwrap() >= 1.0);
    }
    // The equivalent horizon of the ~14.4 m real-time frame error is read off the measured
    // curve for both predictors, and the operational one sits further out.
    let eh = &t5["equivalent_horizon_days"];
    let op = eh["ut1"]["operational"].as_f64().unwrap();
    let pers = eh["ut1"]["persistence"].as_f64().unwrap();
    assert!(
        op > pers,
        "operational {op} d must exceed persistence {pers} d"
    );
}

/// Rewrite every row later than `after_mjd` so its **rapid Bulletin A** UT1 and pole are
/// wrecked, leaving the Bulletin B final block — the truth a forecast is scored against —
/// untouched. A predictor that reads even one row past its issue epoch moves; an honest
/// one cannot notice.
fn poison_rapid_after(body: &str, after_mjd: f64) -> (String, usize) {
    let mut out = String::new();
    let mut touched = 0;
    for line in body.lines() {
        match kshana::eop::parse_line(line) {
            Some(rec) if rec.mjd > after_mjd + 0.5 && line.len() > 68 => {
                let mut s = line.to_string();
                let ut1 = format!("{:>10.7}", rec.ut1_utc_s - 5.0);
                s.replace_range(58..68, &ut1[ut1.len() - 10..]);
                let xp = format!("{:>9.6}", rec.xp_arcsec + 0.5);
                s.replace_range(18..27, &xp[xp.len() - 9..]);
                let yp = format!("{:>9.6}", rec.yp_arcsec - 0.5);
                s.replace_range(37..46, &yp[yp.len() - 9..]);
                out.push_str(&s);
                touched += 1;
            }
            _ => out.push_str(line),
        }
        out.push('\n');
    }
    (out, touched)
}

/// Drop every row later than `last_mjd`, keeping comments and unparsed lines.
fn trim_after(body: &str, last_mjd: f64) -> String {
    body.lines()
        .filter(|l| match kshana::eop::parse_line(l) {
            Some(r) => r.mjd <= last_mjd + 1e-9,
            None => true,
        })
        .collect::<Vec<_>>()
        .join("\n")
}

// THE LOOK-AHEAD DETECTOR, at the level of the shipped report.
//
// The series is trimmed so the 1-day table has exactly ONE issue epoch, and then every
// rapid row after that issue epoch is wrecked — including the target row's own rapid
// value, whose Bulletin B final (the truth) is left alone. A predictor fitted on data
// that includes the epoch it predicts would move; the emitted rows must be identical.
#[test]
fn wrecking_every_row_after_the_issue_epoch_does_not_move_a_single_emitted_figure() {
    let clean_full = std::fs::read_to_string(LONGSPAN).expect("fixture");
    let cfg = OperationalPredictorConfig::default();
    let hs = [Horizon::Days(1)];
    let first_row = operational_vs_persistence_vs_horizon(&clean_full, &hs, &cfg);
    let issue = first_row[0].epochs_mjd[0];
    let target = first_row[0].target_mjds[0];

    let clean = trim_after(&clean_full, target);
    let (poisoned, touched) = poison_rapid_after(&clean, issue);
    assert_eq!(
        touched, 1,
        "exactly the target row should be wrecked, not {touched}"
    );
    assert_ne!(clean, poisoned, "the poison must actually change the bytes");

    let dir = std::env::temp_dir();
    let pid = std::process::id();
    let a = dir.join(format!("kshana_g13_clean_{pid}.txt"));
    let b = dir.join(format!("kshana_g13_wrecked_{pid}.txt"));
    std::fs::write(&a, &clean).unwrap();
    std::fs::write(&b, &poisoned).unwrap();
    let go = |p: &std::path::Path| -> Value {
        let toml = format!(
            "kind=\"realtime-frame-eop\"\nhorizons_days=[1]\neop_finals2000a=\"{}\"\n",
            p.to_string_lossy()
        );
        serde_json::from_str(&run_toml(&toml).unwrap().json).unwrap()
    };
    let va = go(&a);
    let vb = go(&b);
    let _ = std::fs::remove_file(&a);
    let _ = std::fs::remove_file(&b);

    let rows = |v: &Value| v["table5_operational_vs_persistence"]["rows"].clone();
    assert_eq!(
        rows(&va)[0]["n"],
        1,
        "the trim should leave one issue epoch"
    );
    assert_eq!(
        rows(&va),
        rows(&vb),
        "an emitted figure moved when only rows AFTER the issue epoch were wrecked — the \
         fit is reading ahead of the epoch it predicts"
    );
    // The same at the library level, where the whole row is compared field for field.
    let one_a = operational_vs_persistence_vs_horizon(&clean, &hs, &cfg);
    let one_b = operational_vs_persistence_vs_horizon(&poisoned, &hs, &cfg);
    assert_eq!(one_a.len(), 1);
    assert_eq!(one_a[0].n, 1);
    assert_eq!(one_a[0], one_b[0]);
}

// The same detector over the whole real series rather than a trimmed one: every fit at
// every issue epoch must be unaffected by rows later than that epoch. The comparison is
// per issue epoch, because a later issue epoch legitimately uses rows that a poison
// boundary further back would have wrecked.
#[test]
fn every_issue_epoch_is_unaffected_by_rows_later_than_itself() {
    let clean = std::fs::read_to_string(LONGSPAN).expect("fixture");
    let cfg = OperationalPredictorConfig::default();
    let hs = [Horizon::Days(1), Horizon::Days(2), Horizon::Days(3)];
    let base = operational_vs_persistence_vs_horizon(&clean, &hs, &cfg);
    assert!(base.iter().all(|r| r.n >= 3));
    for row in &base {
        let Horizon::Days(h) = row.horizon else {
            unreachable!()
        };
        // Score each issue epoch on its own, over a series wrecked past that epoch.
        for &issue in row.epochs_mjd.iter().take(4) {
            let target = issue + h as f64;
            let trimmed = trim_after(&clean, target);
            let (poisoned, touched) = poison_rapid_after(&trimmed, issue);
            assert_eq!(touched, h as usize, "issue {issue}, horizon {h}");
            let a = operational_vs_persistence_vs_horizon(&trimmed, &[row.horizon], &cfg);
            let b = operational_vs_persistence_vs_horizon(&poisoned, &[row.horizon], &cfg);
            assert_eq!(a.len(), 1);
            assert_eq!(b.len(), 1);
            let last = a[0].n - 1;
            assert!((a[0].epochs_mjd[last] - issue).abs() < 1e-9);
            assert_eq!(
                a[0], b[0],
                "issue {issue} at horizon {h}: a figure moved under a purely future \
                 corruption"
            );
        }
    }
}

#[test]
fn the_report_is_deterministic_with_the_predictor_in_it() {
    let t = longspan_toml("");
    assert_eq!(run_toml(&t).unwrap().json, run_toml(&t).unwrap().json);
}
