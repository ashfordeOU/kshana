// SPDX-License-Identifier: AGPL-3.0-only
//! **The holdover prediction on atomic clocks in orbit: GPS Block IIF satellites.**
//!
//! Data: International GNSS Service (IGS) final combined clocks at 30 s, 14 days
//! (2025-08-17 to 2025-08-30), fetched and checked by `scripts/fetch_igs_clocks.sh`. Each
//! record is a satellite clock's offset from the IGS timescale, itself an ensemble steered
//! by hydrogen masers, estimated to a few hundredths of a nanosecond. A GPS satellite's
//! clock free-runs between uploads, so each series is a measured holdover record of an
//! onboard atomic clock (Block IIF satellites carry rubidium and caesium standards; the
//! IGS files do not say which is active, so the result is reported for the satellites,
//! not claimed for one clock type).
//!
//! **Protocol, written down before any of this data was downloaded** (satellite choice,
//! gap rule, fit window, sync spacing, frequency window, thresholds and bar):
//!
//! - satellites: every GPS Block IIF satellite in the IGS satellite metadata with a PRN in
//!   the window, kept only if its series has no gap longer than 10 minutes (shorter gaps
//!   are linearly interpolated onto the 30 s grid);
//! - fit a noise model and a linear frequency drift on the first third;
//! - from a sync every 3 570 s in the other two thirds, estimate the frequency over the
//!   preceding 3 600 s, carry that estimate's uncertainty as the model's own Allan
//!   deviation at 3 600 s, and measure where the root-mean-square coast error reaches 1,
//!   2, 5, 10 and 20 ns (each threshold only if it is reached within two days);
//! - a satellite passes if every predicted breach is within a factor of 1.5 of the
//!   measured one, the bar of the caesium test.
//!
//! **Outcome of that first run: not validated.** Eight of ten satellites (G06, G08, G09,
//! G10, G24, G26, G27, G32) land within the bar; G25 and G30 are optimistic, predicting
//! breaches 1.2 to 2.0 times later than measured, worst at the 1 ns threshold. G03 was
//! excluded by the gap rule (a missing day). The protocol requires every satellite to
//! pass, so the orbital case stays MODELLED; why those two differ was not investigated.
//!
//! Without the extracted file the test prints a skip notice and passes, unless
//! `KSHANA_REQUIRE_REALDATA=1`, when a missing file fails.

use std::collections::BTreeMap;

use kshana::slot_timing::{slot_budget, ClockNoise, SlotConditions};

fn data_path() -> std::path::PathBuf {
    if let Ok(p) = std::env::var("KSHANA_IGS_CLOCKS_PATH") {
        return std::path::PathBuf::from(p);
    }
    std::path::Path::new(env!("CARGO_MANIFEST_DIR")).join("realdata-cache/igs/gps_iif_clocks.txt")
}

const TAU0: f64 = 30.0;
/// Samples in 14 days at 30 s.
const N: usize = 14 * 2_880;
const MAX_GAP_S: i64 = 600;
const SYNC_STEP: usize = 119; // 3 570 s
const W_F: usize = 120; // 3 600 s
const T_MAX: usize = 5_760; // two days
const THRESHOLDS_S: [f64; 5] = [1e-9, 2e-9, 5e-9, 10e-9, 20e-9];
const BAR: f64 = 1.5;

/// Per-PRN series on the 30 s grid, or the reason the satellite is excluded.
fn load() -> Option<BTreeMap<String, Result<Vec<f64>, String>>> {
    let text = std::fs::read_to_string(data_path()).ok()?;
    let mut raw: BTreeMap<String, Vec<(i64, f64)>> = BTreeMap::new();
    for line in text.lines() {
        let mut it = line.split_whitespace();
        let (Some(prn), Some(t), Some(b)) = (it.next(), it.next(), it.next()) else {
            continue;
        };
        raw.entry(prn.to_string())
            .or_default()
            .push((t.parse().expect("time"), b.parse().expect("bias")));
    }
    let mut out = BTreeMap::new();
    for (prn, mut v) in raw {
        v.sort_by_key(|p| p.0);
        v.dedup_by_key(|p| p.0);
        let first_gap = v.windows(2).map(|w| w[1].0 - w[0].0).max().unwrap_or(0);
        let span_ok =
            v.first().map(|p| p.0) == Some(0) && v.last().map(|p| p.0) == Some((N as i64 - 1) * 30);
        if first_gap > MAX_GAP_S || !span_ok {
            out.insert(
                prn,
                Err(format!(
                    "excluded: longest gap {first_gap} s or incomplete span ({} records)",
                    v.len()
                )),
            );
            continue;
        }
        // Linear interpolation onto the 30 s grid.
        let mut x = Vec::with_capacity(N);
        let mut j = 0;
        for k in 0..N {
            let t = k as i64 * 30;
            while v[j + 1].0 < t {
                j += 1;
            }
            let (t0, b0) = v[j];
            let (t1, b1) = v[(j + 1).min(v.len() - 1)];
            x.push(if t1 == t0 {
                b0
            } else {
                b0 + (b1 - b0) * (t - t0) as f64 / (t1 - t0) as f64
            });
        }
        out.insert(prn, Ok(x));
    }
    Some(out)
}

fn drift_per_s(x: &[f64]) -> f64 {
    let y: Vec<f64> = x.windows(2).map(|w| (w[1] - w[0]) / TAU0).collect();
    let n = y.len() as f64;
    let mt = (n - 1.0) / 2.0;
    let my = y.iter().sum::<f64>() / n;
    let (mut sxy, mut sxx) = (0.0, 0.0);
    for (i, &v) in y.iter().enumerate() {
        let d = i as f64 - mt;
        sxy += d * (v - my);
        sxx += d * d;
    }
    sxy / sxx / TAU0
}

fn measured_rms(x: &[f64], from: usize) -> Vec<(f64, f64)> {
    let syncs: Vec<usize> = (from..x.len() - T_MAX).step_by(SYNC_STEP).collect();
    (1..=T_MAX)
        .map(|k| {
            let ss: f64 = syncs
                .iter()
                .map(|&s| {
                    let y_hat = (x[s] - x[s - W_F]) / W_F as f64;
                    let e = x[s + k] - x[s] - y_hat * k as f64;
                    e * e
                })
                .sum();
            (k as f64 * TAU0, (ss / syncs.len() as f64).sqrt())
        })
        .collect()
}

fn measured_breach(curve: &[(f64, f64)], thr: f64) -> Option<f64> {
    let mut prev = (0.0, 0.0);
    for &(t, r) in curve {
        if r >= thr {
            let f = (thr - prev.1) / (r - prev.1);
            return Some(prev.0 + f * (t - prev.0));
        }
        prev = (t, r);
    }
    None
}

/// Predicted and measured breach for every threshold the record reaches.
fn evaluate(x: &[f64]) -> Vec<(f64, f64, f64)> {
    let split = x.len() / 3;
    let mut noise = ClockNoise::from_phase_record(&x[..split], TAU0).expect("fit");
    noise.aging_per_day = drift_per_s(&x[..split]).abs() * 86_400.0;
    let curve = measured_rms(x, split);
    THRESHOLDS_S
        .iter()
        .filter_map(|&thr| {
            let m = measured_breach(&curve, thr)?;
            let c = SlotConditions {
                guard_s: thr,
                k_sigma: 1.0,
                fix_sigma_s: noise.white_pm_var.sqrt(),
                fix_frequency_sigma: noise.allan_deviation(W_F as f64 * TAU0),
                elapsed_since_sync_s: 0.0,
                fix_latency_s: 0.0,
                residual_frequency_offset: 0.0,
                temperature_excursion_k: 0.0,
            };
            let p = slot_budget(&noise, &c).unwrap().breach_after_sync_s;
            Some((thr, p, m))
        })
        .collect()
}

#[test]
fn holdover_prediction_on_gps_block_iif_satellite_clocks() {
    let Some(all) = load() else {
        assert!(
            std::env::var("KSHANA_REQUIRE_REALDATA").map_or(true, |v| v != "1"),
            "KSHANA_REQUIRE_REALDATA=1 but the IGS clock extract is missing at {}",
            data_path().display()
        );
        eprintln!(
            "SKIP: IGS clock extract not found at {} (run scripts/fetch_igs_clocks.sh)",
            data_path().display()
        );
        return;
    };
    let mut passed = Vec::new();
    let mut failed = Vec::new();
    for (prn, series) in &all {
        let x = match series {
            Ok(x) => x,
            Err(why) => {
                eprintln!("{prn}: {why}");
                continue;
            }
        };
        let rows = evaluate(x);
        let ok = !rows.is_empty()
            && rows
                .iter()
                .all(|&(_, p, m)| (1.0 / BAR..=BAR).contains(&(p / m)));
        let cells: Vec<String> = rows
            .iter()
            .map(|&(thr, p, m)| format!("{:.0} ns {:.0}/{:.0} s = {:.2}", thr * 1e9, p, m, p / m))
            .collect();
        eprintln!(
            "{prn}: {} | {}",
            if ok { "PASS" } else { "FAIL" },
            cells.join("; ")
        );
        if ok {
            passed.push(prn.clone());
        } else {
            failed.push(prn.clone());
        }
    }
    eprintln!(
        "passed {}: {passed:?}; failed {}: {failed:?}",
        passed.len(),
        failed.len()
    );
    assert!(
        passed.len() + failed.len() >= 5,
        "too few satellites evaluated"
    );
    // The pre-registered first run: 8 of 10 satellites within the bar; G25 and G30
    // optimistic, predicting breaches up to about 2x later than measured (worst at 1 ns).
    // Under the protocol the class is therefore NOT validated. This pins that published
    // outcome, so a change in the data, the fit or the inversion shows up here.
    assert_eq!(
        passed,
        ["G06", "G08", "G09", "G10", "G24", "G26", "G27", "G32"],
        "the set of satellites within the bar moved from the published first run"
    );
    assert_eq!(
        failed,
        ["G25", "G30"],
        "the failing set moved from the published first run"
    );
}
