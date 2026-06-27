// SPDX-License-Identifier: AGPL-3.0-only
//! Externally validate the spoof-monitor **CUSUM detection kernel** that underpins
//! the Timing Protection Level (TPL) under a time-synchronisation attack
//! (`src/tpl.rs`), against **published change-detection theory** — not against
//! kshana's own arithmetic.
//!
//! A *timing* receiver under GNSS spoofing must bound the worst-case *undetected*
//! time error before a clock-aided sequential change detector alarms. Two kernels
//! of that bound are exactly checkable against external authorities, and they are
//! what this test validates:
//!
//!   1. **Deterministic worst-case latency** `tpl::cusum_latency_s(kref,h,z,dt)`.
//!      A one-sided tabular CUSUM accumulates `S_n = max(0, S_{n-1}+z-kref)` and
//!      alarms on `S_n > h` (strict). For a constant standardized increment
//!      `z > kref` the first-passage sample is the exact integer
//!      `N = floor(h/(z-kref)) + 1` and the latency is `N*dt` s. The oracle is the
//!      first-passage time of the CUSUM recursion itself, computed independently in
//!      Python; here we additionally cross-check that kshana's own running
//!      `tpl::Cusum` alarms at the same integer sample. This is asserted to **EXACT
//!      integer / latency equality** over >= 12 cases.
//!
//!   2. **Out-of-control ARL1(delta)** of the same CUSUM under i.i.d. residuals
//!      `N(delta, 1)`, `k = kref = 0.5`, `h in {4,5}`, `delta in {0.5,1,1.5,2}`.
//!      kshana's ACTUAL `tpl::Cusum` is run in a seeded, >= 20000-trial Monte Carlo
//!      and the measured ARL1 is compared to two independent committed anchors:
//!        * Siegmund (1985) Brownian ARL (Hawkins & Olwell 1998, eq. 3.7) — 5%, and
//!        * Montgomery published tabular-CUSUM ARL tables (k=1/2, h=4 & h=5) — 8%.
//!
//! **Honest scope.** This validates the detection KERNEL (the latency identity and
//! the ARL1 law that set how fast a spoof is caught). The composed
//! `tpl::timing_protection_level_ns` bound stays **MODELLED**: it is a conditional
//! bridge over separately validated primitives, and a slow-enough ramp evades a
//! single clock-aided monitor with no finite unconditional bound. The Montgomery
//! tables are two-sided; we compare only out-of-control points (delta>0) where the
//! lower accumulator is inert, so the two-sided value equals the one-sided ARL1 —
//! the in-control ARL0 (one- vs two-sided ~2x apart) is never compared.
//!
//! Reference data, provenance and the committed generator live in
//! `tests/fixtures/timing_protection_level_under_spoofing/`.

use kshana::tpl::{cusum_latency_s, Cusum};
use rand::SeedableRng;
use rand_chacha::ChaCha8Rng;
use rand_distr::{Distribution, Normal};

const REF: &str = include_str!(
    "fixtures/timing_protection_level_under_spoofing/timing_protection_level_under_spoofing_reference.txt"
);

/// Monte-Carlo trials per (h, delta) ARL1 estimate. The 1-sigma relative scatter
/// of the run-length mean is roughly ARL/sqrt(ARL * trials); at the longest ARL
/// here (~38) and 60k trials that is well under 1%, comfortably inside the gates.
const MC_TRIALS: usize = 60_000;
/// Safety cap so an aberrant run can't loop forever; far above any ARL1 here.
const MC_MAX_SAMPLES: usize = 5_000;

/// Mean out-of-control run length of kshana's `tpl::Cusum` fed i.i.d. `N(delta,1)`
/// residuals: the sample index of the first alarm, averaged over `MC_TRIALS`
/// seeded runs. This exercises the real detector recursion, not a reimplementation.
fn mc_arl1(kref: f64, h: f64, delta: f64, seed: u64) -> f64 {
    let mut rng = ChaCha8Rng::seed_from_u64(seed);
    let dist = Normal::new(delta, 1.0).unwrap();
    let mut total: u64 = 0;
    for _ in 0..MC_TRIALS {
        let mut c = Cusum::new(kref, h);
        let mut n = 0usize;
        loop {
            n += 1;
            let z = dist.sample(&mut rng);
            if c.update(z) {
                break;
            }
            if n >= MC_MAX_SAMPLES {
                break;
            }
        }
        total += n as u64;
    }
    total as f64 / MC_TRIALS as f64
}

#[test]
fn cusum_latency_matches_first_passage_oracle_exactly() {
    let mut n = 0usize;
    for line in REF.lines() {
        if !line.starts_with("LATENCY ") {
            continue;
        }
        // LATENCY kref h z dt | samples latency_s
        let parts: Vec<&str> = line.splitn(2, '|').collect();
        assert_eq!(parts.len(), 2, "LATENCY row needs a '|': {line}");
        let head: Vec<&str> = parts[0].split_whitespace().collect();
        assert_eq!(head.len(), 5, "LATENCY head: LATENCY kref h z dt");
        let kref: f64 = head[1].parse().unwrap();
        let h: f64 = head[2].parse().unwrap();
        let z: f64 = head[3].parse().unwrap();
        let dt: f64 = head[4].parse().unwrap();
        let tail: Vec<&str> = parts[1].split_whitespace().collect();
        assert_eq!(tail.len(), 2, "LATENCY tail: samples latency_s");
        let want_samples: i64 = tail[0].parse().unwrap();
        let want_latency: f64 = tail[1].parse().unwrap();

        // (a) closed form latency == oracle latency, EXACTLY.
        let got_latency = cusum_latency_s(kref, h, z, dt);
        assert!(
            got_latency.is_finite(),
            "LATENCY kref={kref} h={h} z={z}: expected finite latency"
        );
        assert_eq!(
            got_latency, want_latency,
            "LATENCY kref={kref} h={h} z={z} dt={dt}: cusum_latency_s {got_latency} \
             vs first-passage oracle {want_latency}"
        );
        // The closed form must equal N*dt with the published integer N.
        assert_eq!(
            got_latency,
            want_samples as f64 * dt,
            "LATENCY kref={kref} h={h} z={z}: latency != N*dt (N={want_samples})"
        );

        // (b) kshana's OWN running detector must alarm at the same integer sample.
        let mut c = Cusum::new(kref, h);
        let mut alarm_at = 0i64;
        for i in 1..=1_000_000i64 {
            if c.update(z) {
                alarm_at = i;
                break;
            }
        }
        assert_eq!(
            alarm_at, want_samples,
            "LATENCY kref={kref} h={h} z={z}: running Cusum alarmed at sample \
             {alarm_at}, oracle first passage {want_samples}"
        );
        n += 1;
    }
    assert!(
        n >= 12,
        "expected >= 12 deterministic latency cases, got {n}"
    );
    eprintln!("cusum latency: {n} cases vs first-passage oracle, EXACT integer match");
}

#[test]
fn cusum_arl1_matches_siegmund_and_montgomery() {
    let mut n = 0usize;
    let mut worst_sieg = 0.0_f64;
    let mut worst_mont = 0.0_f64;
    // Distinct seed per case so the estimates are independent draws.
    let mut seed: u64 = 0x5150_2024_0617;
    for line in REF.lines() {
        if !line.starts_with("ARL1 ") {
            continue;
        }
        // ARL1 kref h delta | siegmund montgomery
        let parts: Vec<&str> = line.splitn(2, '|').collect();
        assert_eq!(parts.len(), 2, "ARL1 row needs a '|': {line}");
        let head: Vec<&str> = parts[0].split_whitespace().collect();
        assert_eq!(head.len(), 4, "ARL1 head: ARL1 kref h delta");
        let kref: f64 = head[1].parse().unwrap();
        let h: f64 = head[2].parse().unwrap();
        let delta: f64 = head[3].parse().unwrap();
        let anchors: Vec<f64> = parts[1]
            .split_whitespace()
            .map(|x| x.parse().unwrap())
            .collect();
        assert_eq!(anchors.len(), 2, "ARL1 tail: siegmund montgomery");
        let sieg = anchors[0];
        let mont = anchors[1];

        assert!(
            delta > 0.0,
            "ARL1 validation is scoped to OUT-of-control shifts (delta > 0)"
        );

        seed = seed
            .wrapping_mul(6364136223846793005)
            .wrapping_add(1442695040888963407);
        let arl = mc_arl1(kref, h, delta, seed);

        let rd_sieg = (arl - sieg).abs() / sieg;
        let rd_mont = (arl - mont).abs() / mont;
        worst_sieg = worst_sieg.max(rd_sieg);
        worst_mont = worst_mont.max(rd_mont);

        assert!(
            rd_sieg <= 0.05,
            "ARL1 h={h} delta={delta}: kshana MC {arl:.3} vs Siegmund {sieg:.3} \
             (rel {rd_sieg:.3} > 0.05)"
        );
        assert!(
            rd_mont <= 0.08,
            "ARL1 h={h} delta={delta}: kshana MC {arl:.3} vs Montgomery {mont:.3} \
             (rel {rd_mont:.3} > 0.08)"
        );
        eprintln!(
            "ARL1 h={h} delta={delta}: kshana MC {arl:.3} | Siegmund {sieg:.3} \
             ({:+.2}%) | Montgomery {mont:.3} ({:+.2}%)",
            100.0 * (arl - sieg) / sieg,
            100.0 * (arl - mont) / mont,
        );
        n += 1;
    }
    assert!(n >= 8, "expected >= 8 ARL1 cases, got {n}");
    eprintln!(
        "cusum ARL1: {n} cases, {MC_TRIALS} trials each; worst |Δ| vs Siegmund \
         {:.2}%, vs Montgomery {:.2}%",
        100.0 * worst_sieg,
        100.0 * worst_mont
    );
}
