// SPDX-License-Identifier: AGPL-3.0-only
//! SDR front-end diagnostics (`kshana iq diagnose`, `src/iq/frontdiag.rs`) and the GNSS-SDR
//! configuration generator (`kshana iq gnss-sdr-conf`) on self-made fixtures, each with one known
//! front-end fault injected: the oscillator off by 10 ppm with the sample clock on the same
//! reference (an offset, no mismatch), the sample clock 20 ppm fast against an exact oscillator
//! (a mismatch), and one sample in eight written twice (the repeat pattern a recorder bug leaves).
//! Self-derived: the fixtures come from the test's own signal model, not from a real faulty radio.

use kshana::iq::acq::AcqConfig;
use kshana::iq::cli::build_code;
use kshana::iq::frontdiag::{diagnose, DiagConfig, FrontendDiagnosis};
use kshana::iq::io::format::SampleFormat;
use kshana::iq::{Cf64, SampleSpec, SpreadingCode, VecSource};
use std::process::Command;
use std::sync::atomic::{AtomicU64, Ordering};

const FS: f64 = 2.046e6;
const FC: f64 = 1_575_420_000.0;
const CHIP: f64 = 1.023e6;

/// GPS L1 C/A satellites `(prn, doppler, code phase)` seen through a front end whose oscillator is
/// off by `lo_ppm` (with the sample clock on the same reference) and whose sample clock is
/// additionally fast by `adc_ppm` against the oscillator; `seconds` of 8-bit-scale samples.
fn fixture(sats: &[(i64, f64, f64)], lo_ppm: f64, adc_ppm: f64, seconds: f64) -> Vec<Cf64> {
    let n = (seconds * FS) as usize;
    let mut out = vec![Cf64::new(0.0, 0.0); n];
    let (eps, delta) = (lo_ppm * 1e-6, adc_ppm * 1e-6);
    for &(prn, fd, phase) in sats {
        let code = build_code("gps-l1ca", prn).unwrap();
        // Common reference: the carrier moves by −ε·fc and the code rate by −ε. A fast sample clock
        // stretches both by (1 − δ); the carrier's change is negligible, the code's is not.
        let f_app = (fd - eps * FC) * (1.0 - delta);
        let r_app = CHIP * (1.0 + fd / FC - eps) * (1.0 - delta);
        for (k, s) in out.iter_mut().enumerate() {
            let t = k as f64 / FS;
            let c = code.value_at(phase + r_app * t) * 20.0;
            let (sn, cs) = (std::f64::consts::TAU * (f_app * t).fract()).sin_cos();
            *s = Cf64::new(s.re + c * cs, s.im + c * sn);
        }
    }
    // deterministic noise and 8-bit rounding
    let mut x = 0x9E37_79B9_7F4A_7C15u64;
    for s in &mut out {
        x ^= x << 13;
        x ^= x >> 7;
        x ^= x << 17;
        let a = ((x >> 40) % 21) as f64 - 10.0;
        let b = ((x >> 20) % 21) as f64 - 10.0;
        *s = Cf64::new((s.re + a).round(), (s.im + b).round());
    }
    out
}

fn spec() -> SampleSpec {
    SampleSpec {
        fs_hz: FS,
        center_hz: FC,
        if_hz: 0.0,
    }
}

fn acq() -> AcqConfig {
    AcqConfig {
        coherent_periods: 1,
        noncoherent: 2,
        doppler_max_hz: 20_000.0,
        doppler_step_hz: 500.0,
        pfa: 1e-3,
    }
}

const SATS: [(i64, f64, f64); 3] = [
    (3, 1200.0, 100.5),
    (11, -2300.0, 700.25),
    (19, 3100.0, 400.0),
];

fn run(samples: Vec<Cf64>) -> FrontendDiagnosis {
    let codes: Vec<_> = SATS
        .iter()
        .map(|s| build_code("gps-l1ca", s.0).unwrap())
        .collect();
    let refs: Vec<&dyn SpreadingCode> = codes.iter().map(|c| c as &dyn SpreadingCode).collect();
    let cfg = DiagConfig {
        step_s: 0.15,
        steps: 8,
        ..DiagConfig::default()
    };
    let mut src = VecSource::new(spec(), samples);
    diagnose(&mut src, SampleFormat::CI8, &refs, &acq(), &cfg).unwrap()
}

fn codes(d: &FrontendDiagnosis) -> Vec<&str> {
    d.findings.iter().map(|f| f.code.as_str()).collect()
}

#[test]
fn an_oscillator_offset_on_a_common_reference_is_an_offset_not_a_mismatch() {
    let d = run(fixture(&SATS, 10.0, 0.0, 1.25));
    let c = d.clock.as_ref().unwrap();
    assert!(c.codes.iter().all(|x| x.acquired), "{c:?}");
    // −10 ppm of L1 is −15 754 Hz; satellites within ±5 kHz put it in the interval.
    let [lo, hi] = c.offset_interval_hz.unwrap();
    assert!(
        lo <= -15_754.2 + 300.0 && hi >= -15_754.2 - 300.0,
        "{lo} {hi}"
    );
    assert!(hi < 0.0);
    assert!(codes(&d).contains(&"oscillator-offset"), "{:?}", codes(&d));
    let m = c.mismatch_ppm.unwrap();
    assert!(m.abs() < 1.0, "mismatch {m} ppm");
    assert!(!codes(&d).contains(&"clock-mismatch"));
}

#[test]
fn a_sample_clock_fast_against_the_oscillator_is_a_mismatch() {
    let d = run(fixture(&SATS, 0.0, 20.0, 1.25));
    let c = d.clock.as_ref().unwrap();
    let m = c.mismatch_ppm.unwrap();
    assert!((m + 20.0).abs() < 2.0, "mismatch {m} ppm, {c:?}");
    assert!(codes(&d).contains(&"clock-mismatch"));
    // the Dopplers are the satellites' own: the interval holds zero, no offset reported
    assert!(!codes(&d).contains(&"oscillator-offset"));
}

#[test]
fn one_sample_in_eight_written_twice_is_reported_with_its_period() {
    let clean = fixture(&SATS[..1], 0.0, 0.0, 0.2);
    let mut s = Vec::new();
    for (k, c) in clean.into_iter().enumerate() {
        s.push(c);
        if k % 8 == 7 {
            s.push(c);
        }
    }
    let mut src = VecSource::new(spec(), s);
    let d = diagnose(
        &mut src,
        SampleFormat::CI8,
        &[],
        &acq(),
        &DiagConfig::default(),
    )
    .unwrap();
    assert!(codes(&d).contains(&"repeated-samples"));
    assert_eq!(d.repeats.period, Some(9));
    assert!(d.clock.is_none());
}

static SEQ: AtomicU64 = AtomicU64::new(0);

#[test]
fn the_cli_diagnoses_a_raw_file_and_writes_a_gnss_sdr_configuration() {
    let dir = std::env::temp_dir().join(format!(
        "kshana-frontdiag-{}-{}",
        std::process::id(),
        SEQ.fetch_add(1, Ordering::Relaxed)
    ));
    std::fs::create_dir_all(&dir).unwrap();
    // PATH-UNIQUE-WAIVER: inside a directory that is already unique per call.
    let data = dir.join("capture.bin");
    let bytes: Vec<u8> = fixture(&SATS[..1], 0.0, 0.0, 0.05)
        .iter()
        .flat_map(|c| [c.re as i8 as u8, c.im as i8 as u8])
        .collect();
    std::fs::write(&data, bytes).unwrap();
    std::fs::write(
        dir.join("capture.bin.toml"),
        "format = \"ci8\"\nsample_rate_hz = 2046000.0\ncenter_hz = 1575420000.0\n",
    )
    .unwrap();
    let out = Command::new(env!("CARGO_BIN_EXE_kshana"))
        .args(["iq", "diagnose"])
        .arg(&data)
        .output()
        .unwrap();
    assert!(
        out.status.success(),
        "{}",
        String::from_utf8_lossy(&out.stderr)
    );
    let v: serde_json::Value = serde_json::from_slice(&out.stdout).unwrap();
    assert_eq!(v["evidence"], "MODELLED");
    assert_eq!(v["n_samples"], 102_300);
    let conf = dir.join("run.conf");
    let out = Command::new(env!("CARGO_BIN_EXE_kshana"))
        .args(["iq", "gnss-sdr-conf"])
        .arg(&data)
        .args(["--signal", "gps-l1ca:6", "--profile", "narrowband", "--out"])
        .arg(&conf)
        .output()
        .unwrap();
    assert!(
        out.status.success(),
        "{}",
        String::from_utf8_lossy(&out.stderr)
    );
    let text = std::fs::read_to_string(&conf).unwrap();
    assert!(text.contains("SignalSource.item_type=ibyte\n"));
    assert!(text.contains("DataTypeAdapter.implementation=Ibyte_To_Complex\n"));
    assert!(text.contains("Channels_1C.count=6\n"));
    assert!(text.contains("Tracking_1C.extend_correlation_symbols=20\n"));
    assert!(text.contains("SignalSource.sampling_frequency=2046000\n"));
    // a format GNSS-SDR's file source does not read is refused with exit code 1
    let out = Command::new(env!("CARGO_BIN_EXE_kshana"))
        .args(["iq", "gnss-sdr-conf"])
        .arg(&data)
        .args(["--format", "cu8", "--rate", "2046000"])
        .output()
        .unwrap();
    assert_eq!(out.status.code(), Some(1));
    std::fs::remove_dir_all(&dir).ok();
}
