// SPDX-License-Identifier: AGPL-3.0-only
//! The 0.34 tracking engine: streaming epoch output (`iq::track::sink`), the lock state
//! machine with false-lock detection and re-acquisition (`iq::track::lock`) and loop
//! designs from TOML (`iq::track::design`).
//!
//! References: a deterministic synthetic GPS L1 C/A source with stated Doppler, C/N0 and
//! signal gaps is the truth. Streaming output must equal the in-memory replay bit for bit;
//! the binary form must read back to the same records (the memory bound is
//! `tests/iq_track_memory.rs`); a false lock the one-period
//! hand-off produces must be detected at the ±1/(2T) alias and, with re-acquisition on,
//! repaired to the injected Doppler; a signal gap must be declared lost and re-acquired.

use kshana::iq::cli::build_code;
use kshana::iq::track::design::DesignFile;
use kshana::iq::track::sink::{
    BinaryEpochReader, BinaryEpochWriter, CollectSink, CsvEpochWriter, EpochHeader, EpochRecord,
    Fanout, JsonlEpochWriter,
};
use kshana::iq::track::{replay, ChannelInit, LockState, LoopConfig, SessionChannel, TrackSession};
use kshana::iq::{Cf64, IqError, IqSource, SampleSpec, SpreadingCode};
use std::f64::consts::TAU;
use std::sync::Arc;

// ---- A deterministic synthetic GPS L1 C/A source. ----

const FS: f64 = 2.046e6;

/// One PRN at a fixed Doppler and C/N0 in unit-variance complex noise, with optional
/// signal-off windows `[t0, t1)` (s).
struct Synth {
    fs: f64,
    code: kshana::iq::signals::SignalCode,
    doppler: f64,
    amp: f64,
    rate: f64,
    phase0: f64,
    gaps: Vec<(f64, f64)>,
    n: u64,
    total: u64,
    rng: u64,
    noise: bool,
}

impl Synth {
    fn new(prn: i64, doppler: f64, cn0_dbhz: f64, seconds: f64, gaps: Vec<(f64, f64)>) -> Self {
        Self::at(FS, prn, doppler, cn0_dbhz, seconds, gaps)
    }
    fn at(
        fs: f64,
        prn: i64,
        doppler: f64,
        cn0_dbhz: f64,
        seconds: f64,
        gaps: Vec<(f64, f64)>,
    ) -> Self {
        let code = build_code("gps-l1ca", prn).unwrap();
        let rate = code.chip_rate_hz() * (1.0 + doppler / code.carrier_hz());
        Self {
            fs,
            amp: (10f64.powf(cn0_dbhz / 10.0) / fs).sqrt(),
            code,
            doppler,
            rate,
            phase0: 300.25,
            gaps,
            n: 0,
            total: (seconds * fs) as u64,
            rng: 0x9e37_79b9_7f4a_7c15 ^ prn as u64,
            noise: true,
        }
    }
    fn gauss(&mut self) -> f64 {
        // xorshift64* + Box-Muller (one value per call; the pair's second is dropped).
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
    /// The truth hand-off: code phase at sample 0 and the Doppler.
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
            fs_hz: self.fs,
            center_hz: 1_575_420_000.0,
            if_hz: 0.0,
        }
    }
    fn read(&mut self, buf: &mut [Cf64]) -> Result<usize, IqError> {
        let k = buf.len().min((self.total - self.n) as usize);
        let s = std::f64::consts::FRAC_1_SQRT_2;
        for out in buf.iter_mut().take(k) {
            let t = self.n as f64 / self.fs;
            let on = !self.gaps.iter().any(|&(a, b)| t >= a && t < b);
            let mut v = if self.noise {
                Cf64::new(s * self.gauss(), s * self.gauss())
            } else {
                Cf64::default()
            };
            if on {
                let c = self.code.value_at(self.phase0 + self.rate * t);
                let ph = TAU * self.doppler * t;
                v = v + Cf64::new(ph.cos(), ph.sin()) * (self.amp * c);
            }
            *out = v;
            self.n += 1;
        }
        Ok(k)
    }
}

fn header(n: usize) -> EpochHeader {
    EpochHeader::new(
        (0..n)
            .map(|i| kshana::iq::track::sink::ChannelInfo {
                code: format!("ch{i}"),
                design: "default".into(),
                design_hash: String::new(),
            })
            .collect(),
        FS,
    )
}

#[test]
fn streaming_output_equals_the_in_memory_replay() {
    let mk = || Synth::new(5, 1200.0, 45.0, 1.5, vec![]);
    let src0 = mk();
    let init = src0.init(1150.0);
    let cfg = LoopConfig::default();

    let mut a = mk();
    let mem = replay(
        &mut a,
        std::slice::from_ref(&init),
        std::slice::from_ref(&cfg),
        None,
    )
    .unwrap();

    let mut b = mk();
    let mut session =
        TrackSession::new(b.spec(), vec![SessionChannel::from_config(init, cfg)]).unwrap();
    let mut collect = CollectSink::default();
    session.run(&mut b, None, &mut collect).unwrap();

    let streamed: Vec<_> = collect.channels[0].iter().map(|(e, _)| e.clone()).collect();
    assert_eq!(
        streamed, mem[0].channels[0],
        "observing state machine changes nothing"
    );
    let states: Vec<LockState> = collect.channels[0].iter().map(|(_, s)| *s).collect();
    assert_eq!(states[0], LockState::PullIn);
    assert_eq!(*states.last().unwrap(), LockState::Locked);
    assert!(
        collect.events.iter().any(|e| e.reason == "locked"),
        "{:?}",
        collect.events
    );
    assert!(!collect.events.iter().any(|e| e.reason == "false-lock"));
}

#[test]
fn the_three_writers_carry_the_same_records_and_binary_reads_back() {
    let mut src = Synth::new(9, -700.0, 45.0, 0.6, vec![]);
    let init = src.init(-650.0);
    let mut session = TrackSession::new(
        src.spec(),
        vec![SessionChannel::from_config(init, LoopConfig::default())],
    )
    .unwrap();
    let h = header(1);
    let (mut csv, mut jsonl, mut bin) = (Vec::new(), Vec::new(), Vec::new());
    let mut collect = CollectSink::default();
    {
        let mut w1 = CsvEpochWriter::new(&mut csv).unwrap();
        let mut w2 = JsonlEpochWriter::new(&mut jsonl, &h).unwrap();
        let mut w3 = BinaryEpochWriter::new(&mut bin, &h).unwrap();
        let mut fan = Fanout::new();
        fan.push(&mut w1);
        fan.push(&mut w2);
        fan.push(&mut w3);
        fan.push(&mut collect);
        session.run(&mut src, None, &mut fan).unwrap();
    }
    let want: Vec<EpochRecord> = collect.channels[0]
        .iter()
        .map(|(e, s)| EpochRecord::new(0, e, *s))
        .collect();
    assert!(want.len() > 500);

    let reader = BinaryEpochReader::new(std::io::Cursor::new(&bin)).unwrap();
    assert_eq!(reader.header(), &h);
    let back: Vec<EpochRecord> = reader.map(Result::unwrap).collect();
    assert_eq!(back, want, "binary round trip is exact");

    let lines: Vec<&str> = std::str::from_utf8(&jsonl).unwrap().lines().collect();
    assert!(lines[0].starts_with("{\"header\""));
    let from_json: Vec<EpochRecord> = lines[1..]
        .iter()
        .map(|l| serde_json::from_str(l).unwrap())
        .collect();
    assert_eq!(from_json, want, "JSON Lines round trip is exact");

    let csv = String::from_utf8(csv).unwrap();
    let mut rows = csv.lines();
    assert_eq!(
        rows.next().unwrap(),
        kshana::iq::track::sink::EPOCH_FIELDS.join(",")
    );
    assert_eq!(rows.count(), want.len());

    // A truncated binary file is an error, not a silent short read.
    let cut = &bin[..bin.len() - 7];
    let last = BinaryEpochReader::new(std::io::Cursor::new(cut))
        .unwrap()
        .last()
        .unwrap();
    assert!(last.is_err());
}

/// The PR #38 case: a hand-off 500 Hz off on a 1 ms loop false-locks. The check finds the
/// true signal at the +1/(2T) alias; with re-acquisition on, the channel ends locked at the
/// injected Doppler.
#[test]
fn a_false_lock_is_detected_at_the_alias_and_repaired_by_reacquisition() {
    let truth = -2400.0;
    let run = |reacquire: bool| {
        let mut src = Synth::new(17, truth, 45.0, 4.0, vec![]);
        let init = src.init(truth - 500.0);
        let design = DesignFile::parse(&format!(
            "schema = \"kshana.loop-design/1\"\n[[design]]\nname = \"d\"\n[design.lock]\nreacquire = {reacquire}\n"
        ))
        .unwrap();
        let ch = SessionChannel::from_design(init, &design.designs()[0]);
        let mut session = TrackSession::new(src.spec(), vec![ch]).unwrap();
        let mut sink = CollectSink::default();
        session.run(&mut src, None, &mut sink).unwrap();
        sink
    };
    let observe = run(false);
    // The hand-off sits on the ±1/(2T) Costas alias: the prompt rotates by π every
    // millisecond, so the NWPR narrow-band sum cancels and code lock is never declared.
    // The alias is rejected (never LOCKED), not reported as a clean track.
    assert!(
        observe.channels[0]
            .iter()
            .all(|(e, s)| !e.code_lock && *s != LockState::Locked),
        "the alias must never reach code lock or LOCKED"
    );
    let last = &observe.channels[0].last().unwrap().0;
    assert!(
        (last.doppler_hz - truth).abs() > 400.0,
        "the hand-off false-locks: {}",
        last.doppler_hz
    );
    let fl = observe
        .events
        .iter()
        .find(|e| e.reason == "false-lock")
        .unwrap_or_else(|| panic!("no false-lock event: {:?}", observe.events));
    assert!(
        (fl.doppler_hz.unwrap() - truth).abs() < 60.0,
        "alias {fl:?}"
    );
    assert_eq!(observe.channels[0].last().unwrap().1, LockState::Lost);

    let repair = run(true);
    let reacq = repair
        .events
        .iter()
        .find(|e| e.reason == "reacquired")
        .expect("reacquired");
    assert!(
        (reacq.doppler_hz.unwrap() - truth).abs() < 200.0,
        "{reacq:?}"
    );
    let (last, state) = repair.channels[0].last().unwrap();
    assert!(
        (last.doppler_hz - truth).abs() < 25.0,
        "final {}",
        last.doppler_hz
    );
    assert_eq!(*state, LockState::Locked, "{:?}", repair.events);
}

/// A 0.8 s signal gap: the channel is declared lost within the dwell, re-acquired after
/// the signal returns, and locked again; epochs keep their numbering across the restart.
#[test]
fn a_signal_gap_is_lost_then_reacquired() {
    let truth = 1500.0;
    let gap = (2.0, 2.8);
    let mut src = Synth::new(11, truth, 45.0, 5.0, vec![gap]);
    let init = src.init(truth + 40.0);
    let design = DesignFile::parse(
        "schema = \"kshana.loop-design/1\"\n[[design]]\nname = \"d\"\n[design.lock]\nreacquire = true\nmax_reacq_attempts = 1000\n",
    )
    .unwrap();
    let ch = SessionChannel::from_design(init, &design.designs()[0]);
    let mut session = TrackSession::new(src.spec(), vec![ch]).unwrap();
    let mut sink = CollectSink::default();
    session.run(&mut src, None, &mut sink).unwrap();

    let ev = |r: &str| {
        sink.events
            .iter()
            .find(|e| e.reason == r)
            .unwrap_or_else(|| panic!("no {r}: {:?}", sink.events))
            .clone()
    };
    let lost = ev("loss-of-lock");
    assert!(
        lost.code_epoch_s > gap.0 && lost.code_epoch_s < gap.0 + 0.5,
        "{lost:?}"
    );
    let back = sink
        .events
        .iter()
        .find(|e| e.reason == "reacquired" && e.code_epoch_s >= gap.1 - 0.05)
        .unwrap_or_else(|| panic!("no re-acquisition after the gap: {:?}", sink.events));
    assert!(
        back.code_epoch_s < gap.1 + 0.3,
        "re-acquired {:.3} s after the gap",
        back.code_epoch_s - gap.1
    );
    assert!((back.doppler_hz.unwrap() - truth).abs() < 200.0, "{back:?}");
    let (last, state) = sink.channels[0].last().unwrap();
    assert_eq!(*state, LockState::Locked, "{:?}", sink.events);
    assert!((last.doppler_hz - truth).abs() < 25.0);
    let epochs: Vec<u64> = sink.channels[0].iter().map(|(e, _)| e.epoch).collect();
    assert!(
        epochs.windows(2).all(|w| w[1] > w[0]),
        "epoch numbering is monotonic"
    );
}

// ---- DLL jitter (docs/design/evidence/dll-jitter/PREREGISTRATION.md) ----

/// The per-update EMLP discriminator noise and the code tracking error of the closed form
/// (Kaplan & Hegarty, infinite bandwidth): `(σ_D, σ_ε)` in chips.
fn dll_theory(cn0_dbhz: f64) -> (f64, f64) {
    let (t, d, bn) = (1e-3, 0.5, 2.0);
    let c = 10f64.powf(cn0_dbhz / 10.0);
    let var_e = bn * d / (2.0 * c) * (1.0 + 2.0 / ((2.0 - d) * t * c));
    ((var_e / (2.0 * bn * t)).sqrt(), var_e.sqrt())
}

/// `(σ_D, σ_ε)` measured over 1.5 s ≤ t < 3.5 s on the synthetic source at `fs`.
fn dll_measured(fs: f64, cn0_dbhz: f64) -> (f64, f64) {
    let mut src = Synth::at(fs, 13, 1500.0, cn0_dbhz, 3.5, vec![]);
    let init = src.init(1500.0);
    let mut session = TrackSession::new(
        src.spec(),
        vec![SessionChannel::from_config(init, LoopConfig::default())],
    )
    .unwrap();
    let mut sink = CollectSink::default();
    let (phase0, rate) = (src.phase0, src.rate);
    session.run(&mut src, None, &mut sink).unwrap();
    let len = 1023.0;
    let (mut disc, mut err) = (Vec::new(), Vec::new());
    for (e, _) in &sink.channels[0] {
        if e.code_epoch_s >= 1.5 {
            disc.push(e.disc.dll_chips);
            let truth = phase0 + rate * e.sample_index as f64 / fs;
            let mut d = (e.code_phase_chips - truth).rem_euclid(len);
            if d > len / 2.0 {
                d -= len;
            }
            err.push(d);
        }
    }
    (std_dev(&disc), std_dev(&err))
}

fn std_dev(xs: &[f64]) -> f64 {
    let n = xs.len() as f64;
    let m = xs.iter().sum::<f64>() / n;
    (xs.iter().map(|x| (x - m).powi(2)).sum::<f64>() / (n - 1.0)).sqrt()
}

/// The full survey of the pre-registration (3 sample rates × 3 C/N0). Slow in a debug
/// build; run with `cargo test --release --test iq_track_engine dll_jitter_survey --
/// --ignored --nocapture`.
#[test]
#[ignore]
fn dll_jitter_survey() {
    println!("fs_hz,cn0_dbhz,sigma_d_chips,theory_sigma_d,sigma_eps_chips,theory_sigma_eps");
    for fs in [2.046e6, 2.5e6, 4.1e6] {
        for cn0 in [45.0, 38.0, 30.0] {
            let (sd, se) = dll_measured(fs, cn0);
            let (td, te) = dll_theory(cn0);
            println!("{fs},{cn0},{sd:.5},{td:.5},{se:.5},{te:.5}");
        }
    }
}

/// The first full-period DLL discriminator output on a noise-free signal when the replica
/// starts `eps` chips off.
fn first_disc(fs: f64, eps: f64) -> f64 {
    let mut src = Synth::at(fs, 13, 0.0, 60.0, 0.004, vec![]);
    src.noise = false;
    let mut init = src.init(0.0);
    init.code_phase_chips += eps;
    let mut session = TrackSession::new(
        src.spec(),
        vec![SessionChannel::from_config(init, LoopConfig::default())],
    )
    .unwrap();
    let mut sink = CollectSink::default();
    session.run(&mut src, None, &mut sink).unwrap();
    sink.channels[0][0].0.disc.dll_chips
}

/// The mechanism behind the flat DLL jitter at 2 samples per chip
/// (`docs/design/evidence/dll-jitter/`): with fs an exact multiple of the chip rate the
/// samples fall on the same chip phases in every chip, so the early and late taps see a
/// staircase, not the correlation triangle. With d = 0.5 at 2.000 samples/chip the
/// discriminator's S-curve has no linear part at all: its first output is the same
/// saturated value whatever the code offset in [0, 0.24] chip, so the DLL dithers
/// bang-bang (σ_D ≈ 0.2 chip at any C/N0). At an incommensurate 2.5 MHz it is the
/// unit-slope line the closed forms assume.
#[test]
fn commensurate_sampling_turns_the_dll_s_curve_into_a_step() {
    let offsets = [0.03, 0.06, 0.09, 0.12, 0.15, 0.18];
    let at = |fs: f64| offsets.map(|e| first_disc(fs, e));
    let two_spc = at(2.046e6);
    for v in two_spc {
        assert!(
            (v - two_spc[0]).abs() < 1e-9 && v.abs() > 0.2,
            "{two_spc:?}"
        );
    }
    let incommensurate = at(2.5e6);
    for (e, v) in offsets.iter().zip(incommensurate) {
        // The replica starts `e` chips ahead, so the discriminator reads about -e.
        assert!(
            (v + e).abs() < 0.2 * e + 0.01,
            "e={e}: {v} ({incommensurate:?})"
        );
    }
}

/// Pre-registered bars P1 and P2 at 45 dB-Hz, on a 2.5 s run (the full survey is
/// `dll_jitter_survey`). Release-mode speed is needed; CI's debug suite skips it.
#[test]
#[ignore]
fn dll_jitter_bars_at_45_dbhz() {
    let (theory, _) = dll_theory(45.0);
    let (commensurate, _) = dll_measured(2.046e6, 45.0);
    assert!(
        commensurate >= 2.0 * theory,
        "P1: {commensurate} vs {theory}"
    );
    let (incommensurate, _) = dll_measured(2.5e6, 45.0);
    assert!(
        (incommensurate / theory - 1.0).abs() <= 0.2,
        "P2: {incommensurate} vs {theory}"
    );
}

/// The C/N0 estimators against the injected 45 dB-Hz: NWPR is within 0.5 dB at
/// incommensurate sample rates (its own bias at M = 50 windows is small), while at exactly
/// 2 samples/chip the bang-bang DLL's correlation loss pulls it ~2 dB low
/// (`docs/design/evidence/dll-jitter/RESULTS.md`). Release-mode speed is needed.
#[test]
#[ignore]
fn cn0_survey() {
    for fs in [2.046e6, 2.5e6, 4.1e6] {
        let mut src = Synth::at(fs, 13, 1500.0, 45.0, 3.5, vec![]);
        let init = src.init(1500.0);
        let mut session = TrackSession::new(
            src.spec(),
            vec![SessionChannel::from_config(init, LoopConfig::default())],
        )
        .unwrap();
        let mut sink = CollectSink::default();
        session.run(&mut src, None, &mut sink).unwrap();
        let steady = || {
            sink.channels[0]
                .iter()
                .filter(|(e, _)| e.code_epoch_s >= 1.5)
        };
        let mean = |v: Vec<f64>| v.iter().sum::<f64>() / v.len() as f64;
        let nwpr = mean(steady().filter_map(|(e, _)| e.cn0_nwpr_dbhz).collect());
        let beaulieu = mean(steady().filter_map(|(e, _)| e.cn0_beaulieu_dbhz).collect());
        println!("{fs}: NWPR {nwpr:.2} dB-Hz, Beaulieu {beaulieu:.2} dB-Hz (injected 45)");
        if fs != 2.046e6 {
            assert!((nwpr - 45.0).abs() < 0.5, "{fs}: NWPR {nwpr}");
        }
    }
}

/// S-curve, jitter and bias at integer and half-integer samples per chip and at an
/// incommensurate control (`docs/design/evidence/dll-jitter/RESULTS.md`). Release mode:
/// `cargo test --release --test iq_track_engine commensurate_ratio_survey -- --ignored
/// --nocapture`.
#[test]
#[ignore]
fn commensurate_ratio_survey() {
    let chip = 1.023e6;
    for r in [2.0, 2.5, 3.0, 3.5, 4.0, 5.0, 2.4438] {
        let fs = r * chip;
        let v: Vec<String> = [0.0, 0.03, 0.06, 0.09, 0.12, 0.15, 0.18, 0.21]
            .iter()
            .map(|&e| format!("{:.4}", first_disc(fs, e)))
            .collect();
        let (sd, se) = dll_measured(fs, 45.0);
        let bias = dll_bias(fs, 45.0);
        println!(
            "ratio {r}: S {} | sigma_D {sd:.4} sigma_eps {se:.5} mean_eps {bias:.4}",
            v.join(" ")
        );
    }
}

fn dll_bias(fs: f64, cn0_dbhz: f64) -> f64 {
    let mut src = Synth::at(fs, 13, 1500.0, cn0_dbhz, 3.5, vec![]);
    let init = src.init(1500.0);
    let (phase0, rate) = (src.phase0, src.rate);
    let mut session = TrackSession::new(
        src.spec(),
        vec![SessionChannel::from_config(init, LoopConfig::default())],
    )
    .unwrap();
    let mut sink = CollectSink::default();
    session.run(&mut src, None, &mut sink).unwrap();
    let v: Vec<f64> = sink.channels[0]
        .iter()
        .filter(|(e, _)| e.code_epoch_s >= 1.5)
        .map(|(e, _)| {
            let mut d = (e.code_phase_chips - (phase0 + rate * e.sample_index as f64 / fs))
                .rem_euclid(1023.0);
            if d > 511.5 {
                d -= 1023.0;
            }
            d
        })
        .collect();
    v.iter().sum::<f64>() / v.len() as f64
}

/// The commensurate-sampling rule: within 1e-6 (relative) of a multiple of half a chip.
#[test]
fn commensurate_rates_are_recognised() {
    use kshana::iq::track::commensurate_samples_per_chip as c;
    let chip = 1.023e6;
    for fs in [2.046e6, 2.5575e6, 3.069e6, 4.092e6, 5.115e6, 16.368e6] {
        assert!(c(fs, chip).is_some(), "{fs}");
    }
    assert_eq!(c(2.046e6, chip), Some(2.0));
    for fs in [2.5e6, 4.1e6, 2.048e6, 4.0e6, 5.0e6, 2.046e6 * (1.0 + 5e-6)] {
        assert!(c(fs, chip).is_none(), "{fs}");
    }
}

/// A sample rate with no whole number of samples per code period (2.5 samples/chip here)
/// cannot run the false-lock check's search; tracking goes on without it instead of
/// stopping.
#[test]
fn an_unsearchable_rate_tracks_without_the_check() {
    let fs = 2.5 * 1.023e6;
    let mut src = Synth::at(fs, 13, 900.0, 45.0, 1.2, vec![]);
    let init = src.init(900.0);
    let mut session = TrackSession::new(
        src.spec(),
        vec![SessionChannel::from_config(init, LoopConfig::default())],
    )
    .unwrap();
    let mut sink = CollectSink::default();
    session.run(&mut src, None, &mut sink).unwrap();
    assert!(sink.channels[0].len() > 1000);
    assert!(!sink.events.iter().any(|e| e.reason == "false-lock"));
}
