// SPDX-License-Identifier: AGPL-3.0-only
//! PRO-37: the opt-in cell-averaging CFAR detector of `iq::acq` against its closed-form
//! false-alarm probability, under the bars of `docs/design/evidence/acq-cfar/PREREGISTRATION.md`
//! (committed before the code existed).
//!
//! C1 checks the closed form against Monte Carlo of the exact model; C2 and C3 run the detector
//! on every cell of real `iq::acq` searches over Gaussian and 2-bit quantised noise; C4 runs it on
//! a noise-free 2-bit GPS L1 C/A signal; C5 checks that it does not depend on the input scale.
//! Choices the pre-registration left open, fixed before the first run: the C4 signal amplitude
//! is 2.0 per component against the quantiser threshold 1.0 (so both levels occur), and since
//! +1250 Hz lies half-way between the 1000 and 1500 Hz bins, either counts as the nearest.

use kshana::iq::acq::{
    acquire, ca_cfar, ca_cfar_alpha, ca_cfar_cells, ca_cfar_pfa, AcqConfig, AcqGrid, CfarConfig,
};
use kshana::iq::signals::gps;
use kshana::iq::{Cf64, SampleSpec, SpreadingCode};
use rand::SeedableRng;
use rand_chacha::ChaCha8Rng;
use rand_distr::{Distribution, Gamma, StandardNormal};

const FS_HZ: f64 = 2.5e6;

fn spec() -> SampleSpec {
    SampleSpec {
        fs_hz: FS_HZ,
        center_hz: 1_575.42e6,
        if_hz: 0.0,
    }
}

fn search_cfg(m: usize) -> AcqConfig {
    AcqConfig {
        coherent_periods: 1,
        noncoherent: m,
        doppler_max_hz: 5000.0,
        doppler_step_hz: 500.0,
        pfa: 1e-3,
    }
}

fn noise(n: usize, seed: u64) -> Vec<Cf64> {
    let mut rng = ChaCha8Rng::seed_from_u64(seed);
    (0..n)
        .map(|_| {
            Cf64::new(
                StandardNormal.sample(&mut rng),
                StandardNormal.sample(&mut rng),
            )
        })
        .collect()
}

/// 2 bits per component: levels ±1 and ±3, decision threshold 1.0 (the unit noise σ).
fn two_bit(x: &[Cf64]) -> Vec<Cf64> {
    let q = |v: f64| v.signum() * if v.abs() > 1.0 { 3.0 } else { 1.0 };
    x.iter().map(|s| Cf64::new(q(s.re), q(s.im))).collect()
}

/// Per-cell false alarms over every cell of `seeds` searches on noise (`quantise`: 2-bit).
fn false_alarm_rate(m: usize, seeds: std::ops::Range<u64>, quantise: bool) -> (usize, usize) {
    let code = gps::l1ca(1).unwrap();
    let cfg = search_cfg(m);
    let cfar = CfarConfig::new(&spec(), &code, 16, 2, 1e-2);
    let (mut tests, mut hits) = (0, 0);
    for seed in seeds {
        let n = (FS_HZ * 1e-3) as usize * m;
        let mut x = noise(n, seed);
        if quantise {
            x = two_bit(&x);
        }
        let grid = acquire(&x, &spec(), &code, &cfg).unwrap();
        for row in ca_cfar_cells(&grid, &cfg, &cfar).unwrap() {
            tests += row.len();
            hits += row.iter().filter(|&&d| d).count();
        }
    }
    (tests, hits)
}

/// C1: the closed form against Monte Carlo of independent Gamma(M) cell and Gamma(NM) sum.
#[test]
fn c1_closed_form_matches_monte_carlo_of_the_exact_model() {
    let trials = 2_000_000usize;
    let mut fails = Vec::new();
    for m in [1usize, 2, 4] {
        for n in [8usize, 16, 32] {
            for pfa in [1e-2, 1e-3] {
                let alpha = ca_cfar_alpha(pfa, n, m);
                let x = Gamma::new(m as f64, 1.0).unwrap();
                let z = Gamma::new((n * m) as f64, 1.0).unwrap();
                let mut rng = ChaCha8Rng::seed_from_u64((m * 1000 + n) as u64 ^ pfa.to_bits());
                let hits = (0..trials)
                    .filter(|_| {
                        let (xv, zv): (f64, f64) = (x.sample(&mut rng), z.sample(&mut rng));
                        xv > alpha * zv / n as f64
                    })
                    .count();
                let p = hits as f64 / trials as f64;
                let bound = 3.0 * (pfa * (1.0 - pfa) / trials as f64).sqrt();
                eprintln!("C1 M={m} N={n} Pfa={pfa:e}: α={alpha:.4} measured {p:.6e}");
                if (p - pfa).abs() > bound {
                    fails.push(format!("M={m} N={n} Pfa={pfa:e}: {p:.6e}"));
                }
            }
        }
    }
    assert!(fails.is_empty(), "C1 missed: {fails:?}");
}

/// C2: Gaussian noise through `iq::acq`, every cell tested, M = 1 and 4.
#[test]
fn c2_false_alarm_rate_on_gaussian_noise() {
    let mut fails = Vec::new();
    for m in [1usize, 4] {
        let (tests, hits) = false_alarm_rate(m, 0..4, false);
        let p = hits as f64 / tests as f64;
        eprintln!("C2 M={m}: {hits} of {tests} cells, rate {p:.5} (design 0.01)");
        assert!(tests >= 200_000);
        if (p / 1e-2 - 1.0).abs() > 0.20 {
            fails.push(format!("M={m}: {p:.5}"));
        }
    }
    assert!(fails.is_empty(), "C2 missed: {fails:?}");
}

/// C3: the same on 2-bit quantised noise.
#[test]
fn c3_false_alarm_rate_on_two_bit_noise() {
    let mut fails = Vec::new();
    for m in [1usize, 4] {
        let (tests, hits) = false_alarm_rate(m, 100..104, true);
        let p = hits as f64 / tests as f64;
        eprintln!("C3 M={m}: {hits} of {tests} cells, rate {p:.5} (design 0.01)");
        assert!(tests >= 200_000);
        if (p / 1e-2 - 1.0).abs() > 0.20 {
            fails.push(format!("M={m}: {p:.5}"));
        }
    }
    assert!(fails.is_empty(), "C3 missed: {fails:?}");
}

/// What C4 measures: (detected, Doppler of the peak, code phase error in chips, off-peak
/// CFAR exceedances, off-peak cells tested, chips per sample).
fn c4_run() -> (bool, f64, f64, usize, usize, f64) {
    let code = gps::l1ca(1).unwrap();
    let (doppler, phase0) = (1250.0, 300.25);
    let rate = code.chip_rate_hz() * (1.0 + doppler / code.carrier_hz());
    let n = (FS_HZ * 1e-3) as usize;
    let x: Vec<Cf64> = (0..n)
        .map(|k| {
            let t = k as f64 / FS_HZ;
            let c = code.value_at(phase0 + rate * t);
            let ph = std::f64::consts::TAU * doppler * t;
            Cf64::new(2.0 * c * ph.cos(), 2.0 * c * ph.sin())
        })
        .collect();
    let x = two_bit(&x);
    let cfg = search_cfg(1);
    let cfar = CfarConfig::new(&spec(), &code, 16, 2, 1e-3);
    let grid: AcqGrid = acquire(&x, &spec(), &code, &cfg).unwrap();
    let r = ca_cfar(&grid, &cfg, &cfar).unwrap();
    let res = &grid.result;
    let chips_per_sample = code.chip_rate_hz() / FS_HZ;
    let dphase = {
        let d = (res.code_phase_chips - phase0).rem_euclid(1023.0);
        d.min(1023.0 - d)
    };
    // Off-peak exceedances of the peak's row, outside ±2 samples of the peak.
    let cells = ca_cfar_cells(&grid, &cfg, &cfar).unwrap();
    let row = &cells[r.doppler_index];
    let len = row.len();
    let far = |l: usize| {
        let d = (l + len - r.delay_samples) % len;
        d.min(len - d) > 2
    };
    let tested = (0..len).filter(|&l| far(l)).count();
    let above = (0..len).filter(|&l| far(l) && row[l]).count();
    let offsets: Vec<i64> = (0..len)
        .filter(|&l| far(l) && row[l])
        .map(|l| {
            let d = ((l + len - r.delay_samples) % len) as i64;
            if d > len as i64 / 2 {
                d - len as i64
            } else {
                d
            }
        })
        .collect();
    eprintln!("C4 REPORTED: lag offsets of the off-peak exceedances from the peak: {offsets:?}");
    let sigma_above = grid.grid[r.doppler_index]
        .iter()
        .filter(|&&v| v > res.threshold)
        .count();
    eprintln!(
        "C4: CFAR ratio {:.1} vs α {:.2} (detected {}); peak at {:+.0} Hz, code phase error \
         {dphase:.3} chip (1 sample {chips_per_sample:.3}); off-peak CFAR exceedances {above} of \
         {tested}; REPORTED: σ² statistic {:.1} vs threshold {:.1}, {sigma_above} cells of the \
         row above it",
        r.peak_ratio, r.alpha, r.detected, res.doppler_hz, res.statistic, res.threshold
    );
    (
        r.detected,
        res.doppler_hz,
        dphase,
        above,
        tested,
        chips_per_sample,
    )
}

/// C4: a noise-free 2-bit GPS L1 C/A signal.
#[test]
#[ignore = "FINDING F1 (run 2026-10-13): detection, Doppler bin (+1000 Hz, one of the two bins nearest +1250) and code phase (0.103 chip, bar 0.409) met; NOT MET: 32 of 2495 off-peak cells of the peak's row (1.28 %, bar 1 %) exceed the CFAR threshold. They sit in short runs at fixed lags (±357, ±408, ±914, ±1099 samples): the C/A code's deterministic correlation sidelobes, which a noise-free input leaves standing against a floor of other sidelobes, not the exponential cells the closed form assumes. Pinned by finding_noise_free_sidelobes_exceed_the_cfar_rate"]
fn c4_noise_free_two_bit_signal() {
    let (detected, doppler_hz, dphase, above, tested, chips_per_sample) = c4_run();
    let mut fails = Vec::new();
    if !detected {
        fails.push("not detected".to_string());
    }
    if (doppler_hz - 1250.0).abs() > 250.0 + 1e-9 {
        fails.push(format!("bin {doppler_hz} Hz"));
    }
    if dphase > chips_per_sample {
        fails.push(format!("code phase error {dphase:.3} chip"));
    }
    if above as f64 > 1e-2 * tested as f64 {
        fails.push(format!("{above} of {tested} off-peak cells above"));
    }
    assert!(fails.is_empty(), "C4 missed: {fails:?}");
}

/// Pins finding F1.
///
/// PIN-SCOPE:    the C4 decision, peak bin and the count of off-peak CFAR exceedances on the
///               noise-free 2-bit signal.
/// PIN-EXCLUDES: the σ² detector's numbers (reported only) and the exceedance positions.
#[test]
fn finding_noise_free_sidelobes_exceed_the_cfar_rate() {
    let (detected, doppler_hz, dphase, above, tested, _) = c4_run();
    assert!(detected && doppler_hz == 1000.0 && dphase < 0.11);
    assert_eq!((above, tested), (32, 2495));
}

/// C5: scaling the input by 7 leaves every CFAR decision unchanged.
#[test]
fn c5_decisions_do_not_depend_on_the_input_scale() {
    let code = gps::l1ca(1).unwrap();
    let cfg = search_cfg(1);
    let cfar = CfarConfig::new(&spec(), &code, 16, 2, 1e-2);
    let x = noise((FS_HZ * 1e-3) as usize, 7);
    let x7: Vec<Cf64> = x.iter().map(|s| *s * 7.0).collect();
    let a = ca_cfar_cells(&acquire(&x, &spec(), &code, &cfg).unwrap(), &cfg, &cfar).unwrap();
    let b = ca_cfar_cells(&acquire(&x7, &spec(), &code, &cfg).unwrap(), &cfg, &cfar).unwrap();
    let differ: usize = a
        .iter()
        .zip(&b)
        .map(|(r, s)| r.iter().zip(s).filter(|(p, q)| p != q).count())
        .sum();
    assert_eq!(differ, 0, "{differ} decisions changed with the scale");
    // The closed form is used as given: α for the design Pfa is finite and positive.
    let alpha = ca_cfar_alpha(1e-2, 16, 1);
    assert!(alpha > 0.0 && (ca_cfar_pfa(alpha, 16, 1) - 1e-2).abs() < 1e-12);
}
