// SPDX-License-Identifier: AGPL-3.0-only
//! Unit tests of the scene generator. The receiver-level checks (acquisition, tracking,
//! C/N0 against the closed-form coherent SNR, broadcast geometry through SPP) are in
//! `tests/iq_scene_receiver.rs`.

use super::*;
use crate::gps_lnav::{decode_fields, encode_word, field_values, source_data, LnavEphemeris};
use crate::iq::{Cf64, VecSink};
use crate::sdr::{CaCode, L1_HZ};

const FS: f64 = 2.5e6;

fn spec() -> SampleSpec {
    SampleSpec {
        fs_hz: FS,
        center_hz: L1_HZ,
        if_hz: 0.0,
    }
}

fn profile(range_m: f64, rate: f64, accel: f64) -> RangeProfile {
    RangeProfile {
        range_m,
        range_rate_mps: rate,
        range_accel_mps2: accel,
        elevation_deg: 45.0,
        azimuth_deg: 90.0,
    }
}

fn eph() -> LnavEphemeris {
    LnavEphemeris {
        week: 2001,
        toc_s: 7200.0,
        toe_s: 7200.0,
        iodc: 62,
        iode: 62,
        af0: 1.172591000795e-04,
        af1: -1.114131009672e-11,
        af2: 0.0,
        tgd: -2.048909664154e-08,
        crs: 49.5,
        delta_n: 5.027709424278e-09,
        m0: 2.658396290636,
        cuc: 2.449378371239e-06,
        e: 1.787104341201e-02,
        cus: 5.658715963364e-06,
        sqrt_a: 5.153730810165e+03,
        cic: 1.396983861923e-07,
        omega0: -2.556968003569,
        cis: -2.235174179077e-07,
        i0: 9.501893296910e-01,
        crc: 257.84375,
        omega: -1.859004884250,
        omega_dot: -8.074979212439e-09,
        idot: 3.425142670940e-10,
        health: 0,
        code_on_l2: 1,
    }
}

/// Generate a scene in one go; returns samples and truth.
fn run(scene: Scene) -> (Vec<Cf64>, Vec<TruthRecord>) {
    let mut sink = VecSink::default();
    let mut truth: Vec<TruthRecord> = Vec::new();
    scene.generate(&mut sink, &mut truth).unwrap();
    (sink.samples, truth)
}

fn one_sat_scene(cfg: SceneConfig, p: RangeProfile, nav: NavData) -> Scene {
    let mut s = Scene::new(cfg).unwrap();
    s.add_satellite(SceneSatellite::gps_l1ca_profile(7, p, Some(45.0), nav).unwrap());
    s
}

#[test]
fn gps_l1ca_wraps_the_sdr_code_with_its_chip_mapping() {
    let g = GpsL1Ca::new(7).unwrap();
    let c = CaCode::new(7).unwrap();
    assert_eq!(g.len_chips(), 1023);
    assert_eq!(g.chip_rate_hz(), 1.023e6);
    assert_eq!(g.carrier_hz(), L1_HZ);
    assert!((g.period_s() - 1e-3).abs() < 1e-18);
    assert_eq!(g.name(), "GPS L1 C/A PRN 7");
    for k in 0..1023 {
        assert_eq!(g.value_at(k as f64 + 0.3), c.bipolar[k]);
        assert_eq!(g.value_at(k as f64 + 1023.0 * 5.0), c.bipolar[k]);
        assert_eq!(g.value_at(k as f64 - 1023.0 * 3.0 + 0.999), c.bipolar[k]);
    }
    assert_eq!(g.value_at(-1e-17), c.bipolar[1022]);
    assert!(GpsL1Ca::new(0).is_none() && GpsL1Ca::new(33).is_none());
}

/// Closed form: carrier Doppler `−Ṗ/λ` with `λ = c / f_L1`; the truth must equal it to
/// float precision, and the generated carrier must rotate at it.
#[test]
fn doppler_is_minus_range_rate_over_lambda_in_truth_and_in_the_samples() {
    let lambda = C_M_PER_S / L1_HZ;
    // Truth, with a range acceleration (the Hermite interpolant is exact for a quadratic).
    let mut cfg = SceneConfig::new(spec(), 0.05);
    cfg.noise.enabled = false;
    let p = profile(2.2e7, -612.5, 0.73);
    let (_, truth) = run(one_sat_scene(cfg.clone(), p, NavData::None));
    assert_eq!(truth.len(), 50);
    for r in &truth {
        let want = -p.range_rate_at(r.t_s) / lambda;
        assert!(
            (r.doppler_hz - want).abs() <= 1e-12 * want.abs(),
            "t {}: {} vs {want}",
            r.t_s,
            r.doppler_hz
        );
        assert!((r.pseudorange_m - p.range_at(r.t_s)).abs() < 1e-7);
        let cp = -p.range_at(r.t_s) / lambda;
        assert!((r.carrier_phase_cycles - cp).abs() < 1e-6);
    }

    // Samples: measure the carrier rotation of a constant-rate signal. Squaring the
    // lag-one product removes the chip sign; its angle is twice the phase step.
    let rate = 433.0;
    let (iq, _) = run(one_sat_scene(cfg, profile(2.2e7, rate, 0.0), NavData::None));
    let mut acc = Cf64::default();
    for k in 0..iq.len() - 1 {
        let (a, b) = (iq[k + 1], iq[k]);
        let prod = Cf64::new(a.re * b.re + a.im * b.im, a.im * b.re - a.re * b.im);
        acc = acc + prod * prod;
    }
    let f = acc.im.atan2(acc.re) / 2.0 * FS / TAU;
    let want = -rate / lambda;
    assert!((f - want).abs() < 1e-3, "measured {f} Hz vs {want} Hz");
}

#[test]
fn clock_drift_moves_the_carrier_by_minus_drift_times_frequency() {
    let mut cfg = SceneConfig::new(spec(), 0.003);
    cfg.noise.enabled = false;
    cfg.clock = ReceiverClock {
        bias_s: 1e-4,
        drift_s_per_s: 2e-7,
    };
    let (_, truth) = run(one_sat_scene(cfg, profile(2.0e7, 0.0, 0.0), NavData::None));
    let want = -2e-7 * L1_HZ / (1.0 + 2e-7);
    for r in &truth {
        assert!(
            (r.doppler_hz - want).abs() < 1e-9,
            "{} vs {want}",
            r.doppler_hz
        );
        let tt = (r.t_s - 1e-4) / (1.0 + 2e-7);
        let p = 2.0e7 + C_M_PER_S * (1e-4 + 2e-7 * tt);
        assert!((r.pseudorange_m - p).abs() < 1e-6);
    }
}

#[test]
fn same_seed_is_bit_identical_and_a_different_seed_differs() {
    let mk = |seed: u64| {
        let mut cfg = SceneConfig::new(spec(), 0.004);
        cfg.seed = seed;
        let mut s = one_sat_scene(cfg, profile(2.1e7, 100.0, 0.0), NavData::Seeded { seed: 3 });
        s.add_satellite(
            SceneSatellite::gps_l1ca_profile(12, profile(2.3e7, -300.0, 0.1), None, NavData::None)
                .unwrap(),
        );
        run(s)
    };
    let (a, ta) = mk(11);
    let (b, tb) = mk(11);
    let (c, tc) = mk(12);
    assert_eq!(a, b);
    assert_eq!(ta, tb);
    assert_ne!(a, c);
    assert_eq!(ta, tc, "truth does not depend on the noise seed");
}

/// Closed form: complex noise of one-sided density `N0` sampled at `fs` has power
/// `N0 · fs`, which the default normalisation scales to 1.
#[test]
fn noise_power_is_n0_times_fs() {
    let cfg = SceneConfig::new(spec(), 0.08);
    let (iq, _) = run(Scene::new(cfg.clone()).unwrap());
    let p = iq.iter().map(|s| s.re * s.re + s.im * s.im).sum::<f64>() / iq.len() as f64;
    assert!((p - 1.0).abs() < 0.02, "normalised noise power {p}");
    let mean_re = iq.iter().map(|s| s.re).sum::<f64>() / iq.len() as f64;
    assert!(mean_re.abs() < 0.01);

    let mut raw = cfg;
    raw.noise.normalise = false;
    let n0fs = raw.noise.n0_w_per_hz() * FS;
    let (iq, _) = run(Scene::new(raw).unwrap());
    let p = iq.iter().map(|s| s.re * s.re + s.im * s.im).sum::<f64>() / iq.len() as f64;
    assert!(
        (p / n0fs - 1.0).abs() < 0.02,
        "raw noise power {p} vs {n0fs}"
    );
}

/// Closed form: `N0 = k T0` for a 0 dB noise figure behind a 290 K antenna, -203.98 dBW/Hz.
#[test]
fn noise_density_from_noise_figure() {
    let n = NoiseConfig::from_noise_figure(0.0, 290.0);
    assert!((n.n0_dbw_per_hz - 10.0 * (1.380_649e-23f64 * 290.0).log10()).abs() < 1e-12);
    assert!((n.n0_dbw_per_hz + 203.975).abs() < 1e-3);
    let n2 = NoiseConfig::from_noise_figure(3.0, 290.0);
    assert!((n2.n0_dbw_per_hz - n.n0_dbw_per_hz - 3.0).abs() < 1e-12);
}

/// A stateful channel (a phase that walks with every call), LNAV data and seeded data:
/// chunked and threaded output must equal one-shot output bit for bit.
#[test]
fn chunked_and_threaded_output_equals_one_shot_bit_for_bit() {
    let mk = |chunk: usize, threads: usize| {
        let mut cfg = SceneConfig::new(spec(), 0.025);
        cfg.start_tow_s = 7200.0 - 0.003;
        cfg.chunk_samples = chunk;
        cfg.threads = threads;
        cfg.truth_interval_s = 0.0007;
        let mut s = one_sat_scene(
            cfg,
            profile(2.1e7, 100.0, 0.0),
            NavData::Lnav {
                eph: Box::new(eph()),
                conv: LnavConventions::default(),
            },
        );
        s.add_satellite(
            SceneSatellite::gps_l1ca_profile(
                9,
                profile(2.0e7, -800.0, 0.2),
                Some(40.0),
                NavData::Seeded { seed: 5 },
            )
            .unwrap(),
        );
        let mut calls = 0u64;
        s.set_channel(Box::new(move |_id: u32, t: f64| {
            calls += 1;
            ChannelSnapshot {
                t_s: t,
                paths: vec![
                    direct_path(),
                    PathState {
                        group_delay_s: 2.0e-7,
                        carrier_phase_rad: 0.01 * calls as f64,
                        amplitude: 0.3,
                        extra_doppler_hz: 1.5,
                    },
                ],
            }
        }));
        run(s)
    };
    let total = (0.025 * FS) as usize;
    let (a, ta) = mk(total, 1);
    assert_eq!(a.len(), total);
    for (chunk, threads) in [(777, 1), (4096, 3), (10_000, 4)] {
        let (b, tb) = mk(chunk, threads);
        if let Some(k) = (0..a.len()).find(|&k| a[k] != b[k]) {
            panic!(
                "chunk {chunk} threads {threads}: sample {k} {:?} vs {:?}",
                a[k], b[k]
            );
        }
        assert_eq!(ta, tb, "truth differs at chunk {chunk}");
    }
}

#[test]
fn single_sample_reads_equal_block_reads() {
    let mk = || {
        let cfg = SceneConfig::new(spec(), 0.002);
        one_sat_scene(cfg, profile(2.1e7, 100.0, 0.0), NavData::Seeded { seed: 1 }).into_stream()
    };
    let mut whole = mk();
    let mut a = vec![Cf64::default(); 5000];
    assert_eq!(whole.read(&mut a).unwrap(), 5000);
    assert_eq!(whole.read(&mut a[..1]).unwrap(), 0);
    let mut one = mk();
    let mut b = Vec::new();
    let mut buf = [Cf64::default(); 1];
    while one.read(&mut buf).unwrap() == 1 {
        b.push(buf[0]);
    }
    assert_eq!(a, b);
    assert_eq!(whole.take_truth(), one.take_truth());
}

#[test]
fn two_coincident_paths_add_linearly() {
    let mut cfg = SceneConfig::new(spec(), 0.003);
    cfg.noise.enabled = false;
    let p = profile(2.1e7, 250.0, 0.0);
    let (direct, _) = run(one_sat_scene(cfg.clone(), p, NavData::None));
    let mut s = one_sat_scene(cfg, p, NavData::None);
    s.set_channel(Box::new(|_: u32, t: f64| ChannelSnapshot {
        t_s: t,
        paths: vec![
            direct_path(),
            PathState {
                amplitude: 0.5,
                ..direct_path()
            },
        ],
    }));
    let (two, _) = run(s);
    for (d, t) in direct.iter().zip(&two) {
        assert!((t.re - 1.5 * d.re).abs() < 1e-12 && (t.im - 1.5 * d.im).abs() < 1e-12);
    }
}

/// A path with group delay `τ` and carrier phase `−2π f τ` is the same signal as the
/// direct path of a satellite `c τ` further away.
#[test]
fn a_delayed_path_equals_a_longer_range() {
    let mut cfg = SceneConfig::new(spec(), 0.003);
    cfg.noise.enabled = false;
    let tau = 3.7e-7;
    let p = profile(2.1e7, 250.0, 0.0);
    let far = RangeProfile {
        range_m: p.range_m + C_M_PER_S * tau,
        ..p
    };
    let (want, _) = run(one_sat_scene(cfg.clone(), far, NavData::Seeded { seed: 2 }));
    let mut s = one_sat_scene(cfg, p, NavData::Seeded { seed: 2 });
    s.set_channel(Box::new(move |_: u32, t: f64| ChannelSnapshot {
        t_s: t,
        paths: vec![PathState {
            group_delay_s: tau,
            carrier_phase_rad: -TAU * L1_HZ * tau,
            amplitude: 1.0,
            extra_doppler_hz: 0.0,
        }],
    }));
    let (got, _) = run(s);
    let mut worst = 0.0f64;
    for (a, b) in want.iter().zip(&got) {
        worst = worst.max((a.re - b.re).abs()).max((a.im - b.im).abs());
    }
    // Sample amplitude is about 0.006; the residual (under 3e-6 cycles of phase) is the
    // rounding of a 1e8-cycle carrier phase computed two ways.
    assert!(worst < 1e-7, "worst difference {worst}");
}

#[test]
fn blocked_direct_path_and_low_satellites_generate_no_signal() {
    let mut cfg = SceneConfig::new(spec(), 0.002);
    cfg.noise.enabled = false;
    let low = RangeProfile {
        elevation_deg: 2.0,
        ..profile(2.4e7, 0.0, 0.0)
    };
    let (iq, truth) = run(one_sat_scene(cfg.clone(), low, NavData::None));
    assert!(iq.iter().all(|s| s.re == 0.0 && s.im == 0.0));
    assert!(truth.iter().all(|r| !r.visible));

    let mut s = one_sat_scene(cfg, profile(2.1e7, 0.0, 0.0), NavData::None);
    s.set_channel(Box::new(|_: u32, t: f64| ChannelSnapshot {
        t_s: t,
        paths: vec![PathState {
            amplitude: 0.0,
            ..direct_path()
        }],
    }));
    let (iq, truth) = run(s);
    assert!(iq.iter().all(|s| s.re == 0.0 && s.im == 0.0));
    assert!(truth.iter().all(|r| r.visible));
}

/// Independent reference: `gps_lnav::decode_fields` reads back every field from the frame
/// bits, every word passes its IS-GPS-200 parity, and subframes 4 and 5 carry their IDs.
#[test]
fn lnav_frame_bits_decode_and_pass_parity() {
    let e = eph();
    let conv = LnavConventions::default();
    let bits = lnav_frame_bits(&e, &conv, 7200.0).unwrap();
    assert_eq!(bits.len(), LNAV_FRAME_BITS);
    let words: Vec<u32> = bits
        .chunks(30)
        .map(|w| w.iter().fold(0u32, |a, &b| (a << 1) | b as u32))
        .collect();
    let mut prev = 0u32;
    for (i, &w) in words.iter().enumerate() {
        let d = source_data(w, prev);
        let re = encode_word(d, prev);
        assert_eq!(re & 0x3F, w & 0x3F, "parity of word {i}");
        if i % 10 == 0 {
            assert_eq!(d >> 16, 0x8B, "preamble of subframe {}", i / 10 + 1);
        }
        if i % 10 == 1 {
            assert_eq!((d >> 2) & 7, (i / 10 + 1) as u32, "subframe id");
            assert_eq!(d >> 7, 7200 / 6 + 1 + (i / 10) as u32, "HOW count");
        }
        prev = w;
    }
    let sf: [[u32; 10]; 3] = std::array::from_fn(|s| std::array::from_fn(|k| words[s * 10 + k]));
    let mut got = decode_fields(&sf, 0);
    let mut want = field_values(&e, &conv, 7200 / 6 + 1).unwrap();
    got.sort();
    want.sort();
    assert_eq!(got, want);
}

/// The data bits in the samples change only on 20-code-period boundaries and follow the
/// frame: correlating each code period of a noise-free LNAV scene against the truth replica
/// gives the bit signs of `lnav_frame_bits`.
#[test]
fn data_bits_in_the_samples_follow_the_lnav_frame() {
    let mut cfg = SceneConfig::new(spec(), 0.2);
    cfg.noise.enabled = false;
    cfg.start_tow_s = 7200.0;
    let p = profile(2.1e7, 0.0, 0.0); // static: code epochs stay fixed in the samples
    let (iq, truth) = run(one_sat_scene(
        cfg,
        p,
        NavData::Lnav {
            eph: Box::new(eph()),
            conv: LnavConventions::default(),
        },
    ));
    let code = CaCode::new(7).unwrap();
    // Bit edges arrive P/c after the bit start: the first whole code period starts at the
    // sample where the code phase wraps to 0.
    let cp0 = truth[0].code_phase_chips;
    let k_start = ((1023.0 - cp0) / 1.023e6 * FS).ceil() as usize;
    let carrier = truth[0].carrier_phase_cycles;
    let mut signs = Vec::new();
    let spp = (FS / 1000.0) as usize;
    let mut k = k_start;
    while k + spp <= iq.len() {
        let mut acc = 0.0;
        for (o, s) in iq[k..k + spp].iter().enumerate() {
            let t = (k + o) as f64 / FS;
            let chip = code.bipolar[((cp0 + 1.023e6 * t).floor().rem_euclid(1023.0)) as usize];
            let (sn, cs) = (TAU * carrier).sin_cos();
            acc += chip * (s.re * cs + s.im * sn);
        }
        signs.push(acc.signum());
        k += spp;
    }
    let bits = lnav_frame_bits(&eph(), &LnavConventions::default(), 7200.0).unwrap();
    let frame_prev = lnav_frame_bits(&eph(), &LnavConventions::default(), 7170.0).unwrap();
    let mut flips = 0;
    for (m, s) in signs.iter().enumerate() {
        // Transmit time (from the frame start) at the middle of the code period.
        let k_mid = k_start + m * spp + spp / 2;
        let t_tx = k_mid as f64 / FS - 2.1e7 / C_M_PER_S;
        let b = (t_tx / LNAV_BIT_S).floor() as i64;
        let bit = if b < 0 {
            frame_prev[(1500 + b) as usize]
        } else {
            bits[b as usize]
        };
        let want = if bit == 0 { 1.0 } else { -1.0 };
        assert_eq!(*s, want, "code period {m} (bit {b})");
        if m > 0 && signs[m - 1] != *s {
            flips += 1;
        }
    }
    assert!(
        signs.len() >= 190 && flips > 0,
        "{} periods, {flips} flips",
        signs.len()
    );
}

#[test]
fn trajectories_and_clock() {
    let w = Trajectory::Waypoints(vec![
        (0.0, [0.0, 0.0, 0.0]),
        (10.0, [10.0, 20.0, 0.0]),
        (20.0, [10.0, 20.0, 30.0]),
    ]);
    assert!(w.validate().is_ok());
    assert_eq!(w.position(-1.0), [0.0, 0.0, 0.0]);
    assert_eq!(w.position(5.0), [5.0, 10.0, 0.0]);
    assert_eq!(w.position(15.0), [10.0, 20.0, 15.0]);
    assert_eq!(w.position(25.0), [10.0, 20.0, 30.0]);
    assert_eq!(w.velocity(5.0), [1.0, 2.0, 0.0]);
    assert_eq!(w.velocity(15.0), [0.0, 0.0, 3.0]);
    assert_eq!(w.velocity(25.0), [0.0, 0.0, 0.0]);
    assert!(Trajectory::Waypoints(vec![]).validate().is_err());
    assert!(
        Trajectory::Waypoints(vec![(1.0, [0.0; 3]), (1.0, [1.0; 3])])
            .validate()
            .is_err()
    );
    let cv = Trajectory::ConstantVelocity {
        pos0: [1.0, 2.0, 3.0],
        vel: [0.5, 0.0, -1.0],
    };
    assert_eq!(cv.position(2.0), [2.0, 2.0, 1.0]);
    let clk = ReceiverClock {
        bias_s: 1e-3,
        drift_s_per_s: 1e-6,
    };
    let tt = clk.true_time(5.0);
    assert!((tt + clk.offset_at(tt) - 5.0).abs() < 1e-15);
}

#[test]
fn elevation_cn0_default_and_invalid_configs() {
    let m = ElevationCn0::default();
    assert_eq!(m.cn0_dbhz(90.0), 47.0);
    assert_eq!(m.cn0_dbhz(0.0), 35.0);
    assert_eq!(m.cn0_dbhz(-5.0), 35.0);
    assert!((m.cn0_dbhz(30.0) - 41.0).abs() < 1e-12);
    let mut c = SceneConfig::new(spec(), 1.0);
    c.geometry_rate_hz = 0.0;
    assert!(Scene::new(c).is_err());
    let mut c = SceneConfig::new(spec(), 1.0);
    c.threads = 0;
    assert!(Scene::new(c).is_err());
    assert!(
        SceneSatellite::gps_l1ca_profile(40, profile(2e7, 0.0, 0.0), None, NavData::None).is_err()
    );
}

#[test]
fn truth_round_trips_through_csv_and_json_exactly() {
    let cfg = SceneConfig::new(spec(), 0.003);
    let (_, truth) = run(one_sat_scene(
        cfg,
        profile(2.1e7, 123.456, 0.789),
        NavData::None,
    ));
    assert_eq!(truth.len(), 3);
    assert_eq!(truth_from_csv(&truth_to_csv(&truth)).unwrap(), truth);
    assert_eq!(
        truth_from_json(&truth_to_json(&truth).unwrap()).unwrap(),
        truth
    );
    let mut w = CsvTruthWriter::new(Vec::new());
    for r in &truth {
        w.record(r).unwrap();
    }
    w.finish().unwrap();
    let text = String::from_utf8(w.into_inner()).unwrap();
    assert_eq!(truth_from_csv(&text).unwrap(), truth);
    let mut j = JsonLinesTruthWriter::new(Vec::new());
    for r in &truth {
        j.record(r).unwrap();
    }
    let text = String::from_utf8(j.into_inner()).unwrap();
    let back: Vec<TruthRecord> = text
        .lines()
        .map(|l| serde_json::from_str(l).unwrap())
        .collect();
    assert_eq!(back, truth);
}

/// Bounded memory: after streaming a scene in chunks, only the knots of the current chunk
/// (plus one) are held.
#[test]
fn knot_window_stays_bounded_while_streaming() {
    let mut cfg = SceneConfig::new(spec(), 0.2);
    cfg.noise.enabled = false;
    let mut stream =
        one_sat_scene(cfg, profile(2.1e7, 10.0, 0.0), NavData::Seeded { seed: 4 }).into_stream();
    let mut buf = vec![Cf64::default(); 2500];
    let mut chunks = 0;
    while stream.read(&mut buf).unwrap() > 0 {
        chunks += 1;
        assert!(
            stream.windows[0].knots.len() <= 3,
            "{}",
            stream.windows[0].knots.len()
        );
        assert!(stream.take_truth().len() <= 1);
    }
    assert_eq!(chunks, 200);
}
