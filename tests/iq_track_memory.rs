// SPDX-License-Identifier: AGPL-3.0-only
//! R6: the heap a streamed tracking run needs does not grow with the recording's length.
//!
//! Its own test binary, because the measurement uses a process-wide counting allocator and
//! must not see other tests' allocations. Reference: the in-memory path keeps one
//! `EpochOutput` (about 200 bytes) per loop update; the streamed path keeps none.

use kshana::iq::cli::build_code;
use kshana::iq::track::sink::{BinaryEpochWriter, CollectSink, EpochHeader, Fanout, Summary};
use kshana::iq::track::{ChannelInit, LoopConfig, SessionChannel, TrackSession};
use kshana::iq::{Cf64, IqError, IqSource, SampleSpec, SpreadingCode};
use std::alloc::{GlobalAlloc, Layout, System};
use std::f64::consts::TAU;
use std::sync::atomic::{AtomicUsize, Ordering};
use std::sync::Arc;

// ---- A counting allocator: current and peak heap bytes of this test binary. ----

struct Counting;
static LIVE: AtomicUsize = AtomicUsize::new(0);
static PEAK: AtomicUsize = AtomicUsize::new(0);

unsafe impl GlobalAlloc for Counting {
    unsafe fn alloc(&self, l: Layout) -> *mut u8 {
        let p = unsafe { System.alloc(l) };
        if !p.is_null() {
            let now = LIVE.fetch_add(l.size(), Ordering::Relaxed) + l.size();
            PEAK.fetch_max(now, Ordering::Relaxed);
        }
        p
    }
    unsafe fn dealloc(&self, p: *mut u8, l: Layout) {
        unsafe { System.dealloc(p, l) };
        LIVE.fetch_sub(l.size(), Ordering::Relaxed);
    }
}

#[global_allocator]
static ALLOC: Counting = Counting;

/// The counters are process-wide: the tests take turns.
static SERIAL: std::sync::Mutex<()> = std::sync::Mutex::new(());

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

/// Peak heap of a run of `seconds` that keeps every epoch in memory (the control).
fn collected_peak(seconds: f64) -> usize {
    let mut src = Synth::new(3, 2000.0, 45.0, seconds, vec![]);
    let init = src.init(1980.0);
    let mut session = TrackSession::new(
        src.spec(),
        vec![SessionChannel::from_config(init, LoopConfig::default())],
    )
    .unwrap();
    let base = LIVE.load(Ordering::Relaxed);
    PEAK.store(base, Ordering::Relaxed);
    let mut sink = CollectSink::default();
    session.run(&mut src, None, &mut sink).unwrap();
    PEAK.load(Ordering::Relaxed) - base
}

/// Peak heap of a streamed run of `seconds`, measured above the heap in use before it.
fn streamed_peak(seconds: f64) -> (usize, u64) {
    let mut src = Synth::new(3, 2000.0, 45.0, seconds, vec![]);
    let init = src.init(1980.0);
    let mut session = TrackSession::new(
        src.spec(),
        vec![SessionChannel::from_config(init, LoopConfig::default())],
    )
    .unwrap();
    let mut summary = Summary::new(0.0);
    let mut sink = BinaryEpochWriter::new(std::io::sink(), &header(1)).unwrap();
    let base = LIVE.load(Ordering::Relaxed);
    PEAK.store(base, Ordering::Relaxed);
    {
        let mut fan = Fanout::new();
        fan.push(&mut sink);
        fan.push(&mut summary);
        session.run(&mut src, None, &mut fan).unwrap();
    }
    let peak = PEAK.load(Ordering::Relaxed) - base;
    (peak, summary.channels[0].epochs)
}

/// R6: the heap a tracking run needs does not grow with the recording's length. Six times
/// the length must fit in the same peak (within 64 KiB), while the epochs written grow six
/// times; the in-memory path would need about 200 bytes more per epoch.
#[test]
fn a_streamed_run_needs_the_same_memory_whatever_its_length() {
    let _turn = SERIAL.lock().unwrap_or_else(|p| p.into_inner());
    let (short_peak, short_epochs) = streamed_peak(1.0);
    let (long_peak, long_epochs) = streamed_peak(6.0);
    assert!(
        long_epochs >= 5 * short_epochs,
        "{short_epochs} vs {long_epochs}"
    );
    assert!(
        long_peak <= short_peak + 64 * 1024,
        "peak heap grew from {short_peak} to {long_peak} bytes over {} more epochs",
        long_epochs - short_epochs
    );
}

/// The control: the same measurement does see the in-memory path grow, so the bound above
/// is not passing because the allocator counts nothing.
#[test]
fn the_measurement_sees_an_in_memory_run_grow() {
    let _turn = SERIAL.lock().unwrap_or_else(|p| p.into_inner());
    let short = collected_peak(1.0);
    let long = collected_peak(4.0);
    assert!(
        long > short + 300 * 1024,
        "keeping 3000 more epochs should cost well over 300 KiB: {short} -> {long}"
    );
}
