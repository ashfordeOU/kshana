// SPDX-License-Identifier: AGPL-3.0-only
//! The GNSS IQ scene generator (`kshana::iq::scene`) checked through independent receiver
//! code: the existing single-satellite front end (`kshana::sdr::acquire`, `track`,
//! `correlate`, written and validated before the scene generator) must find what the scene
//! injected, and the single-point positioning solver (`kshana::pvt::solve_spp`) must solve
//! the scene's broadcast-ephemeris pseudoranges back to the receiver it was given.
//!
//! References:
//! * acquisition and tracking: `sdr::acquire` / `sdr::track` / `sdr::correlate`
//!   (independent implementation of the receiver side; it shares only the C/A chip table);
//! * C/N0: the closed-form coherent SNR of a matched correlation over `T` seconds,
//!   `E|P|² / var(noise) − 1 = C/N0 · T` (Kaplan & Hegarty, 3rd ed., eq. 8.14 form);
//! * broadcast geometry: `pvt::solve_spp`, the engine's SPP solver, run the way a receiver
//!   runs it (transmit time from the measured pseudorange, Earth rotation over flight).
//!
//! Every scene here is seeded, so every number is reproducible.

use kshana::frames::{geodetic_to_ecef, Geodetic};
use kshana::iq::scene::{
    NavData, RangeProfile, ReceiverClock, Scene, SceneConfig, SceneSatellite, Trajectory,
    TruthRecord,
};
use kshana::iq::{Cf64, SampleSpec, VecSink, C_M_PER_S};
use kshana::pvt::{sagnac_rotate, solve_spp, SppMeasurement};
use kshana::rinex::parse_nav;
use kshana::sdr::{
    acquire, correlate, track, Acquisition, CaCode, CorrParams, TrackConfig, CA_CHIP_RATE_HZ, L1_HZ,
};
use std::f64::consts::TAU;

const FS: f64 = 2.5e6; // 2.4438 samples/chip: not commensurate with the chip rate
const SPE: usize = 2500; // samples per 1 ms

fn spec() -> SampleSpec {
    SampleSpec {
        fs_hz: FS,
        center_hz: L1_HZ,
        if_hz: 0.0,
    }
}

fn run(scene: Scene) -> (Vec<Cf64>, Vec<TruthRecord>) {
    let mut sink = VecSink::default();
    let mut truth: Vec<TruthRecord> = Vec::new();
    scene.generate(&mut sink, &mut truth).unwrap();
    (sink.samples, truth)
}

fn circ_chips(a: f64, b: f64) -> f64 {
    let d = (a - b).rem_euclid(1023.0);
    d.min(1023.0 - d)
}

/// Prompt correlation of 1 ms block `e` with replica code phase `phase0` (chips at t = 0),
/// carrier `fd`, code rate scaled by the carrier Doppler, Early/Late spacing `spacing`.
fn corr_block(
    iq: &[Cf64],
    code: &CaCode,
    e: usize,
    phase0: f64,
    fd: f64,
    spacing: f64,
) -> kshana::sdr::Correlation {
    let rate = CA_CHIP_RATE_HZ * (1.0 + fd / L1_HZ);
    let t0 = (e * SPE) as f64 / FS;
    correlate(
        &iq[e * SPE..(e + 1) * SPE],
        code,
        &CorrParams {
            fs_hz: FS,
            carrier_freq_hz: fd,
            carrier_phase_rad: TAU * fd * t0,
            code_rate_hz: rate,
            code_phase_chips: phase0 + rate * t0,
            corr_spacing_chips: spacing,
        },
    )
}

/// Four GPS L1 C/A satellites on range profiles, seeded data bits, thermal noise:
/// `sdr::acquire` finds each one's code phase (within one chip) and Doppler (within half a
/// 500 Hz bin); a code discriminator and a carrier-phase regression on `sdr::correlate`
/// outputs refine them to 0.05 chip and 2 Hz of the truth; `sdr::track` started from the
/// refined estimates holds Costas lock (prompt energy in I) with a symmetric correlation
/// peak.
#[test]
fn acquire_and_track_recover_each_injected_code_phase_and_doppler() {
    let lambda = C_M_PER_S / L1_HZ;
    // (PRN, range m, Doppler Hz, C/N0 dB-Hz). `sdr::acquire` searches whole chips, losing
    // up to 6 dB when the code phase sits half-way between them; the ranges put each code
    // phase 0.1 chip past a whole chip (591.1, 26.1, 966.1, 791.1) so the bin-level
    // statistic is not hostage to that grid. Dopplers sit 100-200 Hz off the 500 Hz bin
    // centres so the bin-level check is unambiguous.
    let sats = [
        (3u8, 20_512_456.4, 2100.0, 48.0),
        (11, 21_877_200.8, -1350.0, 46.0),
        (19, 23_100_693.9, 620.0, 45.0),
        (27, 24_650_940.4, -3300.0, 50.0),
    ];
    let mut cfg = SceneConfig::new(spec(), 0.06);
    cfg.seed = 2024;
    cfg.start_tow_s = 345_600.0;
    let mut scene = Scene::new(cfg).unwrap();
    for (prn, r, fd, cn0) in sats {
        let p = RangeProfile {
            range_m: r,
            range_rate_mps: -fd * lambda,
            range_accel_mps2: 0.0,
            elevation_deg: 40.0,
            azimuth_deg: 0.0,
        };
        scene.add_satellite(
            SceneSatellite::gps_l1ca_profile(
                prn,
                p,
                Some(cn0),
                NavData::Seeded { seed: prn as u64 },
            )
            .unwrap(),
        );
    }
    let (iq, truth) = run(scene);

    for (prn, _, fd_true, cn0) in sats {
        let tr: Vec<&TruthRecord> = truth.iter().filter(|r| r.sat_id == prn as u32).collect();
        assert!((tr[0].doppler_hz - fd_true).abs() < 1e-9);
        let code = CaCode::new(prn).unwrap();

        // Acquisition on the first millisecond.
        let acq = acquire(&iq[..SPE], &code, FS, 0.0, 5000.0, 500.0, 2.0);
        assert!(
            acq.acquired,
            "PRN {prn}: not acquired (ratio {})",
            acq.peak_ratio
        );
        let dc = circ_chips(acq.code_phase_chips, tr[0].code_phase_chips);
        assert!(
            dc <= 1.0,
            "PRN {prn}: acquired code phase off by {dc} chips"
        );
        assert!(
            (acq.doppler_hz - fd_true).abs() <= 250.0,
            "PRN {prn}: acq Doppler {}",
            acq.doppler_hz
        );

        // Fine code phase: E-L discriminator (spacing 1 chip) summed over 40 ms.
        let n_blocks = 40;
        let mut phase = acq.code_phase_chips;
        for _ in 0..6 {
            let (mut e_sum, mut l_sum) = (0.0, 0.0);
            for b in 0..n_blocks {
                let c = corr_block(&iq, &code, b, phase, acq.doppler_hz, 1.0);
                e_sum += c.early.abs();
                l_sum += c.late.abs();
            }
            // Triangle: E = 0.5 - δ, L = 0.5 + δ for replica - signal = δ.
            phase += 0.5 * (e_sum - l_sum) / (e_sum + l_sum);
        }
        let d_fine = circ_chips(phase, tr[0].code_phase_chips);
        assert!(
            d_fine < 0.05,
            "PRN {prn}: refined code phase off by {d_fine} chips"
        );

        // Fine Doppler: slope of the squared prompt phase (squaring removes the data bits),
        // iterated so the second pass runs with a small residual (a bit edge inside a block
        // then changes that block's amplitude, not its phase).
        let mut fd_est = acq.doppler_hz;
        for _ in 0..2 {
            let mut unwrapped: Vec<f64> = Vec::with_capacity(n_blocks);
            for b in 0..n_blocks {
                let p = corr_block(&iq, &code, b, phase, fd_est, 1.0).prompt;
                let mut v = 2.0 * p.im.atan2(p.re);
                if let Some(&last) = unwrapped.last() {
                    while v - last > std::f64::consts::PI {
                        v -= TAU;
                    }
                    while v - last < -std::f64::consts::PI {
                        v += TAU;
                    }
                }
                unwrapped.push(v);
            }
            let n = n_blocks as f64;
            let mx = (n - 1.0) / 2.0;
            let my = unwrapped.iter().sum::<f64>() / n;
            let (mut sxy, mut sxx) = (0.0, 0.0);
            for (i, y) in unwrapped.iter().enumerate() {
                sxy += (i as f64 - mx) * (y - my);
                sxx += (i as f64 - mx).powi(2);
            }
            fd_est += sxy / sxx / 2.0 / TAU / 1e-3;
        }
        assert!(
            (fd_est - fd_true).abs() < 2.0,
            "PRN {prn}: refined Doppler {fd_est} vs {fd_true}"
        );

        // Track from the refined estimates.
        let start = Acquisition {
            code_phase_chips: phase.rem_euclid(1023.0),
            doppler_hz: fd_est,
            ..acq
        };
        let dumps = track(&iq, &code, &start, FS, 0.0, &TrackConfig::default(), 60);
        assert_eq!(dumps.len(), 60);
        let late = &dumps[20..];
        let i_pow: f64 = late.iter().map(|d| d.prompt.re * d.prompt.re).sum();
        let q_pow: f64 = late.iter().map(|d| d.prompt.im * d.prompt.im).sum();
        assert!(
            q_pow < 0.1 * i_pow,
            "PRN {prn}: not in Costas lock (Q/I power {})",
            q_pow / i_pow
        );
        // Symmetric peak: the monitor's Early and Late magnitudes summed over 40 epochs. The
        // imbalance is noise-limited: at 45 dB-Hz each tap is about 140 with noise 50 per
        // epoch, so the 40-epoch imbalance has a standard deviation near 0.04; the bar is
        // 0.15 (between 3 and 4 sigma). A replica a tenth of a chip off would read 0.2.
        let e_sum: f64 = late.iter().map(|d| d.early.abs()).sum();
        let l_sum: f64 = late.iter().map(|d| d.late.abs()).sum();
        let imbalance = (e_sum - l_sum).abs() / (e_sum + l_sum);
        assert!(imbalance < 0.15, "PRN {prn}: E/L imbalance {imbalance}");
        // Prompt amplitude is the injected one: A·N with A² = C/N0 / fs (unit noise power).
        let want = (10f64.powf(cn0 / 10.0) / FS).sqrt() * SPE as f64;
        let mean_i = late.iter().map(|d| d.prompt.re.abs()).sum::<f64>() / late.len() as f64;
        assert!(
            (mean_i / want - 1.0).abs() < 0.15,
            "PRN {prn}: |I| {mean_i} vs {want}"
        );
        eprintln!(
            "PRN {prn}: acq ratio {:.2}, code {:.4} chip, Doppler {:+.3} Hz, Q/I {:.4}, E/L {:.4}, |I|/A·N {:.3}",
            acq.peak_ratio,
            d_fine,
            fd_est - fd_true,
            q_pow / i_pow,
            imbalance,
            mean_i / want
        );
    }
}

/// Closed form: for a replica matched in code phase, code rate and carrier, the prompt of a
/// `T`-second block has `E|P|² = (C/N0 · T + 1) · σ²` with `σ² = N` for unit-power noise,
/// so `(mean|P|² − N) / N` estimates `C/N0 · T`. Over 400 blocks the estimate's standard
/// deviation is 0.08 dB at 45 dB-Hz and 0.2 dB at 38 dB-Hz; the tolerance is 0.3 and
/// 0.6 dB.
#[test]
fn correlation_power_matches_the_injected_cn0() {
    let lambda = C_M_PER_S / L1_HZ;
    for (cn0, tol_db) in [(45.0, 0.3), (38.0, 0.6)] {
        let mut cfg = SceneConfig::new(spec(), 0.4);
        cfg.seed = 77;
        let mut scene = Scene::new(cfg).unwrap();
        let p = RangeProfile {
            range_m: 21_000_000.0,
            range_rate_mps: 1700.0 * lambda,
            range_accel_mps2: -0.2,
            elevation_deg: 50.0,
            azimuth_deg: 0.0,
        };
        scene.add_satellite(
            SceneSatellite::gps_l1ca_profile(14, p, Some(cn0), NavData::None).unwrap(),
        );
        let (iq, truth) = run(scene);
        let code = CaCode::new(14).unwrap();
        let n_blocks = 400;
        let mut sum = 0.0;
        for b in 0..n_blocks {
            let tr = &truth[b];
            assert!((tr.t_s - b as f64 * 1e-3).abs() < 1e-12);
            let rate = CA_CHIP_RATE_HZ * (1.0 + tr.doppler_hz / L1_HZ);
            let c = correlate(
                &iq[b * SPE..(b + 1) * SPE],
                &code,
                &CorrParams {
                    fs_hz: FS,
                    carrier_freq_hz: tr.doppler_hz,
                    carrier_phase_rad: 0.0,
                    code_rate_hz: rate,
                    code_phase_chips: tr.code_phase_chips,
                    corr_spacing_chips: 0.5,
                },
            );
            sum += c.prompt.re * c.prompt.re + c.prompt.im * c.prompt.im;
        }
        let n = SPE as f64;
        let snr = (sum / n_blocks as f64 - n) / n;
        let est = 10.0 * (snr / 1e-3).log10();
        eprintln!("C/N0 {cn0}: estimated {est:.3} dB-Hz");
        assert!(
            (est - cn0).abs() < tol_db,
            "C/N0 {cn0}: estimated {est:.3} dB-Hz"
        );
    }
}

/// Broadcast geometry: a static receiver near Frankfurt under the IGS broadcast ephemeris of
/// 13 May 2018, with a receiver clock offset and drift. A receiver reconstructs each
/// satellite's transmit time from the scene's truth pseudorange, evaluates the ephemeris
/// there, rotates for Earth rotation over the flight and solves SPP; the solution must be
/// the scene's receiver position and clock offset to a millimetre. The strongest satellite
/// is then acquired from the generated samples at its truth code phase and Doppler.
#[test]
fn broadcast_scene_pseudoranges_solve_back_to_the_receiver() {
    let text = include_str!("fixtures/igs/BRDC00WRD_R_20181330000_01D_GN.rnx");
    let all = parse_nav(text).unwrap();
    let start_tow = 600.0;
    let mut ephs: Vec<_> = Vec::new();
    for prn in 1..=32u8 {
        if let Some(e) = all
            .iter()
            .filter(|e| e.system == 'G' && e.prn == prn && e.sv_health == 0.0)
            .min_by(|a, b| {
                (a.toe - start_tow)
                    .abs()
                    .total_cmp(&(b.toe - start_tow).abs())
            })
        {
            ephs.push(*e);
        }
    }
    assert!(ephs.len() >= 25, "{} GPS ephemerides", ephs.len());

    let rx = geodetic_to_ecef(Geodetic {
        lat_rad: 50.09_f64.to_radians(),
        lon_rad: 8.66_f64.to_radians(),
        alt_m: 150.0,
    });
    let clock = ReceiverClock {
        bias_s: 3.0e-5,
        drift_s_per_s: 1.0e-8,
    };
    let mut cfg = SceneConfig::new(spec(), 0.002);
    cfg.start_tow_s = start_tow;
    cfg.receiver = Trajectory::Static(rx);
    cfg.clock = clock;
    cfg.elevation_mask_deg = 10.0;
    cfg.cn0_model.zenith_dbhz = 50.0;
    cfg.seed = 9;
    let mut scene = Scene::new(cfg).unwrap();
    for e in &ephs {
        scene.add_satellite(
            SceneSatellite::gps_l1ca_broadcast(e, None, Default::default()).unwrap(),
        );
    }
    let (iq, truth) = run(scene);
    let epoch0: Vec<&TruthRecord> = truth.iter().filter(|r| r.t_s == 0.0 && r.visible).collect();
    assert!(epoch0.len() >= 6, "{} visible", epoch0.len());
    for r in &epoch0 {
        assert!(r.doppler_hz.abs() < 5000.0 && r.pseudorange_m > 1.9e7 && r.pseudorange_m < 2.7e7);
    }

    // Receiver-side reconstruction and SPP, iterating the clock estimate.
    let mut b_est = 0.0;
    let mut fix = None;
    for _ in 0..4 {
        let meas: Vec<SppMeasurement> = epoch0
            .iter()
            .map(|r| {
                let e = ephs.iter().find(|e| e.prn as u32 == r.sat_id).unwrap();
                let mut dt_sv = 0.0;
                let mut sat = [0.0; 3];
                for _ in 0..3 {
                    let tau = r.pseudorange_m / C_M_PER_S - b_est + dt_sv;
                    let t_tx = start_tow + r.t_s - b_est - tau;
                    sat = sagnac_rotate(e.sv_position_ecef(t_tx), tau);
                    dt_sv = e.sv_clock_bias_s(t_tx) - e.tgd;
                }
                SppMeasurement {
                    sat_ecef: sat,
                    pseudorange_m: r.pseudorange_m,
                    sat_clock_m: C_M_PER_S * dt_sv,
                    iono_m: 0.0,
                    tropo_m: 0.0,
                    weight: 1.0,
                }
            })
            .collect();
        let f = solve_spp(&meas, [0.0, 0.0, 0.0]).expect("SPP");
        b_est = f.clock_bias_m / C_M_PER_S;
        fix = Some(f);
    }
    let fix = fix.unwrap();
    let err = ((fix.ecef[0] - rx[0]).powi(2)
        + (fix.ecef[1] - rx[1]).powi(2)
        + (fix.ecef[2] - rx[2]).powi(2))
    .sqrt();
    eprintln!(
        "{} visible, SPP error {err:.2e} m, clock {:.2e} m",
        epoch0.len(),
        fix.clock_bias_m - C_M_PER_S * clock.offset_at(clock.true_time(0.0))
    );
    assert!(err < 1e-3, "SPP position error {err} m");
    let b_true = clock.offset_at(clock.true_time(0.0));
    assert!(
        (fix.clock_bias_m - C_M_PER_S * b_true).abs() < 1e-3,
        "clock {} m",
        fix.clock_bias_m - C_M_PER_S * b_true
    );
    assert!(fix.postfit_rms_m < 1e-3);

    // Acquire the highest satellite from the samples. Its code phase falls anywhere on
    // `sdr::acquire`'s whole-chip grid (up to 6 dB grid loss), so the check is the peak
    // cell's position (within one chip, and one 250 Hz bin of Doppler), with only a loose
    // bar (1.5) on the peak ratio.
    let top = epoch0
        .iter()
        .max_by(|a, b| a.elevation_deg.total_cmp(&b.elevation_deg))
        .unwrap();
    let code = CaCode::new(top.sat_id as u8).unwrap();
    let acq = acquire(&iq[..SPE], &code, FS, 0.0, 5000.0, 250.0, 1.5);
    assert!(acq.acquired, "PRN {} ratio {}", top.sat_id, acq.peak_ratio);
    assert!(circ_chips(acq.code_phase_chips, top.code_phase_chips) <= 1.0);
    assert!(
        (acq.doppler_hz - top.doppler_hz).abs() <= 250.0,
        "PRN {}: acq {:?} truth Doppler {} code {}",
        top.sat_id,
        acq,
        top.doppler_hz,
        top.code_phase_chips
    );
}
