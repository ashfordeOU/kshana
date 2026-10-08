// SPDX-License-Identifier: AGPL-3.0-only
//! B6.3: a recording of gigabytes streamed through `kshana iq track --epochs run.bin` in
//! bounded memory and at a useful speed.
//!
//! IGNORED: it writes a multi-gigabyte file and takes minutes, so it never runs in the
//! per-PR CI. Run it with
//!
//! ```text
//! KSHANA_GB_SCALE_GB=2 cargo test --release --test iq_track_gbscale -- --ignored --nocapture
//! ```
//!
//! (`KSHANA_GB_SCALE_GB`: recording size in decimal gigabytes, default 2; `KSHANA_GB_SCALE_DIR`:
//! where the recording and outputs go, default the system temp directory; both are deleted at
//! the end.) The manual workflow `.github/workflows/gb-scale.yml` runs it.
//!
//! The recording is synthetic: one GPS L1 C/A PRN at 1500 Hz Doppler and 46 dB-Hz in
//! unit-variance noise, 2.046 MHz complex `cf32_le`, generated in a stream (never held in
//! memory).
//!
//! PRE-REGISTERED BARS (fixed before the first run; never relaxed after a result):
//! * G1  the heap the run needs, above what the process held before it, peaks at no more
//!   than 64 MiB, whatever the recording's size (measured by a counting allocator);
//! * G2  end-to-end throughput, samples over wall time of the whole `iq track` call
//!   including acquisition and the epoch file, is at least 1.0 MS/s (one channel; the
//!   real-time rate of the signal is 2.046 MS/s);
//! * G3  the channel is LOCKED at the end, and the run wrote at least 99% of the one epoch
//!   per millisecond the recording's length implies;
//! * G4  the `.bin` epoch file reads back end to end with strictly increasing epoch indices
//!   and a last sample index within one code period of the recording's length.

use kshana::iq::cli::{build_code, run};
use kshana::iq::track::sink::BinaryEpochReader;
use kshana::iq::{Cf64, SpreadingCode};
use std::alloc::{GlobalAlloc, Layout, System};
use std::f64::consts::TAU;
use std::io::{BufReader, BufWriter, Write};
use std::sync::atomic::{AtomicUsize, Ordering};

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

const FS: f64 = 2.046e6;
const DOPPLER: f64 = 1500.0;
const CN0_DBHZ: f64 = 46.0;
const BAR_HEAP_BYTES: usize = 64 << 20;
const BAR_MSPS: f64 = 1.0;

/// Stream `n` samples of the signal to `path` as `cf32_le`; returns the bytes written.
fn generate(path: &std::path::Path, n: u64) -> u64 {
    let code = build_code("gps-l1ca", 7).unwrap();
    let rate = code.chip_rate_hz() * (1.0 + DOPPLER / code.carrier_hz());
    let amp = (10f64.powf(CN0_DBHZ / 10.0) / FS).sqrt();
    let mut w = BufWriter::with_capacity(1 << 20, std::fs::File::create(path).unwrap());
    let mut rng = 0x9e37_79b9_7f4a_7c15u64;
    let mut u = move || {
        rng ^= rng >> 12;
        rng ^= rng << 25;
        rng ^= rng >> 27;
        ((rng.wrapping_mul(0x2545_f491_4f6c_dd1d) >> 11) as f64 + 0.5) / (1u64 << 53) as f64
    };
    let s = std::f64::consts::FRAC_1_SQRT_2;
    let step = Cf64::new((TAU * DOPPLER / FS).cos(), (TAU * DOPPLER / FS).sin());
    let mut lo = Cf64::new(1.0, 0.0);
    for i in 0..n {
        if i % 4096 == 0 {
            // Re-anchor the phasor so rounding never accumulates.
            let ph = TAU * DOPPLER * (i as f64 / FS);
            lo = Cf64::new(ph.cos(), ph.sin());
        }
        let (a, b, c, d) = (u(), u(), u(), u());
        let r1 = (-2.0 * a.ln()).sqrt();
        let r2 = (-2.0 * c.ln()).sqrt();
        let (ni, nq) = (s * r1 * (TAU * b).cos(), s * r2 * (TAU * d).cos());
        let chip = code.value_at(300.25 + rate * (i as f64 / FS));
        let v = Cf64::new(ni, nq) + lo * (amp * chip);
        w.write_all(&(v.re as f32).to_le_bytes()).unwrap();
        w.write_all(&(v.im as f32).to_le_bytes()).unwrap();
        lo = lo * step;
    }
    w.flush().unwrap();
    n * 8
}

#[test]
#[ignore = "writes a multi-gigabyte recording and takes minutes (release); see the module doc"]
fn a_multi_gigabyte_recording_streams_through_iq_track_in_bounded_memory() {
    let gb: f64 = std::env::var("KSHANA_GB_SCALE_GB")
        .ok()
        .and_then(|v| v.parse().ok())
        .unwrap_or(2.0);
    assert!(
        gb >= 0.01,
        "KSHANA_GB_SCALE_GB must be a positive size in GB"
    );
    let dir = std::env::var_os("KSHANA_GB_SCALE_DIR")
        .map(std::path::PathBuf::from)
        .unwrap_or_else(std::env::temp_dir)
        .join(format!("kshana-gb-scale-{}", std::process::id()));
    std::fs::create_dir_all(&dir).unwrap();
    let rec = dir.join("big.cf32");
    let epochs = dir.join("run.bin");
    let summary = dir.join("summary.json");
    struct Cleanup(std::path::PathBuf);
    impl Drop for Cleanup {
        fn drop(&mut self) {
            let _ = std::fs::remove_dir_all(&self.0);
        }
    }
    let _cleanup = Cleanup(dir.clone());

    let n = (gb * 1e9 / 8.0) as u64;
    let t = std::time::Instant::now();
    let bytes = generate(&rec, n);
    println!(
        "generated {:.2} GB ({n} samples, {:.0} s of signal) in {:.1} s",
        bytes as f64 / 1e9,
        n as f64 / FS,
        t.elapsed().as_secs_f64()
    );

    let a: Vec<String> = [
        "track",
        &rec.display().to_string(),
        "--format",
        "cf32_le",
        "--rate",
        "2046000",
        "--center",
        "1575420000",
        "--signal",
        "gps-l1ca",
        "--prn",
        "7",
        "--epochs",
        &epochs.display().to_string(),
        "--summary",
        &summary.display().to_string(),
    ]
    .iter()
    .map(|s| s.to_string())
    .collect();

    let baseline = LIVE.load(Ordering::Relaxed);
    PEAK.store(baseline, Ordering::Relaxed);
    let t = std::time::Instant::now();
    let code = run(&a);
    let wall = t.elapsed().as_secs_f64();
    let heap = PEAK.load(Ordering::Relaxed).saturating_sub(baseline);
    assert_eq!(code, 0, "iq track failed");
    let msps = n as f64 / wall / 1e6;
    println!(
        "tracked in {wall:.1} s: {msps:.2} MS/s ({:.2}x real time); heap peak {:.1} MiB above baseline",
        msps * 1e6 / FS,
        heap as f64 / (1u64 << 20) as f64
    );

    // G1, G2.
    assert!(
        heap <= BAR_HEAP_BYTES,
        "G1: heap peak {heap} B exceeds {BAR_HEAP_BYTES} B"
    );
    assert!(
        msps >= BAR_MSPS,
        "G2: {msps:.2} MS/s is below {BAR_MSPS} MS/s"
    );

    // G3.
    let s: serde_json::Value =
        serde_json::from_str(&std::fs::read_to_string(&summary).unwrap()).unwrap();
    let ch = &s["channels"][0];
    let want = n as f64 / FS * 1000.0;
    let got = ch["epochs"].as_f64().unwrap();
    println!(
        "final_state {} ; epochs {got} of {want:.0}",
        ch["final_state"]
    );
    assert_eq!(ch["final_state"], "LOCKED", "G3: {ch}");
    assert!(got >= 0.99 * want, "G3: {got} epochs of {want:.0}");

    // G4.
    let mut last_epoch = None;
    let mut last_sample = 0u64;
    let mut count = 0u64;
    let r = BinaryEpochReader::new(BufReader::new(std::fs::File::open(&epochs).unwrap())).unwrap();
    for rec in r {
        let rec = rec.unwrap();
        if let Some(prev) = last_epoch {
            assert!(rec.epoch > prev, "G4: epochs not increasing");
        }
        last_epoch = Some(rec.epoch);
        last_sample = rec.sample_index;
        count += 1;
    }
    assert_eq!(count as f64, got, "G4: the file holds every epoch");
    assert!(
        n.abs_diff(last_sample) <= (FS / 1000.0) as u64 * 2,
        "G4: last sample {last_sample} of {n}"
    );
}
