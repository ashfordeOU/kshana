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
    /// Random ±1 navigation bits of 20 code periods, when set (seeded separately).
    bits: Option<u64>,
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
            bits: None,
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
                let chips = self.phase0 + self.rate * t;
                let mut c = self.code.value_at(chips);
                if let Some(seed) = self.bits {
                    let bit = (chips / (20.0 * 1023.0)).floor() as u64;
                    let h = (bit ^ seed).wrapping_mul(0x9e37_79b9_7f4a_7c15);
                    if (h >> 63) == 1 {
                        c = -c;
                    }
                }
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
/// the signal returns (with the default, time-based re-acquisition budget), and locked
/// again; epochs keep their numbering across the restart.
#[test]
fn a_signal_gap_is_lost_then_reacquired() {
    let truth = 1500.0;
    let gap = (2.0, 2.8);
    let mut src = Synth::new(11, truth, 45.0, 5.0, vec![gap]);
    let init = src.init(truth + 40.0);
    let design = DesignFile::parse(
        "schema = \"kshana.loop-design/1\"\n[[design]]\nname = \"d\"\n[design.lock]\nreacquire = true\n",
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

/// The pre-registered bars of `docs/design/evidence/dll-jitter/PREREGISTRATION.md`, all
/// asserted. P1: at 2.046 MHz σ_D(45) ≥ 2× theory (0.128) and σ_D(38)/σ_D(45) < 1.5 (flat
/// in C/N0). P2: at 2.5 and 4.1 MHz σ_D within ±20 % of theory at 45 and 38 dB-Hz. P3: at
/// 4.1 MHz and 45 dB-Hz σ_ε within ±30 % of theory. Release-mode speed is needed; CI's
/// debug suite skips it: `cargo test --release --test iq_track_engine dll_jitter_bars --
/// --ignored`.
#[test]
#[ignore]
fn dll_jitter_bars() {
    let (t45, te45) = dll_theory(45.0);
    let (t38, _) = dll_theory(38.0);
    let (c45, _) = dll_measured(2.046e6, 45.0);
    let (c38, _) = dll_measured(2.046e6, 38.0);
    assert!(c45 >= 2.0 * t45, "P1: {c45} vs {t45}");
    assert!(c38 / c45 < 1.5, "P1 ratio: {c38} / {c45}");
    for fs in [2.5e6, 4.1e6] {
        for (cn0, theory) in [(45.0, t45), (38.0, t38)] {
            let (sd, _) = dll_measured(fs, cn0);
            assert!(
                (sd / theory - 1.0).abs() <= 0.2,
                "P2 {fs} Hz {cn0} dB-Hz: {sd} vs {theory}"
            );
        }
    }
    let (_, se) = dll_measured(4.1e6, 45.0);
    assert!((se / te45 - 1.0).abs() <= 0.3, "P3: {se} vs {te45}");
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

/// Carrier-loop behaviour on a clean data-free signal, for the default FLL-assisted PLL
/// and variants: the phase-lock fraction, the true carrier phase error (Costas, mod
/// half a cycle), the Doppler error, the cycle slips and the LOCKED fraction, over
/// 2 s ≤ t < `secs`. Release mode, `--ignored --nocapture`.
struct CarrierStats {
    phase_lock: f64,
    locked: f64,
    mean_pli: f64,
    sigma_deg: f64,
    sigma_f_hz: f64,
    slips: usize,
    fll_on: f64,
    toggles: usize,
}

impl std::fmt::Display for CarrierStats {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        write!(
            f,
            "phase_lock {:.3} locked {:.3} mean_pli {:.3} sigma_phase {:.1} deg sigma_f {:.2} Hz \
             slips {} fll_on {:.3} toggles {}",
            self.phase_lock,
            self.locked,
            self.mean_pli,
            self.sigma_deg,
            self.sigma_f_hz,
            self.slips,
            self.fll_on,
            self.toggles
        )
    }
}

fn carrier_measured(
    fs: f64,
    cn0_dbhz: f64,
    cfg: LoopConfig,
    secs: f64,
    data: bool,
    steady_from_s: f64,
) -> CarrierStats {
    let doppler = 1500.0;
    let mut src = Synth::at(fs, 13, doppler, cn0_dbhz, secs, vec![]);
    let mut init = src.init(doppler);
    if data {
        src.bits = Some(7);
        init.periods_per_bit = Some(20);
    }
    let mut session =
        TrackSession::new(src.spec(), vec![SessionChannel::from_config(init, cfg)]).unwrap();
    let mut sink = CollectSink::default();
    session.run(&mut src, None, &mut sink).unwrap();
    let steady: Vec<_> = sink.channels[0]
        .iter()
        .filter(|(e, _)| e.code_epoch_s >= steady_from_s)
        .collect();
    let n = steady.len() as f64;
    let frac = |f: &dyn Fn(&(kshana::iq::track::EpochOutput, LockState)) -> bool| {
        steady.iter().filter(|x| f(x)).count() as f64 / n
    };
    let phase_lock = frac(&|(e, _)| e.phase_lock);
    let locked = frac(&|(_, s)| *s == LockState::Locked);
    // Carrier phase error in cycles, unwrapped; a slip is a step of a half cycle or more.
    let errs: Vec<f64> = steady
        .iter()
        .map(|(e, _)| e.carrier_phase_cycles - doppler * e.sample_index as f64 / fs)
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
    let sigma_deg = std_dev(&wrapped) * 360.0;
    let df: Vec<f64> = steady.iter().map(|(e, _)| e.doppler_hz - doppler).collect();
    let mean_pli = steady.iter().map(|(e, _)| e.pli).sum::<f64>() / n;
    let toggles = steady
        .windows(2)
        .filter(|w| w[0].0.fll_active != w[1].0.fll_active)
        .count();
    let fll_on = frac(&|(e, _)| e.fll_active);
    CarrierStats {
        phase_lock,
        locked,
        mean_pli,
        sigma_deg,
        sigma_f_hz: std_dev(&df),
        slips,
        fll_on,
        toggles,
    }
}

/// Bars B1–B3 of `docs/design/evidence/carrier-lock/PREREGISTRATION.md` for the default
/// design at every C/N0 from 35 dB-Hz up (35, 37, 39, 42 and 45), with and without data bits, plus no FLL/PLL gate toggling
/// in the steady state. Release mode: `cargo test --release --test iq_track_engine
/// carrier_lock_bars -- --ignored`.
#[test]
#[ignore]
fn carrier_lock_bars() {
    for data in [false, true] {
        for cn0 in [35.0, 37.0, 39.0, 42.0, 45.0] {
            let r = carrier_measured(4.1e6, cn0, LoopConfig::default(), 8.0, data, 2.0);
            assert!(r.phase_lock >= 0.95, "B1 {cn0} data={data}: {r}");
            assert_eq!(r.slips, 0, "B2 {cn0} data={data}: {r}");
            assert!(r.locked >= 0.95, "B3 {cn0} data={data}: {r}");
            assert_eq!(r.toggles, 0, "gate chatter {cn0} data={data}: {r}");
        }
    }
}

#[test]
#[ignore]
fn carrier_lock_survey() {
    use kshana::iq::track::CarrierLoop;
    let fll_assisted = LoopConfig::default();
    let always = LoopConfig {
        fll_assist: kshana::iq::track::FllAssist::Always,
        ..LoopConfig::default()
    };
    let pll_only = LoopConfig {
        carrier: CarrierLoop::Pll {
            order: 2,
            bn_hz: 15.0,
        },
        ..LoopConfig::default()
    };
    let data = std::env::var("KSHANA_SURVEY_DATA").is_ok();
    for cn0 in [45.0, 42.0, 39.0, 37.0, 35.0] {
        for (name, cfg) in [
            ("default (fll pull-in)", &fll_assisted),
            ("fll always", &always),
            ("pll", &pll_only),
        ] {
            let r = carrier_measured(4.1e6, cn0, cfg.clone(), 8.0, data, 2.0);
            println!("{cn0} {name} data={data}: {r}");
        }
    }
}

/// A comma-separated list of numbers from an environment variable (survey settings).
fn env_list(key: &str) -> Option<Vec<f64>> {
    std::env::var(key)
        .ok()
        .map(|v| v.split(',').map(|x| x.trim().parse().unwrap()).collect())
}

fn with_spacing(d: f64) -> LoopConfig {
    LoopConfig {
        spacing_chips: d,
        ..LoopConfig::default()
    }
}

/// The first full-period DLL discriminator output on a noise-free signal `eps` chips off,
/// with early-late spacing `d`.
fn first_disc_d(fs: f64, d: f64, eps: f64) -> f64 {
    let mut src = Synth::at(fs, 13, 0.0, 60.0, 0.004, vec![]);
    src.noise = false;
    let mut init = src.init(0.0);
    init.code_phase_chips += eps;
    let mut session = TrackSession::new(
        src.spec(),
        vec![SessionChannel::from_config(init, with_spacing(d))],
    )
    .unwrap();
    let mut sink = CollectSink::default();
    session.run(&mut src, None, &mut sink).unwrap();
    sink.channels[0][0].0.disc.dll_chips
}

/// `(σ_ε, mean ε)` of the true code tracking error (chips) over 1.5 s ≤ t < 3.5 s at
/// 45 dB-Hz with spacing `d`.
fn code_error_d(fs: f64, d: f64) -> (f64, f64) {
    let doppler = env_list("KSHANA_SURVEY_DOPPLER").map_or(1500.0, |v| v[0]);
    let mut src = Synth::at(fs, 13, doppler, 45.0, 3.5, vec![]);
    let init = src.init(doppler);
    let (phase0, rate) = (src.phase0, src.rate);
    let mut session = TrackSession::new(
        src.spec(),
        vec![SessionChannel::from_config(init, with_spacing(d))],
    )
    .unwrap();
    let mut sink = CollectSink::default();
    session.run(&mut src, None, &mut sink).unwrap();
    let v: Vec<f64> = sink.channels[0]
        .iter()
        .filter(|(e, _)| e.code_epoch_s >= 1.5)
        .map(|(e, _)| {
            let mut x = (e.code_phase_chips - (phase0 + rate * e.sample_index as f64 / fs))
                .rem_euclid(1023.0);
            if x > 511.5 {
                x -= 1023.0;
            }
            x
        })
        .collect();
    (std_dev(&v), v.iter().sum::<f64>() / v.len() as f64)
}

/// Which (samples per chip, spacing) pairs degrade code tracking
/// (`docs/design/evidence/dll-jitter/RESULTS.md`): for each, the noise-free S-curve at
/// offsets 0 … 0.6·d/2 and the 45 dB-Hz σ and mean of the code error, against an
/// incommensurate control at 1.0731× the rate with the same d. Release mode.
#[test]
#[ignore]
fn spacing_ratio_survey() {
    let chip = 1.023e6;
    println!("spc,d,s_curve,sigma_eps,mean_eps,control_sigma,control_mean,excess");
    let ds = env_list("KSHANA_SURVEY_D").unwrap_or(vec![0.5, 0.25, 0.1]);
    let rs = env_list("KSHANA_SURVEY_SPC").unwrap_or(vec![2.0, 2.5, 3.0, 3.5, 4.0, 5.0]);
    for &d in &ds {
        for &r in &rs {
            let fs = r * chip;
            let s: Vec<String> = (0..7)
                .map(|k| format!("{:.4}", first_disc_d(fs, d, k as f64 * 0.05 * d)))
                .collect();
            let (se, me) = code_error_d(fs, d);
            let (sc, mc) = code_error_d(fs * 1.0731, d);
            println!(
                "{r},{d},{},{se:.5},{me:+.5},{sc:.5},{mc:+.5},{:.2}",
                s.join(" "),
                se / sc
            );
        }
    }
}

/// Bar B4 of `docs/design/evidence/carrier-lock/PREREGISTRATION.md`: with the FLL used
/// only during pull-in (the default) and with it always on, the design pulls in a
/// hand-off 100 Hz off the true Doppler at 45 dB-Hz, reaches LOCKED and raises neither a
/// false lock nor a pull-in timeout.
#[test]
fn the_default_design_pulls_in_a_100_hz_handoff_error() {
    let always = LoopConfig {
        fll_assist: kshana::iq::track::FllAssist::Always,
        ..LoopConfig::default()
    };
    for cfg in [LoopConfig::default(), always] {
        let mode = format!("{:?}", cfg.fll_assist);
        let mut src = Synth::at(4.1e6, 13, 1500.0, 45.0, 2.2, vec![]);
        let init = src.init(1400.0);
        let mut session =
            TrackSession::new(src.spec(), vec![SessionChannel::from_config(init, cfg)]).unwrap();
        let mut sink = CollectSink::default();
        session.run(&mut src, None, &mut sink).unwrap();
        let events = &sink.events;
        assert!(
            events
                .iter()
                .all(|e| e.reason != "false-lock" && e.reason != "pull-in-timeout"),
            "{mode}: {events:?}"
        );
        let (last, state) = sink.channels[0].last().unwrap();
        assert_eq!(*state, LockState::Locked, "{mode}: {events:?}");
        assert!(
            (last.doppler_hz - 1500.0).abs() < 5.0,
            "{mode}: {}",
            last.doppler_hz
        );
    }
}

/// Several PRNs in one stream: the first source's noise, every source's signal.
struct Sum(Vec<Synth>);

impl IqSource for Sum {
    fn spec(&self) -> SampleSpec {
        self.0[0].spec()
    }
    fn read(&mut self, buf: &mut [Cf64]) -> Result<usize, IqError> {
        let n = self.0[0].read(buf)?;
        let mut tmp = vec![Cf64::default(); n];
        for s in &mut self.0[1..] {
            s.read(&mut tmp)?;
            for (o, v) in buf.iter_mut().zip(&tmp) {
                *o = *o + *v;
            }
        }
        Ok(n)
    }
}

/// The outage regression from the campaign runs: 20 s, PRNs 3/11/22 at 45 dB-Hz,
/// 4.092 MS/s, no signal for 8.0 ≤ t < 10.0 s, re-acquisition on with the default
/// budget. Every channel must be re-acquired after the signal returns and end LOCKED
/// (with a count-based budget of 3 they were all retired within 0.2 s of the loss).
/// Release mode: `cargo test --release --test iq_track_engine outage -- --ignored`.
#[test]
#[ignore]
fn every_channel_recovers_from_a_2_s_outage() {
    let fs = 4.092e6;
    let gap = (8.0, 10.0);
    let prns = [(3, 1200.0), (11, -2300.0), (22, 400.0)];
    let mut synths: Vec<Synth> = prns
        .iter()
        .map(|&(p, f)| Synth::at(fs, p, f, 45.0, 20.0, vec![gap]))
        .collect();
    for s in &mut synths[1..] {
        s.noise = false;
    }
    let design = DesignFile::parse(
        "schema = \"kshana.loop-design/1\"\n[[design]]\nname = \"d\"\n[design.lock]\nreacquire = true\n",
    )
    .unwrap();
    let chans = synths
        .iter()
        .map(|s| SessionChannel::from_design(s.init(s.doppler), &design.designs()[0]))
        .collect();
    let mut src = Sum(synths);
    let mut session = TrackSession::new(src.spec(), chans).unwrap();
    let mut collect = CollectSink::default();
    let mut summary = kshana::iq::track::sink::Summary::new(1.0);
    let mut fan = Fanout::new();
    fan.push(&mut collect);
    fan.push(&mut summary);
    session.run(&mut src, None, &mut fan).unwrap();
    for (i, &(prn, f)) in prns.iter().enumerate() {
        let ev: Vec<_> = collect
            .events
            .iter()
            .filter(|e| e.channel == i as u32)
            .collect();
        assert!(
            ev.iter().all(|e| e.reason != "retired"),
            "PRN {prn} retired: {ev:?}"
        );
        let back = ev
            .iter()
            .find(|e| e.reason == "reacquired" && e.code_epoch_s >= gap.1)
            .unwrap_or_else(|| panic!("PRN {prn}: no re-acquisition after the gap: {ev:?}"));
        assert!(back.code_epoch_s < gap.1 + 0.3, "PRN {prn}: {back:?}");
        // Evenly spaced searches, every 0.1 s (plus each search's own samples), not a burst.
        let searches = ev.iter().filter(|e| e.reason == "reacq-start").count();
        assert!(
            searches <= 25,
            "PRN {prn}: {searches} searches in a 2 s outage"
        );
        let (last, state) = collect.channels[i].last().unwrap();
        assert_eq!(*state, LockState::Locked, "PRN {prn}: {ev:?}");
        assert!((last.doppler_hz - f).abs() < 25.0, "PRN {prn}");
        assert_eq!(summary.channels[i].final_state, Some(LockState::Locked));
    }
}

/// `final_state` is the channel's state after its last transition: a channel retired
/// after its last loop update ends RETIRED, not in the state of that update. Here the
/// retirement is decided when the second failed search completes (in the search step that
/// follows a chunk's epochs, with `max_reacq_attempts = 2`), so no loop update ever carries
/// RETIRED and only the event can set it.
#[test]
fn the_summary_final_state_follows_the_last_transition() {
    let mut src = Synth::new(11, 1500.0, 45.0, 3.4, vec![(1.6, 3.4)]);
    let init = src.init(1500.0);
    let design = DesignFile::parse(
        "schema = \"kshana.loop-design/1\"\n[[design]]\nname = \"d\"\n[design.lock]\nreacquire = true\nmax_reacq_attempts = 2\n",
    )
    .unwrap();
    let ch = SessionChannel::from_design(init, &design.designs()[0]);
    let mut session = TrackSession::new(src.spec(), vec![ch]).unwrap();
    let mut collect = CollectSink::default();
    let mut summary = kshana::iq::track::sink::Summary::new(1.0);
    let mut fan = Fanout::new();
    fan.push(&mut collect);
    fan.push(&mut summary);
    session.run(&mut src, None, &mut fan).unwrap();
    let last_event = collect.events.last().expect("events");
    assert_eq!(last_event.to, LockState::Retired, "{:?}", collect.events);
    assert_eq!(last_event.reason, "retired", "{:?}", collect.events);
    let (_, last_state) = collect.channels[0].last().expect("epochs");
    assert_ne!(*last_state, LockState::Retired, "no epoch carries RETIRED");
    assert_eq!(summary.channels[0].final_state, Some(last_event.to));
    // Searches were spaced, not back to back.
    let starts: Vec<f64> = collect
        .events
        .iter()
        .filter(|e| e.reason == "reacq-start")
        .map(|e| e.code_epoch_s)
        .collect();
    assert!(starts.len() >= 2, "{:?}", collect.events);
    assert!(starts.windows(2).all(|w| w[1] - w[0] >= 0.09), "{starts:?}");
}

/// The FLL gate is what holds the default design's phase lock at 35 dB-Hz
/// (`docs/design/evidence/carrier-lock/`). With the FLL path handed over to the PLL after
/// pull-in, phase lock holds in ≥ 95 % of the updates after 3 s; with the same design and
/// the FLL always on, it does not (≈ 10–16 % in the full survey). At 35 dB-Hz the hand-over
/// itself comes 1.9–2.6 s in (`fll_handover_survey`), hence the 3 s start.
#[test]
fn the_fll_gate_holds_phase_lock_at_35_dbhz() {
    let gated = carrier_measured(2.6e6, 35.0, LoopConfig::default(), 4.5, false, 3.0);
    assert!(gated.phase_lock >= 0.95, "pull-in gate: {gated}");
    assert_eq!(gated.slips, 0, "pull-in gate: {gated}");
    let always = LoopConfig {
        fll_assist: kshana::iq::track::FllAssist::Always,
        ..LoopConfig::default()
    };
    let ungated = carrier_measured(2.6e6, 35.0, always, 4.5, false, 3.0);
    assert!(ungated.phase_lock < 0.5, "FLL always on: {ungated}");
}

/// When the FLL hands over to the PLL, by C/N0 and gate thresholds (diagnostic; release).
#[test]
#[ignore]
fn fll_handover_survey() {
    use kshana::iq::track::{FllAssist, FllGate};
    for fs in [2.6e6, 4.1e6] {
        for cn0 in [33.0, 35.0, 37.0] {
            for (off, on) in [(0.8, 0.6), (0.7, 0.5), (0.6, 0.4)] {
                let cfg = LoopConfig {
                    fll_assist: FllAssist::PullIn(FllGate {
                        off_pli: off,
                        on_pli: on,
                        dwell_s: 0.1,
                    }),
                    ..LoopConfig::default()
                };
                let mut src = Synth::at(fs, 13, 1500.0, cn0, 6.0, vec![]);
                let init = src.init(1500.0);
                let mut session =
                    TrackSession::new(src.spec(), vec![SessionChannel::from_config(init, cfg)])
                        .unwrap();
                let mut sink = CollectSink::default();
                session.run(&mut src, None, &mut sink).unwrap();
                let ep = &sink.channels[0];
                let handover = ep
                    .iter()
                    .find(|(e, _)| !e.fll_active)
                    .map(|(e, _)| e.code_epoch_s);
                let toggles = ep
                    .windows(2)
                    .filter(|w| w[0].0.fll_active != w[1].0.fll_active)
                    .count();
                let late: Vec<_> = ep.iter().filter(|(e, _)| e.code_epoch_s >= 3.0).collect();
                let pl =
                    late.iter().filter(|(e, _)| e.phase_lock).count() as f64 / late.len() as f64;
                println!("fs {fs} cn0 {cn0} off {off} on {on}: handover {handover:?} toggles {toggles} phase_lock(t>=3) {pl:.3}");
            }
        }
    }
}

// ---- Extra correlator taps (`extra_taps_chips`). ----

fn tap_run(
    taps: &[f64],
    doppler: f64,
    coherent: usize,
    noise: bool,
    seconds: f64,
) -> Vec<kshana::iq::track::EpochOutput> {
    tap_run_at(FS, taps, doppler, coherent, noise, seconds)
}

fn tap_run_at(
    fs: f64,
    taps: &[f64],
    doppler: f64,
    coherent: usize,
    noise: bool,
    seconds: f64,
) -> Vec<kshana::iq::track::EpochOutput> {
    let mut src = Synth::at(fs, 11, doppler, 46.0, seconds, vec![]);
    src.noise = noise;
    let init = src.init(doppler + 40.0);
    let cfg = LoopConfig {
        coherent_periods: coherent,
        extra_taps_chips: taps.to_vec(),
        ..LoopConfig::default()
    };
    let mut session =
        TrackSession::new(src.spec(), vec![SessionChannel::from_config(init, cfg)]).unwrap();
    let mut collect = CollectSink::default();
    session.run(&mut src, None, &mut collect).unwrap();
    collect.channels[0].iter().map(|(e, _)| e.clone()).collect()
}

/// A tap at +d/2 is the early correlator and a tap at −d/2 the late one, bit for bit, also
/// with a non-zero Doppler (so a non-zero code rate that drifts across the period) and a
/// multi-period integration.
#[test]
fn taps_at_half_the_spacing_equal_early_and_late_bit_for_bit() {
    for (doppler, coherent) in [(0.0, 1), (2600.0, 1), (-3100.0, 4)] {
        let epochs = tap_run(&[0.25, -0.25], doppler, coherent, true, 0.8);
        assert!(epochs.len() > 40, "{} epochs", epochs.len());
        for e in &epochs {
            assert_eq!(e.extra.len(), 2);
            assert_eq!(e.extra[0], (0.25, e.early), "doppler {doppler}");
            assert_eq!(e.extra[1], (-0.25, e.late), "doppler {doppler}");
        }
        assert!(epochs.iter().any(|e| e.code_rate_hz != 1.023e6) || doppler == 0.0);
    }
}

/// Taps change nothing the loops see: E/P/L, discriminators and NCO state are identical
/// with and without them.
#[test]
fn taps_do_not_disturb_the_loops() {
    let with = tap_run(&[0.1, 0.9, -1.4], 1700.0, 1, true, 0.6);
    let without = tap_run(&[], 1700.0, 1, true, 0.6);
    assert_eq!(with.len(), without.len());
    for (a, b) in with.iter().zip(&without) {
        let mut a = a.clone();
        assert_eq!(a.extra.len(), 3);
        a.extra.clear();
        assert_eq!(&a, b);
        assert!(b.extra.is_empty());
    }
}

/// On a noise-free signal the loops hold the prompt on the correlation peak, so a
/// symmetric pair of taps sees equal magnitude. (At 7.8 samples per chip: at 2 the replica
/// is a staircase and a tap at ±0.3 chip need not straddle the peak, the commensurate
/// sampling limitation in `docs/design/iq-notes/receiver.md`.)
#[test]
fn a_symmetric_pair_on_a_clean_signal_is_balanced() {
    let epochs = tap_run_at(8.0e6, &[0.3, -0.3], 900.0, 1, false, 0.6);
    let tail = &epochs[epochs.len() / 2..];
    for e in tail {
        let (a, b) = (e.extra[0].1.abs(), e.extra[1].1.abs());
        let p = e.prompt.abs();
        assert!(p > 0.0);
        assert!((a - b).abs() / p < 0.02, "{a} vs {b} (prompt {p})");
    }
}

fn tap_header(taps: &[f64]) -> EpochHeader {
    header(1).with_extra_taps(taps)
}

#[test]
fn the_writers_carry_the_taps_and_binary_reads_them_back() {
    let taps = [0.2, -0.2, 0.75];
    let epochs = tap_run(&taps, -500.0, 1, true, 0.5);
    let h = tap_header(&taps);
    assert_eq!(h.record_bytes, 184 + 16 * 3);
    let (mut csv, mut jsonl, mut bin) = (Vec::new(), Vec::new(), Vec::new());
    {
        let mut w1 = CsvEpochWriter::with_extra_taps(&mut csv, 3).unwrap();
        let mut w2 = JsonlEpochWriter::new(&mut jsonl, &h).unwrap();
        let mut w3 = BinaryEpochWriter::new(&mut bin, &h).unwrap();
        use kshana::iq::track::sink::EpochSink;
        for e in &epochs {
            w1.epoch(0, e, LockState::Locked).unwrap();
            w2.epoch(0, e, LockState::Locked).unwrap();
            w3.epoch(0, e, LockState::Locked).unwrap();
        }
        w1.finish().unwrap();
        w2.finish().unwrap();
        w3.finish().unwrap();
    }
    let want: Vec<EpochRecord> = epochs
        .iter()
        .map(|e| EpochRecord::new(0, e, LockState::Locked))
        .collect();
    assert_eq!(want[0].extra.len(), 3);

    let reader = BinaryEpochReader::new(std::io::Cursor::new(&bin)).unwrap();
    assert_eq!(reader.header().extra_taps_chips, taps);
    let back: Vec<EpochRecord> = reader.map(Result::unwrap).collect();
    assert_eq!(back, want, "binary round trip with taps is exact");

    let lines: Vec<&str> = std::str::from_utf8(&jsonl).unwrap().lines().collect();
    assert!(lines[0].contains("\"extra_taps_chips\":[0.2,-0.2,0.75]"));
    let from_json: Vec<EpochRecord> = lines[1..]
        .iter()
        .map(|l| serde_json::from_str(l).unwrap())
        .collect();
    assert_eq!(from_json, want);

    let csv = String::from_utf8(csv).unwrap();
    let mut rows = csv.lines();
    let cols: Vec<&str> = rows.next().unwrap().split(',').collect();
    let n = kshana::iq::track::sink::EPOCH_FIELDS.len();
    assert_eq!(cols.len(), n + 9);
    assert_eq!(&cols[n..n + 3], ["x0_offset_chips", "x0_i", "x0_q"]);
    for r in rows {
        assert_eq!(r.split(',').count(), cols.len());
    }
}

/// A header without taps is unchanged: no key, 184-byte records, the 0.34 field list.
#[test]
fn a_tapless_header_is_the_old_header() {
    let h = header(1);
    assert_eq!(h.record_bytes, 184);
    assert!(h.extra_taps_chips.is_empty());
    assert!(!serde_json::to_string(&h).unwrap().contains("extra_taps"));
    assert_eq!(h.fields, kshana::iq::track::sink::EPOCH_FIELDS);
}

/// The reader fails loudly on a header whose tap list and record size disagree, which is
/// what a file from before taps (or a hand-edited one) looks like to the new reader, and
/// what a tapped file looks like to an old reader (record size ≠ 184).
#[test]
fn the_reader_refuses_a_header_whose_record_size_ignores_its_taps() {
    let mut h = tap_header(&[0.25]);
    let mut bin = Vec::new();
    {
        use kshana::iq::track::sink::EpochSink;
        let e = tap_run(&[0.25], 0.0, 1, true, 0.1).remove(0);
        let mut w = BinaryEpochWriter::new(&mut bin, &h).unwrap();
        w.epoch(0, &e, LockState::Locked).unwrap();
    }
    assert!(BinaryEpochReader::new(std::io::Cursor::new(&bin)).is_ok());
    // The same file with the record size an old reader accepts.
    h.record_bytes = 184;
    let mut bad = serde_json::to_vec(&h).unwrap();
    bad.push(b'\n');
    let body = &bin[bin.iter().position(|&b| b == b'\n').unwrap() + 1..];
    bad.extend_from_slice(body);
    let err = BinaryEpochReader::new(std::io::Cursor::new(&bad))
        .err()
        .unwrap();
    assert!(err.to_string().contains("200"), "{err}");
    // And the tapped record size is not 184, so an old reader's size check refuses it.
    assert_ne!(tap_header(&[0.25]).record_bytes, 184);
}

/// A writer set up for taps refuses an epoch that carries a different number.
#[test]
fn a_writer_refuses_an_epoch_with_the_wrong_number_of_taps() {
    use kshana::iq::track::sink::EpochSink;
    let e = tap_run(&[], 0.0, 1, true, 0.1).remove(0);
    let mut bin = Vec::new();
    let mut w = BinaryEpochWriter::new(&mut bin, &tap_header(&[0.1, 0.2])).unwrap();
    assert!(w.epoch(0, &e, LockState::Locked).is_err());
    let mut csv = Vec::new();
    let mut w = CsvEpochWriter::with_extra_taps(&mut csv, 1).unwrap();
    assert!(w.epoch(0, &e, LockState::Locked).is_err());
}

#[test]
fn bad_taps_are_refused_by_the_channel() {
    for taps in [vec![f64::NAN], vec![2.5], vec![0.1; 17]] {
        let src = Synth::new(11, 0.0, 46.0, 0.1, vec![]);
        let cfg = LoopConfig {
            extra_taps_chips: taps.clone(),
            ..LoopConfig::default()
        };
        assert!(
            TrackSession::new(
                src.spec(),
                vec![SessionChannel::from_config(src.init(0.0), cfg)]
            )
            .is_err(),
            "{taps:?}"
        );
    }
}

/// Threads change the speed and nothing else: with a good channel, a false-locking one
/// (hand-off 500 Hz off, repaired by re-acquisition) and a channel on an absent PRN (lost,
/// searching, retired), every epoch, state and event, and their interleaving into the
/// sink, equals the serial run.
#[test]
fn threads_leave_epochs_states_and_events_unchanged() {
    #[derive(Default)]
    struct Log(Vec<String>);
    impl kshana::iq::track::sink::EpochSink for Log {
        fn epoch(
            &mut self,
            ch: usize,
            e: &kshana::iq::track::EpochOutput,
            s: LockState,
        ) -> Result<(), IqError> {
            self.0.push(format!("E{ch} {e:?} {s:?}"));
            Ok(())
        }
        fn event(&mut self, ev: &kshana::iq::track::LockEvent) -> Result<(), IqError> {
            self.0.push(format!("V {ev:?}"));
            Ok(())
        }
    }
    let design = DesignFile::parse(
        "schema = \"kshana.loop-design/1\"\n[[design]]\nname = \"d\"\n[design.lock]\n\
         reacquire = true\nreacq_window_s = 1.0\nmax_reacq_attempts = 3\n",
    )
    .unwrap();
    let run = |threads: usize| {
        let truth = 1500.0;
        let mut src = Synth::new(17, truth, 45.0, 3.0, vec![]);
        let good = src.init(truth + 20.0);
        let off = src.init(truth - 500.0);
        let mut absent = src.init(300.0);
        absent.code = Arc::new(build_code("gps-l1ca", 25).unwrap());
        let chans = [good, off, absent]
            .into_iter()
            .map(|i| SessionChannel::from_design(i, &design.designs()[0]))
            .collect();
        let mut s = TrackSession::new(src.spec(), chans)
            .unwrap()
            .with_threads(threads);
        let mut log = Log::default();
        s.run(&mut src, None, &mut log).unwrap();
        log.0
    };
    let serial = run(1);
    assert!(serial.iter().any(|l| l.starts_with("V ")), "events occur");
    for n in [2, 3, 8] {
        assert!(run(n) == serial, "--threads {n} differs from serial");
    }
}
