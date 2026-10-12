// SPDX-License-Identifier: AGPL-3.0-only
//! The sky-geometry engine functions of the design note
//! (`docs/design/2026-10-12-geometry-and-skyline-design.md`, item 2): which satellites a
//! site sees under a skyline, their dilution of precision, the geometry covariance, the
//! horizontal error ellipse, a seeded Monte Carlo cloud and an SVG skyplot.
//!
//! | Function | What it returns |
//! |---|---|
//! | [`sky_geometry`] | per-satellite azimuth, elevation, system, visible and masked; the five DOPs; the ENU cofactor and covariance with one clock per system (or one in common); the ellipse |
//! | [`sky_monte_carlo`] | `n` least-squares errors under independent Gaussian range errors of `σ_UERE`, their empirical covariance, RMS and the fraction inside the 95 % ellipse |
//! | [`skyline_presets`] | the named presets with their tables and provenance |
//! | [`skyline_profile`] | a skyline section reduced to the normalised 360-entry table the engine uses |
//! | [`skyplot_svg`] | a skyplot of [`sky_geometry`] as SVG |
//!
//! A request ([`SkyRequest`]) names its satellites through `systems` (constellation presets of
//! the engine, propagated to `time_s` and seen from `site`), through `tle` (two-line element
//! sets propagated by the engine's SGP4 to the UTC `epoch` plus `time_s`, rotated to
//! Earth-fixed with UT1 taken as UTC and no polar motion) or directly through `satellites`
//! (azimuth and elevation, or ECEF positions with a `site` or `user_ecef_m`), or any mix.
//!
//! ## One kernel
//!
//! The cofactor matrix is [`crate::orbit::cofactor_from_los`], the design-matrix assembly and
//! Gauss-Jordan inverse behind [`crate::orbit::dop`] and [`crate::orbit::dop_cov`] (validated
//! against gnss_lib_py in `tests/dop_reference.rs`). The lines of sight are built in ENU, so
//! the position block of `Q` is already the ENU cofactor. There is no second DOP
//! implementation.
//!
//! ## The ellipse
//!
//! The horizontal covariance is `σ² Q_h`, `Q_h` the east-north block of `Q`. Its eigenvalues
//! `λ₁ ≥ λ₂` give the one-sigma semi-axes `σ√λ₁`, `σ√λ₂`; at confidence `p` a two-dimensional
//! Gaussian's ellipse scales them by `k = √(−2 ln(1 − p))` (the chi-square quantile with two
//! degrees of freedom: `√5.991 = 2.448` at 95 %). The major axis points along azimuth
//! `α = ½ atan2(2 Q_EN, Q_NN − Q_EE)`, reported in `[0, 180)` degrees from north.
//!
//! ## What this is and is not
//!
//! MODELLED. Geometry under a stated error model: independent, equal, zero-mean Gaussian
//! range errors of `σ_UERE`, line-of-sight visibility against the skyline (no diffraction,
//! multipath or non-line-of-sight reception). It is not a prediction of a receiver's real
//! error, which also has biases, multipath and non-line-of-sight errors, and not an integrity
//! bound. The `systems` constellations are the engine's presets, whose relative phases come
//! from different reference epochs: the sky they draw is a representative geometry, not the sky
//! of a date at a place. Element sets with an `epoch` draw the sky those element sets give at
//! that epoch (their own accuracy, SGP4's, is not re-stated here), not a measurement of it;
//! without an `epoch` they are propagated to the newest set's own epoch and the sky is again
//! representative. Every result says which in `sky_source` and `sky_statement`.

use crate::frames::{geodetic_to_ecef, look_angles, Geodetic};
use crate::skyline::{Skyline, SkylineCfg};
use serde::{Deserialize, Serialize};

type Vec3 = [f64; 3];

/// The evidence label of every geometry result.
pub const LABEL: &str = "MODELLED";

/// What every geometry result is, stated with it.
pub const STATEMENT: &str = "Geometry under a stated error model (MODELLED): line-of-sight \
visibility against the stated skyline, dilution of precision and a Gaussian error ellipse for \
independent, equal, zero-mean Gaussian range errors of the stated user-equivalent range error. It \
is not a prediction of a receiver's real error, which also has biases, multipath and \
non-line-of-sight errors, and it is not an integrity bound. Preset constellations are a \
representative geometry, not the sky of that date at that place.";

/// The advisory statement every geometry result carries (the vessel-trust statement, as the
/// design note asks).
pub const ADVISORY: &str = crate::receiver_trust::ADVISORY;

/// Receiver cut-off (deg) for satellites given directly when the request states none: the
/// 5 deg the engine's GNSS kinds default to.
pub const DEFAULT_MASK_DEG: f64 = 5.0;

/// Default confidence of the error ellipse.
pub const DEFAULT_CONFIDENCE: f64 = 0.95;

/// Most Monte Carlo samples one call draws: an input cap (the design note's browser cap),
/// not a performance figure.
pub const MAX_MC_SAMPLES: usize = 5000;

/// Most satellites one request may carry: an input cap. `systems` and `satellites` count in
/// full; element sets in `tle` count only when they are above the site's horizon (a catalogue
/// of any size within [`MAX_TLE_BYTES`] is accepted, and its sets below the horizon go to
/// `n_below_horizon`).
pub const MAX_SATELLITES: usize = 2000;

/// Most receiver clocks one request may estimate (`clock = "per-system"` with that many
/// systems in view): an input cap, so a request cannot ask for a thousand-state solution.
pub const MAX_CLOCKS: usize = 16;

/// Most entries `tle_skipped` lists one by one; beyond it a final entry counts the rest.
pub const MAX_TLE_SKIPPED: usize = 100;

/// Largest `tle` text one request may carry (4 MiB, the Studio's cap): an input cap.
pub const MAX_TLE_BYTES: usize = 4 * 1024 * 1024;

/// A ground site.
#[derive(Clone, Copy, Debug, PartialEq, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct Site {
    /// Geodetic latitude (deg).
    pub lat_deg: f64,
    /// Longitude (deg east).
    pub lon_deg: f64,
    /// Height above the WGS-84 ellipsoid (m).
    #[serde(default)]
    pub height_m: f64,
}

/// One satellite given directly: an azimuth and elevation, or an ECEF position.
#[derive(Clone, Debug, Default, PartialEq, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct SatelliteInput {
    /// Identifier echoed back (a PRN such as `G05`); defaults to its index.
    #[serde(default, skip_serializing_if = "Option::is_none")]
    pub id: Option<String>,
    /// System (constellation) label; selects the clock under `clock = "per-system"`.
    /// Defaults to the first letter of `id`, or `GNSS`.
    #[serde(default, skip_serializing_if = "Option::is_none")]
    pub system: Option<String>,
    /// Azimuth (deg, clockwise from north), with `el_deg`.
    #[serde(default, skip_serializing_if = "Option::is_none")]
    pub az_deg: Option<f64>,
    /// Elevation (deg), with `az_deg`.
    #[serde(default, skip_serializing_if = "Option::is_none")]
    pub el_deg: Option<f64>,
    /// ECEF position (m), with the request's `site` or `user_ecef_m`.
    #[serde(default, skip_serializing_if = "Option::is_none")]
    pub ecef_m: Option<[f64; 3]>,
}

/// A system in a request: a preset name (a `constellation-design` GNSS preset such as
/// `gps-baseline`, `galileo`, `beidou-meo`, `glonass`, or a LEO preset such as
/// `xona-pulsar`), or a full `leo-pvt` `[[system]]` table.
#[derive(Clone, Debug, Serialize, Deserialize)]
#[serde(untagged)]
pub enum SystemSpec {
    /// A preset name.
    Name(String),
    /// A `[[system]]` table of the `leo-pvt` kind.
    Table(Box<crate::leo_fusion::system::SystemCfg>),
}

/// The receiver-clock model.
#[derive(Clone, Copy, Debug, Default, PartialEq, Eq, Serialize, Deserialize)]
#[serde(rename_all = "kebab-case")]
pub enum ClockModel {
    /// One receiver clock per system in view (inter-system biases estimated freely).
    #[default]
    #[serde(alias = "per-constellation")]
    PerSystem,
    /// One receiver clock shared by every satellite (four states).
    Common,
}

/// A sky-geometry request. See the module documentation.
#[derive(Clone, Debug, Default, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct SkyRequest {
    /// The site (needed with `systems`, and with ECEF `satellites` unless `user_ecef_m`).
    #[serde(default, skip_serializing_if = "Option::is_none")]
    pub site: Option<Site>,
    /// The user's ECEF position (m): the alternative to `site` for ECEF satellites.
    #[serde(default, skip_serializing_if = "Option::is_none")]
    pub user_ecef_m: Option<[f64; 3]>,
    /// Seconds after the presets' common epoch at which `systems` are propagated, and after
    /// `epoch` (or the newest element set) for `tle`.
    #[serde(default, skip_serializing_if = "Option::is_none")]
    pub time_s: Option<f64>,
    /// Constellations to propagate.
    #[serde(default, skip_serializing_if = "Option::is_none")]
    pub systems: Option<Vec<SystemSpec>>,
    /// Satellites given directly.
    #[serde(default, skip_serializing_if = "Option::is_none")]
    pub satellites: Option<Vec<SatelliteInput>>,
    /// Two-line element sets as text (a name line before each is optional), propagated by the
    /// engine's SGP4 ([`crate::sgp4::SgpOrbit`]) and seen from `site`. At most
    /// [`MAX_TLE_BYTES`] of text; any number of sets, of which only those above the horizon count
    /// toward [`MAX_SATELLITES`] (the rest are counted in `n_below_horizon`).
    #[serde(default, skip_serializing_if = "Option::is_none")]
    pub tle: Option<String>,
    /// System label of the `tle` satellites (the clock they share under `per-system`);
    /// default `TLE`.
    #[serde(default, skip_serializing_if = "Option::is_none")]
    pub tle_system: Option<String>,
    /// UTC epoch of the sky, ISO 8601 `YYYY-MM-DDTHH:MM:SS[.fff][Z]`; `time_s` is added to it.
    /// It dates the `tle` satellites; without it they are propagated to the newest element
    /// set's own epoch plus `time_s`. The preset `systems` are not dated by it.
    #[serde(default, skip_serializing_if = "Option::is_none")]
    pub epoch: Option<String>,
    /// Receiver cut-off (deg) for every satellite. Default: each system's own mask (10 deg for
    /// a LEO system, 5 deg for GNSS), and [`DEFAULT_MASK_DEG`] for satellites given directly.
    #[serde(default, skip_serializing_if = "Option::is_none")]
    pub mask_deg: Option<f64>,
    /// Optional skyline over the cut-off.
    #[serde(default, skip_serializing_if = "Option::is_none")]
    pub skyline: Option<SkylineCfg>,
    /// Receiver-clock model; default one clock per system.
    #[serde(default)]
    pub clock: ClockModel,
    /// 1-sigma user-equivalent range error (m); default 1 m ([`crate::orbit::DEFAULT_UERE_M`],
    /// a representative dual-frequency budget line, not a measurement).
    #[serde(default, skip_serializing_if = "Option::is_none")]
    pub sigma_uere_m: Option<f64>,
    /// Confidence of the error ellipse, in (0, 1); default 0.95.
    #[serde(default, skip_serializing_if = "Option::is_none")]
    pub confidence: Option<f64>,
}

/// One satellite in the result.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct SatelliteLook {
    /// Identifier.
    pub id: String,
    /// System label.
    pub system: String,
    /// Azimuth (deg).
    pub az_deg: f64,
    /// Elevation (deg).
    pub el_deg: f64,
    /// Effective cut in this direction, `max(mask_deg, skyline)` (deg).
    pub cut_deg: f64,
    /// Whether the satellite clears the cut.
    pub visible: bool,
    /// Whether it clears the receiver mask but not the skyline.
    pub masked: bool,
}

/// Dilution-of-precision factors.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct DopFactors {
    /// Geometric DOP: sqrt of the trace of the whole cofactor matrix.
    pub gdop: f64,
    /// Position DOP.
    pub pdop: f64,
    /// Horizontal DOP.
    pub hdop: f64,
    /// Vertical DOP.
    pub vdop: f64,
    /// Time DOP of the first clock (the only clock in the common model).
    pub tdop: f64,
    /// Time DOP of every clock, in the order of `clock_labels`.
    pub tdop_by_clock: Vec<f64>,
}

/// The horizontal error ellipse.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct ErrorEllipse {
    /// 1-sigma UERE it is scaled by (m).
    pub sigma_uere_m: f64,
    /// Confidence (probability the horizontal error lies inside).
    pub confidence: f64,
    /// Scale factor `sqrt(-2 ln(1 - confidence))`.
    pub scale_k: f64,
    /// Semi-major axis at the confidence (m).
    pub semi_major_m: f64,
    /// Semi-minor axis at the confidence (m).
    pub semi_minor_m: f64,
    /// Azimuth of the major axis (deg from north, clockwise, in `[0, 180)`).
    pub orientation_deg: f64,
    /// 1-sigma east error (m).
    pub sigma_east_m: f64,
    /// 1-sigma north error (m).
    pub sigma_north_m: f64,
    /// East-north correlation coefficient.
    pub correlation_en: f64,
}

/// The result of [`sky_geometry`].
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct SkyGeometry {
    /// Evidence label ([`LABEL`]).
    pub label: &'static str,
    /// What the result is and is not ([`STATEMENT`]).
    pub statement: &'static str,
    /// The advisory statement ([`ADVISORY`]).
    pub advisory: &'static str,
    /// Where the satellites came from: `satellites` (given directly), `presets` (a
    /// representative geometry), `tle-at-epoch` (element sets propagated to the request's
    /// `epoch`) or `tle-at-element-epoch` (no `epoch`: a representative sky), joined with `+`.
    pub sky_source: String,
    /// What that sky is, in words.
    pub sky_statement: String,
    /// The UTC instant the `tle` satellites were propagated to; absent without `tle`.
    #[serde(skip_serializing_if = "Option::is_none")]
    pub epoch_utc: Option<String>,
    /// What of the `tle` text was not used, each with the reason: lines that were not a
    /// complete element set (a malformed or orphaned line 1 or 2, with its line number), sets
    /// the parser refused, and sets SGP4 could not propagate to the instant (decayed, or past
    /// its limits). At most [`MAX_TLE_SKIPPED`] entries, then one counting the rest; absent
    /// when there are none.
    #[serde(skip_serializing_if = "Vec::is_empty")]
    pub tle_skipped: Vec<String>,
    /// Where the skyline came from (`none`, `preset:<name>`, `preset:<name>+overrides`,
    /// `custom`).
    pub skyline_source: String,
    /// Fraction of the upper hemisphere above `max(mask, skyline)` (with the request's
    /// `mask_deg`, or 0 when each system keeps its own).
    pub open_fraction: f64,
    /// Every satellite above the horizon, visible or not.
    pub satellites: Vec<SatelliteLook>,
    /// Satellites that clear the cut.
    pub n_visible: usize,
    /// Satellites above the mask but hidden by the skyline.
    pub n_masked: usize,
    /// Satellites below the geometric horizon, left out of `satellites`.
    pub n_below_horizon: usize,
    /// Receiver-clock model.
    pub clock: ClockModel,
    /// Clock labels, in the order of the clock states.
    pub clock_labels: Vec<String>,
    /// State names, in the order of the matrix rows: `east`, `north`, `up`, then
    /// `clock:<label>` per clock.
    pub states: Vec<String>,
    /// DOP factors; `null` with fewer satellites in view than states or a singular geometry.
    pub dop: Option<DopFactors>,
    /// The unit-variance cofactor matrix `(HᵀH)⁻¹` in ENU (dimensionless); `null` with `dop`.
    pub cofactor_enu: Option<Vec<Vec<f64>>>,
    /// The covariance `σ²_UERE (HᵀH)⁻¹` (m²); `null` with `dop`.
    pub covariance_enu_m2: Option<Vec<Vec<f64>>>,
    /// The horizontal error ellipse at one sigma (confidence `1 - exp(-1/2)`).
    pub ellipse_1sigma: Option<ErrorEllipse>,
    /// The horizontal error ellipse at the requested confidence.
    pub ellipse: Option<ErrorEllipse>,
}

/// The chi-square two-degree-of-freedom scale `sqrt(-2 ln(1 - p))` of a 2-D Gaussian ellipse
/// holding probability `p`.
pub fn ellipse_scale(p: f64) -> f64 {
    (-2.0 * (1.0 - p).ln()).sqrt()
}

/// The error ellipse of a horizontal cofactor block `[[q_ee, q_en], [q_en, q_nn]]`.
pub fn ellipse(
    q_ee: f64,
    q_en: f64,
    q_nn: f64,
    sigma_uere_m: f64,
    confidence: f64,
) -> ErrorEllipse {
    let mean = 0.5 * (q_ee + q_nn);
    let half = (0.25 * (q_ee - q_nn) * (q_ee - q_nn) + q_en * q_en).sqrt();
    let l1 = (mean + half).max(0.0);
    let l2 = (mean - half).max(0.0);
    let k = ellipse_scale(confidence);
    let mut orient = (0.5 * (2.0 * q_en).atan2(q_nn - q_ee)).to_degrees();
    if orient < 0.0 {
        orient += 180.0;
    }
    if orient >= 180.0 {
        orient -= 180.0;
    }
    let se = q_ee.max(0.0).sqrt();
    let sn = q_nn.max(0.0).sqrt();
    ErrorEllipse {
        sigma_uere_m,
        confidence,
        scale_k: k,
        semi_major_m: k * sigma_uere_m * l1.sqrt(),
        semi_minor_m: k * sigma_uere_m * l2.sqrt(),
        orientation_deg: orient,
        sigma_east_m: sigma_uere_m * se,
        sigma_north_m: sigma_uere_m * sn,
        correlation_en: if se > 0.0 && sn > 0.0 {
            q_en / (se * sn)
        } else {
            0.0
        },
    }
}

/// Unit line of sight in ENU for an azimuth and elevation (deg).
pub fn los_enu(az_deg: f64, el_deg: f64) -> Vec3 {
    let (az, el) = (az_deg.to_radians(), el_deg.to_radians());
    [el.cos() * az.sin(), el.cos() * az.cos(), el.sin()]
}

fn site_geodetic(s: &Site) -> Result<Geodetic, String> {
    if !(s.lat_deg.is_finite() && s.lon_deg.is_finite() && s.height_m.is_finite())
        || s.lat_deg.abs() > 90.0
    {
        return Err("sky: site lat_deg must be in [-90, 90] and every field finite".into());
    }
    Ok(Geodetic {
        lat_rad: s.lat_deg.to_radians(),
        lon_rad: s.lon_deg.to_radians(),
        alt_m: s.height_m,
    })
}

/// A satellite resolved to look angles, before the cut is applied.
struct Look {
    id: String,
    system: String,
    az_deg: f64,
    el_deg: f64,
    mask_deg: f64,
}

fn build_system(spec: &SystemSpec) -> Result<crate::leo_fusion::system::System, String> {
    use crate::leo_fusion::system::SystemCfg;
    match spec {
        SystemSpec::Table(cfg) => cfg.build(),
        SystemSpec::Name(name) => {
            let gnss = SystemCfg {
                name: name.clone(),
                preset: Some(name.clone()),
                ..Default::default()
            };
            gnss.build().or_else(|e_gnss| {
                SystemCfg {
                    name: name.clone(),
                    leo_preset: Some(name.clone()),
                    ..Default::default()
                }
                .build()
                .map_err(|e_leo| {
                    format!(
                        "sky: \"{name}\" is neither a GNSS preset ({e_gnss}) nor a LEO preset ({e_leo})"
                    )
                })
            })
        }
    }
}

fn user_geodetic(req: &SkyRequest) -> Result<Option<Geodetic>, String> {
    let geo = req.site.as_ref().map(site_geodetic).transpose()?;
    match (geo, req.user_ecef_m) {
        (Some(_), Some(_)) => Err("sky: give the user as `site` or `user_ecef_m`, not both".into()),
        (Some(g), None) => Ok(Some(g)),
        (None, Some(r)) => {
            if !r.iter().all(|v| v.is_finite()) || r.iter().all(|v| *v == 0.0) {
                return Err("sky: user_ecef_m must be finite and not the geocentre".into());
            }
            Ok(Some(crate::frames::ecef_to_geodetic(r)))
        }
        (None, None) => Ok(None),
    }
}

fn direct_look(
    s: &SatelliteInput,
    i: usize,
    user: Option<Geodetic>,
    mask: f64,
) -> Result<Look, String> {
    let id = s.id.clone().unwrap_or_else(|| format!("{}", i + 1));
    let system =
        s.system
            .clone()
            .unwrap_or_else(|| match s.id.as_deref().and_then(|t| t.chars().next()) {
                Some(c) if c.is_ascii_alphabetic() => c.to_ascii_uppercase().to_string(),
                _ => "GNSS".to_string(),
            });
    let (az, el) = match (s.az_deg, s.el_deg, s.ecef_m) {
        (Some(az), Some(el), None) => {
            if !(az.is_finite() && el.is_finite() && (-90.0..=90.0).contains(&el)) {
                return Err(format!(
                    "sky: satellite {id}: azimuth/elevation out of range"
                ));
            }
            (crate::skyline::wrap_deg(az), el)
        }
        (None, None, Some(p)) => {
            let Some(g) = user else {
                return Err(format!(
                    "sky: satellite {id} is given in ECEF; the request needs `site` or `user_ecef_m`"
                ));
            };
            if !p.iter().all(|v| v.is_finite()) {
                return Err(format!("sky: satellite {id}: ECEF position not finite"));
            }
            let l = look_angles(g, p);
            if l.range_m == 0.0 {
                return Err(format!("sky: satellite {id} coincides with the user"));
            }
            (l.az_rad.to_degrees(), l.el_rad.to_degrees())
        }
        _ => {
            return Err(format!(
                "sky: satellite {id}: give az_deg and el_deg, or ecef_m, and nothing else"
            ))
        }
    };
    Ok(Look {
        id,
        system,
        az_deg: az,
        el_deg: el,
        mask_deg: mask,
    })
}

/// Where the satellites of a request came from, and what sky that makes.
struct Basis {
    /// The short code: `satellites`, `presets`, `tle-at-epoch` or `tle-at-element-epoch`,
    /// joined with `+` when a request mixes them.
    source: String,
    /// The plain-language statement of that sky.
    statement: String,
    /// The UTC instant the `tle` satellites were propagated to.
    epoch_utc: Option<String>,
    /// Element sets SGP4 refused at that instant, each with its reason.
    tle_skipped: Vec<String>,
}

/// The `tle` satellites above the horizon of `g`, the count below it, and the sky basis parts.
fn tle_looks(
    req: &SkyRequest,
    text: &str,
    g: Geodetic,
    t: f64,
) -> Result<(Vec<Look>, usize, Basis), String> {
    use crate::interop::UtcEpoch;
    use crate::jd2::Jd2;
    if text.len() > MAX_TLE_BYTES {
        return Err(format!(
            "sky: tle is {} bytes; the cap is {MAX_TLE_BYTES} (4 MiB)",
            text.len()
        ));
    }
    let system = req.tle_system.clone().unwrap_or_else(|| "TLE".to_string());
    let mut sets: Vec<(String, crate::sgp4::SgpOrbit)> = Vec::new();
    // Lines that were not used, each with its line number and why: reported in `tle_skipped`
    // with the propagation failures below (the first MAX_TLE_SKIPPED in all, then one count
    // last), never silently dropped.
    let mut ignored: Vec<String> = Vec::new();
    let mut n_ignored = 0usize;
    let mut ignore = |no: usize, why: &str, line: &str| {
        n_ignored += 1;
        if ignored.len() < MAX_TLE_SKIPPED {
            let head: String = line.chars().take(24).collect();
            ignored.push(format!("line {no}: {why} ({head:?})"));
        }
    };
    let mut name: Option<String> = None;
    let mut pending_l1: Option<(usize, &str)> = None;
    for (i, raw) in text.lines().enumerate() {
        let (no, line) = (i + 1, raw.trim());
        // An element-set line: "1 " or "2 " and the 69 columns of the format (63 at least
        // carry every field the propagator reads). Anything shorter that starts like one is
        // malformed, not a name line.
        let is_l1 = line.starts_with("1 ");
        let is_l2 = line.starts_with("2 ");
        if (is_l1 || is_l2) && line.len() < 63 {
            if let Some((n1, l1)) = pending_l1.take() {
                ignore(n1, "line 1 without its line 2", l1);
            }
            ignore(no, "malformed element-set line (too short)", line);
            name = None;
        } else if is_l1 {
            if let Some((n1, l1)) = pending_l1.replace((no, line)) {
                ignore(n1, "line 1 without its line 2", l1);
            }
        } else if is_l2 {
            let Some((n1, l1)) = pending_l1.take() else {
                ignore(no, "line 2 without its line 1", line);
                name = None;
                continue;
            };
            match crate::sgp4::SgpOrbit::from_tle(l1, line) {
                Ok(orbit) => {
                    let id = name.take().unwrap_or_else(|| {
                        format!("{system}-{}", l1.get(2..7).unwrap_or("?").trim())
                    });
                    sets.push((id, orbit));
                }
                Err(e) => {
                    ignore(n1, &format!("element set refused: {e}"), l1);
                    name = None;
                }
            }
        } else if !line.is_empty() {
            if let Some((n1, l1)) = pending_l1.take() {
                ignore(n1, "line 1 without its line 2", l1);
            }
            name = Some(line.trim_start_matches("0 ").to_string());
        }
    }
    if let Some((n1, l1)) = pending_l1 {
        ignore(n1, "line 1 without its line 2", l1);
    }
    if sets.is_empty() {
        return Err(match ignored.first() {
            Some(first) => format!(
                "sky: tle holds no complete two-line element set; {n_ignored} lines ignored, the \
                 first: {first}"
            ),
            None => "sky: tle holds no complete two-line element set".into(),
        });
    }
    let (jd0, dated) = match &req.epoch {
        Some(e) => (
            UtcEpoch::parse_iso(e)
                .map_err(|e| format!("sky: epoch: {e}"))?
                .jd_utc(0.0),
            true,
        ),
        None => (
            sets.iter()
                .map(|(_, o)| o.set.epoch_utc.total())
                .fold(f64::NEG_INFINITY, f64::max),
            false,
        ),
    };
    let at = Jd2::new(jd0).add_seconds(t);
    let iso = UtcEpoch::from_jd_utc(jd0).iso(t);
    let m = crate::sgp4::teme_to_itrs_matrix(at);
    let (mut out, mut below, mut skipped, mut n_skipped) = (Vec::new(), 0usize, ignored, n_ignored);
    for (id, o) in &sets {
        match o.itrs_state_with(at, &m) {
            Ok((pos, _)) => {
                let la = look_angles(g, pos);
                if la.el_rad < 0.0 {
                    below += 1;
                    continue;
                }
                out.push(Look {
                    id: id.clone(),
                    system: system.clone(),
                    az_deg: la.az_rad.to_degrees(),
                    el_deg: la.el_rad.to_degrees(),
                    mask_deg: req.mask_deg.unwrap_or(DEFAULT_MASK_DEG),
                });
            }
            Err(e) => {
                // Through the same cap as the unused lines, so the count stays last.
                n_skipped += 1;
                if skipped.len() < MAX_TLE_SKIPPED {
                    skipped.push(format!("{id}: {e}"));
                }
            }
        }
    }
    if n_skipped > skipped.len() {
        let more = n_skipped - skipped.len();
        skipped.push(format!("... and {more} more"));
    }
    let n = sets.len();
    let (source, statement) = if dated {
        (
            "tle-at-epoch",
            format!(
                "{n} element sets propagated by the engine's SGP4 (WGS-72) to {iso} and rotated to \
                 Earth-fixed with UT1 taken as UTC and no polar motion: the sky those element \
                 sets give at that epoch, not a measurement of it."
            ),
        )
    } else {
        (
            "tle-at-element-epoch",
            format!(
                "{n} element sets propagated by the engine's SGP4 (WGS-72) to the newest \
                 element set's epoch plus time_s ({iso}). No epoch was given, so this is a \
                 representative sky, not the sky of a stated date."
            ),
        )
    };
    Ok((
        out,
        below,
        Basis {
            source: source.into(),
            statement,
            epoch_utc: Some(iso),
            tle_skipped: skipped,
        },
    ))
}

fn looks(req: &SkyRequest) -> Result<(Vec<Look>, usize, Basis), String> {
    // An empty `systems` list is no systems: it adds no presets and no `presets` source.
    let systems = req.systems.as_ref().filter(|s| !s.is_empty());
    if systems.is_none() && req.satellites.is_none() && req.tle.is_none() {
        return Err("sky: give `systems` or `tle` (with a `site`), or `satellites`".into());
    }
    if req.tle.is_none() && req.tle_system.is_some() {
        return Err("sky: tle_system names the `tle` satellites; the request has no `tle`".into());
    }
    if req.tle.is_none() && req.epoch.is_some() {
        return Err(
            "sky: epoch dates the `tle` satellites; the preset `systems` and the satellites \
             given directly carry no date, so give `tle` with it"
                .into(),
        );
    }
    let mut parts: Vec<&str> = Vec::new();
    let mut statements: Vec<String> = Vec::new();
    let (mut epoch_utc, mut tle_skipped) = (None, Vec::new());
    let user = user_geodetic(req)?;
    if let Some(m) = req.mask_deg {
        if !(m.is_finite() && (-90.0..90.0).contains(&m)) {
            return Err(format!("sky: mask_deg must be in [-90, 90), got {m}"));
        }
    }
    let mut all = Vec::new();
    if let Some(systems) = systems {
        let Some(g) = user else {
            return Err("sky: `systems` needs a `site` (or `user_ecef_m`) to look from".into());
        };
        let t = req.time_s.unwrap_or(0.0);
        if !t.is_finite() {
            return Err("sky: time_s must be finite".into());
        }
        for spec in systems {
            // Refuse an oversized table before building it: a short request can ask for
            // millions of Walker satellites, and building them first would exhaust memory.
            if let SystemSpec::Table(cfg) = spec {
                let asked = cfg
                    .shell
                    .iter()
                    .fold(cfg.satellite.len(), |n, sh| n.saturating_add(sh.total));
                if all.len().saturating_add(asked) > MAX_SATELLITES {
                    return Err(format!(
                        "sky: system \"{}\" asks for {asked} satellites; a request holds at most \
                         {MAX_SATELLITES}",
                        cfg.name
                    ));
                }
            }
            let sys = build_system(spec)?;
            let mask = req.mask_deg.unwrap_or(sys.mask_deg);
            for (j, o) in sys.orbits.iter().enumerate() {
                let (pos, _) = o.state(t);
                let la = look_angles(g, pos);
                all.push(Look {
                    id: format!("{}-{}", sys.name, j + 1),
                    system: sys.name.clone(),
                    az_deg: la.az_rad.to_degrees(),
                    el_deg: la.el_rad.to_degrees(),
                    mask_deg: mask,
                });
            }
            if all.len() > MAX_SATELLITES {
                return Err(format!("sky: more than {MAX_SATELLITES} satellites"));
            }
        }
        parts.push("presets");
        statements.push(
            "The preset constellations' relative phases come from different reference \
             epochs: a representative geometry, not the sky of a date at a place."
                .into(),
        );
    }
    let mut below = 0usize;
    if let Some(text) = &req.tle {
        let Some(g) = user else {
            return Err("sky: `tle` needs a `site` (or `user_ecef_m`) to look from".into());
        };
        let t = req.time_s.unwrap_or(0.0);
        if !t.is_finite() {
            return Err("sky: time_s must be finite".into());
        }
        let (mut l, b, basis) = tle_looks(req, text, g, t)?;
        if all.len() + l.len() > MAX_SATELLITES {
            return Err(format!(
                "sky: more than {MAX_SATELLITES} satellites above the horizon"
            ));
        }
        all.append(&mut l);
        below += b;
        parts.push(if basis.source == "tle-at-epoch" {
            "tle-at-epoch"
        } else {
            "tle-at-element-epoch"
        });
        statements.push(basis.statement);
        epoch_utc = basis.epoch_utc;
        tle_skipped = basis.tle_skipped;
    }
    if let Some(sats) = &req.satellites {
        if all.len() + sats.len() > MAX_SATELLITES {
            return Err(format!("sky: more than {MAX_SATELLITES} satellites"));
        }
        let mask = req.mask_deg.unwrap_or(DEFAULT_MASK_DEG);
        for (i, s) in sats.iter().enumerate() {
            all.push(direct_look(s, i, user, mask)?);
        }
    }
    if req.satellites.is_some() {
        parts.push("satellites");
        statements.push("Satellites given directly, as stated by the request.".into());
    }
    below += all.iter().filter(|l| l.el_deg < 0.0).count();
    all.retain(|l| l.el_deg >= 0.0);
    Ok((
        all,
        below,
        Basis {
            source: parts.join("+"),
            statement: statements.join(" "),
            epoch_utc,
            tle_skipped,
        },
    ))
}

fn sigma_and_confidence(req: &SkyRequest) -> Result<(f64, f64), String> {
    let sigma = req.sigma_uere_m.unwrap_or(crate::orbit::DEFAULT_UERE_M);
    if !(sigma.is_finite() && sigma > 0.0) {
        return Err(format!("sky: sigma_uere_m must be positive, got {sigma}"));
    }
    let confidence = req.confidence.unwrap_or(DEFAULT_CONFIDENCE);
    if !(confidence.is_finite() && confidence > 0.0 && confidence < 1.0) {
        return Err(format!(
            "sky: confidence must be in (0, 1), got {confidence}"
        ));
    }
    Ok((sigma, confidence))
}

/// The visible set, the clock assignment and the cofactor matrix shared by
/// [`sky_geometry`] and [`sky_monte_carlo`].
struct Solved {
    basis: Basis,
    sky: Option<Skyline>,
    looks: Vec<SatelliteLook>,
    below: usize,
    clock_labels: Vec<String>,
    los: Vec<Vec3>,
    clock_idx: Vec<usize>,
    q: Option<Vec<Vec<f64>>>,
}

fn solve(req: &SkyRequest) -> Result<Solved, String> {
    let sky = crate::skyline::resolve(req.skyline.as_ref())?;
    let (raw, below, basis) = looks(req)?;
    let looks: Vec<SatelliteLook> = raw
        .into_iter()
        .map(|l| {
            let (cut, visible, masked) = match &sky {
                None => (l.mask_deg, l.el_deg >= l.mask_deg, false),
                Some(s) => (
                    s.effective_cut_deg(l.az_deg, l.mask_deg),
                    s.visible(l.az_deg, l.el_deg, l.mask_deg),
                    s.masked(l.az_deg, l.el_deg, l.mask_deg),
                ),
            };
            SatelliteLook {
                id: l.id,
                system: l.system,
                az_deg: l.az_deg,
                el_deg: l.el_deg,
                cut_deg: cut,
                visible,
                masked,
            }
        })
        .collect();
    let visible: Vec<&SatelliteLook> = looks.iter().filter(|l| l.visible).collect();
    let mut clock_labels: Vec<String> = Vec::new();
    let mut clock_idx = Vec::with_capacity(visible.len());
    match req.clock {
        ClockModel::Common => {
            clock_labels.push("common".into());
            clock_idx.resize(visible.len(), 0);
        }
        ClockModel::PerSystem => {
            for l in &visible {
                let k = match clock_labels.iter().position(|c| *c == l.system) {
                    Some(k) => k,
                    None => {
                        if clock_labels.len() == MAX_CLOCKS {
                            return Err(format!(
                                "sky: more than {MAX_CLOCKS} systems in view, each with its own \
                                 clock; group satellites under fewer `system` labels or use \
                                 clock = \"common\""
                            ));
                        }
                        clock_labels.push(l.system.clone());
                        clock_labels.len() - 1
                    }
                };
                clock_idx.push(k);
            }
            if clock_labels.is_empty() {
                clock_labels.push("common".into());
            }
        }
    }
    let los: Vec<Vec3> = visible
        .iter()
        .map(|l| los_enu(l.az_deg, l.el_deg))
        .collect();
    let q = crate::orbit::cofactor_from_los(&los, &clock_idx, clock_labels.len());
    Ok(Solved {
        basis,
        sky,
        looks,
        below,
        clock_labels,
        los,
        clock_idx,
        q,
    })
}

/// `sky_geometry`: the snapshot of a [`SkyRequest`]. See the module documentation.
pub fn sky_geometry(req: &SkyRequest) -> Result<SkyGeometry, String> {
    let (sigma, confidence) = sigma_and_confidence(req)?;
    let s = solve(req)?;
    let mut states: Vec<String> = vec!["east".into(), "north".into(), "up".into()];
    states.extend(s.clock_labels.iter().map(|c| format!("clock:{c}")));
    let (dop, cov, e1, e) = match &s.q {
        Some(q) => {
            let n = q.len();
            let trace: f64 = (0..n).map(|i| q[i][i]).sum();
            let tdops: Vec<f64> = (3..n).map(|i| q[i][i].max(0.0).sqrt()).collect();
            let d = DopFactors {
                gdop: trace.max(0.0).sqrt(),
                pdop: (q[0][0] + q[1][1] + q[2][2]).max(0.0).sqrt(),
                hdop: (q[0][0] + q[1][1]).max(0.0).sqrt(),
                vdop: q[2][2].max(0.0).sqrt(),
                tdop: tdops[0],
                tdop_by_clock: tdops,
            };
            let cov: Vec<Vec<f64>> = q
                .iter()
                .map(|r| r.iter().map(|v| v * sigma * sigma).collect())
                .collect();
            let one_sigma = 1.0 - (-0.5f64).exp();
            (
                Some(d),
                Some(cov),
                Some(ellipse(q[0][0], q[0][1], q[1][1], sigma, one_sigma)),
                Some(ellipse(q[0][0], q[0][1], q[1][1], sigma, confidence)),
            )
        }
        None => (None, None, None, None),
    };
    let n_visible = s.looks.iter().filter(|l| l.visible).count();
    let n_masked = s.looks.iter().filter(|l| l.masked).count();
    let open_fraction = s
        .sky
        .unwrap_or_default()
        .open_fraction_above(req.mask_deg.unwrap_or(0.0));
    Ok(SkyGeometry {
        label: LABEL,
        statement: STATEMENT,
        advisory: ADVISORY,
        sky_source: s.basis.source,
        sky_statement: s.basis.statement,
        epoch_utc: s.basis.epoch_utc,
        tle_skipped: s.basis.tle_skipped,
        skyline_source: req
            .skyline
            .as_ref()
            .map_or_else(|| "none".to_string(), SkylineCfg::source),
        open_fraction,
        satellites: s.looks,
        n_visible,
        n_masked,
        n_below_horizon: s.below,
        clock: req.clock,
        clock_labels: s.clock_labels,
        states,
        dop,
        cofactor_enu: s.q,
        covariance_enu_m2: cov,
        ellipse_1sigma: e1,
        ellipse: e,
    })
}

/// The result of [`sky_monte_carlo`].
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct SkyMonteCarlo {
    /// Evidence label ([`LABEL`]).
    pub label: &'static str,
    /// What the result is and is not ([`STATEMENT`]).
    pub statement: &'static str,
    /// The advisory statement ([`ADVISORY`]).
    pub advisory: &'static str,
    /// Where the satellites came from (as [`SkyGeometry::sky_source`]).
    pub sky_source: String,
    /// What that sky is, in words.
    pub sky_statement: String,
    /// The UTC instant the `tle` satellites were propagated to; absent without `tle`.
    #[serde(skip_serializing_if = "Option::is_none")]
    pub epoch_utc: Option<String>,
    /// The seed of the range-error draws.
    pub seed: u64,
    /// Samples drawn.
    pub n: usize,
    /// 1-sigma UERE of the draws (m).
    pub sigma_uere_m: f64,
    /// East, north, up position errors (m), one row per sample.
    pub samples_enu_m: Vec<[f64; 3]>,
    /// Empirical covariance of the samples about zero (m², ENU).
    pub empirical_covariance_enu_m2: [[f64; 3]; 3],
    /// Empirical horizontal RMS error (m).
    pub rms_horizontal_m: f64,
    /// Empirical 3-D RMS error (m).
    pub rms_3d_m: f64,
    /// `σ_UERE × HDOP`: the horizontal RMS the geometry predicts (m).
    pub predicted_rms_horizontal_m: f64,
    /// `σ_UERE × PDOP`: the 3-D RMS the geometry predicts (m).
    pub predicted_rms_3d_m: f64,
    /// Fraction of samples inside the 95 % horizontal ellipse.
    pub fraction_inside_95: f64,
}

/// `sky_monte_carlo`: `n` least-squares position errors under independent Gaussian range
/// errors of `σ_UERE` on the visible set of `req`, drawn from a ChaCha8 stream seeded by
/// `seed` (so the same request, seed and `n` give the same cloud). `n` is capped at
/// [`MAX_MC_SAMPLES`].
pub fn sky_monte_carlo(req: &SkyRequest, seed: u64, n: usize) -> Result<SkyMonteCarlo, String> {
    use rand::SeedableRng;
    use rand_distr::{Distribution, Normal};
    if n == 0 || n > MAX_MC_SAMPLES {
        return Err(format!("sky: n must be in 1..={MAX_MC_SAMPLES}, got {n}"));
    }
    let (sigma, _) = sigma_and_confidence(req)?;
    let s = solve(req)?;
    let q =
        s.q.as_ref()
            .ok_or("sky: too few satellites in view for a fix; no Monte Carlo cloud")?;
    let states = q.len();
    let m = s.los.len();
    // S = Q Hᵀ, with H's rows [-e, one-hot clock]: the least-squares map from range errors to
    // state errors. Only its position rows are needed.
    let h: Vec<Vec<f64>> = (0..m)
        .map(|k| {
            let mut r = vec![0.0; states];
            r[0] = -s.los[k][0];
            r[1] = -s.los[k][1];
            r[2] = -s.los[k][2];
            r[3 + s.clock_idx[k]] = 1.0;
            r
        })
        .collect();
    let smat: Vec<Vec<f64>> = (0..3)
        .map(|i| {
            h.iter()
                .map(|hk| (0..states).map(|j| q[i][j] * hk[j]).sum())
                .collect()
        })
        .collect();
    let noise = Normal::new(0.0, sigma).map_err(|e| format!("sky: {e}"))?;
    let mut rng = rand_chacha::ChaCha8Rng::seed_from_u64(seed);
    let (qee, qen, qnn) = (q[0][0], q[0][1], q[1][1]);
    let det = qee * qnn - qen * qen;
    let k95 = ellipse_scale(0.95);
    let mut samples = Vec::with_capacity(n);
    let mut cov = [[0.0_f64; 3]; 3];
    let mut inside = 0usize;
    for _ in 0..n {
        let eps: Vec<f64> = (0..m).map(|_| noise.sample(&mut rng)).collect();
        let dx: [f64; 3] = [0, 1, 2].map(|i| smat[i].iter().zip(&eps).map(|(a, b)| a * b).sum());
        for (i, row) in cov.iter_mut().enumerate() {
            for (j, c) in row.iter_mut().enumerate() {
                *c += dx[i] * dx[j];
            }
        }
        if det > 0.0 {
            let (e, nn) = (dx[0] / sigma, dx[1] / sigma);
            let d2 = (qnn * e * e - 2.0 * qen * e * nn + qee * nn * nn) / det;
            if d2 <= k95 * k95 {
                inside += 1;
            }
        }
        samples.push(dx);
    }
    for row in cov.iter_mut() {
        for c in row.iter_mut() {
            *c /= n as f64;
        }
    }
    Ok(SkyMonteCarlo {
        label: LABEL,
        statement: STATEMENT,
        advisory: ADVISORY,
        sky_source: s.basis.source,
        sky_statement: s.basis.statement,
        epoch_utc: s.basis.epoch_utc,
        seed,
        n,
        sigma_uere_m: sigma,
        samples_enu_m: samples,
        rms_horizontal_m: (cov[0][0] + cov[1][1]).sqrt(),
        rms_3d_m: (cov[0][0] + cov[1][1] + cov[2][2]).sqrt(),
        empirical_covariance_enu_m2: cov,
        predicted_rms_horizontal_m: sigma * (q[0][0] + q[1][1]).max(0.0).sqrt(),
        predicted_rms_3d_m: sigma * (q[0][0] + q[1][1] + q[2][2]).max(0.0).sqrt(),
        fraction_inside_95: inside as f64 / n as f64,
    })
}

/// A skyline section reduced to what the engine uses.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct SkylineProfile {
    /// `preset:<name>`, `preset:<name>+overrides` or `custom`.
    pub source: String,
    /// Provenance line.
    pub provenance: String,
    /// The cut (deg) at every whole degree of azimuth from north: 360 entries.
    pub table: Vec<f64>,
    /// Fraction of the upper hemisphere above the skyline alone.
    pub open_fraction: f64,
}

/// `skyline_profile`: a skyline section (canyon, table, sectors, terrain, preset) reduced to
/// the normalised 360-entry table, so a page draws exactly what the engine will use.
pub fn skyline_profile(cfg: &SkylineCfg) -> Result<SkylineProfile, String> {
    let sky = cfg.build()?;
    Ok(SkylineProfile {
        source: cfg.source(),
        provenance: cfg.provenance(),
        table: sky.profile(),
        open_fraction: sky.open_fraction(),
    })
}

/// `skyline_presets`: every named preset with its table and provenance.
pub fn skyline_presets() -> Vec<crate::skyline::PresetInfo> {
    crate::skyline::preset_list()
}

fn xml_escape(s: &str) -> String {
    s.replace('&', "&amp;")
        .replace('<', "&lt;")
        .replace('>', "&gt;")
        .replace('"', "&quot;")
        .replace('\'', "&#39;")
}

/// `skyplot_svg`: the snapshot of `req` as an SVG skyplot: azimuth around (north up, east
/// right), elevation inward (the horizon at the rim, the zenith at the centre), the sky the
/// skyline hides shaded, satellites coloured by system and hollow when not in view. Static
/// markup only: no script, no external reference, every input string escaped.
pub fn skyplot_svg(req: &SkyRequest) -> Result<String, String> {
    use crate::palette::chart::{AXIS, BG, FONT_SANS, INK_3, MUTED, SERIES, TEXT, TITLE};
    let g = sky_geometry(req)?;
    let sky = crate::skyline::resolve(req.skyline.as_ref())?;
    let (w, h) = (560.0_f64, 600.0_f64);
    let (cx, cy, r) = (280.0_f64, 300.0_f64, 230.0_f64);
    let xy = |az: f64, el: f64| -> (f64, f64) {
        let rr = r * (90.0 - el.clamp(0.0, 90.0)) / 90.0;
        let a = az.to_radians();
        (cx + rr * a.sin(), cy - rr * a.cos())
    };
    let mut out = format!(
        "<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"{w}\" height=\"{h}\" viewBox=\"0 0 {w} {h}\" \
         font-family=\"{FONT_SANS}\" font-size=\"12\" fill=\"{TEXT}\">\
         <rect width=\"{w}\" height=\"{h}\" fill=\"{BG}\"/>\
         <text x=\"20\" y=\"28\" font-size=\"15\" font-weight=\"bold\" fill=\"{TITLE}\">Skyplot ({LABEL})</text>"
    );
    if let Some(sk) = &sky {
        // The whole disc shaded, then the open sky (inside the skyline polygon) cut back out.
        let mut pts = String::new();
        for i in 0..360 {
            let az = i as f64;
            let (x, y) = xy(az, sk.cut_deg(az));
            pts.push_str(&format!("{x:.2},{y:.2} "));
        }
        out.push_str(&format!(
            "<circle cx=\"{cx}\" cy=\"{cy}\" r=\"{r}\" fill=\"{INK_3}\" fill-opacity=\"0.35\"/>\
             <polygon points=\"{}\" fill=\"{BG}\" stroke=\"{MUTED}\" stroke-width=\"1.2\"/>",
            pts.trim_end()
        ));
    }
    for el in [0.0_f64, 30.0, 60.0] {
        let rr = r * (90.0 - el) / 90.0;
        out.push_str(&format!(
            "<circle cx=\"{cx}\" cy=\"{cy}\" r=\"{rr:.2}\" fill=\"none\" stroke=\"{AXIS}\"/>\
             <text x=\"{:.2}\" y=\"{:.2}\" fill=\"{MUTED}\" font-size=\"10\">{el:.0}°</text>",
            cx + 3.0,
            cy - rr - 3.0
        ));
    }
    for (az, lab) in [(0.0_f64, "N"), (90.0, "E"), (180.0, "S"), (270.0, "W")] {
        let a = az.to_radians();
        let (x, y) = (cx + 1.07 * r * a.sin(), cy - 1.07 * r * a.cos());
        out.push_str(&format!(
            "<text x=\"{x:.2}\" y=\"{:.2}\" text-anchor=\"middle\" fill=\"{MUTED}\">{lab}</text>",
            y + 4.0
        ));
    }
    let mut systems: Vec<&str> = Vec::new();
    for s in &g.satellites {
        if !systems.contains(&s.system.as_str()) {
            systems.push(&s.system);
        }
    }
    for s in &g.satellites {
        let k = systems.iter().position(|x| *x == s.system).unwrap_or(0);
        let colour = SERIES[k % SERIES.len()];
        let (x, y) = xy(s.az_deg, s.el_deg);
        let fill = if s.visible { colour } else { "none" };
        let why = if s.masked {
            " (hidden by the skyline)"
        } else if s.visible {
            ""
        } else {
            " (below the mask)"
        };
        out.push_str(&format!(
            "<circle cx=\"{x:.2}\" cy=\"{y:.2}\" r=\"5\" fill=\"{fill}\" stroke=\"{colour}\" stroke-width=\"1.5\">\
             <title>{} {} az {:.1} el {:.1}{why}</title></circle>",
            xml_escape(&s.system),
            xml_escape(&s.id),
            s.az_deg,
            s.el_deg,
        ));
    }
    for (k, name) in systems.iter().enumerate() {
        let colour = SERIES[k % SERIES.len()];
        let x = 20.0 + 110.0 * k as f64;
        out.push_str(&format!(
            "<circle cx=\"{:.1}\" cy=\"560\" r=\"5\" fill=\"{colour}\"/>\
             <text x=\"{:.1}\" y=\"564\">{}</text>",
            x + 5.0,
            x + 14.0,
            xml_escape(name)
        ));
    }
    let dop = g
        .dop
        .as_ref()
        .map(|d| format!("PDOP {:.2} HDOP {:.2} VDOP {:.2}", d.pdop, d.hdop, d.vdop))
        .unwrap_or_else(|| "no fix".into());
    out.push_str(&format!(
        "<text x=\"20\" y=\"50\" fill=\"{MUTED}\" font-size=\"11\">{} in view, {} hidden by the \
         skyline · {dop} · hollow: not in view</text>",
        g.n_visible, g.n_masked
    ));
    // The sky's basis, from engine-made strings only (the epoch is formatted here).
    let basis = match (&g.epoch_utc, g.sky_source.contains("tle-at-epoch")) {
        (Some(e), true) => format!("TLE sky at {e}, not a measurement"),
        _ if g.sky_source == "satellites" => "satellites as given".to_string(),
        _ => "representative sky, not a dated one".to_string(),
    };
    out.push_str(&format!(
        "<text x=\"20\" y=\"590\" fill=\"{MUTED}\" font-size=\"10\">{basis}</text>"
    ));
    out.push_str(&format!(
        "<text x=\"{:.1}\" y=\"590\" text-anchor=\"end\" fill=\"{MUTED}\" font-size=\"10\">Kshana v{} \
         · geometry under a stated error model · kshana.dev</text></svg>",
        w - 10.0,
        env!("CARGO_PKG_VERSION")
    ));
    Ok(out)
}

/// Parse a request from JSON (text starting with `{`) or TOML.
pub fn parse_request(text: &str) -> Result<SkyRequest, String> {
    if text.trim_start().starts_with('{') {
        serde_json::from_str(text).map_err(|e| format!("invalid sky request (JSON): {e}"))
    } else {
        toml::from_str(text).map_err(|e| format!("invalid sky request (TOML): {e}"))
    }
}

/// Parse a skyline section from JSON or TOML text.
pub fn parse_skyline(text: &str) -> Result<SkylineCfg, String> {
    if text.trim_start().starts_with('{') {
        serde_json::from_str(text).map_err(|e| format!("invalid skyline (JSON): {e}"))
    } else {
        toml::from_str(text).map_err(|e| format!("invalid skyline (TOML): {e}"))
    }
}

fn to_json<T: Serialize>(v: &T) -> Result<String, String> {
    serde_json::to_string_pretty(v).map_err(|e| e.to_string())
}

/// Text in, JSON out: [`sky_geometry`].
pub fn sky_geometry_json(text: &str) -> Result<String, String> {
    to_json(&sky_geometry(&parse_request(text)?)?)
}

/// Text in, JSON out: [`sky_monte_carlo`].
pub fn sky_monte_carlo_json(text: &str, seed: u64, n: usize) -> Result<String, String> {
    to_json(&sky_monte_carlo(&parse_request(text)?, seed, n)?)
}

/// JSON out: [`skyline_presets`].
pub fn skyline_presets_json() -> String {
    to_json(&skyline_presets()).unwrap_or_else(|_| "[]".into())
}

/// Text in, JSON out: [`skyline_profile`].
pub fn skyline_profile_json(text: &str) -> Result<String, String> {
    to_json(&skyline_profile(&parse_skyline(text)?)?)
}

/// Text in, SVG out: [`skyplot_svg`].
pub fn skyplot_svg_text(text: &str) -> Result<String, String> {
    skyplot_svg(&parse_request(text)?)
}

/// The ECEF position (m) of a site.
pub fn site_ecef(site: &Site) -> Result<Vec3, String> {
    Ok(geodetic_to_ecef(site_geodetic(site)?))
}

#[cfg(test)]
mod tests {
    use super::*;

    fn sat(id: &str, az: f64, el: f64) -> SatelliteInput {
        SatelliteInput {
            id: Some(id.into()),
            az_deg: Some(az),
            el_deg: Some(el),
            ..Default::default()
        }
    }

    fn close(a: f64, b: f64, tol: f64) -> bool {
        (a - b).abs() <= tol * (1.0 + b.abs())
    }

    fn six() -> Vec<SatelliteInput> {
        vec![
            sat("G01", 0.0, 90.0),
            sat("G02", 0.0, 15.0),
            sat("G03", 90.0, 15.0),
            sat("G04", 180.0, 15.0),
            sat("G05", 270.0, 15.0),
            sat("G06", 45.0, 45.0),
        ]
    }

    fn common(sats: Vec<SatelliteInput>) -> SkyRequest {
        SkyRequest {
            satellites: Some(sats),
            mask_deg: Some(0.0),
            clock: ClockModel::Common,
            ..Default::default()
        }
    }

    #[test]
    fn ellipse_of_an_analytic_two_by_two_case() {
        // Q_h = [[3, 1], [1, 3]]: eigenvalues 4 and 2, major axis along azimuth 45 deg.
        let p = 1.0 - (-0.5f64).exp();
        let e = ellipse(3.0, 1.0, 3.0, 2.0, p);
        assert!(close(e.scale_k, 1.0, 1e-12));
        assert!(close(e.semi_major_m, 4.0, 1e-12));
        assert!(close(e.semi_minor_m, 2.0 * 2f64.sqrt(), 1e-12));
        assert!(close(e.orientation_deg, 45.0, 1e-12));
        assert!(close(e.correlation_en, 1.0 / 3.0, 1e-12));
        assert!(close(
            ellipse(3.0, -1.0, 3.0, 1.0, p).orientation_deg,
            135.0,
            1e-12
        ));
        assert!(close(
            ellipse(4.0, 0.0, 1.0, 1.0, p).orientation_deg,
            90.0,
            1e-12
        ));
        assert!(close(
            ellipse(1.0, 0.0, 4.0, 1.0, p).orientation_deg,
            0.0,
            1e-12
        ));
        // The design note's 95 % scale sqrt(5.991) = 2.448.
        assert!(close(ellipse_scale(0.95), 2.447_746_830_680_816, 1e-12));
    }

    #[test]
    fn sky_geometry_equals_orbit_dop_on_the_same_visible_set() {
        let req = common(six());
        let g = sky_geometry(&req).unwrap();
        let d = g.dop.unwrap();
        let user = [1.2e6, -4.0e6, 4.7e6];
        let (e, n, u) = crate::orbit::enu_basis(user).unwrap();
        let sats: Vec<Vec3> = req
            .satellites
            .as_ref()
            .unwrap()
            .iter()
            .map(|s| {
                let l = los_enu(s.az_deg.unwrap(), s.el_deg.unwrap());
                [0, 1, 2].map(|i| user[i] + 2.0e7 * (l[0] * e[i] + l[1] * n[i] + l[2] * u[i]))
            })
            .collect();
        let c = crate::orbit::dop_cov(user, &sats).unwrap();
        let o = c.dop;
        assert_eq!(
            Some(o),
            crate::orbit::dop(user, &sats),
            "dop is dop_cov's reduction"
        );
        for (a, b) in [
            (d.gdop, o.gdop),
            (d.pdop, o.pdop),
            (d.hdop, o.hdop),
            (d.vdop, o.vdop),
            (d.tdop, o.tdop),
        ] {
            assert!(close(a, b, 1e-9), "{a} vs {b}");
        }
        let q = g.cofactor_enu.unwrap();
        for (i, row) in c.q_enu.iter().enumerate() {
            for (j, v) in row.iter().enumerate() {
                assert!(
                    (q[i][j] - v).abs() < 1e-9,
                    "dop_cov ENU block = API cofactor"
                );
            }
        }
        // dop_cov reduces to the five scalars to 1e-12.
        let qe = c.q_enu;
        assert!(close((qe[0][0] + qe[1][1]).sqrt(), o.hdop, 1e-12));
        assert!(close(qe[2][2].sqrt(), o.vdop, 1e-12));
        assert!(close(
            (qe[0][0] + qe[1][1] + qe[2][2]).sqrt(),
            o.pdop,
            1e-12
        ));
        assert!(close(c.q[3][3].sqrt(), o.tdop, 1e-12));
        for (i, row) in q.iter().enumerate() {
            for (j, v) in row.iter().enumerate() {
                assert!((v - q[j][i]).abs() < 1e-12, "cofactor symmetric");
            }
        }
    }

    #[test]
    fn the_skyline_hides_satellites_and_counts_them_as_masked() {
        let mut req = common(six());
        req.mask_deg = Some(5.0);
        req.skyline = Some(SkylineCfg {
            sectors: Some(vec![crate::skyline::Sector {
                az_from: 80.0,
                az_to: 100.0,
                el_deg: 30.0,
            }]),
            ..Default::default()
        });
        let g = sky_geometry(&req).unwrap();
        assert_eq!((g.n_visible, g.n_masked), (5, 1));
        let g03 = g.satellites.iter().find(|s| s.id == "G03").unwrap();
        assert!(!g03.visible && g03.masked);
        assert_eq!(g03.cut_deg, 30.0);
        let open = sky_geometry(&SkyRequest {
            skyline: None,
            ..req.clone()
        })
        .unwrap();
        assert!(g.dop.unwrap().hdop > open.dop.unwrap().hdop);
        assert_eq!(g.skyline_source, "custom");
    }

    #[test]
    fn one_clock_per_system_adds_a_state_and_costs_geometry() {
        let mut sats = six();
        sats.push(sat("E11", 225.0, 30.0));
        sats.push(sat("E12", 315.0, 60.0));
        let c = sky_geometry(&common(sats.clone())).unwrap();
        let p = sky_geometry(&SkyRequest {
            satellites: Some(sats),
            mask_deg: Some(0.0),
            ..Default::default()
        })
        .unwrap();
        assert_eq!(p.clock, ClockModel::PerSystem);
        assert_eq!(p.clock_labels, ["G", "E"]);
        assert_eq!(p.states.len(), 5);
        assert_eq!(p.dop.as_ref().unwrap().tdop_by_clock.len(), 2);
        assert!(p.dop.unwrap().pdop >= c.dop.unwrap().pdop - 1e-12);
    }

    #[test]
    fn presets_propagate_and_are_seen_from_a_site() {
        let req: SkyRequest = serde_json::from_str(
            r#"{"site": {"lat_deg": 59.4, "lon_deg": 24.7, "height_m": 30},
                "time_s": 3600, "systems": ["gps-baseline", "galileo"],
                "skyline": {"preset": "container-terminal"}, "sigma_uere_m": 1.5}"#,
        )
        .unwrap();
        let g = sky_geometry(&req).unwrap();
        assert_eq!(g.clock_labels.len(), 2);
        assert!(g.n_visible >= 4, "{}", g.n_visible);
        assert!(g.n_masked > 0);
        assert!(g.satellites.iter().all(|s| s.el_deg >= 0.0));
        assert!(g.ellipse.is_some());
        assert_eq!(g.advisory, crate::receiver_trust::ADVISORY);
        // The skyline only ever removes satellites.
        let open = sky_geometry(&SkyRequest {
            skyline: None,
            ..req.clone()
        })
        .unwrap();
        assert_eq!(open.n_visible, g.n_visible + g.n_masked);
        let leo: SkyRequest = serde_json::from_str(
            r#"{"site": {"lat_deg": 59.4, "lon_deg": 24.7}, "systems": ["xona-pulsar"]}"#,
        )
        .unwrap();
        assert!(!sky_geometry(&leo).unwrap().satellites.is_empty());
        let bad: SkyRequest =
            serde_json::from_str(r#"{"site": {"lat_deg": 1, "lon_deg": 2}, "systems": ["nope"]}"#)
                .unwrap();
        assert!(sky_geometry(&bad).unwrap_err().contains("neither"));
    }

    #[test]
    fn ecef_input_matches_azimuth_elevation_input() {
        let site = Site {
            lat_deg: 59.4,
            lon_deg: 24.7,
            height_m: 30.0,
        };
        let geo = site_geodetic(&site).unwrap();
        let r0 = geodetic_to_ecef(geo);
        let (sl, cl) = geo.lat_rad.sin_cos();
        let (so, co) = geo.lon_rad.sin_cos();
        let to_ecef = |l: Vec3| -> Vec3 {
            let e = [-so, co, 0.0];
            let n = [-sl * co, -sl * so, cl];
            let u = [cl * co, cl * so, sl];
            [0, 1, 2].map(|i| r0[i] + 2.2e7 * (l[0] * e[i] + l[1] * n[i] + l[2] * u[i]))
        };
        let azel = six();
        let ecef: Vec<SatelliteInput> = azel
            .iter()
            .map(|s| SatelliteInput {
                id: s.id.clone(),
                ecef_m: Some(to_ecef(los_enu(s.az_deg.unwrap(), s.el_deg.unwrap()))),
                ..Default::default()
            })
            .collect();
        let a = sky_geometry(&common(azel)).unwrap();
        let b = sky_geometry(&SkyRequest {
            site: Some(site),
            ..common(ecef)
        })
        .unwrap();
        let (da, db) = (a.dop.unwrap(), b.dop.unwrap());
        assert!(close(da.pdop, db.pdop, 1e-9));
        assert!(close(da.hdop, db.hdop, 1e-9));
    }

    #[test]
    fn monte_carlo_is_seeded_and_agrees_with_the_geometry() {
        let mut req = common(six());
        req.sigma_uere_m = Some(2.0);
        let a = sky_monte_carlo(&req, 36, 4000).unwrap();
        let b = sky_monte_carlo(&req, 36, 4000).unwrap();
        assert_eq!(a, b, "same request, seed and n give the same cloud");
        assert_ne!(
            sky_monte_carlo(&req, 37, 4000).unwrap().samples_enu_m,
            a.samples_enu_m
        );
        // 4000 draws: the empirical RMS within 6 % of sigma x DOP, and the fraction inside
        // the 95 % ellipse within five binomial standard errors of 0.95.
        assert!((a.rms_horizontal_m / a.predicted_rms_horizontal_m - 1.0).abs() < 0.06);
        assert!((a.rms_3d_m / a.predicted_rms_3d_m - 1.0).abs() < 0.06);
        let se = (0.95f64 * 0.05 / 4000.0).sqrt();
        assert!(
            (a.fraction_inside_95 - 0.95).abs() < 5.0 * se,
            "{}",
            a.fraction_inside_95
        );
        assert!(sky_monte_carlo(&req, 1, MAX_MC_SAMPLES + 1).is_err());
        assert!(sky_monte_carlo(&common(six()[..3].to_vec()), 1, 10).is_err());
    }

    #[test]
    fn profile_presets_and_skyplot() {
        let p = skyline_profile(&parse_skyline("preset = \"city-street\"\n").unwrap()).unwrap();
        assert_eq!(p.table.len(), 360);
        assert!(close(
            p.table[90],
            (28.5f64 / 10.0).atan().to_degrees(),
            1e-12
        ));
        assert_eq!(skyline_presets().len(), 4);
        let list: serde_json::Value = serde_json::from_str(&skyline_presets_json()).unwrap();
        assert_eq!(list[0]["label"], "REPRESENTATIVE");
        let mut req = common(six());
        req.skyline = Some(parse_skyline("{\"preset\": \"container-terminal\"}").unwrap());
        req.satellites.as_mut().unwrap()[0].id = Some("<script>".into());
        let svg = skyplot_svg(&req).unwrap();
        assert!(svg.starts_with("<svg") && svg.ends_with("</svg>"));
        assert!(!svg.contains("<script"), "ids are escaped");
        assert!(svg.contains("&lt;script&gt;"));
        assert!(!svg.contains("href"), "no external reference");
    }

    #[test]
    fn requests_are_checked() {
        assert!(sky_geometry(&SkyRequest::default()).is_err());
        let r = parse_request("{\"satellites\":[{\"az_deg\":0,\"el_deg\":10,\"ecef_m\":[1,2,3]}]}")
            .unwrap();
        assert!(sky_geometry(&r).unwrap_err().contains("nothing else"));
        let few = sky_geometry(&common(six()[..3].to_vec())).unwrap();
        assert!(few.dop.is_none() && few.ellipse.is_none() && few.cofactor_enu.is_none());
        assert!(parse_request("satellites = []\nbogus = 1\n").is_err());
        let r: SkyRequest = serde_json::from_str(r#"{"systems": ["galileo"]}"#).unwrap();
        assert!(sky_geometry(&r).unwrap_err().contains("site"));
    }

    #[test]
    fn tle_text_is_propagated_to_the_epoch_and_says_what_sky_it_is() {
        let gps = include_str!("../tests/fixtures/celestrak/gps-ops_2026-06-07.txt");
        let site = Site {
            lat_deg: 52.0,
            lon_deg: 5.0,
            height_m: 45.0,
        };
        let req = |epoch: Option<&str>, t: f64| SkyRequest {
            site: Some(site),
            tle: Some(gps.to_string()),
            tle_system: Some("G".into()),
            epoch: epoch.map(str::to_string),
            time_s: Some(t),
            ..Default::default()
        };
        let g = sky_geometry(&req(Some("2026-06-07T12:00:00Z"), 0.0)).unwrap();
        assert_eq!(g.sky_source, "tle-at-epoch");
        assert_eq!(g.epoch_utc.as_deref(), Some("2026-06-07T12:00:00.000000Z"));
        assert!(g.sky_statement.contains("not a measurement"));
        assert_eq!(
            g.satellites.len() + g.n_below_horizon,
            32,
            "every set placed"
        );
        assert!(g.tle_skipped.is_empty());
        assert!(g.n_visible >= 4 && g.dop.is_some());
        assert_eq!(g.clock_labels, vec!["G".to_string()]);
        assert!(g.satellites.iter().any(|l| l.id.starts_with("GPS BIIR")));
        // `time_s` counts from the epoch: an hour later by either route is the same sky.
        let a = sky_geometry(&req(Some("2026-06-07T12:00:00Z"), 3600.0)).unwrap();
        let b = sky_geometry(&req(Some("2026-06-07T13:00:00Z"), 0.0)).unwrap();
        assert_eq!(a.satellites.len(), b.satellites.len());
        for (x, y) in a.satellites.iter().zip(&b.satellites) {
            assert_eq!(x.id, y.id);
            assert!(close(x.az_deg, y.az_deg, 1e-6) && close(x.el_deg, y.el_deg, 1e-6));
        }
        // A sky an hour on has moved.
        assert!(a
            .satellites
            .iter()
            .zip(&g.satellites)
            .any(|(x, y)| (x.el_deg - y.el_deg).abs() > 1.0));
        // Without an epoch: the newest element set's epoch, and a representative sky.
        let r = sky_geometry(&req(None, 0.0)).unwrap();
        assert_eq!(r.sky_source, "tle-at-element-epoch");
        assert!(r.epoch_utc.as_deref().unwrap().starts_with("2026-06-0"));
        assert!(r.sky_statement.contains("representative sky"));
        // Mixed with satellites given directly; the Monte Carlo carries the basis too.
        let mut mixed = req(Some("2026-06-07T12:00:00Z"), 0.0);
        mixed.satellites = Some(vec![sat("X1", 10.0, 60.0)]);
        let m = sky_geometry(&mixed).unwrap();
        assert_eq!(m.sky_source, "tle-at-epoch+satellites");
        assert_eq!(m.satellites.len(), g.satellites.len() + 1);
        let mc = sky_monte_carlo(&req(Some("2026-06-07T12:00:00Z"), 0.0), 1, 10).unwrap();
        assert_eq!(mc.sky_source, "tle-at-epoch");
        let svg = skyplot_svg(&req(Some("2026-06-07T12:00:00Z"), 0.0)).unwrap();
        assert!(svg.contains("TLE sky at 2026-06-07T12:00:00.000000Z"));
    }

    #[test]
    fn tle_requests_are_checked() {
        let site = Some(Site {
            lat_deg: 52.0,
            lon_deg: 5.0,
            height_m: 0.0,
        });
        let gps = include_str!("../tests/fixtures/celestrak/gps-ops_2026-06-07.txt");
        let err = |r: SkyRequest| sky_geometry(&r).unwrap_err();
        let big = SkyRequest {
            site,
            tle: Some(" ".repeat(MAX_TLE_BYTES + 1)),
            ..Default::default()
        };
        assert!(err(big).contains("4 MiB"));
        let no_site = SkyRequest {
            tle: Some(gps.into()),
            ..Default::default()
        };
        assert!(err(no_site).contains("site"));
        let undated = SkyRequest {
            site,
            satellites: Some(six()),
            epoch: Some("2026-06-07T12:00:00Z".into()),
            ..Default::default()
        };
        assert!(err(undated).contains("give `tle`"));
        let bad_epoch = SkyRequest {
            site,
            tle: Some(gps.into()),
            epoch: Some("2026-02-30T00:00:00Z".into()),
            ..Default::default()
        };
        assert!(err(bad_epoch).contains("epoch"));
        let line2_only = SkyRequest {
            site,
            tle: Some(gps.lines().nth(2).unwrap().to_string()),
            ..Default::default()
        };
        assert!(err(line2_only).contains("line 2 without its line 1"));
        let empty = SkyRequest {
            site,
            tle: Some("nothing here".into()),
            ..Default::default()
        };
        assert!(err(empty).contains("no complete"));
    }

    #[test]
    fn an_oversized_system_table_is_refused_before_it_is_built() {
        // The review's request: about 150 bytes asking for 200 million Walker satellites.
        let text = r#"{"site":{"lat_deg":0,"lon_deg":0},"systems":[{"name":"x","shell":[{"total":200000000,"planes":1,"phasing":0,"altitude_km":1000,"inclination_deg":50}]}]}"#;
        let err = sky_geometry_json(text).unwrap_err();
        assert!(
            err.contains("200000000") && err.contains("at most"),
            "{err}"
        );
        let huge = format!(
            r#"{{"site":{{"lat_deg":0,"lon_deg":0}},"systems":[{{"name":"x","shell":[{{"total":{},"planes":1,"phasing":0,"altitude_km":1000,"inclination_deg":50}},{{"total":{},"planes":1,"phasing":0,"altitude_km":1000,"inclination_deg":50}}]}}]}}"#,
            usize::MAX,
            usize::MAX
        );
        assert!(sky_geometry_json(&huge).unwrap_err().contains("at most"));
    }

    #[test]
    fn more_clocks_than_the_cap_are_refused() {
        let sats = |systems: usize| -> Vec<SatelliteInput> {
            (0..2 * systems)
                .map(|i| SatelliteInput {
                    id: Some(format!("S{i}")),
                    system: Some(format!("sys{}", i % systems)),
                    az_deg: Some((i as f64 * 7.3) % 360.0),
                    el_deg: Some(10.0 + (i as f64 * 3.1) % 70.0),
                    ..Default::default()
                })
                .collect()
        };
        let req = |n| SkyRequest {
            satellites: Some(sats(n)),
            ..Default::default()
        };
        assert!(sky_geometry(&req(MAX_CLOCKS)).is_ok());
        let err = sky_geometry(&req(MAX_CLOCKS + 1)).unwrap_err();
        assert!(err.contains("more than 16 systems"), "{err}");
        let common = SkyRequest {
            clock: ClockModel::Common,
            ..req(1000)
        };
        assert!(sky_geometry(&common).is_ok());
    }

    #[test]
    fn an_empty_systems_list_adds_no_presets() {
        let gps = include_str!("../tests/fixtures/celestrak/gps-ops_2026-06-07.txt");
        let req = SkyRequest {
            site: Some(Site {
                lat_deg: 52.0,
                lon_deg: 5.0,
                height_m: 0.0,
            }),
            systems: Some(vec![]),
            tle: Some(gps.into()),
            epoch: Some("2026-06-07T12:00:00Z".into()),
            ..Default::default()
        };
        assert_eq!(sky_geometry(&req).unwrap().sky_source, "tle-at-epoch");
        let nothing = SkyRequest {
            systems: Some(vec![]),
            ..Default::default()
        };
        assert!(sky_geometry(&nothing)
            .unwrap_err()
            .contains("give `systems`"));
    }

    #[test]
    fn malformed_tle_lines_are_reported_not_dropped() {
        let gps = include_str!("../tests/fixtures/celestrak/gps-ops_2026-06-07.txt");
        let first: Vec<&str> = gps.lines().take(6).collect();
        let text = format!(
            "1 bad\n2 bad\n{}\n{}\n{}\nORPHAN\n{}\n{}\n{}\n",
            first[0], first[1], first[2], first[4], first[3], first[5]
        );
        let req = SkyRequest {
            site: Some(Site {
                lat_deg: 52.0,
                lon_deg: 5.0,
                height_m: 0.0,
            }),
            tle: Some(text),
            epoch: Some("2026-06-07T12:00:00Z".into()),
            ..Default::default()
        };
        let g = sky_geometry(&req).unwrap();
        assert_eq!(
            g.satellites.len() + g.n_below_horizon,
            1,
            "one complete set"
        );
        let sk = &g.tle_skipped;
        assert!(sk[0].starts_with("line 1: malformed"), "{sk:?}");
        assert!(sk[1].starts_with("line 2: malformed"), "{sk:?}");
        // Lines 7 to 9 are line 1, a name line, then line 2: the name breaks the pair.
        assert!(
            sk[2].starts_with("line 7: line 1 without its line 2"),
            "{sk:?}"
        );
        assert!(
            sk[3].starts_with("line 9: line 2 without its line 1"),
            "{sk:?}"
        );
        assert_eq!(sk.len(), 4);
        // The ignored lines do not leak into the names.
        assert!(g.satellites.iter().all(|l| !l.id.contains("bad")));
        // Capped: many malformed lines give MAX_TLE_SKIPPED entries and one count.
        let many = format!("{}{}", "1 bad\n".repeat(250), gps);
        let g = sky_geometry(&SkyRequest {
            tle: Some(many),
            ..req
        })
        .unwrap();
        assert_eq!(g.tle_skipped.len(), MAX_TLE_SKIPPED + 1);
        assert_eq!(g.tle_skipped.last().unwrap(), "... and 150 more");
    }

    #[test]
    fn non_ascii_tle_text_is_an_error_or_a_skip_never_a_panic() {
        // The review's input: an orphan line 2 followed by multi-byte characters, so a byte
        // index into it is not a character boundary. And a 4-byte emoji variant, and both as
        // line 1, as a name line and padded to the TLE length.
        let site = Some(Site {
            lat_deg: 52.0,
            lon_deg: 5.0,
            height_m: 0.0,
        });
        let gps = include_str!("../tests/fixtures/celestrak/gps-ops_2026-06-07.txt");
        let bad: Vec<String> = vec![
            format!("2 1{}", "é".repeat(40)),
            format!("1 1{}", "é".repeat(40)),
            format!("2 1{}", "🛰".repeat(40)),
            format!("1 {}\n2 {}", "🛰".repeat(70), "é".repeat(70)),
            format!("{}\n1 {}", "é".repeat(30), "é".repeat(35)),
        ];
        for text in &bad {
            let req = SkyRequest {
                site,
                tle: Some(text.clone()),
                ..Default::default()
            };
            let json = serde_json::to_string(&req).unwrap();
            let caught = std::panic::catch_unwind(|| {
                (
                    sky_geometry(&req).is_err(),
                    sky_monte_carlo(&req, 1, 10).is_err(),
                    skyplot_svg(&req).is_err(),
                    crate::surface::sky_geometry(&json, 1 << 20).is_err(),
                    crate::surface::sky_monte_carlo(&json, 1, 10, 1 << 20).is_err(),
                    crate::surface::skyplot_svg(&json, 1 << 20).is_err(),
                )
            });
            assert_eq!(
                caught.expect("no surface may panic"),
                (true, true, true, true, true, true),
                "{text:?}"
            );
            // With good sets beside it, the bad text is reported and the good sets used.
            let mixed = SkyRequest {
                tle: Some(format!("{text}\n{gps}")),
                ..req
            };
            let g = sky_geometry(&mixed).expect("the good sets still run");
            assert!(!g.tle_skipped.is_empty(), "{text:?}");
            assert_eq!(g.satellites.len() + g.n_below_horizon, 32);
        }
    }

    #[test]
    fn propagation_failures_share_the_cap_and_the_count_stays_last() {
        let gps = include_str!("../tests/fixtures/celestrak/gps-ops_2026-06-07.txt");
        // A set SGP4 refuses at the 2026 epoch: a low orbit with a drag term of 0.5 (B*), from
        // 2024, decays long before.
        let doomed = "DOOMED\n\
            1 25544U 98067A   24001.00000000  .00000000  00000-0  50000+0 0  9990\n\
            2 25544  51.6400 247.4627 0006703 130.5360 325.0288 15.72125391563537";
        let site = Some(Site {
            lat_deg: 52.0,
            lon_deg: 5.0,
            height_m: 0.0,
        });
        let req = |text: String| SkyRequest {
            site,
            tle: Some(text),
            epoch: Some("2026-06-07T12:00:00Z".into()),
            ..Default::default()
        };
        let alone = sky_geometry(&req(format!("{doomed}\n{gps}"))).unwrap();
        assert!(
            alone.tle_skipped.iter().any(|e| e.starts_with("DOOMED: ")),
            "{:?}",
            alone.tle_skipped
        );
        // Past the cap: 120 malformed lines, then the refused set. The count is the last entry
        // and counts the propagation failure too.
        let g = sky_geometry(&req(format!("{}{doomed}\n{gps}", "1 bad\n".repeat(120)))).unwrap();
        assert_eq!(g.tle_skipped.len(), MAX_TLE_SKIPPED + 1);
        assert_eq!(g.tle_skipped.last().unwrap(), "... and 21 more");
        assert!(!g.tle_skipped.iter().any(|e| e.starts_with("DOOMED")));
    }
}
