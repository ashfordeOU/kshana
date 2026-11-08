// SPDX-License-Identifier: AGPL-3.0-only
//! D8a row 3 (`VM-f5e2ce4e`): the CA-CFAR reference set over the whole Doppler row
//! ([`CfarReference::Row`]), against C2 to C5 of `docs/design/evidence/acq-cfar/PREREGISTRATION.md`
//! as registered, with the readings of `xval/d8a-cfar-reference/` (committed before the change).
//! C1 (the closed form, unchanged) is re-run by `tests/iq_acq_cfar.rs`.
//!
//! * the control: the registered set reproduces the recorded C2, C3, C4 and C5 numbers;
//! * the scored run: C2 and C3 on the registered and fresh seeds, C4 on the registered and the
//!   four fresh signals, C5, all with the row set.
//!
//! Result (scored once, 2026-11-08): MET on re-run. C2/C3 0.969 % to 1.033 %; C4 detected on all
//! five signals with 0, 3, 4, 0 and 0 of 2495 off-peak cells above; C5 0 changes
//! (`docs/design/evidence/d8a-iq-tracking-cn0-rerun/RESULTS.md`).
//!
//! PIN-SCOPE: the C2/C3 false-alarm counts and the C4 exceedance counts of the scored run.
//! PIN-EXCLUDES: output hashes.

use kshana::iq::acq::{acquire, ca_cfar, ca_cfar_cells, AcqConfig, CfarConfig, CfarReference};
use kshana::iq::signals::gps;
use kshana::iq::{Cf64, SampleSpec, SpreadingCode};
use rand::SeedableRng;
use rand_chacha::ChaCha8Rng;
use rand_distr::{Distribution, StandardNormal};

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

fn two_bit(x: &[Cf64]) -> Vec<Cf64> {
    let q = |v: f64| v.signum() * if v.abs() > 1.0 { 3.0 } else { 1.0 };
    x.iter().map(|s| Cf64::new(q(s.re), q(s.im))).collect()
}

/// Per-cell false alarms over every cell of the searches with `seeds` (C2, C3).
fn false_alarms(
    m: usize,
    seeds: std::ops::Range<u64>,
    quantise: bool,
    r: CfarReference,
) -> (usize, usize) {
    let code = gps::l1ca(1).unwrap();
    let cfg = search_cfg(m);
    let cfar = CfarConfig::new(&spec(), &code, 16, 2, 1e-2).with_reference(r);
    let (mut tests, mut hits) = (0, 0);
    for seed in seeds {
        let mut x = noise((FS_HZ * 1e-3) as usize * m, seed);
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

/// C4 on one noise-free 2-bit signal: (detected, peak Doppler, code-phase error in chips,
/// off-peak exceedances, off-peak cells, chips per sample, N).
fn c4(
    prn: u16,
    doppler: f64,
    phase0: f64,
    r: CfarReference,
) -> (bool, f64, f64, usize, usize, f64, usize) {
    let code = gps::l1ca(prn).unwrap();
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
    let cfar = CfarConfig::new(&spec(), &code, 16, 2, 1e-3).with_reference(r);
    let grid = acquire(&x, &spec(), &code, &cfg).unwrap();
    let res = ca_cfar(&grid, &cfg, &cfar).unwrap();
    let g = &grid.result;
    let dphase = {
        let d = (g.code_phase_chips - phase0).rem_euclid(1023.0);
        d.min(1023.0 - d)
    };
    let cells = ca_cfar_cells(&grid, &cfg, &cfar).unwrap();
    let row = &cells[res.doppler_index];
    let len = row.len();
    let far = |l: usize| {
        let d = (l + len - res.delay_samples) % len;
        d.min(len - d) > 2
    };
    let tested = (0..len).filter(|&l| far(l)).count();
    let above = (0..len).filter(|&l| far(l) && row[l]).count();
    (
        res.detected,
        g.doppler_hz,
        dphase,
        above,
        tested,
        code.chip_rate_hz() / FS_HZ,
        cfar.n_ref(len),
    )
}

const SIGNALS: [(u16, f64, f64); 5] = [
    (1, 1250.0, 300.25),
    (7, -2500.0, 17.5),
    (13, -750.0, 511.0),
    (22, 500.0, 800.75),
    (31, 3000.0, 1000.25),
];

fn c5(r: CfarReference) -> usize {
    let code = gps::l1ca(1).unwrap();
    let cfg = search_cfg(1);
    let cfar = CfarConfig::new(&spec(), &code, 16, 2, 1e-2).with_reference(r);
    let x = noise((FS_HZ * 1e-3) as usize, 7);
    let x7: Vec<Cf64> = x.iter().map(|s| *s * 7.0).collect();
    let a = ca_cfar_cells(&acquire(&x, &spec(), &code, &cfg).unwrap(), &cfg, &cfar).unwrap();
    let b = ca_cfar_cells(&acquire(&x7, &spec(), &code, &cfg).unwrap(), &cfg, &cfar).unwrap();
    a.iter()
        .zip(&b)
        .map(|(r, s)| r.iter().zip(s).filter(|(p, q)| p != q).count())
        .sum()
}

#[test]
fn control_the_registered_set_reproduces_the_recorded_numbers() {
    let w = CfarReference::Window;
    assert_eq!(false_alarms(1, 0..4, false, w), (210_000, 2052));
    assert_eq!(false_alarms(4, 0..4, false, w), (210_000, 2034));
    assert_eq!(false_alarms(1, 100..104, true, w), (210_000, 2112));
    assert_eq!(false_alarms(4, 100..104, true, w), (210_000, 2097));
    let (det, _, _, above, tested, _, n) = c4(1, 1250.0, 300.25, w);
    assert!(det);
    assert_eq!((above, tested, n), (32, 2495, 16));
    assert_eq!(c5(w), 0);
}

#[test]
fn c2_to_c5_with_the_row_reference_set() {
    let r = CfarReference::Row;
    let mut miss = Vec::new();
    for (bar, quantise, seen, fresh) in [
        ("C2", false, 0..4u64, 100_000..100_004u64),
        ("C3", true, 100..104, 100_100..100_104),
    ] {
        for (which, seeds) in [("seen", seen), ("fresh", fresh)] {
            for m in [1usize, 4] {
                let (tests, hits) = false_alarms(m, seeds.clone(), quantise, r);
                let p = hits as f64 / tests as f64;
                eprintln!(
                    "{bar} {which} M={m}: {hits} of {tests} cells, rate {p:.5} (design 0.01)"
                );
                assert!(tests >= 200_000);
                if (p / 1e-2 - 1.0).abs() > 0.20 {
                    miss.push(format!("{bar} {which} M={m}: {p:.5}"));
                }
            }
        }
    }
    for (prn, f, p) in SIGNALS {
        let (det, dopp, dphase, above, tested, cps, n) = c4(prn, f, p, r);
        eprintln!(
            "C4 PRN {prn} {f:+.0} Hz {p} chips: detected {det}; peak {dopp:+.0} Hz; code phase error {dphase:.3} chip (1 sample {cps:.3}); off-peak exceedances {above} of {tested} ({:.4}); N = {n}",
            above as f64 / tested as f64
        );
        if !det {
            miss.push(format!("C4 PRN {prn}: not detected"));
        }
        if (dopp - f).abs() > 250.0 + 1e-9 {
            miss.push(format!("C4 PRN {prn}: bin {dopp}"));
        }
        if dphase > cps {
            miss.push(format!("C4 PRN {prn}: code phase {dphase:.3}"));
        }
        if above as f64 > 1e-2 * tested as f64 {
            miss.push(format!("C4 PRN {prn}: {above} of {tested}"));
        }
    }
    let d = c5(r);
    eprintln!("C5: {d} decisions change with the input x 7");
    if d != 0 {
        miss.push(format!("C5: {d}"));
    }
    assert!(miss.is_empty(), "D8a row 3 NOT MET: {miss:?}");
    // Pinned from the scored run (2026-11-08): MET.
    let pinned_fa = [2120, 2035, 2057, 2169, 2091, 2122, 2074, 2139];
    let got_fa: Vec<usize> = [
        (false, 0..4u64),
        (false, 100_000..100_004),
        (true, 100..104),
        (true, 100_100..100_104),
    ]
    .into_iter()
    .flat_map(|(q, seeds)| [1usize, 4].map(|m| false_alarms(m, seeds.clone(), q, r).1))
    .collect();
    assert_eq!(got_fa, pinned_fa, "C2/C3 counts moved");
    let got_c4: Vec<usize> = SIGNALS
        .iter()
        .map(|&(prn, f, p)| c4(prn, f, p, r).3)
        .collect();
    assert_eq!(got_c4, [0, 3, 4, 0, 0], "C4 exceedances moved");
}
