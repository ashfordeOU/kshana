// SPDX-License-Identifier: AGPL-3.0-only
//! Positioning from a 5G non-terrestrial network (NTN) downlink, and the `ntn-positioning`
//! scenario kind.
//!
//! A satellite downlink in the mobile-satellite service (MSS) S band, 3GPP band n256
//! (downlink 2170 to 2200 MHz, 3GPP TS 38.101-5), carries a positioning reference signal in
//! a 5 MHz New Radio (NR) channel or a 200 kHz narrowband channel. How well a receiver can
//! time and Doppler-track it is bounded by the Cramér-Rao bound (CRB):
//!
//! * time of arrival: `var(τ) ≥ 1 / (8 π² β² (C/N0) T)`, with `β` the root-mean-square
//!   (Gabor) bandwidth of the signal spectrum, `C/N0` in Hz and `T` the integration time; the
//!   range one-sigma is `c σ_τ`;
//! * frequency of a complex tone: `var(f) ≥ 3 / (2 π² (C/N0) T³)`; the range-rate one-sigma
//!   is `λ σ_f`.
//!
//! Both follow from the Fisher information of a known signal in white complex Gaussian noise
//! (Kay, *Fundamentals of Statistical Signal Processing: Estimation Theory*, 1993, chapter 3;
//! Rife and Boorstyn, IEEE Trans. Inf. Theory 20(5), 1974, for the tone). A flat spectrum of
//! width `B` has `β = B / √12`; a band-limited BPSK spectrum has the closed form in
//! [`gabor_bandwidth_bpsk_hz`]. The positioning accuracy then combines those one-sigmas with
//! the geometry: downlink time of arrival with an unknown receiver clock is a pseudorange fix
//! ([`super::joint_pvt`]), and the Doppler of one satellite over a pass is a Doppler fix
//! ([`super::doppler`]).
//!
//! ## Label
//!
//! MODELLED. The bandwidth-to-bound step is a textbook closed form, checked here against
//! numerical integration of the spectra and hand-evaluated values; that is an internal
//! consistency check, not a published worked figure, so it is not labelled VALIDATED. The
//! positioning accuracy is a bound, not an achieved accuracy: the channel is free of
//! multipath, the network is assumed synchronised to the stated range error, and the
//! constellation, C/N0 envelope and integration time are inputs.

use super::doppler::{self, DopplerOptions, RangeRateObs};
use super::geom::{median, norm, rms, sub, Site};
use super::joint_pvt::{self, PseudorangeObs, SystemClock};
use super::system::{in_view, SystemCfg};
use super::C_LIGHT;
use crate::field_schema::{FieldUnit, ProvenanceClass::*};
use crate::palette::chart::{BLUE, CYAN, MUTED};
use rand::SeedableRng;
use rand_chacha::ChaCha8Rng;
use rand_distr::{Distribution, Normal};
use serde::{Deserialize, Serialize};
use std::f64::consts::PI;

/// Root-mean-square bandwidth of a flat spectrum of width `b_hz`: `b / √12`.
pub fn gabor_bandwidth_flat_hz(b_hz: f64) -> f64 {
    b_hz / 12f64.sqrt()
}

/// Root-mean-square bandwidth of a BPSK spectrum `T_c sinc²(f T_c)` limited to `±b_hz/2`:
/// `β² = [ (b/2 − sin(π b T_c)/(2π T_c)) / (π² T_c) ] / P_b`, with `P_b` the power in the band
/// (numerator in closed form; the band power by Simpson integration of the sinc²).
pub fn gabor_bandwidth_bpsk_hz(chip_rate_hz: f64, b_hz: f64) -> f64 {
    let tc = 1.0 / chip_rate_hz;
    let num = (b_hz / 2.0 - (PI * b_hz * tc).sin() / (2.0 * PI * tc)) / (PI * PI * tc);
    let psd = |f: f64| {
        let x = PI * f * tc;
        if x.abs() < 1e-12 {
            tc
        } else {
            tc * (x.sin() / x).powi(2)
        }
    };
    let p = simpson(psd, -b_hz / 2.0, b_hz / 2.0, 20_000);
    (num / p).sqrt()
}

/// Composite Simpson integration of `f` over `[a, b]` with `n` (even) intervals.
pub fn simpson<F: Fn(f64) -> f64>(f: F, a: f64, b: f64, n: usize) -> f64 {
    let n = n + n % 2;
    let h = (b - a) / n as f64;
    let mut s = f(a) + f(b);
    for k in 1..n {
        s += f(a + k as f64 * h) * if k % 2 == 1 { 4.0 } else { 2.0 };
    }
    s * h / 3.0
}

/// Root-mean-square bandwidth of any power spectral density over `[−b/2, b/2]` by numerical
/// integration: `β² = ∫ f² S(f) df / ∫ S(f) df`.
pub fn gabor_bandwidth_numeric_hz<F: Fn(f64) -> f64>(psd: F, b_hz: f64) -> f64 {
    let num = simpson(|f| f * f * psd(f), -b_hz / 2.0, b_hz / 2.0, 20_000);
    let den = simpson(&psd, -b_hz / 2.0, b_hz / 2.0, 20_000);
    (num / den).sqrt()
}

/// CRB range one-sigma (m) for RMS bandwidth `beta_hz`, C/N0 in dB-Hz and integration `t_s`.
pub fn toa_crb_sigma_m(beta_hz: f64, cn0_dbhz: f64, t_s: f64) -> f64 {
    let cn0 = 10f64.powf(cn0_dbhz / 10.0);
    C_LIGHT / (2.0 * PI * beta_hz * (2.0 * cn0 * t_s).sqrt())
}

/// CRB frequency one-sigma (Hz) of a complex tone at C/N0 (dB-Hz) over `t_s`.
pub fn doppler_crb_sigma_hz(cn0_dbhz: f64, t_s: f64) -> f64 {
    let cn0 = 10f64.powf(cn0_dbhz / 10.0);
    (3.0 / (2.0 * PI * PI * cn0 * t_s.powi(3))).sqrt()
}

/// Root-mean-square (energy-weighted, central) duration of any signal envelope over
/// `[0, t_s]` by numerical integration: `σ_t² = ∫ t² e(t) dt / ∫ e(t) dt − (∫ t e(t) dt / ∫ e(t) dt)²`
/// with `e(t)` the instantaneous power. A constant envelope gives `t_s / √12`.
pub fn rms_duration_numeric_s<F: Fn(f64) -> f64>(power: F, t_s: f64) -> f64 {
    let n = 20_000;
    let e = simpson(&power, 0.0, t_s, n);
    let m1 = simpson(|t| t * power(t), 0.0, t_s, n) / e;
    let m2 = simpson(|t| t * t * power(t), 0.0, t_s, n) / e;
    (m2 - m1 * m1).max(0.0).sqrt()
}

/// CRB frequency one-sigma (Hz) of a known signal of RMS duration `sigma_t_s` received at
/// C/N0 (dB-Hz) over `t_s`: `1 / (2 π σ_t √(2 (C/N0) T))`, the time-frequency dual of
/// [`toa_crb_sigma_m`]. With `σ_t = T/√12` (a constant-envelope tone) it equals
/// [`doppler_crb_sigma_hz`].
pub fn frequency_crb_sigma_hz(sigma_t_s: f64, cn0_dbhz: f64, t_s: f64) -> f64 {
    let cn0 = 10f64.powf(cn0_dbhz / 10.0);
    1.0 / (2.0 * PI * sigma_t_s * (2.0 * cn0 * t_s).sqrt())
}

/// One satellite in view at one epoch of the time-of-arrival run: its body-fixed position
/// (m), elevation (rad) and the pseudorange one-sigma per signal (m, the time-of-arrival bound
/// at that elevation's C/N0 combined with the synchronisation error).
#[derive(Clone, Debug)]
pub struct NtnLos {
    /// Satellite position (m, Earth-fixed).
    pub sat_pos: [f64; 3],
    /// Elevation (rad).
    pub el: f64,
    /// Pseudorange one-sigma for each signal, in the order of [`NtnGeometry::signals`] (m).
    pub sigma_m: Vec<f64>,
}

/// One range-rate sample of the single-satellite Doppler pass, before noise.
#[derive(Clone, Debug)]
pub struct NtnDopplerSample {
    /// Time from the run start (s).
    pub t_s: f64,
    /// Satellite position (m, Earth-fixed).
    pub sat_pos: [f64; 3],
    /// Satellite velocity (m/s, Earth-fixed).
    pub sat_vel: [f64; 3],
}

/// The geometry an `ntn-positioning` run uses, exported so an external tool can recompute the
/// formal covariances on identical inputs: the true user position, the satellites in view at
/// every epoch with their per-signal sigmas, and the Doppler pass.
#[derive(Clone, Debug)]
pub struct NtnGeometry {
    /// True user position (m, Earth-fixed).
    pub user_ecef: [f64; 3],
    /// Signals, in report order.
    pub signals: Vec<NtnSignalCfg>,
    /// Satellites in view per epoch.
    pub epochs: Vec<Vec<NtnLos>>,
    /// The Doppler pass: satellite index, samples and the range-rate one-sigma (m/s).
    pub doppler_pass: Option<(usize, Vec<NtnDopplerSample>, f64)>,
}

/// Run settings shared by [`NtnScenario::compute`] and its geometry.
struct NtnCtx {
    carrier: f64,
    t_int: f64,
    t_dop: f64,
    cn0: [f64; 2],
    sync: f64,
    n_ep: usize,
    mean_in_view: f64,
    n_satellites: usize,
    site: Site,
}

/// One signal of the NTN scenario.
#[derive(Clone, Debug, Deserialize, Serialize)]
#[serde(deny_unknown_fields)]
pub struct NtnSignalCfg {
    /// Name used in the report.
    pub name: String,
    /// Occupied bandwidth (Hz), flat across the band (an orthogonal frequency-division
    /// multiplexing, OFDM, spectrum).
    pub bandwidth_hz: f64,
}

/// The `ntn-positioning` scenario.
#[derive(Clone, Debug, Deserialize, Serialize)]
#[serde(deny_unknown_fields)]
pub struct NtnScenario {
    /// Scenario kind tag.
    #[serde(default)]
    pub kind: Option<String>,
    /// Noise seed. Default 1.
    #[serde(default)]
    pub seed: Option<u64>,
    /// Carrier (Hz). Default 2172.5 MHz, the centre of the first 5 MHz channel of 3GPP
    /// band n256.
    #[serde(default)]
    pub carrier_hz: Option<f64>,
    /// Signals to compare. Default: a 5 MHz NR channel (4.5 MHz occupied) and a 200 kHz
    /// narrowband channel (180 kHz occupied).
    #[serde(default)]
    pub signal: Vec<NtnSignalCfg>,
    /// Coherent plus non-coherent integration per measurement (s). Default 0.1.
    #[serde(default)]
    pub integration_s: Option<f64>,
    /// Doppler integration per measurement (s). Default 1.0.
    #[serde(default)]
    pub doppler_integration_s: Option<f64>,
    /// C/N0 at the mask and at the zenith (dB-Hz). Default [40, 50].
    #[serde(default)]
    pub cn0_dbhz: Option<[f64; 2]>,
    /// Network synchronisation and ephemeris range error added to each time of arrival (m).
    /// Default 1.0.
    #[serde(default)]
    pub sync_error_m: Option<f64>,
    /// User site.
    #[serde(default)]
    pub user: Option<UserSite>,
    /// Span of the run (s). Default 600.
    #[serde(default)]
    pub duration_s: Option<f64>,
    /// Epoch spacing (s). Default 10.
    #[serde(default)]
    pub step_s: Option<f64>,
    /// The NTN constellation(s). Default: a representative shell of 120 satellites at 600 km.
    #[serde(default)]
    pub system: Vec<SystemCfg>,
}

/// A user site.
#[derive(Clone, Copy, Debug, Deserialize, Serialize)]
#[serde(deny_unknown_fields)]
pub struct UserSite {
    /// Geodetic latitude (deg).
    pub lat_deg: f64,
    /// East longitude (deg).
    pub lon_deg: f64,
    /// Height above the ellipsoid (m). Default 0.
    #[serde(default)]
    pub height_m: f64,
}

/// Per-signal bound figures.
#[derive(Clone, Debug, Serialize)]
pub struct SignalBound {
    /// Signal name.
    pub name: String,
    /// Occupied bandwidth (Hz).
    pub bandwidth_hz: f64,
    /// RMS bandwidth (Hz).
    pub rms_bandwidth_hz: f64,
    /// CRB range one-sigma at the mask C/N0 (m).
    pub range_sigma_mask_m: f64,
    /// CRB range one-sigma at the zenith C/N0 (m).
    pub range_sigma_zenith_m: f64,
    /// Median formal one-sigma 3D position of the time-of-arrival fix (m), the Cramér-Rao
    /// bound evaluated at the true position.
    pub toa_median_sigma_3d_m: Option<f64>,
    /// RMS 3D error of the seeded time-of-arrival fixes (m).
    pub toa_rms_error_3d_m: Option<f64>,
    /// Median PDOP.
    pub median_pdop: Option<f64>,
    /// Fraction of epochs with a time-of-arrival fix.
    pub toa_availability: f64,
}

/// Single-satellite Doppler fix over one pass.
#[derive(Clone, Debug, Serialize)]
pub struct DopplerPassOut {
    /// Satellite index within the first system.
    pub satellite: usize,
    /// Measurements used.
    pub n_obs: usize,
    /// Pass duration used (s).
    pub duration_s: f64,
    /// Range-rate one-sigma used (m/s).
    pub sigma_range_rate_mps: f64,
    /// Formal one-sigma east, north, up (m), height held to 10 m.
    pub sigma_enu_m: [f64; 3],
    /// Horizontal error of the seeded fix (m).
    pub horizontal_error_m: f64,
}

/// The report.
#[derive(Clone, Debug, Serialize)]
pub struct NtnReport {
    /// Label.
    pub label: String,
    /// Carrier (Hz).
    pub carrier_hz: f64,
    /// Integration per time of arrival (s).
    pub integration_s: f64,
    /// Doppler integration (s).
    pub doppler_integration_s: f64,
    /// C/N0 at mask and zenith (dB-Hz).
    pub cn0_dbhz: [f64; 2],
    /// Synchronisation and ephemeris range error (m).
    pub sync_error_m: f64,
    /// CRB Doppler one-sigma at the zenith C/N0 (Hz).
    pub doppler_sigma_zenith_hz: f64,
    /// Satellites in the constellation(s).
    pub n_satellites: usize,
    /// Mean satellites in view.
    pub mean_in_view: f64,
    /// Per-signal bounds and fixes.
    pub signals: Vec<SignalBound>,
    /// Single-satellite Doppler pass fix, when a pass with enough samples exists.
    pub doppler_pass: Option<DopplerPassOut>,
}

fn default_systems() -> Vec<SystemCfg> {
    vec![toml::from_str(
        "name = \"NTN\"\nrole = \"leo\"\ncarrier_hz = 2172.5e6\n\
         [[shell]]\ntotal = 120\nplanes = 12\nphasing = 1\naltitude_km = 600.0\ninclination_deg = 55.0\n",
    )
    .expect("default NTN shell parses")]
}

impl NtnScenario {
    /// The geometry of this run (see [`NtnGeometry`]); [`NtnScenario::compute`] uses exactly
    /// this geometry.
    pub fn geometry(&self) -> Result<NtnGeometry, String> {
        Ok(self.prepare()?.0)
    }

    /// Compute the report.
    pub fn compute(&self) -> Result<NtnReport, String> {
        let (geo, ctx) = self.prepare()?;
        let NtnCtx {
            carrier,
            t_int,
            t_dop,
            cn0,
            sync,
            n_ep,
            mean_in_view,
            n_satellites,
            site,
        } = ctx;
        let user = geo.user_ecef;
        let clocks = [SystemClock::Estimated];
        let mut rng = ChaCha8Rng::seed_from_u64(self.seed.unwrap_or(1));
        let n01 = Normal::new(0.0, 1.0).map_err(|e| e.to_string())?;
        let mut out = Vec::new();
        for (si, sig) in geo.signals.iter().enumerate() {
            let beta = gabor_bandwidth_flat_hz(sig.bandwidth_hz);
            let (mut sig3, mut err3, mut pdops, mut fixes) =
                (Vec::new(), Vec::new(), Vec::new(), 0usize);
            for v in &geo.epochs {
                // Every satellite in one clock group (one network time scale).
                let obs: Vec<PseudorangeObs> = v
                    .iter()
                    .map(|s| {
                        let sd = s.sigma_m[si];
                        PseudorangeObs {
                            sat_pos: s.sat_pos,
                            pseudorange_m: norm(sub(s.sat_pos, user))
                                + 300.0
                                + sd * n01.sample(&mut rng),
                            sigma_m: sd,
                            system: 0,
                        }
                    })
                    .collect();
                if obs.len() < 4 {
                    continue;
                }
                let start = [user[0] + 500.0, user[1] - 500.0, user[2] + 500.0];
                if let Ok(fix) = joint_pvt::solve(&obs, &clocks, start, 15) {
                    fixes += 1;
                    // The bound is the formal covariance at the true position, not at the
                    // noisy estimate.
                    let s =
                        joint_pvt::formal_sigma_enu(user, &obs, &clocks).unwrap_or(fix.sigma_enu_m);
                    sig3.push((s[0] * s[0] + s[1] * s[1] + s[2] * s[2]).sqrt());
                    err3.push(norm(sub(fix.position, user)));
                    pdops.push(fix.dop.pdop);
                }
            }
            out.push(SignalBound {
                name: sig.name.clone(),
                bandwidth_hz: sig.bandwidth_hz,
                rms_bandwidth_hz: beta,
                range_sigma_mask_m: toa_crb_sigma_m(beta, cn0[0], t_int),
                range_sigma_zenith_m: toa_crb_sigma_m(beta, cn0[1], t_int),
                toa_median_sigma_3d_m: median(sig3),
                toa_rms_error_3d_m: rms(&err3),
                median_pdop: median(pdops),
                toa_availability: fixes as f64 / n_ep as f64,
            });
        }
        let doppler_pass = match &geo.doppler_pass {
            Some((j, samples, sigma_rr)) => {
                let obs: Vec<RangeRateObs> = samples
                    .iter()
                    .map(|smp| {
                        let rr = doppler::range_rate(user, [0.0; 3], smp.sat_pos, smp.sat_vel);
                        RangeRateObs {
                            t_s: smp.t_s,
                            sat_pos: smp.sat_pos,
                            sat_vel: smp.sat_vel,
                            range_rate_mps: rr + 0.2 + sigma_rr * n01.sample(&mut rng),
                            sigma_mps: *sigma_rr,
                        }
                    })
                    .collect();
                let opts = DopplerOptions {
                    height_sigma_m: Some(10.0),
                    ..Default::default()
                };
                let start = [user[0] + 2e3, user[1] + 2e3, user[2] - 2e3];
                match doppler::solve(&obs, &opts, start, Some(user)) {
                    Ok(fix) => {
                        let e = sub(fix.position, user);
                        let (ee, nn, _) = site.enu();
                        let h = ((super::geom::dot(e, ee)).powi(2)
                            + (super::geom::dot(e, nn)).powi(2))
                        .sqrt();
                        Some(DopplerPassOut {
                            satellite: *j,
                            n_obs: obs.len(),
                            duration_s: (obs.len().saturating_sub(1)) as f64
                                * self.step_s.unwrap_or(10.0),
                            sigma_range_rate_mps: *sigma_rr,
                            sigma_enu_m: fix.sigma_enu_m,
                            horizontal_error_m: h,
                        })
                    }
                    Err(_) => None,
                }
            }
            None => None,
        };
        Ok(NtnReport {
            label: "MODELLED positioning from Cramér-Rao bounds: the bandwidth-to-bound step is a \
                    textbook closed form (checked against numerical integration, not against a \
                    published worked figure); the accuracy is a bound on a multipath-free channel \
                    with a stated synchronisation error, not an achieved result"
                .into(),
            carrier_hz: carrier,
            integration_s: t_int,
            doppler_integration_s: t_dop,
            cn0_dbhz: cn0,
            sync_error_m: sync,
            doppler_sigma_zenith_hz: doppler_crb_sigma_hz(cn0[1], t_dop),
            n_satellites,
            mean_in_view,
            signals: out,
            doppler_pass,
        })
    }

    /// Validate the inputs and build the run's geometry and settings.
    fn prepare(&self) -> Result<(NtnGeometry, NtnCtx), String> {
        let carrier = self.carrier_hz.unwrap_or(2_172.5e6);
        let t_int = self.integration_s.unwrap_or(0.1);
        let t_dop = self.doppler_integration_s.unwrap_or(1.0);
        let cn0 = self.cn0_dbhz.unwrap_or([40.0, 50.0]);
        let sync = self.sync_error_m.unwrap_or(1.0);
        let duration = self.duration_s.unwrap_or(600.0);
        let step = self.step_s.unwrap_or(10.0);
        for (w, v) in [
            ("carrier_hz", carrier),
            ("integration_s", t_int),
            ("doppler_integration_s", t_dop),
            ("duration_s", duration),
            ("step_s", step),
        ] {
            if !(v.is_finite() && v > 0.0) {
                return Err(format!("{w} must be positive"));
            }
        }
        if !(sync.is_finite() && sync >= 0.0) || duration / step > 5000.0 {
            return Err("sync_error_m must be non-negative and the run at most 5000 epochs".into());
        }
        let signals = if self.signal.is_empty() {
            vec![
                NtnSignalCfg {
                    name: "NR-5MHz".into(),
                    bandwidth_hz: 4.5e6,
                },
                NtnSignalCfg {
                    name: "NB-200kHz".into(),
                    bandwidth_hz: 180e3,
                },
            ]
        } else {
            self.signal.clone()
        };
        if signals
            .iter()
            .any(|s| !(s.bandwidth_hz.is_finite() && s.bandwidth_hz > 0.0))
        {
            return Err("every signal needs a positive bandwidth".into());
        }
        let cfgs = if self.system.is_empty() {
            default_systems()
        } else {
            self.system.clone()
        };
        let mut systems = super::system::build_all(&cfgs)?;
        for s in &mut systems {
            s.cn0_dbhz = cn0;
            s.carrier_hz = carrier;
        }
        let u = self.user.unwrap_or(UserSite {
            lat_deg: 50.0,
            lon_deg: 8.0,
            height_m: 100.0,
        });
        let site = Site {
            lat_deg: u.lat_deg,
            lon_deg: u.lon_deg,
            height_m: u.height_m,
        };
        let user = site.ecef();
        let up = site.enu().2;
        let n_ep = (duration / step).floor() as usize + 1;
        let views: Vec<Vec<super::system::InView>> = (0..n_ep)
            .map(|k| in_view(&systems, user, up, k as f64 * step))
            .collect();
        let mean_in_view = views.iter().map(|v| v.len() as f64).sum::<f64>() / n_ep as f64;
        let epochs: Vec<Vec<NtnLos>> = views
            .iter()
            .map(|v| {
                v.iter()
                    .map(|s| NtnLos {
                        sat_pos: s.pos,
                        el: s.el,
                        sigma_m: signals
                            .iter()
                            .map(|sig| {
                                let beta = gabor_bandwidth_flat_hz(sig.bandwidth_hz);
                                let crb = toa_crb_sigma_m(beta, systems[0].cn0_at(s.el), t_int);
                                (crb * crb + sync * sync).sqrt()
                            })
                            .collect(),
                    })
                    .collect()
            })
            .collect();
        // Single-satellite Doppler over the longest pass of the first system.
        let lambda = C_LIGHT / carrier;
        let sigma_rr = (lambda * doppler_crb_sigma_hz(cn0[0], t_dop)).max(1e-3);
        let mut best: Option<(usize, usize)> = None;
        for j in 0..systems[0].orbits.len() {
            let n = views
                .iter()
                .filter(|v| v.iter().any(|s| s.system == 0 && s.sat == j))
                .count();
            if n > best.map(|b| b.1).unwrap_or(0) {
                best = Some((j, n));
            }
        }
        let doppler_pass = match best {
            Some((j, n)) if n >= 6 => {
                let mut samples = Vec::new();
                for (k, v) in views.iter().enumerate() {
                    if let Some(s) = v.iter().find(|s| s.system == 0 && s.sat == j) {
                        samples.push(NtnDopplerSample {
                            t_s: k as f64 * step,
                            sat_pos: s.pos,
                            sat_vel: s.vel,
                        });
                    }
                }
                Some((j, samples, sigma_rr))
            }
            _ => None,
        };
        let n_satellites = systems.iter().map(|s| s.n_satellites).sum();
        Ok((
            NtnGeometry {
                user_ecef: user,
                signals,
                epochs,
                doppler_pass,
            },
            NtnCtx {
                carrier,
                t_int,
                t_dop,
                cn0,
                sync,
                n_ep,
                mean_in_view,
                n_satellites,
                site,
            },
        ))
    }

    /// Run and render: JSON with units, summary, chart.
    pub fn run_output(&self) -> Result<(String, String, String), String> {
        let r = self.compute()?;
        let mut doc = serde_json::to_value(&r).map_err(|e| e.to_string())?;
        if let Some(o) = doc.as_object_mut() {
            o.insert("units".into(), crate::field_schema::units_block(NTN_UNITS));
        }
        let json = serde_json::to_string_pretty(&doc).map_err(|e| e.to_string())?;
        let mut summary = format!(
            "5G NTN positioning at {:.1} MHz, C/N0 {:.0} to {:.0} dB-Hz, {} satellites ({:.1} in view)\n",
            r.carrier_hz / 1e6,
            r.cn0_dbhz[0],
            r.cn0_dbhz[1],
            r.n_satellites,
            r.mean_in_view
        );
        for s in &r.signals {
            summary.push_str(&format!(
                "  {}: {:.0} kHz, CRB range {:.2} to {:.2} m; median formal 3D {} m, RMS error {} m\n",
                s.name,
                s.bandwidth_hz / 1e3,
                s.range_sigma_zenith_m,
                s.range_sigma_mask_m,
                s.toa_median_sigma_3d_m.map(|v| format!("{v:.2}")).unwrap_or("n/a".into()),
                s.toa_rms_error_3d_m.map(|v| format!("{v:.2}")).unwrap_or("n/a".into()),
            ));
        }
        if let Some(d) = &r.doppler_pass {
            summary.push_str(&format!(
                "  one-satellite Doppler pass: {} samples over {:.0} s, horizontal error {:.1} m\n",
                d.n_obs, d.duration_s, d.horizontal_error_m
            ));
        }
        Ok((json, summary, ntn_svg(&r)))
    }
}

fn ntn_svg(r: &NtnReport) -> String {
    let (w, h) = (900.0, 420.0);
    let mut s = crate::chart::frame_open(
        w,
        h,
        "5G NTN positioning: Cramér-Rao range bound by bandwidth",
        &format!(
            "{:.1} MHz · C/N0 {:.0}-{:.0} dB-Hz · MODELLED",
            r.carrier_hz / 1e6,
            r.cn0_dbhz[0],
            r.cn0_dbhz[1]
        ),
    );
    let (ml, top, pw, ph) = (90.0, 80.0, 760.0, 260.0);
    s.push_str(&crate::chart::panel_axes(
        ml,
        top,
        pw,
        top + ph,
        "range one-sigma (log10 m): bar = mask to zenith C/N0; dot = RMS 3D fix error",
    ));
    let vals: Vec<f64> = r
        .signals
        .iter()
        .flat_map(|x| {
            [
                Some(x.range_sigma_mask_m),
                Some(x.range_sigma_zenith_m),
                x.toa_rms_error_3d_m,
            ]
        })
        .flatten()
        .filter(|v| *v > 0.0)
        .collect();
    let lo = vals
        .iter()
        .copied()
        .fold(f64::MAX, f64::min)
        .log10()
        .floor()
        .min(-1.0);
    let hi = vals
        .iter()
        .copied()
        .fold(f64::MIN, f64::max)
        .log10()
        .ceil()
        .max(lo + 1.0);
    let y = |v: f64| top + ph - ph * (v.log10() - lo) / (hi - lo);
    let n = r.signals.len().max(1) as f64;
    for (k, sig) in r.signals.iter().enumerate() {
        let x = ml + pw * (k as f64 + 0.5) / n;
        s.push_str(&format!(
            "<rect x=\"{:.1}\" y=\"{:.1}\" width=\"30\" height=\"{:.1}\" fill=\"{BLUE}\"/>",
            x - 15.0,
            y(sig.range_sigma_mask_m),
            (y(sig.range_sigma_zenith_m) - y(sig.range_sigma_mask_m)).max(1.0)
        ));
        if let Some(e) = sig.toa_rms_error_3d_m {
            s.push_str(&format!(
                "<circle cx=\"{:.1}\" cy=\"{:.1}\" r=\"5\" fill=\"{CYAN}\"/>",
                x + 30.0,
                y(e)
            ));
        }
        s.push_str(&format!(
            "<text x=\"{:.1}\" y=\"{:.1}\" font-size=\"11\" fill=\"{MUTED}\" text-anchor=\"middle\">{}</text>",
            x,
            top + ph + 18.0,
            xml_escape(&sig.name)
        ));
    }
    s.push_str(&format!(
        "<text x=\"10\" y=\"{:.0}\" font-size=\"10\" fill=\"{MUTED}\">10^{hi:.0} m</text><text x=\"10\" y=\"{:.0}\" font-size=\"10\" fill=\"{MUTED}\">10^{lo:.0} m</text></svg>",
        top + 10.0,
        top + ph
    ));
    s
}

fn xml_escape(s: &str) -> String {
    s.replace('&', "&amp;")
        .replace('<', "&lt;")
        .replace('>', "&gt;")
}

/// Units of the `ntn-positioning` report.
pub const NTN_UNITS: &[FieldUnit] = &[
    FieldUnit { path: "carrier_hz", unit: "Hz", provenance: Input, definition: "downlink carrier" },
    FieldUnit { path: "integration_s", unit: "s", provenance: Input, definition: "integration per time-of-arrival measurement" },
    FieldUnit { path: "doppler_integration_s", unit: "s", provenance: Input, definition: "integration per Doppler measurement" },
    FieldUnit { path: "cn0_dbhz[]", unit: "dB-Hz", provenance: ModelledInput, definition: "carrier-to-noise density at the elevation mask and at the zenith" },
    FieldUnit { path: "sync_error_m", unit: "m", provenance: ModelledInput, definition: "network synchronisation and ephemeris range error added to each time of arrival" },
    FieldUnit { path: "doppler_sigma_zenith_hz", unit: "Hz", provenance: ClosedForm, definition: "Cramér-Rao bound on the tone frequency at the zenith C/N0, sqrt(3/(2 pi^2 C/N0 T^3))" },
    FieldUnit { path: "n_satellites", unit: "count", provenance: Input, definition: "satellites in the constellation" },
    FieldUnit { path: "mean_in_view", unit: "count", provenance: Computed, definition: "mean satellites above the mask" },
    FieldUnit { path: "signals[].bandwidth_hz", unit: "Hz", provenance: Input, definition: "occupied bandwidth of the flat (OFDM) spectrum" },
    FieldUnit { path: "signals[].rms_bandwidth_hz", unit: "Hz", provenance: ClosedForm, definition: "root-mean-square (Gabor) bandwidth, B/sqrt(12) for a flat spectrum" },
    FieldUnit { path: "signals[].range_sigma_mask_m", unit: "m", provenance: ClosedForm, definition: "Cramér-Rao range bound at the mask C/N0" },
    FieldUnit { path: "signals[].range_sigma_zenith_m", unit: "m", provenance: ClosedForm, definition: "Cramér-Rao range bound at the zenith C/N0" },
    FieldUnit { path: "signals[].toa_median_sigma_3d_m", unit: "m", provenance: Modelled, definition: "median formal 3D one-sigma of the time-of-arrival fix" },
    FieldUnit { path: "signals[].toa_rms_error_3d_m", unit: "m", provenance: Modelled, definition: "RMS 3D error of the seeded time-of-arrival fixes" },
    FieldUnit { path: "signals[].median_pdop", unit: "1", provenance: Computed, definition: "median position dilution of precision" },
    FieldUnit { path: "signals[].toa_availability", unit: "1", provenance: Computed, definition: "fraction of epochs with four or more satellites and a fix" },
    FieldUnit { path: "doppler_pass.satellite", unit: "index", provenance: Computed, definition: "satellite whose pass is used" },
    FieldUnit { path: "doppler_pass.n_obs", unit: "count", provenance: Computed, definition: "Doppler measurements over the pass" },
    FieldUnit { path: "doppler_pass.duration_s", unit: "s", provenance: Computed, definition: "pass duration used" },
    FieldUnit { path: "doppler_pass.sigma_range_rate_mps", unit: "m/s", provenance: ClosedForm, definition: "range-rate one-sigma: wavelength times the Doppler bound at the mask C/N0 (at least 1 mm/s)" },
    FieldUnit { path: "doppler_pass.sigma_enu_m[]", unit: "m", provenance: Modelled, definition: "formal one-sigma east, north, up of the one-satellite Doppler fix, height held to 10 m" },
    FieldUnit { path: "doppler_pass.horizontal_error_m", unit: "m", provenance: Modelled, definition: "horizontal error of the seeded one-satellite Doppler fix" },
];

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn the_numerical_rms_bandwidth_matches_the_closed_forms() {
        // Flat spectrum of width B: beta = B/sqrt(12).
        let b = 4.5e6;
        let num = gabor_bandwidth_numeric_hz(|_| 1.0, b);
        assert!((num / gabor_bandwidth_flat_hz(b) - 1.0).abs() < 1e-9);
        // Band-limited BPSK(1) in 4 MHz: closed-form numerator against full quadrature.
        let rc = 1.023e6;
        let tc = 1.0 / rc;
        let psd = |f: f64| {
            let x = PI * f * tc;
            if x.abs() < 1e-12 {
                tc
            } else {
                tc * (x.sin() / x).powi(2)
            }
        };
        let q = gabor_bandwidth_numeric_hz(psd, 4.0e6);
        let c = gabor_bandwidth_bpsk_hz(rc, 4.0e6);
        assert!((q / c - 1.0).abs() < 1e-6, "{q} vs {c}");
    }

    #[test]
    fn the_range_bound_scales_as_one_over_bandwidth_and_root_cn0() {
        let a = toa_crb_sigma_m(gabor_bandwidth_flat_hz(5e6), 45.0, 0.1);
        let b = toa_crb_sigma_m(gabor_bandwidth_flat_hz(0.2e6), 45.0, 0.1);
        assert!((b / a - 25.0).abs() < 1e-9);
        let c = toa_crb_sigma_m(gabor_bandwidth_flat_hz(5e6), 55.0, 0.1);
        assert!((a / c - 10f64.sqrt()).abs() < 1e-9);
        // By hand: B = 5 MHz, beta = 1.4434 MHz, C/N0 = 1e4.5, T = 0.1 s:
        // c / (2 pi * 1.4434e6 * sqrt(2 * 31622.8 * 0.1)) = 0.4157 m.
        assert!((a - 0.4157).abs() < 1e-3, "{a}");
    }

    #[test]
    fn the_time_spread_frequency_bound_reduces_to_the_tone_bound() {
        // A constant envelope over T has RMS duration T/sqrt(12) (numerically), and the
        // time-spread bound then equals the complex-tone bound.
        let t = 0.25;
        let st = rms_duration_numeric_s(|_| 1.0, t);
        assert!((st - t / 12f64.sqrt()).abs() < 1e-9 * t, "{st}");
        for cn0 in [30.0, 45.0, 60.0] {
            let a = frequency_crb_sigma_hz(st, cn0, t);
            let b = doppler_crb_sigma_hz(cn0, t);
            assert!((a - b).abs() < 1e-8 * b, "{a} vs {b}");
        }
    }

    #[test]
    fn the_frequency_bound_is_the_complex_tone_crlb() {
        // By hand at 45 dB-Hz over 1 s: sqrt(3 / (2 pi^2 * 31622.8)) = 2.192e-3 Hz.
        let s = doppler_crb_sigma_hz(45.0, 1.0);
        assert!((s - 2.192e-3).abs() < 1e-6, "{s}");
        assert!((doppler_crb_sigma_hz(45.0, 2.0) / s - 2f64.powf(-1.5)).abs() < 1e-12);
    }

    #[test]
    fn defaults_run_wider_is_better_and_every_number_has_a_unit() {
        let scn: NtnScenario = toml::from_str("kind = \"ntn-positioning\"\n").unwrap();
        let (json, _, svg) = scn.run_output().unwrap();
        let doc: serde_json::Value = serde_json::from_str(&json).unwrap();
        let audit = crate::field_schema::audit_document(&doc);
        assert!(
            audit.is_complete(),
            "missing {:?} malformed {:?}",
            audit.missing,
            audit.malformed
        );
        assert!(svg.starts_with("<svg") && svg.ends_with("</svg>"));
        let r = scn.compute().unwrap();
        let (nr, nb) = (&r.signals[0], &r.signals[1]);
        assert!(nr.toa_median_sigma_3d_m.unwrap() < nb.toa_median_sigma_3d_m.unwrap());
        assert!(r.doppler_pass.is_some());
    }
}
