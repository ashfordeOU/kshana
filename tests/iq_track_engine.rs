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
    code: kshana::iq::signals::SignalCode,
    doppler: f64,
    amp: f64,
    rate: f64,
    phase0: f64,
    gaps: Vec<(f64, f64)>,
    n: u64,
    total: u64,
    rng: u64,
}

impl Synth {
    fn new(prn: i64, doppler: f64, cn0_dbhz: f64, seconds: f64, gaps: Vec<(f64, f64)>) -> Self {
        let code = build_code("gps-l1ca", prn).unwrap();
        let rate = code.chip_rate_hz() * (1.0 + doppler / code.carrier_hz());
        Self {
            amp: (10f64.powf(cn0_dbhz / 10.0) / FS).sqrt(),
            code,
            doppler,
            rate,
            phase0: 300.25,
            gaps,
            n: 0,
            total: (seconds * FS) as u64,
            rng: 0x9e37_79b9_7f4a_7c15 ^ prn as u64,
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
            let on = !self.gaps.iter().any(|&(a, b)| t >= a && t < b);
            let mut v = Cf64::new(s * self.gauss(), s * self.gauss());
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
