// SPDX-License-Identifier: AGPL-3.0-only
//! The two sweeps of the `gnss-ssv` kind: the **shell** (users on a sphere at a fixed altitude, the booklet's global
//! metric) and the **trajectory** (one spacecraft along an orbit).
//!
//! Both count, per epoch, the signals a user can use (geometric access, a transmit pattern, a receive antenna, and a
//! carrier-to-noise-density threshold) and reduce that to the booklet's metrics: availability of at least one and of at least
//! four signals, and the maximum outage duration. The trajectory sweep adds the received C/N0, the dilution of precision
//! of the signals in view, and how many of the links come through the main lobe and how many through sidelobes.

use super::constellations::{
    self, free_space_loss_db, mrtp_dbw, noise_density_dbw_hz, Band, Constellation, SatClass,
    Satellite, SignalSpec, C_LIGHT, MU_BOOKLET,
};
use super::geom::{self, V3};
use super::pattern::{TxPattern, UserAntenna};
use crate::portable_math::PortableFloat;
use serde::Serialize;

/// Availability of one signal group (one constellation in one band, or all of them combined).
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct Availability {
    /// Share of (user, epoch) pairs with at least one signal, percent.
    pub at_least_1_pct: f64,
    /// Share with at least four signals, percent.
    pub at_least_4_pct: f64,
    /// Longest run without any signal, minutes (the worst user; the run length is capped at the simulated duration).
    pub max_outage_1_min: f64,
    /// Longest run with fewer than four signals, minutes.
    pub max_outage_4_min: f64,
    /// Some user never has a signal over the whole run (the booklet's `*` for one signal).
    pub never_available_1: bool,
    /// Some user never has four signals (the booklet's `*` for four signals).
    pub never_available_4: bool,
}

/// One signal group's availability, named.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct ShellGroup {
    /// The constellation's name, or `combined`.
    pub name: String,
    /// Its availability over the shell.
    #[serde(flatten)]
    pub availability: Availability,
}

/// One band's results.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct BandResult {
    /// The band.
    pub band: Band,
    /// One entry per constellation with a signal in the band, then `combined`.
    pub groups: Vec<ShellGroup>,
}

/// The shell sweep's inputs.
#[derive(Clone, Debug)]
pub struct ShellConfig {
    /// Altitude of the user sphere above the booklet's 6378 km Earth, km.
    pub altitude_km: f64,
    /// A nadir-pointing hemispherical user antenna (upper SSV) instead of an omnidirectional one.
    pub hemisphere: bool,
    /// Geodesic grid subdivision levels (4: 2,562 users).
    pub grid_levels: u32,
    /// Simulated duration, minutes.
    pub duration_min: f64,
    /// Step, minutes.
    pub step_min: f64,
    /// Carrier-to-noise-density threshold, dB-Hz; `None` for geometry only.
    pub cn0_min_dbhz: Option<f64>,
    /// Constellations.
    pub constellations: Vec<Constellation>,
    /// Bands.
    pub bands: Vec<Band>,
    /// The reference user altitude of the inverse link budget (36,000 km).
    pub mrtp_reference_alt_km: f64,
}

struct SatInfo {
    group: usize,
    sat: Satellite,
    beam_deg: f64,
    rho_max_m: Option<f64>,
    nadir: bool,
}

struct Tracker {
    avail: [u64; 2],
    run: [u32; 2],
    max_run: [u32; 2],
    seen: [bool; 2],
}

/// Run the shell sweep.
pub fn run_shell(cfg: &ShellConfig) -> Result<Vec<BandResult>, String> {
    if !(cfg.duration_min > 0.0 && cfg.step_min > 0.0) {
        return Err("duration_min and step_min must be positive".into());
    }
    let n_epochs = (cfg.duration_min / cfg.step_min).round() as usize + 1;
    let grid = geom::geodesic_grid(cfg.grid_levels);
    let nu = grid.len();
    let ru = constellations::RE_BOOKLET_M + cfg.altitude_km * 1000.0;
    let (ux, uy, uz): (Vec<f64>, Vec<f64>, Vec<f64>) = (
        grid.iter().map(|v| v[0]).collect(),
        grid.iter().map(|v| v[1]).collect(),
        grid.iter().map(|v| v[2]).collect(),
    );
    let user_pos: Vec<V3> = grid.iter().map(|v| geom::scale(*v, ru)).collect();
    let rb = geom::blocking_radius_m();
    // NavIC's boresight is a fixed Earth-fixed point: 5 N, 83 E on the surface.
    let navic_target = {
        let (la, lo) = (5f64.to_radians(), 83f64.to_radians());
        let r = constellations::RE_BOOKLET_M;
        [
            r * la.pcos() * lo.pcos(),
            r * la.pcos() * lo.psin(),
            r * la.psin(),
        ]
    };
    let nd = noise_density_dbw_hz();
    let mut out = Vec::new();
    for &band in &cfg.bands {
        let mut names: Vec<Constellation> = Vec::new();
        let mut sats: Vec<SatInfo> = Vec::new();
        for &c in &cfg.constellations {
            let mut any = false;
            for sat in constellations::satellites(c) {
                let Some(spec) = constellations::signal_for(c, band, sat.class) else {
                    continue;
                };
                if !any {
                    names.push(c);
                    any = true;
                }
                sats.push(sat_info(spec, sat, names.len() - 1, cfg, nd));
            }
        }
        if sats.is_empty() {
            continue;
        }
        let ng = names.len() + 1; // the last group is the combined one
        let comb = ng - 1;
        let mut trackers: Vec<Vec<Tracker>> = (0..ng)
            .map(|_| {
                (0..nu)
                    .map(|_| Tracker {
                        avail: [0; 2],
                        run: [0; 2],
                        max_run: [0; 2],
                        seen: [false; 2],
                    })
                    .collect()
            })
            .collect();
        let mut counts: Vec<Vec<u8>> = vec![vec![0u8; nu]; ng];
        for k in 0..n_epochs {
            let t = k as f64 * cfg.step_min * 60.0;
            let era = geom::earth_rotation_angle(t);
            for c in counts.iter_mut() {
                c.iter_mut().for_each(|x| *x = 0);
            }
            for si in &sats {
                let s = geom::eci_to_ecef(si.sat.position(t), era);
                let rs = geom::norm(s);
                if si.nadir {
                    let sh = geom::scale(s, 1.0 / rs);
                    let iv = geom::visible_intervals(
                        rs,
                        ru,
                        si.beam_deg,
                        cfg.hemisphere,
                        si.rho_max_m,
                        rb,
                    );
                    if iv.n == 0 {
                        continue;
                    }
                    let mut bounds = [(0.0f64, 0.0f64); 2];
                    for (j, b) in bounds.iter_mut().enumerate().take(iv.n) {
                        *b = (iv.v[j].1.pcos(), iv.v[j].0.pcos()); // (cos hi-angle, cos lo-angle)
                    }
                    let (g, cg) = (si.group, comb);
                    for u in 0..nu {
                        let c = sh[0] * ux[u] + sh[1] * uy[u] + sh[2] * uz[u];
                        let mut hit = false;
                        for b in bounds.iter().take(iv.n) {
                            hit |= c >= b.0 && c <= b.1;
                        }
                        if hit {
                            counts[g][u] += 1;
                            counts[cg][u] += 1;
                        }
                    }
                } else {
                    let boresight = geom::unit(geom::sub(navic_target, s));
                    for (u, up) in user_pos.iter().enumerate() {
                        let lg = geom::link(s, boresight, *up, rb);
                        if lg.blocked || lg.off_boresight_deg > si.beam_deg {
                            continue;
                        }
                        if cfg.hemisphere
                            && geom::dot(geom::sub(s, *up), geom::scale(*up, -1.0)) < 0.0
                        {
                            continue;
                        }
                        if si.rho_max_m.is_some_and(|r| lg.range_m > r) {
                            continue;
                        }
                        counts[si.group][u] += 1;
                        counts[comb][u] += 1;
                    }
                }
            }
            for g in 0..ng {
                for u in 0..nu {
                    let n = counts[g][u];
                    let tr = &mut trackers[g][u];
                    for (idx, need) in [1u8, 4u8].iter().enumerate() {
                        if n >= *need {
                            tr.avail[idx] += 1;
                            tr.seen[idx] = true;
                            tr.run[idx] = 0;
                        } else {
                            tr.run[idx] += 1;
                            tr.max_run[idx] = tr.max_run[idx].max(tr.run[idx]);
                        }
                    }
                }
            }
        }
        let denom = (nu * n_epochs) as f64;
        let mut groups = Vec::new();
        for g in 0..ng {
            let mean = |i: usize| {
                trackers[g].iter().map(|t| t.avail[i] as f64).sum::<f64>() / denom * 100.0
            };
            let worst = |i: usize| {
                let m = trackers[g].iter().map(|t| t.max_run[i]).max().unwrap_or(0);
                (m as f64 * cfg.step_min).min(cfg.duration_min)
            };
            let never = |i: usize| trackers[g].iter().any(|t| !t.seen[i]);
            groups.push(ShellGroup {
                name: if g == comb {
                    "combined".to_string()
                } else {
                    names[g].name().to_string()
                },
                availability: Availability {
                    at_least_1_pct: mean(0),
                    at_least_4_pct: mean(1),
                    max_outage_1_min: worst(0),
                    max_outage_4_min: worst(1),
                    never_available_1: never(0),
                    never_available_4: never(1),
                },
            });
        }
        out.push(BandResult { band, groups });
    }
    Ok(out)
}

fn sat_info(
    spec: &SignalSpec,
    sat: Satellite,
    group: usize,
    cfg: &ShellConfig,
    nd: f64,
) -> SatInfo {
    let mrtp = mrtp_dbw(spec, cfg.mrtp_reference_alt_km);
    let rho_max_m = cfg.cn0_min_dbhz.map(|thr| {
        // C/N0 = MRTP + 0 dBi - Ls - nd >= thr  =>  Ls <= MRTP - nd - thr.
        let ls_max = mrtp - nd - thr;
        C_LIGHT / (4.0 * std::f64::consts::PI * spec.freq_hz) * 10f64.powf(ls_max / 20.0)
    });
    SatInfo {
        group,
        sat,
        beam_deg: spec.beam_deg,
        rho_max_m,
        nadir: sat.constellation != Constellation::Navic,
    }
}

// ───────────────────────────── trajectory ─────────────────────────────

/// A Keplerian orbit of the user spacecraft (osculating at the epoch).
#[derive(Clone, Copy, Debug, PartialEq, Serialize, serde::Deserialize)]
#[serde(deny_unknown_fields)]
pub struct UserOrbit {
    /// Semi-major axis, km.
    pub a_km: f64,
    /// Eccentricity.
    pub e: f64,
    /// Inclination, degrees.
    pub i_deg: f64,
    /// Right ascension of the ascending node, degrees.
    #[serde(default)]
    pub raan_deg: f64,
    /// Argument of perigee, degrees.
    #[serde(default)]
    pub argp_deg: f64,
    /// True anomaly at the epoch, degrees.
    #[serde(default)]
    pub true_anomaly_deg: f64,
}

impl UserOrbit {
    /// Mean anomaly at the epoch, radians.
    pub fn mean_anomaly_rad(&self) -> f64 {
        let nu = self.true_anomaly_deg.to_radians();
        let e = self.e;
        let ea = ((1.0 - e * e).sqrt() * nu.psin()).patan2(e + nu.pcos());
        ea - e * ea.psin()
    }

    /// Orbital period, minutes.
    pub fn period_min(&self) -> f64 {
        let a = self.a_km * 1000.0;
        2.0 * std::f64::consts::PI * (a * a * a / MU_BOOKLET).sqrt() / 60.0
    }

    /// Inertial position (m) `t_s` seconds after the epoch.
    pub fn position(&self, t_s: f64) -> V3 {
        constellations::kepler_position(
            self.a_km * 1000.0,
            self.e,
            self.i_deg.to_radians(),
            self.raan_deg.to_radians(),
            self.argp_deg.to_radians(),
            self.mean_anomaly_rad(),
            t_s,
        )
    }
}

/// The trajectory sweep's inputs.
#[derive(Clone, Debug)]
pub struct TrajectoryConfig {
    /// The user orbit.
    pub orbit: UserOrbit,
    /// Simulated duration, minutes.
    pub duration_min: f64,
    /// Step, minutes.
    pub step_min: f64,
    /// Carrier-to-noise-density threshold, dB-Hz; `None` for geometry only.
    pub cn0_min_dbhz: Option<f64>,
    /// Constellations.
    pub constellations: Vec<Constellation>,
    /// Bands.
    pub bands: Vec<Band>,
    /// Receive antennas of the user, per band: the link uses the one with the highest gain.
    pub antennas: Vec<(Band, Vec<UserAntenna>)>,
    /// Transmit pattern.
    pub tx: TxPattern,
    /// Reference user altitude of the inverse link budget, km.
    pub mrtp_reference_alt_km: f64,
    /// Keep every n-th epoch in the time series (0: none).
    pub series_every_epochs: usize,
    /// Collect the per-link medium statistics (the `fx` passed to [`run_trajectory`] supplies them).
    pub collect_limb: bool,
}

/// A summary of a quantity over the run.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct Stat {
    /// Number of samples.
    pub n: usize,
    /// Minimum.
    pub min: f64,
    /// Mean.
    pub mean: f64,
    /// Maximum.
    pub max: f64,
}

fn stat(v: &[f64]) -> Option<Stat> {
    if v.is_empty() {
        return None;
    }
    Some(Stat {
        n: v.len(),
        min: v.iter().copied().fold(f64::INFINITY, f64::min),
        mean: v.iter().sum::<f64>() / v.len() as f64,
        max: v.iter().copied().fold(f64::NEG_INFINITY, f64::max),
    })
}

/// A percentile (0 to 100) of a sorted-on-demand sample.
fn percentile(v: &mut [f64], p: f64) -> Option<f64> {
    if v.is_empty() {
        return None;
    }
    v.sort_by(f64::total_cmp);
    let k = ((p / 100.0) * (v.len() - 1) as f64).round() as usize;
    Some(v[k])
}

/// Results for one signal group along a trajectory.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct TrajectoryGroup {
    /// Constellation name or `combined`.
    pub name: String,
    /// Availability (percent of epochs) of at least one and four signals, and outage durations.
    pub availability: TrajectoryAvailability,
    /// Signals in view per epoch.
    pub signals_in_view: Option<Stat>,
    /// C/N0 of the strongest link, over the epochs that have one, dB-Hz.
    pub best_cn0_dbhz: Option<Stat>,
    /// Links received through the main lobe (at or inside the reference off-boresight angle), summed over epochs.
    pub main_lobe_links: u64,
    /// Links received through a sidelobe (beyond it), summed over epochs.
    pub sidelobe_links: u64,
}

/// Availability along a trajectory.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct TrajectoryAvailability {
    /// Percent of epochs with at least one signal.
    pub at_least_1_pct: f64,
    /// Percent with at least four.
    pub at_least_4_pct: f64,
    /// Longest outage of all signals, minutes.
    pub max_outage_1_min: f64,
    /// Longest stretch below four signals, minutes.
    pub max_outage_4_min: f64,
}

/// One epoch of the decimated series.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct SeriesPoint {
    /// Minutes since the epoch.
    pub t_min: f64,
    /// Altitude above the 6378 km Earth, km.
    pub altitude_km: f64,
    /// Combined signals in view.
    pub combined: u32,
    /// Best C/N0, dB-Hz (None when nothing is in view).
    pub best_cn0_dbhz: Option<f64>,
}

/// A band's trajectory results.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct TrajectoryBand {
    /// The band.
    pub band: Band,
    /// One group per constellation, then `combined`.
    pub groups: Vec<TrajectoryGroup>,
    /// Position DOP of the combined signals in view (epochs with at least four): median, 95th percentile, worst.
    pub pdop_median: Option<f64>,
    /// 95th percentile PDOP.
    pub pdop_p95: Option<f64>,
    /// Worst PDOP.
    pub pdop_worst: Option<f64>,
    /// What the medium did to the usable links, when collected.
    pub limb: Option<LimbStats>,
    /// Decimated time series.
    pub series: Vec<SeriesPoint>,
}

/// The medium's effect on the links that were usable (after the loss was applied).
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct LimbStats {
    /// Usable links counted.
    pub links: usize,
    /// Links whose straight ray passes the Earth below 100 km tangent altitude (through the neutral atmosphere).
    pub grazing_below_100_km: usize,
    /// Links that would have been usable without the medium's loss but were lost to it.
    pub lost_to_atmosphere: usize,
    /// Neutral-atmosphere loss on the usable links, dB (zero for the ones that do not graze).
    pub loss_db: Option<Stat>,
    /// Slant TEC of the usable links, TECU.
    pub stec_tecu: Option<Stat>,
    /// Plasmaspheric part of the slant TEC, TECU.
    pub plasmaspheric_tecu: Option<Stat>,
    /// Total excess delay at the band's first frequency, m.
    pub delay_m: Option<Stat>,
    /// Tangent altitude of the usable links, km.
    pub tangent_alt_km: Option<Stat>,
}

/// The whole trajectory result.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct TrajectoryResult {
    /// The user orbit's period, minutes.
    pub period_min: f64,
    /// Perigee and apogee altitude, km.
    pub perigee_alt_km: f64,
    /// Apogee altitude, km.
    pub apogee_alt_km: f64,
    /// Epochs simulated.
    pub epochs: usize,
    /// One entry per band.
    pub bands: Vec<TrajectoryBand>,
}

/// Position DOP of unit line-of-sight vectors with a receiver clock, or `None` for fewer than four or a singular geometry.
pub fn pdop(los: &[V3]) -> Option<f64> {
    if los.len() < 4 {
        return None;
    }
    let mut n = [[0.0f64; 4]; 4];
    for l in los {
        let h = [-l[0], -l[1], -l[2], 1.0];
        for r in 0..4 {
            for c in 0..4 {
                n[r][c] += h[r] * h[c];
            }
        }
    }
    let inv = invert4(n)?;
    Some((inv[0][0] + inv[1][1] + inv[2][2]).sqrt())
}

fn invert4(mut a: [[f64; 4]; 4]) -> Option<[[f64; 4]; 4]> {
    let mut inv = [[0.0f64; 4]; 4];
    for (i, row) in inv.iter_mut().enumerate() {
        row[i] = 1.0;
    }
    for col in 0..4 {
        let piv = (col..4).max_by(|&x, &y| a[x][col].abs().total_cmp(&a[y][col].abs()))?;
        if a[piv][col].abs() < 1e-12 {
            return None;
        }
        a.swap(col, piv);
        inv.swap(col, piv);
        let d = a[col][col];
        for c in 0..4 {
            a[col][c] /= d;
            inv[col][c] /= d;
        }
        for r in 0..4 {
            if r != col {
                let f = a[r][col];
                for c in 0..4 {
                    a[r][c] -= f * a[col][c];
                    inv[r][c] -= f * inv[col][c];
                }
            }
        }
    }
    Some(inv)
}

/// What the medium does to one link.
#[derive(Clone, Copy, Debug, Default, PartialEq, Serialize)]
pub struct LinkEffectsOut {
    /// Loss, dB (absorption plus defocusing).
    pub loss_db: f64,
    /// Excess delay, m (ionosphere, plasmasphere, neutral atmosphere).
    pub delay_m: f64,
    /// Slant total electron content, TECU.
    pub stec_tecu: f64,
    /// Of which the plasmasphere's, TECU.
    pub plasmaspheric_tecu: f64,
    /// Altitude of the closest approach of the straight ray to the Earth, km.
    pub tangent_alt_km: f64,
    /// Bending angle of the neutral atmosphere, rad.
    pub bending_rad: f64,
}

/// Extra per-link effects between the user and a transmitter (the limb-ray atmosphere).
pub trait LinkEffects {
    /// The effects on the link from `tx` to `user` (inertial positions, m) at frequency `f_hz`.
    fn effects(&self, tx: V3, user: V3, f_hz: f64) -> LinkEffectsOut;
}

/// No extra effects.
pub struct NoEffects;

impl LinkEffects for NoEffects {
    fn effects(&self, _: V3, _: V3, _: f64) -> LinkEffectsOut {
        LinkEffectsOut::default()
    }
}

/// Run the trajectory sweep.
pub fn run_trajectory(
    cfg: &TrajectoryConfig,
    fx: &dyn LinkEffects,
) -> Result<TrajectoryResult, String> {
    if !(cfg.duration_min > 0.0 && cfg.step_min > 0.0) {
        return Err("duration_min and step_min must be positive".into());
    }
    let n_epochs = (cfg.duration_min / cfg.step_min).round() as usize + 1;
    let rb = geom::blocking_radius_m();
    let nd = noise_density_dbw_hz();
    let table_pattern = matches!(cfg.tx, TxPattern::Table(_));
    let mut bands_out = Vec::new();
    for &band in &cfg.bands {
        let mut names: Vec<Constellation> = Vec::new();
        let mut sats: Vec<(usize, Satellite, SignalSpec, f64)> = Vec::new();
        for &c in &cfg.constellations {
            let mut any = false;
            for sat in constellations::satellites(c) {
                let Some(spec) = constellations::signal_for(c, band, sat.class) else {
                    continue;
                };
                if !any {
                    names.push(c);
                    any = true;
                }
                sats.push((
                    names.len() - 1,
                    sat,
                    *spec,
                    mrtp_dbw(spec, cfg.mrtp_reference_alt_km),
                ));
            }
        }
        if sats.is_empty() {
            continue;
        }
        let ng = names.len() + 1;
        let comb = ng - 1;
        let ants: &[UserAntenna] = cfg
            .antennas
            .iter()
            .find(|(b, _)| *b == band)
            .map(|(_, a)| a.as_slice())
            .unwrap_or(&[]);
        let mut cnt = vec![vec![0u32; n_epochs]; ng];
        let mut best = vec![vec![f64::NAN; n_epochs]; ng];
        let mut main = vec![0u64; ng];
        let mut side = vec![0u64; ng];
        let mut pdops = Vec::new();
        let mut series = Vec::new();
        let (mut l_loss, mut l_stec, mut l_ptec, mut l_delay, mut l_tan) =
            (Vec::new(), Vec::new(), Vec::new(), Vec::new(), Vec::new());
        let mut graze = 0usize;
        let mut lost_atm = 0usize;
        for k in 0..n_epochs {
            let t = k as f64 * cfg.step_min * 60.0;
            let era = geom::earth_rotation_angle(t);
            let u = cfg.orbit.position(t);
            let mut los_comb: Vec<V3> = Vec::new();
            for (g, sat, spec, mrtp) in &sats {
                let s = sat.position(t);
                let navic = sat.constellation == Constellation::Navic;
                let boresight = if navic {
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
                let los_to_tx = geom::scale(lg.line_of_sight, -1.0);
                let gu = if ants.is_empty() {
                    Some(0.0)
                } else {
                    ants.iter()
                        .filter_map(|a| a.gain_dbi(u, los_to_tx))
                        .fold(None, |m: Option<f64>, x| Some(m.map_or(x, |y| y.max(x))))
                };
                let Some(gu) = gu else { continue };
                let az = if table_pattern {
                    // Azimuth about the boresight, from the satellite's velocity direction.
                    let s2 = sat.position(t + 1.0);
                    let vdir = geom::sub(s2, s);
                    let bperp =
                        |x: V3| geom::sub(x, geom::scale(boresight, geom::dot(x, boresight)));
                    let (a, d) = (bperp(vdir), bperp(lg.line_of_sight));
                    let y = geom::dot(geom::cross(a, d), boresight);
                    y.patan2(geom::dot(a, d)).to_degrees()
                } else {
                    0.0
                };
                let Some(eirp) = cfg
                    .tx
                    .eirp_dbw(*mrtp, spec.beam_deg, lg.off_boresight_deg, az)
                else {
                    continue;
                };
                let eff = fx.effects(s, u, spec.freq_hz);
                let loss_db = eff.loss_db;
                let cn0 = eirp + gu - free_space_loss_db(lg.range_m, spec.freq_hz) - nd - loss_db;
                if cfg.cn0_min_dbhz.is_some_and(|thr| cn0 < thr) {
                    if cfg.collect_limb
                        && cn0 + loss_db >= cfg.cn0_min_dbhz.unwrap_or(f64::NEG_INFINITY)
                    {
                        lost_atm += 1;
                    }
                    continue;
                }
                if cfg.collect_limb {
                    l_loss.push(loss_db);
                    l_stec.push(eff.stec_tecu);
                    l_ptec.push(eff.plasmaspheric_tecu);
                    l_delay.push(eff.delay_m);
                    l_tan.push(eff.tangent_alt_km);
                    if eff.tangent_alt_km < 100.0 {
                        graze += 1;
                    }
                }
                for gi in [*g, comb] {
                    cnt[gi][k] += 1;
                    if best[gi][k].is_nan() || cn0 > best[gi][k] {
                        best[gi][k] = cn0;
                    }
                    if lg.off_boresight_deg <= spec.beam_deg {
                        main[gi] += 1;
                    } else {
                        side[gi] += 1;
                    }
                }
                los_comb.push(los_to_tx);
            }
            if let Some(p) = pdop(&los_comb) {
                pdops.push(p);
            }
            if cfg.series_every_epochs > 0 && k % cfg.series_every_epochs == 0 {
                series.push(SeriesPoint {
                    t_min: k as f64 * cfg.step_min,
                    altitude_km: (geom::norm(u) - constellations::RE_BOOKLET_M) / 1000.0,
                    combined: cnt[comb][k],
                    best_cn0_dbhz: (!best[comb][k].is_nan()).then_some(best[comb][k]),
                });
            }
        }
        let groups = (0..ng)
            .map(|g| {
                let run_max = |need: u32| {
                    let (mut run, mut m) = (0usize, 0usize);
                    for &c in &cnt[g] {
                        if c >= need {
                            run = 0;
                        } else {
                            run += 1;
                            m = m.max(run);
                        }
                    }
                    (m as f64 * cfg.step_min).min(cfg.duration_min)
                };
                let pct = |need: u32| {
                    cnt[g].iter().filter(|&&c| c >= need).count() as f64 / n_epochs as f64 * 100.0
                };
                let counts_f: Vec<f64> = cnt[g].iter().map(|&c| c as f64).collect();
                let bests: Vec<f64> = best[g].iter().copied().filter(|x| !x.is_nan()).collect();
                TrajectoryGroup {
                    name: if g == comb {
                        "combined".into()
                    } else {
                        names[g].name().into()
                    },
                    availability: TrajectoryAvailability {
                        at_least_1_pct: pct(1),
                        at_least_4_pct: pct(4),
                        max_outage_1_min: run_max(1),
                        max_outage_4_min: run_max(4),
                    },
                    signals_in_view: stat(&counts_f),
                    best_cn0_dbhz: stat(&bests),
                    main_lobe_links: main[g],
                    sidelobe_links: side[g],
                }
            })
            .collect();
        let mut pd = pdops.clone();
        bands_out.push(TrajectoryBand {
            band,
            groups,
            pdop_median: percentile(&mut pd, 50.0),
            pdop_p95: percentile(&mut pd, 95.0),
            pdop_worst: pd.last().copied(),
            limb: cfg.collect_limb.then(|| LimbStats {
                links: l_loss.len(),
                grazing_below_100_km: graze,
                lost_to_atmosphere: lost_atm,
                loss_db: stat(&l_loss),
                stec_tecu: stat(&l_stec),
                plasmaspheric_tecu: stat(&l_ptec),
                delay_m: stat(&l_delay),
                tangent_alt_km: stat(&l_tan),
            }),
            series,
        });
    }
    let a = cfg.orbit.a_km;
    Ok(TrajectoryResult {
        period_min: cfg.orbit.period_min(),
        perigee_alt_km: a * (1.0 - cfg.orbit.e) - constellations::RE_BOOKLET_M / 1000.0,
        apogee_alt_km: a * (1.0 + cfg.orbit.e) - constellations::RE_BOOKLET_M / 1000.0,
        epochs: n_epochs,
        bands: bands_out,
    })
}

#[allow(dead_code)]
fn _unused(_: SatClass) {}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn pdop_of_a_regular_tetrahedron_like_set_is_finite_and_a_flat_set_is_not() {
        let good = [
            [0.0, 0.0, 1.0],
            [0.9428, 0.0, -0.3333],
            [-0.4714, 0.8165, -0.3333],
            [-0.4714, -0.8165, -0.3333],
        ];
        let p = pdop(&good).unwrap();
        assert!(p > 1.0 && p < 3.0, "{p}");
        let flat = [
            [1.0, 0.0, 0.0],
            [0.99, 0.1, 0.0],
            [0.99, -0.1, 0.0],
            [0.98, 0.0, 0.1],
        ];
        assert!(pdop(&flat).unwrap() > 20.0);
        assert!(pdop(&good[..3]).is_none());
    }

    #[test]
    fn a_circular_user_orbit_has_its_stated_period_and_altitudes() {
        let o = UserOrbit {
            a_km: 42164.0,
            e: 0.0,
            i_deg: 0.0,
            raan_deg: 0.0,
            argp_deg: 0.0,
            true_anomaly_deg: 0.0,
        };
        assert!((o.period_min() - 1436.1).abs() < 0.5, "{}", o.period_min());
        let p = o.position(0.0);
        assert!((geom::norm(p) - 42_164_000.0).abs() < 1.0);
    }

    // A small shell run: the sweep agrees with itself between the closed-form interval path and the general predicate
    // (NavIC takes the general path), and the combined group is never worse than its parts.
    #[test]
    fn a_small_shell_run_is_internally_consistent() {
        let cfg = ShellConfig {
            altitude_km: 36000.0,
            hemisphere: true,
            grid_levels: 1,
            duration_min: 120.0,
            step_min: 10.0,
            cn0_min_dbhz: None,
            constellations: vec![
                Constellation::Gps,
                Constellation::Galileo,
                Constellation::Navic,
            ],
            bands: vec![Band::L5],
            mrtp_reference_alt_km: 36000.0,
        };
        let r = run_shell(&cfg).unwrap();
        assert_eq!(r.len(), 1);
        let g = &r[0].groups;
        assert_eq!(g.last().unwrap().name, "combined");
        let comb = g.last().unwrap().availability.at_least_1_pct;
        for x in &g[..g.len() - 1] {
            let a = &x.availability;
            assert!(comb + 1e-9 >= a.at_least_1_pct);
            assert!(a.at_least_4_pct <= a.at_least_1_pct + 1e-9);
        }
    }
}
