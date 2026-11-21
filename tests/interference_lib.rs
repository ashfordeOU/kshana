// SPDX-License-Identifier: AGPL-3.0-only
//! `kshana interference-lib`: the reference fit recovers the class and parameters of library
//! recordings and re-synthesises their spectra, the benchmark scores the reference and an
//! external classifier on ID and OOD parts, and the command line round-trips SigMF.
use kshana::interference_lib::*;
use std::collections::BTreeMap;

const FS: f64 = 10.0e6;

fn model(class: Class) -> Model {
    let mut m = Model::none();
    m.class = class;
    m.jnr_db = 12.0;
    match class {
        Class::Cw => m.centre_hz = 1.25e6,
        Class::Narrowband => {
            m.centre_hz = -2.0e6;
            m.bandwidth_hz = 4.0e5;
        }
        Class::Wideband => {
            m.centre_hz = 0.5e6;
            m.bandwidth_hz = 3.0e6;
        }
        Class::Chirp => {
            m.bandwidth_hz = 3.0e6;
            m.period_s = 5.0e-5;
        }
        Class::Pulsed => {
            m.centre_hz = 0.8e6;
            m.pulse_width_s = 3.5e-6;
            m.period_s = 3.0e-4;
        }
        Class::Multitone => {
            m.tones_hz = vec![-2.5e6, 0.3e6, 1.9e6];
            m.centre_hz = (-2.5e6 + 0.3e6 + 1.9e6) / 3.0;
        }
        Class::FmTone => {
            m.centre_hz = 0.5e6;
            m.deviation_hz = 8.0e5;
            m.mod_freq_hz = 1.0e4;
        }
        Class::None => {}
    }
    m
}

#[test]
fn the_fit_recovers_each_class_and_its_parameters() {
    for class in Class::ALL {
        let m = model(class);
        let x = synthesise(&m, FS, 65536, 11);
        let f = fit(&x, FS, 12).unwrap();
        assert_eq!(f.model.class, class, "{:?}", f.features);
        // The re-synthesised spectrum matches the recording's.
        assert!(
            f.residual_db < 1.5,
            "{class:?}: residual {} dB",
            f.residual_db
        );
        if class == Class::None {
            continue;
        }
        assert!(
            (f.model.jnr_db - 12.0).abs() < 1.0,
            "{class:?}: jnr {}",
            f.model.jnr_db
        );
        match class {
            Class::Cw => assert!((f.model.centre_hz - 1.25e6).abs() < 2.0e4),
            Class::Narrowband | Class::Wideband => {
                assert!(
                    (f.model.bandwidth_hz - m.bandwidth_hz).abs() < 0.15 * m.bandwidth_hz + 4.0e4,
                    "{:?}",
                    f.model
                );
                assert!(
                    (f.model.centre_hz - m.centre_hz).abs() < 1.0e5,
                    "{:?}",
                    f.model
                );
            }
            Class::Chirp => {
                assert!(
                    (f.model.bandwidth_hz - 3.0e6).abs() < 0.4e6,
                    "{:?}",
                    f.model
                );
                assert!((f.model.period_s - 5.0e-5).abs() < 1.5e-5, "{:?}", f.model);
            }
            Class::Pulsed => {
                assert!((f.model.period_s - 3.0e-4).abs() < 2.0e-5, "{:?}", f.model);
                assert!((f.model.centre_hz - 0.8e6).abs() < 1.0e5, "{:?}", f.model);
                assert!(
                    (f.model.pulse_width_s - 3.5e-6).abs() < 0.7e-6,
                    "{:?}",
                    f.model
                );
            }
            Class::Multitone => {
                let mut got = f.model.tones_hz.clone();
                got.sort_by(f64::total_cmp);
                assert_eq!(got.len(), 3, "{:?}", f.model);
                for (g, t) in got.iter().zip([-2.5e6, 0.3e6, 1.9e6]) {
                    assert!((g - t).abs() < 2.0e4, "{:?}", f.model);
                }
            }
            Class::FmTone => {
                assert!(
                    (f.model.deviation_hz - 8.0e5).abs() < 1.5e5,
                    "{:?}",
                    f.model
                );
                assert!((f.model.centre_hz - 0.5e6).abs() < 1.0e5, "{:?}", f.model);
            }
            Class::None => {}
        }
        // Interference near the C/A band centre costs C/N0; the narrowband one 2 MHz away less.
        assert!(f.ca_cn0_loss_db > 0.0);
    }
}

#[test]
fn the_benchmark_scores_id_and_ood_and_an_external_classifier() {
    let mut ext = BTreeMap::new();
    for c in corpus(6, 21) {
        // An "external classifier" that always says wideband.
        ext.insert(c.id, Class::Wideband);
    }
    let doc = benchmark(6, 21, Some(&ext)).unwrap();
    assert_eq!(doc["schema"], BENCH_SCHEMA);
    assert_eq!(doc["label"], "MODELLED");
    let id_acc = doc["reference"]["parts"]["id"]["accuracy"]
        .as_f64()
        .unwrap();
    let ood_acc = doc["reference"]["parts"]["ood"]["accuracy"]
        .as_f64()
        .unwrap();
    assert!(
        id_acc >= 0.9,
        "reference ID accuracy {id_acc}: {}",
        doc["reference"]
    );
    assert!(ood_acc <= id_acc, "OOD is no easier: {ood_acc} vs {id_acc}");
    assert_eq!(doc["reference"]["parts"]["id"]["cases"], 48);
    let ext_acc = doc["external"]["parts"]["id"]["accuracy"].as_f64().unwrap();
    assert!((ext_acc - 1.0 / 8.0).abs() < 1e-9);
    // The pre-registered primary metric: macro-F1. An always-wideband classifier has recall 1
    // and precision 1/8 on wideband and F1 0 elsewhere: (2·(1/8)/(1+1/8))/8 = 1/36.
    assert_eq!(doc["primary_metric"], PRIMARY_METRIC);
    let ext_f1 = doc["external"]["parts"]["id"]["macro_f1"].as_f64().unwrap();
    assert!((ext_f1 - 1.0 / 36.0).abs() < 1e-9, "{ext_f1}");
    let ref_f1 = doc["reference"]["parts"]["id"]["macro_f1"]
        .as_f64()
        .unwrap();
    assert!(ref_f1 >= 0.85, "reference ID macro-F1 {ref_f1}");
    // The JNR breakdown: ID cases fall in 5-20 dB, OOD in 0-5 dB; `none` is outside the bins.
    let id_bins = doc["reference"]["parts"]["id"]["by_jnr"]
        .as_array()
        .unwrap();
    assert_eq!(id_bins.len(), 4);
    assert_eq!(id_bins[0]["cases"], 0);
    let in_bins: u64 = id_bins.iter().map(|b| b["cases"].as_u64().unwrap()).sum();
    assert_eq!(in_bins, 42);
    let ood_bins = doc["reference"]["parts"]["ood"]["by_jnr"]
        .as_array()
        .unwrap();
    assert_eq!(ood_bins[0]["cases"], 42);
    // Cross-stage rows: one per case, and the stronger ID interference rises more.
    let cross = doc["cross_stage"].as_array().unwrap();
    assert_eq!(cross.len(), 96);
    for r in cross {
        assert!(r["post_correlation_ca_cn0_loss_db"].as_f64().unwrap() >= 0.0);
    }
    // Same seed, same document.
    assert_eq!(doc, benchmark(6, 21, Some(&ext)).unwrap());
}

#[test]
fn predictions_csv_is_read_and_rejected_when_malformed() {
    let p = read_predictions("id,class\nid-cw-000,cw\nx,pulsed\n").unwrap();
    assert_eq!(p.get("id-cw-000"), Some(&Class::Cw));
    assert!(read_predictions("id,label\na,cw\n").is_err());
    assert!(read_predictions("id,class\na,laser\n").is_err());
}

#[test]
fn the_command_line_generates_fits_and_benchmarks() {
    static SEQ: std::sync::atomic::AtomicU64 = std::sync::atomic::AtomicU64::new(0);
    let dir = std::env::temp_dir().join(format!(
        "kshana-interference-lib-{}-{}",
        std::process::id(),
        SEQ.fetch_add(1, std::sync::atomic::Ordering::Relaxed)
    ));
    std::fs::create_dir_all(&dir).unwrap();
    let base = dir.join("chirp").display().to_string();
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
    let (code, _, err) = run(&[
        "interference-lib",
        "generate",
        "--class",
        "chirp",
        "--bandwidth-hz",
        "3e6",
        "--period-s",
        "5e-5",
        "--jnr-db",
        "12",
        "--samples",
        "65536",
        "--out",
        &base,
    ]);
    assert_eq!(code, 0, "{err}");
    let meta = std::fs::read_to_string(format!("{base}.sigmf-meta")).unwrap();
    assert!(meta.contains("MODELLED synthetic interference"));
    let (code, out, err) = run(&["interference-lib", "fit", &format!("{base}.sigmf-meta")]);
    assert_eq!(code, 0, "{err}");
    let doc: serde_json::Value = serde_json::from_str(&out).unwrap();
    assert_eq!(doc["fit"]["model"]["class"], "chirp");
    let (code, out, _) = run(&["interference-lib", "cases", "--per-class", "2"]);
    assert_eq!(code, 0);
    assert_eq!(out.lines().count(), 1 + 32);
    assert!(out.lines().any(|l| l.contains(",multitone,")));
    assert_eq!(
        run(&[
            "interference-lib",
            "generate",
            "--class",
            "laser",
            "--out",
            &base
        ])
        .0,
        2
    );
    assert_eq!(run(&["interference-lib", "fit"]).0, 2);
    assert_eq!(run(&["interference-lib"]).0, 2);
    let _ = std::fs::remove_dir_all(&dir);
}
