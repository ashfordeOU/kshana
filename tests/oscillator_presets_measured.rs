// SPDX-License-Identifier: AGPL-3.0-only
//! Measured-unit validation of the four oscillator holdover presets
//! (`telecom_timing::PRESETS`, `holdover_model`, `synthesize_holdover`).
//!
//! PRE-REGISTRATION (written and committed before any fixture below was fetched or
//! digitised and before any comparison was run).
//!
//! The claim under test. Each preset carries its datasheet's Allan-deviation (ADEV)
//! MAXIMA, and kshana turns them into a white + flicker + random-walk frequency-noise
//! model scaled to envelope every datasheet point, with a flicker floor never below the
//! longest-τ figure, plus linear aging, synthesised as a seeded holdover. Because the
//! inputs are maxima, the testable consequence for a real unit of the named model is
//! one-sided: the unit's measured stability must be at or inside the model.
//!
//! Quantities and bars (all one-sided, no slack factor):
//! 1. ADEV. At every averaging time τ of the grid below, the measured overlapping ADEV
//!    of the unit (point estimate, kshana's `allan::overlapping_adev`, itself validated
//!    against Stable32) must be ≤ the preset model's ADEV `NoiseFit::adev(τ)` from
//!    `holdover_model`.
//! 2. Holdover. At every coast time τ of the grid below, the root-mean-square measured
//!    time error over sync points `t0` every 997 s (every 34 samples, 1 020 s, for 30 s data),
//!    `TE(t0, τ) = x(t0 + τ) − x(t0) − ȳ·τ` with ȳ the mean fractional frequency of the
//!    record (caesium) or of the day (rubidium), must be ≤ the root-mean-square time
//!    error at τ of 200 seeded `synthesize_holdover` runs (seeds 1..=200) of the same
//!    preset with no residual frequency offset at the loss (`initial_frequency_offset`
//!    0, matching ȳ's removal), no temperature swing (laboratory and station units), no
//!    locked-mode noise, the preset's own aging.
//!
//! Units and oracles:
//! - Caesium preset (Microchip 5071A, high-performance tube). Oracle: the measured
//!   5071A-versus-hydrogen-maser phase record, 556 990 one-second samples (A. Wallin,
//!   VTT MIKES, distributed with allantools; pinned commit and SHA-256 in
//!   scripts/fetch_cs5071a.sh; git-ignored, data-gated as in tests/cs5071a_reference.rs).
//!   ADEV grid τ = 1, 10, 100, 1 000, 10 000, 100 000 s (the datasheet τ the record can
//!   reach). Holdover grid τ = 100, 1 000, 10 000, 50 000 s; synthesis at 10 s steps.
//!   The record does not state the tube option; if it fails where the standard tube's
//!   figures would pass, that is reported as a finding with that caveat, not excused.
//! - Rubidium preset (Microchip 8040C). Oracle: IGS station THU2 (Thule), whose site
//!   log (thu200grl_20260327.log, section 6.3) records an external Symmetricom 8040C,
//!   s/n 0652013964, from 2013-03-19 to 2019-05-04. Its receiver clock estimates in the
//!   ESA Navigation Office MGEX final 30 s clock products
//!   (ESA0MGNFIN_YYYYDDD0000_01D_30S_CLK.CLK.gz,
//!   http://navigation-office.esa.int/products/gnss-products/, IGS data policy, open
//!   with attribution). Day list fixed now: the 15th of January, April, July and
//!   October from 2014-01-15 to 2019-04-15 (22 days; ESA MGEX finals start in 2014);
//!   a day with no file or no THU2 record is listed as missing, not replaced. Cleaning
//!   rule fixed now: from each day's phase x (s) form y_i = (x_{i+1} − x_i)/30 s; a
//!   step with |y_i − median(y)| > 1e-9 (a receiver clock reset or an epoch gap) is
//!   removed and the phase re-integrated without it; missing epochs split the day.
//!   ADEV grid τ = 30 s × {1, 4, 10, 33, 100, 333}, pooled over days (Allan variances
//!   averaged with weights equal to their term counts, then the square root).
//!   Holdover grid τ = 300, 990, 3 000 s (per-day ȳ), RMS pooled over all days;
//!   synthesis at 30 s steps. The clock product's reference time scale and estimation
//!   noise only add to the measured noise, so they cannot help a unit pass.
//! - CSAC preset (Microchip SA.45s). Oracle: R. Lutwak, "The SA.45s Chip-Scale Atomic
//!   Clock — Early Production Statistics", 43rd PTTI Meeting (2011), Figure 8:
//!   production-unit histograms of ADEV at τ = 1 s and 10 s (scored value: the UPPER
//!   edge of the highest occupied bin, i.e. the worst delivered unit, read
//!   conservatively), and Figure 4: the ADEV curve of a typical production unit
//!   (every digitised point scored). ADEV only; the paper gives no phase record.
//! - OCXO preset (Microchip OX-208). No measured record of an OX-208 is public. It
//!   stays in the claim and is the remaining blocker: the row cannot be promoted until a
//!   measured OX-208 record (phase against a better reference, at least a day) is
//!   supplied. `ocxo_preset_has_no_measured_record` documents this; it does not pass
//!   the preset.
//!
//! Disclosure. The THU2 station-log entry and one day of THU2 clock values
//! (2016-06-05, extracted during research, `scratch/research-b/sta.txt`) were seen
//! before this file was written; no ADEV or holdover statistic was computed from them.
//! The Lutwak abstract and text state production medians (7.1e-11 at 1 s, 2.4e-11 at
//! 10 s) "2-3X superior to specification"; those text values were read, the figures
//! were not.
//!
//! Mutation, to be shown: dividing every fitted noise level by 4 in `holdover_model`
//! (the model's ADEV halved) must turn at least one strict test red.

use kshana::allan::overlapping_adev;
use kshana::telecom_timing::{holdover_model, synthesize_holdover, HoldoverInput, HoldoverModel};

const FIXTURES: &str = "tests/fixtures/oscillator_presets_measured";
const SYNC_STEP: usize = 997;
const SEEDS: u64 = 200;

fn model(id: &str) -> (HoldoverInput, HoldoverModel) {
    let h = HoldoverInput {
        oscillator: id.into(),
        gnss_loss_s: 0.0,
        locked_te_sigma_ns: 0.0,
        initial_frequency_offset: 0.0,
        temperature_amplitude_k: 0.0,
        ..HoldoverInput::default()
    };
    let m = holdover_model(&h).expect("preset");
    (h, m)
}

/// RMS synthesised time error (s) at each coast time.
fn engine_rms_te(id: &str, dt: f64, taus: &[f64]) -> Vec<f64> {
    let (mut h, m) = model(id);
    let tmax = taus.iter().cloned().fold(0.0, f64::max);
    h.sample_interval_s = dt;
    h.duration_s = tmax + dt;
    let mut sum = vec![0.0; taus.len()];
    for seed in 1..=SEEDS {
        let rec = synthesize_holdover(&h, &m, seed).expect("synthesis");
        for (k, &tau) in taus.iter().enumerate() {
            let i = (tau / dt).round() as usize;
            let te = (rec.te_ns[i] - rec.te_ns[0]) * 1e-9;
            sum[k] += te * te;
        }
    }
    sum.iter().map(|s| (s / SEEDS as f64).sqrt()).collect()
}

/// RMS measured time error (s) at each coast time (in samples) for a phase record with
/// its mean frequency removed.
fn measured_te_sq(x: &[f64], tau0: f64, taus_m: &[usize]) -> Vec<(f64, usize)> {
    let n = x.len();
    let ybar = (x[n - 1] - x[0]) / ((n - 1) as f64 * tau0);
    taus_m
        .iter()
        .map(|&m| {
            let mut s = 0.0;
            let mut c = 0;
            let mut t0 = 0;
            while t0 + m < n {
                let te = x[t0 + m] - x[t0] - ybar * m as f64 * tau0;
                s += te * te;
                c += 1;
                t0 += SYNC_STEP.div_ceil(tau0 as usize).max(1);
            }
            (s, c)
        })
        .collect()
}

fn cs_phase() -> Option<Vec<f64>> {
    let p = std::env::var("KSHANA_CS5071A_PATH").map(std::path::PathBuf::from).unwrap_or_else(
        |_| std::path::Path::new(env!("CARGO_MANIFEST_DIR")).join("realdata-cache/cs5071a/5071A_phase.txt"),
    );
    let text = std::fs::read_to_string(p).ok()?;
    Some(
        text.lines()
            .map(str::trim)
            .filter(|l| !l.is_empty() && !l.starts_with('#'))
            .map(|l| l.parse::<f64>().expect("phase sample"))
            .collect(),
    )
}

fn require_realdata() -> bool {
    std::env::var("KSHANA_REQUIRE_REALDATA").is_ok_and(|v| v == "1")
}

#[test]
#[ignore = "pre-registered; not yet run"]
fn caesium_preset_envelopes_the_measured_5071a() {
    let Some(x) = cs_phase() else {
        assert!(!require_realdata(), "5071A record missing");
        eprintln!("skip: 5071A record not present (scripts/fetch_cs5071a.sh)");
        return;
    };
    let (_, m) = model("caesium");
    let mut ok = true;
    for tau in [1usize, 10, 100, 1_000, 10_000, 100_000] {
        let meas = overlapping_adev(&x, 1.0, tau);
        let lim = m.fit.adev(tau as f64);
        println!("Cs ADEV tau {tau:>6} s: measured {meas:.3e} model {lim:.3e} ratio {:.3}", meas / lim);
        ok &= meas <= lim;
    }
    let taus = [100.0, 1_000.0, 10_000.0, 50_000.0];
    let eng = engine_rms_te("caesium", 10.0, &taus);
    let taus_m: Vec<usize> = taus.iter().map(|&t| t as usize).collect();
    for ((tau, e), (s, c)) in taus.iter().zip(&eng).zip(measured_te_sq(&x, 1.0, &taus_m)) {
        let meas = (s / c as f64).sqrt();
        println!("Cs holdover tau {tau:>6} s: measured RMS {meas:.3e} s ({c} sync) model {e:.3e} ratio {:.3}", meas / e);
        ok &= meas <= *e;
    }
    assert!(ok, "the 5071A unit lies outside the caesium preset at some tau");
}

/// One THU2 day: contiguous cleaned phase segments (s), 30 s spacing.
fn thu2_days() -> Vec<(String, Vec<Vec<f64>>)> {
    let text = std::fs::read_to_string(format!("{FIXTURES}/thu2_8040c_esa_mgex.csv")).expect("THU2 fixture");
    // Columns: date, seconds_of_day, clock_bias_s. Cleaning per the header rule.
    let mut by_day: Vec<(String, Vec<(usize, f64)>)> = Vec::new();
    for l in text.lines().filter(|l| !l.starts_with('#') && !l.starts_with("date")) {
        let mut it = l.split(',');
        let d = it.next().unwrap().to_string();
        let sod: f64 = it.next().unwrap().parse().unwrap();
        let b: f64 = it.next().unwrap().parse().unwrap();
        if by_day.last().is_none_or(|(dd, _)| *dd != d) {
            by_day.push((d.clone(), Vec::new()));
        }
        by_day.last_mut().unwrap().1.push(((sod / 30.0).round() as usize, b));
    }
    by_day
        .into_iter()
        .map(|(d, pts)| {
            let mut y: Vec<(usize, f64)> = Vec::new();
            for w in pts.windows(2) {
                if w[1].0 == w[0].0 + 1 {
                    y.push((w[0].0, (w[1].1 - w[0].1) / 30.0));
                }
            }
            let mut ys: Vec<f64> = y.iter().map(|p| p.1).collect();
            ys.sort_by(f64::total_cmp);
            let med = ys[ys.len() / 2];
            // A step that is an outlier is removed and the phase re-integrated without
            // it (the segment continues); a missing epoch (a gap in the y indices that
            // is not a removed step) splits the day.
            let mut segs: Vec<Vec<f64>> = Vec::new();
            let mut prev: Option<usize> = None;
            for (i, yi) in y {
                let gap = prev.is_some_and(|p| i != p + 1);
                prev = Some(i);
                if segs.is_empty() || gap {
                    segs.push(vec![0.0]);
                }
                if (yi - med).abs() > 1e-9 {
                    continue;
                }
                let s = segs.last_mut().unwrap();
                let x = *s.last().unwrap() + yi * 30.0;
                s.push(x);
            }
            (d, segs)
        })
        .collect()
}

#[test]
#[ignore = "pre-registered; not yet run"]
fn rubidium_preset_envelopes_thu2_8040c() {
    let days = thu2_days();
    let (_, m) = model("rubidium");
    let mut ok = true;
    for k in [1usize, 4, 10, 33, 100, 333] {
        let (mut num, mut den) = (0.0, 0.0);
        for (_, segs) in &days {
            for s in segs {
                if s.len() > 2 * k + 1 {
                    let w = (s.len() - 2 * k) as f64;
                    num += w * overlapping_adev(s, 30.0, k).powi(2);
                    den += w;
                }
            }
        }
        let meas = (num / den).sqrt();
        let lim = m.fit.adev(30.0 * k as f64);
        println!("Rb ADEV tau {:>5} s: pooled measured {meas:.3e} model {lim:.3e} ratio {:.3}", 30 * k, meas / lim);
        ok &= meas <= lim;
    }
    let taus = [300.0, 990.0, 3_000.0];
    let eng = engine_rms_te("rubidium", 30.0, &taus);
    let taus_m: Vec<usize> = taus.iter().map(|&t| (t / 30.0) as usize).collect();
    let mut acc = vec![(0.0, 0usize); taus.len()];
    for (_, segs) in &days {
        for s in segs.iter().filter(|s| s.len() > 101) {
            for (a, b) in acc.iter_mut().zip(measured_te_sq(s, 30.0, &taus_m)) {
                a.0 += b.0;
                a.1 += b.1;
            }
        }
    }
    for ((tau, e), (s, c)) in taus.iter().zip(&eng).zip(acc) {
        let meas = (s / c as f64).sqrt();
        println!("Rb holdover tau {tau:>5} s: measured RMS {meas:.3e} s ({c} sync) model {e:.3e} ratio {:.3}", meas / e);
        ok &= meas <= *e;
    }
    println!("THU2 days used: {}", days.len());
    assert!(ok, "the THU2 8040C lies outside the rubidium preset at some tau");
}

#[test]
#[ignore = "pre-registered; not yet run"]
fn csac_preset_envelopes_sa45s_production_units() {
    let text = std::fs::read_to_string(format!("{FIXTURES}/sa45s_lutwak2011.csv")).expect("CSAC fixture");
    let (_, m) = model("csac");
    let mut ok = true;
    // Columns: source, tau_s, adev.
    for l in text.lines().filter(|l| !l.starts_with('#') && !l.starts_with("source")) {
        let mut it = l.split(',');
        let src = it.next().unwrap();
        let tau: f64 = it.next().unwrap().parse().unwrap();
        let meas: f64 = it.next().unwrap().parse().unwrap();
        let lim = m.fit.adev(tau);
        println!("CSAC {src} tau {tau:>8.1} s: measured {meas:.3e} model {lim:.3e} ratio {:.3}", meas / lim);
        ok &= meas <= lim;
    }
    assert!(ok, "an SA.45s production figure lies outside the CSAC preset");
}

#[test]
fn ocxo_preset_has_no_measured_record() {
    // Blocker, not a pass: the OX-208 preset stays in the claim with no measured record.
    let (_, m) = model("ocxo");
    assert!(m.preset.model.contains("OX-208"));
    assert!(!std::path::Path::new(&format!("{FIXTURES}/ox208_measured.csv")).exists());
}
