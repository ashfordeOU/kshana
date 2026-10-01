// SPDX-License-Identifier: AGPL-3.0-only
//! LEO navigation message: fit, evaluate, update, encode and export the broadcast
//! ephemeris and clock of a low Earth orbit (LEO) positioning, navigation and timing (PNT)
//! satellite. The `leo-navmsg` kind.
//!
//! The kind is system-agnostic: any LEO orbit, any carrier, any of four ephemeris models.
//! Named presets ([`presets`]) are optional data.
//!
//! * [`elements`]: the message records (auxiliary, synchronisation, ephemeris, clock,
//!   other services) and the user algorithm, Galileo Open Service Signal-in-Space
//!   Interface Control Document (OS SIS ICD) Keplerian evaluation with along-track,
//!   cross-track and radial (RAC) corrections, the Liu et al. 2025 22-parameter model,
//!   and the ATOMIC zero-clock Earth-centred Earth-fixed (ECEF) polynomial.
//! * [`truth`]: the truth orbit (numerically integrated, zonal J2–J6 or EGM2008 gravity
//!   and drag) and a seeded satellite clock, free-running or steered.
//! * [`fit`]: the fitter, truth to message.
//! * [`sisre`]: signal-in-space range error (SISRE) with the global-average weights,
//!   validated against the published medium Earth orbit table.
//! * [`services`]: Klobuchar and NeQuick-G ionospheric sets and the UTC offset.
//! * [`codec`]: Kshana's own documented binary encoding with CRC-24Q and a quantisation
//!   budget.
//! * [`text`]: a RINEX-4-style record block (a documented Kshana extension; RINEX 4.02 has
//!   no LEO records) and a CSV table.
//!
//! Four analyses, chosen with `analysis`: `fit-interval-trade`, `model-comparison`,
//! `midpass-update`, `encode-decode` (default: all four).
//!
//! What the SISRE figures here are: the **representation error** of the message against
//! the truth trajectory and clock it was fitted to. Orbit determination and orbit
//! prediction error, which a real ground or on-board segment adds, are not modelled.

pub mod codec;
pub mod elements;
pub mod fit;
pub mod presets;
pub mod services;
pub mod sisre;
pub mod text;
pub mod truth;

use crate::portable_math::PortableFloat;
use elements::{
    sat_state, sub, KlobucharSet, LeoNavMessage, NequickSet, Services, SysTime, UtcOffset, C_LIGHT,
};
use fit::{fit_message, ModelKind};
use serde::{Deserialize, Serialize};
use serde_json::{json, Value};
use sisre::{sisre_weights, SisreWeights, StatsAcc};
use truth::{ClockConfig, OrbitConfig, TruthClock, TruthOrbit};

/// Default epoch: GPS week 2438, Monday 00:00 (2026-09-28).
const DEFAULT_WEEK: u32 = 2438;
const DEFAULT_TOW: f64 = 86_400.0;

/// Orbit section of a scenario.
#[derive(Clone, Debug, Default, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct OrbitSection {
    /// Altitude (km). Default 550, or the preset's.
    pub altitude_km: Option<f64>,
    /// Inclination (deg). Default 97.6, or the preset's.
    pub inclination_deg: Option<f64>,
    /// Eccentricity. Default 0.001.
    pub eccentricity: Option<f64>,
    /// Right ascension of the ascending node (deg). Default 0.
    pub raan_deg: Option<f64>,
    /// Argument of perigee (deg). Default 90.
    pub arg_perigee_deg: Option<f64>,
    /// Mean anomaly at the epoch (deg). Default 0.
    pub mean_anomaly_deg: Option<f64>,
    /// Gravity degree: 0, 2-6 zonal, 7-70 EGM2008. Default 20.
    pub gravity_degree: Option<usize>,
    /// Drag ballistic term C_D A/m (m²/kg). Default 0.005.
    pub cd_area_over_mass: Option<f64>,
    /// Epoch week. Default 2438.
    pub epoch_week: Option<u32>,
    /// Epoch time of week (s). Default 86400.
    pub epoch_tow: Option<f64>,
    /// Earth rotation angle at the epoch (deg). Default 0.
    pub theta0_deg: Option<f64>,
    /// Integration step (s). Default 5.
    pub step_s: Option<f64>,
}

/// Clock section.
#[derive(Clone, Debug, Default, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct ClockSection {
    /// Initial bias (s). Default 2e-5.
    pub bias_s: Option<f64>,
    /// Drift (s/s). Default 1e-11.
    pub drift: Option<f64>,
    /// Drift rate (s/s²). Default 0.
    pub drift_rate: Option<f64>,
    /// One-second Allan deviation of white frequency noise. Default 1e-12.
    pub adev_1s: Option<f64>,
    /// Steering residual (m, times c) for a zero-clock satellite. Default 0.24, or the
    /// preset's.
    pub steered_sigma_m: Option<f64>,
    /// Steering residual correlation time (s). Default 100.
    pub steered_tau_s: Option<f64>,
}

/// Message section.
#[derive(Clone, Debug, Default, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct MessageSection {
    /// Ephemeris model. Default `kepler-rac`, or the preset's.
    pub model: Option<String>,
    /// Correction degrees `[along, cross, radial]`. Default `[7, 5, 6]`, or the preset's.
    pub rac_degrees: Option<[usize; 3]>,
    /// ECEF polynomial degree. Default 6.
    pub poly_degree: Option<usize>,
    /// Fit interval (s). Default 300, or the preset's.
    pub fit_interval_s: Option<f64>,
    /// Update period (s). Default equal to the fit interval, or the preset's.
    pub update_period_s: Option<f64>,
    /// Carry no clock (steered satellite clock). Default false, or the preset's.
    pub zero_clock: Option<bool>,
    /// Fit sample spacing (s). Default 5.
    pub fit_sample_s: Option<f64>,
    /// Evaluation step (s). Default 5.
    pub eval_step_s: Option<f64>,
    /// SVID. Default 4.
    pub svid: Option<u8>,
    /// Band identifier. Default 0.
    pub band: Option<u8>,
    /// Carrier (Hz) the ionospheric service is scaled to. Default GPS L1, or the preset's.
    pub carrier_hz: Option<f64>,
    /// Signal health status. Default 0.
    pub health: Option<u8>,
    /// Carry the Klobuchar set. Default true.
    pub klobuchar: Option<bool>,
    /// Carry the NeQuick-G set. Default true.
    pub nequick: Option<bool>,
    /// Carry the UTC parameters. Default true.
    pub utc: Option<bool>,
    /// CSV column schema: `kshana` (default) or a preset schema name.
    pub csv_schema: Option<String>,
}

/// Fit-interval trade section.
#[derive(Clone, Debug, Default, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct TradeSection {
    /// Span of usage periods evaluated (s). Default 1800.
    pub span_s: Option<f64>,
    /// Fit intervals (s). Default 60, 120, 180, 300, 450, 600, 900.
    pub fit_intervals_s: Option<Vec<f64>>,
    /// Update periods (s) evaluated at `update_fit_interval_s`. Default 30, 60, 150, 300.
    pub update_periods_s: Option<Vec<f64>>,
    /// Fit interval of the update-period table (s). Default 300.
    pub update_fit_interval_s: Option<f64>,
    /// Models. Default kepler16 and kepler-rac.
    pub models: Option<Vec<String>>,
    /// Elevation mask of the SISRE weights (deg). Default 0.
    pub mask_deg: Option<f64>,
}

/// Model comparison section.
#[derive(Clone, Debug, Default, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct ComparisonSection {
    /// Models. Default kepler16, kepler-rac, liu22, ecef-poly.
    pub models: Option<Vec<String>>,
    /// Fit intervals (s). Default 60, 300, 600.
    pub fit_intervals_s: Option<Vec<f64>>,
    /// Span (s). Default 1200.
    pub span_s: Option<f64>,
    /// Run the Liu et al. 2025 altitude comparison. Default true.
    pub liu_table: Option<bool>,
    /// Arcs per altitude in the Liu comparison. Default 3.
    pub liu_arcs: Option<usize>,
}

/// Mid-pass update section.
#[derive(Clone, Debug, Default, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct MidpassSection {
    /// User latitude (deg). Default 45.
    pub user_lat_deg: Option<f64>,
    /// User longitude (deg). Default 10.
    pub user_lon_deg: Option<f64>,
    /// Pass elevation mask (deg). Default 10.
    pub mask_deg: Option<f64>,
    /// Search span for a pass (s). Default 86400.
    pub search_s: Option<f64>,
    /// Continuity threshold on the user range jump at a switch (m). Default 0.05.
    pub threshold_m: Option<f64>,
}

/// A `leo-navmsg` scenario.
#[derive(Clone, Debug, Default, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct LeoNavmsgScenario {
    /// Always `leo-navmsg`.
    pub kind: Option<String>,
    /// Optional human-readable name.
    pub name: Option<String>,
    /// Optional description.
    pub description: Option<String>,
    /// Seed of the clock noise. Default 1.
    pub seed: Option<u64>,
    /// Analyses to run (default all four).
    pub analysis: Option<Vec<String>>,
    /// Optional preset key.
    pub preset: Option<String>,
    /// Orbit.
    pub orbit: Option<OrbitSection>,
    /// Clock.
    pub clock: Option<ClockSection>,
    /// Message.
    pub message: Option<MessageSection>,
    /// Trade.
    pub trade: Option<TradeSection>,
    /// Comparison.
    pub comparison: Option<ComparisonSection>,
    /// Mid-pass update.
    pub midpass: Option<MidpassSection>,
}

/// Every analysis name.
pub const ANALYSES: [&str; 4] = [
    "fit-interval-trade",
    "model-comparison",
    "midpass-update",
    "encode-decode",
];

/// Resolved run settings.
#[derive(Clone, Debug)]
pub struct Resolved {
    /// Preset, if any.
    pub preset: Option<presets::Preset>,
    /// Orbit.
    pub orbit: OrbitConfig,
    /// Free-clock set-up.
    pub free_clock: ClockConfig,
    /// Steered-clock set-up (zero-clock messages).
    pub steered_clock: ClockConfig,
    /// Message model.
    pub model: ModelKind,
    /// Fit interval (s).
    pub fit_interval_s: f64,
    /// Update period (s).
    pub update_period_s: f64,
    /// Zero clock.
    pub zero_clock: bool,
    /// Fit sampling (s).
    pub fit_sample_s: f64,
    /// Evaluation step (s).
    pub eval_step_s: f64,
    /// Message template (auxiliary fields and services).
    pub template: LeoNavMessage,
    /// Carrier (Hz).
    pub carrier_hz: f64,
    /// Correction degrees.
    pub rac_degrees: [usize; 3],
    /// ECEF polynomial degree.
    pub poly_degree: usize,
    /// CSV schema name.
    pub csv_schema: String,
}

/// A representative Klobuchar broadcast set (RTKLIB's default, dated 2004-01-01).
pub const DEFAULT_KLOBUCHAR: KlobucharSet = KlobucharSet {
    alpha: [0.1118e-7, -0.7451e-8, -0.5961e-7, 0.1192e-6],
    beta: [0.1167e6, -0.2294e6, -0.1311e6, 0.1049e7],
};

/// A representative NeQuick-G set: the medium-solar-activity coefficients of the Galileo
/// single-frequency ionospheric algorithm's test cases.
pub const DEFAULT_NEQUICK: NequickSet = NequickSet {
    ai0: 121.129893,
    ai1: 0.351254133,
    ai2: 0.0134635348,
    storm_flags: [false; 5],
};

fn default_utc(week: u32) -> UtcOffset {
    UtcOffset {
        a0: 1.5e-9,
        a1: 2.0e-15,
        dt_ls: 18,
        t_ot: 3600.0 * 24.0,
        wn_ot: week,
        wn_lsf: week + 20,
        dn: 7,
        dt_lsf: 18,
    }
}

impl LeoNavmsgScenario {
    /// Resolve defaults, preset values and scenario overrides.
    pub fn resolve(&self) -> Result<Resolved, String> {
        let preset = match &self.preset {
            Some(k) => Some(presets::by_key(k).ok_or_else(|| {
                let keys: Vec<&str> = presets::all().iter().map(|p| p.key).collect();
                format!("unknown preset '{k}'; available: {}", keys.join(", "))
            })?),
            None => None,
        };
        let o = self.orbit.clone().unwrap_or_default();
        let c = self.clock.clone().unwrap_or_default();
        let m = self.message.clone().unwrap_or_default();
        let pm = preset.and_then(|p| p.message);
        let seed = self.seed.unwrap_or(1);
        let week = o.epoch_week.unwrap_or(DEFAULT_WEEK);
        let orbit = OrbitConfig {
            altitude_m: o
                .altitude_km
                .or(preset.map(|p| p.altitude_km))
                .unwrap_or(550.0)
                * 1e3,
            inclination_rad: o
                .inclination_deg
                .or(preset.map(|p| p.inclination_deg))
                .unwrap_or(97.6)
                .to_radians(),
            eccentricity: o.eccentricity.unwrap_or(0.001),
            raan_rad: o.raan_deg.unwrap_or(0.0).to_radians(),
            arg_perigee_rad: o.arg_perigee_deg.unwrap_or(90.0).to_radians(),
            mean_anomaly_rad: o.mean_anomaly_deg.unwrap_or(0.0).to_radians(),
            gravity_degree: o.gravity_degree.unwrap_or(20),
            cd_area_over_mass: o.cd_area_over_mass.unwrap_or(0.005),
            theta0_rad: o.theta0_deg.unwrap_or(0.0).to_radians(),
            epoch: SysTime::new(week, o.epoch_tow.unwrap_or(DEFAULT_TOW)),
            duration_s: 0.0,
            step_s: o.step_s.unwrap_or(5.0),
        };
        let free_clock = ClockConfig::Free {
            bias_s: c.bias_s.unwrap_or(2e-5),
            drift: c.drift.unwrap_or(1e-11),
            drift_rate: c.drift_rate.unwrap_or(0.0),
            adev_1s: c.adev_1s.unwrap_or(1e-12),
            seed,
        };
        let steered_sigma_m = c
            .steered_sigma_m
            .or(pm.map(|p| p.steered_sigma_m).filter(|v| *v > 0.0))
            .unwrap_or(0.24);
        let steered_clock = ClockConfig::Steered {
            sigma_s: steered_sigma_m / C_LIGHT,
            tau_s: c.steered_tau_s.unwrap_or(100.0),
            seed: seed.wrapping_add(1),
        };
        let model_name = m
            .model
            .clone()
            .or(pm.map(|p| p.model.to_string()))
            .unwrap_or_else(|| "kepler-rac".to_string());
        let rac_degrees = m
            .rac_degrees
            .or(pm
                .filter(|p| p.model == "kepler-rac")
                .map(|p| p.rac_degrees))
            .unwrap_or([7, 5, 6]);
        let poly_degree = m
            .poly_degree
            .or(pm.filter(|p| p.model == "ecef-poly").map(|p| p.poly_degree))
            .unwrap_or(6);
        let model = ModelKind::parse(&model_name, rac_degrees, poly_degree)?;
        let fit_interval_s = m
            .fit_interval_s
            .or(pm.map(|p| p.fit_interval_s))
            .unwrap_or(300.0);
        let update_period_s = m
            .update_period_s
            .or(pm.map(|p| p.update_period_s))
            .unwrap_or(fit_interval_s);
        let period_ok = update_period_s > 0.0 && update_period_s <= fit_interval_s;
        if !(10.0..=3600.0).contains(&fit_interval_s) || !period_ok {
            return Err(format!(
                "fit_interval_s must be 10-3600 s and update_period_s in (0, fit_interval_s]; \
                 got {fit_interval_s} and {update_period_s}"
            ));
        }
        let zero_clock = m
            .zero_clock
            .or(pm.map(|p| p.zero_clock))
            .unwrap_or(matches!(model, ModelKind::EcefPoly { .. }));
        let fit_sample_s = m.fit_sample_s.unwrap_or(5.0);
        let eval_step_s = m.eval_step_s.unwrap_or(5.0);
        if !(0.5..=60.0).contains(&fit_sample_s) || !(0.5..=60.0).contains(&eval_step_s) {
            return Err("fit_sample_s and eval_step_s must be 0.5-60 s".to_string());
        }
        let carrier_hz = m
            .carrier_hz
            .or(preset.map(|p| p.carrier_hz))
            .unwrap_or(services::L1_HZ);
        if carrier_hz.is_nan() || carrier_hz <= 1e7 {
            return Err(format!("carrier_hz must exceed 10 MHz; got {carrier_hz}"));
        }
        let svid = m.svid.unwrap_or(4);
        if svid == 0 {
            return Err("svid must be 1-255".to_string());
        }
        let band = m.band.unwrap_or(0);
        let health = m.health.unwrap_or(0);
        if band > 15 || health > 3 {
            return Err("band must be 0-15 and health 0-3".to_string());
        }
        let template = LeoNavMessage {
            svid,
            iod: 0,
            band,
            health,
            week,
            tow: 0.0,
            clock: None,
            ephemeris: elements::EphemerisModel::Kepler16 {
                kepler: elements::Keplerian {
                    sqrt_a: 0.0,
                    e: 0.0,
                    i0: 0.0,
                    omega0: 0.0,
                    omega: 0.0,
                    m0: 0.0,
                    delta_n: 0.0,
                    omega_dot: 0.0,
                    i_dot: 0.0,
                    cuc: 0.0,
                    cus: 0.0,
                    crc: 0.0,
                    crs: 0.0,
                    cic: 0.0,
                    cis: 0.0,
                    toe: 0.0,
                },
            },
            services: Services {
                klobuchar: m.klobuchar.unwrap_or(true).then_some(DEFAULT_KLOBUCHAR),
                nequick: m.nequick.unwrap_or(true).then_some(DEFAULT_NEQUICK),
                utc: m.utc.unwrap_or(true).then(|| default_utc(week)),
            },
        };
        let csv_schema = m.csv_schema.clone().unwrap_or_else(|| "kshana".to_string());
        if csv_schema != "kshana" && presets::csv_schema(&csv_schema).is_none() {
            return Err(format!("unknown csv_schema '{csv_schema}'"));
        }
        Ok(Resolved {
            preset,
            orbit,
            free_clock,
            steered_clock,
            model,
            fit_interval_s,
            update_period_s,
            zero_clock,
            fit_sample_s,
            eval_step_s,
            template,
            carrier_hz,
            rac_degrees,
            poly_degree,
            csv_schema,
        })
    }

    fn analyses(&self) -> Result<Vec<String>, String> {
        let list = self
            .analysis
            .clone()
            .unwrap_or_else(|| ANALYSES.iter().map(|s| s.to_string()).collect());
        if list.is_empty() {
            return Err("analysis must name at least one analysis".to_string());
        }
        for a in &list {
            if !ANALYSES.contains(&a.as_str()) {
                return Err(format!(
                    "unknown analysis '{a}'; use {}",
                    ANALYSES.join(", ")
                ));
            }
        }
        Ok(list)
    }

    /// Run and render: JSON (with a units block), text summary, SVG chart and the CSV
    /// table of the messages.
    pub fn run_all(&self) -> Result<(String, String, String, Option<String>), String> {
        let (doc, summary, svg, csv) = self.compute()?;
        let json = serde_json::to_string_pretty(&doc).map_err(|e| e.to_string())?;
        Ok((json, summary, svg, csv))
    }

    /// Compute the report document.
    pub fn compute(&self) -> Result<(Value, String, String, Option<String>), String> {
        if let Some(k) = &self.kind {
            if k != "leo-navmsg" {
                return Err(format!("kind must be leo-navmsg; got {k}"));
            }
        }
        let res = self.resolve()?;
        let analyses = self.analyses()?;
        let mask = self.trade.as_ref().and_then(|t| t.mask_deg).unwrap_or(0.0);
        if !(0.0..60.0).contains(&mask) {
            return Err(format!("mask_deg must be in [0, 60); got {mask}"));
        }
        let r = sisre::EARTH_RADIUS_M + res.orbit.altitude_m;
        let w = sisre_weights(r, mask);
        let period = std::f64::consts::TAU * (r * r * r / elements::MU).sqrt();
        let mut doc = json!({
            "kind": "leo-navmsg",
            "label": LABEL,
            "name": self.name.clone().unwrap_or_else(|| "LEO navigation message".to_string()),
            "analysis": analyses,
            "preset": res.preset.map(|p| serde_json::to_value(p).unwrap_or(Value::Null)),
            "orbit": {
                "altitude_m": res.orbit.altitude_m,
                "inclination_deg": res.orbit.inclination_rad.to_degrees(),
                "eccentricity": res.orbit.eccentricity,
                "period_s": period,
                "gravity_degree": res.orbit.gravity_degree,
                "cd_area_over_mass_m2_kg": res.orbit.cd_area_over_mass,
                "epoch_week": res.orbit.epoch.week,
                "epoch_tow_s": res.orbit.epoch.tow,
            },
            "sisre_weights": {
                "w_r": w.w_r,
                "w_ac2": w.w_ac2,
                "inverse_w_ac2": 1.0 / w.w_ac2,
                "max_nadir_deg": w.max_nadir_deg,
                "mask_deg": mask,
            },
            "message_config": {
                "model": res.model.code(),
                "rac_degrees": res.rac_degrees,
                "poly_degree": res.poly_degree,
                "fit_interval_s": res.fit_interval_s,
                "update_period_s": res.update_period_s,
                "zero_clock": res.zero_clock,
                "carrier_hz": res.carrier_hz,
            },
        });
        let mut summary = format!(
            "LEO navigation message — {:.0} km, {:.1} deg, gravity degree {}, model {}\n  \
             SISRE weights: w_R {:.3}, w_AC^2 1/{:.2} (mask {:.0} deg)\n",
            res.orbit.altitude_m / 1e3,
            res.orbit.inclination_rad.to_degrees(),
            res.orbit.gravity_degree,
            res.model.code(),
            w.w_r,
            1.0 / w.w_ac2,
            mask
        );
        let mut csv = None;
        let mut chart_rows: Vec<TradeRow> = Vec::new();
        let obj = doc.as_object_mut().expect("object");
        for a in &analyses {
            match a.as_str() {
                "fit-interval-trade" => {
                    let (v, s, rows) = self.trade(&res, &w)?;
                    obj.insert("fit_interval_trade".into(), v);
                    summary.push_str(&s);
                    chart_rows = rows;
                }
                "model-comparison" => {
                    let (v, s) = self.comparison(&res, &w)?;
                    obj.insert("model_comparison".into(), v);
                    summary.push_str(&s);
                }
                "midpass-update" => {
                    let (v, s) = self.midpass(&res, &w)?;
                    obj.insert("midpass_update".into(), v);
                    summary.push_str(&s);
                }
                "encode-decode" => {
                    let (v, s, c) = self.encode_decode(&res, &w)?;
                    obj.insert("encode_decode".into(), v);
                    summary.push_str(&s);
                    csv = c;
                }
                _ => unreachable!(),
            }
        }
        obj.insert("verification".into(), verification_block());
        obj.insert("limitations".into(), json!(LIMITATIONS));
        obj.insert("units".into(), units_block());
        let svg = to_svg(&res, &chart_rows, &doc);
        Ok((doc, summary, svg, csv))
    }
}

/// The run's verification label.
pub const LABEL: &str = "MIXED — VALIDATED building blocks, MODELLED results. The SISRE weights reproduce the published MEO/GEO table (Montenbruck et al. 2018), the Galileo ICD user algorithm reproduces RTKLIB on real Galileo broadcast ephemerides, and CRC-24Q reproduces its catalogue check value and the RTCM 1005 example frame. Every fit, SISRE, continuity and quantisation figure is MODELLED: the representation error of a message against a Kshana-integrated truth orbit and clock, with no orbit determination or prediction error. The binary frame and the RINEX-style block are Kshana's own documented formats, not any system's layout.";

/// Plain statements of what the kind does not do.
pub const LIMITATIONS: [&str; 6] = [
    "SISRE is the message's representation error against the truth it was fitted to; orbit determination and orbit prediction error are not modelled.",
    "The truth orbit is a Kshana numerical integration (zonal or EGM2008 gravity, static exponential drag), not a real satellite's precise orbit; no third body, solar radiation pressure or tides.",
    "The binary format is Kshana's own documented encoding modelled on the published message components; it is not the bit layout of Celeste or any other system (none is public).",
    "The RINEX-style block is a documented Kshana extension; RINEX 4.02 defines no LEO navigation records.",
    "NeQuick-G coefficients are carried and the effective ionisation level is computed, but the NeQuick electron-density integration that turns it into a delay is not implemented; the Klobuchar delay is, scaled to the carrier by 1/f^2 with no correction for a satellite flying inside the ionosphere.",
    "The Liu et al. 2025 22-parameter terms are evaluated as Kshana reads them from the paper's parameter list (the full text was not accessible); its SISRE-versus-altitude figures used real precise orbits, so the comparison is MODELLED, not VALIDATED.",
];

/// One row of the fit-interval trade.
#[derive(Clone, Debug, Serialize)]
pub struct TradeRow {
    /// Model code.
    pub model: String,
    /// Fit interval (s).
    pub fit_interval_s: f64,
    /// Update period (s).
    pub update_period_s: f64,
    /// Messages fitted.
    pub n_messages: usize,
    /// Statistics over the usage periods.
    #[serde(flatten)]
    pub stats: sisre::ErrorStats,
}

/// Fit and evaluate a message sequence over `[start, start + span]` with usage periods of
/// `period` centred in fit windows of `interval`.
#[allow(clippy::too_many_arguments)]
pub fn sequence_stats(
    truth: &TruthOrbit,
    clock: Option<&TruthClock>,
    kind: ModelKind,
    zero_clock: bool,
    template: &LeoNavMessage,
    w: &SisreWeights,
    start: &SysTime,
    span: f64,
    interval: f64,
    period: f64,
    sample_s: f64,
    eval_step_s: f64,
) -> Result<(sisre::ErrorStats, Vec<LeoNavMessage>), String> {
    let mut acc = StatsAcc::default();
    let n = (span / period).floor().max(1.0) as usize;
    let mut msgs = Vec::with_capacity(n);
    for k in 0..n {
        let use_from = start.plus(k as f64 * period);
        let fit_from = use_from.plus(-(interval - period) / 2.0);
        let msg = build_message(
            truth,
            if zero_clock { None } else { clock },
            kind,
            template,
            &fit_from,
            interval,
            sample_s,
            k as u16,
            &use_from,
        )?;
        sisre::accumulate(
            &mut acc,
            w,
            truth,
            clock,
            &msg,
            &use_from,
            period,
            eval_step_s,
        );
        msgs.push(msg);
    }
    Ok((acc.finish(), msgs))
}

/// Fit one message and fill its auxiliary fields from `template`.
#[allow(clippy::too_many_arguments)]
pub fn build_message(
    truth: &TruthOrbit,
    clock: Option<&TruthClock>,
    kind: ModelKind,
    template: &LeoNavMessage,
    fit_from: &SysTime,
    interval: f64,
    sample_s: f64,
    iod: u16,
    transmit: &SysTime,
) -> Result<LeoNavMessage, String> {
    let f = fit_message(truth, clock, kind, fit_from, interval, sample_s)?;
    let mut msg = template.clone();
    msg.iod = iod % 1024;
    msg.week = f.week;
    // Transmission time in the message week (may precede toe by up to half the interval).
    msg.tow = transmit
        .minus(&SysTime {
            week: f.week,
            tow: 0.0,
        })
        .round();
    if msg.tow < 0.0 {
        // A message transmitted in the previous week counts its week from toe; clamp to 0.
        msg.tow = 0.0;
    }
    msg.clock = f.clock;
    msg.ephemeris = f.ephemeris;
    Ok(msg)
}

fn model_list(names: &[String], res: &Resolved) -> Result<Vec<(ModelKind, bool)>, String> {
    names
        .iter()
        .map(|n| {
            let k = ModelKind::parse(n, res.rac_degrees, res.poly_degree)?;
            let zc = if n == res.model.code() {
                res.zero_clock
            } else {
                matches!(k, ModelKind::EcefPoly { .. })
            };
            Ok((k, zc))
        })
        .collect()
}

impl LeoNavmsgScenario {
    fn truth(
        &self,
        res: &Resolved,
        duration: f64,
    ) -> Result<(TruthOrbit, TruthClock, TruthClock), String> {
        let mut oc = res.orbit.clone();
        oc.duration_s = duration;
        let orbit = TruthOrbit::propagate(&oc)?;
        let free = TruthClock::new(res.free_clock, duration)?;
        let steered = TruthClock::new(res.steered_clock, duration)?;
        Ok((orbit, free, steered))
    }

    /// The broadcast signal-in-space range error of the scenario's own message
    /// configuration: its model, fit interval, update period and clock choice, over
    /// `span_s` of usage (the trade section's span, default 1800 s), with the SISRE
    /// weights of the orbit altitude at a 0° mask. This is the figure the `leo-pnt-chain`
    /// kind hands to the positioning stages as the LEO orbit-and-clock error. It is the
    /// message's representation error only (no orbit determination or prediction error).
    pub fn broadcast_sisre(&self) -> Result<(sisre::ErrorStats, Resolved), String> {
        let res = self.resolve()?;
        let span = self.trade.as_ref().and_then(|t| t.span_s).unwrap_or(1800.0);
        if !(60.0..=86_400.0).contains(&span) {
            return Err("trade.span_s must be 60-86400 s".to_string());
        }
        let r = sisre::EARTH_RADIUS_M + res.orbit.altitude_m;
        let w = sisre_weights(r, 0.0);
        let l = res.fit_interval_s;
        let (orbit, free, steered) = self.truth(&res, span + l + 60.0)?;
        let clock = if res.zero_clock { &steered } else { &free };
        let start = res.orbit.epoch.plus(l / 2.0 + 30.0);
        let (stats, _) = sequence_stats(
            &orbit,
            Some(clock),
            res.model,
            res.zero_clock,
            &res.template,
            &w,
            &start,
            span,
            l,
            res.update_period_s,
            res.fit_sample_s,
            res.eval_step_s,
        )?;
        Ok((stats, res))
    }

    fn trade(
        &self,
        res: &Resolved,
        w: &SisreWeights,
    ) -> Result<(Value, String, Vec<TradeRow>), String> {
        let t = self.trade.clone().unwrap_or_default();
        let span = t.span_s.unwrap_or(1800.0);
        let intervals = t
            .fit_intervals_s
            .unwrap_or_else(|| vec![60.0, 120.0, 180.0, 300.0, 450.0, 600.0, 900.0]);
        let periods = t
            .update_periods_s
            .unwrap_or_else(|| vec![30.0, 60.0, 150.0, 300.0]);
        let upd_interval = t.update_fit_interval_s.unwrap_or(300.0);
        let names = t
            .models
            .unwrap_or_else(|| vec!["kepler16".to_string(), "kepler-rac".to_string()]);
        if intervals.is_empty() || intervals.iter().any(|&l| !(10.0..=3600.0).contains(&l)) {
            return Err("trade.fit_intervals_s must be non-empty, each 10-3600 s".to_string());
        }
        if periods.iter().any(|&p| !(p > 0.0 && p <= upd_interval)) {
            return Err(
                "each trade.update_periods_s must be in (0, update_fit_interval_s]".to_string(),
            );
        }
        if !(60.0..=86_400.0).contains(&span) {
            return Err("trade.span_s must be 60-86400 s".to_string());
        }
        let models = model_list(&names, res)?;
        let lmax = intervals.iter().copied().fold(upd_interval, f64::max);
        let duration = span + lmax + 60.0;
        let (orbit, free, steered) = self.truth(res, duration)?;
        let start = res.orbit.epoch.plus(lmax / 2.0 + 30.0);
        let mut rows = Vec::new();
        for (kind, zc) in &models {
            let clock = if *zc { &steered } else { &free };
            for &l in &intervals {
                let (stats, msgs) = sequence_stats(
                    &orbit,
                    Some(clock),
                    *kind,
                    *zc,
                    &res.template,
                    w,
                    &start,
                    span,
                    l,
                    l,
                    res.fit_sample_s,
                    res.eval_step_s,
                )?;
                rows.push(TradeRow {
                    model: kind.code().to_string(),
                    fit_interval_s: l,
                    update_period_s: l,
                    n_messages: msgs.len(),
                    stats,
                });
            }
        }
        let mut upd_rows = Vec::new();
        for (kind, zc) in &models {
            let clock = if *zc { &steered } else { &free };
            for &p in &periods {
                let (stats, msgs) = sequence_stats(
                    &orbit,
                    Some(clock),
                    *kind,
                    *zc,
                    &res.template,
                    w,
                    &start,
                    span,
                    upd_interval,
                    p,
                    res.fit_sample_s,
                    res.eval_step_s,
                )?;
                upd_rows.push(TradeRow {
                    model: kind.code().to_string(),
                    fit_interval_s: upd_interval,
                    update_period_s: p,
                    n_messages: msgs.len(),
                    stats,
                });
            }
        }
        let mut s =
            format!("  fit-interval trade over {span:.0} s (usage period = fit interval):\n");
        for r in &rows {
            s.push_str(&format!(
                "    {:<10} {:>5.0} s  SISRE orbit RMS {:>8.4} m  max {:>8.4} m  with clock RMS {:>8.4} m\n",
                r.model, r.fit_interval_s, r.stats.sisre_orb_rms_m, r.stats.sisre_orb_max_m, r.stats.sisre_rms_m
            ));
        }
        let why = explain_trade(&rows);
        s.push_str(&format!("    {why}\n"));
        let v = json!({
            "span_s": span,
            "usage": "each message is used over a period centred in its fit window; in the first table the period equals the fit interval",
            "rows": rows,
            "update_period_rows": upd_rows,
            "explanation": why,
        });
        Ok((v, s, rows))
    }

    fn comparison(&self, res: &Resolved, w: &SisreWeights) -> Result<(Value, String), String> {
        let c = self.comparison.clone().unwrap_or_default();
        let names = c.models.unwrap_or_else(|| {
            ["kepler16", "kepler-rac", "liu22", "ecef-poly"]
                .iter()
                .map(|s| s.to_string())
                .collect()
        });
        let intervals = c
            .fit_intervals_s
            .unwrap_or_else(|| vec![60.0, 300.0, 600.0]);
        let span = c.span_s.unwrap_or(1200.0);
        if intervals.is_empty() || intervals.iter().any(|&l| !(10.0..=3600.0).contains(&l)) {
            return Err("comparison.fit_intervals_s must be non-empty, each 10-3600 s".to_string());
        }
        if !(60.0..=86_400.0).contains(&span) {
            return Err("comparison.span_s must be 60-86400 s".to_string());
        }
        let models = model_list(&names, res)?;
        let lmax = intervals.iter().copied().fold(0.0, f64::max);
        let (orbit, free, steered) = self.truth(res, span + lmax + 60.0)?;
        let start = res.orbit.epoch.plus(lmax / 2.0 + 30.0);
        let mut rows = Vec::new();
        let mut s = String::from("  model comparison (usage period = fit interval):\n");
        for (kind, zc) in &models {
            let clock = if *zc { &steered } else { &free };
            for &l in &intervals {
                let (stats, msgs) = sequence_stats(
                    &orbit,
                    Some(clock),
                    *kind,
                    *zc,
                    &res.template,
                    w,
                    &start,
                    span,
                    l,
                    l,
                    res.fit_sample_s,
                    res.eval_step_s,
                )?;
                let m0 = &msgs[0];
                let bits = codec::ephemeris_clock_bits(m0).ok();
                let fits = codec::encode(m0).is_ok();
                s.push_str(&format!(
                    "    {:<10} {:>5.0} s  {:>2} params  SISRE orbit RMS {:>8.4} m  with clock {:>8.4} m\n",
                    kind.code(),
                    l,
                    m0.ephemeris.n_parameters(),
                    stats.sisre_orb_rms_m,
                    stats.sisre_rms_m
                ));
                rows.push(json!({
                    "model": kind.code(),
                    "zero_clock": zc,
                    "fit_interval_s": l,
                    "n_parameters": m0.ephemeris.n_parameters(),
                    "ephemeris_clock_bits": bits,
                    "fits_kshana_encoding": fits,
                    "n_messages": msgs.len(),
                    "stats": stats,
                }));
            }
        }
        let liu = if c.liu_table.unwrap_or(true) {
            let (v, ls) = liu_comparison(res, c.liu_arcs.unwrap_or(3))?;
            s.push_str(&ls);
            v
        } else {
            Value::Null
        };
        Ok((
            json!({
                "span_s": span,
                "rows": rows,
                "zero_clock_note": "a zero-clock message is scored against a clock steered to system time with the stated residual; the others against the free-running clock they fit",
                "liu2025_altitude_table": liu,
            }),
            s,
        ))
    }

    fn midpass(&self, res: &Resolved, w: &SisreWeights) -> Result<(Value, String), String> {
        let mp = self.midpass.clone().unwrap_or_default();
        let lat = mp.user_lat_deg.unwrap_or(45.0);
        let lon = mp.user_lon_deg.unwrap_or(10.0);
        let mask = mp.mask_deg.unwrap_or(10.0);
        let search = mp.search_s.unwrap_or(86_400.0);
        let threshold = mp.threshold_m.unwrap_or(0.05);
        if !(-90.0..=90.0).contains(&lat)
            || !(0.0..60.0).contains(&mask)
            || !(600.0..=172_800.0).contains(&search)
        {
            return Err(
                "midpass: user_lat_deg in [-90, 90], mask_deg in [0, 60), search_s 600-172800"
                    .to_string(),
            );
        }
        let l = res.fit_interval_s;
        let p = res.update_period_s;
        let (orbit, free, steered) = self.truth(res, search + l + 60.0)?;
        let clock = if res.zero_clock { &steered } else { &free };
        let user = geodetic_to_ecef(lat.to_radians(), lon.to_radians(), 0.0);
        let origin = res.orbit.epoch.plus(l / 2.0 + 30.0);
        // Find the highest pass in the search span.
        let step = 5.0;
        let n = (search / step) as usize;
        let mut passes: Vec<(f64, f64, f64)> = Vec::new(); // start, end, max elevation
        let mut cur: Option<(f64, f64, f64)> = None;
        for k in 0..=n {
            let t = origin.plus(k as f64 * step);
            let (pos, _, _) = orbit.state_ecef(orbit.dt_of(&t));
            let el = elevation(user, pos);
            let tt = k as f64 * step;
            if el >= mask {
                cur = Some(match cur {
                    Some((s0, _, mx)) => (s0, tt, mx.max(el)),
                    None => (tt, tt, el),
                });
            } else if let Some(c) = cur.take() {
                passes.push(c);
            }
        }
        if let Some(c) = cur.take() {
            passes.push(c);
        }
        let Some(&(p0, p1, pmax)) = passes
            .iter()
            .filter(|(a, b, _)| b - a >= p.min(60.0))
            .max_by(|a, b| a.2.total_cmp(&b.2))
        else {
            return Err(format!(
                "no pass above {mask} deg for the user at {lat}, {lon} within {search} s; \
                 widen midpass.search_s or move the user"
            ));
        };
        // Messages on the global schedule (k·P from the origin) covering the pass.
        let k0 = (p0 / p).floor() as i64;
        let k1 = (p1 / p).ceil() as i64;
        let mut msgs = Vec::new();
        for k in k0..=k1 {
            let use_from = origin.plus(k as f64 * p);
            let fit_from = use_from.plus(-(l - p) / 2.0);
            if orbit.dt_of(&fit_from) < 0.0 {
                continue;
            }
            let m = build_message(
                &orbit,
                if res.zero_clock { None } else { Some(clock) },
                res.model,
                &res.template,
                &fit_from,
                l,
                res.fit_sample_s,
                k as u16,
                &use_from,
            )?;
            msgs.push((k, m));
        }
        let range = |m: &LeoNavMessage, t: &SysTime| -> f64 {
            let s = sat_state(m, t);
            elements::norm(sub(s.pos, user)) - C_LIGHT * s.clock_s
        };
        let true_range = |t: &SysTime| -> f64 {
            let dt = orbit.dt_of(t);
            let (pos, _, _) = orbit.state_ecef(dt);
            elements::norm(sub(pos, user)) - C_LIGHT * clock.apparent_s(&orbit, dt)
        };
        let mut switches = Vec::new();
        let mut max_jump: f64 = 0.0;
        let mut max_worst: f64 = 0.0;
        for win in msgs.windows(2) {
            let (k, ref new) = win[1];
            let old = &win[0].1;
            let ts = k as f64 * p;
            if ts < p0 || ts > p1 {
                continue;
            }
            let t = origin.plus(ts);
            let a = sat_state(old, &t);
            let b = sat_state(new, &t);
            let dpos = sub(b.pos, a.pos);
            let dclk = (b.clock_s - a.clock_s) * C_LIGHT;
            let jump = range(new, &t) - range(old, &t);
            let (pos, _, _) = orbit.state_ecef(orbit.dt_of(&t));
            let worst = worst_case_jump(dpos, dclk, pos, w.max_nadir_deg.to_radians());
            max_jump = max_jump.max(jump.abs());
            max_worst = max_worst.max(worst);
            switches.push(json!({
                "t_s": ts,
                "elevation_deg": elevation(user, pos),
                "iod_old": old.iod,
                "iod_new": new.iod,
                "pos_jump_m": elements::norm(dpos),
                "clock_jump_m": dclk,
                "range_jump_m": jump,
                "worst_case_range_jump_m": worst,
                "range_error_before_m": range(old, &t) - true_range(&t),
                "range_error_after_m": range(new, &t) - true_range(&t),
            }));
        }
        // Range error along the pass with the message current at each instant.
        let mut series = Vec::new();
        let mut tt = p0;
        while tt <= p1 + 1e-9 {
            let k = (tt / p).floor() as i64;
            if let Some((_, m)) = msgs.iter().find(|(kk, _)| *kk == k) {
                let t = origin.plus(tt);
                series.push(json!({"t_s": tt, "iod": m.iod, "range_error_m": range(m, &t) - true_range(&t)}));
            }
            tt += res.eval_step_s;
        }
        let pass_ok = max_jump <= threshold;
        let s = format!(
            "  mid-pass update: pass {:.0}-{:.0} s (max elevation {:.1} deg), {} switches, \
             largest user range jump {:.4} m (worst-case geometry {:.4} m) vs threshold {:.3} m: {}\n",
            p0,
            p1,
            pmax,
            switches.len(),
            max_jump,
            max_worst,
            threshold,
            if pass_ok { "PASS" } else { "FAIL" }
        );
        Ok((
            json!({
                "user": {"lat_deg": lat, "lon_deg": lon, "mask_deg": mask},
                "pass": {"start_s": p0, "end_s": p1, "max_elevation_deg": pmax},
                "fit_interval_s": l,
                "update_period_s": p,
                "switches": switches,
                "range_error_series": series,
                "max_range_jump_m": max_jump,
                "max_worst_case_range_jump_m": max_worst,
                "threshold_m": threshold,
                "continuity_pass": pass_ok,
            }),
            s,
        ))
    }

    fn encode_decode(
        &self,
        res: &Resolved,
        w: &SisreWeights,
    ) -> Result<(Value, String, Option<String>), String> {
        let l = res.fit_interval_s;
        let p = res.update_period_s;
        let n_msgs = 3usize;
        let duration = l + p * n_msgs as f64 + 120.0;
        let (orbit, free, steered) = self.truth(res, duration)?;
        let clock = if res.zero_clock { &steered } else { &free };
        let start = res.orbit.epoch.plus(l / 2.0 + 30.0);
        let (stats, msgs) = sequence_stats(
            &orbit,
            Some(clock),
            res.model,
            res.zero_clock,
            &res.template,
            w,
            &start,
            p * n_msgs as f64,
            l,
            p,
            res.fit_sample_s,
            res.eval_step_s,
        )?;
        let m = &msgs[0];
        let frame = codec::encode(m)?;
        let back = codec::decode(&frame)?;
        let use_from = start;
        let (budget, qpos, qclk) = codec::quantisation_budget(m, &use_from, p, res.eval_step_s)?;
        // Quantised-message SISRE against the truth, beside the exact message's.
        let mut acc_exact = StatsAcc::default();
        let mut acc_q = StatsAcc::default();
        sisre::accumulate(
            &mut acc_exact,
            w,
            &orbit,
            Some(clock),
            m,
            &use_from,
            p,
            res.eval_step_s,
        );
        sisre::accumulate(
            &mut acc_q,
            w,
            &orbit,
            Some(clock),
            &back,
            &use_from,
            p,
            res.eval_step_s,
        );
        let mut corrupted = frame.clone();
        let mid = corrupted.len() / 2;
        corrupted[mid] ^= 0x10;
        let corrupted_rejected = codec::decode(&corrupted).is_err();
        // Text exports.
        let rinex = text::rinex_export(&msgs);
        let rin_back = text::rinex_import(&rinex)?;
        let max_diff = |a: &[LeoNavMessage], b: &[LeoNavMessage]| -> (f64, f64) {
            let (mut dp, mut dc) = (0.0f64, 0.0f64);
            for (x, y) in a.iter().zip(b) {
                for k in 0..=10 {
                    let t = use_from.plus(p * k as f64 / 10.0);
                    let (sx, sy) = (sat_state(x, &t), sat_state(y, &t));
                    dp = dp.max(elements::norm(sub(sx.pos, sy.pos)));
                    dc = dc.max(((sx.clock_s - sy.clock_s) * C_LIGHT).abs());
                }
            }
            (dp, dc)
        };
        let (rin_dp, rin_dc) = max_diff(&msgs, &rin_back);
        let (csv_text, csv_dp) = match &m.ephemeris {
            elements::EphemerisModel::Kepler16 { .. }
            | elements::EphemerisModel::KeplerRac { .. } => {
                let schema = if res.csv_schema == "kshana" {
                    text::default_schema(match &m.ephemeris {
                        elements::EphemerisModel::KeplerRac { rac, .. } => [
                            rac.along.len() - 1,
                            rac.cross.len() - 1,
                            rac.radial.len() - 1,
                        ],
                        _ => [0, 0, 0],
                    })
                } else {
                    presets::csv_schema(&res.csv_schema).expect("checked in resolve")
                };
                let schema = if matches!(m.ephemeris, elements::EphemerisModel::Kepler16 { .. })
                    && res.csv_schema == "kshana"
                {
                    // No correction columns for a pure Keplerian message.
                    text::CsvSchema {
                        name: schema.name,
                        columns: schema
                            .columns
                            .into_iter()
                            .filter(|(k, _)| {
                                !(k.len() == 2 && ["a0", "c0", "r0"].contains(&k.as_str()))
                            })
                            .collect(),
                    }
                } else {
                    schema
                };
                let t = text::csv_export(&msgs, &schema)?;
                let b = text::csv_import(&t, &schema)?;
                let (dp, _) = max_diff(&msgs, &b);
                (Some(t), Some(dp))
            }
            _ => (None, None),
        };
        let hex: String = frame.iter().map(|b| format!("{b:02X}")).collect();
        let payload_bits = codec::payload_bits(m)?;
        let eph_bits = codec::ephemeris_clock_bits(m)?;
        let rt_pos = (0..=10)
            .map(|k| {
                let t = use_from.plus(p * k as f64 / 10.0);
                elements::norm(sub(sat_state(m, &t).pos, sat_state(&back, &t).pos))
            })
            .fold(0.0, f64::max);
        let s = format!(
            "  encode-decode: {} model, frame {} bytes ({} payload bits, {} ephemeris+clock bits), CRC-24Q 0x{}\n    \
             quantisation: largest position change {:.2} mm, clock {:.2} mm; SISRE exact {:.4} m, quantised {:.4} m\n    \
             corrupted frame rejected: {}; RINEX round trip {:.2e} m; CSV round trip {}\n",
            m.ephemeris.code(),
            frame.len(),
            payload_bits,
            eph_bits,
            &hex[hex.len() - 6..],
            qpos * 1e3,
            qclk * 1e3,
            acc_exact.finish().sisre_rms_m,
            acc_q.finish().sisre_rms_m,
            corrupted_rejected,
            rin_dp,
            csv_dp.map(|d| format!("{d:.2e} m")).unwrap_or_else(|| "n/a (model not tabulated)".into()),
        );
        let v = json!({
            "model": m.ephemeris.code(),
            "frame_bytes": frame.len(),
            "frame_hex": hex,
            "payload_bits": payload_bits,
            "ephemeris_clock_bits": eph_bits,
            "crc24q": format!("0x{}", &hex[hex.len() - 6..]),
            "crc24q_check_value_123456789": format!("0x{:06X}", codec::crc24q(b"123456789")),
            "field_table": codec::field_table(),
            "round_trip_max_pos_m": rt_pos,
            "quantisation_budget": budget,
            "quantised_max_pos_m": qpos,
            "quantised_max_clock_m": qclk,
            "sisre_exact_rms_m": acc_exact.finish().sisre_rms_m,
            "sisre_quantised_rms_m": acc_q.finish().sisre_rms_m,
            "sequence_stats": stats,
            "corrupted_frame_rejected": corrupted_rejected,
            "messages": msgs,
            "rinex_text": rinex,
            "rinex_round_trip_max_pos_m": rin_dp,
            "rinex_round_trip_max_clock_m": rin_dc,
            "csv_schema": res.csv_schema,
            "csv_round_trip_max_pos_m": csv_dp,
        });
        Ok((v, s, csv_text))
    }
}

/// The published SISRE of Liu et al. 2025 (22-parameter model, 20-minute fit arc):
/// satellite, altitude (km), inclination (deg, of that satellite), SISRE (m).
pub const LIU2025_TABLE: [(&str, f64, f64, f64); 5] = [
    ("GRACE-A", 320.0, 89.0, 0.0888),
    ("GRACE-C", 475.0, 89.0, 0.0621),
    ("Sentinel-2A", 786.0, 98.57, 0.0287),
    ("HY-2A", 966.0, 99.34, 0.0211),
    ("Sentinel-6A", 1336.0, 66.04, 0.0075),
];

/// Kshana's 22-parameter fit at the Liu et al. 2025 altitudes over `arcs` consecutive
/// 20-minute arcs each, beside the published figures.
pub fn liu_comparison(res: &Resolved, arcs: usize) -> Result<(Value, String), String> {
    if arcs == 0 || arcs > 20 {
        return Err("comparison.liu_arcs must be 1-20".to_string());
    }
    let arc = 1200.0;
    let mut rows = Vec::new();
    let mut s =
        String::from("  Liu et al. 2025 22-parameter model, 20-min arcs (MODELLED comparison):\n");
    for (name, alt, inc, published) in LIU2025_TABLE {
        let mut oc = res.orbit.clone();
        oc.altitude_m = alt * 1e3;
        oc.inclination_rad = inc.to_radians();
        oc.duration_s = arc * arcs as f64 + 60.0;
        let orbit = TruthOrbit::propagate(&oc)?;
        let w = sisre_weights(sisre::EARTH_RADIUS_M + alt * 1e3, 0.0);
        let mut acc = StatsAcc::default();
        for k in 0..arcs {
            let from = oc.epoch.plus(30.0 + k as f64 * arc);
            let msg = build_message(
                &orbit,
                None,
                ModelKind::Liu22,
                &res.template,
                &from,
                arc,
                res.fit_sample_s,
                k as u16,
                &from,
            )?;
            sisre::accumulate(
                &mut acc,
                &w,
                &orbit,
                None,
                &msg,
                &from,
                arc,
                res.eval_step_s,
            );
        }
        let st = acc.finish();
        s.push_str(&format!(
            "    {name:<12} {alt:>5.0} km  Kshana {:.4} m  published {published:.4} m  ratio {:.2}\n",
            st.sisre_orb_rms_m,
            st.sisre_orb_rms_m / published
        ));
        rows.push(json!({
            "satellite": name,
            "altitude_km": alt,
            "inclination_deg": inc,
            "published_sisre_m": published,
            "kshana_sisre_orb_rms_m": st.sisre_orb_rms_m,
            "ratio": st.sisre_orb_rms_m / published,
            "w_r": w.w_r,
            "w_ac2": w.w_ac2,
        }));
    }
    Ok((
        json!({
            "source": "Liu, Su, Xie, Zhou and Qu (2025), Remote Sensing 17(16):2894, doi 10.3390/rs17162894",
            "label": "MODELLED",
            "why_not_validated": "the paper fits real precise science orbits of the named satellites; Kshana fits its own integrated orbit at the same altitude and inclination, with its own reading of the six added parameters, so the setups differ",
            "arc_s": arc,
            "arcs_per_altitude": arcs,
            "rows": rows,
        }),
        s,
    ))
}

fn explain_trade(rows: &[TradeRow]) -> String {
    let get = |m: &str, l: f64| {
        rows.iter()
            .find(|r| r.model == m && (r.fit_interval_s - l).abs() < 1e-9)
            .map(|r| r.stats.sisre_orb_rms_m)
    };
    let ls: Vec<f64> = rows.iter().map(|r| r.fit_interval_s).collect();
    let (lo, hi) = (
        ls.iter().copied().fold(f64::INFINITY, f64::min),
        ls.iter().copied().fold(0.0, f64::max),
    );
    match (get("kepler16", lo), get("kepler16", hi), get("kepler-rac", hi)) {
        (Some(a), Some(b), Some(c)) => format!(
            "The 16-parameter Keplerian set degrades from {a:.4} m at {lo:.0} s to {b:.4} m at {hi:.0} s: \
             one Keplerian set with twice-per-revolution harmonics cannot follow the higher-frequency \
             gravity terms and the drag of a LEO arc for more than a few minutes, and its least-squares \
             residual oscillates across the window. The along/cross/radial polynomials, of higher degree \
             than the Keplerian set spans, absorb what is left, giving {c:.4} m at {hi:.0} s."
        ),
        (Some(a), Some(b), None) => format!(
            "The 16-parameter Keplerian set goes from {a:.4} m at {lo:.0} s to {b:.4} m at {hi:.0} s."
        ),
        _ => "Include kepler16 and kepler-rac in trade.models to see the effect of the correction polynomials.".to_string(),
    }
}

/// WGS 84 geodetic to ECEF (m).
pub fn geodetic_to_ecef(lat: f64, lon: f64, h: f64) -> [f64; 3] {
    let a = 6_378_137.0;
    let f = 1.0 / 298.257_223_563;
    let e2 = f * (2.0 - f);
    let n = a / (1.0 - e2 * lat.psin().ppowi(2)).sqrt();
    [
        (n + h) * lat.pcos() * lon.pcos(),
        (n + h) * lat.pcos() * lon.psin(),
        (n * (1.0 - e2) + h) * lat.psin(),
    ]
}

/// Elevation (deg) of `sat` seen from `user` (spherical up direction from the geodetic
/// normal approximated by the geocentric radial, adequate for pass finding).
pub fn elevation(user: [f64; 3], sat: [f64; 3]) -> f64 {
    let d = sub(sat, user);
    let up = elements::unit(user);
    (elements::dot(d, up) / elements::norm(d))
        .pasin()
        .to_degrees()
}

/// Largest `|e·Δr − cΔt|` over lines of sight `e` within `max_nadir` of the satellite's
/// radial direction (as seen from the ground, e points from user to satellite).
pub fn worst_case_jump(dpos: [f64; 3], dclk_m: f64, sat_pos: [f64; 3], max_nadir: f64) -> f64 {
    let n = elements::norm(dpos);
    if n == 0.0 {
        return dclk_m.abs();
    }
    let rhat = elements::unit(sat_pos);
    let theta = (elements::dot(dpos, rhat) / n).clamp(-1.0, 1.0).pacos();
    let hi = n * (theta - max_nadir).max(0.0).pcos();
    let lo = n * (theta + max_nadir).min(std::f64::consts::PI).pcos();
    (hi - dclk_m).abs().max((lo - dclk_m).abs())
}

fn verification_block() -> Value {
    json!({
        "validated": [
            "SISRE weights reproduce the published MEO/GEO table of Montenbruck et al. 2018 (Adv. Space Res. 61(12)), leo_navmsg::sisre::tests",
            "Galileo ICD user algorithm reproduces RTKLIB eph2pos ECEF positions for four real Galileo broadcast ephemerides to below 1 mm, tests/leo_navmsg_reference.rs",
            "CRC-24Q reproduces the catalogue check value 0xCDE703 and the RTCM 10403 message-type 1005 example frame, leo_navmsg::codec::tests",
        ],
        "modelled": [
            "fitter, RAC corrections, SISRE-versus-fit-interval trade and mid-pass continuity: representation error against a Kshana-integrated truth",
            "binary encoding and quantisation budget: Kshana's own format, checked by round trip and budget, not against any external layout",
            "RINEX-style and CSV exports: documented Kshana extension, checked by round trip",
            "Liu et al. 2025 22-parameter SISRE versus altitude: comparison shown, setups differ",
            "ionospheric and UTC services: ICD formulas, Klobuchar delay inherited from the RTKLIB-checked gnss_sim model",
        ],
    })
}

/// The units block.
fn units_block() -> Value {
    let rows: Vec<(&str, &str, &str, &str)> =
        UNITS.iter().flat_map(|part| part.iter().copied()).collect();
    crate::solar_system::units_block_from(&rows)
}

/// The ten SISRE statistics fields every fit summary carries (`fit_interval_trade.rows[]`,
/// `fit_interval_trade.update_period_rows[]`, `model_comparison.rows[].stats` and
/// `encode_decode.sequence_stats`), under the summary's path prefix. Only the definition
/// of the orbit-only RMS differs between the four, so it is the second argument.
macro_rules! sisre_stats_units {
    ($prefix:literal, $orb_rms_definition:literal) => {
        [
            (
                concat!($prefix, ".n"),
                "count",
                "computed",
                "epochs evaluated",
            ),
            (
                concat!($prefix, ".sisre_orb_rms_m"),
                "m",
                "computed",
                $orb_rms_definition,
            ),
            (
                concat!($prefix, ".sisre_orb_max_m"),
                "m",
                "computed",
                "largest orbit-only SISRE",
            ),
            (
                concat!($prefix, ".sisre_rms_m"),
                "m",
                "computed",
                "RMS SISRE with the clock",
            ),
            (
                concat!($prefix, ".sisre_max_m"),
                "m",
                "computed",
                "largest SISRE with the clock",
            ),
            (
                concat!($prefix, ".radial_rms_m"),
                "m",
                "computed",
                "RMS radial error",
            ),
            (
                concat!($prefix, ".along_rms_m"),
                "m",
                "computed",
                "RMS along-track error",
            ),
            (
                concat!($prefix, ".cross_rms_m"),
                "m",
                "computed",
                "RMS cross-track error",
            ),
            (
                concat!($prefix, ".clock_rms_m"),
                "m",
                "computed",
                "RMS clock error times c",
            ),
            (
                concat!($prefix, ".pos3d_max_m"),
                "m",
                "computed",
                "largest 3D position error",
            ),
        ]
    };
}

/// The units table, in the order the units block emits it: literal rows interleaved with
/// the shared SISRE statistics groups.
const UNITS: &[&[(&str, &str, &str, &str)]] = &[
    &[
        (
            "orbit.altitude_m",
            "m",
            "input",
            "altitude of the initial semi-major axis above the WGS 84 equatorial radius",
        ),
        ("orbit.inclination_deg", "deg", "input", "orbit inclination"),
        ("orbit.eccentricity", "1", "input", "initial eccentricity"),
        (
            "orbit.period_s",
            "s",
            "closed-form",
            "two-body period of the initial semi-major axis",
        ),
        (
            "orbit.gravity_degree",
            "count",
            "input",
            "gravity field degree of the truth integration",
        ),
        (
            "orbit.cd_area_over_mass_m2_kg",
            "m^2/kg",
            "input",
            "drag ballistic term C_D A/m",
        ),
        (
            "orbit.epoch_week",
            "week",
            "input",
            "epoch week number (GPS origin)",
        ),
        ("orbit.epoch_tow_s", "s", "input", "epoch time of week"),
        (
            "sisre_weights.w_r",
            "1",
            "computed",
            "global-average radial SISRE weight",
        ),
        (
            "sisre_weights.w_ac2",
            "1",
            "computed",
            "global-average squared along/cross-track SISRE weight",
        ),
        (
            "sisre_weights.inverse_w_ac2",
            "1",
            "computed",
            "reciprocal of w_ac2, the form the published table uses",
        ),
        (
            "sisre_weights.max_nadir_deg",
            "deg",
            "closed-form",
            "nadir angle of a user at the elevation mask",
        ),
        (
            "sisre_weights.mask_deg",
            "deg",
            "input",
            "user elevation mask of the SISRE average",
        ),
        (
            "message_config.rac_degrees[]",
            "count",
            "input",
            "correction polynomial degrees along, cross, radial",
        ),
        (
            "message_config.poly_degree",
            "count",
            "input",
            "ECEF polynomial degree",
        ),
        (
            "message_config.fit_interval_s",
            "s",
            "input",
            "fit interval of each message",
        ),
        (
            "message_config.update_period_s",
            "s",
            "input",
            "message update period",
        ),
        (
            "message_config.carrier_hz",
            "Hz",
            "input",
            "carrier the ionospheric service is scaled to",
        ),
        (
            "preset.altitude_km",
            "km",
            "spec",
            "preset orbit altitude from its cited source",
        ),
        (
            "preset.inclination_deg",
            "deg",
            "spec",
            "preset orbit inclination from its cited source",
        ),
        (
            "preset.carrier_hz",
            "Hz",
            "spec",
            "preset carrier from its cited source",
        ),
        (
            "preset.message.rac_degrees[]",
            "count",
            "spec",
            "preset correction polynomial degrees",
        ),
        (
            "preset.message.poly_degree",
            "count",
            "spec",
            "preset ECEF polynomial degree",
        ),
        (
            "preset.message.fit_interval_s",
            "s",
            "spec",
            "preset fit interval",
        ),
        (
            "preset.message.update_period_s",
            "s",
            "spec",
            "preset update period",
        ),
        (
            "preset.message.steered_sigma_m",
            "m",
            "spec",
            "preset steering residual of a zero-clock satellite",
        ),
        // Trade rows (shared shape).
        (
            "fit_interval_trade.span_s",
            "s",
            "input",
            "span of usage periods evaluated",
        ),
        (
            "fit_interval_trade.rows[].fit_interval_s",
            "s",
            "input",
            "fit interval",
        ),
        (
            "fit_interval_trade.rows[].update_period_s",
            "s",
            "input",
            "usage period of each message",
        ),
        (
            "fit_interval_trade.rows[].n_messages",
            "count",
            "computed",
            "messages fitted",
        ),
    ],
    &sisre_stats_units!("fit_interval_trade.rows[]", "RMS orbit-only SISRE over the usage periods"),
    &[
        (
            "fit_interval_trade.update_period_rows[].fit_interval_s",
            "s",
            "input",
            "fit interval",
        ),
        (
            "fit_interval_trade.update_period_rows[].update_period_s",
            "s",
            "input",
            "update period",
        ),
        (
            "fit_interval_trade.update_period_rows[].n_messages",
            "count",
            "computed",
            "messages fitted",
        ),
    ],
    &sisre_stats_units!("fit_interval_trade.update_period_rows[]", "RMS orbit-only SISRE"),
    &[
        // Model comparison.
        (
            "model_comparison.span_s",
            "s",
            "input",
            "span evaluated per model",
        ),
        (
            "model_comparison.rows[].fit_interval_s",
            "s",
            "input",
            "fit interval",
        ),
        (
            "model_comparison.rows[].n_parameters",
            "count",
            "computed",
            "ephemeris parameters transmitted",
        ),
        (
            "model_comparison.rows[].ephemeris_clock_bits",
            "bit",
            "computed",
            "bits of ephemeris and clock in Kshana's encoding",
        ),
        (
            "model_comparison.rows[].n_messages",
            "count",
            "computed",
            "messages fitted",
        ),
    ],
    &sisre_stats_units!("model_comparison.rows[].stats", "RMS orbit-only SISRE"),
    &[
        (
            "model_comparison.liu2025_altitude_table.arc_s",
            "s",
            "published",
            "fit arc of the published comparison (20 minutes)",
        ),
        (
            "model_comparison.liu2025_altitude_table.arcs_per_altitude",
            "count",
            "input",
            "arcs fitted per altitude",
        ),
        (
            "model_comparison.liu2025_altitude_table.rows[].altitude_km",
            "km",
            "published",
            "satellite altitude as published",
        ),
        (
            "model_comparison.liu2025_altitude_table.rows[].inclination_deg",
            "deg",
            "spec",
            "inclination of the named satellite",
        ),
        (
            "model_comparison.liu2025_altitude_table.rows[].published_sisre_m",
            "m",
            "published",
            "Liu et al. 2025 SISRE of the 22-parameter model",
        ),
        (
            "model_comparison.liu2025_altitude_table.rows[].kshana_sisre_orb_rms_m",
            "m",
            "modelled",
            "Kshana's orbit-only SISRE of its own 22-parameter fit",
        ),
        (
            "model_comparison.liu2025_altitude_table.rows[].ratio",
            "1",
            "computed",
            "Kshana over published",
        ),
        (
            "model_comparison.liu2025_altitude_table.rows[].w_r",
            "1",
            "computed",
            "radial SISRE weight at that altitude",
        ),
        (
            "model_comparison.liu2025_altitude_table.rows[].w_ac2",
            "1",
            "computed",
            "squared transverse SISRE weight at that altitude",
        ),
        // Mid-pass.
        (
            "midpass_update.user.lat_deg",
            "deg",
            "input",
            "user geodetic latitude",
        ),
        (
            "midpass_update.user.lon_deg",
            "deg",
            "input",
            "user longitude",
        ),
        (
            "midpass_update.user.mask_deg",
            "deg",
            "input",
            "pass elevation mask",
        ),
        (
            "midpass_update.pass.start_s",
            "s",
            "computed",
            "pass start after the analysis origin",
        ),
        (
            "midpass_update.pass.end_s",
            "s",
            "computed",
            "pass end after the analysis origin",
        ),
        (
            "midpass_update.pass.max_elevation_deg",
            "deg",
            "computed",
            "largest elevation in the pass",
        ),
        (
            "midpass_update.fit_interval_s",
            "s",
            "input",
            "fit interval",
        ),
        (
            "midpass_update.update_period_s",
            "s",
            "input",
            "update period",
        ),
        (
            "midpass_update.switches[].t_s",
            "s",
            "computed",
            "switch time after the analysis origin",
        ),
        (
            "midpass_update.switches[].elevation_deg",
            "deg",
            "computed",
            "elevation at the switch",
        ),
        (
            "midpass_update.switches[].iod_old",
            "count",
            "computed",
            "issue of data of the outgoing message",
        ),
        (
            "midpass_update.switches[].iod_new",
            "count",
            "computed",
            "issue of data of the incoming message",
        ),
        (
            "midpass_update.switches[].pos_jump_m",
            "m",
            "computed",
            "3D position difference new minus old at the switch",
        ),
        (
            "midpass_update.switches[].clock_jump_m",
            "m",
            "computed",
            "clock difference new minus old times c",
        ),
        (
            "midpass_update.switches[].range_jump_m",
            "m",
            "computed",
            "user pseudorange difference new minus old",
        ),
        (
            "midpass_update.switches[].worst_case_range_jump_m",
            "m",
            "computed",
            "largest range jump over any visible line of sight",
        ),
        (
            "midpass_update.switches[].range_error_before_m",
            "m",
            "computed",
            "old message range minus truth at the switch",
        ),
        (
            "midpass_update.switches[].range_error_after_m",
            "m",
            "computed",
            "new message range minus truth at the switch",
        ),
        (
            "midpass_update.range_error_series[].t_s",
            "s",
            "computed",
            "time after the analysis origin",
        ),
        (
            "midpass_update.range_error_series[].iod",
            "count",
            "computed",
            "issue of data of the current message",
        ),
        (
            "midpass_update.range_error_series[].range_error_m",
            "m",
            "computed",
            "message range minus truth for the user",
        ),
        (
            "midpass_update.max_range_jump_m",
            "m",
            "computed",
            "largest user range jump at a switch",
        ),
        (
            "midpass_update.max_worst_case_range_jump_m",
            "m",
            "computed",
            "largest worst-geometry range jump",
        ),
        (
            "midpass_update.threshold_m",
            "m",
            "input",
            "continuity threshold",
        ),
        // Encode-decode.
        (
            "encode_decode.frame_bytes",
            "byte",
            "computed",
            "encoded frame length",
        ),
        (
            "encode_decode.payload_bits",
            "bit",
            "computed",
            "payload bits before padding",
        ),
        (
            "encode_decode.ephemeris_clock_bits",
            "bit",
            "computed",
            "ephemeris and clock bits",
        ),
        (
            "encode_decode.round_trip_max_pos_m",
            "m",
            "computed",
            "largest position difference decoded minus exact",
        ),
        (
            "encode_decode.quantised_max_pos_m",
            "m",
            "computed",
            "largest position change from quantisation over the usage period",
        ),
        (
            "encode_decode.quantised_max_clock_m",
            "m",
            "computed",
            "largest clock change from quantisation times c",
        ),
        (
            "encode_decode.sisre_exact_rms_m",
            "m",
            "computed",
            "RMS SISRE of the exact first message over its usage period",
        ),
        (
            "encode_decode.sisre_quantised_rms_m",
            "m",
            "computed",
            "RMS SISRE of the decoded first message",
        ),
        (
            "encode_decode.rinex_round_trip_max_pos_m",
            "m",
            "internal-consistency",
            "largest position difference after RINEX-style export and import",
        ),
        (
            "encode_decode.rinex_round_trip_max_clock_m",
            "m",
            "internal-consistency",
            "largest clock difference after RINEX-style export and import",
        ),
        (
            "encode_decode.csv_round_trip_max_pos_m",
            "m",
            "internal-consistency",
            "largest position difference after CSV export and import",
        ),
        (
            "encode_decode.field_table[].fields[].bits",
            "bit",
            "spec",
            "field width in Kshana's encoding",
        ),
        (
            "encode_decode.field_table[].fields[].lsb",
            "per unit",
            "spec",
            "field step in its stated unit",
        ),
        (
            "encode_decode.quantisation_budget[].bits",
            "bit",
            "spec",
            "field width",
        ),
        (
            "encode_decode.quantisation_budget[].lsb",
            "per unit",
            "spec",
            "field step in its stated unit",
        ),
        (
            "encode_decode.quantisation_budget[].half_lsb_pos_m",
            "m",
            "computed",
            "largest position change from a half-step change of the field",
        ),
        (
            "encode_decode.quantisation_budget[].half_lsb_clock_m",
            "m",
            "computed",
            "largest clock change times c from a half-step change of the field",
        ),
    ],
    &sisre_stats_units!("encode_decode.sequence_stats", "RMS orbit-only SISRE of the sequence"),
    &[
        (
            "encode_decode.messages[].svid",
            "count",
            "input",
            "space-vehicle identifier",
        ),
        (
            "encode_decode.messages[].iod",
            "count",
            "computed",
            "issue of data",
        ),
        (
            "encode_decode.messages[].band",
            "count",
            "input",
            "band identifier",
        ),
        (
            "encode_decode.messages[].health",
            "count",
            "input",
            "signal health status",
        ),
        (
            "encode_decode.messages[].week",
            "week",
            "computed",
            "message week",
        ),
        (
            "encode_decode.messages[].tow",
            "s",
            "computed",
            "transmission time of week",
        ),
        (
            "encode_decode.messages[].clock.toc",
            "s",
            "computed",
            "clock reference time of week",
        ),
        (
            "encode_decode.messages[].clock.af0",
            "s",
            "computed",
            "clock bias",
        ),
        (
            "encode_decode.messages[].clock.af1",
            "s/s",
            "computed",
            "clock drift",
        ),
        (
            "encode_decode.messages[].clock.af2",
            "s/s^2",
            "computed",
            "clock drift rate",
        ),
        (
            "encode_decode.messages[].ephemeris.kepler.sqrt_a",
            "m^0.5",
            "computed",
            "square root of the semi-major axis",
        ),
        (
            "encode_decode.messages[].ephemeris.kepler.e",
            "1",
            "computed",
            "eccentricity",
        ),
        (
            "encode_decode.messages[].ephemeris.kepler.i0",
            "rad",
            "computed",
            "inclination at toe",
        ),
        (
            "encode_decode.messages[].ephemeris.kepler.omega0",
            "rad",
            "computed",
            "node longitude at the weekly epoch",
        ),
        (
            "encode_decode.messages[].ephemeris.kepler.omega",
            "rad",
            "computed",
            "argument of perigee",
        ),
        (
            "encode_decode.messages[].ephemeris.kepler.m0",
            "rad",
            "computed",
            "mean anomaly at toe",
        ),
        (
            "encode_decode.messages[].ephemeris.kepler.delta_n",
            "rad/s",
            "computed",
            "mean-motion difference",
        ),
        (
            "encode_decode.messages[].ephemeris.kepler.omega_dot",
            "rad/s",
            "computed",
            "node rate",
        ),
        (
            "encode_decode.messages[].ephemeris.kepler.i_dot",
            "rad/s",
            "computed",
            "inclination rate",
        ),
        (
            "encode_decode.messages[].ephemeris.kepler.cuc",
            "rad",
            "computed",
            "argument-of-latitude cosine harmonic",
        ),
        (
            "encode_decode.messages[].ephemeris.kepler.cus",
            "rad",
            "computed",
            "argument-of-latitude sine harmonic",
        ),
        (
            "encode_decode.messages[].ephemeris.kepler.crc",
            "m",
            "computed",
            "radius cosine harmonic",
        ),
        (
            "encode_decode.messages[].ephemeris.kepler.crs",
            "m",
            "computed",
            "radius sine harmonic",
        ),
        (
            "encode_decode.messages[].ephemeris.kepler.cic",
            "rad",
            "computed",
            "inclination cosine harmonic",
        ),
        (
            "encode_decode.messages[].ephemeris.kepler.cis",
            "rad",
            "computed",
            "inclination sine harmonic",
        ),
        (
            "encode_decode.messages[].ephemeris.kepler.toe",
            "s",
            "computed",
            "ephemeris reference time of week",
        ),
        (
            "encode_decode.messages[].ephemeris.rac.tau_s",
            "s",
            "computed",
            "time scale of the correction polynomials: the power of two at or above half the fit interval",
        ),
        (
            "encode_decode.messages[].ephemeris.rac.along[]",
            "m",
            "computed",
            "along-track correction coefficients in tau = tk/tau_s",
        ),
        (
            "encode_decode.messages[].ephemeris.rac.cross[]",
            "m",
            "computed",
            "cross-track correction coefficients",
        ),
        (
            "encode_decode.messages[].ephemeris.rac.radial[]",
            "m",
            "computed",
            "radial correction coefficients",
        ),
        (
            "encode_decode.messages[].ephemeris.extra.a_dot",
            "m/s",
            "computed",
            "semi-major-axis rate",
        ),
        (
            "encode_decode.messages[].ephemeris.extra.n_dot",
            "rad/s^2",
            "computed",
            "mean-motion rate",
        ),
        (
            "encode_decode.messages[].ephemeris.extra.crs3",
            "m",
            "computed",
            "radius sine harmonic, three per revolution",
        ),
        (
            "encode_decode.messages[].ephemeris.extra.crc3",
            "m",
            "computed",
            "radius cosine harmonic, three per revolution",
        ),
        (
            "encode_decode.messages[].ephemeris.extra.crs1",
            "m",
            "computed",
            "radius sine harmonic, once per revolution",
        ),
        (
            "encode_decode.messages[].ephemeris.extra.crc1",
            "m",
            "computed",
            "radius cosine harmonic, once per revolution",
        ),
        (
            "encode_decode.messages[].ephemeris.poly.t_ref",
            "s",
            "computed",
            "polynomial reference time of week",
        ),
        (
            "encode_decode.messages[].ephemeris.poly.coeffs[][]",
            "m",
            "computed",
            "ECEF polynomial coefficients in tau = dt/64 s",
        ),
        (
            "encode_decode.messages[].services.klobuchar.alpha[]",
            "s/semicircle^n",
            "modelled-input",
            "Klobuchar amplitude coefficients",
        ),
        (
            "encode_decode.messages[].services.klobuchar.beta[]",
            "s/semicircle^n",
            "modelled-input",
            "Klobuchar period coefficients",
        ),
        (
            "encode_decode.messages[].services.nequick.ai0",
            "sfu",
            "modelled-input",
            "NeQuick-G ai0",
        ),
        (
            "encode_decode.messages[].services.nequick.ai1",
            "sfu/deg",
            "modelled-input",
            "NeQuick-G ai1",
        ),
        (
            "encode_decode.messages[].services.nequick.ai2",
            "sfu/deg^2",
            "modelled-input",
            "NeQuick-G ai2",
        ),
        (
            "encode_decode.messages[].services.utc.a0",
            "s",
            "modelled-input",
            "UTC offset constant term",
        ),
        (
            "encode_decode.messages[].services.utc.a1",
            "s/s",
            "modelled-input",
            "UTC offset rate term",
        ),
        (
            "encode_decode.messages[].services.utc.dt_ls",
            "s",
            "modelled-input",
            "leap seconds before the event",
        ),
        (
            "encode_decode.messages[].services.utc.t_ot",
            "s",
            "modelled-input",
            "UTC data reference time of week",
        ),
        (
            "encode_decode.messages[].services.utc.wn_ot",
            "week",
            "modelled-input",
            "UTC data reference week",
        ),
        (
            "encode_decode.messages[].services.utc.wn_lsf",
            "week",
            "modelled-input",
            "week of the next leap-second event",
        ),
        (
            "encode_decode.messages[].services.utc.dn",
            "day",
            "modelled-input",
            "day of the leap-second event",
        ),
        (
            "encode_decode.messages[].services.utc.dt_lsf",
            "s",
            "modelled-input",
            "leap seconds after the event",
        ),
    ],
];

fn to_svg(res: &Resolved, rows: &[TradeRow], doc: &Value) -> String {
    let (w, h) = (900.0, 480.0);
    let mut s = crate::chart::frame_open(
        w,
        h,
        "LEO navigation message: SISRE versus fit interval",
        &format!(
            "{:.0} km, {:.1} deg, gravity degree {} · representation error against the truth · MODELLED",
            res.orbit.altitude_m / 1e3,
            res.orbit.inclination_rad.to_degrees(),
            res.orbit.gravity_degree
        ),
    );
    let (ml, mt, pw, ph) = (80.0, 70.0, 780.0, 340.0);
    if rows.is_empty() {
        let msg = if doc.get("encode_decode").is_some() {
            "No trade in this run; see result.json for the encode/decode and budget tables."
        } else {
            "No fit-interval trade in this run; see result.json."
        };
        s.push_str(&format!(
            "<text x=\"{ml}\" y=\"{:.0}\" font-size=\"13\">{msg}</text></svg>",
            mt + 40.0
        ));
        return s;
    }
    // Log10 y axis of orbit-only SISRE.
    let vals: Vec<f64> = rows
        .iter()
        .map(|r| r.stats.sisre_orb_rms_m.max(1e-5))
        .collect();
    let ymin = vals
        .iter()
        .copied()
        .fold(f64::INFINITY, f64::min)
        .plog10()
        .floor();
    let ymax = vals
        .iter()
        .copied()
        .fold(0.0, f64::max)
        .plog10()
        .ceil()
        .max(ymin + 1.0);
    let xs: Vec<f64> = rows.iter().map(|r| r.fit_interval_s).collect();
    let xmax = xs.iter().copied().fold(0.0, f64::max);
    let xp = |x: f64| ml + pw * x / xmax;
    let yp = |v: f64| mt + ph - ph * (v.max(1e-5).plog10() - ymin) / (ymax - ymin);
    s.push_str(&crate::chart::panel_axes(
        ml,
        mt,
        pw,
        mt + ph,
        "orbit-only SISRE RMS (m, log scale) vs fit interval (s)",
    ));
    let mut e = ymin;
    while e <= ymax + 1e-9 {
        let y = yp(10f64.ppowf(e));
        s.push_str(&format!(
            "<line x1=\"{ml}\" y1=\"{y:.1}\" x2=\"{:.0}\" y2=\"{y:.1}\" stroke=\"#262019\"/><text x=\"{:.0}\" y=\"{:.1}\" text-anchor=\"end\" font-size=\"11\" fill=\"#8c8273\">1e{e:.0}</text>",
            ml + pw,
            ml - 6.0,
            y + 4.0
        ));
        e += 1.0;
    }
    for &x in &xs {
        s.push_str(&format!(
            "<text x=\"{:.1}\" y=\"{:.0}\" text-anchor=\"middle\" font-size=\"11\" fill=\"#8c8273\">{x:.0}</text>",
            xp(x),
            mt + ph + 16.0
        ));
    }
    let colours = ["#e0a458", "#6fb1a0", "#b58bd6", "#d86f6f"];
    let mut models: Vec<&str> = Vec::new();
    for r in rows {
        if !models.contains(&r.model.as_str()) {
            models.push(&r.model);
        }
    }
    for (i, m) in models.iter().enumerate() {
        let c = colours[i % colours.len()];
        let pts: Vec<String> = rows
            .iter()
            .filter(|r| r.model == *m)
            .map(|r| {
                format!(
                    "{:.1},{:.1}",
                    xp(r.fit_interval_s),
                    yp(r.stats.sisre_orb_rms_m)
                )
            })
            .collect();
        s.push_str(&format!(
            "<polyline fill=\"none\" stroke=\"{c}\" stroke-width=\"2\" points=\"{}\"/>",
            pts.join(" ")
        ));
        s.push_str(&format!(
            "<text x=\"{:.0}\" y=\"{:.0}\" fill=\"{c}\" font-size=\"12\">{m}</text>",
            ml + 12.0,
            mt + 16.0 + 16.0 * i as f64
        ));
    }
    s.push_str("</svg>");
    s
}

#[cfg(test)]
mod tests;
