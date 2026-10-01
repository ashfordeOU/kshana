// SPDX-License-Identifier: AGPL-3.0-only
//! The truth a navigation message is fitted to: a numerically integrated LEO orbit and a
//! seeded satellite clock.
//!
//! The orbit is integrated in a pseudo-inertial frame whose `z` axis is the Earth's
//! rotation axis and which coincides with the Earth-fixed (ECEF) frame at the run epoch
//! rotated by the Earth rotation angle `θ0`; ECEF is that frame turned by
//! `θ(t) = θ0 + Ω̇e·t`. Precession, nutation and polar motion are left out, which is
//! consistent with a broadcast message (its user algorithm has the same single rotation).
//!
//! Forces: two-body gravity; the Earth's zonal harmonics J2…J6 ([`crate::forces`]) for a
//! `gravity_degree` of 2 to 6, or the full EGM2008 spherical-harmonic field
//! ([`crate::gravity_sh`]) truncated at `gravity_degree` for 7 and above, which brings in
//! the tesseral terms whose short-period signature is what makes a LEO broadcast fit
//! hard; and optional atmospheric drag ([`crate::forces::drag_accel`], static exponential
//! density). The integrator is a fixed-step fourth-order Runge–Kutta at `step_s`, and
//! states between nodes are cubic Hermite interpolants of the node positions and
//! velocities (interpolation error below 0.1 mm at the default 5 s step). What a fit
//! needs from the truth is a smooth trajectory with realistic perturbations, not one
//! that matches a particular real satellite; this is that.
//!
//! The clock is `x(t) = x0 + y0·t + ½·D·t² + w(t)`, with `w` a seeded random walk of
//! phase (white frequency noise at the stated one-second Allan deviation) on a 1 s grid,
//! linearly interpolated. The clock a user sees also carries the periodic relativistic
//! term `−2 r·v / c²`, added from the orbit.

use super::elements::{cross3, dot, RacFrame, SysTime, C_LIGHT, OMEGA_E};
use crate::gravity_sh::SphericalHarmonicField;
use crate::portable_math::{standard_normal, PortableFloat};
use rand::SeedableRng;
use rand_chacha::ChaCha8Rng;

/// Orbit set-up for the truth propagation.
#[derive(Clone, Debug)]
pub struct OrbitConfig {
    /// Altitude of the initial semi-major axis above the equatorial radius (m).
    pub altitude_m: f64,
    /// Inclination (rad).
    pub inclination_rad: f64,
    /// Eccentricity.
    pub eccentricity: f64,
    /// Right ascension of the ascending node in the integration frame (rad).
    pub raan_rad: f64,
    /// Argument of perigee (rad).
    pub arg_perigee_rad: f64,
    /// Mean anomaly at the epoch (rad).
    pub mean_anomaly_rad: f64,
    /// Gravity field degree: 0 two-body, 2–6 zonal, 7–70 EGM2008.
    pub gravity_degree: usize,
    /// Drag ballistic term `C_D·A/m` (m²/kg); 0 disables drag.
    pub cd_area_over_mass: f64,
    /// Earth rotation angle at the epoch (rad).
    pub theta0_rad: f64,
    /// Run epoch.
    pub epoch: SysTime,
    /// Propagation length (s).
    pub duration_s: f64,
    /// Integration step (s).
    pub step_s: f64,
}

/// A propagated truth orbit, sampled at the integration nodes.
#[derive(Clone, Debug)]
pub struct TruthOrbit {
    /// Epoch of node 0.
    pub epoch: SysTime,
    /// Node spacing (s).
    pub step_s: f64,
    /// Earth rotation angle at the epoch (rad).
    pub theta0_rad: f64,
    r: Vec<[f64; 3]>,
    v: Vec<[f64; 3]>,
}

enum Gravity {
    Zonal(&'static [f64]),
    Sh(Box<SphericalHarmonicField>),
}

const EARTH_EQ_RADIUS_M: f64 = 6_378_137.0;

/// Osculating Keplerian elements to an inertial state.
pub fn elements_to_state(
    a: f64,
    e: f64,
    i: f64,
    raan: f64,
    argp: f64,
    m: f64,
) -> ([f64; 3], [f64; 3]) {
    let mu = super::elements::MU;
    let mut ea = m;
    for _ in 0..50 {
        let d = (ea - e * ea.psin() - m) / (1.0 - e * ea.pcos());
        ea -= d;
        if d.abs() < 1e-15 {
            break;
        }
    }
    let nu = ((1.0 - e * e).sqrt() * ea.psin()).patan2(ea.pcos() - e);
    let p = a * (1.0 - e * e);
    let r = p / (1.0 + e * nu.pcos());
    let (rp, vp) = (
        [r * nu.pcos(), r * nu.psin(), 0.0],
        [
            -(mu / p).sqrt() * nu.psin(),
            (mu / p).sqrt() * (e + nu.pcos()),
            0.0,
        ],
    );
    let (so, co) = raan.psin_cos();
    let (si, ci) = i.psin_cos();
    let (sw, cw) = argp.psin_cos();
    let rot = [
        [co * cw - so * sw * ci, -co * sw - so * cw * ci, so * si],
        [so * cw + co * sw * ci, -so * sw + co * cw * ci, -co * si],
        [sw * si, cw * si, ci],
    ];
    let m3 = |v: [f64; 3]| {
        [
            rot[0][0] * v[0] + rot[0][1] * v[1] + rot[0][2] * v[2],
            rot[1][0] * v[0] + rot[1][1] * v[1] + rot[1][2] * v[2],
            rot[2][0] * v[0] + rot[2][1] * v[1] + rot[2][2] * v[2],
        ]
    };
    (m3(rp), m3(vp))
}

/// Osculating elements `(a, e, i, raan, argp, M)` of an inertial state.
pub fn state_to_elements(r: [f64; 3], v: [f64; 3]) -> (f64, f64, f64, f64, f64, f64) {
    let mu = super::elements::MU;
    let rn = dot(r, r).sqrt();
    let v2 = dot(v, v);
    let h = cross3(r, v);
    let hn = dot(h, h).sqrt();
    let a = 1.0 / (2.0 / rn - v2 / mu);
    let rv = dot(r, v);
    let evec = [
        ((v2 - mu / rn) * r[0] - rv * v[0]) / mu,
        ((v2 - mu / rn) * r[1] - rv * v[1]) / mu,
        ((v2 - mu / rn) * r[2] - rv * v[2]) / mu,
    ];
    let e = dot(evec, evec).sqrt();
    let i = (h[2] / hn).pacos();
    let raan = h[0].patan2(-h[1]);
    // Argument of latitude.
    let nvec = [raan.pcos(), raan.psin(), 0.0];
    let wv = cross3(h, nvec);
    let u = (dot(r, wv) / hn).patan2(dot(r, nvec));
    let (argp, m) = if e > 1e-12 {
        let argp = (dot(evec, wv) / hn).patan2(dot(evec, nvec));
        let nu = u - argp;
        let ea = ((1.0 - e * e).sqrt() * nu.psin()).patan2(e + nu.pcos());
        (argp, ea - e * ea.psin())
    } else {
        (0.0, u)
    };
    (a, e, i, raan, argp, m)
}

fn rot_z(a: [f64; 3], th: f64) -> [f64; 3] {
    // Frame rotation (inertial to Earth-fixed) by angle th about z.
    let (s, c) = th.psin_cos();
    [c * a[0] + s * a[1], -s * a[0] + c * a[1], a[2]]
}

impl TruthOrbit {
    /// Integrate the orbit.
    pub fn propagate(cfg: &OrbitConfig) -> Result<TruthOrbit, String> {
        if !(cfg.altitude_m > 100e3 && cfg.altitude_m < 3000e3) {
            return Err(format!(
                "orbit altitude must be between 100 km and 3000 km; got {} km",
                cfg.altitude_m / 1e3
            ));
        }
        if !(0.0..0.1).contains(&cfg.eccentricity) {
            return Err(format!(
                "eccentricity must be in [0, 0.1) for a LEO fit; got {}",
                cfg.eccentricity
            ));
        }
        if !(cfg.step_s > 0.0 && cfg.step_s <= 30.0) {
            return Err(format!(
                "integration step must be in (0, 30] s; got {}",
                cfg.step_s
            ));
        }
        if !(cfg.duration_s > 0.0 && cfg.duration_s / cfg.step_s <= 200_000.0) {
            return Err(format!(
                "duration must be positive with at most 200000 steps; got {} s",
                cfg.duration_s
            ));
        }
        if cfg.gravity_degree == 1 || cfg.gravity_degree > crate::egm2008_data::EGM2008_NMAX {
            return Err(format!(
                "gravity_degree must be 0, 2-6 (zonal) or 7-{} (EGM2008); got {}",
                crate::egm2008_data::EGM2008_NMAX,
                cfg.gravity_degree
            ));
        }
        let a = EARTH_EQ_RADIUS_M + cfg.altitude_m;
        let (r0, v0) = elements_to_state(
            a,
            cfg.eccentricity,
            cfg.inclination_rad,
            cfg.raan_rad,
            cfg.arg_perigee_rad,
            cfg.mean_anomaly_rad,
        );
        let grav = match cfg.gravity_degree {
            0 => Gravity::Zonal(&[]),
            d @ 2..=6 => Gravity::Zonal(&crate::forces::EARTH_ZONALS_J2_J6[..d - 1]),
            d => Gravity::Sh(Box::new(SphericalHarmonicField::egm2008_truncated(d))),
        };
        let cd = cfg.cd_area_over_mass;
        let th0 = cfg.theta0_rad;
        let accel = |t: f64, r: [f64; 3], v: [f64; 3]| -> [f64; 3] {
            let mut acc = match &grav {
                Gravity::Zonal(jn) => {
                    let tb = crate::forces::two_body_accel(r);
                    if jn.is_empty() {
                        tb
                    } else {
                        let z = crate::forces::zonal_accel_portable(r, jn);
                        [tb[0] + z[0], tb[1] + z[1], tb[2] + z[2]]
                    }
                }
                Gravity::Sh(f) => {
                    let th = th0 + OMEGA_E * t;
                    let ae = f.acceleration_portable(rot_z(r, th));
                    rot_z(ae, -th)
                }
            };
            if cd > 0.0 {
                let d = crate::forces::drag_accel_portable(r, v, cd);
                acc = [acc[0] + d[0], acc[1] + d[1], acc[2] + d[2]];
            }
            acc
        };
        let n = (cfg.duration_s / cfg.step_s).ceil() as usize + 1;
        let h = cfg.step_s;
        let mut rs = Vec::with_capacity(n);
        let mut vs = Vec::with_capacity(n);
        let (mut r, mut v) = (r0, v0);
        let mut t = 0.0;
        for _ in 0..n {
            rs.push(r);
            vs.push(v);
            let add = |x: [f64; 3], y: [f64; 3], s: f64| {
                [x[0] + s * y[0], x[1] + s * y[1], x[2] + s * y[2]]
            };
            let k1v = accel(t, r, v);
            let k1r = v;
            let k2v = accel(t + h / 2.0, add(r, k1r, h / 2.0), add(v, k1v, h / 2.0));
            let k2r = add(v, k1v, h / 2.0);
            let k3v = accel(t + h / 2.0, add(r, k2r, h / 2.0), add(v, k2v, h / 2.0));
            let k3r = add(v, k2v, h / 2.0);
            let k4v = accel(t + h, add(r, k3r, h), add(v, k3v, h));
            let k4r = add(v, k3v, h);
            for k in 0..3 {
                r[k] += h / 6.0 * (k1r[k] + 2.0 * k2r[k] + 2.0 * k3r[k] + k4r[k]);
                v[k] += h / 6.0 * (k1v[k] + 2.0 * k2v[k] + 2.0 * k3v[k] + k4v[k]);
            }
            t += h;
            if !(r.iter().chain(v.iter()).all(|x| x.is_finite())) {
                return Err("truth propagation diverged".to_string());
            }
            if dot(r, r).sqrt() < EARTH_EQ_RADIUS_M + 80e3 {
                return Err("truth orbit decayed below 80 km".to_string());
            }
        }
        Ok(TruthOrbit {
            epoch: cfg.epoch,
            step_s: h,
            theta0_rad: th0,
            r: rs,
            v: vs,
        })
    }

    /// A truth orbit from tabulated Earth-fixed states, for fitting a message to a real
    /// orbit (for example a precise science orbit). `states[k]` is the ECEF position (m) and
    /// ECEF velocity (m/s) at `epoch + k·step_s`. The states are turned into this type's
    /// pseudo-inertial frame by the same single rotation `θ(t) = θ0 + Ω̇e·t` that
    /// [`TruthOrbit::state_ecef`] undoes, so `state_ecef` returns the tabulated states at the
    /// nodes and cubic Hermite interpolants between them.
    pub fn from_ecef_states(
        epoch: SysTime,
        step_s: f64,
        theta0_rad: f64,
        states: &[([f64; 3], [f64; 3])],
    ) -> Result<TruthOrbit, String> {
        if !(step_s > 0.0 && step_s <= 60.0) {
            return Err(format!("node spacing must be in (0, 60] s; got {step_s}"));
        }
        if states.len() < 2 {
            return Err(format!(
                "a tabulated truth orbit needs at least two states; got {}",
                states.len()
            ));
        }
        let mut r = Vec::with_capacity(states.len());
        let mut v = Vec::with_capacity(states.len());
        for (k, (re, ve)) in states.iter().enumerate() {
            if !re.iter().chain(ve.iter()).all(|x| x.is_finite()) {
                return Err(format!("state {k} is not finite"));
            }
            let th = theta0_rad + OMEGA_E * (k as f64 * step_s);
            // Inertial-sense velocity in ECEF axes: v_ecef + ω × r.
            let vi = [ve[0] - OMEGA_E * re[1], ve[1] + OMEGA_E * re[0], ve[2]];
            r.push(rot_z(*re, -th));
            v.push(rot_z(vi, -th));
        }
        Ok(TruthOrbit {
            epoch,
            step_s,
            theta0_rad,
            r,
            v,
        })
    }

    /// Length of the propagated arc (s).
    pub fn span_s(&self) -> f64 {
        (self.r.len() - 1) as f64 * self.step_s
    }

    /// Inertial state `(r, v)` at `dt` seconds after the epoch (cubic Hermite).
    pub fn state_inertial(&self, dt: f64) -> ([f64; 3], [f64; 3]) {
        let h = self.step_s;
        let last = self.r.len() - 1;
        let x = (dt / h).clamp(0.0, last as f64);
        let mut i = x.floor() as usize;
        if i >= last {
            i = last - 1;
        }
        let s = x - i as f64;
        let (p0, p1, m0, m1) = (self.r[i], self.r[i + 1], self.v[i], self.v[i + 1]);
        let (h00, h10, h01, h11) = (
            2.0 * s.ppowi(3) - 3.0 * s * s + 1.0,
            s.ppowi(3) - 2.0 * s * s + s,
            -2.0 * s.ppowi(3) + 3.0 * s * s,
            s.ppowi(3) - s * s,
        );
        let (d00, d10, d01, d11) = (
            6.0 * s * s - 6.0 * s,
            3.0 * s * s - 4.0 * s + 1.0,
            -6.0 * s * s + 6.0 * s,
            3.0 * s * s - 2.0 * s,
        );
        let mut r = [0.0; 3];
        let mut v = [0.0; 3];
        for k in 0..3 {
            r[k] = h00 * p0[k] + h10 * h * m0[k] + h01 * p1[k] + h11 * h * m1[k];
            v[k] = (d00 * p0[k] + d10 * h * m0[k] + d01 * p1[k] + d11 * h * m1[k]) / h;
        }
        (r, v)
    }

    /// Seconds from the epoch to `t`.
    pub fn dt_of(&self, t: &SysTime) -> f64 {
        t.minus(&self.epoch)
    }

    /// The Earth rotation angle at `dt` seconds after the epoch (rad).
    pub fn theta(&self, dt: f64) -> f64 {
        self.theta0_rad + OMEGA_E * dt
    }

    /// ECEF position (m), ECEF velocity (m/s) and the true along/cross/radial frame at
    /// `dt` seconds after the epoch. The frame is built from the inertial velocity
    /// expressed in ECEF axes, the direction a satellite actually flies.
    pub fn state_ecef(&self, dt: f64) -> ([f64; 3], [f64; 3], RacFrame) {
        let (r, v) = self.state_inertial(dt);
        let th = self.theta(dt);
        let re = rot_z(r, th);
        let vi = rot_z(v, th);
        let ve = [vi[0] + OMEGA_E * re[1], vi[1] - OMEGA_E * re[0], vi[2]];
        (re, ve, RacFrame::from_rv(re, vi))
    }

    /// The periodic relativistic clock term `−2 r·v / c²` (s) at `dt`.
    pub fn relativistic_s(&self, dt: f64) -> f64 {
        let (r, v) = self.state_inertial(dt);
        -2.0 * dot(r, v) / (C_LIGHT * C_LIGHT)
    }
}

/// Satellite clock set-up.
#[derive(Clone, Copy, Debug)]
pub enum ClockConfig {
    /// A free-running oscillator: `x0 + y0·t + ½·D·t² + w(t)`, `w` a random walk of phase
    /// at the stated one-second Allan deviation. The user-visible clock adds the periodic
    /// relativistic term.
    Free {
        /// Initial bias (s).
        bias_s: f64,
        /// Initial drift (s/s).
        drift: f64,
        /// Drift rate (s/s²).
        drift_rate: f64,
        /// One-second Allan deviation of the white frequency noise.
        adev_1s: f64,
        /// Seed of the noise.
        seed: u64,
    },
    /// A clock steered to system time on board (the "zero-clock" case): the user-visible
    /// offset is only the steering residual, a first-order Gauss–Markov process.
    Steered {
        /// One-sigma steering residual (s).
        sigma_s: f64,
        /// Correlation time (s).
        tau_s: f64,
        /// Seed of the noise.
        seed: u64,
    },
}

/// A seeded truth clock on a 1 s grid.
#[derive(Clone, Debug)]
pub struct TruthClock {
    cfg: ClockConfig,
    walk: Vec<f64>,
}

impl TruthClock {
    /// Draw the clock over `span_s` seconds.
    pub fn new(cfg: ClockConfig, span_s: f64) -> Result<TruthClock, String> {
        let n = span_s.max(0.0).ceil() as usize + 2;
        let mut walk = Vec::with_capacity(n);
        match cfg {
            ClockConfig::Free { adev_1s, seed, .. } => {
                if !(0.0..1e-6).contains(&adev_1s) {
                    return Err(format!("clock adev_1s must be in [0, 1e-6); got {adev_1s}"));
                }
                let mut rng = ChaCha8Rng::seed_from_u64(seed);
                let mut x = 0.0;
                walk.push(0.0);
                if adev_1s > 0.0 {
                    for _ in 1..n {
                        x += adev_1s * standard_normal(&mut rng);
                        walk.push(x);
                    }
                } else {
                    walk.resize(n, 0.0);
                }
            }
            ClockConfig::Steered {
                sigma_s,
                tau_s,
                seed,
            } => {
                if !(0.0..1e-3).contains(&sigma_s) || tau_s.is_nan() || tau_s <= 0.0 {
                    return Err(format!(
                        "steered clock needs sigma_s in [0, 1e-3) and tau_s > 0; got {sigma_s}, {tau_s}"
                    ));
                }
                let mut rng = ChaCha8Rng::seed_from_u64(seed);
                let phi = (-1.0 / tau_s).pexp();
                let q = sigma_s * (1.0 - phi * phi).sqrt();
                let mut x = sigma_s * standard_normal(&mut rng);
                for _ in 0..n {
                    walk.push(x);
                    x = phi * x + q * standard_normal(&mut rng);
                }
            }
        }
        Ok(TruthClock { cfg, walk })
    }

    fn noise(&self, dt: f64) -> f64 {
        let last = self.walk.len() - 1;
        let x = dt.clamp(0.0, last as f64);
        let i = (x.floor() as usize).min(last - 1);
        let s = x - i as f64;
        self.walk[i] * (1.0 - s) + self.walk[i + 1] * s
    }

    /// Whether the clock is steered (zero-clock case).
    pub fn is_steered(&self) -> bool {
        matches!(self.cfg, ClockConfig::Steered { .. })
    }

    /// The clock offset a user sees (s) at `dt` seconds after the epoch: oscillator plus the
    /// relativistic term for a free clock, the steering residual for a steered one.
    pub fn apparent_s(&self, orbit: &TruthOrbit, dt: f64) -> f64 {
        match self.cfg {
            ClockConfig::Free {
                bias_s,
                drift,
                drift_rate,
                ..
            } => {
                bias_s
                    + drift * dt
                    + 0.5 * drift_rate * dt * dt
                    + self.noise(dt)
                    + orbit.relativistic_s(dt)
            }
            ClockConfig::Steered { .. } => self.noise(dt),
        }
    }
}
