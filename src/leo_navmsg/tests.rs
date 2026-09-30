// SPDX-License-Identifier: AGPL-3.0-only
//! Tests of the `leo-navmsg` kind: fitter, user algorithm, trade, continuity, encodings.

use super::elements::*;
use super::fit::*;
use super::sisre::*;
use super::truth::*;
use super::*;

fn orbit(gravity: usize, alt_km: f64, drag: f64, dur: f64) -> TruthOrbit {
    TruthOrbit::propagate(&OrbitConfig {
        altitude_m: alt_km * 1e3,
        inclination_rad: 97.4f64.to_radians(),
        eccentricity: 0.001,
        raan_rad: 0.3,
        arg_perigee_rad: 1.0,
        mean_anomaly_rad: 0.2,
        gravity_degree: gravity,
        cd_area_over_mass: drag,
        theta0_rad: 0.4,
        epoch: SysTime::new(2438, 86_400.0),
        duration_s: dur,
        step_s: 5.0,
    })
    .unwrap()
}

fn free_clock(dur: f64) -> TruthClock {
    TruthClock::new(
        ClockConfig::Free {
            bias_s: 2e-5,
            drift: 1e-11,
            drift_rate: 0.0,
            adev_1s: 1e-12,
            seed: 3,
        },
        dur,
    )
    .unwrap()
}

fn template() -> LeoNavMessage {
    let scn = LeoNavmsgScenario::default();
    scn.resolve().unwrap().template
}

fn stats_over(
    o: &TruthOrbit,
    c: Option<&TruthClock>,
    kind: ModelKind,
    start_dt: f64,
    len: f64,
) -> (ErrorStats, LeoNavMessage) {
    let start = o.epoch.plus(start_dt);
    let f = fit_message(o, c, kind, &start, len, 5.0).unwrap();
    let mut m = template();
    m.week = f.week;
    m.clock = f.clock;
    m.ephemeris = f.ephemeris;
    let w = sisre_weights(EARTH_RADIUS_M + 550e3, 0.0);
    let mut acc = StatsAcc::default();
    accumulate(&mut acc, &w, o, c, &m, &start, len, 2.5);
    (acc.finish(), m)
}

#[test]
fn a_two_body_truth_is_recovered_by_the_keplerian_fit_to_a_millimetre() {
    let o = orbit(0, 550.0, 0.0, 1400.0);
    let (st, _) = stats_over(&o, None, ModelKind::Kepler16, 100.0, 900.0);
    assert!(
        st.pos3d_max_m < 1e-3,
        "two-body fit leaves {:.2e} m",
        st.pos3d_max_m
    );
}

#[test]
fn the_user_algorithm_reproduces_the_fitted_truth_to_a_millimetre_with_corrections() {
    // J2-J6 truth, 60 s fit: the Keplerian set plus corrections represents it to < 1 mm.
    let o = orbit(6, 550.0, 0.0, 400.0);
    let (st, _) = stats_over(
        &o,
        None,
        ModelKind::KeplerRac { degrees: [7, 5, 6] },
        60.0,
        60.0,
    );
    assert!(st.pos3d_max_m < 1e-3, "{:.2e} m", st.pos3d_max_m);
}

#[test]
fn the_clock_fit_returns_the_truth_clock_through_the_user_relativistic_term() {
    let o = orbit(6, 550.0, 0.0, 700.0);
    let c = free_clock(700.0);
    let (st, m) = stats_over(
        &o,
        Some(&c),
        ModelKind::KeplerRac { degrees: [7, 5, 6] },
        60.0,
        300.0,
    );
    assert!(m.clock.is_some());
    // White-FM noise at 1e-12 over 300 s leaves millimetres; the polynomial does the rest.
    assert!(st.clock_rms_m < 0.01, "clock RMS {:.4} m", st.clock_rms_m);
}

#[test]
fn keplerian_sisre_grows_with_the_fit_interval_and_the_corrections_fix_it() {
    // Averaged over 30 minutes of consecutive messages, so one lucky window cannot
    // reorder the curve.
    let o = orbit(12, 550.0, 0.005, 2900.0);
    let w = sisre_weights(EARTH_RADIUS_M + 550e3, 0.0);
    let start = o.epoch.plus(480.0);
    let intervals = [60.0, 180.0, 300.0, 600.0, 900.0];
    let run = |kind: ModelKind, l: f64| {
        sequence_stats(
            &o,
            None,
            kind,
            true,
            &template(),
            &w,
            &start,
            1800.0,
            l,
            l,
            5.0,
            5.0,
        )
        .unwrap()
        .0
        .sisre_orb_rms_m
    };
    let kep: Vec<f64> = intervals
        .iter()
        .map(|&l| run(ModelKind::Kepler16, l))
        .collect();
    let rac: Vec<f64> = intervals
        .iter()
        .map(|&l| run(ModelKind::KeplerRac { degrees: [7, 5, 6] }, l))
        .collect();
    for k in 1..intervals.len() {
        assert!(
            kep[k] > kep[k - 1],
            "Keplerian SISRE must grow with the interval: {kep:?}"
        );
    }
    assert!(rac[4] * 3.0 < kep[4], "corrections: {rac:?} vs {kep:?}");
    assert!(
        rac.iter().zip(&kep).all(|(r, k)| r <= k),
        "{rac:?} vs {kep:?}"
    );
}

#[test]
fn liu22_beats_the_16_parameter_set_over_a_20_minute_arc() {
    let o = orbit(20, 550.0, 0.005, 1500.0);
    let k16 = stats_over(&o, None, ModelKind::Kepler16, 60.0, 1200.0)
        .0
        .sisre_orb_rms_m;
    let l22 = stats_over(&o, None, ModelKind::Liu22, 60.0, 1200.0)
        .0
        .sisre_orb_rms_m;
    assert!(l22 < k16, "liu22 {l22} vs kepler16 {k16}");
}

#[test]
fn the_ecef_polynomial_fits_a_minute_to_millimetres() {
    let o = orbit(20, 500.0, 0.005, 300.0);
    let (st, m) = stats_over(&o, None, ModelKind::EcefPoly { degree: 6 }, 60.0, 60.0);
    assert!(m.clock.is_none());
    assert!(st.pos3d_max_m < 0.005, "{:.4} m", st.pos3d_max_m);
}

#[test]
fn every_model_round_trips_through_the_binary_frame() {
    let o = orbit(12, 550.0, 0.005, 1500.0);
    let c = free_clock(1500.0);
    for kind in [
        ModelKind::Kepler16,
        ModelKind::KeplerRac { degrees: [5, 2, 4] },
        ModelKind::Liu22,
        ModelKind::EcefPoly { degree: 6 },
    ] {
        let len = if matches!(kind, ModelKind::EcefPoly { .. }) {
            60.0
        } else {
            600.0
        };
        let clock = if matches!(kind, ModelKind::EcefPoly { .. }) {
            None
        } else {
            Some(&c)
        };
        let (_, m) = stats_over(&o, clock, kind, 60.0, len);
        let frame = codec::encode(&m).unwrap();
        let back = codec::decode(&frame).unwrap();
        assert_eq!(back.ephemeris.code(), m.ephemeris.code());
        // Services come back on the ICD grid: within half a step of what was sent.
        let (ks, kb) = (
            m.services.klobuchar.unwrap(),
            back.services.klobuchar.unwrap(),
        );
        assert!((ks.alpha[0] - kb.alpha[0]).abs() <= 0.5 * 2f64.powi(-30));
        assert!((ks.beta[3] - kb.beta[3]).abs() <= 0.5 * 2f64.powi(16));
        let (ns, nb) = (m.services.nequick.unwrap(), back.services.nequick.unwrap());
        assert!(
            (ns.ai0 - nb.ai0).abs() <= 0.125 && (ns.ai2 - nb.ai2).abs() <= 0.5 * 2f64.powi(-15)
        );
        let (us, ub) = (m.services.utc.unwrap(), back.services.utc.unwrap());
        assert!((us.a0 - ub.a0).abs() <= 0.5 * 2f64.powi(-30));
        assert_eq!(
            (us.dt_ls, us.wn_ot, us.wn_lsf, us.dn),
            (ub.dt_ls, ub.wn_ot, ub.wn_lsf, ub.dn)
        );
        let start = o.epoch.plus(60.0);
        let mut dp: f64 = 0.0;
        let mut dc: f64 = 0.0;
        for k in 0..=20 {
            let t = start.plus(len * k as f64 / 20.0);
            let (a, b) = (sat_state(&m, &t), sat_state(&back, &t));
            dp = dp.max(norm(sub(a.pos, b.pos)));
            dc = dc.max((a.clock_s - b.clock_s).abs() * C_LIGHT);
        }
        assert!(
            dp < 2e-3,
            "{}: quantisation moved the position {dp:.2e} m",
            kind.code()
        );
        assert!(
            dc < 2e-3,
            "{}: quantisation moved the clock {dc:.2e} m",
            kind.code()
        );
        // Re-encoding the decoded message is bit-identical.
        assert_eq!(codec::encode(&back).unwrap(), frame);
        // A flipped bit is caught by the CRC.
        let mut bad = frame.clone();
        bad[7] ^= 0x01;
        assert!(codec::decode(&bad).unwrap_err().contains("CRC"));
    }
}

#[test]
fn every_field_of_the_budget_stays_under_a_millimetre() {
    let o = orbit(12, 550.0, 0.005, 1200.0);
    let c = free_clock(1200.0);
    let (_, m) = stats_over(
        &o,
        Some(&c),
        ModelKind::KeplerRac { degrees: [5, 2, 4] },
        60.0,
        900.0,
    );
    let (rows, qp, qc) = codec::quantisation_budget(&m, &o.epoch.plus(60.0), 900.0, 10.0).unwrap();
    for r in &rows {
        assert!(
            r.half_lsb_pos_m < 1e-3 && r.half_lsb_clock_m < 1e-3,
            "{} half-step moves {:.2e} m / {:.2e} m",
            r.field,
            r.half_lsb_pos_m,
            r.half_lsb_clock_m
        );
    }
    assert!(qp < 3e-3 && qc < 2e-3, "{qp} {qc}");
}

#[test]
fn rinex_and_csv_round_trips() {
    let o = orbit(12, 550.0, 0.005, 1500.0);
    let c = free_clock(1500.0);
    let mut msgs = Vec::new();
    for kind in [
        ModelKind::Kepler16,
        ModelKind::KeplerRac { degrees: [5, 2, 4] },
        ModelKind::Liu22,
        ModelKind::EcefPoly { degree: 6 },
    ] {
        let len = if matches!(kind, ModelKind::EcefPoly { .. }) {
            60.0
        } else {
            300.0
        };
        msgs.push(stats_over(&o, Some(&c), kind, 60.0, len).1);
    }
    let txt = text::rinex_export(&msgs);
    assert!(txt.contains("> EPH L04 KRAC"));
    assert!(txt.contains("NOT PART OF RINEX 4.02"));
    let back = text::rinex_import(&txt).unwrap();
    assert_eq!(back.len(), msgs.len());
    let t = o.epoch.plus(90.0);
    for (a, b) in msgs.iter().zip(&back) {
        let (sa, sb) = (sat_state(a, &t), sat_state(b, &t));
        assert!(norm(sub(sa.pos, sb.pos)) < 1e-4, "{}", a.ephemeris.code());
        assert!((sa.clock_s - sb.clock_s).abs() * C_LIGHT < 1e-4);
        assert_eq!(
            (a.svid, a.iod, a.week, a.health),
            (b.svid, b.iod, b.week, b.health)
        );
    }
    let schema = text::default_schema([5, 2, 4]);
    let csv = text::csv_export(&msgs[1..2], &schema).unwrap();
    assert!(csv.starts_with("SVID,IOD,Band,WeekNumber,ToW"));
    let cb = text::csv_import(&csv, &schema).unwrap();
    assert_eq!(cb[0].ephemeris, msgs[1].ephemeris);
    assert_eq!(cb[0].clock, msgs[1].clock);
    assert!(text::csv_export(&msgs[3..4], &schema).is_err());
}

#[test]
fn a_mid_pass_update_is_continuous() {
    let src = r#"
kind = "leo-navmsg"
analysis = ["midpass-update"]
[orbit]
gravity_degree = 12
[message]
model = "kepler-rac"
fit_interval_s = 300
update_period_s = 150
[midpass]
user_lon_deg = -34.0
search_s = 7200
threshold_m = 0.05
"#;
    let scn: LeoNavmsgScenario = toml::from_str(src).unwrap();
    let (doc, _, _, _) = scn.compute().unwrap();
    let mp = &doc["midpass_update"];
    let sw = mp["switches"].as_array().unwrap();
    assert!(!sw.is_empty(), "the pass must contain at least one switch");
    assert_eq!(mp["continuity_pass"], true, "{mp}");
    for s in sw {
        let j = s["range_jump_m"].as_f64().unwrap();
        let before = s["range_error_before_m"].as_f64().unwrap();
        let after = s["range_error_after_m"].as_f64().unwrap();
        // The jump is exactly the change in range error, new minus old.
        assert!((j - (after - before)).abs() < 1e-6);
    }
}

#[test]
fn a_keplerian_only_update_over_a_long_interval_is_flagged() {
    let src = r#"
kind = "leo-navmsg"
analysis = ["midpass-update"]
[orbit]
gravity_degree = 12
[message]
model = "kepler16"
fit_interval_s = 900
update_period_s = 150
[midpass]
user_lon_deg = -34.0
search_s = 7200
threshold_m = 0.001
"#;
    let scn: LeoNavmsgScenario = toml::from_str(src).unwrap();
    let (doc, _, _, _) = scn.compute().unwrap();
    assert_eq!(doc["midpass_update"]["continuity_pass"], false);
}

#[test]
fn defaults_run_encode_decode_without_any_preset_and_are_deterministic() {
    let src = "kind = \"leo-navmsg\"\nanalysis = [\"encode-decode\"]\n";
    let scn: LeoNavmsgScenario = toml::from_str(src).unwrap();
    let a = scn.run_all().unwrap();
    let b = scn.run_all().unwrap();
    assert_eq!(a.0, b.0, "same scenario and seed must give the same JSON");
    let doc: serde_json::Value = serde_json::from_str(&a.0).unwrap();
    assert!(doc["preset"].is_null());
    assert_eq!(doc["encode_decode"]["corrupted_frame_rejected"], true);
    assert_eq!(
        doc["encode_decode"]["crc24q_check_value_123456789"],
        "0xCDE703"
    );
    assert!(a.3.is_some(), "the CSV table is emitted");
}

#[test]
fn bad_inputs_are_refused() {
    for (src, want) in [
        (
            "kind = \"leo-navmsg\"\npreset = \"nope\"\n",
            "unknown preset",
        ),
        (
            "kind = \"leo-navmsg\"\nanalysis = [\"x\"]\n",
            "unknown analysis",
        ),
        (
            "kind = \"leo-navmsg\"\n[message]\nmodel = \"sp3\"\n",
            "unknown ephemeris model",
        ),
        (
            "kind = \"leo-navmsg\"\n[message]\nfit_interval_s = 100\nupdate_period_s = 200\n",
            "update_period_s",
        ),
        (
            "kind = \"leo-navmsg\"\n[orbit]\naltitude_km = 50\n",
            "altitude",
        ),
        ("kind = \"leo-navmsg\"\n[message]\nsvid = 0\n", "svid"),
    ] {
        let scn: LeoNavmsgScenario = toml::from_str(src).unwrap();
        let e = scn.run_all().unwrap_err();
        assert!(e.contains(want), "{src:?} gave {e:?}");
    }
}

#[test]
fn every_preset_resolves_and_the_atomic_preset_selects_the_zero_clock_polynomial() {
    for p in presets::all() {
        let scn = LeoNavmsgScenario {
            preset: Some(p.key.to_string()),
            ..Default::default()
        };
        let r = scn.resolve().unwrap();
        assert!((r.orbit.altitude_m - p.altitude_km * 1e3).abs() < 1e-6);
    }
    let scn = LeoNavmsgScenario {
        preset: Some("atomic".to_string()),
        ..Default::default()
    };
    let r = scn.resolve().unwrap();
    assert_eq!(r.model.code(), "ecef-poly");
    assert!(r.zero_clock);
    assert_eq!(r.update_period_s, 30.0);
}

#[test]
fn worst_case_jump_bounds_every_line_of_sight() {
    let sat = [7e6, 0.0, 0.0];
    let d = [0.01, 0.02, -0.005];
    let eta = 60f64.to_radians();
    let wc = worst_case_jump(d, 0.003, sat, eta);
    // Sample the cone.
    let mut best: f64 = 0.0;
    for i in 0..=40 {
        for j in 0..72 {
            let th = eta * i as f64 / 40.0;
            let ph = std::f64::consts::TAU * j as f64 / 72.0;
            let e = [th.cos(), th.sin() * ph.cos(), th.sin() * ph.sin()];
            best = best.max((dot(e, d) - 0.003).abs());
        }
    }
    assert!(wc >= best - 1e-12 && wc < best + 1e-4, "{wc} vs {best}");
}

#[test]
fn the_binary_frame_carries_equatorial_and_twenty_minute_fits() {
    // Fits the field ranges once refused: an equatorial orbit's 16-parameter set over
    // 15 minutes (deltaN about 1.7e-6 semicircle/s, the J2 drift of the argument of
    // latitude that a node-less orbit folds into the mean motion), and the Liu et al.
    // 22-parameter model over the paper's 20-minute arc at 300 km (aDot about 18 m/s) and
    // 510 km (nDot about 1.7e-10 semicircle/s^2) and at 800 km on an equatorial orbit
    // (deltaN about 2.3e-5 semicircle/s).
    for (alt, inc, model, fit) in [
        (510.0, 0.0, "kepler16", 900.0),
        (300.0, 97.6, "liu22", 1200.0),
        (510.0, 97.6, "liu22", 1200.0),
        (800.0, 0.0, "liu22", 1200.0),
    ] {
        let src = format!(
            "kind = \"leo-navmsg\"\nanalysis = [\"encode-decode\"]\n[orbit]\naltitude_km = {alt}\n\
             inclination_deg = {inc}\ngravity_degree = 20\n[message]\nmodel = \"{model}\"\n\
             fit_interval_s = {fit}\n"
        );
        let scn: LeoNavmsgScenario = toml::from_str(&src).unwrap();
        let (doc, _, _, _) = scn
            .compute()
            .unwrap_or_else(|e| panic!("{alt} km {inc} deg {model} {fit} s: {e}"));
        let ed = &doc["encode_decode"];
        assert_eq!(ed["corrupted_frame_rejected"], true);
        let q = ed["quantised_max_pos_m"].as_f64().unwrap();
        assert!(q < 3e-3, "{alt} km {inc} deg {model}: quantised {q} m");
    }
}

// ── Platform independence ─────────────────────────────────────────────────────────────
//
// A frame is transmitted integers. It has to be the same integers wherever and however
// the scenario is run: the native binary on any operating system, a debug build or a
// release build, and the WebAssembly build in a browser. It once was none of these. The
// scenario below encoded to check value `0x110315` in a release build on aarch64 macOS,
// `0x898BD8` in a debug build of the same source on the same machine, and `0x6A82D9` in
// the browser.
//
// * Between platforms: the fit starts from osculating elements that come out of an `acos`
//   and an `atan2`, which two mathematics libraries round differently in the last place.
// * Between build profiles: an optimised build on macOS merges a sine and a cosine of one
//   argument into a single call to the system's combined routine, whose sine is not always
//   the lone `sin`'s; an unoptimised build makes the two calls.
// * In the clock: the normal sampler of `rand_distr` calls the host `exp` and `ln` in its
//   rare branches, and about one draw in a million differs in the last bit.
//
// Eighty Levenberg–Marquardt iterations turn a difference that small into different
// quantised fields. The kind now computes every transcendental and every normal deviate
// with `crate::portable_math`. These tests keep it so. They run in the ordinary
// (unoptimised) test profile; the release binary and the WebAssembly package were checked
// to give the same result document, byte for byte, for all five bundled scenarios.

/// The whole encoded frame of `scenarios/leo-navmsg-encode-decode.toml`, as hexadecimal.
/// Deliberately asserted on every platform, with no baseline-host gate: the claim is that
/// neither the host nor the build profile matters. The same bytes were read back from a
/// debug build, a release build and the WebAssembly build.
const ENCODE_DECODE_FRAME_HEX: &str = "\
     A7120A400400004C30A91A78A965000A7CBFC00050CA022C42A5941CBAF3B4402DFE200A4ACFABF8\
     01687EA568ACF15210809D49AD9FF116E3003E1307F5167FEE07303C6DAA0BF9C17FDEC9C0065318\
     02CA85EE8FFFE040009200378FFF819FF3F80016C5002077FF811FFFFFFFFFFFFFFFFC0000700000\
     FFFFEE000074000CAFFFBD7FF693001A9401688FFD4D833FFFC08E7CBF840F285A06E40000000040\
     0000424310D35C4819105F";

#[test]
fn the_encoded_frame_is_the_same_bytes_on_every_platform() {
    let scn: LeoNavmsgScenario = toml::from_str(include_str!(
        "../../scenarios/leo-navmsg-encode-decode.toml"
    ))
    .unwrap();
    let (doc, _, _, _) = scn.compute().unwrap();
    let ed = &doc["encode_decode"];
    assert_eq!(ed["frame_hex"], ENCODE_DECODE_FRAME_HEX);
    assert_eq!(ed["crc24q"], "0x19105F");
    assert_eq!(ed["frame_bytes"], 171);

    // One frame per ephemeris model on the same orbit, by its check value.
    for (model, extra, crc) in [
        ("kepler16", "", "0x50D072"),
        ("kepler-rac", "rac_degrees = [7, 5, 6]\n", "0x19105F"),
        ("liu22", "", "0x62373A"),
        (
            "ecef-poly",
            "poly_degree = 6\nfit_interval_s = 60\nupdate_period_s = 60\n",
            "0x4FDFC9",
        ),
    ] {
        let src = format!(
            "kind = \"leo-navmsg\"\nseed = 14\nanalysis = [\"encode-decode\"]\n[orbit]\n\
             altitude_km = 550.0\ninclination_deg = 97.6\ngravity_degree = 20\n[message]\n\
             model = \"{model}\"\n{extra}"
        );
        let scn: LeoNavmsgScenario = toml::from_str(&src).unwrap();
        let (doc, _, _, _) = scn.compute().unwrap();
        assert_eq!(doc["encode_decode"]["crc24q"], crc, "model {model}");
    }
}

/// Every source file of the kind, read from disk so a new file is scanned without being
/// listed here. `tests.rs` is left out: a test may compare against the host library.
fn kind_sources() -> Vec<(String, String)> {
    fn walk(dir: &std::path::Path, out: &mut Vec<(String, String)>) {
        let mut entries: Vec<_> = std::fs::read_dir(dir)
            .unwrap_or_else(|e| panic!("cannot list {}: {e}", dir.display()))
            .map(|e| e.unwrap().path())
            .collect();
        entries.sort();
        for p in entries {
            if p.is_dir() {
                walk(&p, out);
            } else if p.extension().is_some_and(|x| x == "rs")
                && p.file_name().is_some_and(|n| n != "tests.rs")
            {
                let text = std::fs::read_to_string(&p).unwrap();
                out.push((p.display().to_string(), text));
            }
        }
    }
    let mut out = Vec::new();
    let root = std::path::Path::new(env!("CARGO_MANIFEST_DIR")).join("src/leo_navmsg");
    walk(&root, &mut out);
    out
}

/// The inherent `f64` methods whose result depends on the host's mathematics library.
const PLATFORM_METHODS: [&str; 27] = [
    "sin", "cos", "tan", "asin", "acos", "atan", "atan2", "sin_cos", "sinh", "cosh", "tanh",
    "asinh", "acosh", "atanh", "exp", "exp2", "exp_m1", "ln", "ln_1p", "log", "log2", "log10",
    "powf", "powi", "hypot", "cbrt", "gamma",
];

/// Every other module of the crate this kind reaches, each one read and found to be either
/// free of host-dependent mathematics on the path taken or a `_portable` entry point. A new
/// name fails the scan until it has been read the same way and added.
const REVIEWED_CRATE_PATHS: [&str; 16] = [
    "crate::portable_math::PortableFloat",
    "crate::portable_math",
    "crate::gravity_sh::SphericalHarmonicField",
    "crate::egm2008_data::EGM2008_NMAX",
    "crate::forces::EARTH_ZONALS_J2_J6",
    "crate::forces::two_body_accel",
    "crate::forces::zonal_accel_portable",
    "crate::forces::drag_accel_portable",
    "crate::forces::j2_secular_rates_portable",
    "crate::gnss_sim::KlobucharCoeffs",
    "crate::gnss_sim::klobuchar_delay_m_portable",
    "crate::rinex::parse_d",
    "crate::solar_system::units_block_from",
    "crate::chart::frame_open",
    "crate::chart::panel_axes",
    "crate::celeste_iod::navmsg",
];

/// The host-dependent calls in one source text, as `line: what`.
fn platform_calls(text: &str) -> Vec<String> {
    let is_ident = |c: char| c.is_ascii_alphanumeric() || c == '_';
    let mut found = Vec::new();
    for (n, line) in text.lines().enumerate() {
        let code = line.trim_start();
        if code.starts_with("//") {
            continue;
        }
        for m in PLATFORM_METHODS {
            for call in [format!(".{m}("), format!("f64::{m}(")] {
                if code.contains(&call) {
                    found.push(format!("{}: `{call}` is the host library's", n + 1));
                }
            }
        }
        if code.contains("rand_distr") {
            found.push(format!(
                "{}: `rand_distr` samplers call the host `exp` and `ln` in their rare branches; \
                 use `portable_math::standard_normal`",
                n + 1
            ));
        }
        if code.contains(".acceleration(") {
            found.push(format!(
                "{}: `.acceleration(` is the host-library gravity field; use `.acceleration_portable(`",
                n + 1
            ));
        }
        let mut rest = code;
        while let Some(at) = rest.find("crate::") {
            let tail = &rest[at..];
            let end = tail
                .char_indices()
                .find(|&(_, c)| !(is_ident(c) || c == ':'))
                .map_or(tail.len(), |(i, _)| i);
            let path = tail[..end].trim_end_matches(':');
            let own = path.starts_with("crate::leo_navmsg");
            if !own && !REVIEWED_CRATE_PATHS.contains(&path) {
                found.push(format!("{}: `{path}` has not been reviewed", n + 1));
            }
            rest = &tail[end..];
        }
    }
    found
}

#[test]
fn the_kind_never_calls_the_host_mathematics_library() {
    let sources = kind_sources();
    // The scan must see the files that do the work, or a clean result means nothing.
    for must in [
        "truth.rs",
        "fit.rs",
        "elements.rs",
        "codec.rs",
        "mod.rs",
        "sisre.rs",
    ] {
        assert!(
            sources.iter().any(|(p, _)| p.ends_with(must)),
            "the scan did not find {must}"
        );
    }
    let mut all = Vec::new();
    for (path, text) in &sources {
        for f in platform_calls(text) {
            all.push(format!("{path}:{f}"));
        }
    }
    assert!(
        all.is_empty(),
        "host-dependent mathematics in the navigation-message kind:\n{}",
        all.join("\n")
    );
}

#[test]
fn the_scan_for_host_mathematics_sees_what_it_is_meant_to() {
    // A scan that matches nothing reads as clean, so it is shown the things it must catch.
    let bad = "let a = x.sin();\nlet b = (y / z).atan2(w);\nlet c = f64::exp(q);\n\
               let g = field.acceleration(r);\nlet d = crate::forces::zonal_accel(r, jn);\n\
               let e = crate::frames::gmst(t);\n// a comment may say x.cos() freely\n\
               use rand_distr::{Distribution, Normal};\n";
    let found = platform_calls(bad);
    assert_eq!(found.len(), 7, "{found:?}");
    // And it does not mistake the portable spellings for the host ones.
    let good = "let a = x.psin();\nlet b = y.patan2(w);\nlet c = q.pexp().plog10();\n\
                let g = field.acceleration_portable(r);\nlet s = v.sqrt().abs().round();\n\
                let d = crate::forces::zonal_accel_portable(r, jn);\n\
                let t = crate::leo_navmsg::text::calendar(w, s);\n";
    assert!(
        platform_calls(good).is_empty(),
        "{:?}",
        platform_calls(good)
    );
}
