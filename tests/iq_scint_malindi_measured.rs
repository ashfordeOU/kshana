// SPDX-License-Identifier: AGPL-3.0-only
//! PRO-34: the IQ channel's Cornell scintillation model (`iq::channel::scint`) against
//! measured 50 Hz GPS L1 intensity and phase under equatorial scintillation, with the
//! processing, statistics and bars of `xval/scint-malindi/PREREGISTRATION.md` (committed at
//! b6ccb499, before any statistic of the data was computed), run by
//! [`kshana::realdata::scint50`].
//!
//! DATA (Measured oracle): Zenodo record 16941224 (doi 10.5281/zenodo.16941224; INGV, NORISK
//! project, Broglio Space Centre, Malindi, Kenya, 18 March 2023, GPS PRN 26), file
//! `data_f1.txt`, CC BY 4.0. Not vendored (66 MB): `scripts/fetch_scint_malindi.sh` fetches it
//! into `realdata-cache/scint-malindi/` and checks its SHA-256, which this test checks again.
//! The directory can be overridden with `KSHANA_SCINT_MALINDI_DIR`. Without the file the test
//! says so and compares nothing.
//!
//! The model takes S4 and τ0 from each measured window; the bars test what it generates beyond
//! those inputs: the deep-fade probability (B1), the intensity distribution (B2), the phase
//! scintillation tied to S4 (B3) and the fade duration (B4), after the non-vacuity check N1.
//! A miss is a finding, recorded in `xval/scint-malindi/RESULTS.md`; the bars are not changed.

use kshana::realdata::scint50::{compare, measured_windows, parse_log, segments, Comparison};
use sha2::{Digest, Sha256};
use std::path::PathBuf;

// PIN-SCOPE:    the bytes of the registered data file (the SHA-256 the pre-registration records).
// PIN-EXCLUDES: nothing of Kshana's output; this identifies the input only.
const SHA256: &str = "4934ab9ab9d37a14fae0f3dc15aa0e00f848a5f3738d9f46da1445db5fadc7ef";

fn data_file() -> Option<PathBuf> {
    let dir = std::env::var_os("KSHANA_SCINT_MALINDI_DIR")
        .map(PathBuf::from)
        .unwrap_or_else(|| {
            PathBuf::from(env!("CARGO_MANIFEST_DIR")).join("realdata-cache/scint-malindi")
        });
    let f = dir.join("data_f1.txt");
    f.is_file().then_some(f)
}

/// Read, check and compare; `None` when the data is absent.
fn run() -> Option<Comparison> {
    let Some(path) = data_file() else {
        eprintln!(
            "SKIPPED: Malindi data not found (run scripts/fetch_scint_malindi.sh or set \
             KSHANA_SCINT_MALINDI_DIR); nothing was compared"
        );
        return None;
    };
    let bytes = std::fs::read(&path).unwrap();
    let sha: String = Sha256::digest(&bytes)
        .iter()
        .map(|b| format!("{b:02x}"))
        .collect();
    assert_eq!(sha, SHA256, "{} is not the registered file", path.display());
    let (samples, bad) = parse_log(std::str::from_utf8(&bytes).unwrap());
    let segs = segments(&samples);
    let windows: Vec<_> = segs.iter().flat_map(|s| measured_windows(s)).collect();
    let c = compare(&windows);
    eprintln!(
        "{} samples ({} unparsed lines), {} segments, {} windows; {c:#?}",
        samples.len(),
        bad,
        segs.len(),
        windows.len()
    );
    eprintln!(
        "N1 {} | B1 ratio {:.3} ({}) | B2 D {:.4} ({}) | B3 median {:.3} ({}) | B4 ratio {:.3} ({})",
        c.n1(),
        c.b1_ratio(),
        c.b1(),
        c.ks_d,
        c.b2(),
        c.sigma_phi_ratio_median,
        c.b3(),
        c.b4_ratio(),
        c.b4()
    );
    Some(c)
}

/// The pre-registered verdict (N1 and B1 to B4 must all pass for VALIDATED), kept as
/// registered and asserted as recorded (finding F1, run 2026-10-13): N1, B2 and B3 met; B1
/// (the model has 2.38 times the measured deep-fade fraction) and B4 (its mean fade lasts 3.51
/// times as long) NOT MET. The test fails if the verdict moves; the numbers are pinned by
/// `finding_model_fades_are_deeper_and_longer_than_measured`.
#[test]
fn cornell_model_verdict_is_the_recorded_one() {
    let Some(c) = run() else { return };
    let verdict = [
        ("N1", c.n1()),
        ("B1", c.b1()),
        ("B2", c.b2()),
        ("B3", c.b3()),
        ("B4", c.b4()),
    ];
    assert_eq!(
        verdict,
        [
            ("N1", true),
            ("B1", false),
            ("B2", true),
            ("B3", true),
            ("B4", false)
        ],
        "the registered verdict moved"
    );
}

/// Pins finding F1 so that a change to the model, the harness or the data shows up.
///
/// PIN-SCOPE:    the counts N1 reads and the four registered statistics on the registered
///               file, to the printed precision.
/// PIN-EXCLUDES: the medians reported for context, the post-hoc phase analysis below.
#[test]
fn finding_model_fades_are_deeper_and_longer_than_measured() {
    let Some(c) = run() else { return };
    assert_eq!(
        (c.windows_qualifying, c.meas_fade_samples, c.meas_fades),
        (22, 669, 76)
    );
    let near = |got: f64, want: f64| (got - want).abs() < 5e-4;
    assert!(near(c.b1_ratio(), 2.379) && !c.b1(), "B1 {}", c.b1_ratio());
    assert!(near(c.ks_d, 0.0415) && c.b2(), "B2 {}", c.ks_d);
    assert!(
        near(c.sigma_phi_ratio_median, 0.779) && c.b3(),
        "B3 {}",
        c.sigma_phi_ratio_median
    );
    assert!(near(c.b4_ratio(), 3.511) && !c.b4(), "B4 {}", c.b4_ratio());
}

/// The model's phase with the 2π wraps of `atan2` removed (a cumulative unwrap).
fn unwrapped(phase: &[f64]) -> Vec<f64> {
    let mut out = Vec::with_capacity(phase.len());
    let mut offset = 0.0;
    for (k, &p) in phase.iter().enumerate() {
        if k > 0 {
            let d = p - phase[k - 1];
            offset -= std::f64::consts::TAU * (d / std::f64::consts::TAU).round();
        }
        out.push(p + offset);
    }
    out
}

/// POST-HOC, REPORTED, NOT GATING (added after the registered run). The registered
/// processing feeds the model's `phase_rad`, the wrapped `atan2` in (−π, π], to the phase
/// high-pass, while the measured carrier phase is continuous. Every wrap is then a 2π step,
/// which inflates σφ_model (B3) and would read as a cycle slip. This repeats B3 with the
/// model phase unwrapped and prints the result; the registered verdict above is unchanged.
#[test]
fn posthoc_b3_with_the_model_phase_unwrapped() {
    use kshana::iq::channel::scint::{ScintParams, Scintillation};
    use kshana::realdata::scint50::{
        tau0_for_intensity_lag, windows, DT_S, GUARD_SAMPLES, REALISATIONS, WINDOW_SAMPLES,
    };
    let Some(path) = data_file() else {
        eprintln!("SKIPPED: Malindi data not found; nothing was compared");
        return;
    };
    let text = std::fs::read_to_string(path).unwrap();
    let (samples, _) = parse_log(&text);
    let measured: Vec<_> = segments(&samples)
        .iter()
        .flat_map(|s| measured_windows(s))
        .filter(|w| w.qualifies())
        .collect();
    let (mut wrapped_ratios, mut unwrapped_ratios) = (Vec::new(), Vec::new());
    for (w_index, w) in measured.iter().enumerate() {
        let tau0 = tau0_for_intensity_lag(w.s4, w.tau_i_s.unwrap());
        let (mut sw, mut su) = (0.0, 0.0);
        for r in 0..REALISATIONS {
            let mut sc =
                Scintillation::new(ScintParams::new(w.s4, tau0), 1000 * w_index as u64 + r);
            let xs = sc.series(1, DT_S, GUARD_SAMPLES + WINDOW_SAMPLES);
            let si: Vec<f64> = xs.iter().map(|s| s.amplitude * s.amplitude).collect();
            let ph: Vec<f64> = xs.iter().map(|s| s.phase_rad).collect();
            sw += windows(&si, &ph)[0].sigma_phi_rad;
            su += windows(&si, &unwrapped(&ph))[0].sigma_phi_rad;
        }
        wrapped_ratios.push(w.sigma_phi_rad / (sw / REALISATIONS as f64));
        unwrapped_ratios.push(w.sigma_phi_rad / (su / REALISATIONS as f64));
    }
    let median = |mut v: Vec<f64>| {
        v.sort_by(f64::total_cmp);
        let n = v.len();
        if n % 2 == 1 {
            v[n / 2]
        } else {
            0.5 * (v[n / 2 - 1] + v[n / 2])
        }
    };
    eprintln!(
        "POST-HOC B3 over {} windows: median σφ_meas/σφ_model {:.3} with the registered \
         (wrapped) model phase, {:.3} with it unwrapped",
        measured.len(),
        median(wrapped_ratios),
        median(unwrapped_ratios)
    );
}
