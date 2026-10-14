// SPDX-License-Identifier: AGPL-3.0-only
//! DS-LOOP-05: the opt-in `carrier.fll_pull_in_max_s` against the bars of
//! `docs/design/evidence/fll-handover-floor/PREREGISTRATION.md` (committed before the code).
//!
//! The runs (release only, `#[ignore]`) are on a copy of the synthetic data-free GPS L1 C/A
//! source of `tests/iq_track_engine.rs` (PRN 13, 1500 Hz Doppler, 4.1 MHz, 8 s, ten noise
//! seeds); `fll_handover_survey_writes_the_results` writes their per-run statistics to
//! `tests/fixtures/fll_handover_floor/results.csv` and `the_committed_results_reproduce`
//! re-runs them and requires the same text. The debug suite grades the committed numbers with
//! the registered bars and asserts the recorded verdict (`registered_bars_give_the_recorded_verdict`),
//! runs the pull-in guard D4, and checks that the key stays out of the design hash when unset.
//!
//! PIN-SCOPE:    the per-run carrier statistics of the registered run set and the verdict of
//!               every registered bar on them.
//! PIN-EXCLUDES: data bits, other signals and sample rates (out of scope).

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
const RESULTS: &str = include_str!("fixtures/fll_handover_floor/results.csv");

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
        "capped" => LoopConfig {
            fll_pull_in_max_s: Some(1.0),
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

/// One run's steady-state statistics: phase-lock fraction, half-cycle slips, σ of the true
/// carrier phase error (deg, Costas, mod half a cycle), fraction of epochs with the FLL on,
/// whether the FLL is on at the last epoch, and the LOCKED fraction.
fn run(name: &str, cn0: f64, handoff_hz: f64, k: u64) -> String {
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
    let locked = steady
        .iter()
        .filter(|(_, s)| *s == LockState::Locked)
        .count() as f64
        / n;
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
    let fll_on = steady.iter().filter(|(e, _)| e.fll_active).count() as f64 / n;
    let fll_last = all.last().unwrap().0.fll_active;
    format!(
        "{name},{cn0},{handoff_hz},{k},{phase_lock:.6},{slips},{:.6},{fll_on:.6},{},{locked:.6}",
        std_dev(&wrapped) * 360.0,
        u8::from(fll_last)
    )
}

const HEADER: &str =
    "design,cn0_dbhz,handoff_hz,seed_k,phase_lock,slips,sigma_phase_deg,fll_on_frac,fll_on_last,locked";

/// The registered run set: D0 (default, truth, 33), D2/D3 (capped, both hand-offs, 31 and 33;
/// pll-only, truth, 31 and 33) and the 29 dB-Hz finding (capped, both hand-offs).
fn survey() -> String {
    let mut out = vec![
        "# DS-LOOP-05 run set (docs/design/evidence/fll-handover-floor/PREREGISTRATION.md)"
            .to_string(),
        format!("# {HEADER}"),
    ];
    let mut add = |name: &str, cn0: f64, handoff: f64| {
        for k in 1..=10 {
            out.push(run(name, cn0, handoff, k));
        }
    };
    add("default", 33.0, DOPPLER);
    for cn0 in [31.0, 33.0, 29.0] {
        add("capped", cn0, DOPPLER);
        add("capped", cn0, DOPPLER - 25.0);
    }
    for cn0 in [31.0, 33.0] {
        add("pll-only", cn0, DOPPLER);
    }
    out.join("\n") + "\n"
}

/// Writes the committed results (release: `cargo test --release --test iq_fll_handover_floor
/// fll_handover_survey_writes_the_results -- --ignored`).
#[test]
#[ignore = "release-mode survey; writes tests/fixtures/fll_handover_floor/results.csv"]
fn fll_handover_survey_writes_the_results() {
    let path = concat!(
        env!("CARGO_MANIFEST_DIR"),
        "/tests/fixtures/fll_handover_floor/results.csv"
    );
    std::fs::write(path, survey()).unwrap();
}

/// The committed results are what the engine gives now (release mode).
#[test]
#[ignore = "release-mode survey; compares with the committed results"]
fn the_committed_results_reproduce() {
    assert_eq!(survey(), RESULTS);
}

struct Row {
    design: String,
    cn0: f64,
    handoff: f64,
    phase_lock: f64,
    slips: usize,
    sigma: f64,
    fll_on: f64,
    fll_last: bool,
}

fn rows() -> Vec<Row> {
    RESULTS
        .lines()
        .filter(|l| !l.starts_with('#') && !l.trim().is_empty())
        .map(|l| {
            let f: Vec<&str> = l.split(',').collect();
            Row {
                design: f[0].into(),
                cn0: f[1].parse().unwrap(),
                handoff: f[2].parse().unwrap(),
                phase_lock: f[4].parse().unwrap(),
                slips: f[5].parse().unwrap(),
                sigma: f[6].parse().unwrap(),
                fll_on: f[7].parse().unwrap(),
                fll_last: f[8] == "1",
            }
        })
        .collect()
}

/// D0, D2 and D3 graded on the committed numbers; the verdict is the recorded one.
#[test]
fn registered_bars_give_the_recorded_verdict() {
    let r = rows();
    let pick = |d: &str, cn0: f64, handoff: Option<f64>| -> Vec<&Row> {
        r.iter()
            .filter(|x| x.design == d && x.cn0 == cn0 && handoff.is_none_or(|h| x.handoff == h))
            .collect()
    };
    // D0: the default still has the FLL on at the last epoch in at least 5 of 10 seeds.
    let d0_stuck = pick("default", 33.0, Some(DOPPLER))
        .iter()
        .filter(|x| x.fll_last)
        .count();
    let d0 = d0_stuck >= 5;
    // D2 per C/N0: every capped run (both hand-offs) hands over and holds.
    let d2 = |cn0: f64| {
        let runs = pick("capped", cn0, None);
        assert_eq!(runs.len(), 20);
        runs.iter()
            .all(|x| x.fll_on == 0.0 && x.phase_lock >= 0.95 && x.slips == 0)
    };
    // D3 per C/N0: capped mean σ within 25 % of pll-only's, truth hand-off.
    let mean = |v: Vec<&Row>| v.iter().map(|x| x.sigma).sum::<f64>() / v.len() as f64;
    let d3 = |cn0: f64| {
        let c = mean(pick("capped", cn0, Some(DOPPLER)));
        let p = mean(pick("pll-only", cn0, Some(DOPPLER)));
        eprintln!(
            "D3 {cn0}: capped {c:.3} deg, pll-only {p:.3} deg, ratio {:.3}",
            c / p
        );
        (c / p - 1.0).abs() <= 0.25
    };
    let verdict = (d0, d0_stuck, d2(31.0), d2(33.0), d3(31.0), d3(33.0));
    eprintln!(
        "D0 stuck {d0_stuck}/10; verdict (D0, stuck, D2@31, D2@33, D3@31, D3@33) = {verdict:?}"
    );
    assert_eq!(verdict, RECORDED, "the registered verdict moved");
}

/// The recorded verdict: (D0, default runs stuck, D2 at 31, D2 at 33, D3 at 31, D3 at 33).
const RECORDED: (bool, usize, bool, bool, bool, bool) = (true, 9, false, false, false, false);

/// D4: the capped design passes the pull-in guard of the carrier-lock pre-registration.
#[test]
fn d4_the_capped_design_pulls_in_a_100_hz_handoff_error() {
    let mut src = Synth::new(45.0, 0);
    src.total = (2.2 * FS) as u64;
    let init = src.init(1400.0);
    let mut session = TrackSession::new(
        src.spec(),
        vec![SessionChannel::from_config(init, design("capped"))],
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

/// D1: the key is out of the canonical form (and so the hash) when unset, in it when set; the
/// default hash stays pinned (`design.rs`); invalid uses are errors.
#[test]
fn d1_the_key_is_part_of_the_hash_only_when_set() {
    const BASE: &str = "schema = \"kshana.loop-design/1\"\n[[design]]\nname = \"a\"\n";
    let parse = |extra: &str| DesignFile::parse(&format!("{BASE}{extra}"));
    let plain = parse("").unwrap();
    let capped = parse("[design.carrier]\nfll_pull_in_max_s = 1.0\n").unwrap();
    let (p, c) = (&plain.designs()[0], &capped.designs()[0]);
    assert!(!p.to_json().to_string().contains("fll_pull_in_max_s"));
    assert_eq!(c.to_json()["carrier"]["fll_pull_in_max_s"], 1.0);
    assert_ne!(p.hash(), c.hash());
    assert_eq!(
        p.hash(),
        "33261cd171a53803a6c262686e878e01f37d902a93d5918c20a44297b8ef8e80"
    );
    assert_eq!(c.loop_config().fll_pull_in_max_s, Some(1.0));
    for bad in [
        "[design.carrier]\nfll_pull_in_max_s = 0.0\n",
        "[design.carrier]\nfll_assist = \"always\"\nfll_pull_in_max_s = 1.0\n",
        "[design.carrier]\nkind = \"pll\"\nfll_pull_in_max_s = 1.0\n",
    ] {
        assert!(parse(bad).is_err(), "accepted: {bad}");
    }
}
