// SPDX-License-Identifier: AGPL-3.0-only
//! `kshana quantum-bench`: the scorer recovers the noise, bias, scale factor and fringe jumps
//! the cold-atom output model puts in; the model's dead time aliases vibration through the
//! interferometer's own transfer function.
use kshana::quantum_bench::*;

fn base(extra_errors: &str, profile: &str, duration: f64) -> SimSpec {
    toml::from_str(&format!(
        "[sensor]\npulse_sep_t_s = 0.1\natom_number = 1.0e6\ncontrast = 0.5\ncycle_time_s = 0.5\n\
         [errors]\n{extra_errors}\n[profile]\n{profile}\n[run]\nduration_s = {duration}\nseed = 3\n"
    ))
    .unwrap()
}

fn series(samples: &[Sample], with_reference: bool) -> Series {
    Series {
        t: samples.iter().map(|s| s.t_s).collect(),
        y: samples.iter().map(|s| s.measured_m_s2).collect(),
        reference: with_reference.then(|| samples.iter().map(|s| s.reference_m_s2).collect()),
    }
}

#[test]
fn white_noise_is_scored_at_the_predicted_level() {
    let spec = base("", "constant_m_s2 = 1.0e-6", 2000.0);
    let p = predictions(&spec);
    let s = simulate(&spec).unwrap();
    // PIN-SCOPE:    the number of simulated samples (2000 s at one sample per 0.5 s cycle)
    // PIN-EXCLUDES: every sample value; nothing else is pinned
    assert_eq!(s.len(), 4000);
    let doc = score(&series(&s, true), None).unwrap();
    let got = doc["white_asd_m_s2_per_sqrt_hz"].as_f64().unwrap();
    let want = p["white_asd_m_s2_per_sqrt_hz"].as_f64().unwrap();
    assert!((got / want - 1.0).abs() < 0.1, "{got} vs {want}");
    assert_eq!(doc["availability"], 1.0);
    assert_eq!(doc["gaps"], 0);
    assert!((doc["sample_interval_s"].as_f64().unwrap() - 0.5).abs() < 1e-12);
    // White noise only: the Allan deviation falls all the way, no rate random walk.
    assert!(doc["rate_random_walk_m_s2_per_sqrt_s"].is_null(), "{doc}");
    // Bias against the reference is zero within noise.
    assert!(doc["bias_ug"].as_f64().unwrap().abs() < 0.01);
}

#[test]
fn a_bias_random_walk_and_a_constant_bias_are_found() {
    let spec = base(
        "bias_m_s2 = 3.0e-7\nbias_rw_m_s2_per_sqrt_s = 5.0e-10",
        "constant_m_s2 = 0.0",
        20000.0,
    );
    let s = simulate(&spec).unwrap();
    let doc = score(&series(&s, true), None).unwrap();
    assert!(
        doc["rate_random_walk_m_s2_per_sqrt_s"].as_f64().is_some(),
        "{}",
        doc["allan_deviation"]
    );
    let b = doc["bias_ug"].as_f64().unwrap();
    // 3e-7 m/s² is 0.0306 µg; the random walk (7e-8 m/s² over the run) moves the mean a little.
    assert!((b - 0.0306).abs() < 0.012, "{b}");
}

#[test]
fn scale_factor_against_the_reference() {
    let spec = base(
        "scale_factor_ppm = 2000.0",
        "constant_m_s2 = -8.0e-6\nsteps = [[400.0, 4.0e-6], [800.0, 4.0e-6], [1200.0, 4.0e-6], [1600.0, 4.0e-6]]",
        2000.0,
    );
    let s = simulate(&spec).unwrap();
    assert!(s.iter().all(|x| !x.wrapped));
    let doc = score(&series(&s, true), None).unwrap();
    let sf = doc["linearity"]["scale_factor_ppm"].as_f64().unwrap();
    assert!((sf - 2000.0).abs() < 200.0, "{sf}");
}

#[test]
fn beyond_the_fringe_limit_the_output_wraps_and_the_scorer_counts_jumps() {
    let spec = base("", "constant_m_s2 = 3.0e-5", 100.0);
    let p = predictions(&spec);
    let a_max = p["max_unambiguous_m_s2"].as_f64().unwrap();
    assert!(3.0e-5 > a_max);
    let s = simulate(&spec).unwrap();
    assert!(s.iter().all(|x| x.wrapped));
    let doc = score(&series(&s, true), Some(2.0 * a_max)).unwrap();
    assert_eq!(doc["fringe_jumps"].as_u64().unwrap() as usize, s.len());
}

#[test]
fn dead_time_aliases_vibration_through_the_interferometer_response() {
    // A sine near the cycle rate (2 Hz) is seen as a slow alias at 0.01 Hz, scaled by the
    // triangle response sinc²(f·T): the reference series shows exactly that amplitude.
    let f = 2.01;
    let spec = base(
        "",
        &format!("sine_amplitude_m_s2 = 1.0e-6\nsine_hz = {f}"),
        400.0,
    );
    let s = simulate(&spec).unwrap();
    let amp = s.iter().map(|x| x.reference_m_s2.abs()).fold(0.0, f64::max);
    let x = std::f64::consts::PI * f * 0.1;
    let h = (x.sin() / x).powi(2);
    assert!((amp / 1.0e-6 - h).abs() < 0.01, "{} vs {h}", amp / 1.0e-6);
    // The instantaneous value at mid-interrogation is the unfiltered alias.
    let inst = s
        .iter()
        .map(|x| x.instantaneous_m_s2.abs())
        .fold(0.0, f64::max);
    assert!(inst > 0.99e-6);
}

#[test]
fn csv_reading_and_errors() {
    let s = read_csv("t_s,measured_m_s2\n0,1e-6\n0.5,2e-6\n").unwrap();
    assert_eq!(s.y.len(), 2);
    assert!(s.reference.is_none());
    assert!(matches!(
        read_csv("time,value\n0,1\n"),
        Err(BenchError::Csv(_))
    ));
    assert!(matches!(
        read_csv("t_s,measured_m_s2\n0,x\n"),
        Err(BenchError::Csv(_))
    ));
    assert_eq!(score(&s, None), Err(BenchError::TooShort));
    let mut bad = base("", "constant_m_s2 = 0.0", 10.0);
    bad.sensor.cycle_time_s = 0.1;
    assert_eq!(simulate(&bad), Err(BenchError::Sensor));
}

#[test]
fn the_command_line() {
    let run = |args: &[&str]| {
        let o = std::process::Command::new(env!("CARGO_BIN_EXE_kshana"))
            .args(args)
            .output()
            .unwrap();
        (
            o.status.code().unwrap_or(-1),
            String::from_utf8_lossy(&o.stdout).to_string(),
            String::from_utf8_lossy(&o.stderr).to_string(),
        )
    };
    static SEQ: std::sync::atomic::AtomicU64 = std::sync::atomic::AtomicU64::new(0);
    let dir = std::env::temp_dir().join(format!(
        "kshana-quantum-bench-{}-{}",
        std::process::id(),
        SEQ.fetch_add(1, std::sync::atomic::Ordering::Relaxed)
    ));
    std::fs::create_dir_all(&dir).unwrap();
    let (code, out, _) = run(&["quantum-bench", "protocol"]);
    assert_eq!(code, 0);
    let p: serde_json::Value = serde_json::from_str(&out).unwrap();
    assert_eq!(p["tests"].as_array().unwrap().len(), 7);
    let spec =
        std::path::Path::new(env!("CARGO_MANIFEST_DIR")).join("examples/quantum-bench/static.toml");
    let csv = dir.join("s.csv").display().to_string();
    let (code, _, err) = run(&[
        "quantum-bench",
        "simulate",
        &spec.display().to_string(),
        "--out",
        &csv,
    ]);
    assert_eq!(code, 0, "{err}");
    assert!(std::fs::read_to_string(&csv)
        .unwrap()
        .starts_with("# MODELLED"));
    let (code, out, err) = run(&["quantum-bench", "score", &csv]);
    assert_eq!(code, 0, "{err}");
    let d: serde_json::Value = serde_json::from_str(&out).unwrap();
    assert_eq!(d["schema"], SCORE_SCHEMA);
    assert_eq!(run(&["quantum-bench", "score"]).0, 2);
    assert_eq!(
        run(&["quantum-bench", "simulate", &spec.display().to_string()]).0,
        2
    );
    assert_eq!(
        run(&["quantum-bench", "score", &csv, "--fringe-m-s2", "-1"]).0,
        2
    );
    let _ = std::fs::remove_dir_all(&dir);
}
