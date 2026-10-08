// SPDX-License-Identifier: AGPL-3.0-only
//! Acquisition-surface export (`iq::acq_surface`, `kshana.acq-surface/1`).
//!
//! Pre-registered bars (fixed before the first run): S1 the surface's cells equal those of
//! `acquire` bit for bit; S2 on a noise-free signal half a bin off every grid Doppler, the
//! fine search is within 5 Hz of the truth (the bar the plan stated; its worst-case quantisation
//! bin/32 is 5.2 Hz at 4 ms, so a truth 5.0-5.2 Hz from a fine grid point would exceed it, and the
//! tested truths sit 3.7 Hz off it) while the coarse bin, the estimate with the refinement off, is
//! beyond 5 Hz at the same truths (the bar bites); and
//! the coarse bin is at least 60 Hz off; S3 the parabolic estimate is closer to the truth
//! than the coarse bin; S4 CSV, JSON and binary carry the same cells and the binary form
//! reads back exactly.

use kshana::iq::acq::{acquire, AcqConfig};
use kshana::iq::acq_surface::{Surface, SurfaceFormat, FINE_STEPS_PER_BIN};
use kshana::iq::cli::build_code;
use kshana::iq::{Cf64, SampleSpec, SpreadingCode};
use std::f64::consts::TAU;

const FS: f64 = 2.046e6;

fn spec() -> SampleSpec {
    SampleSpec {
        fs_hz: FS,
        center_hz: 1_575_420_000.0,
        if_hz: 0.0,
    }
}

/// `n` samples of PRN `prn` at `doppler` and code phase `phase0` chips, noise-free.
fn signal(prn: i64, doppler: f64, phase0: f64, n: usize) -> Vec<Cf64> {
    let code = build_code("gps-l1ca", prn).unwrap();
    let rate = code.chip_rate_hz() * (1.0 + doppler / code.carrier_hz());
    (0..n)
        .map(|i| {
            let t = i as f64 / FS;
            let c = code.value_at(phase0 + rate * t);
            let ph = TAU * doppler * t;
            Cf64::new(c * ph.cos(), c * ph.sin())
        })
        .collect()
}

fn cfg() -> AcqConfig {
    AcqConfig {
        coherent_periods: 4,
        noncoherent: 1,
        doppler_max_hz: 2000.0,
        doppler_step_hz: 2.0 / (3.0 * 4.0 * 1e-3),
        pfa: 1e-3,
    }
}

#[test]
fn the_surface_is_the_acquire_grid_bit_for_bit() {
    let code = build_code("gps-l1ca", 7).unwrap();
    let s = signal(7, 500.0, 321.5, 4 * 2046);
    let a = acquire(&s, &spec(), &code, &cfg()).unwrap();
    let surf = Surface::compute(&s, &spec(), &code, &cfg()).unwrap();
    assert_eq!(surf.grid, a.grid, "S1");
    let p = &surf.header.peak;
    assert_eq!(p.doppler_hz, a.result.doppler_hz);
    assert_eq!(p.delay_samples, a.result.delay_samples);
    assert_eq!(p.statistic, a.result.statistic);
    assert_eq!(p.acquired, a.result.acquired);
    assert_eq!(surf.grid[p.doppler_index][p.delay_samples], p.statistic);
    assert_eq!(surf.header.doppler_bins_hz.len(), surf.grid.len());
    assert_eq!(surf.header.samples_per_period, surf.grid[0].len());
    assert!((surf.code_phase_chips(p.delay_samples) - p.code_phase_chips).abs() < 1e-12);
}

#[test]
fn fine_doppler_removes_the_half_bin_error() {
    let code = build_code("gps-l1ca", 11).unwrap();
    let step = cfg().doppler_step_hz;
    let bins = cfg().doppler_bins();
    // Half a bin off a grid Doppler, on both sides of it.
    for (k, side) in [(3usize, 0.5), (12, -0.5), (20, 0.5)] {
        let truth = bins[k] + side * step + 3.7;
        let s = signal(11, truth, 700.25, 4 * 2046);
        let surf = Surface::compute(&s, &spec(), &code, &cfg()).unwrap();
        let h = &surf.header;
        assert!(h.peak.acquired);
        let coarse = (h.peak.doppler_hz - truth).abs();
        let fine = (h.fine_search.doppler_hz - truth).abs();
        assert!(coarse >= 60.0, "S2: coarse error {coarse} at truth {truth}");
        assert!(fine <= 5.0, "S2: fine error {fine} at truth {truth}");
        // With the refinement off (the coarse bin alone) the same bar fails.
        assert!(coarse > 5.0, "S2: the bar must bite: coarse error {coarse}");
        assert_eq!(
            h.fine_search.correction_hz,
            h.fine_search.doppler_hz - h.peak.doppler_hz
        );
        let par = h.parabolic.as_ref().expect("interior peak is concave");
        assert!(
            (par.doppler_hz - truth).abs() < coarse,
            "S3: parabolic {} vs coarse {coarse} at truth {truth}",
            (par.doppler_hz - truth).abs()
        );
        println!(
            "truth {truth:.1}: coarse {coarse:.1} Hz, parabolic {:.1} Hz, fine {fine:.1} Hz",
            (par.doppler_hz - truth).abs()
        );
    }
    assert_eq!(FINE_STEPS_PER_BIN, 16);
}

#[test]
fn csv_json_and_binary_carry_the_same_cells() {
    let code = build_code("gps-l1ca", 3).unwrap();
    let s = signal(3, -900.0, 100.0, 4 * 2046);
    let surf = Surface::compute(&s, &spec(), &code, &cfg()).unwrap();

    let mut bin = Vec::new();
    surf.write(&mut bin, SurfaceFormat::Binary).unwrap();
    let back = Surface::read_binary(std::io::Cursor::new(&bin)).unwrap();
    assert_eq!(back, surf, "S4: binary round trip is exact");

    let mut js = Vec::new();
    surf.write(&mut js, SurfaceFormat::Json).unwrap();
    let v: serde_json::Value = serde_json::from_slice(&js).unwrap();
    assert_eq!(v["header"]["schema"], "kshana.acq-surface/1");
    let rows: Vec<Vec<f64>> = serde_json::from_value(v["rows"].clone()).unwrap();
    assert_eq!(rows, surf.grid);

    let mut csv = Vec::new();
    surf.write(&mut csv, SurfaceFormat::Csv).unwrap();
    let text = String::from_utf8(csv).unwrap();
    let data: Vec<&str> = text.lines().filter(|l| !l.starts_with('#')).collect();
    assert_eq!(data[0], "doppler_hz,delay_samples,code_phase_chips,power");
    let cells = surf.grid.len() * surf.grid[0].len();
    assert_eq!(data.len(), 1 + cells);
    let mut it = data[1..].iter();
    for (j, row) in surf.grid.iter().enumerate() {
        for (t, &v) in row.iter().enumerate() {
            let f: Vec<f64> = it
                .next()
                .unwrap()
                .split(',')
                .map(|x| x.parse().unwrap())
                .collect();
            assert_eq!(f[0], surf.header.doppler_bins_hz[j]);
            assert_eq!(f[1] as usize, t);
            assert_eq!(f[3], v);
        }
    }
    // A truncated binary file is an error.
    assert!(Surface::read_binary(std::io::Cursor::new(&bin[..bin.len() - 9])).is_err());
}

#[test]
fn a_noise_only_surface_says_not_acquired() {
    let code = build_code("gps-l1ca", 5).unwrap();
    // Unit-variance complex noise (xorshift + Box-Muller): no signal at all.
    let mut rng = 0x2545_f491_4f6c_dd1du64;
    let mut u = move || {
        rng ^= rng >> 12;
        rng ^= rng << 25;
        rng ^= rng >> 27;
        ((rng.wrapping_mul(0x2545_f491_4f6c_dd1d) >> 11) as f64 + 0.5) / (1u64 << 53) as f64
    };
    let s: Vec<Cf64> = (0..4 * 2046)
        .map(|_| {
            let (a, b) = (u(), u());
            let r = (-a.ln()).sqrt();
            Cf64::new(r * (TAU * b).cos(), r * (TAU * b).sin())
        })
        .collect();
    let surf = Surface::compute(&s, &spec(), &code, &cfg()).unwrap();
    assert!(!surf.header.peak.acquired);
    assert!(surf.header.peak.statistic < surf.header.peak.threshold);
}

#[test]
fn an_oversized_surface_is_refused() {
    let code = build_code("gps-l1ca", 5).unwrap();
    let s = signal(5, 0.0, 0.0, 4 * 2046);
    let c = AcqConfig {
        doppler_max_hz: 1.0e9,
        doppler_step_hz: 10.0,
        ..cfg()
    };
    assert!(Surface::compute(&s, &spec(), &code, &c)
        .unwrap_err()
        .contains("cells"));
}
