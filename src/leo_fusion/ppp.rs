// SPDX-License-Identifier: AGPL-3.0-only
//! Precise point positioning (PPP) with a float extended Kalman filter (EKF), with GNSS only
//! and with GNSS plus LEO, and the `leo-ppp` scenario kind.
//!
//! ## Model
//!
//! Each satellite in view gives an ionosphere-free code and carrier-phase pair:
//!
//! `P = ρ + c·dt_r + b_s + m(ε)·Z + e_s + ε_P`,  `L = ρ + c·dt_r + b_s + m(ε)·Z + N + e_s + ε_L`,
//!
//! with the geometric range `ρ`, the receiver clock `c·dt_r` (white noise, re-estimated every
//! epoch), the inter-system bias `b_s` of each system after the first (constant), the zenith
//! wet delay `Z` (random walk) mapped by `m(ε) = 1/sin ε`, the float ambiguity `N` of each
//! satellite arc (constant until the satellite sets), the precise orbit-and-clock error `e_s`
//! (white, common to code and phase of the same satellite, so each satellite's pair is one
//! correlated two-row update), and the code and phase noise `ε`, whose zenith one-sigmas are
//! scaled by `1/sin ε`. The station is static and its coordinates are states. The truth is
//! simulated from exactly the same model with a seeded generator, so the normalised estimation
//! error squared (NEES) of the position must follow a chi-square law with three degrees of
//! freedom: the filter-consistency test runs Monte Carlo seeds and checks the run-averaged
//! NEES against the chi-square band.
//!
//! ## Why LEO shortens convergence
//!
//! A float ambiguity is separable from the position only once the geometry has changed. A MEO
//! satellite moves a few degrees across the sky in ten minutes; a LEO satellite crosses the
//! whole sky in that time, so its arc decorrelates the ambiguity from the position within a
//! few minutes. The pack reports the convergence time (the first epoch after which the
//! horizontal and vertical errors stay below the stated thresholds until the end of the run)
//! for GNSS alone and for each LEO augmentation.
//!
//! ## Comparison target
//!
//! Li et al., "LEO constellation-augmented multi-GNSS for rapid PPP convergence", Journal of
//! Geodesy 93:749-764 (2019), doi 10.1007/s00190-018-1195-2
//! (<https://link.springer.com/article/10.1007/s00190-018-1195-2>), simulated multi-GNSS PPP
//! at mid-latitudes and report convergence shortened from 9.6 min to 7.0, 3.2, 2.1 and 1.3 min
//! with 60, 96, 192 and 288 LEO satellites. This pack does not reproduce their constellation
//! designs, noise levels, stations or convergence definition, so the comparison is a MODELLED
//! consistency check on the trend (monotone shortening with the number of LEO satellites, and
//! the ratio to the GNSS-only time), not a validation.
//!
//! ## Label
//!
//! MODELLED. Not modelled: second-order ionosphere, satellite and receiver phase-centre
//! variations, phase wind-up, tides, time-correlated product errors, cycle slips and
//! ambiguity resolution to integers (this is float PPP).

use super::geom::{median, norm, sub, EarthOrbit, Site};
use super::system::SystemCfg;
use crate::field_schema::{FieldUnit, ProvenanceClass::*};
use crate::palette::chart::{BLUE, CORAL, CYAN, INK_2, INK_3, LIME, MAGENTA, MUTED};
use rand::SeedableRng;
use rand_chacha::ChaCha8Rng;
use rand_distr::{Distribution, Normal};
use serde::{Deserialize, Serialize};

/// A system as the PPP filter sees it.
#[derive(Clone, Debug)]
pub struct PppSystem {
    /// Name.
    pub name: String,
    /// Satellites.
    pub orbits: Vec<EarthOrbit>,
    /// Elevation mask (rad).
    pub mask_rad: f64,
    /// Precise orbit-and-clock error, one sigma, white (m).
    pub sigma_sat_m: f64,
}

/// Noise and prior levels.
#[derive(Clone, Copy, Debug, Deserialize, Serialize, PartialEq)]
#[serde(deny_unknown_fields)]
pub struct PppNoise {
    /// Ionosphere-free code noise at the zenith (m). Default 0.6.
    #[serde(default = "d_code")]
    pub sigma_code_m: f64,
    /// Ionosphere-free phase noise at the zenith (m). Default 0.006.
    #[serde(default = "d_phase")]
    pub sigma_phase_m: f64,
    /// Zenith wet delay random-walk density (m^2/s). Default 1e-8 (6 mm per square-root hour).
    #[serde(default = "d_zwd_q")]
    pub zwd_q_m2_s: f64,
    /// Zenith wet delay prior one-sigma (m). Default 0.1.
    #[serde(default = "d_zwd0")]
    pub zwd0_sigma_m: f64,
    /// Initial position one-sigma per axis (m). Default 5.
    #[serde(default = "d_pos0")]
    pub pos0_sigma_m: f64,
    /// Receiver clock one-sigma, white each epoch (m). Default 1000.
    #[serde(default = "d_clk")]
    pub clock_sigma_m: f64,
    /// Inter-system bias prior one-sigma (m). Default 10.
    #[serde(default = "d_isb")]
    pub isb0_sigma_m: f64,
    /// Float ambiguity prior one-sigma (m). Default 30.
    #[serde(default = "d_amb")]
    pub amb0_sigma_m: f64,
}

fn d_code() -> f64 {
    0.6
}
fn d_phase() -> f64 {
    0.006
}
fn d_zwd_q() -> f64 {
    1e-8
}
fn d_zwd0() -> f64 {
    0.1
}
fn d_pos0() -> f64 {
    5.0
}
fn d_clk() -> f64 {
    1000.0
}
fn d_isb() -> f64 {
    10.0
}
fn d_amb() -> f64 {
    30.0
}

impl Default for PppNoise {
    fn default() -> Self {
        Self {
            sigma_code_m: d_code(),
            sigma_phase_m: d_phase(),
            zwd_q_m2_s: d_zwd_q(),
            zwd0_sigma_m: d_zwd0(),
            pos0_sigma_m: d_pos0(),
            clock_sigma_m: d_clk(),
            isb0_sigma_m: d_isb(),
            amb0_sigma_m: d_amb(),
        }
    }
}

/// One filter run.
#[derive(Clone, Debug, Serialize)]
pub struct PppRun {
    /// Epoch times (s).
    pub t_s: Vec<f64>,
    /// Horizontal error per epoch (m).
    pub horizontal_error_m: Vec<f64>,
    /// Absolute vertical error per epoch (m).
    pub vertical_error_m: Vec<f64>,
    /// Position NEES per epoch.
    pub nees: Vec<f64>,
    /// Satellites used per epoch.
    pub n_sats: Vec<usize>,
    /// Convergence time (s); `None` if the thresholds are not held at the end.
    pub convergence_s: Option<f64>,
}

struct Filter {
    x: Vec<f64>,
    p: Vec<Vec<f64>>,
    /// (system, satellite) of each ambiguity state, from index `n_fixed`.
    amb: Vec<(usize, usize)>,
}

impl Filter {
    fn add_state(&mut self, value: f64, var: f64) {
        for row in &mut self.p {
            row.push(0.0);
        }
        let n = self.x.len() + 1;
        let mut r = vec![0.0; n];
        r[n - 1] = var;
        self.p.push(r);
        self.x.push(value);
    }
    fn remove_state(&mut self, i: usize) {
        self.x.remove(i);
        self.p.remove(i);
        for row in &mut self.p {
            row.remove(i);
        }
    }
    /// Update with a correlated pair of rows (sparse: `(index, value)`), innovations `y` and
    /// 2x2 noise covariance `r`.
    fn update2(&mut self, h: [&[(usize, f64)]; 2], y: [f64; 2], r: [[f64; 2]; 2]) {
        let n = self.x.len();
        let mut pht = vec![[0.0; 2]; n];
        for (i, row) in pht.iter_mut().enumerate() {
            for a in 0..2 {
                row[a] = h[a].iter().map(|&(j, v)| self.p[i][j] * v).sum();
            }
        }
        let mut s = r;
        for a in 0..2 {
            for b in 0..2 {
                s[a][b] += h[a].iter().map(|&(j, v)| v * pht[j][b]).sum::<f64>();
            }
        }
        let det = s[0][0] * s[1][1] - s[0][1] * s[1][0];
        if !(det.is_finite() && det > 0.0) {
            return;
        }
        let si = [
            [s[1][1] / det, -s[0][1] / det],
            [-s[1][0] / det, s[0][0] / det],
        ];
        let k: Vec<[f64; 2]> = pht
            .iter()
            .map(|p| {
                [
                    p[0] * si[0][0] + p[1] * si[1][0],
                    p[0] * si[0][1] + p[1] * si[1][1],
                ]
            })
            .collect();
        for (xi, ki) in self.x.iter_mut().zip(&k) {
            *xi += ki[0] * y[0] + ki[1] * y[1];
        }
        // Joseph-stabilised form, expanded for a rank-two update so it stays O(n^2):
        // P+ = P - K (PH')' - (PH') K' + K S K'. It equals the textbook P - K H P for the
        // optimal gain but is first-order insensitive to rounding in K, which keeps P
        // positive definite over thousands of millimetre-level phase updates.
        let ks: Vec<[f64; 2]> = k
            .iter()
            .map(|ki| {
                [
                    ki[0] * s[0][0] + ki[1] * s[1][0],
                    ki[0] * s[0][1] + ki[1] * s[1][1],
                ]
            })
            .collect();
        for i in 0..n {
            for j in 0..n {
                self.p[i][j] += -(k[i][0] * pht[j][0] + k[i][1] * pht[j][1])
                    - (pht[i][0] * k[j][0] + pht[i][1] * k[j][1])
                    + (ks[i][0] * k[j][0] + ks[i][1] * k[j][1]);
            }
        }
        for i in 0..n {
            for j in (i + 1)..n {
                let m = 0.5 * (self.p[i][j] + self.p[j][i]);
                self.p[i][j] = m;
                self.p[j][i] = m;
            }
        }
    }
}

/// Run one PPP filter over `[0, duration]` every `step` seconds at `site`.
#[allow(clippy::too_many_arguments)]
pub fn run(
    systems: &[PppSystem],
    site: &Site,
    duration_s: f64,
    step_s: f64,
    noise: &PppNoise,
    criterion_h_m: f64,
    criterion_v_m: f64,
    seed: u64,
) -> Result<PppRun, String> {
    if systems.is_empty() {
        return Err("PPP needs at least one system".into());
    }
    if !(duration_s > 0.0 && step_s > 0.0) || duration_s / step_s > 20_000.0 {
        return Err("duration and step must be positive with at most 20000 epochs".into());
    }
    let mut rng = ChaCha8Rng::seed_from_u64(seed);
    let n01 = Normal::new(0.0, 1.0).map_err(|e| e.to_string())?;
    let truth = site.ecef();
    let (e_hat, n_hat, u_hat) = site.enu();
    let ns = systems.len();
    let n_fixed = 5 + (ns - 1);
    // Truth draws.
    let isb_true: Vec<f64> = (0..ns)
        .map(|k| {
            if k == 0 {
                0.0
            } else {
                noise.isb0_sigma_m * n01.sample(&mut rng)
            }
        })
        .collect();
    let mut zwd_true = noise.zwd0_sigma_m * n01.sample(&mut rng);
    let mut amb_true: Vec<((usize, usize), f64)> = Vec::new();
    // Filter prior.
    let mut f = Filter {
        x: vec![0.0; n_fixed],
        p: vec![vec![0.0; n_fixed]; n_fixed],
        amb: Vec::new(),
    };
    for (i, t) in truth.iter().enumerate() {
        f.x[i] = t + noise.pos0_sigma_m * n01.sample(&mut rng);
        f.p[i][i] = noise.pos0_sigma_m.powi(2);
    }
    f.p[3][3] = noise.clock_sigma_m.powi(2);
    f.p[4][4] = noise.zwd0_sigma_m.powi(2);
    for k in 5..n_fixed {
        f.p[k][k] = noise.isb0_sigma_m.powi(2);
    }
    let n_ep = (duration_s / step_s).floor() as usize + 1;
    let mut out = PppRun {
        t_s: Vec::with_capacity(n_ep),
        horizontal_error_m: Vec::with_capacity(n_ep),
        vertical_error_m: Vec::with_capacity(n_ep),
        nees: Vec::with_capacity(n_ep),
        n_sats: Vec::with_capacity(n_ep),
        convergence_s: None,
    };
    for ep in 0..n_ep {
        let t = ep as f64 * step_s;
        // Predict: white clock, random-walk wet delay; truth moves the same way.
        if ep > 0 {
            let q = noise.zwd_q_m2_s * step_s;
            zwd_true += q.sqrt() * n01.sample(&mut rng);
            f.p[4][4] += q;
        }
        let clk_true = noise.clock_sigma_m * n01.sample(&mut rng);
        f.x[3] = 0.0;
        for i in 0..f.x.len() {
            f.p[3][i] = 0.0;
            f.p[i][3] = 0.0;
        }
        f.p[3][3] = noise.clock_sigma_m.powi(2);
        // Visible satellites.
        let mut vis: Vec<(usize, usize, [f64; 3], f64)> = Vec::new();
        for (k, s) in systems.iter().enumerate() {
            for (j, o) in s.orbits.iter().enumerate() {
                let pos = o.state(t).0;
                let el = super::geom::elevation(truth, u_hat, pos);
                if el >= s.mask_rad {
                    vis.push((k, j, pos, el));
                }
            }
        }
        // Drop ambiguities of satellites that set (a new arc gets a new ambiguity).
        let mut i = 0;
        while i < f.amb.len() {
            let id = f.amb[i];
            if vis.iter().any(|v| (v.0, v.1) == id) {
                i += 1;
            } else {
                f.remove_state(n_fixed + i);
                f.amb.remove(i);
                amb_true.retain(|(a, _)| *a != id);
            }
        }
        for v in &vis {
            let id = (v.0, v.1);
            if !f.amb.contains(&id) {
                f.amb.push(id);
                f.add_state(0.0, noise.amb0_sigma_m.powi(2));
                amb_true.push((id, noise.amb0_sigma_m * n01.sample(&mut rng)));
            }
        }
        for v in &vis {
            let (k, j, pos, el) = *v;
            let m = 1.0 / el.sin();
            let sp = noise.sigma_code_m * m;
            let sl = noise.sigma_phase_m * m;
            let ss = systems[k].sigma_sat_m;
            let ai = f
                .amb
                .iter()
                .position(|a| *a == (k, j))
                .expect("state added above");
            let a_true = amb_true
                .iter()
                .find(|(a, _)| *a == (k, j))
                .map(|x| x.1)
                .unwrap_or(0.0);
            let rho_t = norm(sub(pos, truth));
            let common_t = rho_t + clk_true + isb_true[k] + m * zwd_true;
            let e_sat = ss * n01.sample(&mut rng);
            let p_meas = common_t + e_sat + sp * n01.sample(&mut rng);
            let l_meas = common_t + a_true + e_sat + sl * n01.sample(&mut rng);
            let xp = [f.x[0], f.x[1], f.x[2]];
            let d = sub(pos, xp);
            let rho = norm(d);
            let isb_hat = if k == 0 { 0.0 } else { f.x[5 + k - 1] };
            let common = rho + f.x[3] + isb_hat + m * f.x[4];
            let amb_idx = n_fixed + ai;
            let mut hp: Vec<(usize, f64)> = vec![
                (0, -d[0] / rho),
                (1, -d[1] / rho),
                (2, -d[2] / rho),
                (3, 1.0),
                (4, m),
            ];
            if k > 0 {
                hp.push((5 + k - 1, 1.0));
            }
            let mut hl = hp.clone();
            hl.push((amb_idx, 1.0));
            let y = [p_meas - common, l_meas - (common + f.x[amb_idx])];
            let r = [[sp * sp + ss * ss, ss * ss], [ss * ss, sl * sl + ss * ss]];
            f.update2([&hp, &hl], y, r);
        }
        let err = sub([f.x[0], f.x[1], f.x[2]], truth);
        let de = super::geom::dot(err, e_hat);
        let dn = super::geom::dot(err, n_hat);
        let du = super::geom::dot(err, u_hat);
        let pp: Vec<Vec<f64>> = (0..3)
            .map(|i| (0..3).map(|j| f.p[i][j]).collect())
            .collect();
        let nees = super::geom::inverse(&pp)
            .map(|q| {
                let mut s = 0.0;
                for i in 0..3 {
                    for j in 0..3 {
                        s += err[i] * q[i][j] * err[j];
                    }
                }
                s
            })
            .unwrap_or(f64::NAN);
        out.t_s.push(t);
        out.horizontal_error_m.push((de * de + dn * dn).sqrt());
        out.vertical_error_m.push(du.abs());
        out.nees.push(nees);
        out.n_sats.push(vis.len());
    }
    // Convergence: the first epoch after the last violation of either threshold.
    let last_bad = (0..n_ep).rev().find(|&k| {
        out.horizontal_error_m[k] > criterion_h_m || out.vertical_error_m[k] > criterion_v_m
    });
    out.convergence_s = match last_bad {
        None => Some(0.0),
        Some(k) if k + 1 < n_ep => Some(out.t_s[k + 1]),
        Some(_) => None,
    };
    Ok(out)
}

/// A LEO augmentation case of the `leo-ppp` scenario.
#[derive(Clone, Debug, Deserialize, Serialize)]
#[serde(deny_unknown_fields)]
pub struct PppCaseCfg {
    /// Case name.
    pub name: String,
    /// LEO systems added to the GNSS systems (none: GNSS only).
    #[serde(default)]
    pub system: Vec<SystemCfg>,
}

/// A site of the `leo-ppp` scenario.
#[derive(Clone, Copy, Debug, Deserialize, Serialize)]
#[serde(deny_unknown_fields)]
pub struct PppSiteCfg {
    /// Latitude (deg).
    pub lat_deg: f64,
    /// Longitude (deg).
    pub lon_deg: f64,
}

/// The `leo-ppp` scenario.
#[derive(Clone, Debug, Deserialize, Serialize)]
#[serde(deny_unknown_fields)]
pub struct PppScenario {
    /// Scenario kind tag.
    #[serde(default)]
    pub kind: Option<String>,
    /// Base seed; run `r` uses `seed + r`. Default 1.
    #[serde(default)]
    pub seed: Option<u64>,
    /// Span of each run (s). Default 1800.
    #[serde(default)]
    pub duration_s: Option<f64>,
    /// Epoch spacing (s). Default 10.
    #[serde(default)]
    pub step_s: Option<f64>,
    /// Seeded runs per site and case. Default 4.
    #[serde(default)]
    pub runs: Option<usize>,
    /// Horizontal convergence threshold (m). Default 0.1.
    #[serde(default)]
    pub criterion_horizontal_m: Option<f64>,
    /// Vertical convergence threshold (m). Default 0.1.
    #[serde(default)]
    pub criterion_vertical_m: Option<f64>,
    /// Report the Li et al. (2019) comparison table. Default false.
    #[serde(default)]
    pub compare_li_2019: Option<bool>,
    /// Noise levels.
    #[serde(default)]
    pub noise: Option<PppNoise>,
    /// Sites; default three mid-latitude sites.
    #[serde(default)]
    pub site: Vec<PppSiteCfg>,
    /// GNSS systems (default GPS and Galileo). In this kind `sisre_m` is the precise
    /// orbit-and-clock error (default 0.025 m for GNSS, 0.05 m for LEO).
    #[serde(default)]
    pub gnss: Vec<SystemCfg>,
    /// LEO augmentation cases; a GNSS-only case is always run first.
    #[serde(default)]
    pub case: Vec<PppCaseCfg>,
}

/// One case of the report.
#[derive(Clone, Debug, Serialize)]
pub struct PppCaseOut {
    /// Case name.
    pub name: String,
    /// LEO satellites added.
    pub n_leo: usize,
    /// Median convergence time over converged runs (min).
    pub median_convergence_min: Option<f64>,
    /// Fraction of runs that converged within the run.
    pub fraction_converged: f64,
    /// Convergence time of each run (min); absent runs did not converge.
    pub convergence_min: Vec<Option<f64>>,
    /// Mean satellites in view.
    pub mean_sats: f64,
    /// Time of each per-minute value (min after the start).
    pub t_min: Vec<f64>,
    /// Median horizontal error across runs, one value per minute (m).
    pub median_horizontal_error_m: Vec<f64>,
    /// Median vertical error across runs, one value per minute (m).
    pub median_vertical_error_m: Vec<f64>,
    /// Fraction of epochs whose run-averaged position NEES lies inside the two-sided 95%
    /// chi-square band.
    pub nees_fraction_in_band: f64,
    /// Mean of the run-averaged NEES over all epochs (3 for a consistent filter).
    pub nees_mean: f64,
}

/// A published figure beside the modelled one.
#[derive(Clone, Debug, Serialize)]
pub struct PublishedRow {
    /// LEO satellites (0 for GNSS only).
    pub n_leo: usize,
    /// Published convergence (min).
    pub published_min: f64,
    /// Modelled convergence of the case with the same count, if run (min).
    pub modelled_min: Option<f64>,
    /// Published ratio to the GNSS-only time.
    pub published_ratio: f64,
    /// Modelled ratio to the GNSS-only time.
    pub modelled_ratio: Option<f64>,
}

/// The `leo-ppp` report.
#[derive(Clone, Debug, Serialize)]
pub struct PppReport {
    /// Label.
    pub label: String,
    /// Run span (s).
    pub duration_s: f64,
    /// Epoch spacing (s).
    pub step_s: f64,
    /// Runs per case (sites times seeds).
    pub runs_per_case: usize,
    /// Horizontal threshold (m).
    pub criterion_horizontal_m: f64,
    /// Vertical threshold (m).
    pub criterion_vertical_m: f64,
    /// Noise used.
    pub noise: PppNoise,
    /// GNSS satellites.
    pub n_gnss: usize,
    /// Cases.
    pub cases: Vec<PppCaseOut>,
    /// Two-sided 95% band of the run-averaged NEES.
    pub nees_band: [f64; 2],
    /// The Li et al. (2019) comparison, when requested.
    pub li_2019: Option<Vec<PublishedRow>>,
}

/// Li et al. (2019), J. Geod. 93:749: GNSS only and 60/96/192/288 LEO satellites (min).
pub const LI_2019: [(usize, f64); 5] = [(0, 9.6), (60, 7.0), (96, 3.2), (192, 2.1), (288, 1.3)];

fn to_ppp(cfg: &SystemCfg, default_sisre: f64) -> Result<PppSystem, String> {
    let mut c = cfg.clone();
    if c.sisre_m.is_none() {
        c.sisre_m = Some(default_sisre);
    }
    let s = c.build()?;
    Ok(PppSystem {
        name: s.name.clone(),
        orbits: s.orbits.clone(),
        mask_rad: s.mask_rad,
        sigma_sat_m: s.sisre_m,
    })
}

impl PppScenario {
    /// Compute the report.
    pub fn compute(&self) -> Result<PppReport, String> {
        let duration = self.duration_s.unwrap_or(1800.0);
        let step = self.step_s.unwrap_or(10.0);
        let runs = self.runs.unwrap_or(4);
        let ch = self.criterion_horizontal_m.unwrap_or(0.1);
        let cv = self.criterion_vertical_m.unwrap_or(0.1);
        let noise = self.noise.unwrap_or_default();
        if runs == 0 || runs > 200 {
            return Err("runs must be 1 to 200".into());
        }
        if !(ch > 0.0 && cv > 0.0) {
            return Err("convergence thresholds must be positive".into());
        }
        let sites: Vec<PppSiteCfg> = if self.site.is_empty() {
            vec![
                PppSiteCfg {
                    lat_deg: 30.5,
                    lon_deg: 114.4,
                },
                PppSiteCfg {
                    lat_deg: 48.1,
                    lon_deg: 11.6,
                },
                PppSiteCfg {
                    lat_deg: 39.0,
                    lon_deg: -77.0,
                },
            ]
        } else {
            self.site.clone()
        };
        let gnss_cfg: Vec<SystemCfg> = if self.gnss.is_empty() {
            vec![
                toml::from_str("name = \"GPS\"\npreset = \"gps-baseline\"\nmask_deg = 7.0\n")
                    .expect("GPS"),
                toml::from_str("name = \"Galileo\"\npreset = \"galileo\"\nmask_deg = 7.0\n")
                    .expect("Galileo"),
            ]
        } else {
            self.gnss.clone()
        };
        let gnss: Vec<PppSystem> = gnss_cfg
            .iter()
            .map(|c| to_ppp(c, 0.025))
            .collect::<Result<_, _>>()?;
        let n_gnss = gnss.iter().map(|s| s.orbits.len()).sum();
        let mut cases: Vec<(String, Vec<PppSystem>)> = vec![("GNSS only".into(), Vec::new())];
        for c in &self.case {
            let leo: Vec<PppSystem> = c
                .system
                .iter()
                .map(|s| to_ppp(s, 0.05))
                .collect::<Result<_, _>>()?;
            cases.push((c.name.clone(), leo));
        }
        let seed0 = self.seed.unwrap_or(1);
        let total_runs = runs * sites.len();
        let lo = crate::raim::chi2_quantile(0.025, 3.0 * total_runs as f64) / total_runs as f64;
        let hi = crate::raim::chi2_quantile(0.975, 3.0 * total_runs as f64) / total_runs as f64;
        let mut out = Vec::new();
        for (name, leo) in &cases {
            let mut all = gnss.clone();
            all.extend(leo.iter().cloned());
            let mut results = Vec::new();
            for (si, s) in sites.iter().enumerate() {
                let site = Site {
                    lat_deg: s.lat_deg,
                    lon_deg: s.lon_deg,
                    height_m: 0.0,
                };
                for r in 0..runs {
                    let seed = seed0.wrapping_add((si * runs + r) as u64);
                    results.push(run(&all, &site, duration, step, &noise, ch, cv, seed)?);
                }
            }
            let conv: Vec<Option<f64>> = results
                .iter()
                .map(|r| r.convergence_s.map(|c| c / 60.0))
                .collect();
            let n_ep = results[0].t_s.len();
            let per_min = (60.0 / step).round().max(1.0) as usize;
            let med_at = |k: usize, h: bool| {
                median(
                    results
                        .iter()
                        .map(|r| {
                            if h {
                                r.horizontal_error_m[k]
                            } else {
                                r.vertical_error_m[k]
                            }
                        })
                        .collect(),
                )
                .unwrap_or(0.0)
            };
            let idx: Vec<usize> = (0..n_ep).step_by(per_min).collect();
            let mut in_band = 0usize;
            let mut nees_sum = 0.0;
            for k in 0..n_ep {
                let m = results.iter().map(|r| r.nees[k]).sum::<f64>() / results.len() as f64;
                nees_sum += m;
                if (lo..=hi).contains(&m) {
                    in_band += 1;
                }
            }
            let n_sats: usize = results.iter().flat_map(|r| r.n_sats.iter()).sum();
            out.push(PppCaseOut {
                name: name.clone(),
                n_leo: leo.iter().map(|s| s.orbits.len()).sum(),
                median_convergence_min: median(conv.iter().flatten().copied().collect()),
                fraction_converged: conv.iter().filter(|c| c.is_some()).count() as f64
                    / conv.len() as f64,
                convergence_min: conv,
                mean_sats: n_sats as f64 / (results.len() * n_ep) as f64,
                t_min: idx.iter().map(|&k| k as f64 * step / 60.0).collect(),
                median_horizontal_error_m: idx.iter().map(|&k| med_at(k, true)).collect(),
                median_vertical_error_m: idx.iter().map(|&k| med_at(k, false)).collect(),
                nees_fraction_in_band: in_band as f64 / n_ep as f64,
                nees_mean: nees_sum / n_ep as f64,
            });
        }
        let li = if self.compare_li_2019.unwrap_or(false) {
            let base = out[0].median_convergence_min;
            Some(
                LI_2019
                    .iter()
                    .map(|&(n, m)| {
                        let modelled = out
                            .iter()
                            .find(|c| c.n_leo == n)
                            .and_then(|c| c.median_convergence_min);
                        PublishedRow {
                            n_leo: n,
                            published_min: m,
                            modelled_min: modelled,
                            published_ratio: m / LI_2019[0].1,
                            modelled_ratio: match (modelled, base) {
                                (Some(a), Some(b)) if b > 0.0 => Some(a / b),
                                _ => None,
                            },
                        }
                    })
                    .collect(),
            )
        } else {
            None
        };
        Ok(PppReport {
            label: "MODELLED float PPP (ionosphere-free code and phase, white clock, random-walk wet \
                    delay, float ambiguities per arc) on simulated measurements from the same model; \
                    the Li et al. (2019) figures are a comparison of trend, not a reproduction"
                .into(),
            duration_s: duration,
            step_s: step,
            runs_per_case: total_runs,
            criterion_horizontal_m: ch,
            criterion_vertical_m: cv,
            noise,
            n_gnss,
            cases: out,
            nees_band: [lo, hi],
            li_2019: li,
        })
    }

    /// Run and render.
    pub fn run_output(&self) -> Result<(String, String, String), String> {
        let r = self.compute()?;
        let mut doc = serde_json::to_value(&r).map_err(|e| e.to_string())?;
        if let Some(o) = doc.as_object_mut() {
            o.insert("units".into(), crate::field_schema::units_block(PPP_UNITS));
        }
        let json = serde_json::to_string_pretty(&doc).map_err(|e| e.to_string())?;
        let mut summary = format!(
            "PPP convergence to {:.2} m horizontal / {:.2} m vertical, {} runs per case, {} GNSS satellites\n",
            r.criterion_horizontal_m, r.criterion_vertical_m, r.runs_per_case, r.n_gnss
        );
        for c in &r.cases {
            summary.push_str(&format!(
                "  {:<28} {:>4} LEO  median {} min  converged {:.0}%  NEES mean {:.2}\n",
                c.name,
                c.n_leo,
                c.median_convergence_min
                    .map(|v| format!("{v:.1}"))
                    .unwrap_or("n/a".into()),
                100.0 * c.fraction_converged,
                c.nees_mean
            ));
        }
        if let Some(li) = &r.li_2019 {
            summary.push_str("  Li et al. 2019 (published, min) vs modelled:");
            for p in li {
                summary.push_str(&format!(
                    " {}:{:.1}/{}",
                    p.n_leo,
                    p.published_min,
                    p.modelled_min
                        .map(|v| format!("{v:.1}"))
                        .unwrap_or("-".into())
                ));
            }
            summary.push('\n');
        }
        Ok((json, summary, ppp_svg(&r)))
    }
}

fn ppp_svg(r: &PppReport) -> String {
    let (w, h) = (900.0, 440.0);
    let mut s = crate::chart::frame_open(
        w,
        h,
        "PPP convergence with LEO augmentation",
        &format!(
            "median horizontal error across {} runs · MODELLED",
            r.runs_per_case
        ),
    );
    let (ml, top, pw, ph) = (80.0, 80.0, 780.0, 280.0);
    s.push_str(&crate::chart::panel_axes(
        ml,
        top,
        pw,
        top + ph,
        "median horizontal error (log10 m) against minutes",
    ));
    let palette = [INK_3, BLUE, CYAN, LIME, CORAL, MAGENTA, INK_2];
    let n = r
        .cases
        .first()
        .map(|c| c.median_horizontal_error_m.len())
        .unwrap_or(1)
        .max(2);
    let (lo, hi) = (-3.0_f64, 1.0_f64);
    let y = |v: f64| top + ph - ph * ((v.max(1e-3).log10() - lo) / (hi - lo)).clamp(0.0, 1.0);
    for (k, c) in r.cases.iter().enumerate() {
        let pts: Vec<String> = c
            .median_horizontal_error_m
            .iter()
            .enumerate()
            .map(|(i, v)| format!("{:.1},{:.1}", ml + pw * i as f64 / (n - 1) as f64, y(*v)))
            .collect();
        s.push_str(&format!(
            "<polyline fill=\"none\" stroke=\"{}\" stroke-width=\"1.6\" points=\"{}\"/>",
            palette[k % palette.len()],
            pts.join(" ")
        ));
        s.push_str(&format!(
            "<text x=\"{:.0}\" y=\"{:.0}\" font-size=\"10\" fill=\"{}\">{} LEO</text>",
            ml + 10.0 + 90.0 * k as f64,
            top + ph + 30.0,
            palette[k % palette.len()],
            c.n_leo
        ));
    }
    let yc = y(r.criterion_horizontal_m);
    s.push_str(&format!(
        "<line x1=\"{ml:.0}\" y1=\"{yc:.1}\" x2=\"{:.0}\" y2=\"{yc:.1}\" stroke=\"{CORAL}\" stroke-dasharray=\"4 3\"/>\
         <text x=\"10\" y=\"{:.0}\" font-size=\"10\" fill=\"{MUTED}\">10 m</text><text x=\"10\" y=\"{:.0}\" font-size=\"10\" fill=\"{MUTED}\">1 mm</text></svg>",
        ml + pw,
        top + 10.0,
        top + ph
    ));
    s
}

/// Units of the `leo-ppp` report.
pub const PPP_UNITS: &[FieldUnit] = &[
    FieldUnit { path: "duration_s", unit: "s", provenance: Input, definition: "span of each run" },
    FieldUnit { path: "step_s", unit: "s", provenance: Input, definition: "epoch spacing" },
    FieldUnit { path: "runs_per_case", unit: "count", provenance: Input, definition: "seeded runs per case (sites times seeds)" },
    FieldUnit { path: "criterion_horizontal_m", unit: "m", provenance: Input, definition: "horizontal convergence threshold" },
    FieldUnit { path: "criterion_vertical_m", unit: "m", provenance: Input, definition: "vertical convergence threshold" },
    FieldUnit { path: "noise.sigma_code_m", unit: "m", provenance: ModelledInput, definition: "ionosphere-free code noise at the zenith" },
    FieldUnit { path: "noise.sigma_phase_m", unit: "m", provenance: ModelledInput, definition: "ionosphere-free phase noise at the zenith" },
    FieldUnit { path: "noise.zwd_q_m2_s", unit: "m^2/s", provenance: ModelledInput, definition: "zenith wet delay random-walk density" },
    FieldUnit { path: "noise.zwd0_sigma_m", unit: "m", provenance: ModelledInput, definition: "zenith wet delay prior one-sigma" },
    FieldUnit { path: "noise.pos0_sigma_m", unit: "m", provenance: ModelledInput, definition: "initial position one-sigma per axis" },
    FieldUnit { path: "noise.clock_sigma_m", unit: "m", provenance: ModelledInput, definition: "receiver clock one-sigma, white each epoch" },
    FieldUnit { path: "noise.isb0_sigma_m", unit: "m", provenance: ModelledInput, definition: "inter-system bias prior one-sigma" },
    FieldUnit { path: "noise.amb0_sigma_m", unit: "m", provenance: ModelledInput, definition: "float ambiguity prior one-sigma" },
    FieldUnit { path: "n_gnss", unit: "count", provenance: Input, definition: "GNSS satellites" },
    FieldUnit { path: "cases[].n_leo", unit: "count", provenance: Input, definition: "LEO satellites added" },
    FieldUnit { path: "cases[].median_convergence_min", unit: "min", provenance: Modelled, definition: "median convergence time over converged runs" },
    FieldUnit { path: "cases[].fraction_converged", unit: "1", provenance: Modelled, definition: "fraction of runs converged within the run" },
    FieldUnit { path: "cases[].convergence_min[]", unit: "min", provenance: Modelled, definition: "convergence time of each run" },
    FieldUnit { path: "cases[].mean_sats", unit: "count", provenance: Computed, definition: "mean satellites in view" },
    FieldUnit { path: "cases[].t_min[]", unit: "min", provenance: Computed, definition: "time of each per-minute value after the start of the run" },
    FieldUnit { path: "cases[].median_horizontal_error_m[]", unit: "m", provenance: Modelled, definition: "median horizontal error across runs, one value per minute" },
    FieldUnit { path: "cases[].median_vertical_error_m[]", unit: "m", provenance: Modelled, definition: "median absolute vertical error across runs, one value per minute" },
    FieldUnit { path: "cases[].nees_fraction_in_band", unit: "1", provenance: InternalConsistency, definition: "fraction of epochs whose run-averaged position NEES is inside the two-sided 95% chi-square band" },
    FieldUnit { path: "cases[].nees_mean", unit: "1", provenance: InternalConsistency, definition: "mean run-averaged position NEES; 3 for a consistent filter" },
    FieldUnit { path: "nees_band[]", unit: "1", provenance: ClosedForm, definition: "two-sided 95% band of the run-averaged NEES, chi-square(3R)/R quantiles" },
    FieldUnit { path: "li_2019[].n_leo", unit: "count", provenance: Published, definition: "LEO satellites in the Li et al. (2019) case" },
    FieldUnit { path: "li_2019[].published_min", unit: "min", provenance: Published, definition: "published convergence time, Li et al. (2019), J. Geod. 93:749" },
    FieldUnit { path: "li_2019[].modelled_min", unit: "min", provenance: Modelled, definition: "modelled median convergence of the case with the same count" },
    FieldUnit { path: "li_2019[].published_ratio", unit: "1", provenance: Published, definition: "published time over the published GNSS-only time" },
    FieldUnit { path: "li_2019[].modelled_ratio", unit: "1", provenance: Modelled, definition: "modelled time over the modelled GNSS-only time" },
];

#[cfg(test)]
mod tests {
    use super::*;

    fn short(cases: &str, runs: usize, duration: f64) -> PppScenario {
        toml::from_str(&format!(
            "kind = \"leo-ppp\"\nduration_s = {duration}\nstep_s = 30.0\nruns = {runs}\n\
             [[site]]\nlat_deg = 45.0\nlon_deg = 10.0\n{cases}"
        ))
        .unwrap()
    }

    #[test]
    fn the_filter_is_consistent_over_monte_carlo_seeds() {
        // Truth and filter share the model, so the run-averaged position NEES must average
        // near 3 (the chi-square mean for three degrees of freedom) and lie in the two-sided
        // 95% chi-square band on most epochs. The in-band fraction of one batch scatters
        // widely because the errors are strongly correlated from epoch to epoch (an
        // ambiguity error persists for the whole arc), so the bar is 75%. Measured with 150
        // runs: mean NEES 2.84 (GNSS only) and 2.87 (with LEO), slightly conservative.
        let scn = short(
            "[[case]]\nname = \"LEO\"\n[[case.system]]\nname = \"L\"\n[[case.system.shell]]\ntotal = 96\nplanes = 8\nphasing = 1\naltitude_km = 1000.0\ninclination_deg = 60.0\n",
            24,
            900.0,
        );
        let r = scn.compute().unwrap();
        for c in &r.cases {
            assert!(
                c.nees_fraction_in_band >= 0.75,
                "{}: {}",
                c.name,
                c.nees_fraction_in_band
            );
            assert!(
                (2.4..3.6).contains(&c.nees_mean),
                "{}: {}",
                c.name,
                c.nees_mean
            );
        }
    }

    #[test]
    fn leo_augmentation_shortens_convergence() {
        let scn = short(
            "[[case]]\nname = \"LEO\"\n[[case.system]]\nname = \"L\"\n[[case.system.shell]]\ntotal = 192\nplanes = 12\nphasing = 1\naltitude_km = 1000.0\ninclination_deg = 60.0\n",
            3,
            1800.0,
        );
        let r = scn.compute().unwrap();
        let g = r.cases[0].median_convergence_min.expect("GNSS converges");
        let l = r.cases[1]
            .median_convergence_min
            .expect("LEO case converges");
        assert!(l < 0.6 * g, "GNSS {g} min, LEO {l} min");
        assert_eq!(r.cases[1].n_leo, 192);
    }

    #[test]
    fn same_seed_same_answer_and_every_number_has_a_unit() {
        let scn = short("", 1, 300.0);
        let (a, _, svg) = scn.run_output().unwrap();
        let (b, _, _) = scn.run_output().unwrap();
        assert_eq!(a, b);
        let doc: serde_json::Value = serde_json::from_str(&a).unwrap();
        let audit = crate::field_schema::audit_document(&doc);
        assert!(
            audit.is_complete(),
            "missing {:?} malformed {:?}",
            audit.missing,
            audit.malformed
        );
        assert!(svg.ends_with("</svg>"));
    }
}
