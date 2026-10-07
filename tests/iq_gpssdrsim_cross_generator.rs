// SPDX-License-Identifier: AGPL-3.0-only
//! The GNSS IQ layer against gps-sdr-sim, an independent GPS L1 C/A baseband generator: the
//! signal geometry the scene generator (`kshana::iq::scene`) puts into a broadcast-ephemeris
//! scene, and what the acquisition engine (`kshana::iq::acq`) finds in gps-sdr-sim's own
//! I/Q samples.
//!
//! PRE-REGISTRATION (written 2026-10-07, committed and pushed before the fixture generator
//! was run and before any Kshana value below was computed for these inputs; the engine code
//! under test, `iq::scene`, `iq::acq` and `iq::io::decode_samples`, is the released 0.32.0
//! code, unchanged by this commit).
//!
//! ORACLE (Library kind of docs/VALIDATION.md): gps-sdr-sim by Takuji Ebinuma, MIT licence,
//! <https://github.com/osqzss/gps-sdr-sim>, commit 28ca29a6719475195e3aabd5930c4ed02d67190f
//! (2025-01-07), built with its own Makefile and run as a separate program by
//! `scripts/gen_iq_gpssdrsim_ref.sh`. Two outputs of it are used:
//! * the program itself, static mode at the location its usage text gives as the example
//!   (`-l 35.681298,139.766247,10.0`), on its bundled `brdc0010.22n` (RINEX 2, 1 January
//!   2022), no start time (the scenario starts at the first time of clock in the file,
//!   GPS week 2190, 518 400 s), ionosphere off (`-i`), 8-bit I/Q at 2.6 MHz (`-b 8`); the
//!   first 20 ms of its samples (`gpssdrsim_first20ms.ci8`) and the channel listing it prints
//!   (`gpssdrsim_stderr.txt`) are committed;
//! * `tests/fixtures/iq_gpssdrsim_cross_generator/harness.c`, a separate program linked
//!   against the same source compiled with the same flags, which repeats the program's channel
//!   set-up with gps-sdr-sim's own `readRinexNavAll`, `llh2xyz`, `allocateChannel`,
//!   `computeRange` and `computeCodePhase` and prints the state behind the first block of
//!   samples (`harness_output.json`): for every channel, the pseudorange, geometric range and
//!   look angles at the start, the carrier frequency `f_carr` of the first 0.1 s block (the
//!   pseudorange change over that block, `-dP/dt / lambda`), its code frequency and the code
//!   phase at the first sample. The ephemeris values gps-sdr-sim parsed are printed with 17
//!   significant digits and Kshana builds its `RinexEphemeris` from exactly those, so RINEX 2
//!   parsing (which `rinex::parse_nav` does not do) is not part of the comparison.
//!
//! QUANTITIES AND BARS (all fixed here, before the run):
//! (0) Consistency of the harness with the program: the set of PRNs the program lists equals
//!     the harness's channel set, and for each the printed azimuth and elevation (0.1 degree)
//!     and geometric range (0.1 m) equal the harness values printed the same way. Exact.
//! (A) Scene geometry. A Kshana scene (`SceneConfig`: 2.6 MHz, start of week time 518 400 s,
//!     static receiver at gps-sdr-sim's `xyz`, perfect clock, elevation mask 0 degrees) with
//!     one `SceneSatellite::gps_l1ca_broadcast` per valid satellite of gps-sdr-sim's first
//!     ephemeris set; its truth records (`TruthRecord`) are compared per channel:
//!     (A1) visibility: the PRNs the truth marks visible at t = 0 equal gps-sdr-sim's channel
//!          set, excepting only a satellite whose gps-sdr-sim elevation is within 0.01 degree
//!          of the horizon;
//!     (A2) pseudorange at t = 0 against `rho0.range`: |difference| <= 0.05 m;
//!     (A3) code phase at t = 0 against `code_phase` (chips, modulo 1023): <= 2e-4 chip;
//!     (A4) Doppler at t = 0.05 s (the middle of gps-sdr-sim's first block, whose `f_carr` is
//!          the mean over it) against `f_carr`: <= 0.02 Hz;
//!     (A5) elevation and azimuth at t = 0 against `rho0.azel` (light-time corrected):
//!          <= 1e-4 degree each.
//! (B) Acquisition on gps-sdr-sim's samples: the committed bytes decoded as `ci8` by
//!     `iq::io::decode_samples`, searched by `iq::acq::acquire` with `GpsL1Ca` for every PRN
//!     1 to 32, coherent 1 ms, 10 blocks non-coherent, Doppler -5000 to +5000 Hz in 125 Hz
//!     steps, false-alarm probability 1e-3 over the grid, in each of two windows (0 to 10 ms
//!     and 10 to 20 ms):
//!     (B1) every PRN in gps-sdr-sim's channel set is declared acquired;
//!     (B2) no PRN outside it is declared acquired;
//!     (B3) the acquired code phase is within 0.5 chip (circular) of gps-sdr-sim's, carried to
//!          the window start at its code frequency, `code_phase + f_code * t` modulo 1023;
//!     (B4) the acquired Doppler is within 125 Hz (one bin step) of `f_carr`.
//! Non-vacuity: at least 6 channels.
//!
//! RESULT (added after the run of 2026-10-07 on 7777da53 with the fixture of e6c0a48c; the
//! registration above is unchanged from 7777da53). (0) holds. (A) holds on all 11 channels:
//! worst pseudorange 1.6e-3 m, code phase 5.5e-6 chip, Doppler 7.4e-5 Hz, elevation and
//! azimuth 4e-9 degree. (B1), (B3) and (B4) hold in both windows (code phase within 0.195
//! chip, Doppler within 72 Hz), but (B2) fails: all 21 PRNs gps-sdr-sim did not simulate are
//! declared acquired in both windows. The strict (B) test is kept, ignored with the finding;
//! `acquisition_threshold_is_crossed_on_gps_sdr_sim_noise_free_samples` pins it.
//!
//! NOT COMPARED, AND WHY. The samples are not compared sample for sample with a Kshana scene:
//! gps-sdr-sim synthesises the carrier from a 512-entry integer sine table, scales each
//! satellite by an integer gain from its own path-loss and antenna-pattern model, starts every
//! carrier at phase zero, sends LNAV words whose computed fields it truncates (the finding of
//! tests/gps_l1ca_gpssdrsim_cross_generator.rs) and adds no noise. None of those are quantities
//! a receiver test needs to agree on, and a bit-exact I/Q bar would test them, not the signal
//! geometry. The comparison is therefore at the observables a receiver measures: which
//! satellites are present, their code phase, Doppler and pseudorange. The chip sign convention
//! also differs (gps-sdr-sim maps chip 1 to +1, Kshana to -1), a sign the square-law detector
//! does not see.
//!
//! DISCLOSURE. Before writing this, gps-sdr-sim's `computeRange`, `computeCodePhase`,
//! `allocateChannel`, `satpos` (its clock line), the start-time and set-selection code of
//! `main()` and its sample loop were read, to write the harness and to choose quantities a
//! receiver observes. From that reading the expected pseudorange agreement is a few
//! millimetres (gps-sdr-sim extrapolates the satellite back over the flight time to first
//! order and evaluates the satellite clock at the receive time; Kshana iterates the light time
//! and evaluates the clock at the transmit time); the 0.05 m bar is set an order above that.

use kshana::iq::acq::{acquire, AcqConfig};
use kshana::iq::io::{decode_samples, SampleFormat};
use kshana::iq::scene::{GpsL1Ca, Scene, SceneConfig, SceneSatellite, Trajectory, TruthRecord};
use kshana::iq::{SampleSpec, VecSink};
use kshana::rinex::{EpochUtc, RinexEphemeris};
use kshana::sdr::L1_HZ;
use serde_json::Value;
use std::collections::BTreeSet;

const DIR: &str = concat!(
    env!("CARGO_MANIFEST_DIR"),
    "/tests/fixtures/iq_gpssdrsim_cross_generator/"
);
const FS: f64 = 2.6e6;
const SPMS: usize = 2600; // samples per millisecond
const CA_LEN: f64 = 1023.0;

fn harness() -> Value {
    let text =
        std::fs::read_to_string(format!("{DIR}harness_output.json")).expect("harness output");
    serde_json::from_str(&text).expect("JSON")
}

fn num(v: &Value, k: &str) -> f64 {
    v[k].as_f64().unwrap_or_else(|| panic!("field {k}"))
}

fn spec() -> SampleSpec {
    SampleSpec {
        fs_hz: FS,
        center_hz: L1_HZ,
        if_hz: 0.0,
    }
}

/// gps-sdr-sim's parsed ephemeris as a Kshana `RinexEphemeris`.
fn ephemeris(s: &Value) -> RinexEphemeris {
    let t = s["toc_ymdhms"].as_array().expect("toc");
    RinexEphemeris {
        system: 'G',
        prn: num(s, "prn") as u8,
        toc: EpochUtc {
            year: t[0].as_i64().unwrap() as i32,
            month: t[1].as_u64().unwrap() as u32,
            day: t[2].as_u64().unwrap() as u32,
            hour: t[3].as_u64().unwrap() as u32,
            minute: t[4].as_u64().unwrap() as u32,
            second: t[5].as_f64().unwrap(),
        },
        af0: num(s, "af0"),
        af1: num(s, "af1"),
        af2: num(s, "af2"),
        iode: num(s, "iode"),
        crs: num(s, "crs"),
        delta_n: num(s, "deltan"),
        m0: num(s, "m0"),
        cuc: num(s, "cuc"),
        e: num(s, "ecc"),
        cus: num(s, "cus"),
        sqrt_a: num(s, "sqrta"),
        toe: num(s, "toe_sec"),
        cic: num(s, "cic"),
        omega0: num(s, "omg0"),
        cis: num(s, "cis"),
        i0: num(s, "inc0"),
        crc: num(s, "crc"),
        omega: num(s, "aop"),
        omega_dot: num(s, "omgdot"),
        idot: num(s, "idot"),
        data_sources: 0.0,
        gps_week: num(s, "toe_week"),
        sv_accuracy: 0.0,
        sv_health: num(s, "svhlth"),
        tgd: num(s, "tgd"),
        iodc: num(s, "iodc"),
        trans_time: 0.0,
    }
}

/// gps-sdr-sim's channels, by PRN.
fn channels(h: &Value) -> Vec<&Value> {
    let c: Vec<&Value> = h["chans"].as_array().expect("chans").iter().collect();
    assert!(c.len() >= 6, "only {} channels", c.len());
    c
}

fn circ(a: f64, b: f64, period: f64) -> f64 {
    let d = (a - b).rem_euclid(period);
    d.min(period - d)
}

/// (0) The harness reproduces the channel listing the gps-sdr-sim program printed.
#[test]
fn harness_reproduces_the_gps_sdr_sim_program_channel_listing() {
    let h = harness();
    let log = std::fs::read_to_string(format!("{DIR}gpssdrsim_stderr.txt")).expect("log");
    // The program prints "%02d %6.1f %5.1f %11.1f %5.1f" (PRN, az, el, range, iono) per
    // channel right after allocation.
    let listed: Vec<String> = log
        .lines()
        .filter(|l| {
            let f: Vec<&str> = l.split_whitespace().collect();
            f.len() == 5 && f[0].len() == 2 && f[0].chars().all(|c| c.is_ascii_digit())
        })
        .map(|l| l.trim_end().to_string())
        .collect();
    let r2d = 57.2957795131; // gps-sdr-sim's R2D
    let ours: Vec<String> = channels(&h)
        .iter()
        .map(|c| {
            format!(
                "{:02} {:6.1} {:5.1} {:11.1} {:5.1}",
                num(c, "prn") as u32,
                num(c, "alloc_az_rad") * r2d,
                num(c, "alloc_el_rad") * r2d,
                num(c, "rho0_d"),
                num(c, "rho0_iono"),
            )
        })
        .collect();
    assert_eq!(listed, ours);
}

/// (A) The scene generator's truth against gps-sdr-sim's channel state.
#[test]
fn scene_geometry_matches_gps_sdr_sim_channels() {
    let h = harness();
    let xyz: Vec<f64> = h["xyz"]
        .as_array()
        .unwrap()
        .iter()
        .map(|v| v.as_f64().unwrap())
        .collect();
    let mut cfg = SceneConfig::new(spec(), 0.051);
    cfg.start_tow_s = num(&h, "g0_sec");
    cfg.receiver = Trajectory::Static([xyz[0], xyz[1], xyz[2]]);
    cfg.elevation_mask_deg = 0.0;
    cfg.truth_interval_s = 0.05;
    let mut scene = Scene::new(cfg).unwrap();
    for s in h["sats"].as_array().unwrap() {
        scene.add_satellite(
            SceneSatellite::gps_l1ca_broadcast(&ephemeris(s), None, Default::default()).unwrap(),
        );
    }
    let mut truth: Vec<TruthRecord> = Vec::new();
    scene.generate(&mut VecSink::default(), &mut truth).unwrap();
    let at = |t: f64, prn: u32| {
        *truth
            .iter()
            .find(|r| (r.t_s - t).abs() < 1e-9 && r.sat_id == prn)
            .unwrap_or_else(|| panic!("no truth for PRN {prn} at {t}"))
    };

    let chans = channels(&h);
    let theirs: BTreeSet<u32> = chans.iter().map(|c| num(c, "prn") as u32).collect();
    let ours: BTreeSet<u32> = truth
        .iter()
        .filter(|r| r.t_s == 0.0 && r.visible)
        .map(|r| r.sat_id)
        .collect();
    let r2d = 180.0 / std::f64::consts::PI;
    for prn in theirs.symmetric_difference(&ours) {
        let near_horizon = chans
            .iter()
            .find(|c| num(c, "prn") as u32 == *prn)
            .is_some_and(|c| (num(c, "rho0_el_rad") * r2d).abs() < 0.01);
        assert!(near_horizon, "(A1) PRN {prn} visible to one generator only");
    }

    let (mut w_p, mut w_cp, mut w_d, mut w_el, mut w_az) = (0.0f64, 0.0f64, 0.0f64, 0.0f64, 0.0f64);
    for c in &chans {
        let prn = num(c, "prn") as u32;
        let r0 = at(0.0, prn);
        let r1 = at(0.05, prn);
        let dp = (r0.pseudorange_m - num(c, "rho0_range")).abs();
        let dcp = circ(r0.code_phase_chips, num(c, "code_phase"), CA_LEN);
        let dd = (r1.doppler_hz - num(c, "f_carr")).abs();
        let del = (r0.elevation_deg - num(c, "rho0_el_rad") * r2d).abs();
        let daz = circ(r0.azimuth_deg, num(c, "rho0_az_rad") * r2d, 360.0);
        eprintln!(
            "PRN {prn:2}: dP {dp:.2e} m, dcode {dcp:.2e} chip, dDoppler {dd:.2e} Hz, del {del:.2e} deg, daz {daz:.2e} deg"
        );
        w_p = w_p.max(dp);
        w_cp = w_cp.max(dcp);
        w_d = w_d.max(dd);
        w_el = w_el.max(del);
        w_az = w_az.max(daz);
    }
    eprintln!(
        "worst: pseudorange {w_p:.3e} m, code phase {w_cp:.3e} chip, Doppler {w_d:.3e} Hz, elevation {w_el:.3e} deg, azimuth {w_az:.3e} deg ({} channels)",
        chans.len()
    );
    assert!(w_p <= 0.05, "(A2) pseudorange {w_p} m");
    assert!(w_cp <= 2e-4, "(A3) code phase {w_cp} chip");
    assert!(w_d <= 0.02, "(A4) Doppler {w_d} Hz");
    assert!(
        w_el <= 1e-4 && w_az <= 1e-4,
        "(A5) look angles {w_el} / {w_az} deg"
    );
}

/// One search of the registered design (B): PRN, window, and what `iq::acq` returned.
struct Search {
    prn: u8,
    window: usize,
    acquired: bool,
    statistic: f64,
    threshold: f64,
    /// Circular code phase error against gps-sdr-sim (chips); `None` for a PRN it did not
    /// simulate.
    dcode: Option<f64>,
    /// Doppler error against gps-sdr-sim's `f_carr` (Hz); `None` likewise.
    ddoppler: Option<f64>,
}

/// Run design (B): every PRN 1 to 32 in both 10 ms windows. The 64 searches are independent
/// and spread over the available threads.
fn searches(h: &Value) -> Vec<Search> {
    let bytes = std::fs::read(format!("{DIR}gpssdrsim_first20ms.ci8")).expect("samples");
    let samples = decode_samples(SampleFormat::CI8, &bytes, 1.0);
    assert_eq!(samples.len(), 20 * SPMS);
    let chans = channels(h);
    let cfg = AcqConfig {
        coherent_periods: 1,
        noncoherent: 10,
        doppler_max_hz: 5000.0,
        doppler_step_hz: 125.0,
        pfa: 1e-3,
    };
    let jobs: Vec<(usize, u8)> = (0..2)
        .flat_map(|w| (1..=32u8).map(move |p| (w, p)))
        .collect();
    let threads = std::thread::available_parallelism().map_or(1, |n| n.get());
    let next = std::sync::atomic::AtomicUsize::new(0);
    let mut out: Vec<Search> = std::thread::scope(|sc| {
        let handles: Vec<_> = (0..threads)
            .map(|_| {
                sc.spawn(|| {
                    let mut mine = Vec::new();
                    loop {
                        let k = next.fetch_add(1, std::sync::atomic::Ordering::Relaxed);
                        let Some(&(window, prn)) = jobs.get(k) else {
                            break;
                        };
                        let start = window * 10 * SPMS;
                        let t0 = start as f64 / FS;
                        let code = GpsL1Ca::new(prn).unwrap();
                        let r = acquire(&samples[start..], &spec(), &code, &cfg)
                            .unwrap()
                            .result;
                        let chan = chans.iter().find(|c| num(c, "prn") as u8 == prn);
                        let (dcode, ddoppler) = match chan {
                            Some(c) => {
                                let want = (num(c, "code_phase") + num(c, "f_code") * t0)
                                    .rem_euclid(CA_LEN);
                                (
                                    Some(circ(r.code_phase_chips, want, CA_LEN)),
                                    Some((r.doppler_hz - num(c, "f_carr")).abs()),
                                )
                            }
                            None => (None, None),
                        };
                        mine.push(Search {
                            prn,
                            window,
                            acquired: r.acquired,
                            statistic: r.statistic,
                            threshold: r.threshold,
                            dcode,
                            ddoppler,
                        });
                    }
                    mine
                })
            })
            .collect();
        handles
            .into_iter()
            .flat_map(|h| h.join().unwrap())
            .collect()
    });
    out.sort_by_key(|s| (s.window, s.prn));
    for s in &out {
        match (s.dcode, s.ddoppler) {
            (Some(dc), Some(dd)) => eprintln!(
                "window {} PRN {:2}: simulated, acquired {} (stat {:.1} / thr {:.1}), dcode {dc:.3} chip, dDoppler {dd:.1} Hz",
                s.window, s.prn, s.acquired, s.statistic, s.threshold
            ),
            _ => eprintln!(
                "window {} PRN {:2}: not simulated, acquired {} (stat {:.1} / thr {:.1})",
                s.window, s.prn, s.acquired, s.statistic, s.threshold
            ),
        }
    }
    out
}

/// (B) Acquisition of gps-sdr-sim's own samples, at the registered bars.
#[test]
#[ignore = "FINDING (run 2026-10-07 on 7777da53 + fixture e6c0a48c): (B1) all 11 simulated PRNs acquired in both windows, (B3) code phase within 0.195 chip, (B4) Doppler within 72 Hz, but (B2) every one of the 21 PRNs gps-sdr-sim did not simulate is also declared acquired in both windows (statistic 151 to 206 against the threshold 79.5): the noise-free input has no thermal noise, so the other satellites' cross-correlation is what the Gaussian-noise threshold sees; pinned by acquisition_threshold_is_crossed_on_gps_sdr_sim_noise_free_samples"]
fn acquisition_finds_gps_sdr_sim_satellites_in_its_samples() {
    let h = harness();
    let n_chans = channels(&h).len();
    let runs = searches(&h);
    for w in 0..2 {
        let mut found = 0;
        for s in runs.iter().filter(|s| s.window == w) {
            match (s.dcode, s.ddoppler) {
                (Some(dc), Some(dd)) => {
                    assert!(s.acquired, "(B1) PRN {} not acquired in window {w}", s.prn);
                    assert!(dc <= 0.5, "(B3) PRN {} code phase off by {dc} chip", s.prn);
                    assert!(dd <= 125.0, "(B4) PRN {} Doppler off by {dd} Hz", s.prn);
                    found += 1;
                }
                _ => assert!(
                    !s.acquired,
                    "(B2) PRN {} acquired in window {w} but not simulated",
                    s.prn
                ),
            }
        }
        assert_eq!(found, n_chans);
    }
}

/// The finding of the strict test, pinned on the committed oracle output. (B1), (B3) and (B4)
/// hold at the registered bars in both windows. (B2) does not: every PRN gps-sdr-sim did not
/// simulate crosses the detector threshold. That threshold is set for a cell that holds
/// Gaussian noise of the measured sample power (`iq::acq`, chi-square with 2M degrees of
/// freedom); gps-sdr-sim adds no noise, so the sample power is the eleven signals themselves
/// and the cells of an absent PRN hold their cross-correlation, which is not chi-square. The
/// separation between the two populations is recorded too (observed, not a registered bar):
/// the largest absent-PRN statistic stays below a fifth of the smallest simulated one.
#[test]
fn acquisition_threshold_is_crossed_on_gps_sdr_sim_noise_free_samples() {
    let h = harness();
    let n_chans = channels(&h).len();
    assert_eq!(n_chans, 11);
    let runs = searches(&h);
    assert_eq!(runs.len(), 64);
    let (present, absent): (Vec<&Search>, Vec<&Search>) =
        runs.iter().partition(|s| s.dcode.is_some());
    assert_eq!(present.len(), 2 * n_chans);
    for s in &present {
        assert!(s.acquired, "PRN {} window {}", s.prn, s.window);
        assert!(s.dcode.unwrap() <= 0.5 && s.ddoppler.unwrap() <= 125.0);
    }
    // The finding as recorded: all 42 absent searches cross the threshold.
    assert_eq!(absent.iter().filter(|s| s.acquired).count(), 42);
    let absent_max = absent.iter().map(|s| s.statistic).fold(0.0, f64::max);
    let present_min = present
        .iter()
        .map(|s| s.statistic)
        .fold(f64::INFINITY, f64::min);
    let threshold = runs[0].threshold;
    eprintln!(
        "threshold {threshold:.1}; absent PRNs up to {absent_max:.1}; simulated PRNs from {present_min:.1}"
    );
    assert!(runs.iter().all(|s| s.threshold == threshold));
    assert!(absent_max < 0.2 * present_min);
}
