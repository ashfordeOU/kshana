// SPDX-License-Identifier: AGPL-3.0-only
//! RAIM beside the clock-holdover figures of merit (CAP-05b): the optional `[integrity]` section
//! of the clock kind.
//!
//! The clock kind's GNSS input is a timeline of nominal, degraded and denied windows; it carries
//! no satellite geometry, and its `integrity` figure of merit is the filter's self-consistency,
//! not a RAIM result. With an `[integrity]` section the run also reports a separate block,
//! `integrity_fom`, from a stated site and constellation presets (the `sky_geometry` presets,
//! [`crate::geometry`]): at every integrity epoch while GNSS is not denied, the satellites above
//! the mask are placed at their azimuth and elevation, Gaussian range residuals of 1-sigma
//! `sigma_m` are drawn (seeded), an optional stated bias is added on one satellite, and the
//! engine's snapshot RAIM ([`crate::raim::snapshot_raim`], the parity chi-square test and slope
//! protection levels validated against RTKLIB) gives the verdict and the protection levels.
//!
//! * While the timeline says GNSS is denied, RAIM is reported as unavailable, never
//!   extrapolated; a degraded window is evaluated as nominal (the timeline states no degraded
//!   error model).
//! * The block never changes the holdover figures of merit; without the section the run's
//!   output is byte-identical.
//!
//! MODELLED: the sky is a representative preset geometry, the residuals are synthetic, and
//! `sigma_m`, the alert limits and the probabilities are stated inputs.

use crate::geometry::{sky_geometry, ClockModel, Site, SkyRequest, SystemSpec};
use crate::scenario::{GnssState, Scenario};
use rand::SeedableRng;
use rand_chacha::ChaCha8Rng;
use rand_distr::{Distribution, Normal};
use serde::{Deserialize, Serialize};

type Vec3 = [f64; 3];

/// Most integrity epochs one run evaluates: an input cap.
pub const MAX_EPOCHS: usize = 10_000;
const SALT: u64 = 0x1A7E_6C17_0000_05B0;

fn d_systems() -> Vec<String> {
    vec!["gps-baseline".into()]
}
fn d_mask() -> f64 {
    5.0
}
fn d_sigma() -> f64 {
    1.0
}
fn d_pfa() -> f64 {
    1e-5
}
fn d_pmd() -> f64 {
    1e-3
}
fn d_hal() -> f64 {
    40.0
}
fn d_val() -> f64 {
    50.0
}

/// A stated range bias on one satellite over an interval, to exercise the detector.
#[derive(Clone, Debug, Deserialize, Serialize, PartialEq)]
#[serde(deny_unknown_fields)]
pub struct InjectedBias {
    /// The satellite's identifier as the preset names it (for example `G05`).
    pub sat_id: String,
    /// The bias (m).
    pub bias_m: f64,
    /// Start of the interval (s, scenario time).
    pub t0_s: f64,
    /// End of the interval (s, excluded).
    pub t1_s: f64,
}

/// The `[integrity]` section.
#[derive(Clone, Debug, Deserialize, Serialize, PartialEq)]
#[serde(deny_unknown_fields)]
pub struct IntegrityCfg {
    /// The receiver's site.
    pub site: Site,
    /// Constellation presets (`sky_geometry` names); default `["gps-baseline"]`.
    #[serde(default = "d_systems")]
    pub systems: Vec<String>,
    /// Elevation mask (deg).
    #[serde(default = "d_mask")]
    pub mask_deg: f64,
    /// 1-sigma range residual (m), the RAIM noise model.
    #[serde(default = "d_sigma")]
    pub sigma_m: f64,
    /// False-alarm probability of the chi-square test.
    #[serde(default = "d_pfa")]
    pub p_fa: f64,
    /// Missed-detection probability of the protection levels.
    #[serde(default = "d_pmd")]
    pub p_md: f64,
    /// Horizontal alert limit (m).
    #[serde(default = "d_hal")]
    pub hal_m: f64,
    /// Vertical alert limit (m).
    #[serde(default = "d_val")]
    pub val_m: f64,
    /// Integrity epoch spacing (s); default `max(time.step_s, 60)`.
    #[serde(default, skip_serializing_if = "Option::is_none")]
    pub step_s: Option<f64>,
    /// An optional stated bias on one satellite.
    #[serde(default, skip_serializing_if = "Option::is_none")]
    pub injected_bias: Option<InjectedBias>,
}

/// One integrity epoch.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct IntegrityEpoch {
    /// Scenario time (s).
    pub t_s: f64,
    /// The timeline's GNSS state: `nominal`, `degraded` or `denied`.
    pub gnss_state: &'static str,
    /// Satellites above the mask (0 while denied).
    pub n_sats: usize,
    /// Horizontal protection level (m); absent when not evaluated.
    #[serde(skip_serializing_if = "Option::is_none")]
    pub hpl_m: Option<f64>,
    /// Vertical protection level (m); absent when not evaluated.
    #[serde(skip_serializing_if = "Option::is_none")]
    pub vpl_m: Option<f64>,
    /// `available`, `alarm`, `unavailable-pl-above-al`, `unavailable-too-few-satellites` or
    /// `unavailable-gnss-denied`.
    pub verdict: &'static str,
}

/// The `integrity_fom` block.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct IntegrityFom {
    /// `MODELLED`.
    pub label: &'static str,
    /// Integrity epochs.
    pub n_epochs: usize,
    /// Epochs in a denied window (RAIM unavailable, not extrapolated).
    pub n_denied: usize,
    /// Epochs evaluated (not denied).
    pub n_evaluated: usize,
    /// Evaluated epochs with no alarm and both protection levels within the alert limits.
    pub n_available: usize,
    /// Evaluated epochs whose chi-square test alarmed.
    pub n_alarm: usize,
    /// `n_available / n_evaluated`; absent when nothing was evaluated.
    #[serde(skip_serializing_if = "Option::is_none")]
    pub availability: Option<f64>,
    /// `n_available / n_epochs`: the share of the whole run with RAIM available.
    pub availability_of_run: f64,
    /// Median horizontal protection level over the evaluated epochs that have one (m).
    #[serde(skip_serializing_if = "Option::is_none")]
    pub hpl_median_m: Option<f64>,
    /// Largest horizontal protection level (m).
    #[serde(skip_serializing_if = "Option::is_none")]
    pub hpl_max_m: Option<f64>,
    /// Largest vertical protection level (m).
    #[serde(skip_serializing_if = "Option::is_none")]
    pub vpl_max_m: Option<f64>,
    /// Every epoch.
    pub epochs: Vec<IntegrityEpoch>,
    /// What the block is and is not.
    pub note: &'static str,
}

/// The note the block carries.
pub const NOTE: &str = "MODELLED. Snapshot RAIM (parity chi-square test, slope protection \
     levels) on a representative preset sky seen from the stated site, with synthetic Gaussian \
     range residuals of the stated sigma and any stated bias; unavailable while the timeline \
     says GNSS is denied (never extrapolated); a degraded window is evaluated as nominal. A \
     separate block: it does not change the holdover figures of merit.";

impl IntegrityCfg {
    fn validate(&self) -> Result<(), String> {
        let pos = |n: &str, v: f64| -> Result<(), String> {
            if v.is_finite() && v > 0.0 {
                Ok(())
            } else {
                Err(format!(
                    "integrity: {n} must be finite and positive, got {v}"
                ))
            }
        };
        pos("sigma_m", self.sigma_m)?;
        pos("hal_m", self.hal_m)?;
        pos("val_m", self.val_m)?;
        for (n, v) in [("p_fa", self.p_fa), ("p_md", self.p_md)] {
            if !(v > 0.0 && v < 1.0) {
                return Err(format!("integrity: {n} must lie in (0, 1), got {v}"));
            }
        }
        if !(self.mask_deg.is_finite() && (0.0..90.0).contains(&self.mask_deg)) {
            return Err("integrity: mask_deg must lie in [0, 90)".into());
        }
        if let Some(s) = self.step_s {
            pos("step_s", s)?;
        }
        if self.systems.is_empty() {
            return Err("integrity: systems must name at least one preset".into());
        }
        if let Some(b) = &self.injected_bias {
            if !(b.bias_m.is_finite() && b.t0_s.is_finite() && b.t1_s.is_finite()) {
                return Err("integrity: injected_bias needs finite bias_m, t0_s and t1_s".into());
            }
        }
        Ok(())
    }
}

fn state_name(s: GnssState) -> &'static str {
    match s {
        GnssState::Nominal => "nominal",
        GnssState::Degraded => "degraded",
        GnssState::Denied => "denied",
    }
}

/// The geodetic east, north and up unit vectors at a site.
fn basis(site: &Site) -> (Vec3, Vec3, Vec3) {
    let (p, l) = (site.lat_deg.to_radians(), site.lon_deg.to_radians());
    (
        [-l.sin(), l.cos(), 0.0],
        [-p.sin() * l.cos(), -p.sin() * l.sin(), p.cos()],
        [p.cos() * l.cos(), p.cos() * l.sin(), p.sin()],
    )
}

/// The satellites above the mask at time `t` as `(id, ECEF position)`, placed along their line
/// of sight at a nominal 20,000 km (RAIM uses only the lines of sight).
pub fn sky_at(cfg: &IntegrityCfg, user: Vec3, t: f64) -> Result<Vec<(String, Vec3)>, String> {
    let req = SkyRequest {
        site: Some(cfg.site.clone()),
        time_s: Some(t),
        systems: Some(cfg.systems.iter().cloned().map(SystemSpec::Name).collect()),
        mask_deg: Some(cfg.mask_deg),
        clock: ClockModel::Common,
        ..SkyRequest::default()
    };
    let g = sky_geometry(&req)?;
    let (e, n, u) = basis(&cfg.site);
    let r = 2.0e7;
    Ok(g.satellites
        .iter()
        .filter(|s| s.visible)
        .map(|s| {
            let d = crate::geometry::los_enu(s.az_deg, s.el_deg);
            let pos = [
                user[0] + r * (d[0] * e[0] + d[1] * n[0] + d[2] * u[0]),
                user[1] + r * (d[0] * e[1] + d[1] * n[1] + d[2] * u[1]),
                user[2] + r * (d[0] * e[2] + d[1] * n[2] + d[2] * u[2]),
            ];
            (s.id.clone(), pos)
        })
        .collect())
}

/// Run the `[integrity]` section of `scn`.
pub fn run(scn: &Scenario, cfg: &IntegrityCfg) -> Result<IntegrityFom, String> {
    cfg.validate()?;
    let step = cfg.step_s.unwrap_or(scn.time.step_s.max(60.0));
    let n = (scn.time.duration_s / step).floor() as usize + 1;
    if n > MAX_EPOCHS {
        return Err(format!(
            "integrity: {n} epochs exceed the {MAX_EPOCHS}-epoch cap; raise step_s"
        ));
    }
    let user = crate::geometry::site_ecef(&cfg.site)?;
    let noise = Normal::new(0.0, cfg.sigma_m).expect("finite positive sigma");
    let mut epochs = Vec::with_capacity(n);
    for i in 0..n {
        let t = i as f64 * step;
        let state = scn.gnss.state_at(t);
        if state == GnssState::Denied {
            epochs.push(IntegrityEpoch {
                t_s: t,
                gnss_state: "denied",
                n_sats: 0,
                hpl_m: None,
                vpl_m: None,
                verdict: "unavailable-gnss-denied",
            });
            continue;
        }
        let sky = sky_at(cfg, user, t)?;
        let mut rng =
            ChaCha8Rng::seed_from_u64(scn.seed ^ SALT ^ (i as u64).wrapping_mul(0x9E37_79B9));
        let resid: Vec<f64> = sky
            .iter()
            .map(|(id, _)| {
                let mut r = noise.sample(&mut rng);
                if let Some(b) = &cfg.injected_bias {
                    if *id == b.sat_id && t >= b.t0_s && t < b.t1_s {
                        r += b.bias_m;
                    }
                }
                r
            })
            .collect();
        let sats: Vec<Vec3> = sky.iter().map(|s| s.1).collect();
        let res = crate::raim::snapshot_raim(user, &sats, &resid, cfg.sigma_m, cfg.p_fa, cfg.p_md);
        let (verdict, hpl, vpl) = match res {
            None => ("unavailable-too-few-satellites", None, None),
            Some(r) => {
                let v = if r.fault_detected {
                    "alarm"
                } else if r.hpl_m <= cfg.hal_m && r.vpl_m <= cfg.val_m {
                    "available"
                } else {
                    "unavailable-pl-above-al"
                };
                (v, Some(r.hpl_m), Some(r.vpl_m))
            }
        };
        epochs.push(IntegrityEpoch {
            t_s: t,
            gnss_state: state_name(state),
            n_sats: sats.len(),
            hpl_m: hpl,
            vpl_m: vpl,
            verdict,
        });
    }
    let n_denied = epochs.iter().filter(|e| e.gnss_state == "denied").count();
    let n_evaluated = epochs.len() - n_denied;
    let n_available = epochs.iter().filter(|e| e.verdict == "available").count();
    let n_alarm = epochs.iter().filter(|e| e.verdict == "alarm").count();
    let mut hpls: Vec<f64> = epochs.iter().filter_map(|e| e.hpl_m).collect();
    hpls.sort_by(|a, b| a.total_cmp(b));
    let median = (!hpls.is_empty()).then(|| {
        let m = hpls.len() / 2;
        if hpls.len() % 2 == 0 {
            0.5 * (hpls[m - 1] + hpls[m])
        } else {
            hpls[m]
        }
    });
    Ok(IntegrityFom {
        label: "MODELLED",
        n_epochs: epochs.len(),
        n_denied,
        n_evaluated,
        n_available,
        n_alarm,
        availability: (n_evaluated > 0).then(|| n_available as f64 / n_evaluated as f64),
        availability_of_run: n_available as f64 / epochs.len() as f64,
        hpl_median_m: median,
        hpl_max_m: hpls.last().copied(),
        vpl_max_m: epochs.iter().filter_map(|e| e.vpl_m).reduce(f64::max),
        epochs,
        note: NOTE,
    })
}

/// Units of the `integrity_fom` block and the `[integrity]` input, added to a clock document
/// only when it carries the block.
pub const UNITS: &[crate::field_schema::FieldUnit] = {
    use crate::field_schema::{FieldUnit, ProvenanceClass::*};
    macro_rules! u {
        ($p:expr, $u:expr, $c:expr, $d:expr) => {
            FieldUnit {
                path: $p,
                unit: $u,
                provenance: $c,
                definition: $d,
            }
        };
    }
    &[
        u!(
            "integrity_fom.n_epochs",
            "count",
            Computed,
            "integrity epochs"
        ),
        u!(
            "integrity_fom.n_denied",
            "count",
            Computed,
            "epochs in a denied window, where RAIM is unavailable"
        ),
        u!(
            "integrity_fom.n_evaluated",
            "count",
            Computed,
            "epochs evaluated (not denied)"
        ),
        u!(
            "integrity_fom.n_available",
            "count",
            Computed,
            "evaluated epochs with no alarm and both protection levels within the alert limits"
        ),
        u!(
            "integrity_fom.n_alarm",
            "count",
            Computed,
            "evaluated epochs whose chi-square test alarmed"
        ),
        u!(
            "integrity_fom.availability",
            "1",
            Computed,
            "n_available / n_evaluated"
        ),
        u!(
            "integrity_fom.availability_of_run",
            "1",
            Computed,
            "n_available / n_epochs"
        ),
        u!(
            "integrity_fom.hpl_median_m",
            "m",
            Computed,
            "median horizontal protection level over the evaluated epochs"
        ),
        u!(
            "integrity_fom.hpl_max_m",
            "m",
            Computed,
            "largest horizontal protection level"
        ),
        u!(
            "integrity_fom.vpl_max_m",
            "m",
            Computed,
            "largest vertical protection level"
        ),
        u!(
            "integrity_fom.epochs[].t_s",
            "s",
            Computed,
            "scenario time of the integrity epoch"
        ),
        u!(
            "integrity_fom.epochs[].n_sats",
            "count",
            Computed,
            "satellites above the mask"
        ),
        u!(
            "integrity_fom.epochs[].hpl_m",
            "m",
            Computed,
            "horizontal protection level (snapshot RAIM, slope method)"
        ),
        u!(
            "integrity_fom.epochs[].vpl_m",
            "m",
            Computed,
            "vertical protection level (snapshot RAIM, slope method)"
        ),
    ]
};

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn bad_sections_are_refused() {
        let ok: IntegrityCfg = toml::from_str("site = { lat_deg = 59.4, lon_deg = 24.7 }").unwrap();
        assert!(ok.validate().is_ok());
        for bad in [
            "site = { lat_deg = 59.4, lon_deg = 24.7 }\nsigma_m = 0.0",
            "site = { lat_deg = 59.4, lon_deg = 24.7 }\np_fa = 1.0",
            "site = { lat_deg = 59.4, lon_deg = 24.7 }\nsystems = []",
        ] {
            let c: IntegrityCfg = toml::from_str(bad).unwrap();
            assert!(c.validate().is_err(), "{bad}");
        }
        assert!(
            toml::from_str::<IntegrityCfg>("site = { lat_deg = 1.0, lon_deg = 2.0 }\nx = 1")
                .is_err()
        );
    }
}
