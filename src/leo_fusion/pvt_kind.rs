// SPDX-License-Identifier: AGPL-3.0-only
//! The `leo-pvt` scenario kind: fused MEO and LEO position, velocity and time.
//!
//! One kind, four modes, all over any constellations given as `[[system]]` tables:
//!
//! * `doppler` — batch Doppler positioning from the LEO systems over a window, with the
//!   clock drift and optionally the user velocity as states; the error against window
//!   length; the Doppler, Doppler-rate and jerk envelope of each LEO system; and the
//!   single-pass along-track and cross-track accuracy against the cross-track offset. A
//!   Doppler-only system (a signal of opportunity with no navigation message, such as the
//!   `starlink-sop` preset) runs in this mode.
//! * `joint` — epoch-by-epoch weighted least-squares pseudorange fixes from the GNSS
//!   systems alone, the LEO systems alone and all of them together, with one clock per
//!   system (the inter-system bias estimated) or a known broadcast offset, and the DOP
//!   against the number of LEO satellites added to the GNSS geometry.
//! * `polar` — satellites in view and DOP against latitude for GNSS, LEO and both.
//! * `timing` — time transfer to UTC from the LEO systems at a known position, against C/N0
//!   and the receiver oscillator, with the system-time-to-UTC conversion.
//!
//! Every mode is MODELLED; see [`super`] for the algorithms and their tests.

use super::doppler::{self, DopplerOptions, RangeRateObs};
use super::geom::{add, dot, median, norm, rms, scale, sub, EarthOrbit, Site, DEG};
use super::joint_pvt::{self, PseudorangeObs, SystemClock};
use super::polar::{self, PolarRow};
use super::system::{build_all, in_view, DllCfg, System, SystemCfg};
use super::timing::{self, TimeTransferStats, UtcParams};
use crate::field_schema::{FieldUnit, ProvenanceClass::*};
use rand::SeedableRng;
use rand_chacha::ChaCha8Rng;
use rand_distr::{Distribution, Normal};
use serde::{Deserialize, Serialize};

/// The user.
#[derive(Clone, Copy, Debug, Deserialize, Serialize)]
#[serde(deny_unknown_fields)]
pub struct UserCfg {
    /// Geodetic latitude (deg). Default 48.
    #[serde(default = "d_lat")]
    pub lat_deg: f64,
    /// East longitude (deg). Default 11.
    #[serde(default = "d_lon")]
    pub lon_deg: f64,
    /// Height (m). Default 0.
    #[serde(default)]
    pub height_m: f64,
    /// Constant velocity east, north, up (m/s). Default zero.
    #[serde(default)]
    pub velocity_enu_mps: [f64; 3],
    /// True receiver clock drift as a velocity (m/s). Default 0.3 (1 part per billion).
    #[serde(default = "d_drift")]
    pub clock_drift_mps: f64,
}

fn d_lat() -> f64 {
    48.0
}
fn d_lon() -> f64 {
    11.0
}
fn d_drift() -> f64 {
    0.3
}

impl Default for UserCfg {
    fn default() -> Self {
        Self {
            lat_deg: d_lat(),
            lon_deg: d_lon(),
            height_m: 0.0,
            velocity_enu_mps: [0.0; 3],
            clock_drift_mps: d_drift(),
        }
    }
}

/// Doppler-mode options.
#[derive(Clone, Debug, Default, Deserialize, Serialize)]
#[serde(deny_unknown_fields)]
pub struct DopplerCfg {
    /// Estimate the user velocity. Default: true when the user moves.
    #[serde(default)]
    pub estimate_velocity: Option<bool>,
    /// Hold the height to this one-sigma (m). Default: none, or 1 m for a single satellite.
    #[serde(default)]
    pub height_sigma_m: Option<f64>,
    /// Use only the satellite with the most measurements (a single pass). Default false.
    #[serde(default)]
    pub single_satellite: bool,
    /// Cross-track offsets for the single-pass geometry table (km).
    #[serde(default)]
    pub pass_offsets_km: Vec<f64>,
    /// Window lengths for the error-against-window table (s). Default: fractions of the run.
    #[serde(default)]
    pub windows_s: Vec<f64>,
}

/// Joint-mode options.
#[derive(Clone, Debug, Default, Deserialize, Serialize)]
#[serde(deny_unknown_fields)]
pub struct JointCfg {
    /// Largest number of LEO satellites in the DOP sweep. Default 12.
    #[serde(default)]
    pub max_leo_sweep: Option<usize>,
}

/// Polar-mode options.
#[derive(Clone, Debug, Default, Deserialize, Serialize)]
#[serde(deny_unknown_fields)]
pub struct PolarCfg {
    /// Latitude step from 0 to 90 deg. Default 10.
    #[serde(default)]
    pub lat_step_deg: Option<f64>,
    /// Longitude step (deg). Default 45.
    #[serde(default)]
    pub lon_step_deg: Option<f64>,
    /// PDOP threshold for availability. Default 6.
    #[serde(default)]
    pub pdop_threshold: Option<f64>,
}

/// Timing-mode options.
#[derive(Clone, Debug, Default, Deserialize, Serialize)]
#[serde(deny_unknown_fields)]
pub struct TimingCfg {
    /// Receiver oscillator classes (`tcxo`, `ocxo`, `csac`, `rafs`, `uso`, `dsac`). Default
    /// tcxo, ocxo, csac and rafs.
    #[serde(default)]
    pub clocks: Vec<String>,
    /// C/N0 offsets applied to every system (dB). Default -10, -5, 0, +5.
    #[serde(default)]
    pub cn0_offsets_db: Vec<f64>,
    /// Broadcast system-time-to-UTC parameters.
    #[serde(default)]
    pub utc: UtcParams,
    /// System week at the start of the run. Default 0.
    #[serde(default)]
    pub week: i64,
    /// System time of week at the start of the run (s). Default 0.
    #[serde(default)]
    pub tow0_s: f64,
}

/// The `leo-pvt` scenario.
#[derive(Clone, Debug, Deserialize, Serialize)]
#[serde(deny_unknown_fields)]
pub struct LeoPvtScenario {
    /// Scenario kind tag.
    #[serde(default)]
    pub kind: Option<String>,
    /// `doppler`, `joint`, `polar` or `timing`. Default `joint`.
    #[serde(default)]
    pub mode: Option<String>,
    /// Noise seed. Default 1.
    #[serde(default)]
    pub seed: Option<u64>,
    /// Span (s). Default 600.
    #[serde(default)]
    pub duration_s: Option<f64>,
    /// Epoch spacing (s). Default 10.
    #[serde(default)]
    pub step_s: Option<f64>,
    /// The user.
    #[serde(default)]
    pub user: Option<UserCfg>,
    /// Delay-lock-loop parameters for the pseudorange noise model.
    #[serde(default)]
    pub dll: Option<DllCfg>,
    /// Doppler-mode options.
    #[serde(default)]
    pub doppler: Option<DopplerCfg>,
    /// Joint-mode options.
    #[serde(default)]
    pub joint: Option<JointCfg>,
    /// Polar-mode options.
    #[serde(default)]
    pub polar: Option<PolarCfg>,
    /// Timing-mode options.
    #[serde(default)]
    pub timing: Option<TimingCfg>,
    /// The systems.
    #[serde(default)]
    pub system: Vec<SystemCfg>,
}

/// Summary of one system in the report.
#[derive(Clone, Debug, Serialize)]
pub struct SystemOut {
    /// Name.
    pub name: String,
    /// `gnss` or `leo`.
    pub role: String,
    /// Presets used.
    pub presets: Vec<String>,
    /// Satellites.
    pub n_satellites: usize,
    /// Mean altitude (km).
    pub mean_altitude_km: f64,
    /// Carrier (Hz).
    pub carrier_hz: f64,
    /// C/N0 at the mask and zenith (dB-Hz).
    pub cn0_dbhz: [f64; 2],
    /// Signal-in-space range error (m).
    pub sisre_m: f64,
    /// Pseudorange one-sigma at 30 deg elevation (m); absent for Doppler-only systems.
    pub sigma_pr_30deg_m: Option<f64>,
    /// Range-rate one-sigma (m/s).
    pub sigma_range_rate_mps: f64,
    /// Doppler only.
    pub doppler_only: bool,
    /// `estimated` or `known` clock.
    pub clock: String,
}

/// Error against window length.
#[derive(Clone, Debug, Serialize)]
pub struct WindowRow {
    /// Window (s).
    pub window_s: f64,
    /// Measurements used.
    pub n_obs: usize,
    /// Distinct satellites used.
    pub n_sats: usize,
    /// 3D error (m); absent when the fit failed.
    pub error_3d_m: Option<f64>,
    /// Horizontal error (m).
    pub horizontal_error_m: Option<f64>,
    /// Formal horizontal one-sigma (m).
    pub sigma_horizontal_m: Option<f64>,
}

/// Doppler envelope of one LEO system.
#[derive(Clone, Debug, Serialize)]
pub struct EnvelopeOut {
    /// System name.
    pub system: String,
    /// Over the satellites in view in the run.
    pub in_run: doppler::DopplerEnvelope,
    /// Over an overhead pass of the system's first satellite (above 0 deg).
    pub overhead_pass: doppler::DopplerEnvelope,
}

/// Doppler-mode block.
#[derive(Clone, Debug, Serialize)]
pub struct DopplerOut {
    /// Measurements used in the full fit.
    pub n_obs: usize,
    /// Distinct satellites.
    pub n_sats: usize,
    /// Whether the velocity was estimated.
    pub estimated_velocity: bool,
    /// Height constraint used (m).
    pub height_sigma_m: Option<f64>,
    /// 3D position error of the full fit (m).
    pub error_3d_m: f64,
    /// Horizontal error (m).
    pub horizontal_error_m: f64,
    /// Formal one-sigma east, north, up (m).
    pub sigma_enu_m: [f64; 3],
    /// Velocity error (m/s), when estimated.
    pub velocity_error_mps: Option<f64>,
    /// Clock drift error (m/s).
    pub drift_error_mps: f64,
    /// Weighted post-fit residual RMS.
    pub weighted_rms: f64,
    /// Error against window.
    pub windows: Vec<WindowRow>,
    /// Envelopes.
    pub envelopes: Vec<EnvelopeOut>,
    /// Single-pass table.
    pub single_pass: Vec<doppler::PassRow>,
}

/// One epoch of the joint mode.
#[derive(Clone, Debug, Serialize)]
pub struct JointEpoch {
    /// Time (s).
    pub t_s: f64,
    /// GNSS satellites in view.
    pub n_gnss: usize,
    /// LEO satellites in view (ranging).
    pub n_leo: usize,
    /// PDOP of GNSS only.
    pub pdop_gnss: Option<f64>,
    /// PDOP of the fused geometry.
    pub pdop_fused: Option<f64>,
    /// 3D error, GNSS only (m).
    pub error_gnss_m: Option<f64>,
    /// 3D error, fused (m).
    pub error_fused_m: Option<f64>,
    /// 3D error, LEO only (m).
    pub error_leo_m: Option<f64>,
}

/// DOP against the number of LEO satellites.
#[derive(Clone, Debug, Serialize)]
pub struct SweepRow {
    /// LEO satellites added (highest elevation first).
    pub n_leo: usize,
    /// Median PDOP over epochs.
    pub median_pdop: Option<f64>,
    /// Median HDOP.
    pub median_hdop: Option<f64>,
    /// Median VDOP.
    pub median_vdop: Option<f64>,
    /// Epochs with that many LEO satellites in view.
    pub n_epochs: usize,
}

/// Figures of merit of one fix type.
#[derive(Clone, Debug, Serialize)]
pub struct FixFom {
    /// Fraction of epochs with a fix.
    pub availability: f64,
    /// Median PDOP.
    pub median_pdop: Option<f64>,
    /// RMS 3D error (m).
    pub rms_error_3d_m: Option<f64>,
    /// Median formal 3D one-sigma (m).
    pub median_sigma_3d_m: Option<f64>,
}

/// Joint-mode block.
#[derive(Clone, Debug, Serialize)]
pub struct JointOut {
    /// GNSS only.
    pub gnss: FixFom,
    /// LEO only.
    pub leo: FixFom,
    /// Fused.
    pub fused: FixFom,
    /// Fraction of epochs with at least one LEO ranging satellite in view.
    pub fraction_epochs_with_leo: f64,
    /// Median estimated inter-system bias of each system with its own clock (m), fused fix.
    pub isb_estimates: Vec<(String, f64)>,
    /// True inter-system bias used (m).
    pub isb_truth: Vec<(String, f64)>,
    /// DOP against LEO count.
    pub dop_sweep: Vec<SweepRow>,
    /// Epochs.
    pub epochs: Vec<JointEpoch>,
}

/// Polar-mode block.
#[derive(Clone, Debug, Serialize)]
pub struct PolarOut {
    /// PDOP threshold.
    pub pdop_threshold: f64,
    /// Rows by latitude.
    pub rows: Vec<PolarRow>,
}

/// One timing row.
#[derive(Clone, Debug, Serialize)]
pub struct TimingRow {
    /// Oscillator class.
    pub clock: String,
    /// C/N0 offset (dB).
    pub cn0_offset_db: f64,
    /// Statistics.
    pub stats: TimeTransferStats,
}

/// Timing-mode block.
#[derive(Clone, Debug, Serialize)]
pub struct TimingOut {
    /// `Δt_UTC` at the start of the run (s).
    pub utc_offset_s: f64,
    /// UTC time of day at the start of the run (s).
    pub utc_time_of_day_s: f64,
    /// One-sigma of the broadcast UTC offset (s).
    pub utc_sigma_s: f64,
    /// Median single-epoch clock-measurement one-sigma at 0 dB offset (s).
    pub median_measurement_sigma_s: Option<f64>,
    /// Rows.
    pub rows: Vec<TimingRow>,
}

/// The `leo-pvt` report.
#[derive(Clone, Debug, Serialize)]
pub struct LeoPvtReport {
    /// Label.
    pub label: String,
    /// Mode.
    pub mode: String,
    /// Span (s).
    pub duration_s: f64,
    /// Step (s).
    pub step_s: f64,
    /// User latitude (deg).
    pub user_lat_deg: f64,
    /// User longitude (deg).
    pub user_lon_deg: f64,
    /// Systems.
    pub systems: Vec<SystemOut>,
    /// Doppler block.
    pub doppler: Option<DopplerOut>,
    /// Joint block.
    pub joint: Option<JointOut>,
    /// Polar block.
    pub polar: Option<PolarOut>,
    /// Timing block.
    pub timing: Option<TimingOut>,
}

/// Running sums of one fix type: PDOPs, 3D errors, formal 3D sigmas, fixes.
type FixAcc = (Vec<f64>, Vec<f64>, Vec<f64>, usize);

fn default_systems() -> Vec<SystemCfg> {
    vec![
        toml::from_str("name = \"GPS\"\npreset = \"gps-baseline\"\n").expect("GPS"),
        toml::from_str("name = \"Galileo\"\npreset = \"galileo\"\n").expect("Galileo"),
        toml::from_str(
            "name = \"LEO\"\ncarrier_hz = 1.5e9\nchip_rate_hz = 10.23e6\ncn0_dbhz = [45.0, 55.0]\nsisre_m = 0.3\n\
             [[shell]]\ntotal = 240\nplanes = 12\nphasing = 1\naltitude_km = 1000.0\ninclination_deg = 60.0\n",
        )
        .expect("LEO"),
    ]
}

fn horiz(e: [f64; 3], site: &Site) -> f64 {
    let (ee, nn, _) = site.enu();
    (dot(e, ee).powi(2) + dot(e, nn).powi(2)).sqrt()
}

impl LeoPvtScenario {
    /// Compute the report.
    pub fn compute(&self) -> Result<LeoPvtReport, String> {
        let mode = self.mode.clone().unwrap_or_else(|| "joint".into());
        let duration = self.duration_s.unwrap_or(600.0);
        let step = self.step_s.unwrap_or(10.0);
        if !(duration > 0.0 && step > 0.0) || duration / step > 20_000.0 {
            return Err("duration_s and step_s must be positive with at most 20000 epochs".into());
        }
        let cfgs = if self.system.is_empty() {
            default_systems()
        } else {
            self.system.clone()
        };
        let systems = build_all(&cfgs)?;
        let dll = self.dll.unwrap_or_default();
        let u = self.user.unwrap_or_default();
        let site = Site {
            lat_deg: u.lat_deg,
            lon_deg: u.lon_deg,
            height_m: u.height_m,
        };
        let systems_out: Vec<SystemOut> = systems
            .iter()
            .map(|s| SystemOut {
                name: s.name.clone(),
                role: s.role.clone(),
                presets: s.presets.clone(),
                n_satellites: s.n_satellites,
                mean_altitude_km: s.mean_altitude_m / 1e3,
                carrier_hz: s.carrier_hz,
                cn0_dbhz: s.cn0_dbhz,
                sisre_m: s.sisre_m,
                sigma_pr_30deg_m: (!s.doppler_only).then(|| s.sigma_pr_m(30.0 * DEG, &dll)),
                sigma_range_rate_mps: s.sigma_rr_mps(),
                doppler_only: s.doppler_only,
                clock: match s.clock {
                    SystemClock::Estimated => "estimated".into(),
                    SystemClock::Known(_) => "known".into(),
                },
            })
            .collect();
        let seed = self.seed.unwrap_or(1);
        let mut report = LeoPvtReport {
            label: String::new(),
            mode: mode.clone(),
            duration_s: duration,
            step_s: step,
            user_lat_deg: u.lat_deg,
            user_lon_deg: u.lon_deg,
            systems: systems_out,
            doppler: None,
            joint: None,
            polar: None,
            timing: None,
        };
        match mode.as_str() {
            "doppler" => {
                report.doppler = Some(self.run_doppler(&systems, &site, &u, duration, step, seed)?);
                report.label = "MODELLED batch Doppler positioning: exact range-rate model on two-body \
                                orbits with J2 drift, Gaussian Doppler noise at the stated sigma, perfect \
                                ephemeris unless a range-rate error is included in that sigma"
                    .into();
            }
            "joint" => {
                report.joint = Some(self.run_joint(&systems, &site, &dll, duration, step, seed)?);
                report.label = "MODELLED joint weighted least-squares pseudorange positioning with one \
                                clock per system or a known offset; noise from the delay-lock-loop model \
                                at the C/N0 envelope plus the signal-in-space range error"
                    .into();
            }
            "polar" => {
                let p = self.polar.clone().unwrap_or_default();
                let ls = p.lat_step_deg.unwrap_or(10.0);
                let os = p.lon_step_deg.unwrap_or(45.0);
                if !(ls > 0.0 && os > 0.0) {
                    return Err("polar steps must be positive".into());
                }
                let thr = p.pdop_threshold.unwrap_or(6.0);
                let mut lats = Vec::new();
                let mut l: f64 = 0.0;
                while l <= 90.0 + 1e-9 {
                    lats.push(l.min(89.9));
                    l += ls;
                }
                let lons: Vec<f64> = (0..((360.0 / os).floor() as usize).max(1))
                    .map(|k| -180.0 + k as f64 * os)
                    .collect();
                let times: Vec<f64> = (0..=((duration / step).floor() as usize))
                    .map(|k| k as f64 * step)
                    .collect();
                report.polar = Some(PolarOut {
                    pdop_threshold: thr,
                    rows: polar::latitude_sweep(&systems, &lats, &lons, &times, thr),
                });
                report.label =
                    "MODELLED geometry against latitude: two-body orbits with J2 drift, each \
                                system's elevation mask, no terrain, signal power or scintillation"
                        .into();
            }
            "timing" => {
                report.timing = Some(self.run_timing(&systems, &site, &dll, duration, step, seed)?);
                report.label = "MODELLED LEO time transfer: known position, inverse-variance clock \
                                measurements from the pseudorange noise model, a two-state clock filter \
                                with the oscillator class's process noise, and the IS-GPS-200 \
                                system-time-to-UTC expression with a stated offset uncertainty"
                    .into();
            }
            m => {
                return Err(format!(
                    "mode must be doppler, joint, polar or timing; got {m:?}"
                ))
            }
        }
        Ok(report)
    }

    fn run_doppler(
        &self,
        systems: &[System],
        site: &Site,
        u: &UserCfg,
        duration: f64,
        step: f64,
        seed: u64,
    ) -> Result<DopplerOut, String> {
        let cfg = self.doppler.clone().unwrap_or_default();
        let r0 = site.ecef();
        let (e, n, up) = site.enu();
        let v = u.velocity_enu_mps;
        let vel = add(add(scale(e, v[0]), scale(n, v[1])), scale(up, v[2]));
        let moving = norm(vel) > 0.0;
        let est_vel = cfg.estimate_velocity.unwrap_or(moving);
        let leo: Vec<usize> = (0..systems.len())
            .filter(|&k| systems[k].role == "leo")
            .collect();
        if leo.is_empty() {
            return Err("doppler mode needs at least one LEO system".into());
        }
        let leo_sys: Vec<System> = leo.iter().map(|&k| systems[k].clone()).collect();
        let mut rng = ChaCha8Rng::seed_from_u64(seed);
        let n01 = Normal::new(0.0, 1.0).map_err(|e| e.to_string())?;
        let n_ep = (duration / step).floor() as usize + 1;
        let mut obs: Vec<(RangeRateObs, (usize, usize))> = Vec::new();
        for k in 0..n_ep {
            let t = k as f64 * step;
            let ru = add(r0, scale(vel, t));
            for s in in_view(&leo_sys, ru, up, t) {
                let sig = leo_sys[s.system].sigma_rr_mps();
                let rr = doppler::range_rate(ru, vel, s.pos, s.vel)
                    + u.clock_drift_mps
                    + sig * n01.sample(&mut rng);
                obs.push((
                    RangeRateObs {
                        t_s: t,
                        sat_pos: s.pos,
                        sat_vel: s.vel,
                        range_rate_mps: rr,
                        sigma_mps: sig,
                    },
                    (s.system, s.sat),
                ));
            }
        }
        if cfg.single_satellite {
            let mut best: Option<((usize, usize), usize)> = None;
            for (_, id) in &obs {
                let c = obs.iter().filter(|(_, j)| j == id).count();
                if c > best.map(|b| b.1).unwrap_or(0) {
                    best = Some((*id, c));
                }
            }
            if let Some((id, _)) = best {
                obs.retain(|(_, j)| *j == id);
            }
        }
        let height_sigma = cfg.height_sigma_m.or(cfg.single_satellite.then_some(1.0));
        let opts = DopplerOptions {
            estimate_velocity: est_vel,
            height_sigma_m: height_sigma,
            max_iter: 40,
        };
        let start = add(r0, [1500.0, -1500.0, 800.0]);
        let fit = |sel: &[(RangeRateObs, (usize, usize))]| {
            let o: Vec<RangeRateObs> = sel.iter().map(|x| x.0).collect();
            doppler::solve(&o, &opts, start, Some(r0))
        };
        let n_sats = |sel: &[(RangeRateObs, (usize, usize))]| {
            let mut ids: Vec<(usize, usize)> = sel.iter().map(|x| x.1).collect();
            ids.sort_unstable();
            ids.dedup();
            ids.len()
        };
        let full = fit(&obs)?;
        let err = sub(full.position, r0);
        let windows: Vec<f64> = if cfg.windows_s.is_empty() {
            [0.05, 0.1, 0.2, 0.33, 0.5, 0.75, 1.0]
                .iter()
                .map(|f| f * duration)
                .collect()
        } else {
            cfg.windows_s.clone()
        };
        let window_rows = windows
            .iter()
            .map(|&w| {
                let sel: Vec<(RangeRateObs, (usize, usize))> = obs
                    .iter()
                    .filter(|x| x.0.t_s <= w + 1e-9)
                    .cloned()
                    .collect();
                let f = fit(&sel).ok().filter(|f| f.converged);
                WindowRow {
                    window_s: w,
                    n_obs: sel.len(),
                    n_sats: n_sats(&sel),
                    error_3d_m: f.as_ref().map(|f| norm(sub(f.position, r0))),
                    horizontal_error_m: f.as_ref().map(|f| horiz(sub(f.position, r0), site)),
                    sigma_horizontal_m: f
                        .as_ref()
                        .map(|f| f.sigma_enu_m[0].hypot(f.sigma_enu_m[1])),
                }
            })
            .collect();
        // Envelopes.
        let mut envelopes = Vec::new();
        for s in &leo_sys {
            let mut in_run = doppler::DopplerEnvelope {
                max_doppler_hz: 0.0,
                max_doppler_rate_hz_s: 0.0,
                max_doppler_jerk_hz_s2: 0.0,
            };
            let mut seen: Vec<usize> = Vec::new();
            for k in 0..n_ep {
                for iv in in_view(std::slice::from_ref(s), r0, up, k as f64 * step) {
                    if !seen.contains(&iv.sat) {
                        seen.push(iv.sat);
                    }
                }
            }
            for &j in seen.iter().take(64) {
                let env = doppler::doppler_envelope(
                    &s.orbits[j],
                    site,
                    s.carrier_hz,
                    0.0,
                    duration,
                    step.min(5.0),
                    s.mask_rad,
                );
                in_run.max_doppler_hz = in_run.max_doppler_hz.max(env.max_doppler_hz);
                in_run.max_doppler_rate_hz_s =
                    in_run.max_doppler_rate_hz_s.max(env.max_doppler_rate_hz_s);
                in_run.max_doppler_jerk_hz_s2 = in_run
                    .max_doppler_jerk_hz_s2
                    .max(env.max_doppler_jerk_hz_s2);
            }
            let o = s.orbits[0];
            let t_c = o.period_s() / 4.0;
            let over = doppler::offset_site(&o, t_c, 0.0);
            let overhead = doppler::doppler_envelope(
                &o,
                &over,
                s.carrier_hz,
                t_c - o.period_s() / 6.0,
                t_c + o.period_s() / 6.0,
                1.0,
                0.0,
            );
            envelopes.push(EnvelopeOut {
                system: s.name.clone(),
                in_run,
                overhead_pass: overhead,
            });
        }
        let single_pass = if cfg.pass_offsets_km.is_empty() {
            Vec::new()
        } else {
            let s = &leo_sys[0];
            let o: EarthOrbit = s.orbits[0];
            doppler::single_pass_geometry(
                &o,
                o.period_s() / 4.0,
                &cfg.pass_offsets_km,
                o.period_s() / 6.0,
                step.min(5.0),
                s.mask_rad,
                s.sigma_rr_mps(),
                Some(height_sigma.unwrap_or(1.0)),
            )
        };
        Ok(DopplerOut {
            n_obs: obs.len(),
            n_sats: n_sats(&obs),
            estimated_velocity: est_vel,
            height_sigma_m: height_sigma,
            error_3d_m: norm(err),
            horizontal_error_m: horiz(err, site),
            sigma_enu_m: full.sigma_enu_m,
            velocity_error_mps: est_vel.then(|| norm(sub(full.velocity, vel))),
            drift_error_mps: (full.drift_mps - u.clock_drift_mps).abs(),
            weighted_rms: full.weighted_rms,
            windows: window_rows,
            envelopes,
            single_pass,
        })
    }

    fn run_joint(
        &self,
        systems: &[System],
        site: &Site,
        dll: &DllCfg,
        duration: f64,
        step: f64,
        seed: u64,
    ) -> Result<JointOut, String> {
        let jc = self.joint.clone().unwrap_or_default();
        let max_leo = jc.max_leo_sweep.unwrap_or(12);
        let user = site.ecef();
        let up = site.enu().2;
        let clocks: Vec<SystemClock> = systems
            .iter()
            .map(|s| match s.clock {
                SystemClock::Known(_) => SystemClock::Known(s.isb_m),
                c => c,
            })
            .collect();
        let mut rng = ChaCha8Rng::seed_from_u64(seed);
        let n01 = Normal::new(0.0, 1.0).map_err(|e| e.to_string())?;
        let n_ep = (duration / step).floor() as usize + 1;
        let mut epochs = Vec::with_capacity(n_ep);
        let mut acc: [FixAcc; 3] = Default::default();
        let mut isb_acc: Vec<Vec<f64>> = vec![Vec::new(); systems.len()];
        let mut sweep: Vec<(Vec<f64>, Vec<f64>, Vec<f64>)> = vec![Default::default(); max_leo + 1];
        for k in 0..n_ep {
            let t = k as f64 * step;
            let clk = 100.0 + 0.3 * t;
            let vis: Vec<_> = in_view(systems, user, up, t)
                .into_iter()
                .filter(|s| !systems[s.system].doppler_only)
                .collect();
            let obs: Vec<(PseudorangeObs, f64)> = vis
                .iter()
                .map(|s| {
                    let sys = &systems[s.system];
                    let sd = sys.sigma_pr_m(s.el, dll);
                    (
                        PseudorangeObs {
                            sat_pos: s.pos,
                            pseudorange_m: norm(sub(s.pos, user))
                                + clk
                                + sys.isb_m
                                + sd * n01.sample(&mut rng),
                            sigma_m: sd,
                            system: s.system,
                        },
                        s.el,
                    )
                })
                .collect();
            let start = add(user, [3e3, -2e3, 1e3]);
            let mut solve_group = |g: usize| -> (Option<f64>, Option<f64>) {
                let sel: Vec<PseudorangeObs> = obs
                    .iter()
                    .filter(|(o, _)| match g {
                        0 => systems[o.system].role == "gnss",
                        1 => systems[o.system].role == "leo",
                        _ => true,
                    })
                    .map(|x| x.0)
                    .collect();
                match joint_pvt::solve(&sel, &clocks, start, 15) {
                    Ok(f) => {
                        let e = norm(sub(f.position, user));
                        let s = f.sigma_enu_m;
                        acc[g].0.push(f.dop.pdop);
                        acc[g].1.push(e);
                        acc[g]
                            .2
                            .push((s[0] * s[0] + s[1] * s[1] + s[2] * s[2]).sqrt());
                        acc[g].3 += 1;
                        if g == 2 {
                            for (sys, b) in &f.isb_m {
                                isb_acc[*sys].push(*b);
                            }
                        }
                        (Some(f.dop.pdop), Some(e))
                    }
                    Err(_) => (None, None),
                }
            };
            let (pg, eg) = solve_group(0);
            let (_, el) = solve_group(1);
            let (pf, ef) = solve_group(2);
            // DOP sweep: GNSS plus the n highest LEO satellites.
            let gnss_geo: Vec<([f64; 3], usize)> = vis
                .iter()
                .filter(|s| systems[s.system].role == "gnss")
                .map(|s| (s.pos, s.system))
                .collect();
            let mut leo_geo: Vec<(f64, [f64; 3], usize)> = vis
                .iter()
                .filter(|s| systems[s.system].role == "leo")
                .map(|s| (s.el, s.pos, s.system))
                .collect();
            leo_geo.sort_by(|a, b| b.0.total_cmp(&a.0));
            for (nl, row) in sweep.iter_mut().enumerate() {
                if nl > leo_geo.len() {
                    break;
                }
                let mut geo = gnss_geo.clone();
                geo.extend(leo_geo.iter().take(nl).map(|x| (x.1, x.2)));
                if let Some(d) = joint_pvt::dop(user, &geo, &clocks) {
                    row.0.push(d.pdop);
                    row.1.push(d.hdop);
                    row.2.push(d.vdop);
                }
            }
            epochs.push(JointEpoch {
                t_s: t,
                n_gnss: gnss_geo.len(),
                n_leo: leo_geo.len(),
                pdop_gnss: pg,
                pdop_fused: pf,
                error_gnss_m: eg,
                error_fused_m: ef,
                error_leo_m: el,
            });
        }
        let fom = |a: &FixAcc| FixFom {
            availability: a.3 as f64 / n_ep as f64,
            median_pdop: median(a.0.clone()),
            rms_error_3d_m: rms(&a.1),
            median_sigma_3d_m: median(a.2.clone()),
        };
        Ok(JointOut {
            fraction_epochs_with_leo: epochs.iter().filter(|e| e.n_leo > 0).count() as f64
                / n_ep as f64,
            gnss: fom(&acc[0]),
            leo: fom(&acc[1]),
            fused: fom(&acc[2]),
            isb_estimates: isb_acc
                .iter()
                .enumerate()
                .filter_map(|(k, v)| median(v.clone()).map(|m| (systems[k].name.clone(), m)))
                .collect(),
            isb_truth: systems.iter().map(|s| (s.name.clone(), s.isb_m)).collect(),
            dop_sweep: sweep
                .into_iter()
                .enumerate()
                .map(|(nl, (p, h, v))| SweepRow {
                    n_leo: nl,
                    n_epochs: p.len(),
                    median_pdop: median(p),
                    median_hdop: median(h),
                    median_vdop: median(v),
                })
                .collect(),
            epochs,
        })
    }

    fn run_timing(
        &self,
        systems: &[System],
        site: &Site,
        dll: &DllCfg,
        duration: f64,
        step: f64,
        seed: u64,
    ) -> Result<TimingOut, String> {
        let tc = self.timing.clone().unwrap_or_default();
        let clocks: Vec<String> = if tc.clocks.is_empty() {
            ["tcxo", "ocxo", "csac", "rafs"]
                .iter()
                .map(|s| s.to_string())
                .collect()
        } else {
            tc.clocks.clone()
        };
        let offsets = if tc.cn0_offsets_db.is_empty() {
            vec![-10.0, -5.0, 0.0, 5.0]
        } else {
            tc.cn0_offsets_db.clone()
        };
        let user = site.ecef();
        let up = site.enu().2;
        let leo: Vec<System> = systems
            .iter()
            .filter(|s| s.role == "leo" && !s.doppler_only)
            .cloned()
            .collect();
        if leo.is_empty() {
            return Err("timing mode needs a LEO system with code ranging".into());
        }
        let n_ep = (duration / step).floor() as usize + 1;
        let views: Vec<Vec<super::system::InView>> = (0..n_ep)
            .map(|k| in_view(&leo, user, up, k as f64 * step))
            .collect();
        let meas_for = |off: f64| -> Vec<Option<f64>> {
            views
                .iter()
                .map(|v| {
                    if v.is_empty() {
                        return None;
                    }
                    let info: f64 = v
                        .iter()
                        .map(|s| {
                            let mut sys = leo[s.system].clone();
                            sys.cn0_dbhz = [sys.cn0_dbhz[0] + off, sys.cn0_dbhz[1] + off];
                            let sd = sys.sigma_pr_m(s.el, dll) / super::C_LIGHT;
                            1.0 / (sd * sd)
                        })
                        .sum();
                    Some(1.0 / info.sqrt())
                })
                .collect()
        };
        let mut rows = Vec::new();
        let mut median_meas = None;
        for &off in offsets.iter() {
            let meas = meas_for(off);
            if off == 0.0 {
                median_meas = median(meas.iter().flatten().copied().collect());
            }
            for c in clocks.iter() {
                let class = crate::clock_state::ClockClass::from_id(c)
                    .ok_or_else(|| format!("unknown clock class {c:?}"))?;
                let noise = crate::slot_timing::ClockNoise::from_class(class);
                // One seed for every row: the rows then share the noise and the UTC-offset
                // draw, so their differences are the C/N0 and the oscillator alone.
                let s = seed;
                rows.push(TimingRow {
                    clock: class.id().to_string(),
                    cn0_offset_db: off,
                    stats: timing::simulate(&meas, step, &noise, tc.utc.sigma_s, s)?,
                });
            }
        }
        Ok(TimingOut {
            utc_offset_s: timing::utc_offset_s(&tc.utc, tc.tow0_s, tc.week),
            utc_time_of_day_s: timing::system_to_utc_s(&tc.utc, tc.tow0_s, tc.week),
            utc_sigma_s: tc.utc.sigma_s,
            median_measurement_sigma_s: median_meas,
            rows,
        })
    }

    /// Run and render.
    pub fn run_output(&self) -> Result<(String, String, String), String> {
        let r = self.compute()?;
        let mut doc = serde_json::to_value(&r).map_err(|e| e.to_string())?;
        if let Some(o) = doc.as_object_mut() {
            o.insert("units".into(), crate::field_schema::units_block(PVT_UNITS));
        }
        let json = serde_json::to_string_pretty(&doc).map_err(|e| e.to_string())?;
        Ok((json, summary(&r), svg(&r)))
    }
}

fn f(v: Option<f64>, d: usize) -> String {
    v.map(|x| format!("{x:.d$}"))
        .unwrap_or_else(|| "n/a".into())
}

/// Text summary.
pub fn summary(r: &LeoPvtReport) -> String {
    let mut s = format!(
        "LEO PVT ({}) at {:.2}, {:.2} over {:.0} s\n",
        r.mode, r.user_lat_deg, r.user_lon_deg, r.duration_s
    );
    for sys in &r.systems {
        s.push_str(&format!(
            "  {:<12} {:<4} {:>5} sats at {:>6.0} km, {:.2} MHz{}\n",
            sys.name,
            sys.role,
            sys.n_satellites,
            sys.mean_altitude_km,
            sys.carrier_hz / 1e6,
            if sys.doppler_only {
                ", Doppler only"
            } else {
                ""
            }
        ));
    }
    if let Some(d) = &r.doppler {
        s.push_str(&format!(
            "  Doppler fix: {} measurements from {} satellites, 3D error {:.2} m (horizontal {:.2} m)\n",
            d.n_obs, d.n_sats, d.error_3d_m, d.horizontal_error_m
        ));
        for w in &d.windows {
            s.push_str(&format!(
                "    window {:>6.0} s: {} sats, 3D error {} m\n",
                w.window_s,
                w.n_sats,
                f(w.error_3d_m, 2)
            ));
        }
        for e in &d.envelopes {
            s.push_str(&format!(
                "  {} overhead pass: max Doppler {:.0} Hz, rate {:.1} Hz/s, jerk {:.3} Hz/s^2\n",
                e.system,
                e.overhead_pass.max_doppler_hz,
                e.overhead_pass.max_doppler_rate_hz_s,
                e.overhead_pass.max_doppler_jerk_hz_s2
            ));
        }
    }
    if let Some(j) = &r.joint {
        s.push_str(&format!(
            "  LEO ranging satellite in view on {:.1}% of epochs\n",
            100.0 * j.fraction_epochs_with_leo
        ));
        for (n, g) in [
            ("GNSS only", &j.gnss),
            ("LEO only", &j.leo),
            ("fused", &j.fused),
        ] {
            s.push_str(&format!(
                "  {n:<10} availability {:.3}, median PDOP {}, RMS 3D error {} m\n",
                g.availability,
                f(g.median_pdop, 2),
                f(g.rms_error_3d_m, 2)
            ));
        }
    }
    if let Some(p) = &r.polar {
        for row in &p.rows {
            s.push_str(&format!(
                "  lat {:>4.1}: VDOP GNSS {} LEO {} fused {}; in view {:.1}/{:.1}\n",
                row.lat_deg,
                f(row.gnss.median_vdop, 2),
                f(row.leo.median_vdop, 2),
                f(row.fused.median_vdop, 2),
                row.gnss.mean_in_view,
                row.leo.mean_in_view
            ));
        }
    }
    if let Some(t) = &r.timing {
        for row in &t.rows {
            s.push_str(&format!(
                "  {:<5} C/N0 {:+.0} dB: RMS {:.1} ns, 95% {:.1} ns, max {:.1} ns (in view {:.2})\n",
                row.clock,
                row.cn0_offset_db,
                row.stats.rms_s * 1e9,
                row.stats.p95_s * 1e9,
                row.stats.max_abs_s * 1e9,
                row.stats.fraction_in_view
            ));
        }
    }
    s
}

fn svg(r: &LeoPvtReport) -> String {
    let (w, h) = (900.0, 440.0);
    let mut s = crate::chart::frame_open(w, h, &format!("LEO PVT — {} mode", r.mode), "MODELLED");
    let (ml, top, pw, ph) = (80.0, 80.0, 780.0, 280.0);
    let mut series: Vec<(Vec<(f64, f64)>, &str)> = Vec::new();
    let (cap, xlab) = if let Some(d) = &r.doppler {
        series.push((
            d.windows
                .iter()
                .filter_map(|x| Some((x.window_s, x.error_3d_m?)))
                .collect(),
            "#5b7fa6",
        ));
        (
            "3D Doppler-fix error (log10 m) against window length",
            "window (s)",
        )
    } else if let Some(j) = &r.joint {
        series.push((
            j.dop_sweep
                .iter()
                .filter_map(|x| Some((x.n_leo as f64, x.median_pdop?)))
                .collect(),
            "#5b7fa6",
        ));
        series.push((
            j.dop_sweep
                .iter()
                .filter_map(|x| Some((x.n_leo as f64, x.median_vdop?)))
                .collect(),
            "#c79e63",
        ));
        (
            "median PDOP (blue) and VDOP (amber), log10, against LEO satellites added",
            "LEO satellites added",
        )
    } else if let Some(p) = &r.polar {
        series.push((
            p.rows
                .iter()
                .filter_map(|x| Some((x.lat_deg, x.gnss.median_vdop?)))
                .collect(),
            "#8a8172",
        ));
        series.push((
            p.rows
                .iter()
                .filter_map(|x| Some((x.lat_deg, x.leo.median_vdop?)))
                .collect(),
            "#5b7fa6",
        ));
        series.push((
            p.rows
                .iter()
                .filter_map(|x| Some((x.lat_deg, x.fused.median_vdop?)))
                .collect(),
            "#c79e63",
        ));
        (
            "median VDOP (log10): grey GNSS, blue LEO, amber fused",
            "latitude (deg)",
        )
    } else if let Some(t) = &r.timing {
        let mut clocks: Vec<&str> = t.rows.iter().map(|x| x.clock.as_str()).collect();
        clocks.dedup();
        let pal = [
            "#8a8172", "#5b7fa6", "#c79e63", "#6b9e78", "#a65b5b", "#7a5ba6",
        ];
        for (k, c) in clocks.iter().enumerate() {
            series.push((
                t.rows
                    .iter()
                    .filter(|x| x.clock == *c)
                    .map(|x| (x.cn0_offset_db, x.stats.rms_s * 1e9))
                    .collect(),
                pal[k % pal.len()],
            ));
        }
        (
            "RMS time error to UTC (log10 ns) against C/N0 offset, one line per oscillator",
            "C/N0 offset (dB)",
        )
    } else {
        ("", "")
    };
    s.push_str(&crate::chart::panel_axes(ml, top, pw, top + ph, cap));
    let pts: Vec<(f64, f64)> = series
        .iter()
        .flat_map(|x| x.0.iter().copied())
        .filter(|p| p.1 > 0.0)
        .collect();
    if !pts.is_empty() {
        let (x0, x1) = pts
            .iter()
            .fold((f64::MAX, f64::MIN), |a, p| (a.0.min(p.0), a.1.max(p.0)));
        let x1 = if x1 > x0 { x1 } else { x0 + 1.0 };
        let lo = pts
            .iter()
            .map(|p| p.1.log10())
            .fold(f64::MAX, f64::min)
            .floor();
        let hi = pts
            .iter()
            .map(|p| p.1.log10())
            .fold(f64::MIN, f64::max)
            .ceil()
            .max(lo + 1.0);
        for (line, col) in &series {
            let p: Vec<String> = line
                .iter()
                .filter(|p| p.1 > 0.0)
                .map(|p| {
                    format!(
                        "{:.1},{:.1}",
                        ml + pw * (p.0 - x0) / (x1 - x0),
                        top + ph - ph * (p.1.log10() - lo) / (hi - lo)
                    )
                })
                .collect();
            s.push_str(&format!(
                "<polyline fill=\"none\" stroke=\"{col}\" stroke-width=\"1.8\" points=\"{}\"/>",
                p.join(" ")
            ));
        }
        s.push_str(&format!(
            "<text x=\"10\" y=\"{:.0}\" font-size=\"10\" fill=\"#8a8172\">10^{hi:.0}</text><text x=\"10\" y=\"{:.0}\" font-size=\"10\" fill=\"#8a8172\">10^{lo:.0}</text>\
             <text x=\"{ml:.0}\" y=\"{:.0}\" font-size=\"10\" fill=\"#8a8172\">{xlab}: {x0:.0} to {x1:.0}</text>",
            top + 10.0,
            top + ph,
            top + ph + 24.0
        ));
    }
    s.push_str("</svg>");
    s
}

/// Units of the `leo-pvt` report.
pub const PVT_UNITS: &[FieldUnit] = &[
    FieldUnit {
        path: "duration_s",
        unit: "s",
        provenance: Input,
        definition: "span of the run",
    },
    FieldUnit {
        path: "step_s",
        unit: "s",
        provenance: Input,
        definition: "epoch spacing",
    },
    FieldUnit {
        path: "user_lat_deg",
        unit: "deg",
        provenance: Input,
        definition: "user geodetic latitude",
    },
    FieldUnit {
        path: "user_lon_deg",
        unit: "deg",
        provenance: Input,
        definition: "user east longitude",
    },
    FieldUnit {
        path: "systems[].n_satellites",
        unit: "count",
        provenance: Input,
        definition: "satellites of the system",
    },
    FieldUnit {
        path: "systems[].mean_altitude_km",
        unit: "km",
        provenance: Computed,
        definition: "mean altitude of the semi-major axes",
    },
    FieldUnit {
        path: "systems[].carrier_hz",
        unit: "Hz",
        provenance: Input,
        definition: "carrier frequency (preset or scenario)",
    },
    FieldUnit {
        path: "systems[].cn0_dbhz[]",
        unit: "dB-Hz",
        provenance: ModelledInput,
        definition: "C/N0 at the elevation mask and at the zenith",
    },
    FieldUnit {
        path: "systems[].sisre_m",
        unit: "m",
        provenance: ModelledInput,
        definition: "signal-in-space range error of orbit and clock, one sigma",
    },
    FieldUnit {
        path: "systems[].sigma_pr_30deg_m",
        unit: "m",
        provenance: Modelled,
        definition:
            "pseudorange one-sigma at 30 deg elevation: loop noise at C/N0 combined with the SISRE",
    },
    FieldUnit {
        path: "systems[].sigma_range_rate_mps",
        unit: "m/s",
        provenance: Modelled,
        definition: "range-rate one-sigma: wavelength times the Doppler one-sigma",
    },
    FieldUnit {
        path: "doppler.n_obs",
        unit: "count",
        provenance: Computed,
        definition: "range-rate measurements in the full fit",
    },
    FieldUnit {
        path: "doppler.n_sats",
        unit: "count",
        provenance: Computed,
        definition: "distinct satellites in the full fit",
    },
    FieldUnit {
        path: "doppler.height_sigma_m",
        unit: "m",
        provenance: Input,
        definition: "one-sigma of the height constraint",
    },
    FieldUnit {
        path: "doppler.error_3d_m",
        unit: "m",
        provenance: Modelled,
        definition: "3D position error of the full batch Doppler fit",
    },
    FieldUnit {
        path: "doppler.horizontal_error_m",
        unit: "m",
        provenance: Modelled,
        definition: "horizontal position error of the full fit",
    },
    FieldUnit {
        path: "doppler.sigma_enu_m[]",
        unit: "m",
        provenance: Modelled,
        definition: "formal one-sigma east, north, up of the full fit",
    },
    FieldUnit {
        path: "doppler.velocity_error_mps",
        unit: "m/s",
        provenance: Modelled,
        definition: "velocity error when the velocity is estimated",
    },
    FieldUnit {
        path: "doppler.drift_error_mps",
        unit: "m/s",
        provenance: Modelled,
        definition: "clock-drift error of the fit",
    },
    FieldUnit {
        path: "doppler.weighted_rms",
        unit: "1",
        provenance: InternalConsistency,
        definition: "weighted post-fit residual RMS; near 1 when the sigmas describe the noise",
    },
    FieldUnit {
        path: "doppler.windows[].window_s",
        unit: "s",
        provenance: Input,
        definition: "window length from the start of the run",
    },
    FieldUnit {
        path: "doppler.windows[].n_obs",
        unit: "count",
        provenance: Computed,
        definition: "measurements in the window",
    },
    FieldUnit {
        path: "doppler.windows[].n_sats",
        unit: "count",
        provenance: Computed,
        definition: "distinct satellites in the window",
    },
    FieldUnit {
        path: "doppler.windows[].error_3d_m",
        unit: "m",
        provenance: Modelled,
        definition: "3D error of the fit over the window",
    },
    FieldUnit {
        path: "doppler.windows[].horizontal_error_m",
        unit: "m",
        provenance: Modelled,
        definition: "horizontal error of the fit over the window",
    },
    FieldUnit {
        path: "doppler.windows[].sigma_horizontal_m",
        unit: "m",
        provenance: Modelled,
        definition: "formal horizontal one-sigma of the fit over the window",
    },
    FieldUnit {
        path: "doppler.envelopes[].*.max_doppler_hz",
        unit: "Hz",
        provenance: Computed,
        definition: "largest absolute Doppler shift",
    },
    FieldUnit {
        path: "doppler.envelopes[].*.max_doppler_rate_hz_s",
        unit: "Hz/s",
        provenance: Computed,
        definition: "largest absolute Doppler rate",
    },
    FieldUnit {
        path: "doppler.envelopes[].*.max_doppler_jerk_hz_s2",
        unit: "Hz/s^2",
        provenance: Computed,
        definition: "largest absolute rate of change of the Doppler rate",
    },
    FieldUnit {
        path: "doppler.single_pass[].cross_track_offset_km",
        unit: "km",
        provenance: Input,
        definition: "user distance from the ground track at closest approach",
    },
    FieldUnit {
        path: "doppler.single_pass[].max_elevation_deg",
        unit: "deg",
        provenance: Computed,
        definition: "highest elevation of the pass",
    },
    FieldUnit {
        path: "doppler.single_pass[].pass_duration_s",
        unit: "s",
        provenance: Computed,
        definition: "time above the mask",
    },
    FieldUnit {
        path: "doppler.single_pass[].n_obs",
        unit: "count",
        provenance: Computed,
        definition: "measurements over the pass",
    },
    FieldUnit {
        path: "doppler.single_pass[].sigma_along_m",
        unit: "m",
        provenance: Modelled,
        definition: "formal along-track one-sigma of the single-pass fit",
    },
    FieldUnit {
        path: "doppler.single_pass[].sigma_cross_m",
        unit: "m",
        provenance: Modelled,
        definition: "formal cross-track one-sigma of the single-pass fit",
    },
    FieldUnit {
        path: "doppler.single_pass[].sigma_up_m",
        unit: "m",
        provenance: Modelled,
        definition: "formal vertical one-sigma of the single-pass fit",
    },
    FieldUnit {
        path: "joint.*.availability",
        unit: "1",
        provenance: Computed,
        definition: "fraction of epochs with a fix",
    },
    FieldUnit {
        path: "joint.*.median_pdop",
        unit: "1",
        provenance: Computed,
        definition: "median position dilution of precision",
    },
    FieldUnit {
        path: "joint.*.rms_error_3d_m",
        unit: "m",
        provenance: Modelled,
        definition: "RMS 3D error of the seeded fixes",
    },
    FieldUnit {
        path: "joint.*.median_sigma_3d_m",
        unit: "m",
        provenance: Modelled,
        definition: "median formal 3D one-sigma",
    },
    FieldUnit {
        path: "joint.fraction_epochs_with_leo",
        unit: "1",
        provenance: Computed,
        definition: "fraction of epochs with at least one LEO ranging satellite in view",
    },
    FieldUnit {
        path: "joint.isb_estimates[][]",
        unit: "m",
        provenance: Modelled,
        definition:
            "median estimated inter-system bias of each system with its own clock, fused fix",
    },
    FieldUnit {
        path: "joint.isb_truth[][]",
        unit: "m",
        provenance: Input,
        definition: "true inter-system bias used to simulate each system's pseudoranges",
    },
    FieldUnit {
        path: "joint.dop_sweep[].n_leo",
        unit: "count",
        provenance: Input,
        definition: "LEO satellites added to the GNSS geometry, highest elevation first",
    },
    FieldUnit {
        path: "joint.dop_sweep[].median_pdop",
        unit: "1",
        provenance: Computed,
        definition: "median PDOP over epochs with that many LEO satellites in view",
    },
    FieldUnit {
        path: "joint.dop_sweep[].median_hdop",
        unit: "1",
        provenance: Computed,
        definition: "median HDOP",
    },
    FieldUnit {
        path: "joint.dop_sweep[].median_vdop",
        unit: "1",
        provenance: Computed,
        definition: "median VDOP",
    },
    FieldUnit {
        path: "joint.dop_sweep[].n_epochs",
        unit: "count",
        provenance: Computed,
        definition: "epochs contributing",
    },
    FieldUnit {
        path: "joint.epochs[].t_s",
        unit: "s",
        provenance: Computed,
        definition: "time from the start",
    },
    FieldUnit {
        path: "joint.epochs[].n_gnss",
        unit: "count",
        provenance: Computed,
        definition: "GNSS satellites in view",
    },
    FieldUnit {
        path: "joint.epochs[].n_leo",
        unit: "count",
        provenance: Computed,
        definition: "LEO ranging satellites in view",
    },
    FieldUnit {
        path: "joint.epochs[].pdop_gnss",
        unit: "1",
        provenance: Computed,
        definition: "PDOP of the GNSS-only fix",
    },
    FieldUnit {
        path: "joint.epochs[].pdop_fused",
        unit: "1",
        provenance: Computed,
        definition: "PDOP of the fused fix",
    },
    FieldUnit {
        path: "joint.epochs[].error_gnss_m",
        unit: "m",
        provenance: Modelled,
        definition: "3D error of the GNSS-only fix",
    },
    FieldUnit {
        path: "joint.epochs[].error_fused_m",
        unit: "m",
        provenance: Modelled,
        definition: "3D error of the fused fix",
    },
    FieldUnit {
        path: "joint.epochs[].error_leo_m",
        unit: "m",
        provenance: Modelled,
        definition: "3D error of the LEO-only fix",
    },
    FieldUnit {
        path: "polar.pdop_threshold",
        unit: "1",
        provenance: Input,
        definition: "PDOP threshold for availability",
    },
    FieldUnit {
        path: "polar.rows[].lat_deg",
        unit: "deg",
        provenance: Input,
        definition: "latitude",
    },
    FieldUnit {
        path: "polar.rows[].*.mean_in_view",
        unit: "count",
        provenance: Computed,
        definition: "mean satellites in view",
    },
    FieldUnit {
        path: "polar.rows[].*.median_pdop",
        unit: "1",
        provenance: Computed,
        definition: "median PDOP",
    },
    FieldUnit {
        path: "polar.rows[].*.median_hdop",
        unit: "1",
        provenance: Computed,
        definition: "median HDOP",
    },
    FieldUnit {
        path: "polar.rows[].*.median_vdop",
        unit: "1",
        provenance: Computed,
        definition: "median VDOP",
    },
    FieldUnit {
        path: "polar.rows[].*.availability",
        unit: "1",
        provenance: Computed,
        definition: "fraction of samples with PDOP at or below the threshold",
    },
    FieldUnit {
        path: "timing.utc_offset_s",
        unit: "s",
        provenance: ClosedForm,
        definition: "system-time-to-UTC offset at the start, IS-GPS-200 20.3.3.5.2.4 expression",
    },
    FieldUnit {
        path: "timing.utc_time_of_day_s",
        unit: "s",
        provenance: ClosedForm,
        definition: "UTC time of day at the start",
    },
    FieldUnit {
        path: "timing.utc_sigma_s",
        unit: "s",
        provenance: ModelledInput,
        definition: "one-sigma of the broadcast UTC offset",
    },
    FieldUnit {
        path: "timing.median_measurement_sigma_s",
        unit: "s",
        provenance: Modelled,
        definition: "median one-epoch clock-measurement one-sigma at the nominal C/N0",
    },
    FieldUnit {
        path: "timing.rows[].cn0_offset_db",
        unit: "dB",
        provenance: Input,
        definition: "C/N0 offset applied to every system",
    },
    FieldUnit {
        path: "timing.rows[].stats.rms_s",
        unit: "s",
        provenance: Modelled,
        definition: "RMS time error to UTC",
    },
    FieldUnit {
        path: "timing.rows[].stats.p95_s",
        unit: "s",
        provenance: Modelled,
        definition: "95th percentile of the absolute time error",
    },
    FieldUnit {
        path: "timing.rows[].stats.max_abs_s",
        unit: "s",
        provenance: Modelled,
        definition: "largest absolute time error",
    },
    FieldUnit {
        path: "timing.rows[].stats.median_predicted_sigma_s",
        unit: "s",
        provenance: Modelled,
        definition: "median predicted one-sigma including the UTC-offset term",
    },
    FieldUnit {
        path: "timing.rows[].stats.max_predicted_sigma_s",
        unit: "s",
        provenance: Modelled,
        definition: "largest predicted one-sigma",
    },
    FieldUnit {
        path: "timing.rows[].stats.fraction_in_view",
        unit: "1",
        provenance: Computed,
        definition: "fraction of epochs with a LEO satellite in view",
    },
    FieldUnit {
        path: "timing.rows[].stats.longest_gap_s",
        unit: "s",
        provenance: Computed,
        definition: "longest interval without a satellite",
    },
    FieldUnit {
        path: "timing.rows[].stats.rms_normalised",
        unit: "1",
        provenance: InternalConsistency,
        definition: "RMS of the error over its predicted sigma; near 1 when consistent",
    },
];

#[cfg(test)]
mod tests {
    use super::*;

    fn run(src: &str) -> LeoPvtReport {
        toml::from_str::<LeoPvtScenario>(src)
            .unwrap()
            .compute()
            .unwrap()
    }

    fn audit(src: &str) {
        let scn: LeoPvtScenario = toml::from_str(src).unwrap();
        let (json, _, svg) = scn.run_output().unwrap();
        let doc: serde_json::Value = serde_json::from_str(&json).unwrap();
        let a = crate::field_schema::audit_document(&doc);
        assert!(
            a.is_complete(),
            "missing {:?} malformed {:?}",
            a.missing,
            a.malformed
        );
        assert!(svg.starts_with("<svg") && svg.ends_with("</svg>"));
    }

    #[test]
    fn every_mode_runs_with_no_preset_and_every_number_has_a_unit() {
        audit("kind = \"leo-pvt\"\nmode = \"joint\"\nduration_s = 60.0\n");
        audit(
            "kind = \"leo-pvt\"\nmode = \"doppler\"\nduration_s = 300.0\n[doppler]\npass_offsets_km = [50.0, 500.0]\n",
        );
        audit("kind = \"leo-pvt\"\nmode = \"polar\"\nduration_s = 1200.0\nstep_s = 600.0\n[polar]\nlat_step_deg = 45.0\nlon_step_deg = 180.0\n");
        audit("kind = \"leo-pvt\"\nmode = \"timing\"\nduration_s = 1800.0\n[timing]\nclocks = [\"ocxo\"]\ncn0_offsets_db = [0.0]\n");
    }

    #[test]
    fn fusing_leo_never_worsens_the_median_pdop_and_the_isb_is_recovered() {
        let r = run(
            "kind = \"leo-pvt\"\nmode = \"joint\"\nduration_s = 300.0\n\
             [[system]]\nname = \"GPS\"\npreset = \"gps-baseline\"\n\
             [[system]]\nname = \"LEO\"\nisb_ns = 50.0\nsigma_pr_m = 0.5\n\
             [[system.shell]]\ntotal = 240\nplanes = 12\nphasing = 1\naltitude_km = 1000.0\ninclination_deg = 60.0\n",
        );
        let j = r.joint.unwrap();
        assert!(j.fused.median_pdop.unwrap() < j.gnss.median_pdop.unwrap());
        let isb = j.isb_estimates.iter().find(|x| x.0 == "LEO").unwrap().1;
        assert!((isb - 50e-9 * 299_792_458.0).abs() < 1.5, "{isb}");
        // More LEO satellites, lower PDOP.
        let p: Vec<f64> = j.dop_sweep.iter().filter_map(|x| x.median_pdop).collect();
        assert!(p.len() > 3 && p.last().unwrap() < p.first().unwrap());
    }

    #[test]
    fn doppler_positioning_improves_with_the_window_and_is_deterministic() {
        let src = "kind = \"leo-pvt\"\nmode = \"doppler\"\nduration_s = 600.0\n\
                   [[system]]\nname = \"L\"\nleo_preset = \"xona-pulsar\"\nsigma_doppler_hz = 1.0\n";
        let a = run(src);
        let b = run(src);
        assert_eq!(
            serde_json::to_string(&a).unwrap(),
            serde_json::to_string(&b).unwrap()
        );
        let d = a.doppler.unwrap();
        let w: Vec<f64> = d.windows.iter().filter_map(|x| x.error_3d_m).collect();
        assert!(w.last().unwrap() < w.first().unwrap(), "{w:?}");
        let s3 = norm(d.sigma_enu_m);
        assert!(
            d.error_3d_m < 4.0 * s3,
            "error {} vs formal {s3}",
            d.error_3d_m
        );
        assert!(
            d.weighted_rms > 0.8 && d.weighted_rms < 1.2,
            "{}",
            d.weighted_rms
        );
    }
}
