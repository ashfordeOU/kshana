// SPDX-License-Identifier: AGPL-3.0-only
//! Doppler-only integrity: protection levels of a static LEO Doppler fix over a Walker constellation
//! at any site (Arctic and Antarctic included), with the weighted slope method, and an optional
//! injected satellite fault to see where it lands on a Stanford diagram.
//!
//! The fix is the engine's batch range-rate fit ([`crate::leo_fusion::doppler::solve`]): position and
//! receiver clock drift from every satellite in view over a window, optionally with the height held by
//! a pseudo-measurement. The fault model is a constant range-rate bias on every measurement of one
//! satellite over the window (a satellite frequency offset, the dominant single fault of a Doppler
//! service). For satellite `s`, with `Q = (HᵀWH)⁻¹` and `g_s = Σ_{i∈s} W_i h_i`, a bias `b` moves the
//! estimate by `b Q g_s` and adds `b² (Σ_{i∈s} W_i − g_sᵀ Q g_s)` to the non-centrality of the
//! weighted residual sum of squares, so the horizontal slope is
//! `|(Q g_s)_EN| / sqrt(Σ W_i − g_sᵀ Q g_s)` and likewise vertical. With the detection threshold
//! `T² = χ²⁻¹(1 − P_FA, n − 4)` and the non-centrality `λ` missed with probability `P_MD`
//! ([`crate::raim::pbias`]), `HPL = max_s slope_H · sqrt(λ)` (Brown's slope method, per satellite
//! instead of per measurement).
//!
//! A satellite whose bias the clock-drift state absorbs completely (one satellite in view, for
//! example) has no finite slope: the protection level is then reported as unbounded and the window
//! as unavailable, which is the honest answer for a single-pass Doppler fix.
//!
//! MODELLED: two-body orbits with the secular J2 drift ([`crate::leo_fusion::geom`]), white
//! range-rate noise of the stated one-sigma, no tropospheric or ionospheric rate errors, and a fault
//! prior that is the user's to state through `P_MD`.

use super::{field_err, list_len, non_negative, positive, within, work_limit};
use crate::constellation::Elements;
use crate::leo_fusion::doppler::{range_rate, solve, DopplerOptions, RangeRateObs};
use crate::leo_fusion::geom::{
    dot, inverse, norm, scale, sub, EarthOrbit, Mat, Site, Vec3, DEG, RE_EARTH,
};
use crate::portable_distr::{Distribution, Normal};
use crate::portable_math::PortableFloat;
use crate::raim::{chi2_quantile, classify_stanford, pbias, StanfordRegion};
use rand::SeedableRng;
use rand_chacha::ChaCha8Rng;
use serde::{Deserialize, Serialize};
use std::f64::consts::PI;

/// The user site.
#[derive(Clone, Debug, PartialEq, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct SiteCfg {
    /// Geodetic latitude (deg).
    pub lat_deg: f64,
    /// East longitude (deg).
    pub lon_deg: f64,
    /// Height above the ellipsoid (m).
    #[serde(default)]
    pub height_m: f64,
}

/// One Walker-delta shell `T/P/F`.
#[derive(Clone, Debug, PartialEq, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct ShellCfg {
    /// Altitude above the equatorial radius (km).
    pub altitude_km: f64,
    /// Inclination (deg).
    pub inclination_deg: f64,
    /// Number of planes `P`.
    pub planes: usize,
    /// Satellites per plane.
    pub sats_per_plane: usize,
    /// Walker phasing factor `F`.
    #[serde(default)]
    pub phasing: f64,
}

/// A fault to inject.
#[derive(Clone, Debug, PartialEq, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct FaultCfg {
    /// Range-rate bias on every measurement of the faulted satellite (m/s).
    pub bias_mps: f64,
    /// Index of the faulted satellite among those in view; default the one with the largest
    /// horizontal slope.
    #[serde(default)]
    pub satellite: Option<usize>,
    /// Seed of the measurement noise.
    #[serde(default)]
    pub seed: u64,
}

fn d_window() -> f64 {
    120.0
}
fn d_step() -> f64 {
    1.0
}
fn d_mask() -> f64 {
    15.0
}
fn d_starts() -> Vec<f64> {
    vec![0.0]
}
fn d_pfa() -> f64 {
    1e-5
}
fn d_pmd() -> f64 {
    1e-3
}

/// Input of `kshana leo-verify doppler-integrity`.
#[derive(Clone, Debug, PartialEq, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct DopplerIntegrityInput {
    /// The user.
    pub site: SiteCfg,
    /// The constellation.
    pub shells: Vec<ShellCfg>,
    /// Window starts (s after the constellation epoch).
    #[serde(default = "d_starts")]
    pub starts_s: Vec<f64>,
    /// Window length (s).
    #[serde(default = "d_window")]
    pub window_s: f64,
    /// Measurement spacing (s).
    #[serde(default = "d_step")]
    pub step_s: f64,
    /// Elevation mask (deg).
    #[serde(default = "d_mask")]
    pub mask_deg: f64,
    /// Range-rate one-sigma (m/s).
    pub sigma_mps: f64,
    /// Height pseudo-measurement one-sigma (m); none for a free fit.
    #[serde(default)]
    pub height_sigma_m: Option<f64>,
    /// False-alarm probability of the residual test.
    #[serde(default = "d_pfa")]
    pub p_fa: f64,
    /// Missed-detection probability.
    #[serde(default = "d_pmd")]
    pub p_md: f64,
    /// Horizontal alert limit (m).
    pub horizontal_alert_limit_m: f64,
    /// Vertical alert limit (m); none to leave the vertical unchecked.
    #[serde(default)]
    pub vertical_alert_limit_m: Option<f64>,
    /// A fault to inject in every window.
    #[serde(default)]
    pub fault: Option<FaultCfg>,
}

/// The outcome of the injected fault in one window.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct FaultOutcome {
    /// Index of the faulted satellite among those in view.
    pub satellite: usize,
    /// Weighted residual sum of squares.
    pub test_statistic: f64,
    /// Detection threshold.
    pub threshold: f64,
    /// Whether the test statistic exceeds the threshold.
    pub detected: bool,
    /// Horizontal position error of the faulted fix (m).
    pub horizontal_error_m: f64,
    /// Vertical position error (m).
    pub vertical_error_m: f64,
    /// Where the horizontal error and HPL fall on a Stanford diagram when the fault went undetected;
    /// none when the test raised an alert.
    pub stanford: Option<StanfordRegion>,
}

/// One window.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct WindowRow {
    /// Window start (s).
    pub start_s: f64,
    /// Satellites seen above the mask during the window.
    pub satellites: usize,
    /// Range-rate measurements.
    pub measurements: usize,
    /// Degrees of freedom of the residual test.
    pub dof: usize,
    /// Formal one-sigma east, north, up (m).
    pub sigma_enu_m: Option<[f64; 3]>,
    /// Horizontal protection level (m); none when unbounded.
    pub hpl_m: Option<f64>,
    /// Vertical protection level (m); none when unbounded.
    pub vpl_m: Option<f64>,
    /// Index of the satellite that sets the HPL.
    pub worst_satellite: Option<usize>,
    /// Whether the HPL (and VPL, when a vertical limit is given) is within its alert limit.
    pub available: bool,
    /// The injected fault, when one is set and the geometry allows a fix.
    pub fault: Option<FaultOutcome>,
}

/// Report of `kshana leo-verify doppler-integrity`.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct DopplerIntegrityReport {
    /// Satellites in the constellation.
    pub constellation_size: usize,
    /// Per window.
    pub windows: Vec<WindowRow>,
    /// Fraction of windows available.
    pub availability: f64,
    /// Windows where an injected fault was undetected and its horizontal error exceeded the HPL.
    pub misleading_windows: usize,
}

fn walker(shells: &[ShellCfg]) -> Result<Vec<EarthOrbit>, String> {
    let mut out = Vec::new();
    for s in shells {
        within("shells.altitude_km", s.altitude_km, 150.0, 40_000.0)?;
        within("shells.inclination_deg", s.inclination_deg, 0.0, 180.0)?;
        if s.planes == 0 || s.sats_per_plane == 0 {
            return Err(field_err(
                "shells.planes",
                (s.planes * s.sats_per_plane) as f64,
            ));
        }
        within("shells.phasing", s.phasing, 0.0, s.planes as f64)?;
        work_limit((out.len() + s.planes * s.sats_per_plane) as f64, 20_000.0)?;
        let t = (s.planes * s.sats_per_plane) as f64;
        for p in 0..s.planes {
            for j in 0..s.sats_per_plane {
                let el = Elements {
                    a_m: RE_EARTH + s.altitude_km * 1e3,
                    e: 0.0,
                    i_rad: s.inclination_deg * DEG,
                    raan_rad: 2.0 * PI * p as f64 / s.planes as f64,
                    argp_rad: 0.0,
                    m0_rad: 2.0
                        * PI
                        * (j as f64 / s.sats_per_plane as f64 + s.phasing * p as f64 / t),
                };
                out.push(EarthOrbit::from_elements(&el, true));
            }
        }
    }
    Ok(out)
}

/// Range-rate partials `[∂/∂r (3), ∂/∂drift]` for a static user.
fn row(user: Vec3, o: &RangeRateObs) -> [f64; 4] {
    let d = sub(o.sat_pos, user);
    let rho = norm(d);
    let u = scale(d, 1.0 / rho);
    let dv = o.sat_vel;
    let along = dot(u, dv);
    [
        -(dv[0] - u[0] * along) / rho,
        -(dv[1] - u[1] * along) / rho,
        -(dv[2] - u[2] * along) / rho,
        1.0,
    ]
}

fn quad(q: &Mat, a: &[f64], b: &[f64]) -> f64 {
    let mut s = 0.0;
    for i in 0..a.len() {
        for j in 0..b.len() {
            s += a[i] * q[i][j] * b[j];
        }
    }
    s
}

fn mat_vec4(q: &Mat, g: &[f64; 4]) -> [f64; 4] {
    let mut o = [0.0; 4];
    for (i, oi) in o.iter_mut().enumerate() {
        *oi = (0..4).map(|j| q[i][j] * g[j]).sum();
    }
    o
}

/// The horizontal and vertical slope of each satellite; `None` when its bias is unobservable.
type Slopes = Vec<Option<(f64, f64)>>;

/// `Q = (HᵀWH)⁻¹` and the [`Slopes`]; `None` when the normal matrix is singular.
fn slopes(
    groups: &[Vec<RangeRateObs>],
    user: Vec3,
    enu: (Vec3, Vec3, Vec3),
    height: Option<(Vec3, f64)>,
) -> Option<(Mat, Slopes)> {
    let mut a = vec![vec![0.0; 4]; 4];
    let mut gs = Vec::with_capacity(groups.len());
    for g in groups {
        let mut gsum = [0.0; 4];
        let mut wsum = 0.0;
        for o in g {
            let h = row(user, o);
            let w = 1.0 / (o.sigma_mps * o.sigma_mps);
            for i in 0..4 {
                gsum[i] += w * h[i];
                for j in 0..4 {
                    a[i][j] += w * h[i] * h[j];
                }
            }
            wsum += w;
        }
        gs.push((gsum, wsum));
    }
    if let Some((up, s)) = height {
        let h = [up[0], up[1], up[2], 0.0];
        let w = 1.0 / (s * s);
        for i in 0..4 {
            for j in 0..4 {
                a[i][j] += w * h[i] * h[j];
            }
        }
    }
    let q = inverse(&a)?;
    let (e, n, u) = enu;
    let out = gs
        .iter()
        .map(|(g, w)| {
            let m = w - quad(&q, g, g);
            if m <= 1e-9 * w {
                return None;
            }
            let dx = mat_vec4(&q, g);
            let p = [dx[0], dx[1], dx[2]];
            let h = dot(p, e).phypot(dot(p, n));
            Some((h / m.sqrt(), dot(p, u).abs() / m.sqrt()))
        })
        .collect();
    Some((q, out))
}

/// Run the protection-level analysis.
pub fn run(inp: &DopplerIntegrityInput) -> Result<DopplerIntegrityReport, String> {
    within("site.lat_deg", inp.site.lat_deg, -90.0, 90.0)?;
    within("site.lon_deg", inp.site.lon_deg, -360.0, 360.0)?;
    within("site.height_m", inp.site.height_m, -1_000.0, 20_000.0)?;
    list_len("shells", inp.shells.len(), 20)?;
    list_len("starts_s", inp.starts_s.len(), 1000)?;
    positive("window_s", inp.window_s)?;
    positive("step_s", inp.step_s)?;
    within("mask_deg", inp.mask_deg, 0.0, 89.0)?;
    positive("sigma_mps", inp.sigma_mps)?;
    if let Some(h) = inp.height_sigma_m {
        positive("height_sigma_m", h)?;
    }
    within("p_fa", inp.p_fa, 1e-12, 0.5)?;
    within("p_md", inp.p_md, 1e-12, 0.5)?;
    positive("horizontal_alert_limit_m", inp.horizontal_alert_limit_m)?;
    if let Some(v) = inp.vertical_alert_limit_m {
        positive("vertical_alert_limit_m", v)?;
    }
    for &s in &inp.starts_s {
        non_negative("starts_s", s)?;
    }
    if let Some(f) = &inp.fault {
        within("fault.bias_mps", f.bias_mps, -1e4, 1e4)?;
    }
    let orbits = walker(&inp.shells)?;
    let steps = (inp.window_s / inp.step_s).floor() + 1.0;
    work_limit(steps, 3_600.0)?;
    work_limit(
        steps * orbits.len() as f64 * inp.starts_s.len() as f64,
        5.0e6,
    )?;
    let site = Site {
        lat_deg: inp.site.lat_deg,
        lon_deg: inp.site.lon_deg,
        height_m: inp.site.height_m,
    };
    let user = site.ecef();
    let enu = site.enu();
    let mask = inp.mask_deg * DEG;
    let n01 = Normal::new(0.0, 1.0).map_err(|e| e.to_string())?;
    let mut windows = Vec::with_capacity(inp.starts_s.len());
    let mut misleading = 0usize;
    for &t0 in &inp.starts_s {
        let groups: Vec<Vec<RangeRateObs>> = orbits
            .iter()
            .map(|o| {
                crate::leo_fusion::doppler::pass_observations(
                    o,
                    &site,
                    t0,
                    t0 + inp.window_s,
                    inp.step_s,
                    mask,
                    inp.sigma_mps,
                )
            })
            .filter(|g| !g.is_empty())
            .collect();
        let n_obs: usize = groups.iter().map(Vec::len).sum();
        let n_meas = n_obs + usize::from(inp.height_sigma_m.is_some());
        let dof = n_meas.saturating_sub(4);
        let height = inp.height_sigma_m.map(|s| (enu.2, s));
        let geom = if dof >= 1 {
            slopes(&groups, user, enu, height)
        } else {
            None
        };
        let Some((q, sl)) = geom else {
            windows.push(WindowRow {
                start_s: t0,
                satellites: groups.len(),
                measurements: n_obs,
                dof,
                sigma_enu_m: None,
                hpl_m: None,
                vpl_m: None,
                worst_satellite: None,
                available: false,
                fault: None,
            });
            continue;
        };
        let t2 = chi2_quantile(1.0 - inp.p_fa, dof as f64);
        let k = pbias(t2, dof as f64, inp.p_md);
        let var = |v: Vec3| quad(&q, &v, &v).max(0.0).sqrt();
        let sigma = [var(enu.0), var(enu.1), var(enu.2)];
        let bounded = sl.iter().all(Option::is_some);
        let (mut hpl, mut vpl, mut worst) = (None, None, None);
        if bounded {
            let (mut h, mut v, mut w) = (0.0_f64, 0.0_f64, 0usize);
            for (i, s) in sl.iter().enumerate() {
                let (sh, sv) = s.unwrap_or((0.0, 0.0));
                if sh > h {
                    h = sh;
                    w = i;
                }
                v = v.max(sv);
            }
            hpl = Some(h * k);
            vpl = Some(v * k);
            worst = Some(w);
        }
        let available = hpl.is_some_and(|h| h <= inp.horizontal_alert_limit_m)
            && match inp.vertical_alert_limit_m {
                Some(val) => vpl.is_some_and(|v| v <= val),
                None => true,
            };
        let fault = match &inp.fault {
            Some(f) => {
                let target = f.satellite.or(worst).unwrap_or(0);
                if target >= groups.len() {
                    return Err(field_err("fault.satellite", target as f64));
                }
                let mut rng = ChaCha8Rng::seed_from_u64(f.seed.wrapping_add(t0.to_bits()));
                let mut obs = Vec::with_capacity(n_obs);
                for (gi, g) in groups.iter().enumerate() {
                    for o in g {
                        let mut o = *o;
                        o.range_rate_mps = range_rate(user, [0.0; 3], o.sat_pos, o.sat_vel)
                            + inp.sigma_mps * n01.sample(&mut rng)
                            + if gi == target { f.bias_mps } else { 0.0 };
                        obs.push(o);
                    }
                }
                let opts = DopplerOptions {
                    estimate_velocity: false,
                    height_sigma_m: inp.height_sigma_m,
                    max_iter: 30,
                };
                let apriori = [user[0] + 1_000.0, user[1] - 1_000.0, user[2] + 500.0];
                match solve(&obs, &opts, apriori, Some(user)) {
                    Ok(fix) => {
                        let d = sub(fix.position, user);
                        let he = dot(d, enu.0).phypot(dot(d, enu.1));
                        let ve = dot(d, enu.2).abs();
                        let detected = fix.chi2 > t2;
                        let pl = hpl.unwrap_or(f64::INFINITY);
                        let stanford = (!detected)
                            .then(|| classify_stanford(he, pl, inp.horizontal_alert_limit_m));
                        if !detected && he > pl {
                            misleading += 1;
                        }
                        Some(FaultOutcome {
                            satellite: target,
                            test_statistic: fix.chi2,
                            threshold: t2,
                            detected,
                            horizontal_error_m: he,
                            vertical_error_m: ve,
                            stanford,
                        })
                    }
                    Err(_) => None,
                }
            }
            None => None,
        };
        windows.push(WindowRow {
            start_s: t0,
            satellites: groups.len(),
            measurements: n_obs,
            dof,
            sigma_enu_m: Some(sigma),
            hpl_m: hpl,
            vpl_m: vpl,
            worst_satellite: worst,
            available,
            fault,
        });
    }
    let availability =
        windows.iter().filter(|w| w.available).count() as f64 / windows.len().max(1) as f64;
    Ok(DopplerIntegrityReport {
        constellation_size: orbits.len(),
        windows,
        availability,
        misleading_windows: misleading,
    })
}
