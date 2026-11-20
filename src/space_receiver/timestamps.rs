// SPDX-License-Identifier: AGPL-3.0-only
//! Timestamp faults in a space receiver's time tags.
//!
//! The input is a series of rows, each pairing the receiver's time tag (`t_rx_s`, seconds of its
//! own time scale; or `week` and `tow_s`) with an onboard reference count (`t_ref_s`, for example
//! the spacecraft's on-board time, which is monotonic and free of GNSS faults), optionally with the
//! clock bias the receiver reports (`clock_bias_s`). The detector follows the offset
//! `d = t_rx − t_ref`, which a healthy receiver keeps on a smooth line (the onboard clock's rate),
//! and reports, per row:
//!
//! * `time_reversal`: the time tag went backwards; `duplicate_time_tag`: it repeated;
//!   `duplicate_reference`: the reference count repeated;
//! * `gap`: the reference interval exceeds `gap_factor` times the nominal interval (the median);
//! * a step of the offset beyond the threshold, classified by its size: `millisecond_jump`
//!   (a whole number of milliseconds under 20 ms, the receiver steering its clock),
//!   `leap_second` (±1 s), `gps_utc_offset` (±18 s), `gps_tai_offset` (±19 s), `gps_bdt_offset`
//!   (±14 s), `tai_utc_offset` (±37 s), `moscow_offset` (±3 h), `week_skip` (±1 week),
//!   `week_rollover_1024`, `week_rollover_4096`, `week_rollover_8192` (the 10, 12 and 13-bit week
//!   counters), else `time_step`;
//! * `outlier`: a single row off the line that the next row returns to;
//! * `frequency_step`: the slope of the offset over the second half of the trailing window differs
//!   from the first half by more than `rate_sigma` standard errors and by at least `min_rate` (the
//!   window then keeps only its second half, so one change is reported once);
//! * `clock_bias_jump`: the reported clock bias moved by more than `bias_jump_s` between rows;
//! * `set_change_jump`: where the satellite set (an optional `sats` column, `G05;E11;...`)
//!   changed, the clock bias moved by more than twice `k_sigma` times the jump expected from the
//!   set change ([`set_change_sigma_s`]): a satellite with a large ranging error entered or left;
//! * `isb_unhandled`: with two systems in the sets, the clock bias follows the share of the second
//!   system ([`DualSystem`]), so the inter-system bias is absorbed by the clock.
//!
//! With a `clock_bias_s` column the report also gives disciplining evidence ([`Discipline`]):
//! steering steps, the free-running drift between them and the Allan deviation of the bias.
//!
//! The step threshold is `max(step_floor_s, k_sigma · x(Δt))`, with `x(Δt) = Δt·σ_y(Δt)` the
//! free-run time error of the stated oscillator class ([`super::clock`]) over the row interval
//! plus the scatter of the recent residuals. The offsets the classifier names are the published
//! time-scale relations (GPST = TAI − 19 s, BDT = GPST − 14 s, TAI − UTC = 37 s since 2017, so
//! GPST − UTC = 18 s) and the week-counter widths of the GPS, Galileo and BeiDou messages; see
//! [`crate::gnss_time`].
//!
//! MODELLED: the thresholds are stated parameters; detection rates are measured on the synthetic
//! series in the tests, not on flight data.

use super::clock::Oscillator;
use serde::Serialize;
use std::collections::BTreeMap;

/// The honesty label of every detector report.
pub const LABEL: &str =
    "MODELLED: a rule-based detector with stated thresholds; detection is demonstrated on \
synthetic series with injected faults, not on flight data.";

const WEEK_S: f64 = 604_800.0;

/// Detector parameters.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct Params {
    /// Smallest step reported, s.
    pub step_floor_s: f64,
    /// Multiple of the predicted free-run error and residual scatter that counts as a step.
    pub k_sigma: f64,
    /// A gap is a reference interval this many times the nominal one.
    pub gap_factor: f64,
    /// Trailing window for the line fit and the frequency-step test, rows.
    pub window: usize,
    /// Frequency-step test: standard errors.
    pub rate_sigma: f64,
    /// Frequency-step test: smallest slope change, s/s.
    pub min_rate: f64,
    /// Clock-bias jump, s.
    pub bias_jump_s: f64,
    /// Tolerance for naming a step after a known offset, s.
    pub name_tol_s: f64,
    /// One-sigma signal-in-space ranging error per satellite for the set-change model, m.
    pub sisre_m: f64,
}

impl Default for Params {
    fn default() -> Self {
        Self {
            step_floor_s: 1e-6,
            k_sigma: 6.0,
            gap_factor: 1.5,
            window: 20,
            rate_sigma: 8.0,
            min_rate: 1e-11,
            bias_jump_s: 5e-4,
            name_tol_s: 1e-3,
            sisre_m: 1.0,
        }
    }
}

/// One input row.
#[derive(Clone, Debug, PartialEq)]
pub struct Row {
    /// Onboard reference count, s.
    pub t_ref_s: f64,
    /// Receiver time tag, s.
    pub t_rx_s: f64,
    /// Clock bias the receiver reports, s.
    pub clock_bias_s: Option<f64>,
    /// Satellites used in the solution (`G05`, `E11`: system letter first), when given.
    pub sats: Option<Vec<String>>,
}

/// One detected fault.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct Event {
    /// Row index (0-based, data rows only).
    pub row: usize,
    /// Reference time of the row, s.
    pub t_ref_s: f64,
    /// Fault kind.
    pub kind: &'static str,
    /// Its size, s (a step, a gap, a reversal), or s/s for a frequency step.
    pub magnitude: f64,
}

/// The detector report.
#[derive(Clone, Debug, Serialize)]
pub struct Report {
    /// Document schema.
    pub schema: &'static str,
    /// Honesty label.
    pub label: &'static str,
    /// Rows read.
    pub rows: usize,
    /// Nominal (median) reference interval, s.
    pub nominal_interval_s: f64,
    /// Oscillator class whose noise sets the threshold.
    pub oscillator: String,
    /// Parameters.
    pub params: Params,
    /// Events, in row order.
    pub events: Vec<Event>,
    /// Count per kind.
    pub counts: BTreeMap<&'static str, usize>,
    /// Two-system bias check, with a `sats` column naming two systems.
    pub dual_system: Option<DualSystem>,
    /// Disciplining evidence, with a `clock_bias_s` column.
    pub discipline: Option<Discipline>,
}

/// The expected one-sigma jump (s) of a least-squares receiver-clock estimate when its satellite
/// set changes from `n1` to `n2` satellites with `common` kept, each satellite carrying an
/// independent ranging error of `sisre_m`: the clock absorbs the mean error of the set, so the
/// jump is the difference of two means, of variance `σ²(1/n1 + 1/n2 − 2k/(n1·n2))`.
pub fn set_change_sigma_s(n1: usize, n2: usize, common: usize, sisre_m: f64) -> f64 {
    if n1 == 0 || n2 == 0 {
        return 0.0;
    }
    let (a, b, k) = (n1 as f64, n2 as f64, common as f64);
    let v = (1.0 / a + 1.0 / b - 2.0 * k / (a * b)).max(0.0);
    sisre_m * v.sqrt() / 299_792_458.0
}

/// A receiver that solves one clock for two systems absorbs the inter-system bias (ISB) in
/// proportion to the share of the second system in its set: at a set change the clock moves by
/// `ISB · Δshare`. The check regresses the clock-bias change on the change of share over every
/// set change; a slope beyond five standard errors and 1 ns says the bias is not being handled.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct DualSystem {
    /// The two systems (letters).
    pub systems: [String; 2],
    /// Set changes used.
    pub set_changes: usize,
    /// Estimated absorbed bias, s.
    pub isb_s: f64,
    /// Its standard error, s.
    pub isb_se_s: f64,
    /// Whether the bias looks unhandled.
    pub unhandled: bool,
}

/// What the reported clock bias says about the receiver's clock disciplining.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct Discipline {
    /// Largest reported |clock bias|, s.
    pub max_abs_bias_s: f64,
    /// Steering steps (a whole number of milliseconds), count.
    pub steering_steps: usize,
    /// Free-running drift between steps (least-squares slope), s/s.
    pub drift: f64,
    /// Overlapping Allan deviation of the bias, with steps removed, at 1, 10 and 100 nominal
    /// intervals: `(tau_s, adev)`.
    pub adev: Vec<(f64, f64)>,
}

/// Overlapping Allan deviation of phase data `x` (s) sampled every `tau0` at `m·tau0`.
fn oadev(x: &[f64], tau0: f64, m: usize) -> Option<f64> {
    if m == 0 || x.len() < 2 * m + 1 {
        return None;
    }
    let n = x.len() - 2 * m;
    let s: f64 = (0..n)
        .map(|i| {
            let d = x[i + 2 * m] - 2.0 * x[i + m] + x[i];
            d * d
        })
        .sum();
    let tau = m as f64 * tau0;
    Some((s / (2.0 * n as f64 * tau * tau)).sqrt())
}

fn discipline(rows: &[Row], nominal: f64) -> Option<Discipline> {
    let b: Vec<(f64, f64)> = rows
        .iter()
        .filter_map(|r| r.clock_bias_s.map(|v| (r.t_ref_s, v)))
        .collect();
    if b.len() < 3 {
        return None;
    }
    let mut steps = 0usize;
    // Phase with the steering steps removed.
    let mut x = vec![b[0].1];
    let mut off = 0.0;
    let (mut sdt, mut sdx) = (0.0, 0.0);
    for w in b.windows(2) {
        let d = w[1].1 - w[0].1;
        let ms = (d * 1e3).round();
        if ms != 0.0 && (d - ms * 1e-3).abs() < 1e-5 {
            steps += 1;
            off -= ms * 1e-3;
        } else {
            sdt += w[1].0 - w[0].0;
            sdx += d;
        }
        x.push(w[1].1 + off);
    }
    let adev = [1usize, 10, 100]
        .iter()
        .filter_map(|&m| oadev(&x, nominal, m).map(|a| (m as f64 * nominal, a)))
        .collect();
    Some(Discipline {
        max_abs_bias_s: b.iter().map(|p| p.1.abs()).fold(0.0, f64::max),
        steering_steps: steps,
        drift: if sdt > 0.0 { sdx / sdt } else { 0.0 },
        adev,
    })
}

/// Name a step of the offset by its size.
pub fn classify_step(step_s: f64, tol_s: f64) -> &'static str {
    let a = step_s.abs();
    let near = |v: f64| (a - v).abs() <= tol_s.max(v * 1e-9);
    if a < 0.02 {
        let ms = (a * 1e3).round();
        if ms >= 1.0 && (a - ms * 1e-3).abs() <= 1e-5 {
            return "millisecond_jump";
        }
        return "time_step";
    }
    const NAMED: [(f64, &str); 10] = [
        (1.0, "leap_second"),
        (14.0, "gps_bdt_offset"),
        (18.0, "gps_utc_offset"),
        (19.0, "gps_tai_offset"),
        (37.0, "tai_utc_offset"),
        (10_800.0, "moscow_offset"),
        (WEEK_S, "week_skip"),
        (1024.0 * WEEK_S, "week_rollover_1024"),
        (4096.0 * WEEK_S, "week_rollover_4096"),
        (8192.0 * WEEK_S, "week_rollover_8192"),
    ];
    for (v, name) in NAMED {
        if near(v) {
            return name;
        }
    }
    "time_step"
}

/// Least-squares line `y = a + b·x` with the standard error of `b` and the residual RMS.
fn fit(pts: &[(f64, f64)]) -> Option<(f64, f64, f64, f64)> {
    let n = pts.len();
    if n < 2 {
        return None;
    }
    let nf = n as f64;
    let mx = pts.iter().map(|p| p.0).sum::<f64>() / nf;
    let my = pts.iter().map(|p| p.1).sum::<f64>() / nf;
    let sxx: f64 = pts.iter().map(|p| (p.0 - mx) * (p.0 - mx)).sum();
    if sxx <= 0.0 {
        return None;
    }
    let sxy: f64 = pts.iter().map(|p| (p.0 - mx) * (p.1 - my)).sum();
    let b = sxy / sxx;
    let a = my - b * mx;
    let ss: f64 = pts
        .iter()
        .map(|p| {
            let r = p.1 - a - b * p.0;
            r * r
        })
        .sum();
    let rms = if n > 2 { (ss / (nf - 2.0)).sqrt() } else { 0.0 };
    let se_b = rms / sxx.sqrt();
    Some((a, b, se_b, rms))
}

fn median(mut v: Vec<f64>) -> f64 {
    if v.is_empty() {
        return 0.0;
    }
    v.sort_by(f64::total_cmp);
    v[v.len() / 2]
}

/// Run the detector over the rows.
pub fn detect(rows: &[Row], osc: &Oscillator, p: &Params) -> Report {
    let mut events = Vec::new();
    let dts: Vec<f64> = rows
        .windows(2)
        .map(|w| w[1].t_ref_s - w[0].t_ref_s)
        .filter(|d| *d > 0.0)
        .collect();
    let nominal = median(dts);
    // The trailing window of accepted (t_ref, offset) points.
    let mut win: Vec<(f64, f64)> = Vec::new();
    // A row that broke the line, held to tell an outlier from a step.
    let mut pending: Option<(usize, f64)> = None;
    let push = |ev: &mut Vec<Event>, i: usize, kind: &'static str, m: f64| {
        ev.push(Event {
            row: i,
            t_ref_s: rows[i].t_ref_s,
            kind,
            magnitude: m,
        })
    };
    for i in 0..rows.len() {
        let r = &rows[i];
        let d = r.t_rx_s - r.t_ref_s;
        if i > 0 {
            let q = &rows[i - 1];
            let dt_ref = r.t_ref_s - q.t_ref_s;
            if dt_ref == 0.0 {
                push(&mut events, i, "duplicate_reference", 0.0);
            } else if nominal > 0.0 && dt_ref > p.gap_factor * nominal {
                push(&mut events, i, "gap", dt_ref);
            }
            if r.t_rx_s == q.t_rx_s {
                push(&mut events, i, "duplicate_time_tag", 0.0);
            } else if r.t_rx_s < q.t_rx_s && dt_ref >= 0.0 {
                push(&mut events, i, "time_reversal", r.t_rx_s - q.t_rx_s);
            }
            if let (Some(a), Some(b)) = (q.clock_bias_s, r.clock_bias_s) {
                if (b - a).abs() > p.bias_jump_s {
                    push(&mut events, i, "clock_bias_jump", b - a);
                }
            }
        }
        // Prediction from the trailing line (or the last point while the window is short).
        let (pred, scatter) = match fit(&win) {
            Some((a, b, _, rms)) if win.len() >= 3 => (a + b * r.t_ref_s, rms),
            _ => match win.last() {
                Some(&(_, y)) => (y, 0.0),
                None => (d, 0.0),
            },
        };
        let dt = win.last().map(|w| (r.t_ref_s - w.0).abs()).unwrap_or(0.0);
        let x_clock = if dt > 0.0 {
            dt * crate::powerlaw::allan_deviation(
                &osc.power_law(),
                dt,
                crate::clock_specs::CLOCK_F_H_HZ,
            )
        } else {
            0.0
        };
        let thr = p
            .step_floor_s
            .max(p.k_sigma * (x_clock * x_clock + scatter * scatter).sqrt());
        let resid = d - pred;
        if let Some((j, step_j)) = pending.take() {
            if resid.abs() <= thr {
                // Row j was off the line and this one is back on it.
                push(&mut events, j, "outlier", step_j);
            } else {
                // A step at row j: name it, restart the line from the new offset.
                push(&mut events, j, classify_step(step_j, p.name_tol_s), step_j);
                win.clear();
                win.push((rows[j].t_ref_s, rows[j].t_rx_s - rows[j].t_ref_s));
                // Test this row against the new line.
                let back = d - win[0].1;
                if back.abs() > thr {
                    pending = Some((i, back));
                    continue;
                }
            }
        } else if !win.is_empty() && resid.abs() > thr {
            pending = Some((i, resid));
            continue;
        }
        win.push((r.t_ref_s, d));
        if win.len() > p.window {
            win.remove(0);
        }
        // Frequency step: compare the two halves of a full window.
        if win.len() == p.window {
            let h = p.window / 2;
            if let (Some((_, b1, s1, _)), Some((_, b2, s2, _))) = (fit(&win[..h]), fit(&win[h..])) {
                let db = b2 - b1;
                let se = (s1 * s1 + s2 * s2).sqrt();
                if db.abs() >= p.min_rate && (se == 0.0 || db.abs() > p.rate_sigma * se) {
                    push(&mut events, i, "frequency_step", db);
                    let keep = win.split_off(h);
                    win = keep;
                }
            }
        }
    }
    if let Some((j, s)) = pending {
        push(&mut events, j, classify_step(s, p.name_tol_s), s);
    }
    // Set changes: an unexpectedly large clock-bias move where the satellite set changed, and the
    // two-system bias regression.
    let mut pairs: Vec<(f64, f64)> = Vec::new();
    let mut systems: Vec<char> = Vec::new();
    for r in rows {
        for s in r.sats.iter().flatten() {
            if let Some(c) = s.chars().next() {
                if !systems.contains(&c) {
                    systems.push(c);
                }
            }
        }
    }
    systems.sort_unstable();
    let share = |v: &[String], c: char| {
        if v.is_empty() {
            0.0
        } else {
            v.iter().filter(|s| s.starts_with(c)).count() as f64 / v.len() as f64
        }
    };
    for i in 1..rows.len() {
        let (q, r) = (&rows[i - 1], &rows[i]);
        let (Some(a), Some(b), Some(ba), Some(bb)) =
            (&q.sats, &r.sats, q.clock_bias_s, r.clock_bias_s)
        else {
            continue;
        };
        if a == b {
            continue;
        }
        let common = b.iter().filter(|s| a.contains(s)).count();
        let sig = set_change_sigma_s(a.len(), b.len(), common, p.sisre_m);
        let d = bb - ba;
        if systems.len() == 2 {
            pairs.push((share(b, systems[1]) - share(a, systems[1]), d));
        }
        let ms = (d * 1e3).round();
        let steering = ms != 0.0 && (d - ms * 1e-3).abs() < 1e-5;
        if !steering && d.abs() <= p.bias_jump_s && d.abs() > p.k_sigma * sig.max(1e-12) * 2.0 {
            push(&mut events, i, "set_change_jump", d);
        }
    }
    let dual_system = (systems.len() == 2 && pairs.len() >= 3).then(|| {
        let sxx: f64 = pairs.iter().map(|p| p.0 * p.0).sum();
        let sxy: f64 = pairs.iter().map(|p| p.0 * p.1).sum();
        let isb = if sxx > 0.0 { sxy / sxx } else { 0.0 };
        let rss: f64 = pairs.iter().map(|p| (p.1 - isb * p.0).powi(2)).sum();
        let se = if sxx > 0.0 {
            (rss / (pairs.len() as f64 - 1.0)).sqrt() / sxx.sqrt()
        } else {
            f64::INFINITY
        };
        DualSystem {
            systems: [systems[0].to_string(), systems[1].to_string()],
            set_changes: pairs.len(),
            isb_s: isb,
            isb_se_s: se,
            unhandled: isb.abs() > 1e-9 && isb.abs() > 5.0 * se,
        }
    });
    if dual_system.as_ref().is_some_and(|d| d.unhandled) {
        let last = rows.len() - 1;
        push(
            &mut events,
            last,
            "isb_unhandled",
            dual_system.as_ref().map_or(0.0, |d| d.isb_s),
        );
    }
    events.sort_by_key(|e| e.row);
    let mut counts = BTreeMap::new();
    for e in &events {
        *counts.entry(e.kind).or_insert(0) += 1;
    }
    Report {
        schema: "kshana.space-receiver-timestamps/1",
        label: LABEL,
        rows: rows.len(),
        nominal_interval_s: nominal,
        oscillator: osc.name.clone(),
        params: p.clone(),
        events,
        counts,
        dual_system,
        discipline: discipline(rows, nominal),
    }
}

/// Read the rows from CSV text: a header naming `t_ref_s` and either `t_rx_s` or `week` and
/// `tow_s`, optionally `clock_bias_s`; `#` lines and blank lines are skipped.
pub fn parse_csv(text: &str) -> Result<Vec<Row>, String> {
    let mut lines = text
        .lines()
        .enumerate()
        .filter(|(_, l)| !l.trim().is_empty() && !l.trim_start().starts_with('#'));
    let Some((_, header)) = lines.next() else {
        return Err(crate::terr!("e-space-receiver-no-columns"));
    };
    let cols: Vec<String> = header
        .split(',')
        .map(|c| c.trim().to_ascii_lowercase())
        .collect();
    let find = |n: &str| cols.iter().position(|c| c == n);
    let t_ref = find("t_ref_s");
    let t_rx = find("t_rx_s");
    let week = find("week");
    let tow = find("tow_s");
    let bias = find("clock_bias_s");
    let sats_col = find("sats");
    let Some(t_ref) = t_ref else {
        return Err(crate::terr!("e-space-receiver-no-columns"));
    };
    if t_rx.is_none() && (week.is_none() || tow.is_none()) {
        return Err(crate::terr!("e-space-receiver-no-columns"));
    }
    let mut rows = Vec::new();
    for (n, line) in lines {
        let cells: Vec<&str> = line.split(',').map(str::trim).collect();
        let num = |k: usize| -> Result<f64, String> {
            cells
                .get(k)
                .and_then(|s| s.parse::<f64>().ok())
                .filter(|v| v.is_finite())
                .ok_or_else(|| crate::terr!("e-space-receiver-bad-row", line = n + 1))
        };
        let t_rx_s = match (t_rx, week, tow) {
            (Some(k), _, _) => num(k)?,
            (None, Some(w), Some(t)) => num(w)? * WEEK_S + num(t)?,
            _ => unreachable!(),
        };
        let clock_bias_s = match bias {
            Some(k) if cells.get(k).is_some_and(|s| !s.is_empty()) => Some(num(k)?),
            _ => None,
        };
        let sats = sats_col.and_then(|k| cells.get(k)).map(|c| {
            c.split(';')
                .map(|s| s.trim().to_string())
                .filter(|s| !s.is_empty())
                .collect::<Vec<_>>()
        });
        rows.push(Row {
            t_ref_s: num(t_ref)?,
            t_rx_s,
            clock_bias_s,
            sats,
        });
    }
    if rows.len() < 3 {
        return Err(crate::terr!("e-space-receiver-too-few-rows"));
    }
    Ok(rows)
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::space_receiver::clock::oscillator;

    /// A clean 1 Hz series from an OCXO-like clock with a 2e-9 rate and 3 ns white noise.
    fn series(n: usize, seed: u64) -> Vec<Row> {
        use rand::{Rng, SeedableRng};
        let mut rng = rand_chacha::ChaCha8Rng::seed_from_u64(seed);
        (0..n)
            .map(|k| {
                let t = 1000.0 + k as f64;
                let noise: f64 = (rng.gen::<f64>() - 0.5) * 6e-9;
                Row {
                    t_ref_s: t,
                    t_rx_s: t + 5e-4 + 2e-9 * k as f64 + noise,
                    clock_bias_s: None,
                    sats: None,
                }
            })
            .collect()
    }

    fn kinds(r: &Report) -> Vec<(usize, &'static str)> {
        r.events.iter().map(|e| (e.row, e.kind)).collect()
    }

    #[test]
    fn a_clean_series_has_no_events() {
        let osc = oscillator("ocxo").unwrap();
        for seed in 0..5 {
            let r = detect(&series(600, seed), &osc, &Params::default());
            assert!(r.events.is_empty(), "seed {seed}: {:?}", r.events);
            assert_eq!(r.nominal_interval_s, 1.0);
        }
    }

    #[test]
    fn each_injected_fault_is_found_and_named() {
        let osc = oscillator("ocxo").unwrap();
        let mut rows = series(900, 7);
        // Leap second from row 100, 1 ms clock steer from row 200, an outlier at 300,
        // a week rollover from 400, a GPS-UTC confusion from 500.
        for r in rows.iter_mut().skip(100) {
            r.t_rx_s += 1.0;
        }
        for r in rows.iter_mut().skip(200) {
            r.t_rx_s -= 1e-3;
        }
        rows[300].t_rx_s += 2e-4;
        for r in rows.iter_mut().skip(400) {
            r.t_rx_s -= 1024.0 * WEEK_S;
        }
        for r in rows.iter_mut().skip(500) {
            r.t_rx_s -= 18.0;
        }
        let rep = detect(&rows, &osc, &Params::default());
        let k = kinds(&rep);
        assert!(k.contains(&(100, "leap_second")), "{k:?}");
        assert!(k.contains(&(200, "millisecond_jump")), "{k:?}");
        assert!(k.contains(&(300, "outlier")), "{k:?}");
        assert!(k.contains(&(400, "week_rollover_1024")), "{k:?}");
        assert!(k.contains(&(400, "time_reversal")), "{k:?}");
        assert!(k.contains(&(500, "gps_utc_offset")), "{k:?}");
        // Nothing else besides the reversals the backward steps cause.
        let other: Vec<_> = k
            .iter()
            .filter(|(row, _)| ![100, 200, 300, 400, 500].contains(row))
            .collect();
        assert!(other.is_empty(), "{other:?}");
    }

    #[test]
    fn gaps_duplicates_and_bias_jumps() {
        let osc = oscillator("ocxo").unwrap();
        let mut rows = series(200, 3);
        rows.remove(50);
        rows.remove(50);
        rows.remove(50);
        rows[120].t_rx_s = rows[119].t_rx_s;
        for (k, r) in rows.iter_mut().enumerate() {
            r.clock_bias_s = Some(if k >= 150 { 1.2e-3 } else { 2e-4 });
        }
        let rep = detect(&rows, &osc, &Params::default());
        let k = kinds(&rep);
        assert!(k.contains(&(50, "gap")), "{k:?}");
        assert!(k.contains(&(120, "duplicate_time_tag")), "{k:?}");
        assert!(k.contains(&(150, "clock_bias_jump")), "{k:?}");
        assert!(
            (rep.events
                .iter()
                .find(|e| e.kind == "gap")
                .unwrap()
                .magnitude
                - 4.0)
                .abs()
                < 1e-9
        );
    }

    #[test]
    fn a_frequency_step_is_found() {
        let osc = oscillator("ocxo").unwrap();
        let mut rows = series(400, 11);
        // The rate changes by 1e-8 s/s from row 200.
        for (k, r) in rows.iter_mut().enumerate().skip(200) {
            r.t_rx_s += 1e-8 * (k - 200) as f64;
        }
        let rep = detect(&rows, &osc, &Params::default());
        let f: Vec<_> = rep
            .events
            .iter()
            .filter(|e| e.kind == "frequency_step")
            .collect();
        assert!(!f.is_empty(), "{:?}", rep.events);
        assert!(f[0].row >= 200 && f[0].row < 240, "{:?}", f);
        assert!(rep.events.iter().all(|e| e.kind == "frequency_step"));
    }

    /// A 1 Hz series whose satellite set changes every 30 rows, alternating between sets with
    /// different Galileo shares; the clock bias carries `isb_s` times the Galileo share.
    fn mixed(isb_s: f64, seed: u64) -> Vec<Row> {
        use rand::{Rng, SeedableRng};
        let mut rng = rand_chacha::ChaCha8Rng::seed_from_u64(seed);
        let sets: [&[&str]; 3] = [
            &["G01", "G05", "G07", "G12", "E02", "E11"],
            &["G01", "G05", "G07", "G12", "G15", "E11"],
            &["G01", "G05", "E02", "E11", "E24", "E30"],
        ];
        let mut rows = series(300, seed);
        for (k, r) in rows.iter_mut().enumerate() {
            let set = sets[(k / 30) % 3];
            let gal = set.iter().filter(|s| s.starts_with('E')).count() as f64 / set.len() as f64;
            r.sats = Some(set.iter().map(|s| s.to_string()).collect());
            r.clock_bias_s =
                Some(2e-4 + 1e-9 * k as f64 + isb_s * gal + (rng.gen::<f64>() - 0.5) * 1e-10);
        }
        rows
    }

    #[test]
    fn an_absorbed_inter_system_bias_is_found_and_none_when_handled() {
        let osc = oscillator("ocxo").unwrap();
        let rep = detect(&mixed(40e-9, 5), &osc, &Params::default());
        let d = rep.dual_system.clone().unwrap();
        assert_eq!(d.systems, ["E".to_string(), "G".to_string()]);
        // The regression is on the share of the second system in letter order ("G"), so the
        // absorbed bias comes out with the opposite sign.
        assert!((d.isb_s + 40e-9).abs() < 2e-9, "{d:?}");
        assert!(d.unhandled);
        assert!(rep.events.iter().any(|e| e.kind == "isb_unhandled"));
        let rep = detect(&mixed(0.0, 5), &osc, &Params::default());
        assert!(!rep.dual_system.unwrap().unhandled);
        assert!(rep.events.is_empty(), "{:?}", rep.events);
    }

    #[test]
    fn a_bad_satellite_entering_the_set_is_a_set_change_jump() {
        let osc = oscillator("ocxo").unwrap();
        let mut rows = mixed(0.0, 9);
        // At row 60 the set changes and the clock moves by 300 ns: far beyond 1 m of ranging error.
        for r in rows.iter_mut().skip(60) {
            r.clock_bias_s = r.clock_bias_s.map(|b| b + 300e-9);
        }
        let rep = detect(&rows, &osc, &Params::default());
        assert!(
            rep.events
                .iter()
                .any(|e| e.row == 60 && e.kind == "set_change_jump"),
            "{:?}",
            rep.events
        );
        // The model's own scale: one satellite of six swapped, 1 m each: σ·√(2/36), about 0.8 ns.
        let s = set_change_sigma_s(6, 6, 5, 1.0);
        assert!((s * 299_792_458.0 - (2.0f64 / 36.0).sqrt()).abs() < 1e-12);
        assert_eq!(set_change_sigma_s(5, 5, 5, 1.0), 0.0);
    }

    #[test]
    fn disciplining_evidence() {
        let osc = oscillator("ocxo").unwrap();
        let mut rows = series(400, 2);
        for (k, r) in rows.iter_mut().enumerate() {
            // Drift 5e-9 s/s, steered back by 1 ms whenever the bias passes 1 ms.
            let free = 9.9e-4 + 5e-9 * k as f64;
            let steer = if k >= 200 { 1e-3 } else { 0.0 };
            r.clock_bias_s = Some(free - steer);
        }
        let d = detect(&rows, &osc, &Params::default()).discipline.unwrap();
        assert_eq!(d.steering_steps, 1);
        assert!((d.drift - 5e-9).abs() < 1e-12, "{}", d.drift);
        assert_eq!(d.adev.len(), 3);
        assert!(d.max_abs_bias_s < 1e-3);
    }

    #[test]
    fn classifier_names() {
        assert_eq!(classify_step(-1.0, 1e-3), "leap_second");
        assert_eq!(classify_step(0.003, 1e-3), "millisecond_jump");
        assert_eq!(classify_step(0.0031, 1e-3), "time_step");
        assert_eq!(classify_step(4096.0 * WEEK_S, 1e-3), "week_rollover_4096");
        assert_eq!(classify_step(10_800.000_5, 1e-3), "moscow_offset");
        assert_eq!(classify_step(14.0, 1e-3), "gps_bdt_offset");
        assert_eq!(classify_step(250.0, 1e-3), "time_step");
    }

    #[test]
    fn csv_reading() {
        let rows = parse_csv(
            "# a comment\nt_ref_s,week,tow_s,clock_bias_s\n0,2300,10,\n1,2300,11,1e-4\n2,2300,12,1e-4\n",
        )
        .unwrap();
        assert_eq!(rows.len(), 3);
        assert_eq!(rows[1].t_rx_s, 2300.0 * WEEK_S + 11.0);
        assert_eq!(rows[0].clock_bias_s, None);
        assert_eq!(rows[1].clock_bias_s, Some(1e-4));
        assert!(parse_csv("a,b\n1,2\n").is_err());
        assert!(parse_csv("t_ref_s,t_rx_s\n1,x\n2,3\n3,4\n").is_err());
        assert!(parse_csv("t_ref_s,t_rx_s\n1,1\n").is_err());
    }
}
