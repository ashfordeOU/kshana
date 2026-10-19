// SPDX-License-Identifier: AGPL-3.0-only
//! The reference orbit of the lunar-infrastructure studies and its geometry: a CR3BP orbit (a 9:2
//! southern NRHO from the crate's own differential corrector, or an ELFO-like Moon-centred
//! ellipse) with its state-transition matrix at every sample, and the maps from the rotating
//! frame to the Earth-centred inertial frame the ground stations and GNSS satellites live in.
//!
//! Stated simplifications (`xval/lunar-infra/PREREGISTRATION.md`): Earth and Moon point masses on
//! a circular orbit, no Sun, no lunar gravity harmonics; the Earth's rotation axis is the
//! Earth-Moon orbit normal; the inertial frame coincides with the rotating frame at `t = 0`.

use serde::{Deserialize, Serialize};

use crate::cr3bp::{
    cr3bp_accel, differential_correct_halo, propagate_state_stm, Cr3bpState, EARTH_MOON_DIST_KM,
    EARTH_MOON_MU, MOON_RADIUS_KM, SIDEREAL_MONTH_DAYS,
};
use crate::portable_math::PortableFloat;

/// The CR3BP length unit, metres (one Earth-Moon distance).
pub const L_M: f64 = EARTH_MOON_DIST_KM * 1000.0;
/// The CR3BP time unit, seconds (the rotating frame turns one radian per unit).
pub const T_UNIT_S: f64 = SIDEREAL_MONTH_DAYS * 86_400.0 / std::f64::consts::TAU;
/// Mean lunar radius, metres.
pub const R_MOON_M: f64 = MOON_RADIUS_KM * 1000.0;
/// Speed of light, m/s.
pub const C_M_S: f64 = 299_792_458.0;
/// Earth's inertial rotation rate, rad/s.
pub const OMEGA_EARTH: f64 = 7.292_115_9e-5;

/// Orbit section of a `lunar-infrastructure` scenario.
#[derive(Clone, Debug, Default, Deserialize, Serialize)]
#[serde(deny_unknown_fields)]
pub struct OrbitSpec {
    /// `nrho` (default) or `elfo`.
    pub family: Option<String>,
    /// NRHO seed `x` (rotating-frame units), default 1.0220.
    pub x0: Option<f64>,
    /// NRHO seed `z`, default -0.1800.
    pub z0: Option<f64>,
    /// NRHO seed `ydot`, default -0.1020.
    pub vy0: Option<f64>,
    /// ELFO perilune altitude, km (default 500).
    pub perilune_alt_km: Option<f64>,
    /// ELFO apolune altitude, km (default 10000).
    pub apolune_alt_km: Option<f64>,
    /// ELFO inclination to the Earth-Moon plane, degrees (default 56).
    pub inc_deg: Option<f64>,
    /// Arc length, days (default 3).
    pub arc_days: Option<f64>,
    /// Arc lengths, days (the carrier-phase study sweeps them).
    pub arcs_days: Option<Vec<f64>>,
    /// Sample interval, seconds (default 600).
    pub sample_s: Option<f64>,
}

/// A reference orbit sampled with its state-transition matrix from the arc start.
#[derive(Clone, Debug)]
pub struct RefOrbit {
    /// Sample times, seconds from the arc start.
    pub t_s: Vec<f64>,
    /// Rotating-frame states (normalised units) at the samples.
    pub x: Vec<[f64; 6]>,
    /// State-transition matrices from the arc start to each sample.
    pub phi: Vec<[[f64; 6]; 6]>,
    /// Orbital period in seconds (NRHO only).
    pub period_s: Option<f64>,
    /// Family name.
    pub family: String,
}

fn matmul6(a: &[[f64; 6]; 6], b: &[[f64; 6]; 6]) -> [[f64; 6]; 6] {
    let mut c = [[0.0; 6]; 6];
    for i in 0..6 {
        for k in 0..6 {
            for j in 0..6 {
                c[i][j] += a[i][k] * b[k][j];
            }
        }
    }
    c
}

fn to_arr(s: &Cr3bpState) -> [f64; 6] {
    [s.r[0], s.r[1], s.r[2], s.v[0], s.v[1], s.v[2]]
}

fn from_arr(x: &[f64; 6]) -> Cr3bpState {
    Cr3bpState {
        r: [x[0], x[1], x[2]],
        v: [x[3], x[4], x[5]],
    }
}

impl OrbitSpec {
    /// The family name in use.
    pub fn family(&self) -> &str {
        self.family.as_deref().unwrap_or("nrho")
    }

    /// The sample interval, seconds.
    pub fn sample_s(&self) -> f64 {
        self.sample_s.unwrap_or(600.0)
    }

    /// The initial rotating-frame state and the period (NRHO).
    pub fn initial(&self) -> Result<([f64; 6], Option<f64>), String> {
        match self.family() {
            "nrho" => {
                let guess = Cr3bpState {
                    r: [self.x0.unwrap_or(1.0220), 0.0, self.z0.unwrap_or(-0.1800)],
                    v: [0.0, self.vy0.unwrap_or(-0.1020), 0.0],
                };
                let orb = differential_correct_halo(&guess, EARTH_MOON_MU, 1e-11, 80)
                    .ok_or("the NRHO differential correction did not converge from the seed")?;
                Ok((to_arr(&orb.ic), Some(orb.period * T_UNIT_S)))
            }
            "elfo" => {
                let rp = (R_MOON_M + self.perilune_alt_km.unwrap_or(500.0) * 1e3) / L_M;
                let ra = (R_MOON_M + self.apolune_alt_km.unwrap_or(10_000.0) * 1e3) / L_M;
                if !(rp > 0.0 && ra > rp) {
                    return Err("elfo needs 0 < perilune altitude < apolune altitude".into());
                }
                let inc = self.inc_deg.unwrap_or(56.0).to_radians();
                let a = 0.5 * (rp + ra);
                let vp = (EARTH_MOON_MU * (2.0 / rp - 1.0 / a)).sqrt();
                // Perilune toward the Earth; Moon-centred velocity `vp` tilted by `inc` out of the
                // Earth-Moon plane. Rotating-frame velocity = Moon-centred velocity - z x p.
                let p = [-rp, 0.0, 0.0];
                let (si, ci) = inc.psin_cos();
                let v_rel = [0.0, vp * ci, vp * si];
                let zxp = [-p[1], p[0], 0.0];
                Ok((
                    [
                        1.0 - EARTH_MOON_MU + p[0],
                        p[1],
                        p[2],
                        v_rel[0] - zxp[0],
                        v_rel[1] - zxp[1],
                        v_rel[2] - zxp[2],
                    ],
                    None,
                ))
            }
            other => Err(format!("unknown orbit family `{other}`: nrho or elfo")),
        }
    }

    /// Sample the orbit for `arc_days` with the state-transition matrix.
    pub fn build(&self, arc_days: f64) -> Result<RefOrbit, String> {
        let dt_s = self.sample_s();
        if !(dt_s > 0.0 && arc_days > 0.0) {
            return Err("sample_s and arc_days must be positive".into());
        }
        let n = ((arc_days * 86_400.0 / dt_s).round() as usize).max(2);
        let (x0, period_s) = self.initial()?;
        let dt_nd = dt_s / T_UNIT_S;
        let mut t_s = vec![0.0];
        let mut x = vec![x0];
        let mut id = [[0.0; 6]; 6];
        for (i, row) in id.iter_mut().enumerate() {
            row[i] = 1.0;
        }
        let mut phi = vec![id];
        for k in 1..=n {
            let (s1, p1) = propagate_state_stm(&from_arr(&x[k - 1]), EARTH_MOON_MU, dt_nd, SUBSTEPS);
            x.push(to_arr(&s1));
            phi.push(matmul6(&p1, &phi[k - 1]));
            t_s.push(k as f64 * dt_s);
        }
        Ok(RefOrbit {
            t_s,
            x,
            phi,
            period_s,
            family: self.family().to_string(),
        })
    }
}

/// Runge-Kutta sub-steps per sample interval.
pub const SUBSTEPS: usize = 24;

/// Propagate the CR3BP from `x0` with a constant extra acceleration `accel_nd` (normalised units,
/// rotating frame) and return the states at the same samples as [`RefOrbit`].
pub fn propagate_with_accel(x0: &[f64; 6], n: usize, dt_s: f64, accel_nd: [f64; 3]) -> Vec<[f64; 6]> {
    let h = dt_s / T_UNIT_S / SUBSTEPS as f64;
    let f = |s: &[f64; 6]| -> [f64; 6] {
        let a = cr3bp_accel([s[0], s[1], s[2]], [s[3], s[4], s[5]], EARTH_MOON_MU);
        [
            s[3],
            s[4],
            s[5],
            a[0] + accel_nd[0],
            a[1] + accel_nd[1],
            a[2] + accel_nd[2],
        ]
    };
    let axpy = |s: &[f64; 6], k: &[f64; 6], c: f64| -> [f64; 6] {
        let mut o = *s;
        for i in 0..6 {
            o[i] += c * k[i];
        }
        o
    };
    let mut out = vec![*x0];
    let mut s = *x0;
    for _ in 0..n {
        for _ in 0..SUBSTEPS {
            let k1 = f(&s);
            let k2 = f(&axpy(&s, &k1, h / 2.0));
            let k3 = f(&axpy(&s, &k2, h / 2.0));
            let k4 = f(&axpy(&s, &k3, h));
            for i in 0..6 {
                s[i] += h / 6.0 * (k1[i] + 2.0 * k2[i] + 2.0 * k3[i] + k4[i]);
            }
        }
        out.push(s);
    }
    out
}

/// Position and velocity in the Earth-centred inertial frame, SI.
#[derive(Clone, Copy, Debug)]
pub struct Kin {
    /// Position, m.
    pub r: [f64; 3],
    /// Velocity, m/s.
    pub v: [f64; 3],
}

/// Rotate `v` about `z` by `theta`.
pub fn rot_z(theta: f64, v: [f64; 3]) -> [f64; 3] {
    let (s, c) = theta.psin_cos();
    [c * v[0] - s * v[1], s * v[0] + c * v[1], v[2]]
}

/// The inertial kinematics of a rotating-frame state at time `t_s` since the arc start.
pub fn inertial_from_rot(x: &[f64; 6], t_s: f64) -> Kin {
    let theta = t_s / T_UNIT_S;
    let p = [x[0] + EARTH_MOON_MU, x[1], x[2]];
    let v_nd = [x[3] - p[1], x[4] + p[0], x[5]];
    let vs = L_M / T_UNIT_S;
    Kin {
        r: rot_z(theta, [p[0] * L_M, p[1] * L_M, p[2] * L_M]),
        v: rot_z(theta, [v_nd[0] * vs, v_nd[1] * vs, v_nd[2] * vs]),
    }
}

/// Partials of the inertial position (m per normalised unit) and velocity (m/s per normalised
/// unit) at `t_s` with respect to the arc-start state, from the state-transition matrix.
pub fn d_inertial_dx0(phi: &[[f64; 6]; 6], t_s: f64) -> ([[f64; 6]; 3], [[f64; 6]; 3]) {
    let theta = t_s / T_UNIT_S;
    let vs = L_M / T_UNIT_S;
    let mut dr = [[0.0; 6]; 3];
    let mut dv = [[0.0; 6]; 3];
    for j in 0..6 {
        let pr = [phi[0][j] * L_M, phi[1][j] * L_M, phi[2][j] * L_M];
        let rr = rot_z(theta, pr);
        // v_I = Rz (L/T) (v_rot + z x p), z x p = (-p_y, p_x, 0).
        let pv = [
            (phi[3][j] - phi[1][j]) * vs,
            (phi[4][j] + phi[0][j]) * vs,
            phi[5][j] * vs,
        ];
        let vr = rot_z(theta, pv);
        for i in 0..3 {
            dr[i][j] = rr[i];
            dv[i][j] = vr[i];
        }
    }
    (dr, dv)
}

/// Moon centre in the Earth-centred inertial frame at `t_s`, metres.
pub fn moon_inertial(t_s: f64) -> [f64; 3] {
    rot_z(t_s / T_UNIT_S, [L_M, 0.0, 0.0])
}

/// A ground station in the Earth-fixed frame (ITRF93, metres).
#[derive(Clone, Copy, Debug)]
pub struct Station {
    /// Name.
    pub name: &'static str,
    /// Earth-fixed position, m.
    pub ecef_m: [f64; 3],
}

/// The three 70 m Deep Space Network stations (positions from the NAIF generic kernel
/// comments `earthstns_fx_*.cmt`, ITRF93, citing DSN document 810-005 module 301).
pub const DSN_STATIONS: [Station; 3] = [
    Station {
        name: "DSS-14",
        ecef_m: [-2_353_621.420, -4_641_341.472, 3_677_052.318],
    },
    Station {
        name: "DSS-63",
        ecef_m: [4_849_092.518, -360_180.348, 4_115_109.251],
    },
    Station {
        name: "DSS-43",
        ecef_m: [-4_460_894.917, 2_682_361.507, -3_674_748.152],
    },
];

/// A station's inertial kinematics at `t_s` for an Earth rotation phase `phase_rad` at `t = 0`.
pub fn station_inertial(st: &Station, t_s: f64, phase_rad: f64) -> Kin {
    let ang = phase_rad + OMEGA_EARTH * t_s;
    let r = rot_z(ang, st.ecef_m);
    Kin {
        r,
        v: [-OMEGA_EARTH * r[1], OMEGA_EARTH * r[0], 0.0],
    }
}

/// Euclidean norm.
pub fn norm(v: [f64; 3]) -> f64 {
    (v[0] * v[0] + v[1] * v[1] + v[2] * v[2]).sqrt()
}

/// `a - b`.
pub fn sub(a: [f64; 3], b: [f64; 3]) -> [f64; 3] {
    [a[0] - b[0], a[1] - b[1], a[2] - b[2]]
}

/// Dot product.
pub fn dot(a: [f64; 3], b: [f64; 3]) -> f64 {
    a[0] * b[0] + a[1] * b[1] + a[2] * b[2]
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn the_nrho_builds_with_a_period_in_the_92_regime_and_an_identity_stm_at_the_start() {
        let o = OrbitSpec::default().build(1.0).unwrap();
        let days = o.period_s.unwrap() / 86_400.0;
        assert!((6.0..=7.2).contains(&days), "{days}");
        assert_eq!(o.phi[0][2][2], 1.0);
        assert_eq!(o.t_s.len(), o.x.len());
    }

    #[test]
    fn the_stm_predicts_the_response_to_a_small_state_offset() {
        let spec = OrbitSpec::default();
        let o = spec.build(1.0).unwrap();
        let k = o.x.len() - 1;
        let mut x0 = o.x[0];
        let dx = [1e-7, -2e-7, 1.5e-7, 3e-7, -1e-7, 2e-7];
        for i in 0..6 {
            x0[i] += dx[i];
        }
        let pert = propagate_with_accel(&x0, k, spec.sample_s(), [0.0; 3]);
        for i in 0..6 {
            let pred: f64 = (0..6).map(|j| o.phi[k][i][j] * dx[j]).sum();
            let got = pert[k][i] - o.x[k][i];
            assert!((got - pred).abs() < 1e-3 * got.abs().max(1e-9), "{i}: {got} {pred}");
        }
    }

    #[test]
    fn the_inertial_partials_match_a_finite_difference_of_the_map() {
        let o = OrbitSpec::default().build(0.5).unwrap();
        let k = 20;
        let (dr, dv) = d_inertial_dx0(&o.phi[k], o.t_s[k]);
        // The map x(t) -> inertial is linear in x(t); perturb the state at t and compare.
        let mut x = o.x[k];
        let base = inertial_from_rot(&x, o.t_s[k]);
        let e = 1e-3;
        for j in 0..6 {
            let mut dx0 = [0.0; 6];
            dx0[j] = e;
            let dxt: Vec<f64> = (0..6)
                .map(|i| (0..6).map(|c| o.phi[k][i][c] * dx0[c]).sum())
                .collect();
            for i in 0..6 {
                x[i] = o.x[k][i] + dxt[i];
            }
            let p = inertial_from_rot(&x, o.t_s[k]);
            for i in 0..3 {
                assert!(((p.r[i] - base.r[i]) / e - dr[i][j]).abs() < 1e-2, "r {i} {j}");
                assert!(((p.v[i] - base.v[i]) / e - dv[i][j]).abs() < 1e-5, "v {i} {j}");
            }
        }
    }

    #[test]
    fn dsn_stations_sit_on_the_earth() {
        for s in DSN_STATIONS {
            let r = norm(s.ecef_m);
            assert!((6.35e6..6.38e6).contains(&r), "{} {r}", s.name);
        }
    }
}
