// SPDX-License-Identifier: AGPL-3.0-only
//! Oracle test for the matrix row "GNSS/INS sensor fusion", scoped to the loosely
//! coupled filter: Kshana's closed-loop 15-state error-state EKF
//! (`fusion::closed_loop::ClosedLoopInsGnss` around `fusion::gnss_ins_ekf::GnssInsEkf`)
//! against NaveGo's own loosely coupled filter on NaveGo's own real example dataset.
//!
//! # Pre-registration (fixed 2026-10-01T03:30Z, before the first comparison)
//!
//! * **Oracle (Library).** NaveGo v1.4 (tag `v1.4`, commit 24d9488,
//!   <https://github.com/rodralez/NaveGo>, LGPL-3.0), `ins-gnss/ins_gnss.m`, run as a
//!   tool under GNU Octave 11.1.0; never linked or copied into the crate.
//! * **Data.** NaveGo `examples/real-data/` (LGPL-3.0, part of the NaveGo repository): a
//!   21-minute land-vehicle drive, Ekinox IMU at 200 Hz, GNSS at 5 Hz, Ekinox reference
//!   trajectory at 1 Hz. Both filters read one derived input: groups of 10 IMU samples
//!   averaged to 20 Hz (groups end on the GNSS epochs) and rounded to float32
//!   (`tests/fixtures/gnss_ins_navego_dataset_oracle/`, see its `NOTICE.md`).
//! * **Kshana configuration.** Initial state as NaveGo (attitude `ini_align`, velocity and
//!   position from the first fix); NaveGo's static calibration subtracted from every IMU
//!   sample; isotropic sigmas and spectral densities mapped from NaveGo's per-axis values
//!   by root-mean-square (sigmas) or mean of squares (densities); a fix fused at every GNSS
//!   epoch after the first, referred to the IMU through the lever arm by the same transform
//!   NaveGo applies inside its measurement. Kshana has no ZUPT; NaveGo keeps its own.
//! * **Metric.** Each solution linearly interpolated at every reference epoch strictly
//!   inside it; north/east/down error with WGS-84 radii; horizontal RMS
//!   `sqrt(mean(N^2 + E^2))`, vertical RMS `sqrt(mean(D^2))`.
//! * **Tolerance (all four must hold).** (1) Kshana horizontal RMS <= 1.2 x NaveGo's;
//!   (2) Kshana vertical RMS <= 1.2 x NaveGo's; (3) over the epochs where NaveGo applied a
//!   position update, Kshana's 3-D position-innovation RMS <= 1.2 x NaveGo's; (4) the
//!   mean of `|nu_p|^2 / (tr P_pp(prior) + 3 sigma_pos^2)` over Kshana's updates <= 1.5.

use kshana::frames::Geodetic;
use kshana::fusion::closed_loop::ClosedLoopInsGnss;
use kshana::fusion::gnss_ins_ekf::{EkfNoise, GnssInsEkf};
use kshana::inertial::attitude::Quaternion;
use kshana::inertial::mechanization::{radii_of_curvature, NavState};
use std::path::PathBuf;

const RATIO_TOL: f64 = 1.2;
const NIS_TOL: f64 = 1.5;

fn fixture(name: &str) -> PathBuf {
    PathBuf::from(env!("CARGO_MANIFEST_DIR"))
        .join("tests/fixtures/gnss_ins_navego_dataset_oracle")
        .join(name)
}

fn read_csv(name: &str) -> Vec<Vec<f64>> {
    let text = std::fs::read_to_string(fixture(name)).expect("fixture file");
    text.lines()
        .skip(1)
        .filter(|l| !l.trim().is_empty())
        .map(|l| {
            l.split(',')
                .map(|v| v.trim().parse::<f64>().expect("number"))
                .collect()
        })
        .collect()
}

fn vec3(meta: &serde_json::Value, key: &str) -> [f64; 3] {
    let a = meta[key].as_array().expect(key);
    [
        a[0].as_f64().unwrap(),
        a[1].as_f64().unwrap(),
        a[2].as_f64().unwrap(),
    ]
}

fn rms3(v: [f64; 3]) -> f64 {
    ((v[0] * v[0] + v[1] * v[1] + v[2] * v[2]) / 3.0).sqrt()
}

fn mean_sq3(v: [f64; 3]) -> f64 {
    (v[0] * v[0] + v[1] * v[1] + v[2] * v[2]) / 3.0
}

fn mat_vec(m: [[f64; 3]; 3], v: [f64; 3]) -> [f64; 3] {
    [
        m[0][0] * v[0] + m[0][1] * v[1] + m[0][2] * v[2],
        m[1][0] * v[0] + m[1][1] * v[1] + m[1][2] * v[2],
        m[2][0] * v[0] + m[2][1] * v[1] + m[2][2] * v[2],
    ]
}

fn cross(a: [f64; 3], b: [f64; 3]) -> [f64; 3] {
    [
        a[1] * b[2] - a[2] * b[1],
        a[2] * b[0] - a[0] * b[2],
        a[0] * b[1] - a[1] * b[0],
    ]
}

/// Body-to-NED DCM from roll, pitch, yaw (the ZYX convention NaveGo's `euler2dcm` uses).
fn dcm_bn(roll: f64, pitch: f64, yaw: f64) -> [[f64; 3]; 3] {
    let (sr, cr) = roll.sin_cos();
    let (sp, cp) = pitch.sin_cos();
    let (sy, cy) = yaw.sin_cos();
    [
        [cp * cy, sr * sp * cy - cr * sy, cr * sp * cy + sr * sy],
        [cp * sy, sr * sp * sy + cr * cy, cr * sp * sy - sr * cy],
        [-sp, sr * cp, cr * cp],
    ]
}

/// The local tangent-plane projection `ClosedLoopInsGnss::ins_ned` documents: north,
/// east, down relative to the origin, scaled by the radii at the origin.
fn project(origin: Geodetic, p: Geodetic) -> [f64; 3] {
    let (rn, re) = radii_of_curvature(origin.lat_rad);
    let h = origin.alt_m;
    [
        (p.lat_rad - origin.lat_rad) * (rn + h),
        (p.lon_rad - origin.lon_rad) * (re + h) * origin.lat_rad.cos(),
        -(p.alt_m - origin.alt_m),
    ]
}

/// Horizontal and vertical RMS of a solution (lat, lon, h at the reference epochs)
/// against the reference trajectory, with WGS-84 radii at the reference point.
fn rms_vs_ref(sol: &[[f64; 3]], refp: &[[f64; 3]]) -> (f64, f64) {
    assert_eq!(sol.len(), refp.len());
    let (mut hs, mut vs) = (0.0, 0.0);
    for (s, r) in sol.iter().zip(refp) {
        let (rn, re) = radii_of_curvature(r[0]);
        let dn = (s[0] - r[0]) * (rn + r[2]);
        let de = (s[1] - r[1]) * (re + r[2]) * r[0].cos();
        let dd = -(s[2] - r[2]);
        hs += dn * dn + de * de;
        vs += dd * dd;
    }
    let n = sol.len() as f64;
    ((hs / n).sqrt(), (vs / n).sqrt())
}

#[test]
fn loosely_coupled_rms_within_1p2x_of_navego() {
    let meta: serde_json::Value =
        serde_json::from_str(&std::fs::read_to_string(fixture("meta.json")).expect("meta.json"))
            .expect("json");

    // IMU: float32 rows [wx wy wz fx fy fz].
    let bytes = std::fs::read(fixture("imu_20hz_f32.bin")).expect("imu bin");
    let floats: Vec<f64> = bytes
        .chunks_exact(4)
        .map(|c| f32::from_le_bytes([c[0], c[1], c[2], c[3]]) as f64)
        .collect();
    let imu: Vec<[f64; 6]> = floats
        .chunks_exact(6)
        .map(|r| [r[0], r[1], r[2], r[3], r[4], r[5]])
        .collect();
    let time = read_csv("imu_time.csv");
    let (t0, dt, rows) = (time[0][0], time[0][1], time[0][2] as usize);
    assert_eq!(imu.len(), rows, "IMU row count");

    let gnss = read_csv("gnss.csv"); // k,t,lat,lon,h,vn,ve,vd
    let refr = read_csv("ref.csv"); // t,lat,lon,h
    let navego_at_ref = read_csv("navego_at_ref.csv");
    let navego_innov = read_csv("navego_innov.csv"); // gnss_row(1-based),vn,ve,vd

    let stdm = vec3(&meta, "gnss_stdm");
    let stdv = vec3(&meta, "gnss_stdv");
    let larm = vec3(&meta, "gnss_larm");
    let ini = vec3(&meta, "imu_ini_align");
    let ini_err = vec3(&meta, "imu_ini_align_err");
    let ab_sta = vec3(&meta, "imu_ab_sta");
    let gb_sta = vec3(&meta, "imu_gb_sta");
    let ab_dyn = vec3(&meta, "imu_ab_dyn");
    let gb_dyn = vec3(&meta, "imu_gb_dyn");
    let ab_psd = vec3(&meta, "imu_ab_psd");
    let gb_psd = vec3(&meta, "imu_gb_psd");
    let ab_corr = vec3(&meta, "imu_ab_corr");
    let gb_corr = vec3(&meta, "imu_gb_corr");
    let arw = vec3(&meta, "imu_arw");
    let vrw = vec3(&meta, "imu_vrw");

    let sigma_pos = rms3(stdm);
    let sigma_vel = rms3(stdv);
    let noise = EkfNoise {
        vrw_psd: mean_sq3(vrw),
        arw_psd: mean_sq3(arw),
        accel_bias_rw_psd: mean_sq3(ab_psd),
        gyro_bias_rw_psd: mean_sq3(gb_psd),
        accel_bias_tau: (ab_corr[0] + ab_corr[1] + ab_corr[2]) / 3.0,
        gyro_bias_tau: (gb_corr[0] + gb_corr[1] + gb_corr[2]) / 3.0,
    };
    let ekf = GnssInsEkf::new(
        sigma_pos,
        sigma_vel,
        rms3(ini_err),
        rms3(ab_dyn),
        rms3(gb_dyn),
        noise,
    );
    let origin = Geodetic {
        lat_rad: gnss[0][2],
        lon_rad: gnss[0][3],
        alt_m: gnss[0][4],
    };
    let q0 = Quaternion::from_dcm(dcm_bn(ini[0], ini[1], ini[2]));
    let nav0 = NavState::new(q0, [gnss[0][5], gnss[0][6], gnss[0][7]], origin);
    let mut nav = ClosedLoopInsGnss::new(nav0, ekf);

    // GNSS fixes keyed by the IMU row they coincide with (the first fix seeds the state).
    let mut fix_at = vec![None; rows];
    for (j, g) in gnss.iter().enumerate().skip(1) {
        let k = g[0];
        assert!(k >= 0.0, "GNSS row {j} has no coinciding IMU row");
        fix_at[k as usize] = Some(j);
    }

    let mut sol_t = Vec::with_capacity(rows);
    let mut sol = Vec::with_capacity(rows);
    sol_t.push(t0);
    sol.push([origin.lat_rad, origin.lon_rad, origin.alt_m]);
    let mut innov_by_row = vec![None; gnss.len()];
    let mut nis_sum = 0.0;
    let mut n_updates = 0usize;

    for (k, s) in imu.iter().enumerate().skip(1) {
        let gyro = [s[0] - gb_sta[0], s[1] - gb_sta[1], s[2] - gb_sta[2]];
        let accel = [s[3] - ab_sta[0], s[4] - ab_sta[1], s[5] - ab_sta[2]];
        nav.propagate(gyro, accel, dt);
        if let Some(j) = fix_at[k] {
            let g = &gnss[j];
            let p_ant = project(
                origin,
                Geodetic {
                    lat_rad: g[2],
                    lon_rad: g[3],
                    alt_m: g[4],
                },
            );
            let c_bn = nav.nav.q.to_dcm();
            let l_n = mat_vec(c_bn, larm);
            let bg = nav.gyro_bias_estimate();
            let w_ib = [gyro[0] - bg[0], gyro[1] - bg[1], gyro[2] - bg[2]];
            let wl = mat_vec(c_bn, cross(w_ib, larm));
            let wie = nav.nav.omega_ie_n();
            let wen = nav.nav.omega_en_n();
            let w_in = [wie[0] + wen[0], wie[1] + wen[1], wie[2] + wen[2]];
            let wil = cross(w_in, l_n);
            let p_imu = [p_ant[0] - l_n[0], p_ant[1] - l_n[1], p_ant[2] - l_n[2]];
            let v_imu = [
                g[5] - wl[0] + wil[0],
                g[6] - wl[1] + wil[1],
                g[7] - wl[2] + wil[2],
            ];
            let ins = nav.ins_ned();
            let nu = [ins[0] - p_imu[0], ins[1] - p_imu[1], ins[2] - p_imu[2]];
            let nu2 = nu[0] * nu[0] + nu[1] * nu[1] + nu[2] * nu[2];
            nis_sum += nu2 / (nav.position_cov_trace() + 3.0 * sigma_pos * sigma_pos);
            n_updates += 1;
            innov_by_row[j] = Some(nu2);
            nav.fuse(p_imu, v_imu, sigma_pos, sigma_vel);
        }
        let p = nav.nav.p_llh;
        sol_t.push(t0 + k as f64 * dt);
        sol.push([p.lat_rad, p.lon_rad, p.alt_m]);
    }

    // Kshana's solution at the reference epochs strictly inside its span.
    let (t_first, t_last) = (sol_t[0], *sol_t.last().unwrap());
    let mut ks_at_ref = Vec::new();
    let mut ref_pts = Vec::new();
    for r in &refr {
        let t = r[0];
        if t <= t_first || t >= t_last {
            continue;
        }
        let i = (((t - t_first) / dt).floor() as usize).min(sol.len() - 2);
        let w = (t - sol_t[i]) / (sol_t[i + 1] - sol_t[i]);
        let a = sol[i];
        let b = sol[i + 1];
        ks_at_ref.push([
            a[0] + w * (b[0] - a[0]),
            a[1] + w * (b[1] - a[1]),
            a[2] + w * (b[2] - a[2]),
        ]);
        ref_pts.push([r[1], r[2], r[3]]);
    }
    assert_eq!(
        ks_at_ref.len(),
        navego_at_ref.len(),
        "both solutions must be scored on the same reference epochs"
    );
    let ng_at_ref: Vec<[f64; 3]> = navego_at_ref.iter().map(|r| [r[1], r[2], r[3]]).collect();

    let (ks_h, ks_v) = rms_vs_ref(&ks_at_ref, &ref_pts);
    let (ng_h, ng_v) = rms_vs_ref(&ng_at_ref, &ref_pts);

    // Innovations on the epochs where NaveGo applied a position update. Row 1 is
    // NaveGo's initialisation entry (it stores its prior sigmas there, not an
    // innovation), so the comparison starts at row 2, as its update loop does.
    let (mut ks_i, mut ng_i, mut n_i) = (0.0, 0.0, 0usize);
    for r in &navego_innov {
        let row1 = r[0] as usize;
        if row1 < 2 {
            continue;
        }
        let nu2 = innov_by_row[row1 - 1].expect("Kshana fused every epoch NaveGo did");
        ks_i += nu2;
        ng_i += r[1] * r[1] + r[2] * r[2] + r[3] * r[3];
        n_i += 1;
    }
    let ks_innov_rms = (ks_i / n_i as f64).sqrt();
    let ng_innov_rms = (ng_i / n_i as f64).sqrt();
    let nis_mean = nis_sum / n_updates as f64;

    eprintln!(
        "M008 NaveGo dataset oracle: {} reference epochs, {} Kshana updates, {} common position updates",
        ref_pts.len(),
        n_updates,
        n_i
    );
    eprintln!(
        "  horizontal RMS: Kshana {ks_h:.4} m, NaveGo {ng_h:.4} m, ratio {:.4} (<= {RATIO_TOL})",
        ks_h / ng_h
    );
    eprintln!(
        "  vertical RMS:   Kshana {ks_v:.4} m, NaveGo {ng_v:.4} m, ratio {:.4} (<= {RATIO_TOL})",
        ks_v / ng_v
    );
    eprintln!(
        "  position-innovation RMS: Kshana {ks_innov_rms:.4} m, NaveGo {ng_innov_rms:.4} m, ratio {:.4} (<= {RATIO_TOL})",
        ks_innov_rms / ng_innov_rms
    );
    eprintln!("  mean normalised position innovation: {nis_mean:.4} (<= {NIS_TOL})");

    // NaveGo's own RMS, recomputed here, must match the figure its generator printed.
    let meta_h = meta["navego_20hz_f32_horizontal_rms_m"].as_f64().unwrap();
    let meta_v = meta["navego_20hz_f32_vertical_rms_m"].as_f64().unwrap();
    assert!((ng_h - meta_h).abs() < 1e-3 && (ng_v - meta_v).abs() < 1e-3);

    assert!(
        ks_h <= RATIO_TOL * ng_h,
        "horizontal RMS ratio {}",
        ks_h / ng_h
    );
    assert!(
        ks_v <= RATIO_TOL * ng_v,
        "vertical RMS ratio {}",
        ks_v / ng_v
    );
    assert!(
        ks_innov_rms <= RATIO_TOL * ng_innov_rms,
        "innovation RMS ratio {}",
        ks_innov_rms / ng_innov_rms
    );
    assert!(nis_mean <= NIS_TOL, "mean normalised innovation {nis_mean}");
}
