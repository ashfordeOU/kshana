// SPDX-License-Identifier: AGPL-3.0-only
//! Acquisition and carrier-to-noise density (C/N0) estimation on real lunar IQ: the LuGRE
//! (Lunar GNSS Receiver Experiment) L1 sample snapshots recorded on Firefly's Blue Ghost
//! Mission 1 in 2025, against GNSS-SDR on the same samples and against the flight receiver's
//! own C/N0.
//!
//! PRE-REGISTRATION (written 2026-10-02, before the LuGRE dataset was downloaded or opened and
//! before GNSS-SDR was run on anything; the engine, `kshana::acquisition` and
//! `kshana::realdata::ion_sdr`, was committed beforehand with unit tests on synthetic signals
//! and hand-packed bytes only).
//!
//! DATA. LuGRE Mission Data, Zenodo record 16411687 (doi 10.5281/zenodo.16411687), file
//! `LuGRE.zip`, CC BY 4.0, Parker et al.; described by NAVIGATION doi 10.33012/navi.756. The
//! L1/E1 IQ snapshots (4-bit, 8 Msps per the dataset description) of the commissioning, transit
//! and lunar-orbit phases. HELD OUT, never opened by this package: every snapshot whose start
//! time is at or after 2025-03-02T08:00:00Z (the landing on 2 March 2025 was about 08:34 UTC),
//! i.e. the whole surface phase. The L5/E5 snapshots are out of scope (the search here is GPS
//! L1 C/A, coarse/acquisition, only).
//!
//! PART 1, ACQUISITION. ORACLE (Library kind): GNSS-SDR 0.0.19, GPL-3.0, the Ubuntu 24.04
//! package 0.0.19-1build3, run as a separate program, never linked or ported. GNSS-SDR 0.0.19
//! has no ION (Institute of Navigation) metadata reader, so each snapshot reaches it as
//! interleaved signed 8-bit IQ written by the converter in `xval/gnss-sdr-lugre/` (Python and
//! numpy, written from the metadata standard, independent of Kshana's reader); the integer
//! levels pass unchanged, and this test checks Kshana's decoded integers against that file on
//! every span it compares (criterion A0). Configuration: `xval/gnss-sdr-lugre/acq_L1.conf.template`,
//! pinned here: `GPS_L1_CA_PCPS_Acquisition`, coherent integration 1 ms, `max_dwells` 50,
//! `pfa` 0.001, CFAR (constant false-alarm rate) statistic on, Doppler −50 000 to +50 000 Hz
//! in 500 Hz steps, no bit-transition mode, no two-step search, blocking, one channel per run
//! with `Channel0.satellite` set to the PRN (pseudorandom noise number), PRN 1 to 32 on every
//! snapshot, acquisition dump on. The first acquisition record (dump file) per PRN per snapshot
//! is the comparison case. If the metadata gives a non-zero translated frequency, Kshana takes
//! it as `if_hz` and GNSS-SDR's input filter becomes `Freq_Xlating_Fir_Filter` at that
//! frequency, a disclosed difference.
//!
//! KSHANA on each case: `pcps_acquire` on the record's samples, the `num_dwells` code periods
//! ending at the record's `sample_counter`, with coherent 1 ms, `noncoherent = num_dwells`,
//! the same Doppler grid and a search-wide false-alarm probability of 0.001.
//!
//! TOLERANCES (fixed here):
//! - A1 non-vacuity: at least 20 cases GNSS-SDR declares positive, from at least 3 snapshots.
//! - A2 location: for EVERY GNSS-SDR positive, Kshana's peak Doppler within one bin (500 Hz)
//!   of GNSS-SDR's, and its code delay within `2 + |f_D| / f_L1 · f_s · T` samples, circularly
//!   modulo one code period, where `T = num_dwells` ms and `f_D` is GNSS-SDR's Doppler. The
//!   2 samples cover the two receivers' replica sampling conventions (one sample) and an
//!   adjacent-cell tie; the second term is the code drift the carrier Doppler causes during
//!   the search, over which the smeared peak is not unique (neither receiver compensates it).
//! - A3 decision: at least 95 % of GNSS-SDR positives are also Kshana positives.
//!
//! PART 2, C/N0. ORACLE (Measured kind): the flight receiver's raw GPS L1 C/A C/N0 in the
//! LuGRE raw observables, extracted by `xval/gnss-sdr-lugre/extract_flight_cn0.py` (Python,
//! independent of Kshana) into `flight_cn0.csv`. Absolute C/N0 is never the bar (Parker et al.
//! report a common loss of 7 to 12 dB they do not explain): the quantity is the DIFFERENCE of
//! C/N0 between two satellites in the same snapshot, which cancels everything common to the
//! receiver. KSHANA on each satellite that both receivers acquire in a case (A2 satisfied):
//! `refine` (±250 Hz, 50 periods), then `prompt_series` from the case's first sample to the end
//! of the snapshot (at most 2000 periods), then `cn0_m2m4` at 1 ms. FLIGHT: the flight C/N0 of
//! that PRN at the raw-observable epoch nearest the snapshot start, within ±30 s. PAIRS: every
//! unordered pair in a snapshot where both satellites have a Kshana estimate and both flight
//! C/N0 values are at least 28 dB-Hz (the selection uses the flight values only, so Kshana's
//! own noise does not select the pairs).
//! - C1 non-vacuity: at least 10 pairs from at least 3 snapshots.
//! - C2: RMS over pairs of (ΔC/N0 Kshana − ΔC/N0 flight) at most TOLERANCE_RMS_DB, and the
//!   median absolute value at most TOLERANCE_MEDIAN_DB (3.0 dB and 2.0 dB). Source of the bar:
//!   the M2M4 (second and fourth moment) estimator spread measured before this registration by
//!   a Monte Carlo of 40 synthetic draws per level on Kshana's estimator (standard deviation
//!   1.66 dB at 30 dB-Hz and 0.95 dB at 33 dB-Hz for 200 one-millisecond periods, 1.04 and
//!   0.62 dB for 400; at 27 dB-Hz the estimate fails on a quarter of draws, hence the 28 dB-Hz
//!   floor), so a pair near 30 dB-Hz carries about 1.5 to 2.4 dB of Kshana noise; with 1 dB
//!   allowed for the flight estimator and the up-to-30 s offset the root-sum-square is 1.8 to
//!   2.6 dB, and the bar is set above that at 3.0 dB RMS, with the median of the absolute
//!   residual at 2.0 dB (about the median of a zero-mean normal of 2.6 dB spread, 1.75 dB).
//!
//! DEVIATIONS, recorded after the data were downloaded and before anything was run: OP5 and
//! OP12 are excluded, their `.sdrx` metadata contradicting the binary header the receiver
//! interface control document defines (OP5: metadata 4-bit, header 8-bit with 1 601 536 samples;
//! OP12: metadata 8 MHz, header 4 Msps); nine snapshots remain. The flight C/N0 extraction
//! window is 120 s, wider than the registered 30 s, so that the fixture shows how far the
//! nearest flight epoch is; the test still applies 30 s.
//!
//! REPORTED, NOT GATING: Kshana positives GNSS-SDR calls negative; the grid C/N0
//! (`cn0_from_grid`); the flight receiver's acquisition records where contemporaneous.
//!
//! DATA GATE: the snapshots are not committed (each is megabytes). The test reads them from
//! `KSHANA_LUGRE_DIR` (default `~/Code/kshana-oracles/data/lugre/LuGRE`, where
//! `xval/oracles/setup.sh` unpacks the Zenodo file) and says so when it skips.

use kshana::acquisition::{cn0_m2m4, pcps_acquire, prompt_series, refine, PcpsConfig};
use kshana::realdata::ion_sdr::{decode, parse_sdrx, SdrLayout};
use kshana::sdr::{CaCode, Cf64, L1_HZ};
use serde_json::Value;
use std::collections::BTreeMap;
use std::path::PathBuf;

const FIX: &str = concat!(
    env!("CARGO_MANIFEST_DIR"),
    "/tests/fixtures/lugre_acquisition_gnss_sdr"
);
const TOLERANCE_RMS_DB: f64 = 3.0;
const TOLERANCE_MEDIAN_DB: f64 = 2.0;

fn data_dir() -> Option<PathBuf> {
    let d = std::env::var_os("KSHANA_LUGRE_DIR")
        .map(PathBuf::from)
        .or_else(|| {
            std::env::var_os("HOME")
                .map(|h| PathBuf::from(h).join("Code/kshana-oracles/data/lugre/LuGRE"))
        })?;
    d.is_dir().then_some(d)
}

/// One snapshot opened through Kshana's reader.
struct Snapshot {
    layout: SdrLayout,
    bytes: Vec<u8>,
}

impl Snapshot {
    fn open(dir: &std::path::Path, sdrx: &str) -> Snapshot {
        let p = dir.join(sdrx);
        let text = std::fs::read_to_string(&p).unwrap_or_else(|e| panic!("{p:?}: {e}"));
        let layout = parse_sdrx(&text).unwrap_or_else(|e| panic!("{p:?}: {e}"));
        let data = p.parent().unwrap().join(&layout.url);
        let bytes = std::fs::read(&data).unwrap_or_else(|e| panic!("{data:?}: {e}"));
        Snapshot { layout, bytes }
    }
    fn len(&self) -> usize {
        self.layout.sample_count(self.bytes.len())
    }
    fn read(&self, start: usize, n: usize) -> Vec<Cf64> {
        decode(&self.layout, &self.bytes, start, n).expect("decode")
    }
}

fn circular(a: f64, b: f64, period: f64) -> f64 {
    let d = (a - b).rem_euclid(period);
    d.min(period - d)
}

struct Case {
    snapshot: String,
    start_gps_s: f64,
    prn: u8,
    sample_counter: usize,
    num_dwells: usize,
    positive: bool,
    delay: f64,
    doppler: f64,
}

fn cases() -> Vec<Case> {
    let text = std::fs::read_to_string(format!("{FIX}/gnss_sdr_records.json"))
        .expect("GNSS-SDR records fixture");
    let v: Value = serde_json::from_str(&text).expect("JSON");
    v["records"]
        .as_array()
        .expect("records")
        .iter()
        .map(|r| Case {
            snapshot: r["snapshot"].as_str().unwrap().to_string(),
            start_gps_s: r["start_gps_s"].as_f64().unwrap(),
            prn: r["prn"].as_u64().unwrap() as u8,
            sample_counter: r["sample_counter"].as_u64().unwrap() as usize,
            num_dwells: r["num_dwells"].as_u64().unwrap() as usize,
            positive: r["positive"].as_bool().unwrap(),
            delay: r["delay_samples"].as_f64().unwrap(),
            doppler: r["doppler_hz"].as_f64().unwrap(),
        })
        .collect()
}

/// Flight C/N0 records `(gps seconds, prn) -> dB-Hz`.
fn flight_cn0() -> Vec<(f64, u8, f64)> {
    let text = std::fs::read_to_string(format!("{FIX}/flight_cn0.csv")).expect("flight C/N0");
    text.lines()
        .skip(1)
        .filter(|l| !l.trim().is_empty())
        .map(|l| {
            let f: Vec<&str> = l.split(',').collect();
            (
                f[0].trim().parse().unwrap(),
                f[1].trim().parse().unwrap(),
                f[2].trim().parse().unwrap(),
            )
        })
        .collect()
}

fn config(fs: f64, if_hz: f64, dwells: usize) -> PcpsConfig {
    PcpsConfig {
        fs_hz: fs,
        if_hz,
        coherent_ms: 1,
        noncoherent: dwells,
        doppler_max_hz: 50_000.0,
        doppler_step_hz: 500.0,
        pfa: 1e-3,
    }
}

#[test]
#[ignore = "pre-registered; not yet run"]
fn acquisition_and_relative_cn0_on_lugre_iq_match_gnss_sdr_and_the_flight_receiver() {
    let Some(dir) = data_dir() else {
        eprintln!("SKIPPED: LuGRE data not found (set KSHANA_LUGRE_DIR); nothing was compared");
        return;
    };
    let cases = cases();
    let flight = flight_cn0();
    let mut open: BTreeMap<String, Snapshot> = BTreeMap::new();
    let (mut pos, mut agree, mut located, mut a2_fail) = (0usize, 0usize, 0usize, Vec::new());
    let mut pos_snapshots = std::collections::BTreeSet::new();
    let mut converter_checked = 0usize;
    // Per snapshot: (prn, Kshana C/N0) for satellites both receivers acquire.
    let mut kshana_cn0: BTreeMap<String, (f64, Vec<(u8, f64)>)> = BTreeMap::new();
    for c in &cases {
        let snap = open
            .entry(c.snapshot.clone())
            .or_insert_with(|| Snapshot::open(&dir, &c.snapshot));
        let fs = snap.layout.sample_rate_hz;
        let spc = (fs / 1000.0).round() as usize;
        let n = c.num_dwells * spc;
        let start = c.sample_counter - n;
        let x = snap.read(start, n);
        // A0: Kshana's decoded integers equal the converter's file on this span.
        let ibyte = dir.join(format!("{}.ibyte", c.snapshot));
        if let Ok(b) = std::fs::read(&ibyte) {
            for (k, s) in x.iter().enumerate() {
                let (i, q) = (b[2 * (start + k)] as i8, b[2 * (start + k) + 1] as i8);
                assert_eq!(
                    (s.re, s.im),
                    (i as f64, q as f64),
                    "{} sample {}",
                    c.snapshot,
                    start + k
                );
            }
            converter_checked += 1;
        }
        let r = pcps_acquire(
            &x,
            &CaCode::new(c.prn).unwrap(),
            &config(fs, snap.layout.translated_freq_hz, c.num_dwells),
        )
        .expect("search");
        if !c.positive {
            if r.acquired {
                eprintln!(
                    "reported: {} PRN {} Kshana positive, GNSS-SDR negative (S {:.1} vs γ {:.1})",
                    c.snapshot, c.prn, r.statistic, r.threshold
                );
            }
            continue;
        }
        pos += 1;
        pos_snapshots.insert(c.snapshot.clone());
        let tol_delay = 2.0 + c.doppler.abs() / L1_HZ * fs * c.num_dwells as f64 * 1e-3;
        let dd = circular(r.delay_samples as f64, c.delay, spc as f64);
        let df = (r.doppler_hz - c.doppler).abs();
        let ok = dd <= tol_delay && df <= 500.0;
        eprintln!(
            "{} PRN {:2}: GNSS-SDR delay {:.0} Doppler {:.0}; Kshana {} {:.0} (Δdelay {dd:.1} ≤ {tol_delay:.1}, ΔDoppler {df:.0}) acquired {}",
            c.snapshot, c.prn, c.delay, c.doppler, r.delay_samples, r.doppler_hz, r.acquired
        );
        if ok {
            located += 1;
        } else {
            a2_fail.push(format!("{} PRN {}", c.snapshot, c.prn));
        }
        if r.acquired {
            agree += 1;
        }
        if ok && r.acquired {
            let all = snap.read(start, snap.len() - start);
            let code = CaCode::new(c.prn).unwrap();
            let (fd, tau) = refine(
                &all,
                &code,
                fs,
                snap.layout.translated_freq_hz,
                &r,
                250.0,
                50,
            );
            let p = prompt_series(
                &all,
                &code,
                fs,
                snap.layout.translated_freq_hz,
                fd,
                tau,
                2000,
            );
            if let Some(e) = cn0_m2m4(&p, 1e-3) {
                eprintln!("    Kshana C/N0 {e:.2} dB-Hz over {} periods", p.len());
                kshana_cn0
                    .entry(c.snapshot.clone())
                    .or_insert((c.start_gps_s, Vec::new()))
                    .1
                    .push((c.prn, e));
            }
        }
    }
    eprintln!("A0 converter spans checked: {converter_checked}");
    eprintln!(
        "A1 GNSS-SDR positives {pos} from {} snapshots",
        pos_snapshots.len()
    );
    eprintln!("A2 located {located} of {pos}; failures {a2_fail:?}");
    eprintln!("A3 Kshana positive on {agree} of {pos}");
    // Part 2.
    let mut resid = Vec::new();
    let mut pair_snapshots = std::collections::BTreeSet::new();
    for (snap, (t0, sats)) in &kshana_cn0 {
        let fl = |prn: u8| -> Option<f64> {
            flight
                .iter()
                .filter(|(t, p, _)| *p == prn && (t - t0).abs() <= 30.0)
                .min_by(|a, b| (a.0 - t0).abs().total_cmp(&(b.0 - t0).abs()))
                .map(|r| r.2)
        };
        for i in 0..sats.len() {
            for j in i + 1..sats.len() {
                let (Some(fi), Some(fj)) = (fl(sats[i].0), fl(sats[j].0)) else {
                    continue;
                };
                if fi < 28.0 || fj < 28.0 {
                    continue;
                }
                let r = (sats[i].1 - sats[j].1) - (fi - fj);
                eprintln!(
                    "  {snap} PRN {} vs {}: Kshana Δ {:.2}, flight Δ {:.2}, residual {r:.2}",
                    sats[i].0,
                    sats[j].0,
                    sats[i].1 - sats[j].1,
                    fi - fj
                );
                resid.push(r);
                pair_snapshots.insert(snap.clone());
            }
        }
    }
    let rms = (resid.iter().map(|r| r * r).sum::<f64>() / resid.len().max(1) as f64).sqrt();
    let mut abs: Vec<f64> = resid.iter().map(|r| r.abs()).collect();
    abs.sort_by(f64::total_cmp);
    let median = if abs.is_empty() {
        f64::NAN
    } else {
        abs[abs.len() / 2]
    };
    eprintln!(
        "C1 pairs {} from {} snapshots; C2 RMS {rms:.2} dB, median |residual| {median:.2} dB",
        resid.len(),
        pair_snapshots.len()
    );
    assert!(pos >= 20 && pos_snapshots.len() >= 3, "A1 non-vacuity");
    assert!(
        a2_fail.is_empty(),
        "A2: {} positives not located",
        a2_fail.len()
    );
    assert!(agree as f64 >= 0.95 * pos as f64, "A3: {agree} of {pos}");
    assert!(
        resid.len() >= 10 && pair_snapshots.len() >= 3,
        "C1 non-vacuity"
    );
    assert!(rms <= TOLERANCE_RMS_DB, "C2 RMS {rms}");
    assert!(median <= TOLERANCE_MEDIAN_DB, "C2 median {median}");
}
