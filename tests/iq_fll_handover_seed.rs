// SPDX-License-Identifier: AGPL-3.0-only
//! D8a row 4 (`VM-bdfec2e4`): the forced FLL->PLL hand-over seeded with the mean NCO Doppler
//! over the last `fll_handover_mean_s` of the pull-in (design "seeded": the registered capped
//! design with `fll_handover_mean_s = 0.5`), against D0 to D4 of
//! `docs/design/evidence/fll-handover-floor/PREREGISTRATION.md` as registered, with the readings
//! of `xval/d8a-fll-handover-seed/` (committed before the change). The control is
//! `tests/iq_fll_handover_floor.rs::the_committed_results_reproduce` (release, ignored).
//!
//! PIN-SCOPE: none. PIN-EXCLUDES: everything (no output hash is pinned here).

use kshana::iq::cli::build_code;
use kshana::iq::track::design::DesignFile;
use kshana::iq::track::sink::CollectSink;
use kshana::iq::track::{
    CarrierLoop, ChannelInit, LockState, LoopConfig, SessionChannel, TrackSession,
};
use kshana::iq::{Cf64, IqError, IqSource, SampleSpec, SpreadingCode};
use std::f64::consts::TAU;
use std::sync::Arc;

const FS: f64 = 4.1e6;
const DOPPLER: f64 = 1500.0;
const SECS: f64 = 8.0;
const STEADY_FROM_S: f64 = 2.0;

/// The data-free source of `tests/iq_track_engine.rs` (`Synth`), noise seed XOR `k`.
struct Synth {
    code: kshana::iq::signals::SignalCode,
    amp: f64,
    rate: f64,
    phase0: f64,
    n: u64,
    total: u64,
    rng: u64,
}

impl Synth {
    fn new(cn0_dbhz: f64, k: u64) -> Self {
        let code = build_code("gps-l1ca", 13).unwrap();
        let rate = code.chip_rate_hz() * (1.0 + DOPPLER / code.carrier_hz());
        Self {
            amp: (10f64.powf(cn0_dbhz / 10.0) / FS).sqrt(),
            code,
            rate,
            phase0: 300.25,
            n: 0,
            total: (SECS * FS) as u64,
            rng: (0x9e37_79b9_7f4a_7c15 ^ 13u64) ^ k,
        }
    }
    fn gauss(&mut self) -> f64 {
        let mut u = || {
            self.rng ^= self.rng >> 12;
            self.rng ^= self.rng << 25;
            self.rng ^= self.rng >> 27;
            ((self.rng.wrapping_mul(0x2545_f491_4f6c_dd1d) >> 11) as f64 + 0.5)
                / (1u64 << 53) as f64
        };
        let (a, b) = (u(), u());
        (-2.0 * a.ln()).sqrt() * (TAU * b).cos()
    }
    fn init(&self, doppler: f64) -> ChannelInit {
        ChannelInit {
            code: Arc::new(self.code.clone()),
            code_phase_chips: self.phase0,
            doppler_hz: doppler,
            periods_per_bit: None,
        }
    }
}

impl IqSource for Synth {
    fn spec(&self) -> SampleSpec {
        SampleSpec {
            fs_hz: FS,
            center_hz: 1_575_420_000.0,
            if_hz: 0.0,
        }
    }
    fn read(&mut self, buf: &mut [Cf64]) -> Result<usize, IqError> {
        let k = buf.len().min((self.total - self.n) as usize);
        let s = std::f64::consts::FRAC_1_SQRT_2;
        for out in buf.iter_mut().take(k) {
            let t = self.n as f64 / FS;
            let mut v = Cf64::new(s * self.gauss(), s * self.gauss());
            let c = self.code.value_at(self.phase0 + self.rate * t);
            let ph = TAU * DOPPLER * t;
            v = v + Cf64::new(ph.cos(), ph.sin()) * (self.amp * c);
            *out = v;
            self.n += 1;
        }
        Ok(k)
    }
}

fn std_dev(xs: &[f64]) -> f64 {
    let n = xs.len() as f64;
    let m = xs.iter().sum::<f64>() / n;
    (xs.iter().map(|x| (x - m).powi(2)).sum::<f64>() / (n - 1.0)).sqrt()
}

fn design(name: &str) -> LoopConfig {
    match name {
        "default" => LoopConfig::default(),
        "seeded" => LoopConfig {
            fll_pull_in_max_s: Some(1.0),
            fll_handover_mean_s: Some(0.5),
            ..LoopConfig::default()
        },
        "pll-only" => LoopConfig {
            carrier: CarrierLoop::Pll {
                order: 2,
                bn_hz: 15.0,
            },
            ..LoopConfig::default()
        },
        _ => unreachable!(),
    }
}

/// One run's steady-state statistics, as the registered survey computes them.
#[derive(Clone, Debug)]
struct Run {
    design: &'static str,
    cn0: f64,
    handoff: f64,
    k: u64,
    phase_lock: f64,
    slips: usize,
    sigma: f64,
    fll_on: f64,
    fll_last: bool,
}

fn run(name: &'static str, cn0: f64, handoff_hz: f64, k: u64) -> Run {
    let mut src = Synth::new(cn0, k);
    let init = src.init(handoff_hz);
    let mut session = TrackSession::new(
        src.spec(),
        vec![SessionChannel::from_config(init, design(name))],
    )
    .unwrap();
    let mut sink = CollectSink::default();
    session.run(&mut src, None, &mut sink).unwrap();
    let all = &sink.channels[0];
    let steady: Vec<_> = all
        .iter()
        .filter(|(e, _)| e.code_epoch_s >= STEADY_FROM_S)
        .collect();
    let n = steady.len() as f64;
    let phase_lock = steady.iter().filter(|(e, _)| e.phase_lock).count() as f64 / n;
    let errs: Vec<f64> = steady
        .iter()
        .map(|(e, _)| e.carrier_phase_cycles - DOPPLER * e.sample_index as f64 / FS)
        .collect();
    let slips = errs
        .windows(2)
        .filter(|w| ((w[1] - w[0]) * 2.0).round() != 0.0)
        .count();
    let wrapped: Vec<f64> = errs
        .iter()
        .map(|x| {
            let r = x.rem_euclid(0.5);
            if r > 0.25 {
                r - 0.5
            } else {
                r
            }
        })
        .collect();
    Run {
        design: name,
        cn0,
        handoff: handoff_hz,
        k,
        phase_lock,
        slips,
        sigma: std_dev(&wrapped) * 360.0,
        fll_on: steady.iter().filter(|(e, _)| e.fll_active).count() as f64 / n,
        fll_last: all.last().unwrap().0.fll_active,
    }
}

/// Every `(design, cn0, hand-off)` on seeds `ks`, four at a time.
fn runs(set: &[(&'static str, f64, f64)], ks: &[u64]) -> Vec<Run> {
    let jobs: Vec<(&'static str, f64, f64, u64)> = set
        .iter()
        .flat_map(|&(d, c, h)| ks.iter().map(move |&k| (d, c, h, k)))
        .collect();
    let next = std::sync::atomic::AtomicUsize::new(0);
    let out = std::sync::Mutex::new(Vec::new());
    std::thread::scope(|s| {
        for _ in 0..4 {
            s.spawn(|| loop {
                let i = next.fetch_add(1, std::sync::atomic::Ordering::Relaxed);
                let Some(&(d, c, h, k)) = jobs.get(i) else {
                    break;
                };
                let r = run(d, c, h, k);
                out.lock().unwrap().push((i, r));
            });
        }
    });
    let mut v = out.into_inner().unwrap();
    v.sort_by_key(|x| x.0);
    v.into_iter().map(|x| x.1).collect()
}

fn d2_ok(r: &Run) -> bool {
    r.fll_on == 0.0 && r.phase_lock >= 0.95 && r.slips == 0
}

fn mean_sigma(rs: &[Run], d: &str, cn0: f64) -> f64 {
    let v: Vec<f64> = rs
        .iter()
        .filter(|r| r.design == d && r.cn0 == cn0 && r.handoff == DOPPLER)
        .map(|r| r.sigma)
        .collect();
    v.iter().sum::<f64>() / v.len() as f64
}

const SEEDED_SET: [(&str, f64, f64); 4] = [
    ("seeded", 31.0, DOPPLER),
    ("seeded", 31.0, DOPPLER - 25.0),
    ("seeded", 33.0, DOPPLER),
    ("seeded", 33.0, DOPPLER - 25.0),
];

fn summarise(label: &str, rs: &[Run]) {
    for r in rs.iter().filter(|r| r.design == "seeded" && !d2_ok(r)) {
        eprintln!("{label} D2 fails: {r:?}");
    }
    for cn0 in [31.0, 33.0, 29.0] {
        let s: Vec<&Run> = rs
            .iter()
            .filter(|r| r.design == "seeded" && r.cn0 == cn0)
            .collect();
        if !s.is_empty() {
            eprintln!(
                "{label} seeded {cn0} dB-Hz: {} of {} hand over and hold",
                s.iter().filter(|r| d2_ok(r)).count(),
                s.len()
            );
        }
    }
}

/// Reading 7: development seeds k = 1001 to 1010, run once before the scored run.
#[test]
#[ignore = "D8a row 4 development runs (reading 7); release"]
fn development_runs() {
    let ks: Vec<u64> = (1001..=1010).collect();
    let mut set = SEEDED_SET.to_vec();
    set.push(("pll-only", 31.0, DOPPLER));
    set.push(("pll-only", 33.0, DOPPLER));
    let rs = runs(&set, &ks);
    summarise("dev", &rs);
    for cn0 in [31.0, 33.0] {
        eprintln!(
            "dev D3 {cn0}: seeded {:.3} deg, pll-only {:.3} deg",
            mean_sigma(&rs, "seeded", cn0),
            mean_sigma(&rs, "pll-only", cn0)
        );
    }
}

/// The scored run: D0, D2 and D3 on the seen (k = 1..10) and fresh (k = 100 001..100 010) seeds.
#[test]
#[cfg_attr(debug_assertions, ignore = "D8a row 4 survey: release")]
fn d0_d2_d3_seen_and_fresh() {
    let mut miss = Vec::new();
    for (label, ks) in [
        ("seen", (1..=10).collect::<Vec<u64>>()),
        ("fresh", (100_001..=100_010).collect()),
    ] {
        let mut set = vec![("default", 33.0, DOPPLER)];
        set.extend(SEEDED_SET);
        set.push(("seeded", 29.0, DOPPLER));
        set.push(("seeded", 29.0, DOPPLER - 25.0));
        set.push(("pll-only", 31.0, DOPPLER));
        set.push(("pll-only", 33.0, DOPPLER));
        let rs = runs(&set, &ks);
        let stuck = rs
            .iter()
            .filter(|r| r.design == "default" && r.fll_last)
            .count();
        eprintln!("{label} D0: default FLL still on at the last epoch in {stuck} of 10");
        if stuck < 5 {
            miss.push(format!("{label} D0: {stuck} of 10 (uninformative)"));
        }
        summarise(label, &rs);
        for cn0 in [31.0, 33.0] {
            let ok = rs
                .iter()
                .filter(|r| r.design == "seeded" && r.cn0 == cn0)
                .filter(|r| d2_ok(r))
                .count();
            if ok != 20 {
                miss.push(format!("{label} D2 {cn0}: {ok} of 20"));
            }
            let (s, p) = (
                mean_sigma(&rs, "seeded", cn0),
                mean_sigma(&rs, "pll-only", cn0),
            );
            eprintln!(
                "{label} D3 {cn0}: seeded {s:.3} deg, pll-only {p:.3} deg, ratio {:.3}",
                s / p
            );
            if (s / p - 1.0).abs() > 0.25 {
                miss.push(format!("{label} D3 {cn0}: {s:.3} / {p:.3}"));
            }
        }
        for r in &rs {
            eprintln!(
                "{label},{},{},{},{},{:.6},{},{:.6},{:.6},{}",
                r.design,
                r.cn0,
                r.handoff,
                r.k,
                r.phase_lock,
                r.slips,
                r.sigma,
                r.fll_on,
                u8::from(r.fll_last)
            );
        }
    }
    assert!(miss.is_empty(), "D8a row 4 NOT MET: {miss:?}");
}

/// D4: the seeded design pulls in a 100 Hz hand-off error at 45 dB-Hz.
#[test]
fn d4_the_seeded_design_pulls_in_a_100_hz_handoff_error() {
    let mut src = Synth::new(45.0, 0);
    src.total = (2.2 * FS) as u64;
    let init = src.init(1400.0);
    let mut session = TrackSession::new(
        src.spec(),
        vec![SessionChannel::from_config(init, design("seeded"))],
    )
    .unwrap();
    let mut sink = CollectSink::default();
    session.run(&mut src, None, &mut sink).unwrap();
    assert!(
        sink.events
            .iter()
            .all(|e| e.reason != "false-lock" && e.reason != "pull-in-timeout"),
        "{:?}",
        sink.events
    );
    let (last, state) = sink.channels[0].last().unwrap();
    assert_eq!(*state, LockState::Locked, "{:?}", sink.events);
    assert!(
        (last.doppler_hz - DOPPLER).abs() < 5.0,
        "{}",
        last.doppler_hz
    );
}

/// D1: the new key is in the canonical form only when set; the default hash is unchanged;
/// invalid uses are errors.
#[test]
fn d1_the_key_is_part_of_the_hash_only_when_set() {
    const BASE: &str = "schema = \"kshana.loop-design/1\"\n[[design]]\nname = \"a\"\n";
    let parse = |extra: &str| DesignFile::parse(&format!("{BASE}{extra}"));
    let plain = parse("").unwrap();
    let capped = parse("[design.carrier]\nfll_pull_in_max_s = 1.0\n").unwrap();
    let seeded =
        parse("[design.carrier]\nfll_pull_in_max_s = 1.0\nfll_handover_mean_s = 0.5\n").unwrap();
    let (p, c, s) = (
        &plain.designs()[0],
        &capped.designs()[0],
        &seeded.designs()[0],
    );
    assert!(!c.to_json().to_string().contains("fll_handover_mean_s"));
    assert_eq!(s.to_json()["carrier"]["fll_handover_mean_s"], 0.5);
    assert_ne!(c.hash(), s.hash());
    assert_eq!(
        p.hash(),
        "33261cd171a53803a6c262686e878e01f37d902a93d5918c20a44297b8ef8e80"
    );
    assert_eq!(s.loop_config().fll_handover_mean_s, Some(0.5));
    for bad in [
        "[design.carrier]\nfll_handover_mean_s = 0.5\n",
        "[design.carrier]\nfll_pull_in_max_s = 1.0\nfll_handover_mean_s = 0.0\n",
        "[design.carrier]\nkind = \"pll\"\nfll_handover_mean_s = 0.5\n",
    ] {
        assert!(parse(bad).is_err(), "accepted: {bad}");
    }
}
