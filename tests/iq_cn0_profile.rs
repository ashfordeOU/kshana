// SPDX-License-Identifier: AGPL-3.0-only
//! C/N0 profiles in synthetic scenes (`kshana::iq::channel::cn0_profile`).
//!
//! References:
//!
//! * the fade's closed forms: mean intensity 1, intensity scintillation index `S4` of the
//!   Rice distribution with `K = (1 − S4² + √(1 − S4²))/S4²`, and decorrelation set by the
//!   first-order Gauss–Markov time `τ` (intensity correlation near 1 at `0.05τ`, near 0 at
//!   `5τ`), checked on long seeded series;
//! * the profile itself as the truth for a profiled scene: the truth sidecar's `cn0_dbhz`
//!   equals the stated C/N0 plus the profile, and the C/N0 a tracking loop estimates on the
//!   scene follows a 6 dB step within the estimator's spread.

use kshana::iq::channel::cn0_profile::{rice_k_for_s4, Cn0Profile, Cn0Segment, Cn0Shape};
use std::path::PathBuf;

fn scratch(name: &str) -> PathBuf {
    use std::sync::atomic::{AtomicU64, Ordering};
    static SEQ: AtomicU64 = AtomicU64::new(0);
    let d = std::env::temp_dir().join(format!(
        "kshana-iq-cn0-profile-{}-{}-{name}",
        std::process::id(),
        SEQ.fetch_add(1, Ordering::Relaxed)
    ));
    let _ = std::fs::remove_dir_all(&d);
    std::fs::create_dir_all(&d).unwrap();
    d
}

fn args(v: &[&str]) -> Vec<String> {
    v.iter().map(|s| s.to_string()).collect()
}

fn mean(v: &[f64]) -> f64 {
    v.iter().sum::<f64>() / v.len() as f64
}

fn corr(x: &[f64], lag: usize) -> f64 {
    let n = x.len() - lag;
    let m = mean(x);
    let var = x.iter().map(|v| (v - m) * (v - m)).sum::<f64>() / x.len() as f64;
    (0..n).map(|i| (x[i] - m) * (x[i + lag] - m)).sum::<f64>() / n as f64 / var
}

/// Over 4000 decorrelation times, a fade's intensity has mean 1 (within 5 %) and the
/// scintillation index asked for (within 8 %), at S4 = 0.3, 0.7 and 1; its correlation is
/// above 0.9 at 0.05τ and below 0.05 at 5τ.
#[test]
fn fade_matches_rice_closed_forms() {
    let tau = 0.2;
    for (s4, seed) in [(0.3, 1u64), (0.7, 2), (1.0, 3)] {
        let mut p = Cn0Profile::new(vec![Cn0Segment {
            prns: None,
            shape: Cn0Shape::Fade {
                s4,
                tau_s: tau,
                seed,
            },
        }])
        .unwrap();
        let dt = tau / 20.0;
        let n = 4000 * 20;
        let inten: Vec<f64> = (0..n)
            .map(|k| 10f64.powf(p.offset_db(7, k as f64 * dt) / 10.0))
            .collect();
        let m = mean(&inten);
        let var = inten.iter().map(|v| (v - m) * (v - m)).sum::<f64>() / n as f64;
        let s4_meas = var.sqrt() / m;
        println!(
            "S4 {s4}: K {:.3}, mean {m:.4}, S4 measured {s4_meas:.4}",
            rice_k_for_s4(s4)
        );
        assert!((m - 1.0).abs() < 0.05, "mean intensity {m}");
        assert!((s4_meas / s4 - 1.0).abs() < 0.08, "S4 {s4_meas} vs {s4}");
        assert!(corr(&inten, 1) > 0.9);
        assert!(corr(&inten, 100).abs() < 0.05);
    }
}

/// A 6 s scene with a −6 dB step at 3 s (and a ramp on a second PRN that is not tracked):
/// the truth's `cn0_dbhz` is 47 before and 41 after the step, and the tracked NWPR C/N0
/// drops by 6 dB within 0.7 dB.
#[test]
fn scene_with_a_step_profile_tracks_the_step_and_states_it_in_the_truth() {
    use kshana::iq::cli::run;
    let dir = scratch("step");
    let p = |s: &str| dir.join(s).display().to_string();
    std::fs::write(
        p("prof.toml"),
        "[[segment]]\nprns = [9]\nkind = \"step\"\nat_s = 3.0\ndelta_db = -6.0\n\n\
         [[segment]]\nprns = [12]\nkind = \"ramp\"\nstart_s = 1.0\nend_s = 5.0\nfrom_db = 0.0\nto_db = -8.0\n",
    )
    .unwrap();
    assert_eq!(
        run(&args(&[
            "scene",
            &p("s.cf32"),
            "--rate",
            "2046000",
            "--duration",
            "6",
            "--signal",
            "gps-l1ca",
            "--prn",
            "9,12",
            "--doppler",
            "1200,-800",
            "--cn0",
            "47",
            "--seed",
            "5",
            "--cn0-profile",
            &p("prof.toml"),
        ])),
        0
    );
    // Truth: the profiled C/N0.
    let truth = std::fs::read_to_string(p("s.cf32.truth.csv")).unwrap();
    let mut rows = truth.lines();
    let header: Vec<&str> = rows.next().unwrap().split(',').collect();
    let col = |n: &str| header.iter().position(|h| *h == n).unwrap();
    let (ct, cs, cc) = (col("t_s"), col("sat_id"), col("cn0_dbhz"));
    for line in rows {
        let f: Vec<&str> = line.split(',').collect();
        let t: f64 = f[ct].parse().unwrap();
        let sat: u32 = f[cs].parse().unwrap();
        let cn0: f64 = f[cc].parse().unwrap();
        let want = match sat {
            9 => {
                if t >= 3.0 {
                    41.0
                } else {
                    47.0
                }
            }
            _ => 47.0 - 8.0 * ((t - 1.0) / 4.0).clamp(0.0, 1.0),
        };
        assert!(
            (cn0 - want).abs() < 1e-9,
            "t {t} sat {sat}: {cn0} vs {want}"
        );
    }
    // Tracking: NWPR C/N0 (1 s estimator) before the step and well after it.
    assert_eq!(
        run(&args(&[
            "track",
            &p("s.cf32"),
            "--signal",
            "gps-l1ca",
            "--prn",
            "9",
            "--json",
            &p("t.json"),
        ])),
        0
    );
    let v: serde_json::Value =
        serde_json::from_str(&std::fs::read_to_string(p("t.json")).unwrap()).unwrap();
    let epochs = v["channels"][0]["epochs"].as_array().unwrap();
    let window = |lo: f64, hi: f64| -> f64 {
        let xs: Vec<f64> = epochs
            .iter()
            .filter(|e| {
                let t = e["code_epoch_s"].as_f64().unwrap();
                (lo..hi).contains(&t)
            })
            .filter_map(|e| e["cn0_nwpr_dbhz"].as_f64())
            .collect();
        mean(&xs)
    };
    let before = window(2.0, 3.0);
    let after = window(4.5, 6.0);
    println!("tracked C/N0 {before:.2} -> {after:.2} dB-Hz");
    assert!(((before - after) - 6.0).abs() < 0.7, "{before} -> {after}");
    let _ = std::fs::remove_dir_all(&dir);
}

/// The profile composes with a channel effect (scintillation here) and a bad profile is a
/// usage error.
#[test]
fn profile_composes_with_a_channel_and_bad_profiles_are_refused() {
    use kshana::iq::cli::run;
    let dir = scratch("compose");
    let p = |s: &str| dir.join(s).display().to_string();
    std::fs::write(
        p("prof.toml"),
        "[[segment]]\nkind = \"fade\"\ns4 = 0.5\ntau_s = 0.3\nseed = 2\n",
    )
    .unwrap();
    assert_eq!(
        run(&args(&[
            "scene",
            &p("s.cf32"),
            "--rate",
            "2046000",
            "--duration",
            "0.5",
            "--signal",
            "gps-l1ca",
            "--prn",
            "9",
            "--cn0",
            "45",
            "--s4",
            "0.3",
            "--cn0-profile",
            &p("prof.toml"),
        ])),
        0
    );
    let truth = std::fs::read_to_string(p("s.cf32.truth.csv")).unwrap();
    let cn0s: Vec<f64> = truth
        .lines()
        .skip(1)
        .map(|l| l.split(',').nth(5).unwrap().parse().unwrap())
        .collect();
    assert!(
        cn0s.iter().any(|c| (c - 45.0).abs() > 0.1),
        "fade not in the truth"
    );
    std::fs::write(
        p("bad.toml"),
        "[[segment]]\nkind = \"fade\"\ns4 = 2.0\ntau_s = 1.0\n",
    )
    .unwrap();
    assert_eq!(
        run(&args(&[
            "scene",
            &p("x.cf32"),
            "--rate",
            "2046000",
            "--duration",
            "0.1",
            "--signal",
            "gps-l1ca",
            "--prn",
            "9",
            "--cn0-profile",
            &p("bad.toml"),
        ])),
        2
    );
    let _ = std::fs::remove_dir_all(&dir);
}
