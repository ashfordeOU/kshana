// SPDX-License-Identifier: AGPL-3.0-only
//! `kshana lunar-oem`: Moon-centred OEM frame conversion between ICRF and the DE440 lunar frames.

use kshana::lunar_frame::{icrf_to_moon_pa, try_icrf_to_moon_me_de440, try_icrf_to_moon_pa_de440};
use kshana::lunar_oem::{convert, convert_state, jd_tdb, Frame};
use kshana::oem::{parse_oem, OemFile, OemMetadata, OemSegment, OemStateLine};
use kshana::precession::{mat_vec, transpose};
use kshana::rinex::EpochUtc;
use std::process::Command;
use std::sync::atomic::{AtomicU64, Ordering::Relaxed};

static SEQ: AtomicU64 = AtomicU64::new(0);

/// 2024-03-01 00:00:00 TDB.
const JD: f64 = 2_460_370.5;

fn norm(v: [f64; 3]) -> f64 {
    (v[0] * v[0] + v[1] * v[1] + v[2] * v[2]).sqrt()
}

fn sub(a: [f64; 3], b: [f64; 3]) -> [f64; 3] {
    [a[0] - b[0], a[1] - b[1], a[2] - b[2]]
}

fn epoch(h: u32, m: u32) -> EpochUtc {
    EpochUtc {
        year: 2024,
        month: 3,
        day: 1,
        hour: h,
        minute: m,
        second: 0.0,
    }
}

/// A low lunar orbit (about 100 km altitude) sampled every 10 minutes, ICRF, Moon-centred.
fn orbit_oem(frame: &str, time_system: &str, center: &str) -> OemFile {
    let (r, n) = (1837.4_f64, 0.000_883_5_f64); // km, rad/s (circular, mu 4902.8 km^3/s^2)
    let states: Vec<OemStateLine> = (0..12)
        .map(|k| {
            let t = 600.0 * f64::from(k);
            let a = n * t;
            let i = 1.5_f64; // rad, near polar
            OemStateLine {
                epoch: epoch(k / 6, (k % 6) * 10),
                pos_km: [r * a.cos(), r * a.sin() * i.cos(), r * a.sin() * i.sin()],
                vel_km_s: [
                    -r * n * a.sin(),
                    r * n * a.cos() * i.cos(),
                    r * n * a.cos() * i.sin(),
                ],
            }
        })
        .collect();
    OemFile {
        version: "2.0".into(),
        creation_date: epoch(0, 0),
        originator: "TEST".into(),
        segments: vec![OemSegment {
            meta: OemMetadata {
                object_name: "LLO".into(),
                object_id: "LLO".into(),
                center_name: center.into(),
                ref_frame: frame.into(),
                time_system: time_system.into(),
                start: states[0].epoch,
                stop: states[states.len() - 1].epoch,
            },
            states,
        }],
    }
}

#[test]
fn round_trips_return_the_input() {
    let r = [1200.0, -800.0, 1100.0];
    let v = [0.9, 1.1, -0.4];
    for f in [Frame::MoonPa440, Frame::MoonMe] {
        let (r1, v1) = convert_state(Frame::Icrf, f, JD, r, v).unwrap();
        let (r2, v2) = convert_state(f, Frame::Icrf, JD, r1, v1).unwrap();
        assert!(norm(sub(r2, r)) < 1e-9, "{f:?}");
        assert!(norm(sub(v2, v)) < 1e-12, "{f:?}");
        // A rotation keeps the length of the position.
        assert!((norm(r1) - norm(r)).abs() < 1e-9);
    }
    let (a, _) = convert_state(Frame::MoonPa440, Frame::MoonMe, JD, r, v).unwrap();
    let (b, _) = convert_state(Frame::MoonMe, Frame::MoonPa440, JD, a, v).unwrap();
    assert!(norm(sub(b, r)) < 1e-9);
}

#[test]
fn a_point_fixed_on_the_moon_is_at_rest_in_the_body_frame() {
    // A surface point fixed in DE440 PA, written in ICRF with a velocity by a ±1 s difference
    // of its ICRF positions (a different step from the converter's ±60 s).
    let p_pa = [1737.4, 0.0, 0.0];
    let at = |jd: f64| mat_vec(&transpose(&try_icrf_to_moon_pa_de440(jd).unwrap()), p_pa);
    let d = 1.0 / 86_400.0;
    let r = at(JD);
    let (a, b) = (at(JD - d), at(JD + d));
    let v = [
        (b[0] - a[0]) / 2.0,
        (b[1] - a[1]) / 2.0,
        (b[2] - a[2]) / 2.0,
    ];
    // Equatorial speed of the lunar spin: about 2.6617e-6 rad/s x 1737.4 km = 4.62 m/s.
    assert!(
        (norm(v) * 1000.0 - 4.62).abs() < 0.05,
        "{} m/s",
        norm(v) * 1000.0
    );
    let (r_pa, v_pa) = convert_state(Frame::Icrf, Frame::MoonPa440, JD, r, v).unwrap();
    assert!(norm(sub(r_pa, p_pa)) < 1e-6, "{r_pa:?}");
    // The step of the ±1 s difference is limited by the Julian Date's resolution (about
    // 40 µs), so the residual is a fraction of a mm/s.
    assert!(norm(v_pa) < 1e-6, "{} km/s", norm(v_pa));
}

#[test]
fn me_and_pa_differ_by_the_naif_de440_offset() {
    // MOON_ME_DE440_ME421 is a constant rotation from DE440 PA (moon_de440_220930.tf): the
    // angle of R_me * R_paᵀ is sqrt(67.8526² + 78.6944² + 0.2785²) ≈ 103.9″ for small angles.
    for jd in [JD, JD + 400.0, 2_458_000.5] {
        let pa = try_icrf_to_moon_pa_de440(jd).unwrap();
        let me = try_icrf_to_moon_me_de440(jd).unwrap();
        let m = {
            let pt = transpose(&pa);
            let mut out = [[0.0; 3]; 3];
            for i in 0..3 {
                for j in 0..3 {
                    out[i][j] = (0..3).map(|k| me[i][k] * pt[k][j]).sum();
                }
            }
            out
        };
        let trace = m[0][0] + m[1][1] + m[2][2];
        let angle = ((trace - 1.0) / 2.0).clamp(-1.0, 1.0).acos().to_degrees() * 3600.0;
        let want = (67.8526_f64.powi(2) + 78.6944_f64.powi(2) + 0.2785_f64.powi(2)).sqrt();
        assert!((angle - want).abs() < 0.01, "{angle} arcsec");
    }
}

#[test]
fn de440_pa_agrees_with_the_analytic_pa_to_arcseconds() {
    // The analytic IAU series with the DE421 offset is documented as 6″ to 8″ from DE440 PA.
    let a = icrf_to_moon_pa(JD);
    let b = try_icrf_to_moon_pa_de440(JD).unwrap();
    let x = mat_vec(&a, [1.0, 0.0, 0.0]);
    let y = mat_vec(&b, [1.0, 0.0, 0.0]);
    let ang = norm(sub(x, y)).asin().to_degrees() * 3600.0;
    assert!(ang < 15.0, "{ang} arcsec");
}

#[test]
fn time_systems_are_read_as_tdb() {
    let e = epoch(0, 0);
    assert_eq!(jd_tdb(&e, "TDB").unwrap(), JD);
    // UTC 2024: TT - UTC = 37 + 32.184 s; TDB - TT under 2 ms.
    let d = (jd_tdb(&e, "UTC").unwrap() - JD) * 86_400.0;
    assert!((d - 69.184).abs() < 0.002, "{d}");
    let g = (jd_tdb(&e, "GPS").unwrap() - JD) * 86_400.0;
    assert!((g - 51.184).abs() < 0.002, "{g}");
    assert!(jd_tdb(&e, "TCL").is_err());
    assert!(jd_tdb(&e, "LTC").is_err());
}

#[test]
fn a_whole_file_converts_and_reads_back() {
    let oem = orbit_oem("ICRF", "TDB", "MOON");
    let c = convert(&oem, Frame::MoonPa440).unwrap();
    let text = c.to_oem_string();
    assert!(text.contains("REF_FRAME = MOON_PA440"));
    assert!(text.contains("COMMENT kshana lunar-oem: MODELLED conversion from ICRF to MOON_PA440"));
    assert!(text.contains("MOON_ME_DE440_ME421"));
    let back = parse_oem(&text).unwrap();
    let c2 = convert(&back, Frame::Icrf).unwrap();
    for (a, b) in oem.segments[0]
        .states
        .iter()
        .zip(&c2.oem.segments[0].states)
    {
        // The text keeps 1 mm and 1e-9 km/s.
        assert!(norm(sub(a.pos_km, b.pos_km)) < 2e-6);
        assert!(norm(sub(a.vel_km_s, b.vel_km_s)) < 3e-9);
        // The orbital radius does not change with the frame.
        assert_eq!(a.epoch, b.epoch);
    }
}

#[test]
fn unsupported_inputs_are_refused() {
    assert!(convert(&orbit_oem("ICRF", "TDB", "EARTH"), Frame::MoonPa440).is_err());
    assert!(convert(&orbit_oem("EME2000", "TDB", "MOON"), Frame::MoonPa440).is_err());
    assert!(convert(&orbit_oem("ICRF", "LTC", "MOON"), Frame::MoonPa440).is_err());
    let mut late = orbit_oem("ICRF", "TDB", "MOON");
    for s in &mut late.segments[0].states {
        s.epoch.year = 2035;
    }
    assert!(convert(&late, Frame::MoonPa440).is_err());
    // ICRF to ICRF is allowed anywhere: no orientation is needed.
    assert!(convert(&late, Frame::Icrf).is_ok());
}

#[test]
fn the_crate_s_own_lunar_export_is_read_with_a_note() {
    // lunar_interop writes MOON_PA without a DE number; it is read as DE440 PA, and said so.
    let mut oem = orbit_oem("MOON_PA", "UTC", "MOON");
    oem.segments[0].meta.ref_frame = "MOON_PA".into();
    let c = convert(&oem, Frame::Icrf).unwrap();
    assert!(c
        .to_oem_string()
        .contains("MOON_PA names no DE; read as DE440 PA"));
}

#[test]
fn the_command_line_converts_a_file() {
    let dir = std::env::temp_dir().join(format!(
        "kshana-lunar-oem-{}-{}",
        std::process::id(),
        SEQ.fetch_add(1, Relaxed)
    ));
    std::fs::create_dir_all(&dir).unwrap();
    let input = dir.join("in.oem");
    std::fs::write(&input, orbit_oem("ICRF", "UTC", "MOON").to_oem_string()).unwrap();
    let out = dir.join("out.oem");
    let run = |args: &[&str]| {
        Command::new(env!("CARGO_BIN_EXE_kshana"))
            .args(args)
            .output()
            .unwrap()
    };
    let o = run(&[
        "lunar-oem",
        "convert",
        input.to_str().unwrap(),
        "--to",
        "MOON_ME",
        "--out",
        out.to_str().unwrap(),
    ]);
    assert!(o.status.success(), "{}", String::from_utf8_lossy(&o.stderr));
    let back = parse_oem(&std::fs::read_to_string(&out).unwrap()).unwrap();
    assert_eq!(back.segments[0].meta.ref_frame, "MOON_ME");
    assert_eq!(back.segments[0].states.len(), 12);
    let f = run(&["lunar-oem", "frames"]);
    assert_eq!(
        String::from_utf8_lossy(&f.stdout),
        "ICRF\nMOON_PA440\nMOON_ME\n"
    );
    assert_eq!(
        run(&[
            "lunar-oem",
            "convert",
            input.to_str().unwrap(),
            "--to",
            "EME2000"
        ])
        .status
        .code(),
        Some(2)
    );
    assert_eq!(
        run(&["lunar-oem", "convert", input.to_str().unwrap()])
            .status
            .code(),
        Some(2)
    );
    assert_eq!(
        run(&["lunar-oem", "convert", "/nonexistent.oem", "--to", "ICRF"])
            .status
            .code(),
        Some(2)
    );
    let _ = std::fs::remove_dir_all(&dir);
}
