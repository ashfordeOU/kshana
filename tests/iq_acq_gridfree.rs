// SPDX-License-Identifier: AGPL-3.0-only
//! Grid-free acquisition (defect D12). Bars A1-A3 are pre-registered in
//! `docs/design/evidence/acq-gridfree/PREREGISTRATION.md` (commit dc0dfb0e), before any
//! implementation or measurement:
//!
//! * A1 `acquire_peak`'s `AcqResult` equals `acquire(..).result` bit for bit on GPS L1 C/A,
//!   Galileo E1-B and Galileo E5a-I;
//! * A2 the peak resident set (`VmHWM`) of a default hand-off acquisition of Galileo E5a-Q at
//!   25 MS/s is at most 256 MB, input included (ignored test, release);
//! * A3 the existing acquisition and tracking tests pass unchanged.

use kshana::iq::acq::{acquire, acquire_peak, AcqConfig};
use kshana::iq::cli::build_code;
use kshana::iq::track::design::Design;
use kshana::iq::{Cf64, SampleSpec, SpreadingCode};
use std::f64::consts::TAU;

/// `n` samples of `code` at `doppler` and code phase `phase0` chips plus unit-variance noise
/// at the given amplitude `amp` (xorshift + Box-Muller, seeded).
fn scene(
    code: &dyn SpreadingCode,
    fs: f64,
    doppler: f64,
    phase0: f64,
    amp: f64,
    n: usize,
) -> Vec<Cf64> {
    let rate = code.chip_rate_hz() * (1.0 + doppler / code.carrier_hz());
    let mut rng = 0x9e37_79b9_7f4a_7c15u64;
    let mut u = move || {
        rng ^= rng >> 12;
        rng ^= rng << 25;
        rng ^= rng >> 27;
        ((rng.wrapping_mul(0x2545_f491_4f6c_dd1d) >> 11) as f64 + 0.5) / (1u64 << 53) as f64
    };
    let s = std::f64::consts::FRAC_1_SQRT_2;
    (0..n)
        .map(|i| {
            let t = i as f64 / fs;
            let c = code.value_at(phase0 + rate * t) * amp;
            let ph = TAU * doppler * t;
            let (a, b, d, e) = (u(), u(), u(), u());
            let (r1, r2) = ((-2.0 * a.ln()).sqrt(), (-2.0 * d.ln()).sqrt());
            Cf64::new(
                s * r1 * (TAU * b).cos() + c * ph.cos(),
                s * r2 * (TAU * e).cos() + c * ph.sin(),
            )
        })
        .collect()
}

fn same_as_the_grid_path(signal: &str, prn: i64, fs: f64, amp: f64) {
    let code = build_code(signal, prn).unwrap();
    let spec = SampleSpec {
        fs_hz: fs,
        center_hz: code.carrier_hz(),
        if_hz: 0.0,
    };
    let period = code.period_s();
    let cfg = AcqConfig {
        coherent_periods: 1,
        noncoherent: 2,
        doppler_max_hz: 2.0 / period,
        doppler_step_hz: 2.0 / (3.0 * period),
        pfa: 1e-3,
    };
    let n = (fs * period).round() as usize * 2;
    for (doppler, phase) in [(0.9 / period, 100.5), (-1.6 / period, 777.25)] {
        let x = scene(&code, fs, doppler, phase, amp, n);
        let grid = acquire(&x, &spec, &code, &cfg).unwrap();
        let peak = acquire_peak(&x, &spec, &code, &cfg).unwrap();
        assert_eq!(peak, grid.result, "A1 {signal} at {doppler} Hz");
        assert!(
            peak.acquired,
            "{signal}: the scene must be acquirable: {peak:?}"
        );
    }
    // Noise only: the peak is some noise cell, and still identical.
    let x = scene(&code, fs, 0.0, 0.0, 0.0, n);
    assert_eq!(
        acquire_peak(&x, &spec, &code, &cfg).unwrap(),
        acquire(&x, &spec, &code, &cfg).unwrap().result,
        "A1 {signal} noise only"
    );
}

#[test]
fn a1_gps_l1ca() {
    same_as_the_grid_path("gps-l1ca", 7, 2.046e6, 0.15);
}

#[test]
fn a1_galileo_e1b() {
    same_as_the_grid_path("galileo-e1b", 11, 4.092e6, 0.15);
}

#[test]
fn a1_galileo_e5a_i() {
    same_as_the_grid_path("galileo-e5a-i", 5, 10.23e6, 0.08);
}

/// A2. Release, ignored (minutes): `cargo test --release --test iq_acq_gridfree a2 -- --ignored
/// --nocapture`. Linux only (`VmHWM`).
#[test]
#[ignore = "minutes, release, Linux"]
fn a2_e5a_q_at_25_msps_default_acquisition_stays_under_256_mb() {
    let fs = 25.0e6;
    let code = build_code("galileo-e5a-q", 7).unwrap();
    let spec = SampleSpec {
        fs_hz: fs,
        center_hz: code.carrier_hz(),
        if_hz: 0.0,
    };
    let cfg = Design::builtin_default().acq_config(code.period_s());
    let n = (fs * code.period_s()).round() as usize * cfg.coherent_periods * cfg.noncoherent;
    let bins = cfg.doppler_bins().len();
    println!(
        "{} samples ({:.0} MB), {bins} Doppler bins, {} lags: the grid path would need {:.1} GB",
        n,
        n as f64 * 16.0 / 1e6,
        n / cfg.coherent_periods / cfg.noncoherent,
        (bins * (n / cfg.coherent_periods / cfg.noncoherent)) as f64 * 8.0 / 1e9
    );
    let x = scene(&code, fs, 1234.0, 5000.5, 0.1, n);
    let t = std::time::Instant::now();
    let r = acquire_peak(&x, &spec, &code, &cfg).unwrap();
    let hwm_kb: u64 = std::fs::read_to_string("/proc/self/status")
        .unwrap()
        .lines()
        .find_map(|l| l.strip_prefix("VmHWM:"))
        .and_then(|v| v.split_whitespace().next()?.parse().ok())
        .expect("VmHWM");
    println!(
        "acquired={} doppler {:.1} Hz in {:.0} s; peak RSS {:.0} MB",
        r.acquired,
        r.doppler_hz,
        t.elapsed().as_secs_f64(),
        hwm_kb as f64 / 1024.0
    );
    assert!(
        hwm_kb <= 256 * 1000,
        "A2: peak RSS {} MB exceeds 256 MB",
        hwm_kb / 1000
    );
}
