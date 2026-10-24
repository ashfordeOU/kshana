// SPDX-License-Identifier: AGPL-3.0-only
//! `lunar-landing-dispersion`: a landing-dispersion budget for a south-polar powered descent, from the
//! inertial drift of the descent stack and what terrain-relative navigation, LunaNet signals and lunar time
//! each take off it.
//!
//! **What is modelled.** Per horizontal axis (east, north), the navigation error of a descent stack is five
//! states `[position, velocity, accelerometer bias, attitude tilt, gyro bias]` driven by the descent's
//! specific force `s`: `p' = v`, `v' = b + s theta`, `theta' = g`. With no aid the covariance at touchdown is
//! the closed form `Phi P0 Phi'` (the leading-order laws `t^2`, `s t^2`, `s t^3`); a sequential Kalman
//! filter then takes the position fixes the enabled aids supply, each with its own 1-sigma:
//!
//! * **AFS fix.** A position fix from the relays of the illustrative LCNS-class constellation visible from
//!   the site above a flat mask. Its 1-sigma is the ENU position cofactor of the visible set (the crate's DOP
//!   kernel) times a user range error: `standalone` is `sqrt(sigma_sis^2 + sigma_th^2)`, `differential`
//!   replaces the signal-in-space part with the range-domain correction-link residual of
//!   [`crate::lunar_dpnt`] (survey, latency, quantisation, and the scenario's own residual) for a reference
//!   station `baseline_km` away. With exactly three relays visible the clock is aided instead of estimated,
//!   which is where lunar time enters the fix: the clock error becomes a common range bias `c sigma_t`.
//! * **Terrain-relative fix.** `terrain-nav` runs the crate's TERCOM/SITAN matcher
//!   ([`crate::altpnt::terrain`]) with the inertial drift at the fix time as the injected drift (its relief is
//!   the self-contained synthetic fixture, not lunar); `lola-crlb` takes the Cramer-Rao bound of matching an
//!   elevation window of the real LOLA south-polar DEM at the site, `I = sum(grad h grad h') / sigma_h^2`
//!   (a flat window gives no fix), plus a registration term.
//! * **Lunar time.** The clock error at the fix, `sigma_t`, combines the carried clock sigmas, their growth
//!   over the time since the last synchronisation, and the LTC-TT term of [`crate::lunar_time`]: with
//!   `lunar_time_mode = "tt"` the vehicle ticks TT and the accumulated offset
//!   (`LunarTimeScenario::offset_at_horizon_us`) is an uncorrected bias; with `"ltc"` only the uncertainty of
//!   the published 56 to 59 us/day band over the horizon remains; `"off"` ignores clock error. A time-tag
//!   error moves every fix along track by `v_h(t) sigma_t`.
//!
//! Landing dispersion is the navigation error at touchdown plus an independent guidance dispersion. The
//! `ablation` table runs every on/off combination of the aids, so each one's worth is read off, not argued.
//!
//! The core is [`LunarLandingScenario::run_phase`], a function of `(config, carried state)`.
//!
//! **Honesty.** MODELLED. The IMU class, the specific-force profile, the relay set, the signal-in-space error,
//! the registration and guidance terms are ILLUSTRATIVE inputs, not measurements. The terrain-relative
//! `terrain-nav` mode uses a synthetic relief and an Earth metre scale; `lola-crlb` is a bound on the DEM's
//! own resolution (1200 m per pixel), not on a camera. AFS availability is taken at one epoch for the whole
//! descent, from a flat mask without the site's horizon (the map kind adds the horizon). Advisory software,
//! not certified navigation equipment.

use crate::altpnt::terrain::{run_terrain_nav, TerrainNavCfg};
use crate::gravimeter::M_PER_DEG;
use crate::lunar::{mci_to_mcmf, selenographic_to_mcmf, Selenographic, LUNAR_SIGMA_URE_M};
use crate::lunar_dpnt::LunarDpntScenario;
use crate::lunar_phase::{Carried, Cov6, Dm};
use crate::lunar_service::{topocentric_basis, visible_sat_positions, LunarConstellation};
use crate::lunar_terrain::PolarDem;
use crate::lunar_time::{LunarTimeScenario, RATE_BAND_HIGH_US_DAY, RATE_BAND_LOW_US_DAY};
use crate::orbit::dop_cov;
use crate::portable_distr::{Distribution, Normal};
use rand::SeedableRng;
use rand_chacha::ChaCha8Rng;
use serde::Deserialize;
use serde_json::{json, Value};

type Vec3 = [f64; 3];

const LABEL: &str = "MODELLED";
const C_LIGHT: f64 = 299_792_458.0;
const AFS_Q_CHIP_RATE: f64 = 5.115e6;
const NS: usize = 5;
/// Probability mass inside the 3-sigma contour of a 2-D Gaussian: `1 - exp(-9/2)`.
const P_3SIGMA_2D: f64 = 0.988_891_003_461_757_9;

/// The `lunar-landing-dispersion` scenario. Every field is optional.
#[derive(Clone, Debug, Default, Deserialize)]
pub struct LunarLandingScenario {
    /// Site selenographic latitude (deg). Default -89.5.
    pub site_lat_deg: Option<f64>,
    /// Site selenographic longitude (deg). Default 0.
    pub site_lon_deg: Option<f64>,
    /// Further site latitudes (deg, at the same longitude) tabulated beside the headline site.
    pub more_site_lats_deg: Option<Vec<f64>>,
    /// Powered-descent duration (s). Default 600.
    pub descent_s: Option<f64>,
    /// Specific force along the descent (m/s^2); couples tilt into horizontal acceleration. Default 3.
    pub specific_force_m_s2: Option<f64>,
    /// Horizontal speed at the start of the descent, falling linearly to zero (m/s). Default 150.
    pub horizontal_speed_m_s: Option<f64>,
    /// Accelerometer bias 1-sigma (micro-g). Default 100.
    pub accel_bias_ug: Option<f64>,
    /// Initial attitude alignment 1-sigma (arcmin). Default 3.
    pub align_arcmin: Option<f64>,
    /// Gyro bias 1-sigma (deg/hour). Default 0.01.
    pub gyro_bias_deg_per_hr: Option<f64>,
    /// Chaser prior position 1-sigma (m) when run standalone. Default 100.
    pub carried_pos_sigma_m: Option<f64>,
    /// Chaser prior velocity 1-sigma (m/s) when run standalone. Default 0.1.
    pub carried_vel_sigma_m_s: Option<f64>,
    /// Guidance dispersion per horizontal axis, 1-sigma (m). Default 20.
    pub guidance_sigma_m: Option<f64>,
    /// AFS aiding: `off`, `standalone` (default) or `differential`.
    pub afs_mode: Option<String>,
    /// Relays in the illustrative constellation (3 to 24). Default 8.
    pub n_relays: Option<usize>,
    /// Elevation mask (deg). Default 5.
    pub mask_deg: Option<f64>,
    /// AFS carrier-to-noise density (dB-Hz). Default 35.
    pub afs_cn0_dbhz: Option<f64>,
    /// Signal-in-space user range error, 1-sigma (m), for `standalone`. Default the LNIS nominal 30 m.
    pub sis_ure_m: Option<f64>,
    /// First AFS fix after the start of the descent (s). Default 60.
    pub afs_first_fix_s: Option<f64>,
    /// Interval between AFS fixes (s). Default 60.
    pub afs_interval_s: Option<f64>,
    /// Reference-station baseline for `differential` (km). Default 10.
    pub baseline_km: Option<f64>,
    /// Terrain-relative aiding: `off`, `terrain-nav` (default) or `lola-crlb`.
    pub trn_source: Option<String>,
    /// Time of the terrain-relative fix after the start of the descent (s). Default 480.
    pub trn_fix_time_s: Option<f64>,
    /// `terrain-nav`: altimeter 1-sigma (m). Default 8.
    pub trn_altimeter_sigma_m: Option<f64>,
    /// `terrain-nav`: map representation 1-sigma (m). Default 15.
    pub trn_map_sigma_m: Option<f64>,
    /// `lola-crlb`: path of the DEM descriptor. Default `data/lunar-dem/lola_ldem_75s_1200m_crop.toml`.
    pub dem_descriptor: Option<String>,
    /// `lola-crlb`: width of the matched window (m). Default 12000.
    pub trn_window_m: Option<f64>,
    /// `lola-crlb`: height 1-sigma of the matched elevations (m). Default 5.
    pub trn_height_sigma_m: Option<f64>,
    /// `lola-crlb`: map registration 1-sigma per axis (m). ILLUSTRATIVE default 30.
    pub trn_registration_sigma_m: Option<f64>,
    /// Lunar time: `off`, `ltc` (default) or `tt`.
    pub lunar_time_mode: Option<String>,
    /// Days since the vehicle clock was last synchronised. Default 3.
    pub time_since_sync_days: Option<f64>,
    /// Monte Carlo landings. Default 2000.
    pub n_trials: Option<usize>,
    /// Seed. Default 20261024.
    pub seed: Option<u64>,
}

/// A phase's result.
#[derive(Clone, Debug)]
pub struct LandingOut {
    /// The covariance handed on, at touchdown, in MCI.
    pub carried_out: Carried,
    /// The result document.
    pub report: Value,
    /// One line for the terminal.
    pub summary: String,
}

#[derive(Clone, Copy, PartialEq, Eq, Debug)]
enum AfsMode {
    Off,
    Standalone,
    Differential,
}

#[derive(Clone, Copy, PartialEq, Eq, Debug)]
enum TrnSource {
    Off,
    TerrainNav,
    LolaCrlb,
}

#[derive(Clone, Copy, PartialEq, Eq, Debug)]
enum TimeMode {
    Off,
    Ltc,
    Tt,
}

/// Which aids a fusion run uses.
#[derive(Clone, Copy, Debug)]
struct Aids {
    afs: bool,
    trn: bool,
}

struct Resolved {
    lat: f64,
    lon: f64,
    more_lats: Vec<f64>,
    t_end: f64,
    s: f64,
    v0: f64,
    sig_ab: f64,
    sig_th0: f64,
    sig_gb: f64,
    sig_guid: f64,
    afs: AfsMode,
    n_relays: usize,
    mask_rad: f64,
    sigma_afs_th: f64,
    sis: f64,
    afs_first: f64,
    afs_dt: f64,
    baseline_km: f64,
    trn: TrnSource,
    trn_t: f64,
    trn_alt: f64,
    trn_map: f64,
    dem_path: String,
    trn_window: f64,
    trn_h_sigma: f64,
    trn_reg: f64,
    time: TimeMode,
    sync_days: f64,
    trials: usize,
    seed: u64,
}

fn norm(a: Vec3) -> f64 {
    (a[0] * a[0] + a[1] * a[1] + a[2] * a[2]).sqrt()
}
fn dot(a: Vec3, b: Vec3) -> f64 {
    a[0] * b[0] + a[1] * b[1] + a[2] * b[2]
}
fn sub(a: Vec3, b: Vec3) -> Vec3 {
    [a[0] - b[0], a[1] - b[1], a[2] - b[2]]
}

fn sigma_th(cn0_dbhz: f64) -> f64 {
    let cn0 = 10f64.powf(cn0_dbhz / 10.0);
    let beta = std::f64::consts::PI * AFS_Q_CHIP_RATE / 3f64.sqrt();
    C_LIGHT / (beta * (2.0 * cn0).sqrt())
}

/// State-transition matrix of the five-state axis model over `dt`.
fn phi(dt: f64, s: f64) -> Dm {
    let mut m = Dm::eye(NS);
    m.set(0, 1, dt);
    m.set(0, 2, 0.5 * dt * dt);
    m.set(0, 3, 0.5 * s * dt * dt);
    m.set(0, 4, s * dt * dt * dt / 6.0);
    m.set(1, 2, dt);
    m.set(1, 3, s * dt);
    m.set(1, 4, 0.5 * s * dt * dt);
    m.set(3, 4, dt);
    m
}

fn predict(p: &Dm, dt: f64, s: f64) -> Dm {
    let f = phi(dt, s);
    let mut q = f.mul(p).mul(&f.t());
    q.symmetrise();
    q
}

/// Joseph-form scalar position update.
fn update(p: &Dm, r: f64) -> Dm {
    let pht: Vec<f64> = (0..NS).map(|i| p.at(i, 0)).collect();
    let sv = p.at(0, 0) + r;
    let k: Vec<f64> = pht.iter().map(|x| x / sv).collect();
    let mut ikh = Dm::eye(NS);
    for i in 0..NS {
        ikh.add_at(i, 0, -k[i]);
    }
    let mut out = ikh.mul(p).mul(&ikh.t());
    for i in 0..NS {
        for j in 0..NS {
            out.add_at(i, j, k[i] * r * k[j]);
        }
    }
    out.symmetrise();
    out
}

/// One axis: prior `p0`, the position fixes `(time, variance)` sorted in time, run to `t_end`.
fn axis_cov(p0: &Dm, s: f64, t_end: f64, fixes: &[(f64, f64)]) -> Dm {
    let mut p = p0.clone();
    let mut t = 0.0;
    for &(tf, r) in fixes {
        if tf > t_end {
            continue;
        }
        p = predict(&p, tf - t, s);
        p = update(&p, r);
        t = tf;
    }
    predict(&p, t_end - t, s)
}

/// One axis by Monte Carlo: the true error state is drawn from the prior, the fixes are drawn from their
/// stated variances, and the filter runs. Returns the final position error of the estimate.
fn axis_trial(
    l0: &Dm,
    p0: &Dm,
    s: f64,
    t_end: f64,
    fixes: &[(f64, f64)],
    g: &mut dyn FnMut() -> f64,
) -> f64 {
    let xi: Vec<f64> = (0..NS).map(|_| g()).collect();
    let mut x: Vec<f64> = (0..NS)
        .map(|i| (0..NS).map(|j| l0.at(i, j) * xi[j]).sum())
        .collect();
    let mut xh = vec![0.0; NS];
    let mut p = p0.clone();
    let mut t = 0.0;
    let step = |x: &mut Vec<f64>, dt: f64| {
        let f = phi(dt, s);
        *x = (0..NS)
            .map(|i| (0..NS).map(|j| f.at(i, j) * x[j]).sum())
            .collect();
    };
    for &(tf, r) in fixes {
        if tf > t_end {
            continue;
        }
        let dt = tf - t;
        step(&mut x, dt);
        step(&mut xh, dt);
        p = predict(&p, dt, s);
        let z = x[0] + r.sqrt() * g();
        let sv = p.at(0, 0) + r;
        let innov = z - xh[0];
        for i in 0..NS {
            xh[i] += p.at(i, 0) / sv * innov;
        }
        p = update(&p, r);
        t = tf;
    }
    let dt = t_end - t;
    step(&mut x, dt);
    step(&mut xh, dt);
    x[0] - xh[0]
}

/// The ENU position cofactor (3x3) of a visible set, with the clock estimated (four or more) or aided
/// (exactly three, returning also the clock-to-position transfer vector `w = Q H' 1` in ENU).
fn enu_cofactor(user: Vec3, vis: &[Vec3]) -> Option<(Dm, Option<[f64; 3]>)> {
    match vis.len() {
        n if n >= 4 => dop_cov(user, vis).map(|c| {
            let mut m = Dm::zeros(3, 3);
            for i in 0..3 {
                for j in 0..3 {
                    m.set(i, j, c.q_enu[i][j]);
                }
            }
            (m, None)
        }),
        3 => {
            let (e, n, u) = topocentric_basis(user);
            let mut h = Dm::zeros(3, 3);
            for (i, sv) in vis.iter().enumerate() {
                let d = sub(*sv, user);
                let r = norm(d);
                let los = [d[0] / r, d[1] / r, d[2] / r];
                // Row of H: minus the line of sight, in ENU.
                h.set(i, 0, -dot(los, e));
                h.set(i, 1, -dot(los, n));
                h.set(i, 2, -dot(los, u));
            }
            let ata = h.t().mul(&h);
            let q = ata.solve_spd(&Dm::eye(3))?;
            let ones = Dm {
                r: 3,
                c: 1,
                d: vec![1.0; 3],
            };
            let w = q.mul(&h.t()).mul(&ones);
            Some((q, Some([w.d[0], w.d[1], w.d[2]])))
        }
        _ => None,
    }
}

/// The reduced LOLA window Cramer-Rao bound for matching elevations at the site, per ENU axis.
/// `None` for a window with too few valid points, no relief across it, or relief that constrains one
/// direction only (the aperture problem).
fn lola_crlb(
    dem: &PolarDem,
    site: Vec3,
    window_m: f64,
    sample_m: f64,
    sigma_h: f64,
) -> Option<(f64, f64)> {
    let (e, n, _) = topocentric_basis(site);
    let rr = dem.reference_radius_m;
    let site_dir = [
        site[0] / norm(site),
        site[1] / norm(site),
        site[2] / norm(site),
    ];
    let h_at = |de: f64, dn: f64| -> Option<f64> {
        let p: Vec3 = std::array::from_fn(|i| site_dir[i] + (de * e[i] + dn * n[i]) / rr);
        let m = norm(p);
        let d = [p[0] / m, p[1] / m, p[2] / m];
        dem.height_at_deg(d[2].asin().to_degrees(), d[1].atan2(d[0]).to_degrees())
    };
    let half = (window_m / (2.0 * sample_m)).floor() as i64;
    let (mut see, mut sen, mut snn, mut count) = (0.0, 0.0, 0.0, 0usize);
    for i in -half..=half {
        for j in -half..=half {
            let (x, y) = (i as f64 * sample_m, j as f64 * sample_m);
            let (Some(hxp), Some(hxm), Some(hyp), Some(hym)) = (
                h_at(x + sample_m, y),
                h_at(x - sample_m, y),
                h_at(x, y + sample_m),
                h_at(x, y - sample_m),
            ) else {
                continue;
            };
            let ge = (hxp - hxm) / (2.0 * sample_m);
            let gn = (hyp - hym) / (2.0 * sample_m);
            see += ge * ge;
            sen += ge * gn;
            snn += gn * gn;
            count += 1;
        }
    }
    if count < 9 {
        return None;
    }
    let s2 = sigma_h * sigma_h;
    let (a, b, c) = (see / s2, sen / s2, snn / s2);
    // Aperture problem: a window whose relief constrains one direction only (a plane, a ridge) fixes one
    // coordinate and leaves the other to the registration. No fix is claimed unless the weak axis of the
    // information is at least 1e-3 of the strong one, so its sigma is within about 30 times the strong axis's.
    let mean = 0.5 * (a + c);
    let radius = (0.25 * (a - c) * (a - c) + b * b).sqrt();
    let (lmax, lmin) = (mean + radius, mean - radius);
    let det = a * c - b * b;
    if !(lmax.is_finite() && lmin >= 1e-3 * lmax && det > 0.0) {
        return None;
    }
    Some(((c / det).sqrt(), (a / det).sqrt()))
}

/// Everything the three aids contribute for one site, before fusion.
struct SiteAids {
    /// AFS per-axis `(east, north)` fix 1-sigma (m) before the time-tag term, if any fix is possible.
    afs_sigma: Option<(f64, f64)>,
    afs_relays_visible: usize,
    afs_clock_aided: bool,
    /// The range-domain sigma of the differential correction link (m), when differential.
    dpnt_range_sigma_m: Option<f64>,
    /// TRN per-axis 1-sigma (m), if the source is on and a fix is possible.
    trn_sigma: Option<(f64, f64)>,
    trn_matched_error_m: Option<f64>,
    ltc_offset_us: f64,
    clock_sigma_s: f64,
}

impl LunarLandingScenario {
    fn resolve(&self) -> Result<Resolved, String> {
        let lat = self.site_lat_deg.unwrap_or(-89.5);
        let lon = self.site_lon_deg.unwrap_or(0.0);
        let more = self.more_site_lats_deg.clone().unwrap_or_default();
        if !((-90.0..=90.0).contains(&lat) && (-180.0..=360.0).contains(&lon))
            || more.iter().any(|l| !(-90.0..=90.0).contains(l))
        {
            return Err("site latitude must be in [-90, 90] and longitude in [-180, 360]".into());
        }
        let t_end = self.descent_s.unwrap_or(600.0);
        if !(t_end >= 60.0 && t_end <= 3600.0) {
            return Err("descent_s must be in [60, 3600]".into());
        }
        let pos = |v: Option<f64>, d: f64, name: &str| -> Result<f64, String> {
            let x = v.unwrap_or(d);
            if x.is_finite() && x >= 0.0 {
                Ok(x)
            } else {
                Err(format!("{name} must be finite and non-negative"))
            }
        };
        let afs = match self.afs_mode.as_deref().unwrap_or("standalone") {
            "off" => AfsMode::Off,
            "standalone" => AfsMode::Standalone,
            "differential" => AfsMode::Differential,
            o => {
                return Err(format!(
                    "afs_mode must be off, standalone or differential, got `{o}`"
                ))
            }
        };
        let trn = match self.trn_source.as_deref().unwrap_or("terrain-nav") {
            "off" => TrnSource::Off,
            "terrain-nav" => TrnSource::TerrainNav,
            "lola-crlb" => TrnSource::LolaCrlb,
            o => {
                return Err(format!(
                    "trn_source must be off, terrain-nav or lola-crlb, got `{o}`"
                ))
            }
        };
        let time = match self.lunar_time_mode.as_deref().unwrap_or("ltc") {
            "off" => TimeMode::Off,
            "ltc" => TimeMode::Ltc,
            "tt" => TimeMode::Tt,
            o => return Err(format!("lunar_time_mode must be off, ltc or tt, got `{o}`")),
        };
        let n_relays = self.n_relays.unwrap_or(8);
        if !(3..=24).contains(&n_relays) {
            return Err("n_relays must be in 3..=24".into());
        }
        let trn_t = self.trn_fix_time_s.unwrap_or(480.0);
        let afs_first = self.afs_first_fix_s.unwrap_or(60.0);
        let afs_dt = self.afs_interval_s.unwrap_or(60.0);
        if !(afs_dt > 0.0 && afs_first >= 0.0 && trn_t > 0.0 && trn_t <= t_end) {
            return Err("fix times must be positive, afs_interval_s > 0 and trn_fix_time_s within the descent".into());
        }
        let sync_days = pos(self.time_since_sync_days, 3.0, "time_since_sync_days")?;
        let trn_window = pos(self.trn_window_m, 12_000.0, "trn_window_m")?;
        if trn_window < 3600.0 {
            return Err("trn_window_m must be at least 3600".into());
        }
        let trn_h_sigma = self.trn_height_sigma_m.unwrap_or(5.0);
        if !(trn_h_sigma > 0.0) {
            return Err("trn_height_sigma_m must be positive".into());
        }
        Ok(Resolved {
            lat,
            lon,
            more_lats: more,
            t_end,
            s: pos(self.specific_force_m_s2, 3.0, "specific_force_m_s2")?,
            v0: pos(self.horizontal_speed_m_s, 150.0, "horizontal_speed_m_s")?,
            sig_ab: pos(self.accel_bias_ug, 100.0, "accel_bias_ug")? * 9.806_65e-6,
            sig_th0: pos(self.align_arcmin, 3.0, "align_arcmin")? / 60.0 * std::f64::consts::PI
                / 180.0,
            sig_gb: pos(self.gyro_bias_deg_per_hr, 0.01, "gyro_bias_deg_per_hr")?
                * std::f64::consts::PI
                / 180.0
                / 3600.0,
            sig_guid: pos(self.guidance_sigma_m, 20.0, "guidance_sigma_m")?,
            afs,
            n_relays,
            mask_rad: pos(self.mask_deg, 5.0, "mask_deg")?.to_radians(),
            sigma_afs_th: sigma_th(pos(self.afs_cn0_dbhz, 35.0, "afs_cn0_dbhz")?),
            sis: pos(self.sis_ure_m, LUNAR_SIGMA_URE_M, "sis_ure_m")?,
            afs_first,
            afs_dt,
            baseline_km: pos(self.baseline_km, 10.0, "baseline_km")?,
            trn,
            trn_t,
            trn_alt: pos(self.trn_altimeter_sigma_m, 8.0, "trn_altimeter_sigma_m")?,
            trn_map: pos(self.trn_map_sigma_m, 15.0, "trn_map_sigma_m")?,
            dem_path: self
                .dem_descriptor
                .clone()
                .unwrap_or_else(|| "data/lunar-dem/lola_ldem_75s_1200m_crop.toml".to_string()),
            trn_window,
            trn_h_sigma,
            trn_reg: pos(
                self.trn_registration_sigma_m,
                30.0,
                "trn_registration_sigma_m",
            )?,
            time,
            sync_days,
            trials: self.n_trials.unwrap_or(2000),
            seed: self.seed.unwrap_or(20_261_024),
        })
    }

    /// The prior of one axis from the carried covariance and the IMU.
    fn axis_prior(&self, cfg: &Resolved, sp: f64, sv: f64) -> Dm {
        let mut p = Dm::zeros(NS, NS);
        p.set(0, 0, sp * sp);
        p.set(1, 1, sv * sv);
        p.set(2, 2, cfg.sig_ab * cfg.sig_ab);
        p.set(3, 3, cfg.sig_th0 * cfg.sig_th0);
        p.set(4, 4, cfg.sig_gb * cfg.sig_gb);
        p
    }

    /// The carried covariance rotated into the site's ENU frame; returns `(sigma_pos_E, sigma_pos_N,
    /// sigma_vel_E, sigma_vel_N)` and the ENU basis in MCI for the way back.
    fn carried_to_enu(
        &self,
        cfg: &Resolved,
        carried: &Carried,
        lat: f64,
    ) -> Result<([f64; 4], [Vec3; 3]), String> {
        if carried.frame != crate::lunar_phase::Frame::Mci {
            return Err("lunar-landing-dispersion expects the carried covariance in MCI; the thread converts frames".into());
        }
        if !carried.is_valid() {
            return Err("carried covariance is not symmetric with a non-negative diagonal".into());
        }
        let site = selenographic_to_mcmf(Selenographic {
            lat_rad: lat.to_radians(),
            lon_rad: cfg.lon.to_radians(),
            alt_m: 0.0,
        });
        let (e, n, u) = topocentric_basis(site);
        // The MCI-to-MCMF rotation at the start of the descent, as columns of images of the unit vectors.
        let img: [Vec3; 3] = [
            mci_to_mcmf([1.0, 0.0, 0.0], 0.0),
            mci_to_mcmf([0.0, 1.0, 0.0], 0.0),
            mci_to_mcmf([0.0, 0.0, 1.0], 0.0),
        ];
        // ENU basis vectors expressed in MCI: component k is the dot of the MCMF vector with the image of x_k.
        let to_mci = |v: Vec3| -> Vec3 { [dot(v, img[0]), dot(v, img[1]), dot(v, img[2])] };
        let basis = [to_mci(e), to_mci(n), to_mci(u)];
        let quad = |b: Vec3, off: usize| -> f64 {
            let mut s = 0.0;
            for i in 0..3 {
                for j in 0..3 {
                    s += b[i] * carried.cov[off + i][off + j] * b[j];
                }
            }
            s.max(0.0).sqrt()
        };
        Ok((
            [
                quad(basis[0], 0),
                quad(basis[1], 0),
                quad(basis[0], 3),
                quad(basis[1], 3),
            ],
            basis,
        ))
    }

    fn clock_sigma_s(&self, cfg: &Resolved, carried: &Carried) -> (f64, f64) {
        let horizon = cfg.sync_days;
        let ltc_us = LunarTimeScenario {
            horizon_days: horizon,
            ..Default::default()
        }
        .run()
        .offset_at_horizon_us;
        let age_s = horizon * 86_400.0;
        let base = carried.clock_bias_sigma_s.powi(2)
            + (carried.clock_drift_sigma_s_per_s * age_s).powi(2);
        let extra = match cfg.time {
            TimeMode::Off => return (0.0, ltc_us),
            TimeMode::Tt => (ltc_us.abs() * 1e-6).powi(2),
            TimeMode::Ltc => {
                let sig_rate_us_day = (RATE_BAND_HIGH_US_DAY - RATE_BAND_LOW_US_DAY) / 12f64.sqrt();
                (sig_rate_us_day * horizon * 1e-6).powi(2)
            }
        };
        ((base + extra).sqrt(), ltc_us)
    }

    /// Resolve every aid's contribution at one site.
    fn site_aids(
        &self,
        cfg: &Resolved,
        carried: &Carried,
        lat: f64,
        ins_sigma_at_trn: (f64, f64),
        dem: Option<&PolarDem>,
    ) -> Result<SiteAids, String> {
        let site = selenographic_to_mcmf(Selenographic {
            lat_rad: lat.to_radians(),
            lon_rad: cfg.lon.to_radians(),
            alt_m: 0.0,
        });
        let (clock_sigma_s, ltc_offset_us) = self.clock_sigma_s(cfg, carried);
        // AFS.
        let mut afs_sigma = None;
        let mut dpnt_range = None;
        let mut visible = 0usize;
        let mut aided = false;
        if cfg.afs != AfsMode::Off {
            let relays = LunarConstellation::illustrative_lcns(cfg.n_relays).positions_mcmf(0.0);
            let vis = visible_sat_positions(site, &relays, cfg.mask_rad);
            visible = vis.len();
            let range_sigma = match cfg.afs {
                AfsMode::Standalone => {
                    (cfg.sis * cfg.sis + cfg.sigma_afs_th * cfg.sigma_afs_th).sqrt()
                }
                AfsMode::Differential => {
                    let d = LunarDpntScenario {
                        ref_lat_deg: lat,
                        ref_lon_deg: cfg.lon,
                        baseline_km: cfg.baseline_km,
                        ..Default::default()
                    }
                    .run();
                    let r = d.correction_link.total_with_residual_range_sigma_m;
                    dpnt_range = Some(r);
                    (r * r + cfg.sigma_afs_th * cfg.sigma_afs_th).sqrt()
                }
                AfsMode::Off => 0.0,
            };
            if let Some((q, w)) = enu_cofactor(site, &vis) {
                let mut var = [
                    q.at(0, 0) * range_sigma * range_sigma,
                    q.at(1, 1) * range_sigma * range_sigma,
                ];
                if let Some(w) = w {
                    aided = true;
                    let cs = C_LIGHT * clock_sigma_s;
                    var[0] += (cs * w[0]).powi(2);
                    var[1] += (cs * w[1]).powi(2);
                }
                afs_sigma = Some((var[0].sqrt(), var[1].sqrt()));
            }
        }
        // TRN.
        let mut trn_sigma = None;
        let mut trn_matched = None;
        match cfg.trn {
            TrnSource::Off => {}
            TrnSource::TerrainNav => {
                let tn = run_terrain_nav(&terrain_nav_cfg(
                    ins_sigma_at_trn.1,
                    ins_sigma_at_trn.0,
                    cfg.trn_alt,
                    cfg.trn_map,
                    cfg.seed,
                ));
                trn_matched = Some(tn.matched_error_m);
                let s = tn.matched_error_m / 2f64.sqrt();
                trn_sigma = Some((s, s));
            }
            TrnSource::LolaCrlb => {
                let dem = dem.ok_or("lola-crlb needs the DEM, which could not be loaded")?;
                let sample = 1200.0;
                if let Some((se, sn)) =
                    lola_crlb(dem, site, cfg.trn_window, sample, cfg.trn_h_sigma)
                {
                    trn_sigma = Some((
                        (se * se + cfg.trn_reg * cfg.trn_reg).sqrt(),
                        (sn * sn + cfg.trn_reg * cfg.trn_reg).sqrt(),
                    ));
                }
            }
        }
        Ok(SiteAids {
            afs_sigma,
            afs_relays_visible: visible,
            afs_clock_aided: aided,
            dpnt_range_sigma_m: dpnt_range,
            trn_sigma,
            trn_matched_error_m: trn_matched,
            ltc_offset_us,
            clock_sigma_s,
        })
    }

    /// Fixes (time, variance) per axis for a set of aids.
    fn fixes(&self, cfg: &Resolved, aids: Aids, a: &SiteAids) -> ([Vec<(f64, f64)>; 2], usize) {
        let vh = |t: f64| cfg.v0 * (1.0 - t / cfg.t_end).max(0.0);
        let mut out: [Vec<(f64, f64)>; 2] = [Vec::new(), Vec::new()];
        let mut n_afs = 0;
        if aids.afs {
            if let Some((se, sn)) = a.afs_sigma {
                let mut t = cfg.afs_first;
                while t < cfg.t_end {
                    let tt = (vh(t) * a.clock_sigma_s).powi(2);
                    out[0].push((t, se * se + tt));
                    out[1].push((t, sn * sn + tt));
                    n_afs += 1;
                    t += cfg.afs_dt;
                }
            }
        }
        if aids.trn {
            if let Some((se, sn)) = a.trn_sigma {
                let tt = (vh(cfg.trn_t) * a.clock_sigma_s).powi(2);
                out[0].push((cfg.trn_t, se * se + tt));
                out[1].push((cfg.trn_t, sn * sn + tt));
            }
        }
        for v in &mut out {
            v.sort_by(|x, y| x.0.total_cmp(&y.0));
        }
        (out, n_afs)
    }

    /// Navigation 1-sigma `(east, north)` at `t_end` for a set of aids.
    fn nav_sigma(&self, cfg: &Resolved, priors: &[Dm; 2], aids: Aids, a: &SiteAids) -> (f64, f64) {
        let (fx, _) = self.fixes(cfg, aids, a);
        let e = axis_cov(&priors[0], cfg.s, cfg.t_end, &fx[0])
            .at(0, 0)
            .max(0.0)
            .sqrt();
        let n = axis_cov(&priors[1], cfg.s, cfg.t_end, &fx[1])
            .at(0, 0)
            .max(0.0)
            .sqrt();
        (e, n)
    }

    /// The phase core.
    pub fn run_phase(&self, carried: &Carried) -> Result<LandingOut, String> {
        let cfg = self.resolve()?;
        let ([spe, spn, sve, svn], basis) = self.carried_to_enu(&cfg, carried, cfg.lat)?;
        let priors = [
            self.axis_prior(&cfg, spe, sve),
            self.axis_prior(&cfg, spn, svn),
        ];
        let dem = if cfg.trn == TrnSource::LolaCrlb {
            Some(PolarDem::load(&cfg.dem_path)?.0)
        } else {
            None
        };

        // The dead-reckoned inertial drift at the fix time sets the injected drift of the terrain matcher.
        let ins_at = |t: f64| -> (f64, f64) {
            let e = axis_cov(&priors[0], cfg.s, t, &[]).at(0, 0).sqrt();
            let n = axis_cov(&priors[1], cfg.s, t, &[]).at(0, 0).sqrt();
            (e, n)
        };
        let aids_main = self.site_aids(&cfg, carried, cfg.lat, ins_at(cfg.trn_t), dem.as_ref())?;

        let g2 = cfg.sig_guid * cfg.sig_guid;
        let total = |nav: (f64, f64)| ((nav.0 * nav.0 + g2).sqrt(), (nav.1 * nav.1 + g2).sqrt());
        let all = Aids {
            afs: true,
            trn: true,
        };
        let none = Aids {
            afs: false,
            trn: false,
        };
        let nav_all = self.nav_sigma(&cfg, &priors, all, &aids_main);
        let nav_none = self.nav_sigma(&cfg, &priors, none, &aids_main);
        let (sig_e, sig_n) = total(nav_all);

        // Closed-form inertial sources at touchdown, east axis (north differs only in the carried prior).
        let t = cfg.t_end;
        let src = |sp: f64, sv: f64| {
            json!([
                { "source": "carried position", "sigma_m": sp },
                { "source": "carried velocity over the descent", "sigma_m": sv * t },
                { "source": "accelerometer bias", "sigma_m": cfg.sig_ab * t * t / 2.0 },
                { "source": "initial attitude through the specific force", "sigma_m": cfg.s * cfg.sig_th0 * t * t / 2.0 },
                { "source": "gyro bias through the specific force", "sigma_m": cfg.s * cfg.sig_gb * t * t * t / 6.0 },
            ])
        };

        // Ablation: every combination of the two measurement aids (time is an input to both).
        let mut ablation = Vec::new();
        for (name, aids) in [
            ("none", none),
            (
                "afs only",
                Aids {
                    afs: true,
                    trn: false,
                },
            ),
            (
                "terrain only",
                Aids {
                    afs: false,
                    trn: true,
                },
            ),
            ("afs and terrain", all),
        ] {
            let nav = self.nav_sigma(&cfg, &priors, aids, &aids_main);
            let (e, n) = total(nav);
            ablation.push(json!({
                "aids": name,
                "nav_sigma_east_m": nav.0,
                "nav_sigma_north_m": nav.1,
                "dispersion_sigma_east_m": e,
                "dispersion_sigma_north_m": n,
                "r95_m": r95(e, n),
            }));
        }

        // Monte Carlo against the formal covariance (B3).
        let (fx, n_afs) = self.fixes(&cfg, all, &aids_main);
        let unit = Normal::new(0.0, 1.0).map_err(|e| e.to_string())?;
        let l0 = [
            priors[0]
                .cholesky()
                .ok_or("east prior is not positive definite")?,
            priors[1]
                .cholesky()
                .ok_or("north prior is not positive definite")?,
        ];
        let mut rng = ChaCha8Rng::seed_from_u64(cfg.seed);
        let mut g = || unit.sample(&mut rng);
        let (mut inside, mut nees_sum) = (0usize, 0.0);
        let n_tr = cfg.trials.max(1);
        for _ in 0..n_tr {
            let ee = axis_trial(&l0[0], &priors[0], cfg.s, cfg.t_end, &fx[0], &mut g)
                + cfg.sig_guid * g();
            let en = axis_trial(&l0[1], &priors[1], cfg.s, cfg.t_end, &fx[1], &mut g)
                + cfg.sig_guid * g();
            let q = (ee / sig_e).powi(2) + (en / sig_n).powi(2);
            nees_sum += q;
            if q <= 9.0 {
                inside += 1;
            }
        }
        let frac = inside as f64 / n_tr as f64;

        // Other sites, headline aids on.
        let mut sites =
            vec![self.site_row(&cfg, carried, cfg.lat, &aids_main, &priors, dem.as_ref())?];
        for &lat in &cfg.more_lats {
            let ([a, b, c, d], _) = self.carried_to_enu(&cfg, carried, lat)?;
            let pri = [self.axis_prior(&cfg, a, c), self.axis_prior(&cfg, b, d)];
            let ins = |t: f64| {
                (
                    axis_cov(&pri[0], cfg.s, t, &[]).at(0, 0).sqrt(),
                    axis_cov(&pri[1], cfg.s, t, &[]).at(0, 0).sqrt(),
                )
            };
            let aids = self.site_aids(&cfg, carried, lat, ins(cfg.trn_t), dem.as_ref())?;
            sites.push(self.site_row(&cfg, carried, lat, &aids, &pri, dem.as_ref())?);
        }

        // Touchdown covariance handed on, in MCI: ENU position and a small velocity, rotated back.
        let sig_up = 1.0;
        let sig_vel = 0.05;
        let mut cov: Cov6 = [[0.0; 6]; 6];
        let sig = [sig_e, sig_n, sig_up];
        for i in 0..3 {
            for j in 0..3 {
                let mut s = 0.0;
                for k in 0..3 {
                    s += basis[k][i] * sig[k] * sig[k] * basis[k][j];
                }
                cov[i][j] = s;
            }
        }
        for (i, row) in cov.iter_mut().enumerate().skip(3) {
            row[i] = sig_vel * sig_vel;
        }
        let mut carried_out = carried.clone();
        carried_out.cov = cov;
        carried_out.epoch_jd_tdb += cfg.t_end / 86_400.0;

        let (maj, min, az) = ellipse3(sig_e, sig_n);
        let aids_ok = aids_main.afs_sigma.is_some() || aids_main.trn_sigma.is_some();
        let mut report = json!({
            "kind": "lunar-landing-dispersion",
            "label": LABEL,
            "advisory": "Advisory software, not certified navigation equipment. MODELLED: illustrative IMU class, relay set and error budget; not a landing-accuracy prediction for any vehicle or site.",
            "site": { "lat_deg": cfg.lat, "lon_deg": cfg.lon },
            "descent_s": cfg.t_end,
            "afs_mode": self.afs_mode.as_deref().unwrap_or("standalone"),
            "trn_source": self.trn_source.as_deref().unwrap_or("terrain-nav"),
            "lunar_time_mode": self.lunar_time_mode.as_deref().unwrap_or("ltc"),
            "aids_available": aids_ok,
            "observability_lost": !aids_ok,
            "inertial_sources_east": src(spe, sve),
            "inertial_sources_north": src(spn, svn),
            "inertial_only_sigma_east_m": nav_none.0,
            "inertial_only_sigma_north_m": nav_none.1,
        });
        let part2 = json!({
            "aids": {
                "afs": {
                    "relays_visible": aids_main.afs_relays_visible,
                    "clock_aided_three_relay_fix": aids_main.afs_clock_aided,
                    "fix_sigma_east_m": aids_main.afs_sigma.map(|s| s.0),
                    "fix_sigma_north_m": aids_main.afs_sigma.map(|s| s.1),
                    "fixes_used": n_afs,
                    "differential_range_sigma_m": aids_main.dpnt_range_sigma_m,
                },
                "terrain": {
                    "terrain_nav_matched_error_m": aids_main.trn_matched_error_m,
                    "fix_sigma_east_m": aids_main.trn_sigma.map(|s| s.0),
                    "fix_sigma_north_m": aids_main.trn_sigma.map(|s| s.1),
                    "fix_time_s": cfg.trn_t,
                },
                "time": {
                    "ltc_offset_us": aids_main.ltc_offset_us,
                    "clock_sigma_s": aids_main.clock_sigma_s,
                    "time_since_sync_days": cfg.sync_days,
                },
            },
            "ablation": ablation,
            "guidance_sigma_m": cfg.sig_guid,
            "touchdown": {
                "nav_sigma_east_m": nav_all.0,
                "nav_sigma_north_m": nav_all.1,
                "dispersion_sigma_east_m": sig_e,
                "dispersion_sigma_north_m": sig_n,
                "ellipse_3sigma_semi_major_m": maj,
                "ellipse_3sigma_semi_minor_m": min,
                "ellipse_3sigma_major_axis_azimuth_deg": az,
                "r95_m": r95(sig_e, sig_n),
            },
            "monte_carlo": {
                "trials": n_tr,
                "fraction_inside_3sigma_ellipse": frac,
                "expected_fraction": P_3SIGMA_2D,
                "mean_nees": nees_sum / n_tr as f64,
                "nees_dof": 2,
            },
            "sites": sites,
        });
        let part3 = json!({
            "carried_out": {
                "frame": "mci",
                "pos_sigma_enu_m": [sig_e, sig_n, sig_up],
                "vel_sigma_m_s": sig_vel,
                "evidence": "MODELLED",
            },
            "budget_rows": [
                { "source": "inertial drift, no aid, east", "sigma_m": nav_none.0, "label": LABEL },
                { "source": "inertial drift, no aid, north", "sigma_m": nav_none.1, "label": LABEL },
                { "source": "navigation at touchdown with the enabled aids, east", "sigma_m": nav_all.0, "label": LABEL },
                { "source": "navigation at touchdown with the enabled aids, north", "sigma_m": nav_all.1, "label": LABEL },
                { "source": "guidance dispersion, per axis", "sigma_m": cfg.sig_guid, "label": LABEL },
                { "source": "landing dispersion, east", "sigma_m": sig_e, "label": LABEL },
                { "source": "landing dispersion, north", "sigma_m": sig_n, "label": LABEL },
            ],
            "units": units(),
        });
        if let (Some(base), Value::Object(p2), Value::Object(p3)) =
            (report.as_object_mut(), part2, part3)
        {
            base.extend(p2);
            base.extend(p3);
        }
        let summary = format!(
            "lunar-landing-dispersion | {:.2} deg | inertial only {:.0}/{:.0} m (E/N) | with aids {:.1}/{:.1} m | dispersion R95 {:.0} m | 3-sigma ellipse {:.0} x {:.0} m | {:.1}% inside (expect {:.1}%) (MODELLED)",
            cfg.lat,
            nav_none.0,
            nav_none.1,
            nav_all.0,
            nav_all.1,
            r95(sig_e, sig_n),
            maj,
            min,
            100.0 * frac,
            100.0 * P_3SIGMA_2D
        );
        Ok(LandingOut {
            carried_out,
            report,
            summary,
        })
    }

    fn site_row(
        &self,
        cfg: &Resolved,
        _carried: &Carried,
        lat: f64,
        aids: &SiteAids,
        priors: &[Dm; 2],
        _dem: Option<&PolarDem>,
    ) -> Result<Value, String> {
        let all = Aids {
            afs: true,
            trn: true,
        };
        let none = Aids {
            afs: false,
            trn: false,
        };
        let nav = self.nav_sigma(cfg, priors, all, aids);
        let ins = self.nav_sigma(cfg, priors, none, aids);
        let g2 = cfg.sig_guid * cfg.sig_guid;
        let (e, n) = ((nav.0 * nav.0 + g2).sqrt(), (nav.1 * nav.1 + g2).sqrt());
        Ok(json!({
            "lat_deg": lat,
            "afs_relays_visible": aids.afs_relays_visible,
            "afs_fix_available": aids.afs_sigma.is_some(),
            "terrain_fix_available": aids.trn_sigma.is_some(),
            "inertial_only_r95_m": r95(ins.0, ins.1),
            "dispersion_sigma_east_m": e,
            "dispersion_sigma_north_m": n,
            "dispersion_r95_m": r95(e, n),
        }))
    }

    /// The result's chart: dispersion by aid combination.
    pub fn chart_svg(&self, json: &str) -> String {
        use crate::lunar_phase::{line_chart_svg, ChartSeries};
        let v: Value = serde_json::from_str(json).unwrap_or(Value::Null);
        let rows = v["ablation"].as_array().cloned().unwrap_or_default();
        let pts: Vec<(f64, f64)> = rows
            .iter()
            .enumerate()
            .filter_map(|(i, r)| Some((i as f64, r["r95_m"].as_f64()?)))
            .collect();
        let names: Vec<String> = rows
            .iter()
            .filter_map(|r| r["aids"].as_str().map(|s| s.to_string()))
            .collect();
        let sub = format!(
            "R95 by aids: {} | MODELLED, advisory only",
            names
                .iter()
                .enumerate()
                .map(|(i, n)| format!("{i}={n}"))
                .collect::<Vec<_>>()
                .join(", ")
        );
        line_chart_svg(
            "Lunar landing dispersion: R95 against aids used",
            &sub,
            "aid combination (index)",
            "metres",
            &[ChartSeries {
                name: "R95 of landing dispersion",
                points: pts,
            }],
        )
    }

    /// Standalone entry.
    pub fn run_json(&self) -> Result<(String, String), String> {
        let mut c = Carried::default_llo();
        c.cov = crate::lunar_phase::diag6(
            self.carried_pos_sigma_m.unwrap_or(100.0),
            self.carried_vel_sigma_m_s.unwrap_or(0.1),
        );
        let out = self.run_phase(&c)?;
        let json = serde_json::to_string_pretty(&out.report).map_err(|e| e.to_string())?;
        Ok((json, out.summary))
    }
}

/// The terrain matcher's configuration for an injected inertial drift (east, north, m): the defaults of
/// `scenarios/terrain-nav.toml`, with the drift converted to degrees at that scenario's own scale.
pub fn terrain_nav_cfg(
    drift_north_m: f64,
    drift_east_m: f64,
    altimeter_sigma_m: f64,
    map_sigma_m: f64,
    seed: u64,
) -> TerrainNavCfg {
    let (start_lat, step_lat, waypoints) = (12.05_f64, 0.004_f64, 60usize);
    let mid = start_lat + step_lat * (waypoints as f64 - 1.0) / 2.0;
    TerrainNavCfg {
        dem_seed: 1,
        start_lat_deg: start_lat,
        start_lon_deg: 20.05,
        step_lat_deg: step_lat,
        step_lon_deg: 0.003,
        waypoints,
        drift_lat_deg: drift_north_m / M_PER_DEG,
        drift_lon_deg: drift_east_m / (M_PER_DEG * mid.to_radians().cos()),
        altimeter_sigma_m,
        map_sigma_m,
        search_half_deg: 0.8,
        search_step_deg: 0.08,
        refine_stages: 3,
        refine_factor: 8.0,
        noise_seed: seed,
    }
}

/// Radius containing 95 % of a 2-D Gaussian with the given axis sigmas, by the standard approximation
/// `2.4477 sqrt((sx^2 + sy^2) / 2)`.
pub fn r95(sx: f64, sy: f64) -> f64 {
    2.4477 * ((sx * sx + sy * sy) / 2.0).sqrt()
}

/// Semi-axes and major-axis azimuth (deg from north towards east) of the 3-sigma ellipse of two axis sigmas.
fn ellipse3(se: f64, sn: f64) -> (f64, f64, f64) {
    if se >= sn {
        (3.0 * se, 3.0 * sn, 90.0)
    } else {
        (3.0 * sn, 3.0 * se, 0.0)
    }
}

fn units() -> Value {
    const ROWS: &[(&str, &str, &str, &str)] = &[
        (
            "site.lat_deg",
            "deg",
            "input",
            "site selenographic latitude",
        ),
        (
            "site.lon_deg",
            "deg",
            "input",
            "site selenographic longitude",
        ),
        ("descent_s", "s", "input", "powered-descent duration"),
        (
            "inertial_sources_east.sigma_m",
            "m",
            "closed-form",
            "position 1-sigma at touchdown from one inertial source",
        ),
        (
            "inertial_sources_north.sigma_m",
            "m",
            "closed-form",
            "position 1-sigma at touchdown from one inertial source",
        ),
        (
            "inertial_only_sigma_east_m",
            "m",
            "computed",
            "east position 1-sigma at touchdown with no aid",
        ),
        (
            "inertial_only_sigma_north_m",
            "m",
            "computed",
            "north position 1-sigma at touchdown with no aid",
        ),
        (
            "aids.afs.relays_visible",
            "1",
            "computed",
            "relays above the mask at the site",
        ),
        (
            "aids.afs.fix_sigma_east_m",
            "m",
            "computed",
            "AFS position fix 1-sigma, east, before the time-tag term",
        ),
        (
            "aids.afs.fix_sigma_north_m",
            "m",
            "computed",
            "AFS position fix 1-sigma, north, before the time-tag term",
        ),
        (
            "aids.afs.fixes_used",
            "1",
            "computed",
            "AFS fixes taken during the descent",
        ),
        (
            "aids.afs.differential_range_sigma_m",
            "m",
            "computed",
            "range-domain 1-sigma of the differential correction link, from lunar-differential-pnt",
        ),
        (
            "aids.terrain.terrain_nav_matched_error_m",
            "m",
            "computed",
            "residual error of the terrain-nav matcher for the inertial drift at the fix time",
        ),
        (
            "aids.terrain.fix_sigma_east_m",
            "m",
            "computed",
            "terrain-relative fix 1-sigma, east",
        ),
        (
            "aids.terrain.fix_sigma_north_m",
            "m",
            "computed",
            "terrain-relative fix 1-sigma, north",
        ),
        (
            "aids.terrain.fix_time_s",
            "s",
            "input",
            "time of the terrain-relative fix after the start of the descent",
        ),
        (
            "aids.time.ltc_offset_us",
            "us",
            "computed",
            "accumulated LTC-TT offset over the time since synchronisation, from lunar-time-offset",
        ),
        (
            "aids.time.clock_sigma_s",
            "s",
            "computed",
            "vehicle clock 1-sigma at the fixes",
        ),
        (
            "aids.time.time_since_sync_days",
            "d",
            "input",
            "time since the vehicle clock was synchronised",
        ),
        (
            "ablation.nav_sigma_east_m",
            "m",
            "computed",
            "navigation 1-sigma at touchdown for that aid set",
        ),
        (
            "ablation.nav_sigma_north_m",
            "m",
            "computed",
            "navigation 1-sigma at touchdown for that aid set",
        ),
        (
            "ablation.dispersion_sigma_east_m",
            "m",
            "computed",
            "landing dispersion 1-sigma including guidance",
        ),
        (
            "ablation.dispersion_sigma_north_m",
            "m",
            "computed",
            "landing dispersion 1-sigma including guidance",
        ),
        (
            "ablation.r95_m",
            "m",
            "computed",
            "radius holding 95 % of landings for that aid set",
        ),
        (
            "guidance_sigma_m",
            "m",
            "modelled-input",
            "guidance dispersion per horizontal axis",
        ),
        (
            "touchdown.nav_sigma_east_m",
            "m",
            "computed",
            "navigation 1-sigma at touchdown",
        ),
        (
            "touchdown.nav_sigma_north_m",
            "m",
            "computed",
            "navigation 1-sigma at touchdown",
        ),
        (
            "touchdown.dispersion_sigma_east_m",
            "m",
            "computed",
            "landing dispersion 1-sigma",
        ),
        (
            "touchdown.dispersion_sigma_north_m",
            "m",
            "computed",
            "landing dispersion 1-sigma",
        ),
        (
            "touchdown.ellipse_3sigma_semi_major_m",
            "m",
            "computed",
            "3-sigma ellipse semi-major axis",
        ),
        (
            "touchdown.ellipse_3sigma_semi_minor_m",
            "m",
            "computed",
            "3-sigma ellipse semi-minor axis",
        ),
        (
            "touchdown.ellipse_3sigma_major_axis_azimuth_deg",
            "deg",
            "computed",
            "azimuth of the major axis from north towards east",
        ),
        (
            "touchdown.r95_m",
            "m",
            "computed",
            "radius holding 95 % of landings",
        ),
        ("monte_carlo.trials", "1", "input", "Monte Carlo landings"),
        (
            "monte_carlo.fraction_inside_3sigma_ellipse",
            "1",
            "computed",
            "fraction of simulated landings inside the 3-sigma ellipse",
        ),
        (
            "monte_carlo.expected_fraction",
            "1",
            "closed-form",
            "1 - exp(-9/2), the 2-D Gaussian mass inside 3 sigma",
        ),
        (
            "monte_carlo.mean_nees",
            "1",
            "computed",
            "mean normalised estimation error squared, 2 expected",
        ),
        (
            "monte_carlo.nees_dof",
            "1",
            "closed-form",
            "degrees of freedom of the horizontal error",
        ),
        ("sites.lat_deg", "deg", "input", "site latitude"),
        (
            "sites.afs_relays_visible",
            "1",
            "computed",
            "relays above the mask",
        ),
        (
            "sites.inertial_only_r95_m",
            "m",
            "computed",
            "R95 with no aid, no guidance",
        ),
        (
            "sites.dispersion_sigma_east_m",
            "m",
            "computed",
            "landing dispersion 1-sigma",
        ),
        (
            "sites.dispersion_sigma_north_m",
            "m",
            "computed",
            "landing dispersion 1-sigma",
        ),
        (
            "sites.dispersion_r95_m",
            "m",
            "computed",
            "radius holding 95 % of landings",
        ),
        (
            "carried_out.pos_sigma_enu_m",
            "m",
            "computed",
            "touchdown position 1-sigma per ENU axis (vertical is an input)",
        ),
        (
            "carried_out.vel_sigma_m_s",
            "m/s",
            "modelled-input",
            "touchdown velocity 1-sigma",
        ),
        (
            "budget_rows.sigma_m",
            "m",
            "computed",
            "per-source 1-sigma in the budget table",
        ),
    ];
    let mut m = serde_json::Map::new();
    for (path, unit, prov, note) in ROWS {
        m.insert(
            (*path).to_string(),
            json!({ "unit": unit, "provenance": prov, "note": note }),
        );
    }
    Value::Object(m)
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::lunar::R_MOON_M;

    fn quick() -> LunarLandingScenario {
        LunarLandingScenario {
            n_trials: Some(400),
            ..Default::default()
        }
    }

    fn carried() -> Carried {
        Carried::default_llo()
    }

    #[test]
    fn default_runs_modelled_with_the_advisory_line() {
        let out = quick().run_phase(&carried()).unwrap();
        assert_eq!(out.report["kind"], "lunar-landing-dispersion");
        assert_eq!(out.report["label"], "MODELLED");
        assert!(out.report["advisory"]
            .as_str()
            .unwrap()
            .contains("not certified navigation equipment"));
        assert!(out.carried_out.is_valid());
    }

    #[test]
    fn same_seed_gives_identical_documents() {
        assert_eq!(quick().run_json().unwrap().0, quick().run_json().unwrap().0);
    }

    /// B4, first half: with no aid the dispersion is the inertial drift in closed form plus guidance, to 1e-9.
    #[test]
    fn b4_with_no_aid_the_landing_error_is_the_closed_form_inertial_drift() {
        let s = LunarLandingScenario {
            afs_mode: Some("off".into()),
            trn_source: Some("off".into()),
            n_trials: Some(10),
            ..Default::default()
        };
        let out = s.run_phase(&carried()).unwrap();
        let cfg = s.resolve().unwrap();
        let t = cfg.t_end;
        let ([spe, _, sve, _], _) = s.carried_to_enu(&cfg, &carried(), cfg.lat).unwrap();
        let want_nav = (spe.powi(2)
            + (sve * t).powi(2)
            + (cfg.sig_ab * t * t / 2.0).powi(2)
            + (cfg.s * cfg.sig_th0 * t * t / 2.0).powi(2)
            + (cfg.s * cfg.sig_gb * t.powi(3) / 6.0).powi(2))
        .sqrt();
        let got_nav = out.report["inertial_only_sigma_east_m"].as_f64().unwrap();
        assert!(
            ((got_nav - want_nav) / want_nav).abs() < 1e-9,
            "{got_nav} vs {want_nav}"
        );
        let want_disp = (want_nav * want_nav + cfg.sig_guid * cfg.sig_guid).sqrt();
        let got_disp = out.report["touchdown"]["dispersion_sigma_east_m"]
            .as_f64()
            .unwrap();
        assert!(((got_disp - want_disp) / want_disp).abs() < 1e-9);
    }

    /// B4, second half: each aid's contribution is exactly what the existing kind it reuses reports.
    #[test]
    fn b4_each_aid_reports_exactly_what_the_reused_kind_gives() {
        let s = LunarLandingScenario {
            afs_mode: Some("differential".into()),
            trn_source: Some("terrain-nav".into()),
            lunar_time_mode: Some("tt".into()),
            n_trials: Some(10),
            ..Default::default()
        };
        let out = s.run_phase(&carried()).unwrap();
        let cfg = s.resolve().unwrap();
        // lunar-differential-pnt
        let d = LunarDpntScenario {
            ref_lat_deg: cfg.lat,
            ref_lon_deg: cfg.lon,
            baseline_km: cfg.baseline_km,
            ..Default::default()
        }
        .run();
        let got = out.report["aids"]["afs"]["differential_range_sigma_m"]
            .as_f64()
            .unwrap();
        assert_eq!(got, d.correction_link.total_with_residual_range_sigma_m);
        // lunar-time-offset
        let lt = LunarTimeScenario {
            horizon_days: cfg.sync_days,
            ..Default::default()
        }
        .run();
        assert_eq!(
            out.report["aids"]["time"]["ltc_offset_us"]
                .as_f64()
                .unwrap(),
            lt.offset_at_horizon_us
        );
        // terrain-nav, for the inertial drift at the fix time
        let ([spe, spn, sve, svn], _) = s.carried_to_enu(&cfg, &carried(), cfg.lat).unwrap();
        let pe = s.axis_prior(&cfg, spe, sve);
        let pn = s.axis_prior(&cfg, spn, svn);
        let de = axis_cov(&pe, cfg.s, cfg.trn_t, &[]).at(0, 0).sqrt();
        let dn = axis_cov(&pn, cfg.s, cfg.trn_t, &[]).at(0, 0).sqrt();
        let tn = run_terrain_nav(&terrain_nav_cfg(dn, de, cfg.trn_alt, cfg.trn_map, cfg.seed));
        assert_eq!(
            out.report["aids"]["terrain"]["terrain_nav_matched_error_m"]
                .as_f64()
                .unwrap(),
            tn.matched_error_m
        );
    }

    /// B3: the fraction of simulated landings inside the 3-sigma ellipse, registered bar [0.975, 0.999].
    #[test]
    fn b3_ellipse_calibration() {
        let s = LunarLandingScenario {
            n_trials: Some(2000),
            seed: Some(20_261_024),
            ..Default::default()
        };
        let out = s.run_phase(&carried()).unwrap();
        let f = out.report["monte_carlo"]["fraction_inside_3sigma_ellipse"]
            .as_f64()
            .unwrap();
        println!(
            "B3 fraction inside 3-sigma ellipse: {f:.4}; mean NEES {}",
            out.report["monte_carlo"]["mean_nees"]
        );
        assert!((0.975..=0.999).contains(&f), "fraction {f}");
    }

    #[test]
    fn terrain_and_signals_help_and_never_hurt() {
        let out = quick().run_phase(&carried()).unwrap();
        let rows = out.report["ablation"].as_array().unwrap();
        let r95: Vec<f64> = rows.iter().map(|r| r["r95_m"].as_f64().unwrap()).collect();
        // none, afs only, terrain only, both
        assert!(r95[3] <= r95[1] + 1e-9 && r95[3] <= r95[2] + 1e-9);
        assert!(r95[1] <= r95[0] + 1e-9 && r95[2] <= r95[0] + 1e-9);
    }

    #[test]
    fn a_tt_clock_costs_more_than_an_ltc_clock() {
        let run = |mode: &str| {
            let s = LunarLandingScenario {
                lunar_time_mode: Some(mode.into()),
                n_trials: Some(10),
                time_since_sync_days: Some(30.0),
                ..Default::default()
            };
            s.run_phase(&carried()).unwrap().report["aids"]["time"]["clock_sigma_s"]
                .as_f64()
                .unwrap()
        };
        assert!(run("tt") > run("ltc"));
        assert_eq!(run("off"), 0.0);
    }

    #[test]
    fn the_covariance_handed_on_is_valid_and_starts_from_the_carried_epoch() {
        let c = carried();
        let out = quick().run_phase(&c).unwrap();
        assert!(out.carried_out.is_valid());
        assert!(out.carried_out.epoch_jd_tdb > c.epoch_jd_tdb);
    }

    #[test]
    fn a_flat_window_gives_no_terrain_fix() {
        let dem = PolarDem::from_heights(40, 40, 1200.0, R_MOON_M, vec![0.0f32; 1600]).unwrap();
        let site = selenographic_to_mcmf(Selenographic {
            lat_rad: (-89.9f64).to_radians(),
            lon_rad: 0.0,
            alt_m: 0.0,
        });
        assert!(lola_crlb(&dem, site, 12_000.0, 1200.0, 5.0).is_none());
    }

    /// A grid on the stereographic plane centred 5 degrees from the pole, 85 degrees south, longitude 0, where a
    /// +-6 km window is a small patch. `f(x, y)` is the height at grid offsets from the site, in grid metres.
    fn patch_dem(f: impl Fn(f64, f64) -> f64) -> (PolarDem, Vec3) {
        let (n, scale) = (300usize, 1200.0_f64);
        let rho = 2.0 * R_MOON_M * (2.5f64.to_radians()).tan();
        let mut h = vec![0.0f32; n * n];
        for l in 0..n {
            for sm in 0..n {
                let x = (sm as f64 - (n as f64 / 2.0 - 0.5)) * scale;
                let y = ((n as f64 / 2.0 - 0.5) - l as f64) * scale;
                h[l * n + sm] = f(x, y - rho) as f32;
            }
        }
        let dem = PolarDem::from_heights(n, n, scale, R_MOON_M, h).unwrap();
        let site = selenographic_to_mcmf(Selenographic {
            lat_rad: (-85.0f64).to_radians(),
            lon_rad: 0.0,
            alt_m: 0.0,
        });
        (dem, site)
    }

    #[test]
    fn a_plane_gives_no_fix_the_aperture_problem() {
        // Constant gradient: the information matrix has rank one, so one coordinate is unobservable.
        let (dem, site) = patch_dem(|x, y| 0.1 * x + 0.05 * y);
        assert!(lola_crlb(&dem, site, 12_000.0, 1200.0, 5.0).is_none());
    }

    #[test]
    fn a_bowl_matches_the_closed_form_bound() {
        // h = k (x^2 + y^2) / 2 about the site: gradient k x, so I = (k^2 / sigma^2) S I2 with S the sum of x^2
        // over the 11 x 11 window points, and sigma_pos = sigma_h / (k sqrt(S)). The stereographic scale at
        // 5 degrees from the pole (1.0038) moves it by 0.8 %.
        let k = 1.0e-4;
        let (dem, site) = patch_dem(|x, y| 0.5 * k * (x * x + y * y));
        let (se, sn) = lola_crlb(&dem, site, 12_000.0, 1200.0, 5.0).unwrap();
        let sum_x2: f64 = 11.0 * 1200.0_f64.powi(2) * 110.0;
        let want = 5.0 / (k * sum_x2.sqrt());
        for got in [se, sn] {
            assert!(((got - want) / want).abs() < 0.02, "{got} vs {want}");
        }
    }

    /// With exactly three relays above the mask the clock cannot be estimated, so it is aided, and the fix
    /// then carries `c sigma_t` as a common range bias: lunar time is what the fix depends on.
    #[test]
    fn three_relays_make_the_fix_depend_on_the_clock() {
        let run = |mode: &str, days: f64| {
            let s = LunarLandingScenario {
                n_relays: Some(4),
                lunar_time_mode: Some(mode.into()),
                time_since_sync_days: Some(days),
                n_trials: Some(10),
                ..Default::default()
            };
            let r = s.run_phase(&carried()).unwrap().report;
            assert_eq!(r["aids"]["afs"]["relays_visible"], 3);
            assert_eq!(r["aids"]["afs"]["clock_aided_three_relay_fix"], true);
            r["aids"]["afs"]["fix_sigma_east_m"].as_f64().unwrap()
        };
        let (off, fresh, stale) = (run("off", 0.1), run("ltc", 0.1), run("ltc", 30.0));
        assert!(off < fresh && fresh < stale, "{off} {fresh} {stale}");
        // A TT clock over the same horizon is worse than an LTC one, by the uncorrected offset.
        assert!(run("tt", 3.0) > run("ltc", 3.0));
    }

    #[test]
    fn bad_inputs_are_rejected() {
        for s in [
            LunarLandingScenario {
                afs_mode: Some("x".into()),
                ..Default::default()
            },
            LunarLandingScenario {
                trn_source: Some("x".into()),
                ..Default::default()
            },
            LunarLandingScenario {
                lunar_time_mode: Some("x".into()),
                ..Default::default()
            },
            LunarLandingScenario {
                descent_s: Some(5.0),
                ..Default::default()
            },
            LunarLandingScenario {
                site_lat_deg: Some(-95.0),
                ..Default::default()
            },
        ] {
            assert!(s.run_phase(&carried()).is_err());
        }
        let mut c = carried();
        c.frame = crate::lunar_phase::Frame::Mcmf;
        assert!(quick().run_phase(&c).is_err());
    }
}
