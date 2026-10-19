// SPDX-License-Identifier: AGPL-3.0-only
//! Onboard GNSS navigation for a spacecraft above, around and beyond the GNSS orbits: an extended Kalman filter on
//! pseudoranges for the high-orbit and lunar-transfer cases (item H1.5).
//!
//! Truth is a numerically integrated trajectory (point-mass gravity, J2, Sun and Moon third-body, cannonball solar
//! radiation pressure with a cylindrical Earth shadow) and a drifting receiver clock. The filter's state is position,
//! velocity, receiver clock bias and drift, and a solar-radiation-pressure acceleration scale (9 states); its dynamics are
//! point mass, J2 and the same third bodies, with the radiation-pressure term estimated and the shadow ignored. Pseudoranges
//! come from the same link geometry, transmit patterns and C/N0 threshold as [`super::sweep`], with a noise that grows as the
//! C/N0 falls; the medium's excess delay (when a medium is supplied) is added to the measurement and not modelled by the
//! filter, so it shows up as an error. The Sun and Moon positions are low-precision circular stand-ins, shared by truth and
//! filter. MODELLED throughout: it shows what a filter of this kind achieves given the geometry, not what a flight
//! receiver achieves.

use super::constellations::{
    self, free_space_loss_db, mrtp_dbw, noise_density_dbw_hz, Band, Constellation, Satellite,
};
use super::geom::{self, V3};
use super::pattern::{TxPattern, UserAntenna};
use super::sweep::{LinkEffects, UserOrbit};
use crate::portable_distr::{Distribution, StandardNormal};
use crate::portable_math::PortableFloat;
use rand::SeedableRng;
use rand_chacha::ChaCha8Rng;
use serde::Serialize;

pub(super) const MU: f64 = 3.986_004_418e14;
const J2: f64 = 1.082_626_68e-3;
const RE: f64 = 6_378_137.0;
const MU_SUN: f64 = 1.327_124_400_18e20;
const MU_MOON: f64 = 4.902_800_066e12;
const AU: f64 = 1.495_978_707e11;
pub(super) const SRP_PRESSURE: f64 = 4.56e-6;
/// The scale of the radiation-pressure state, m/s^2.
pub(super) const SRP_UNIT: f64 = 1e-7;
pub(super) const N: usize = 9;

/// The navigation run's inputs.
#[derive(Clone, Debug)]
pub struct NavConfig {
    /// The truth orbit (osculating at the epoch).
    pub orbit: UserOrbit,
    /// Simulated duration, minutes.
    pub duration_min: f64,
    /// Measurement interval, seconds.
    pub step_s: f64,
    /// Receiver C/N0 threshold, dB-Hz.
    pub cn0_min_dbhz: f64,
    /// Constellations and bands used.
    pub constellations: Vec<Constellation>,
    /// Bands used.
    pub bands: Vec<Band>,
    /// Receive antennas (the best gain per link).
    pub antennas: Vec<(Band, Vec<UserAntenna>)>,
    /// Transmit pattern.
    pub tx: TxPattern,
    /// Pseudorange sigma at 35 dB-Hz, m.
    pub sigma_35_dbhz_m: f64,
    /// Truth solar radiation pressure: `C_r A / m`, m^2/kg.
    pub srp_area_to_mass: f64,
    /// Initial filter position error, 1 sigma per axis, m.
    pub init_pos_sigma_m: f64,
    /// Initial filter velocity error, 1 sigma per axis, m/s.
    pub init_vel_sigma_ms: f64,
    /// Filter acceleration process noise, m^2/s^3 (white-noise PSD).
    pub accel_psd: f64,
    /// Receiver clock frequency random walk, m/s per sqrt(s).
    pub clock_drift_walk: f64,
    /// Seed.
    pub seed: u64,
    /// Keep every n-th epoch in the series (0: none).
    pub series_every_epochs: usize,
    /// Reference off-boresight angle overrides (see the sweeps).
    pub beam_override_deg: Vec<(Constellation, Band, f64)>,
}

/// Errors over one part of the run.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct NavPhase {
    /// Name of the part.
    pub phase: String,
    /// Epochs in it.
    pub epochs: usize,
    /// Epochs with at least four measurements.
    pub epochs_with_4: usize,
    /// RMS 3D position error, m.
    pub pos_rms_m: Option<f64>,
    /// RMS 3D velocity error, m/s.
    pub vel_rms_ms: Option<f64>,
    /// 95th percentile of the 3D position error, m.
    pub pos_p95_m: Option<f64>,
    /// Mean normalised estimation error squared of the position (3 degrees of freedom; about 3 for a consistent filter).
    pub pos_nees_mean: Option<f64>,
}

/// One decimated epoch.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct NavPoint {
    /// Minutes since the epoch.
    pub t_min: f64,
    /// Altitude, km.
    pub altitude_km: f64,
    /// Measurements used.
    pub n_meas: u32,
    /// 3D position error, m.
    pub pos_err_m: f64,
    /// 3D position 1-sigma (root of the trace of the position covariance), m.
    pub pos_sigma_m: f64,
}

/// The run's result.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct NavResult {
    /// Epochs.
    pub epochs: usize,
    /// Errors in the whole run, then below and above the GNSS orbits (20,000 km altitude).
    pub phases: Vec<NavPhase>,
    /// Longest time with no measurement at all, minutes.
    pub longest_gap_min: f64,
    /// Measurements used, total.
    pub measurements_used: u64,
    /// Measurements rejected by the 5-sigma innovation gate.
    pub measurements_gated: u64,
    /// Final 3D position error, m.
    pub final_pos_err_m: f64,
    /// Final estimate of the radiation-pressure acceleration, m/s^2, and the truth.
    pub srp_estimate_ms2: f64,
    /// The truth radiation-pressure acceleration, m/s^2.
    pub srp_truth_ms2: f64,
    /// Decimated series.
    pub series: Vec<NavPoint>,
}

// ───────────────────────────── dynamics ─────────────────────────────

fn obliquity_rotate(v: V3) -> V3 {
    let (s, c) = 23.4393f64.to_radians().psin_cos();
    [v[0], c * v[1] - s * v[2], s * v[1] + c * v[2]]
}

/// Low-precision circular Sun position (m), inertial equatorial.
pub(super) fn sun_pos(t_s: f64) -> V3 {
    let lon = (280.46 + 0.985_647_36 * t_s / 86_400.0).to_radians();
    obliquity_rotate([AU * lon.pcos(), AU * lon.psin(), 0.0])
}

/// Low-precision circular Moon position (m), inertial equatorial.
pub(super) fn moon_pos(t_s: f64) -> V3 {
    let lon = (100.0 + 13.176_396 * t_s / 86_400.0).to_radians();
    obliquity_rotate([384_400e3 * lon.pcos(), 384_400e3 * lon.psin(), 0.0])
}

fn third_body(r: V3, p: V3, mu: f64) -> V3 {
    let d = geom::sub(p, r);
    let (dn, pn) = (geom::norm(d), geom::norm(p));
    let k = |x: V3, n: f64| geom::scale(x, mu / (n * n * n));
    geom::sub(k(d, dn), k(p, pn))
}

/// Whether the spacecraft is in the Earth's cylindrical shadow.
fn in_shadow(r: V3, sun: V3) -> bool {
    let s = geom::unit(sun);
    let along = geom::dot(r, s);
    along < 0.0 && geom::norm(geom::sub(r, geom::scale(s, along))) < RE
}

/// Acceleration of the truth (`truth`: radiation pressure with shadow) or the filter model (`srp` is the estimated value
/// in m/s^2, no shadow).
pub(super) fn accel(r: V3, t_s: f64, srp_ms2: f64, shadow: bool) -> V3 {
    let rn = geom::norm(r);
    let mut a = geom::scale(r, -MU / (rn * rn * rn));
    let z2 = (r[2] / rn) * (r[2] / rn);
    let k = 1.5 * J2 * MU * RE * RE / rn.ppowi(5);
    a[0] += k * r[0] * (5.0 * z2 - 1.0);
    a[1] += k * r[1] * (5.0 * z2 - 1.0);
    a[2] += k * r[2] * (5.0 * z2 - 3.0);
    let (sun, moon) = (sun_pos(t_s), moon_pos(t_s));
    for (p, mu) in [(sun, MU_SUN), (moon, MU_MOON)] {
        let tb = third_body(r, p, mu);
        a = [a[0] + tb[0], a[1] + tb[1], a[2] + tb[2]];
    }
    if !(shadow && in_shadow(r, sun)) {
        let away = geom::scale(geom::unit(geom::sub(r, sun)), srp_ms2);
        a = [a[0] + away[0], a[1] + away[1], a[2] + away[2]];
    }
    a
}

pub(super) fn rk4(r: V3, v: V3, t: f64, h: f64, srp: f64, shadow: bool) -> (V3, V3) {
    let add = |a: V3, b: V3, s: f64| [a[0] + s * b[0], a[1] + s * b[1], a[2] + s * b[2]];
    let k1v = accel(r, t, srp, shadow);
    let k1r = v;
    let k2v = accel(add(r, k1r, h / 2.0), t + h / 2.0, srp, shadow);
    let k2r = add(v, k1v, h / 2.0);
    let k3v = accel(add(r, k2r, h / 2.0), t + h / 2.0, srp, shadow);
    let k3r = add(v, k2v, h / 2.0);
    let k4v = accel(add(r, k3r, h), t + h, srp, shadow);
    let k4r = add(v, k3v, h);
    let mut rn = r;
    let mut vn = v;
    for i in 0..3 {
        rn[i] += h / 6.0 * (k1r[i] + 2.0 * k2r[i] + 2.0 * k3r[i] + k4r[i]);
        vn[i] += h / 6.0 * (k1v[i] + 2.0 * k2v[i] + 2.0 * k3v[i] + k4v[i]);
    }
    (rn, vn)
}

// ───────────────────────────── the filter ─────────────────────────────

pub(super) type Mat = [[f64; N]; N];

fn identity<const M: usize>() -> [[f64; M]; M] {
    let mut m = [[0.0; M]; M];
    for (i, row) in m.iter_mut().enumerate() {
        row[i] = 1.0;
    }
    m
}

fn matmul<const M: usize>(a: &[[f64; M]; M], b: &[[f64; M]; M]) -> [[f64; M]; M] {
    let mut c = [[0.0; M]; M];
    for i in 0..M {
        for k in 0..M {
            let aik = a[i][k];
            if aik != 0.0 {
                for j in 0..M {
                    c[i][j] += aik * b[k][j];
                }
            }
        }
    }
    c
}

fn transpose<const M: usize>(a: &[[f64; M]; M]) -> [[f64; M]; M] {
    let mut t = [[0.0; M]; M];
    for i in 0..M {
        for j in 0..M {
            t[j][i] = a[i][j];
        }
    }
    t
}

pub(super) struct Ekf {
    pub(super) x: [f64; N],
    pub(super) p: Mat,
}

impl Ekf {
    /// Propagate by `dt` seconds from `t`.
    pub(super) fn predict(&mut self, t: f64, dt: f64, cfg: &NavConfig) {
        let r = [self.x[0], self.x[1], self.x[2]];
        let v = [self.x[3], self.x[4], self.x[5]];
        let srp = self.x[8] * SRP_UNIT;
        // Transition matrix from the gravity gradient (central differences of the model acceleration).
        let mut f = [[0.0; N]; N];
        for i in 0..3 {
            f[i][3 + i] = 1.0;
        }
        let h = 500.0;
        for j in 0..3 {
            let (mut rp, mut rm) = (r, r);
            rp[j] += h;
            rm[j] -= h;
            let (ap, am) = (accel(rp, t, srp, false), accel(rm, t, srp, false));
            for i in 0..3 {
                f[3 + i][j] = (ap[i] - am[i]) / (2.0 * h);
            }
        }
        let away = geom::unit(geom::sub(r, sun_pos(t)));
        for i in 0..3 {
            f[3 + i][8] = away[i] * SRP_UNIT;
        }
        f[6][7] = 1.0;
        let mut phi = identity();
        let mut f2 = [[0.0; N]; N];
        for i in 0..N {
            for j in 0..N {
                phi[i][j] += f[i][j] * dt;
            }
        }
        for (i, row) in f2.iter_mut().enumerate() {
            for (j, cell) in row.iter_mut().enumerate() {
                *cell = (0..N).map(|k| f[i][k] * f[k][j]).sum::<f64>() * dt * dt / 2.0;
            }
        }
        for i in 0..N {
            for j in 0..N {
                phi[i][j] += f2[i][j];
            }
        }
        let (rn, vn) = rk4(r, v, t, dt, srp, false);
        self.x[..3].copy_from_slice(&rn);
        self.x[3..6].copy_from_slice(&vn);
        self.x[6] += self.x[7] * dt;
        let mut p = matmul(&matmul(&phi, &self.p), &transpose(&phi));
        let q = cfg.accel_psd;
        for i in 0..3 {
            p[i][i] += q * dt * dt * dt / 3.0;
            p[3 + i][3 + i] += q * dt;
            p[i][3 + i] += q * dt * dt / 2.0;
            p[3 + i][i] += q * dt * dt / 2.0;
        }
        let qd = cfg.clock_drift_walk * cfg.clock_drift_walk;
        p[6][6] += qd * dt * dt * dt / 3.0;
        p[7][7] += qd * dt;
        p[6][7] += qd * dt * dt / 2.0;
        p[7][6] += qd * dt * dt / 2.0;
        p[8][8] += 0.0004 * dt / 3600.0; // the scale may drift about 2 % of a unit per hour
        self.p = p;
    }

    /// Sequential scalar update. Returns false if the innovation was gated out.
    pub(super) fn update(&mut self, sat: V3, z: f64, sigma: f64) -> bool {
        let r = [self.x[0], self.x[1], self.x[2]];
        let d = geom::sub(r, sat);
        let rho = geom::norm(d);
        let mut hrow = [0.0; N];
        for i in 0..3 {
            hrow[i] = d[i] / rho;
        }
        hrow[6] = 1.0;
        let innov = z - (rho + self.x[6]);
        let ph: Vec<f64> = (0..N)
            .map(|i| (0..N).map(|j| self.p[i][j] * hrow[j]).sum())
            .collect();
        let s: f64 = (0..N).map(|i| hrow[i] * ph[i]).sum::<f64>() + sigma * sigma;
        if innov * innov > 25.0 * s {
            return false;
        }
        for i in 0..N {
            self.x[i] += ph[i] / s * innov;
        }
        for i in 0..N {
            for j in 0..N {
                self.p[i][j] -= ph[i] * ph[j] / s;
            }
        }
        for i in 0..N {
            for j in (i + 1)..N {
                let m = 0.5 * (self.p[i][j] + self.p[j][i]);
                self.p[i][j] = m;
                self.p[j][i] = m;
            }
        }
        true
    }
}

// ───────────────────────────── measurements ─────────────────────────────

pub(super) struct Meas {
    pub(super) id: usize,
    pub(super) sat: V3,
    pub(super) range_m: f64,
    pub(super) cn0: f64,
    pub(super) delay_m: f64,
}

pub(super) fn measurements(
    cfg: &NavConfig,
    sats: &[(Band, Satellite, constellations::SignalSpec, f64)],
    t: f64,
    u: V3,
    fx: &dyn LinkEffects,
) -> Vec<Meas> {
    let nd = noise_density_dbw_hz();
    let rb = geom::blocking_radius_m();
    let era = geom::earth_rotation_angle(t);
    let mut out = Vec::new();
    for (id, (band, sat, spec, mrtp)) in sats.iter().enumerate() {
        let s = sat.position(t);
        let boresight = if sat.constellation == Constellation::Navic {
            let (la, lo) = (5f64.to_radians(), 83f64.to_radians());
            let r = constellations::RE_BOOKLET_M;
            let tgt = geom::ecef_to_eci(
                [
                    r * la.pcos() * lo.pcos(),
                    r * la.pcos() * lo.psin(),
                    r * la.psin(),
                ],
                era,
            );
            geom::unit(geom::sub(tgt, s))
        } else {
            geom::scale(geom::unit(s), -1.0)
        };
        let lg = geom::link(s, boresight, u, rb);
        if lg.blocked {
            continue;
        }
        let ants: &[UserAntenna] = cfg
            .antennas
            .iter()
            .find(|(b, _)| b == band)
            .map(|(_, a)| a.as_slice())
            .unwrap_or(&[]);
        let los_to_tx = geom::scale(lg.line_of_sight, -1.0);
        let gu = if ants.is_empty() {
            Some(0.0)
        } else {
            ants.iter()
                .filter_map(|a| a.gain_dbi(u, los_to_tx))
                .fold(None, |m: Option<f64>, x| Some(m.map_or(x, |y| y.max(x))))
        };
        let Some(gu) = gu else { continue };
        let Some(eirp) = cfg
            .tx
            .eirp_dbw(*mrtp, spec.beam_deg, lg.off_boresight_deg, 0.0)
        else {
            continue;
        };
        let eff = fx.effects(s, u, spec.freq_hz);
        let cn0 = eirp + gu - free_space_loss_db(lg.range_m, spec.freq_hz) - nd - eff.loss_db;
        if cn0 < cfg.cn0_min_dbhz {
            continue;
        }
        out.push(Meas {
            id,
            sat: s,
            range_m: lg.range_m,
            cn0,
            delay_m: eff.delay_m,
        });
    }
    out
}

pub(super) fn percentile(v: &mut [f64], p: f64) -> Option<f64> {
    if v.is_empty() {
        return None;
    }
    v.sort_by(f64::total_cmp);
    Some(v[((p / 100.0) * (v.len() - 1) as f64).round() as usize])
}

struct Acc {
    name: &'static str,
    epochs: usize,
    with4: usize,
    pos: Vec<f64>,
    vel2: f64,
    nees: f64,
}

/// One transmitted signal: band, satellite, specification, minimum radiated power.
pub(super) type SigRow = (Band, Satellite, constellations::SignalSpec, f64);

/// Every (satellite, signal) the receiver can use.
pub(super) fn signal_table(cfg: &NavConfig) -> Result<Vec<SigRow>, String> {
    let mut sats = Vec::new();
    for &band in &cfg.bands {
        for &c in &cfg.constellations {
            for sat in constellations::satellites(c) {
                if let Some(spec) = constellations::signal_for(c, band, sat.class) {
                    let mut spec = *spec;
                    if let Some(o) = cfg
                        .beam_override_deg
                        .iter()
                        .find(|o| o.0 == c && o.1 == band)
                    {
                        spec.beam_deg = o.2;
                    }
                    let m = mrtp_dbw(&spec, 36_000.0);
                    sats.push((band, sat, spec, m));
                }
            }
        }
    }
    if sats.is_empty() {
        return Err("no signals for the chosen constellations and bands".into());
    }
    Ok(sats)
}

/// Run the filter against the simulated truth.
pub fn run_nav(cfg: &NavConfig, fx: &dyn LinkEffects) -> Result<NavResult, String> {
    if !(cfg.duration_min > 0.0 && cfg.step_s > 0.0) {
        return Err("duration_min and step_s must be positive".into());
    }
    let sats = signal_table(cfg)?;
    let mut rng = ChaCha8Rng::seed_from_u64(cfg.seed);
    let mut gauss = move || -> f64 { StandardNormal.sample(&mut rng) };

    // Truth initial state from the Keplerian elements (central-difference velocity over 1 s).
    let r0 = cfg.orbit.position(0.0);
    let v0 = geom::sub(cfg.orbit.position(0.5), cfg.orbit.position(-0.5));
    let (mut tr, mut tv) = (r0, v0);
    let srp_truth = cfg.srp_area_to_mass * SRP_PRESSURE;
    let mut clock_b = 1000.0;
    let mut clock_d = 0.3;

    let mut ekf = Ekf {
        x: [0.0; N],
        p: [[0.0; N]; N],
    };
    for i in 0..3 {
        ekf.x[i] = tr[i] + cfg.init_pos_sigma_m * gauss();
        ekf.x[3 + i] = tv[i] + cfg.init_vel_sigma_ms * gauss();
        ekf.p[i][i] = cfg.init_pos_sigma_m * cfg.init_pos_sigma_m;
        ekf.p[3 + i][3 + i] = cfg.init_vel_sigma_ms * cfg.init_vel_sigma_ms;
    }
    ekf.x[6] = 0.0;
    ekf.x[7] = 0.0;
    ekf.x[8] = 0.0;
    ekf.p[6][6] = 3000.0 * 3000.0;
    ekf.p[7][7] = 1.0;
    ekf.p[8][8] = 25.0; // 5 units (5e-7 m/s^2) of prior sigma

    let n_epochs = (cfg.duration_min * 60.0 / cfg.step_s).round() as usize + 1;
    let (mut all, mut low, mut high) = (
        Acc {
            name: "whole run",
            epochs: 0,
            with4: 0,
            pos: vec![],
            vel2: 0.0,
            nees: 0.0,
        },
        Acc {
            name: "inside the GNSS orbits (below 20,000 km)",
            epochs: 0,
            with4: 0,
            pos: vec![],
            vel2: 0.0,
            nees: 0.0,
        },
        Acc {
            name: "above the GNSS orbits (20,000 km and higher)",
            epochs: 0,
            with4: 0,
            pos: vec![],
            vel2: 0.0,
            nees: 0.0,
        },
    );
    let (mut used, mut gated) = (0u64, 0u64);
    let (mut gap, mut longest_gap) = (0usize, 0usize);
    let mut series = Vec::new();
    for k in 0..n_epochs {
        let t = k as f64 * cfg.step_s;
        if k > 0 {
            // Truth: sub-steps of at most 20 s.
            let n_sub = (cfg.step_s / 20.0).ceil().max(1.0) as usize;
            let h = cfg.step_s / n_sub as f64;
            for s in 0..n_sub {
                let (a, b) = rk4(tr, tv, t - cfg.step_s + s as f64 * h, h, srp_truth, true);
                tr = a;
                tv = b;
            }
            clock_b += clock_d * cfg.step_s;
            clock_d += cfg.clock_drift_walk * cfg.step_s.sqrt() * gauss();
            // Filter: sub-steps of at most 30 s.
            let n_f = (cfg.step_s / 30.0).ceil().max(1.0) as usize;
            let hf = cfg.step_s / n_f as f64;
            for s in 0..n_f {
                ekf.predict(t - cfg.step_s + s as f64 * hf, hf, cfg);
            }
        }
        let ms = measurements(cfg, &sats, t, tr, fx);
        let mut n_used = 0u32;
        for m in &ms {
            let sigma =
                (cfg.sigma_35_dbhz_m * 10f64.ppowf((35.0 - m.cn0) / 20.0)).clamp(0.3, 100.0);
            let z = m.range_m + clock_b + m.delay_m + sigma * gauss();
            if ekf.update(m.sat, z, sigma) {
                n_used += 1;
                used += 1;
            } else {
                gated += 1;
            }
        }
        if n_used == 0 {
            gap += 1;
            longest_gap = longest_gap.max(gap);
        } else {
            gap = 0;
        }
        let e = [ekf.x[0] - tr[0], ekf.x[1] - tr[1], ekf.x[2] - tr[2]];
        let ev = [ekf.x[3] - tv[0], ekf.x[4] - tv[1], ekf.x[5] - tv[2]];
        let pe = geom::norm(e);
        let alt = geom::norm(tr) - constellations::RE_BOOKLET_M;
        // NEES with the 3x3 position covariance block.
        let nees = {
            let p = [
                [ekf.p[0][0], ekf.p[0][1], ekf.p[0][2]],
                [ekf.p[1][0], ekf.p[1][1], ekf.p[1][2]],
                [ekf.p[2][0], ekf.p[2][1], ekf.p[2][2]],
            ];
            let det = p[0][0] * (p[1][1] * p[2][2] - p[1][2] * p[2][1])
                - p[0][1] * (p[1][0] * p[2][2] - p[1][2] * p[2][0])
                + p[0][2] * (p[1][0] * p[2][1] - p[1][1] * p[2][0]);
            let inv = |a: usize, b: usize| -> f64 {
                let (a1, a2) = ((a + 1) % 3, (a + 2) % 3);
                let (b1, b2) = ((b + 1) % 3, (b + 2) % 3);
                (p[b1][a1] * p[b2][a2] - p[b1][a2] * p[b2][a1]) / det
            };
            let mut q = 0.0;
            for a in 0..3 {
                for b in 0..3 {
                    q += e[a] * inv(a, b) * e[b];
                }
            }
            q
        };
        let trace = ekf.p[0][0] + ekf.p[1][1] + ekf.p[2][2];
        for acc in [&mut all, if alt < 20_000e3 { &mut low } else { &mut high }] {
            acc.epochs += 1;
            if n_used >= 4 {
                acc.with4 += 1;
            }
            acc.pos.push(pe);
            acc.vel2 += geom::dot(ev, ev);
            if nees.is_finite() {
                acc.nees += nees;
            }
        }
        if cfg.series_every_epochs > 0 && k % cfg.series_every_epochs == 0 {
            series.push(NavPoint {
                t_min: t / 60.0,
                altitude_km: alt / 1000.0,
                n_meas: n_used,
                pos_err_m: pe,
                pos_sigma_m: trace.max(0.0).sqrt(),
            });
        }
    }
    let phases = [all, low, high]
        .into_iter()
        .map(|mut a| {
            let n = a.pos.len() as f64;
            NavPhase {
                phase: a.name.into(),
                epochs: a.epochs,
                epochs_with_4: a.with4,
                pos_rms_m: (n > 0.0).then(|| (a.pos.iter().map(|x| x * x).sum::<f64>() / n).sqrt()),
                vel_rms_ms: (n > 0.0).then(|| (a.vel2 / n).sqrt()),
                pos_nees_mean: (n > 0.0).then(|| a.nees / n),
                pos_p95_m: percentile(&mut a.pos, 95.0),
            }
        })
        .collect();
    let fe = [ekf.x[0] - tr[0], ekf.x[1] - tr[1], ekf.x[2] - tr[2]];
    Ok(NavResult {
        epochs: n_epochs,
        phases,
        longest_gap_min: longest_gap as f64 * cfg.step_s / 60.0,
        measurements_used: used,
        measurements_gated: gated,
        final_pos_err_m: geom::norm(fe),
        srp_estimate_ms2: ekf.x[8] * SRP_UNIT,
        srp_truth_ms2: srp_truth,
        series,
    })
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::ssv::pattern::{Axis, NamedAntenna};
    use crate::ssv::sweep::NoEffects;

    fn cfg(orbit: UserOrbit, minutes: f64) -> NavConfig {
        let ants = |b| {
            (
                b,
                vec![
                    UserAntenna::named(&NamedAntenna::BookletHighGain, b, Axis::Nadir),
                    UserAntenna::named(&NamedAntenna::BookletPatch, b, Axis::Zenith),
                ],
            )
        };
        NavConfig {
            orbit,
            duration_min: minutes,
            step_s: 60.0,
            cn0_min_dbhz: 20.0,
            constellations: vec![
                Constellation::Gps,
                Constellation::Galileo,
                Constellation::Glonass,
                Constellation::Bds,
            ],
            bands: vec![Band::L1, Band::L5],
            antennas: vec![ants(Band::L1), ants(Band::L5)],
            tx: TxPattern::Booklet,
            sigma_35_dbhz_m: 3.0,
            srp_area_to_mass: 0.02,
            init_pos_sigma_m: 1000.0,
            init_vel_sigma_ms: 1.0,
            accel_psd: 1e-11,
            clock_drift_walk: 1e-4,
            seed: 7,
            series_every_epochs: 0,
            beam_override_deg: Vec::new(),
        }
    }

    fn heo() -> UserOrbit {
        crate::ssv::scenario::preset_orbit("heo").unwrap()
    }

    #[test]
    fn the_filter_converges_where_signals_are_plentiful_and_is_deterministic() {
        // The first stretch of the HEO from perigee: the receiver sees many signals and the filter pulls in.
        let a = run_nav(&cfg(heo(), 240.0), &NoEffects).unwrap();
        let b = run_nav(&cfg(heo(), 240.0), &NoEffects).unwrap();
        assert_eq!(a, b);
        let whole = &a.phases[0];
        assert!(whole.epochs_with_4 > 100, "{whole:?}");
        // From a 1 km, 1 m/s start the filter reaches tens of metres.
        assert!(
            a.final_pos_err_m < 100.0,
            "final error {}",
            a.final_pos_err_m
        );
        assert!(a.measurements_used > 500);
    }

    #[test]
    fn the_covariance_is_consistent_with_the_error() {
        let a = run_nav(&cfg(heo(), 240.0), &NoEffects).unwrap();
        let nees = a.phases[0].pos_nees_mean.unwrap();
        // A consistent 3-state position block averages 3; allow a wide band for a short single-seed run.
        assert!((0.3..30.0).contains(&nees), "mean NEES {nees}");
    }

    #[test]
    fn without_signals_the_filter_coasts_and_the_gap_is_reported() {
        let mut c = cfg(heo(), 120.0);
        c.cn0_min_dbhz = 200.0;
        let a = run_nav(&c, &NoEffects).unwrap();
        assert_eq!(a.measurements_used, 0);
        assert!((a.longest_gap_min - 120.0).abs() < 1.1);
    }
}
