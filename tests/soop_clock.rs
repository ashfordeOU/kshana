// SPDX-License-Identifier: AGPL-3.0-only
//! `kshana soop-clock`: the PSS detector times synthetic LTE-like captures to a small fraction
//! of a sample, the clock-offset solution recovers an injected receiver offset (and states its
//! 5 ms ambiguity), and the cyclic-prefix estimator recovers frequency offsets.
use kshana::sdr::Cf64;
use kshana::soop_clock::*;

const FS: f64 = 1.92e6;

#[test]
fn pss_timing_is_a_small_fraction_of_a_sample() {
    for (delay, nid2) in [(0.0, 0), (3.3e-6, 1), (1.2345e-4, 2)] {
        let x = synth_lte(FS, 0.03, nid2, delay, 0.0, 20.0, 5);
        let hits = detect_pss(&x, FS, 0.2);
        assert!(hits.len() >= 5, "{}", hits.len());
        for h in &hits {
            assert_eq!(h.nid2, nid2);
            // The k-th PSS arrives at k·5 ms + 433.33 µs + delay.
            let k = ((h.toa_s - PSS_OFFSET_S - delay) / HALF_FRAME_S).round();
            let err = h.toa_s - (k * HALF_FRAME_S + PSS_OFFSET_S + delay);
            assert!(
                err.abs() < 0.1 / FS,
                "delay {delay}: error {} ns",
                err * 1e9
            );
        }
    }
}

#[test]
fn the_receiver_clock_offset_is_recovered() {
    let rx = ecef(52.0, 13.0, 40.0);
    let tx = ecef(52.02, 13.03, 120.0);
    let range =
        ((rx[0] - tx[0]).powi(2) + (rx[1] - tx[1]).powi(2) + (rx[2] - tx[2]).powi(2)).sqrt();
    let c = 299_792_458.0;
    // The receiver clock is ahead of GPS time by b: the first sample, stamped t_cap by the
    // receiver, was taken at true time t_cap − b. The transmitter's half-frames start at
    // multiples of 5 ms of GPS time, t_cap is one.
    for b in [1.5e-6, -7.25e-6, 1.0e-3] {
        let t_cap = 1_000_000.0;
        let delay = range / c + b;
        let x = synth_lte(FS, 0.04, 0, delay, 300.0, 15.0, 9);
        let hits = detect_pss(&x, FS, 0.2);
        let fit = fit_offset(&offsets(&hits, t_cap, range, 0.0, 0.0)).unwrap();
        assert!(
            (fit.offset_s - b).abs() < 30e-9,
            "b {b}: {} ns",
            (fit.offset_s - b) * 1e9
        );
        assert!(fit.rate.abs() < 1e-6);
    }
    // An offset beyond ±2.5 ms is ambiguous by 5 ms: the prior selects the branch.
    let b = 4.0e-3;
    let x = synth_lte(FS, 0.04, 0, range / c + b, 0.0, 15.0, 9);
    let hits = detect_pss(&x, FS, 0.2);
    let near_zero = fit_offset(&offsets(&hits, 1_000_000.0, range, 0.0, 0.0)).unwrap();
    assert!((near_zero.offset_s - (b - 5e-3)).abs() < 30e-9);
    let with_prior = fit_offset(&offsets(&hits, 1_000_000.0, range, 0.0, 3.5e-3)).unwrap();
    assert!((with_prior.offset_s - b).abs() < 30e-9);
}

#[test]
fn lte_cfo_from_the_cyclic_prefix() {
    for cfo in [-2500.0, 0.0, 800.0] {
        let x = synth_lte(FS, 0.02, 0, 1.7e-6, cfo, 20.0, 2);
        let hits = detect_pss(&x, FS, 0.2);
        let got = lte_cfo_hz(&x, FS, &hits).unwrap();
        assert!((got - cfo).abs() < 20.0, "{cfo}: {got}");
    }
    // The generic estimator assumes one prefix length; LTE's longer first prefix biases it.
    let x = synth_lte(FS, 0.02, 0, 0.0, 0.0, 40.0, 2);
    let (_, eps, _) = cp_estimate(&x, 128, 9).unwrap();
    assert!((eps * LTE_SCS_HZ).abs() > 50.0);
}

/// A generic CP-OFDM signal (DVB-T 2k mode with a 1/4 guard interval, at its 64/7 MHz rate).
fn dvbt_like(start: usize, eps: f64, n_sym: usize) -> Vec<Cf64> {
    let (nfft, ncp) = (2048usize, 512usize);
    let mut seed = 0x1234_5678_u64;
    let mut rnd = || {
        seed = seed
            .wrapping_mul(6364136223846793005)
            .wrapping_add(1442695040888963407);
        if (seed >> 33) & 1 == 1 {
            1.0
        } else {
            -1.0
        }
    };
    let mut out = vec![Cf64::default(); start];
    for _ in 0..n_sym {
        let mut fd = vec![Cf64::default(); nfft];
        for (k, v) in fd.iter_mut().enumerate() {
            // 1705 active carriers about the centre.
            let kk = if k < nfft / 2 {
                k as i64
            } else {
                k as i64 - nfft as i64
            };
            if kk.abs() <= 852 && kk != 0 {
                *v = Cf64::new(rnd(), rnd());
            }
        }
        kshana::spectrum::fft_in_place(&mut fd, true);
        out.extend_from_slice(&fd[nfft - ncp..]);
        out.extend_from_slice(&fd);
    }
    out.iter()
        .enumerate()
        .map(|(i, s)| {
            let ph = 2.0 * std::f64::consts::PI * eps * i as f64 / nfft as f64;
            *s * Cf64::new(ph.cos(), ph.sin())
        })
        .collect()
}

#[test]
fn dvbt_like_symbol_timing_and_frequency_offset() {
    for (start, eps) in [(700usize, 0.12), (100, -0.31)] {
        let x = dvbt_like(start, eps, 6);
        let (t, e, metric) = cp_estimate(&x, 2048, 512).unwrap();
        assert_eq!(t, start % 2560);
        assert!((e - eps).abs() < 1e-3, "{e} vs {eps}");
        assert!(metric > 0.9);
    }
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
        "kshana-soop-clock-{}-{}",
        std::process::id(),
        SEQ.fetch_add(1, std::sync::atomic::Ordering::Relaxed)
    ));
    std::fs::create_dir_all(&dir).unwrap();
    let base = dir.join("cap").display().to_string();
    let (code, _, err) = run(&[
        "soop-clock",
        "synth-lte",
        "--out",
        &base,
        "--duration-s",
        "0.03",
        "--delay-s",
        "2e-5",
        "--cfo-hz",
        "400",
        "--snr-db",
        "20",
    ]);
    assert_eq!(code, 0, "{err}");
    let meta = format!("{base}.sigmf-meta");
    assert!(std::fs::read_to_string(&meta)
        .unwrap()
        .contains("not a conformant LTE downlink"));
    let (code, out, err) = run(&[
        "soop-clock",
        "lte",
        &meta,
        "--start-gps-s",
        "1000000",
        "--rx",
        "52,13,40",
        "--tx",
        "52,13,40",
        "--carrier-hz",
        "806e6",
    ]);
    assert_eq!(code, 0, "{err}");
    let d: serde_json::Value = serde_json::from_str(&out).unwrap();
    assert_eq!(d["schema"], LTE_SCHEMA);
    assert!(
        (d["fit"]["offset_s"].as_f64().unwrap() - 2e-5).abs() < 50e-9,
        "{}",
        d["fit"]
    );
    assert!(
        (d["cfo_hz"].as_f64().unwrap() - 400.0).abs() < 20.0,
        "{}",
        d["cfo_hz"]
    );
    let (code, out, _) = run(&["soop-clock", "cp", &meta, "--nfft", "128", "--ncp", "9"]);
    assert_eq!(code, 0);
    assert!(out.contains(CP_SCHEMA));
    assert_eq!(
        run(&[
            "soop-clock",
            "lte",
            &meta,
            "--rx",
            "95,0,0",
            "--tx",
            "0,0,0",
            "--start-gps-s",
            "0"
        ])
        .0,
        2
    );
    assert_eq!(run(&["soop-clock", "lte", &meta]).0, 2);
    assert_eq!(run(&["soop-clock", "bogus"]).0, 2);
    let _ = std::fs::remove_dir_all(&dir);
}
