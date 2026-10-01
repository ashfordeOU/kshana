// SPDX-License-Identifier: AGPL-3.0-only
//! `lunar_vlbi_oracle`: writes the ANISE reference for `tests/lunar_vlbi_anise_oracle.rs`.
//!
//! For a lunar-surface beacon and three Earth VLBI baselines, at 25 hourly epochs of
//! 2024-01-01 UTC, it computes the near-field delay as the difference of two converged Newtonian
//! light times, every position from ANISE 0.10 (MPL-2.0, https://github.com/nyx-space/anise):
//!
//! * Earth and Moon from the JPL DE440 SPK (`de440s.bsp`);
//! * Earth orientation ITRF93 -> J2000 from `earth_latest_high_prec.bpc`;
//! * Moon orientation MOON_PA_DE440 -> J2000 from `moon_pa_de440_200625.bpc`.
//!
//! For station i at reception epoch t (the same t for both stations), the light time LT_i solves
//! `c LT_i = | E(t) + s_i(t) - E(t - LT_i) - M(t - LT_i) - b(t - LT_i) |` in the barycentric frame,
//! with E the Earth's barycentric position, s_i the station, M the Moon relative to the Earth and
//! b the beacon offset from the Moon's centre. `E(t) - E(t - LT)` is formed from ANISE's Earth
//! velocity and acceleration at t (the third-order term is below 1e-9 m), which keeps the
//! arithmetic geocentric and free of the 1e11 m barycentric cancellation. The delay is
//! `tau = LT_2 - LT_1`. No Shapiro term, no BCRS-to-GCRS scale transformation, no media.
//!
//! The partial of tau with respect to the beacon's J2000 position is a central difference with a
//! 1 km step per axis, re-converging both light times for each perturbed beacon.
//!
//! Inputs are stated in the code and repeated in the fixture's header. Run:
//!
//! ```sh
//! source ~/Code/kshana-oracles/env.sh
//! cargo run --release --bin lunar_vlbi_oracle > ../../tests/fixtures/lunar_vlbi_anise_oracle/anise_delays.csv
//! ```

use anise::constants::frames::{
    EARTH_ITRF93, EARTH_J2000, EME2000, MOON_J2000, MOON_PA_DE440_FRAME, SSB_J2000,
};
use anise::prelude::*;
use sha2::{Digest, Sha256};

const C: f64 = 299_792_458.0;
const WGS84_A: f64 = 6_378_137.0;
const WGS84_F: f64 = 1.0 / 298.257_223_563;
/// Kshana's mean lunar radius, the sphere the beacon's selenographic coordinates live on.
const R_MOON_M: f64 = 1_737_400.0;
/// Central-difference step for the beacon partials (m).
const FD_STEP_M: f64 = 1_000.0;

type V3 = [f64; 3];

/// (name, geodetic latitude deg, longitude deg, height m), WGS-84.
const STATIONS: [(&str, f64, f64, f64); 3] = [
    ("Goldstone", 40.4256, -116.8893, 1000.0),
    ("Canberra", -35.4014, 148.9819, 688.0),
    ("Madrid", 40.4314, -4.2481, 830.0),
];
/// Baselines as (station 1, station 2) indices: tau = LT(station 2) - LT(station 1).
const BASELINES: [(usize, usize); 3] = [(0, 1), (0, 2), (2, 1)];
/// Beacon selenographic latitude, longitude (deg) and height (m).
const BEACON: (f64, f64, f64) = (0.0, 0.0, 0.0);

fn sub(a: V3, b: V3) -> V3 {
    [a[0] - b[0], a[1] - b[1], a[2] - b[2]]
}
fn add(a: V3, b: V3) -> V3 {
    [a[0] + b[0], a[1] + b[1], a[2] + b[2]]
}
fn scale(a: V3, k: f64) -> V3 {
    [a[0] * k, a[1] * k, a[2] * k]
}
fn norm(a: V3) -> f64 {
    (a[0] * a[0] + a[1] * a[1] + a[2] * a[2]).sqrt()
}

fn geodetic_to_ecef(lat_deg: f64, lon_deg: f64, h: f64) -> V3 {
    let e2 = WGS84_F * (2.0 - WGS84_F);
    let (sl, cl) = lat_deg.to_radians().sin_cos();
    let (so, co) = lon_deg.to_radians().sin_cos();
    let n = WGS84_A / (1.0 - e2 * sl * sl).sqrt();
    [
        (n + h) * cl * co,
        (n + h) * cl * so,
        (n * (1.0 - e2) + h) * sl,
    ]
}

fn sha256_file(path: &str) -> String {
    let bytes = std::fs::read(path).unwrap_or_else(|e| panic!("read {path}: {e}"));
    let mut h = Sha256::new();
    h.update(&bytes);
    hex::encode(h.finalize())
}

fn env_path(var: &str) -> String {
    std::env::var(var)
        .unwrap_or_else(|_| panic!("{var} is not set: source ~/Code/kshana-oracles/env.sh"))
}

/// UT1-UTC (s) from IERS finals2000A.all (Bulletin A column), linear in MJD.
fn dut1_from_finals(text: &str, mjd: f64) -> f64 {
    let mut prev: Option<(f64, f64)> = None;
    for line in text.lines() {
        if line.len() < 68 {
            continue;
        }
        let (Ok(m), Ok(d)) = (
            line[7..15].trim().parse::<f64>(),
            line[58..68].trim().parse::<f64>(),
        ) else {
            continue;
        };
        if let Some((m0, d0)) = prev {
            if m0 <= mjd && mjd <= m {
                let mut dd = d - d0;
                // A leap second between the two rows shows as a 1 s jump; none occurs on 2024-01-01.
                assert!(
                    dd.abs() < 0.5,
                    "leap second inside the interpolation interval"
                );
                dd *= (mjd - m0) / (m - m0);
                return d0 + dd;
            }
        }
        prev = Some((m, d));
    }
    panic!("MJD {mjd} not covered by finals2000A.all");
}

struct Geometry<'a> {
    almanac: &'a Almanac,
}

impl Geometry<'_> {
    fn dcm(&self, from: Frame, to: Frame, epoch: Epoch) -> [[f64; 3]; 3] {
        let d = self.almanac.rotate(from, to, epoch).expect("rotation");
        let mut m = [[0.0; 3]; 3];
        for (i, row) in m.iter_mut().enumerate() {
            for (j, e) in row.iter_mut().enumerate() {
                *e = d.rot_mat[(i, j)];
            }
        }
        m
    }
    fn mat_vec(m: &[[f64; 3]; 3], v: V3) -> V3 {
        [
            m[0][0] * v[0] + m[0][1] * v[1] + m[0][2] * v[2],
            m[1][0] * v[0] + m[1][1] * v[1] + m[1][2] * v[2],
            m[2][0] * v[0] + m[2][1] * v[1] + m[2][2] * v[2],
        ]
    }
    /// (position m, velocity m/s) of `target` relative to `observer`, J2000 axes, geometric.
    fn state(&self, target: Frame, observer: Frame, epoch: Epoch) -> (V3, V3) {
        let s = self
            .almanac
            .translate(target, observer, epoch, None)
            .expect("translate");
        let r = s.radius_km;
        let v = s.velocity_km_s;
        (
            [r[0] * 1e3, r[1] * 1e3, r[2] * 1e3],
            [v[0] * 1e3, v[1] * 1e3, v[2] * 1e3],
        )
    }
    fn station_j2000(&self, ecef: V3, epoch: Epoch) -> V3 {
        Self::mat_vec(&self.dcm(EARTH_ITRF93, EARTH_J2000, epoch), ecef)
    }
    /// Beacon relative to the Earth's centre at emission epoch `te` (J2000, m), plus `pert`.
    fn beacon_geocentric(&self, body: V3, te: Epoch, frac_s: f64, pert: V3) -> V3 {
        let (m, vm) = self.state(MOON_J2000, EARTH_J2000, te);
        let b = Self::mat_vec(&self.dcm(MOON_PA_DE440_FRAME, EME2000, te), body);
        // `te` is rounded to hifitime's 1 ns; carry the remainder with the Moon's velocity.
        add(add(add(m, scale(vm, frac_s)), b), pert)
    }
    /// Converged Newtonian light time (s) from the beacon to a station received at `t`.
    fn light_time(&self, station_ecef: V3, body: V3, t: Epoch, pert: V3) -> f64 {
        let s = self.station_j2000(station_ecef, t);
        let (_, v_e) = self.state(EARTH_J2000, SSB_J2000, t);
        let (_, v_p) = self.state(EARTH_J2000, SSB_J2000, t + Unit::Second * 1.0);
        let (_, v_m) = self.state(EARTH_J2000, SSB_J2000, t - Unit::Second * 1.0);
        let a_e = scale(sub(v_p, v_m), 0.5);
        let mut lt = 1.28;
        for _ in 0..30 {
            let te = t - Unit::Second * lt;
            let lt_rounded = (t - te).to_seconds();
            let frac = lt_rounded - lt; // te(true) = te(rounded) + frac
            let d_e = sub(scale(v_e, lt), scale(a_e, 0.5 * lt * lt)); // E(t) - E(t - lt)
            let rb = self.beacon_geocentric(body, te, frac, pert);
            let next = norm(sub(add(d_e, s), rb)) / C;
            let done = (next - lt).abs() <= 1e-15;
            lt = next;
            if done {
                return lt;
            }
        }
        panic!("light time did not converge to 1e-15 s");
    }
}

fn main() {
    let de = env_path("KSHANA_ANISE_DE440S");
    let pa = env_path("KSHANA_ANISE_MOON_PA");
    let bpc = env_path("KSHANA_ANISE_BPC");
    let finals_path = format!("{}/data/iers/finals2000A.all", env_path("KSHANA_ORACLES"));
    let almanac = Almanac::new(&de)
        .and_then(|a| a.load(&pa))
        .and_then(|a| a.load(&bpc))
        .expect("load kernels");
    let g = Geometry { almanac: &almanac };
    let finals = std::fs::read_to_string(&finals_path).expect("finals2000A.all");

    let body = {
        let (la, lo, h) = BEACON;
        let r = R_MOON_M + h;
        let (sl, cl) = la.to_radians().sin_cos();
        let (so, co) = lo.to_radians().sin_cos();
        [r * cl * co, r * cl * so, r * sl]
    };
    let ecef: Vec<V3> = STATIONS
        .iter()
        .map(|s| geodetic_to_ecef(s.1, s.2, s.3))
        .collect();

    // Direction checks on the two rotations, so a transposed DCM cannot pass silently.
    let t_chk = Epoch::from_gregorian_utc_at_midnight(2024, 1, 1);
    let z = Geometry::mat_vec(&g.dcm(EARTH_ITRF93, EARTH_J2000, t_chk), [0.0, 0.0, 1.0]);
    assert!(
        z[2] > 0.9999,
        "ITRF93 pole must map near the J2000 pole: {z:?}"
    );
    let (m_chk, _) = g.state(MOON_J2000, EARTH_J2000, t_chk);
    let x_pa = Geometry::mat_vec(&g.dcm(MOON_PA_DE440_FRAME, EME2000, t_chk), [1.0, 0.0, 0.0]);
    let cosang = -(x_pa[0] * m_chk[0] + x_pa[1] * m_chk[1] + x_pa[2] * m_chk[2]) / norm(m_chk);
    assert!(
        cosang > 0.98,
        "the PA +X axis must point near the Earth: cos = {cosang}"
    );

    println!("# ANISE reference for tests/lunar_vlbi_anise_oracle.rs (generated by xval/anise-lunar-od/src/bin/lunar_vlbi_oracle.rs)");
    println!("# ANISE 0.10.1 (MPL-2.0). Kernels (SHA-256):");
    println!("#   de440s.bsp {}", sha256_file(&de));
    println!("#   moon_pa_de440_200625.bpc {}", sha256_file(&pa));
    println!("#   earth_latest_high_prec.bpc {}", sha256_file(&bpc));
    println!(
        "#   finals2000A.all {} (UT1-UTC, Bulletin A, for Kshana's input only)",
        sha256_file(&finals_path)
    );
    println!("# beacon selenographic (deg, deg, m) = {BEACON:?} on a {R_MOON_M} m sphere, in MOON_PA_DE440");
    for (i, s) in STATIONS.iter().enumerate() {
        println!("# station {i} {} WGS-84 ({}, {}, {})", s.0, s.1, s.2, s.3);
    }
    println!("# tau = LT(station b) - LT(station a), converged Newtonian light time, TDB seconds; partials by central difference, {FD_STEP_M} m step, J2000 beacon position");
    println!("# hour,jd_utc,dut1_s,a,b,lt_a_s,lt_b_s,tau_s,dtau_dx_s_per_m,dtau_dy_s_per_m,dtau_dz_s_per_m");

    for hour in 0..=24u32 {
        let t = Epoch::from_gregorian_utc_hms(2024, 1, 1, 0, 0, 0) + Unit::Hour * f64::from(hour);
        let jd_utc = 2_460_310.5 + f64::from(hour) / 24.0;
        let mjd = jd_utc - 2_400_000.5;
        let dut1 = dut1_from_finals(&finals, mjd);
        for &(a, b) in &BASELINES {
            let lt = |i: usize, p: V3| g.light_time(ecef[i], body, t, p);
            let lt_a = lt(a, [0.0; 3]);
            let lt_b = lt(b, [0.0; 3]);
            let tau = lt_b - lt_a;
            let mut grad = [0.0; 3];
            for (k, gk) in grad.iter_mut().enumerate() {
                let mut p = [0.0; 3];
                p[k] = FD_STEP_M;
                let plus = lt(b, p) - lt(a, p);
                p[k] = -FD_STEP_M;
                let minus = lt(b, p) - lt(a, p);
                *gk = (plus - minus) / (2.0 * FD_STEP_M);
            }
            println!(
                "{hour},{jd_utc:.10},{dut1:.7},{a},{b},{lt_a:.17e},{lt_b:.17e},{tau:.17e},{:.17e},{:.17e},{:.17e}",
                grad[0], grad[1], grad[2]
            );
        }
    }
}
