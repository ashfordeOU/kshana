// SPDX-License-Identifier: AGPL-3.0-only
//! Streaming M2M4 C/N0 in the tracking channel (`EpochOutput.cn0_m2m4_dbhz`). Bars M1-M4 are
//! pre-registered in `docs/design/evidence/cn0-m2m4/PREREGISTRATION.md` (commit 3cd91504).
//! Release mode: `cargo test --release --test iq_track_cn0 -- --ignored --nocapture`.

use kshana::iq::cli::build_code;
use kshana::iq::signals::SignalCode;
use kshana::iq::track::sink::CollectSink;
use kshana::iq::track::{
    CarrierLoop, ChannelInit, EpochOutput, LoopConfig, SessionChannel, TrackSession,
};
use kshana::iq::{Cf64, IqError, IqSource, SampleSpec, SpreadingCode};
use std::f64::consts::TAU;
use std::sync::Arc;

/// One signal at a fixed Doppler and C/N0 in unit-variance complex noise (deterministic).
struct Synth {
    fs: f64,
    code: SignalCode,
    doppler: f64,
    amp: f64,
    rate: f64,
    phase0: f64,
    n: u64,
    total: u64,
    rng: u64,
}

impl Synth {
    fn new(code: SignalCode, prn: i64, fs: f64, doppler: f64, cn0_dbhz: f64, seconds: f64) -> Self {
        let rate = code.chip_rate_hz() * (1.0 + doppler / code.carrier_hz());
        Self {
            fs,
            amp: (10f64.powf(cn0_dbhz / 10.0) / fs).sqrt(),
            code,
            doppler,
            rate,
            phase0: 300.25,
            n: 0,
            total: (seconds * fs) as u64,
            rng: 0x9e37_79b9_7f4a_7c15 ^ prn as u64,
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
            fs_hz: self.fs,
            center_hz: self.code.carrier_hz(),
            if_hz: 0.0,
        }
    }
    fn read(&mut self, buf: &mut [Cf64]) -> Result<usize, IqError> {
        let k = buf.len().min((self.total - self.n) as usize);
        let s = std::f64::consts::FRAC_1_SQRT_2;
        for out in buf.iter_mut().take(k) {
            let t = self.n as f64 / self.fs;
            let c = self.code.value_at(self.phase0 + self.rate * t);
            let ph = TAU * self.doppler * t;
            let v = Cf64::new(s * self.gauss(), s * self.gauss());
            *out = v + Cf64::new(ph.cos(), ph.sin()) * (self.amp * c);
            self.n += 1;
        }
        Ok(k)
    }
}

/// Track `src` from the truth hand-off with the default design but PLL bandwidth `pll_bw`.
fn track(mut src: Synth, pll_bw: f64) -> Vec<EpochOutput> {
    let init = src.init(src.doppler + 10.0);
    let cfg = LoopConfig {
        carrier: CarrierLoop::FllAssistedPll {
            pll_order: 2,
            pll_bn_hz: pll_bw,
            fll_order: 1,
            fll_bn_hz: 10.0,
        },
        ..LoopConfig::default()
    };
    let mut session =
        TrackSession::new(src.spec(), vec![SessionChannel::from_config(init, cfg)]).unwrap();
    let mut collect = CollectSink::default();
    session.run(&mut src, None, &mut collect).unwrap();
    collect.channels[0].iter().map(|(e, _)| e.clone()).collect()
}

/// FNV-1a over the bit patterns of every NWPR estimate of a run (absent = a marker).
fn nwpr_checksum(epochs: &[EpochOutput]) -> u64 {
    let mut h = 0xcbf2_9ce4_8422_2325u64;
    for e in epochs {
        let v = e.cn0_nwpr_dbhz.map_or(u64::MAX, f64::to_bits);
        for b in v.to_le_bytes() {
            h ^= b as u64;
            h = h.wrapping_mul(0x0000_0100_0000_01b3);
        }
    }
    h
}

fn l1ca_45() -> Vec<EpochOutput> {
    track(
        Synth::new(
            build_code("gps-l1ca", 7).unwrap(),
            7,
            2.5e6,
            1200.0,
            45.0,
            6.0,
        ),
        15.0,
    )
}

/// The NWPR checksum of the L1 C/A 45 dB-Hz run (2.5 MS/s, 6 s, PRN 7, 1200 Hz), captured
/// from the base commit 010b30b9 before the M2M4 change.
// PIN-SCOPE:    FNV-1a over the f64 bit patterns of every NWPR estimate (or a marker) of the 5999
//               epochs of that one run on the unmodified channel
// PIN-EXCLUDES: every other output and every other scene
const NWPR_BASELINE_EPOCHS: usize = 5999;
const NWPR_BASELINE_CHECKSUM: u64 = 0x05b3caf744da2a2d;

/// M2 and M3. Release (6 s of a 2.5 MS/s stream through the default design).
#[test]
#[ignore = "release"]
fn m2_m3_l1ca_45_dbhz_m2m4_is_nominal_and_nwpr_is_unchanged() {
    let e = l1ca_45();
    assert_eq!(e.len(), NWPR_BASELINE_EPOCHS);
    assert_eq!(
        nwpr_checksum(&e),
        NWPR_BASELINE_CHECKSUM,
        "M3: NWPR changed"
    );
    let m = e.last().unwrap().cn0_m2m4_dbhz.expect("M2M4 estimate");
    println!(
        "L1 C/A 45 dB-Hz: M2M4 {m:.2}, NWPR {:?}",
        e.last().unwrap().cn0_nwpr_dbhz
    );
    assert!((m - 45.0).abs() <= 0.5, "M2: M2M4 {m:.2} dB-Hz vs 45");
}

/// M1: GPS L2C CM (20 ms), nominal 40 dB-Hz, PLL 1, 2.5, 5, 10 Hz.
#[test]
#[ignore = "release, about a minute"]
fn m1_l2c_20_ms_m2m4_is_nominal_at_every_pll_bandwidth() {
    let mut worst = 0.0_f64;
    for bw in [1.0, 2.5, 5.0, 10.0] {
        let code = kshana::iq::signals::gps::l2c_cm(5).unwrap();
        let e = track(Synth::new(code, 5, 1.25e6, -800.0, 40.0, 25.0), bw);
        let last = e.last().unwrap();
        let m = last.cn0_m2m4_dbhz.expect("M2M4 estimate");
        println!(
            "PLL {bw} Hz: M2M4 {m:.2}, NWPR {:?}, t_coh {}",
            last.cn0_nwpr_dbhz, last.t_coh_s
        );
        worst = worst.max((m - 40.0).abs());
        assert!(
            (m - 40.0).abs() <= 0.5,
            "M1: PLL {bw} Hz: M2M4 {m:.2} dB-Hz vs 40"
        );
    }
    println!("worst |M2M4 - nominal| {worst:.2} dB");
}

/// M4: the column is in the CSV and JSONL, the binary record keeps its 184 bytes (the M2M4
/// value takes the reserved float and flag bit 6), and the binary form round-trips exactly.
#[test]
fn m4_the_epoch_formats_carry_the_m2m4_column() {
    use kshana::iq::track::sink::{
        BinaryEpochReader, BinaryEpochWriter, ChannelInfo, CsvEpochWriter, EpochHeader,
        EpochRecord, EpochSink, JsonlEpochWriter, EPOCH_FIELDS,
    };
    use kshana::iq::track::LockState;
    let mut src = Synth::new(
        build_code("gps-l1ca", 7).unwrap(),
        7,
        2.5e6,
        900.0,
        46.0,
        1.0,
    );
    let init = src.init(910.0);
    let cfg = LoopConfig {
        cn0_windows: 5,
        ..LoopConfig::default()
    };
    let mut session =
        TrackSession::new(src.spec(), vec![SessionChannel::from_config(init, cfg)]).unwrap();
    let mut collect = CollectSink::default();
    session.run(&mut src, None, &mut collect).unwrap();
    let epochs: Vec<EpochOutput> = collect.channels[0].iter().map(|(e, _)| e.clone()).collect();
    let with = epochs.iter().filter(|e| e.cn0_m2m4_dbhz.is_some()).count();
    assert!(
        with > 500 && with < epochs.len(),
        "{with} of {}",
        epochs.len()
    );
    let m = epochs.last().unwrap().cn0_m2m4_dbhz.unwrap();
    assert!((m - 46.0).abs() < 1.5, "{m}");

    let col = EPOCH_FIELDS
        .iter()
        .position(|f| *f == "cn0_m2m4_dbhz")
        .unwrap();
    assert_eq!(EPOCH_FIELDS[col - 1], "cn0_beaulieu_dbhz");
    let header = EpochHeader::new(
        vec![ChannelInfo {
            code: "c".into(),
            design: "d".into(),
            design_hash: String::new(),
        }],
        2.5e6,
    );
    assert_eq!(header.record_bytes, 184);
    let (mut csv, mut jsonl, mut bin) = (Vec::new(), Vec::new(), Vec::new());
    {
        let mut w1 = CsvEpochWriter::new(&mut csv).unwrap();
        let mut w2 = JsonlEpochWriter::new(&mut jsonl, &header).unwrap();
        let mut w3 = BinaryEpochWriter::new(&mut bin, &header).unwrap();
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
    let back: Vec<EpochRecord> = BinaryEpochReader::new(std::io::Cursor::new(&bin))
        .unwrap()
        .map(Result::unwrap)
        .collect();
    assert_eq!(back, want, "binary round trip is exact");
    let hdr = bin.iter().position(|&b| b == b'\n').unwrap() + 1;
    assert_eq!((bin.len() - hdr) % 184, 0, "records stay 184 bytes");
    let text = String::from_utf8(csv).unwrap();
    let mut lines = text.lines();
    assert_eq!(lines.next().unwrap(), EPOCH_FIELDS.join(","));
    let last: Vec<&str> = lines.last().unwrap().split(',').collect();
    assert_eq!(last.len(), EPOCH_FIELDS.len());
    assert_eq!(last[col].parse::<f64>().unwrap(), m);
    let from_json: Vec<EpochRecord> = std::str::from_utf8(&jsonl)
        .unwrap()
        .lines()
        .skip(1)
        .map(|l| serde_json::from_str(l).unwrap())
        .collect();
    assert_eq!(from_json, want);
}
