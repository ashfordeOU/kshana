// SPDX-License-Identifier: AGPL-3.0-only
//! Surface-beacon augmentation of a lunar navigation service (L08, L09).
//!
//! A south-polar lunar user sees an orbit-only constellation in a narrow, slowly-moving
//! patch of sky, so the ranging geometry is poorly conditioned and the geometric
//! dilution of precision (GDOP) is large. A few surveyed **surface ranging beacons** fix
//! this cheaply: a beacon near the local horizon contributes the low-elevation,
//! wide-azimuth line-of-sight rows an all-overhead orbital set lacks, collapsing the
//! horizontal GDOP. This module supplies the two pieces the open engine did not yet
//! have: (1) a beacon-augmented DOP that concatenates satellite and surface-beacon
//! ranging rows through the validated [`crate::orbit::dop`] kernel, with airless-Moon
//! horizon-bounded beacon visibility (reusing the L01 [`crate::lunar::surface_los_max_m`]
//! geometry); and (2) a beacon error budget that turns a bare DOP into a **realized
//! position accuracy in metres** — converting the headline "GDOP 1.6" into a distance.
//!
//! ## Validated vs Modelled
//! * **Validated** — the DOP assembly (it *is* the [`crate::orbit::dop`] kernel, which is
//!   cross-checked against `gnss_lib_py`/NumPy), the airless-horizon visibility (the L01
//!   closed form), the error-budget root-sum-square, and the `σ = DOP · σ_URE` accuracy
//!   relation (Kaplan & Hegarty, *Understanding GPS/GNSS*, §7 UERE budget / DOP).
//! * **Modelled** — any specific constellation, beacon placement, or component error
//!   magnitude fed in is a representative scenario input, not a fielded measurement.

use crate::lunar::{surface_los_max_m, R_MOON_M};
use crate::lunar_service::visible_sat_positions;
use crate::orbit::{dop, Dop};
use serde::{Deserialize, Serialize};

type Vec3 = [f64; 3];

fn norm(v: Vec3) -> f64 {
    (v[0] * v[0] + v[1] * v[1] + v[2] * v[2]).sqrt()
}

fn range_between(a: Vec3, b: Vec3) -> f64 {
    norm([a[0] - b[0], a[1] - b[1], a[2] - b[2]])
}

/// Height of a point above the mean lunar sphere (m), floored at zero.
fn height_above_sphere_m(p: Vec3) -> f64 {
    (norm(p) - R_MOON_M).max(0.0)
}

/// Airless-Moon line of sight between a surface user and a surface beacon: the
/// straight-line range must not exceed the two-height geometric horizon sum
/// `sqrt(2 R h_u + h_u^2) + sqrt(2 R h_b + h_b^2)` (L01 [`surface_los_max_m`]). With no
/// atmosphere there is no refractive horizon extension, so this bound is exact.
pub fn beacon_visible(user_mcmf: Vec3, beacon_mcmf: Vec3) -> bool {
    let h_u = height_above_sphere_m(user_mcmf);
    let h_b = height_above_sphere_m(beacon_mcmf);
    range_between(user_mcmf, beacon_mcmf) <= surface_los_max_m(R_MOON_M, h_u, h_b)
}

/// The visible surface beacons for a user: those whose airless-Moon line of sight to the
/// user clears the horizon ([`beacon_visible`]).
pub fn visible_beacons(user_mcmf: Vec3, beacons_mcmf: &[Vec3]) -> Vec<Vec3> {
    beacons_mcmf
        .iter()
        .copied()
        .filter(|&b| beacon_visible(user_mcmf, b))
        .collect()
}

/// Beacon-augmented dilution of precision (L08): concatenate the visible-satellite
/// line-of-sight rows (elevation mask `elev_mask_rad`) with the visible-surface-beacon
/// ranging rows and evaluate through the validated [`crate::orbit::dop`] kernel. A
/// synchronized surface beacon contributes the same `[-e, 1]` ranging row as a
/// satellite, so a near-horizon beacon supplies the wide-azimuth horizontal geometry a
/// high-elevation-only orbital set lacks — the mechanism behind the polar GDOP collapse.
/// Returns `None` with fewer than four combined sources or a singular geometry.
pub fn dop_with_beacons(
    user_mcmf: Vec3,
    sats_mcmf: &[Vec3],
    beacons_mcmf: &[Vec3],
    elev_mask_rad: f64,
) -> Option<Dop> {
    let mut sources = visible_sat_positions(user_mcmf, sats_mcmf, elev_mask_rad);
    sources.extend(visible_beacons(user_mcmf, beacons_mcmf));
    dop(user_mcmf, &sources)
}

/// Per-beacon user-equivalent ranging error budget (L09): the independent error sources
/// of a synchronized surface ranging beacon, each in metres of range.
#[derive(Clone, Copy, Debug, Deserialize, Serialize)]
pub struct BeaconErrorBudget {
    /// Time-synchronization error mapped to range (m) — the beacon-to-system clock
    /// offset times the speed of light.
    pub clock_sync_m: f64,
    /// Surface-to-surface multipath error (m).
    pub multipath_m: f64,
    /// Beacon position / survey error (m).
    pub survey_m: f64,
}

impl BeaconErrorBudget {
    /// The per-beacon user-equivalent ranging error `σ_URE` (m): the root-sum-square of
    /// the independent components, `sqrt(clock² + multipath² + survey²)`.
    pub fn sigma_ure_m(&self) -> f64 {
        (self.clock_sync_m * self.clock_sync_m
            + self.multipath_m * self.multipath_m
            + self.survey_m * self.survey_m)
            .sqrt()
    }
}

/// Realized 1σ accuracy (m) resolved from a DOP and a user-equivalent ranging error.
#[derive(Clone, Copy, Debug, PartialEq, Serialize)]
pub struct RealizedAccuracy {
    /// 3D position 1σ (m) = PDOP · σ_URE.
    pub pos_3d_m: f64,
    /// Horizontal position 1σ (m) = HDOP · σ_URE.
    pub horizontal_m: f64,
    /// Vertical position 1σ (m) = VDOP · σ_URE.
    pub vertical_m: f64,
    /// Time-solution 1σ as range (m) = TDOP · σ_URE.
    pub time_m: f64,
}

/// Map a (beacon-augmented) DOP to a realized 1σ accuracy given a user-equivalent
/// ranging error `σ_URE` (m): the standard GNSS relation `σ = DOP · σ_URE` applied per
/// component. This is what turns a dimensionless "GDOP 1.6" into metres.
pub fn realized_accuracy(d: &Dop, sigma_ure_m: f64) -> RealizedAccuracy {
    RealizedAccuracy {
        pos_3d_m: d.pdop * sigma_ure_m,
        horizontal_m: d.hdop * sigma_ure_m,
        vertical_m: d.vdop * sigma_ure_m,
        time_m: d.tdop * sigma_ure_m,
    }
}

// ---------------------------------------------------------------------------
// Scenario surface
//
// The module above has been in the engine, and validated against an independent
// DOP path, since L08/L09 — but it was not reachable from a run. There was no
// `ScenarioKind`, no dispatch arm and no bundled example, so the only way to reach
// `dop_with_beacons` was to write Rust against the library. A capability the engine
// cannot be ASKED to perform is not a capability of the tool, only of the crate,
// and the verification matrix quietly claimed it either way. This is that gap
// closed; the physics below is unchanged.
//
// The defaults are deliberately the geometry that already carries a committed
// golden (tests/validate_p2_beacon_before_after_table.rs and its
// beacon_before_after_golden.csv): a user at -80 deg, three surveyed beacons, a
// six-satellite illustrative LCNS snapshot at t = 0 and a 5 deg mask. Running the
// bundled scenario therefore reproduces a table that already has an oracle behind
// it, rather than inventing a fresh configuration whose numbers nothing checks.
// ---------------------------------------------------------------------------

/// A surface site in selenographic coordinates, as a scenario supplies it.
///
/// `deny_unknown_fields` is load-bearing, not tidiness. TOML gives a bare key written
/// after an `[[beacons]]` header to that TABLE, not to the document root, so a scalar
/// such as `elevation_mask_deg` placed below the beacon list parses as a field of the
/// last beacon. Without this attribute serde drops it silently and the scenario runs on
/// its defaults while appearing to honour the file. That happened to the bundled scenario
/// and every printed number still looked right, because the defaults matched what the
/// file said. Now it is a parse error naming the key.
#[derive(Clone, Copy, Debug, Deserialize, Serialize)]
#[serde(deny_unknown_fields)]
pub struct BeaconSite {
    /// Selenographic latitude (degrees, north positive).
    pub lat_deg: f64,
    /// Selenographic longitude (degrees, east positive).
    pub lon_deg: f64,
    /// Antenna height above the mean lunar sphere (metres).
    #[serde(default)]
    pub alt_m: f64,
}

impl BeaconSite {
    fn to_mcmf(self) -> Vec3 {
        crate::lunar::selenographic_to_mcmf(crate::lunar::Selenographic {
            lat_rad: self.lat_deg.to_radians(),
            lon_rad: self.lon_deg.to_radians(),
            alt_m: self.alt_m,
        })
    }
}

/// Surface-beacon augmentation of a lunar orbital navigation service: the
/// before/after dilution of precision at one user, and what it costs in metres.
#[derive(Clone, Debug, Deserialize)]
pub struct LunarBeaconScenario {
    /// The user site. Default: -80 deg latitude, 0 deg longitude, 2 m antenna.
    #[serde(default)]
    pub user: Option<BeaconSite>,
    /// The surveyed surface beacons. Default: the three-beacon set of the
    /// before/after golden.
    #[serde(default)]
    pub beacons: Option<Vec<BeaconSite>>,
    /// Satellites in the illustrative LCNS constellation. Default 6.
    #[serde(default)]
    pub n_satellites: Option<usize>,
    /// A second, larger constellation run for comparison — the alternative route to
    /// the same geometry. Default 24; set equal to `n_satellites` to skip the contrast.
    #[serde(default)]
    pub comparison_n_satellites: Option<usize>,
    /// Seconds after the constellation epoch at which to snapshot. Default 0.
    #[serde(default)]
    pub epoch_s: Option<f64>,
    /// Satellite elevation mask (degrees). Default 5.
    #[serde(default)]
    pub elevation_mask_deg: Option<f64>,
    /// Beacon time-synchronisation error mapped to range (m). Default 1.0.
    #[serde(default)]
    pub clock_sync_m: Option<f64>,
    /// Surface-to-surface multipath error (m). Default 0.5.
    #[serde(default)]
    pub multipath_m: Option<f64>,
    /// Beacon survey error (m). Default 0.3.
    #[serde(default)]
    pub survey_m: Option<f64>,
}

/// One DOP row of the before/after table, with the geometry that produced it.
#[derive(Clone, Debug, Serialize)]
pub struct BeaconDopRow {
    /// What this row is ("satellites only", "satellites + beacons", ...).
    pub label: String,
    /// Satellites above the mask.
    pub n_visible_sats: usize,
    /// Beacons above the airless horizon.
    pub n_visible_beacons: usize,
    /// The DOP, or `None` where the geometry admits no solution.
    pub dop: Option<Dop>,
    /// Realised 1-sigma accuracy at the configured ranging error, or `None` with no DOP.
    pub accuracy: Option<RealizedAccuracy>,
}

/// The computed before/after picture.
#[derive(Clone, Debug, Serialize)]
pub struct LunarBeaconReport {
    /// Rows of the before/after table, in reporting order.
    pub rows: Vec<BeaconDopRow>,
    /// Per-beacon user-equivalent ranging error (m) used for every accuracy above.
    pub sigma_ure_m: f64,
    /// PDOP improvement factor from adding the beacons (before / after), or `None`
    /// when either geometry admits no solution.
    pub beacon_pdop_improvement: Option<f64>,
    /// PDOP improvement factor from the larger constellation instead, or `None`.
    pub constellation_pdop_improvement: Option<f64>,
    /// Satellite elevation mask actually applied (degrees).
    pub elevation_mask_deg: f64,
    /// Epoch offset actually applied (seconds).
    pub epoch_s: f64,
}

fn default_user() -> BeaconSite {
    BeaconSite {
        lat_deg: -80.0,
        lon_deg: 0.0,
        alt_m: 2.0,
    }
}

fn default_beacons() -> Vec<BeaconSite> {
    vec![
        BeaconSite {
            lat_deg: -80.0,
            lon_deg: 0.0,
            alt_m: 2_000.0,
        },
        BeaconSite {
            lat_deg: -79.0,
            lon_deg: 60.0,
            alt_m: 2_000.0,
        },
        BeaconSite {
            lat_deg: -79.0,
            lon_deg: -60.0,
            alt_m: 2_000.0,
        },
    ]
}

impl LunarBeaconScenario {
    /// Run the scenario and return `(json, summary, svg)`.
    pub fn run_output(&self) -> Result<(String, String, String), String> {
        let r = self.compute()?;
        Ok((beacon_json(&r)?, beacon_summary(&r), beacon_svg(&r)))
    }

    /// The before/after report.
    pub fn compute(&self) -> Result<LunarBeaconReport, String> {
        let n_sats = self.n_satellites.unwrap_or(6);
        if n_sats < 1 {
            return Err("n_satellites must be at least 1".to_string());
        }
        let n_cmp = self.comparison_n_satellites.unwrap_or(24);
        if n_cmp < 1 {
            return Err("comparison_n_satellites must be at least 1".to_string());
        }
        let epoch_s = self.epoch_s.unwrap_or(0.0);
        let mask_deg = self.elevation_mask_deg.unwrap_or(5.0);
        if !(0.0..90.0).contains(&mask_deg) {
            return Err(format!(
                "elevation_mask_deg must be in [0, 90); got {mask_deg}"
            ));
        }
        let mask = mask_deg.to_radians();

        let budget = BeaconErrorBudget {
            clock_sync_m: self.clock_sync_m.unwrap_or(1.0),
            multipath_m: self.multipath_m.unwrap_or(0.5),
            survey_m: self.survey_m.unwrap_or(0.3),
        };
        let sigma = budget.sigma_ure_m();

        let user = self.user.unwrap_or_else(default_user).to_mcmf();
        let beacon_sites = self.beacons.clone().unwrap_or_else(default_beacons);
        let beacons: Vec<Vec3> = beacon_sites.iter().map(|b| b.to_mcmf()).collect();

        let sats = crate::lunar_service::LunarConstellation::illustrative_lcns(n_sats)
            .positions_mcmf(epoch_s);
        let sats_cmp = crate::lunar_service::LunarConstellation::illustrative_lcns(n_cmp)
            .positions_mcmf(epoch_s);

        let n_vis = |ss: &[Vec3]| crate::lunar_service::visible_sat_positions(user, ss, mask).len();
        let n_vis_beacons = visible_beacons(user, &beacons).len();

        let row = |label: &str, ss: &[Vec3], bs: &[Vec3]| BeaconDopRow {
            label: label.to_string(),
            n_visible_sats: n_vis(ss),
            n_visible_beacons: visible_beacons(user, bs).len(),
            dop: dop_with_beacons(user, ss, bs, mask),
            accuracy: dop_with_beacons(user, ss, bs, mask).map(|d| realized_accuracy(&d, sigma)),
        };

        let before = row(&format!("{n_sats} satellites, no beacons"), &sats, &[]);
        let after = row(
            &format!("{n_sats} satellites + {n_vis_beacons} visible beacons"),
            &sats,
            &beacons,
        );
        let bigger = row(&format!("{n_cmp} satellites, no beacons"), &sats_cmp, &[]);

        let ratio = |a: &BeaconDopRow, b: &BeaconDopRow| match (a.dop, b.dop) {
            (Some(x), Some(y)) if y.pdop > 0.0 => Some(x.pdop / y.pdop),
            _ => None,
        };
        let beacon_pdop_improvement = ratio(&before, &after);
        let constellation_pdop_improvement = ratio(&before, &bigger);

        Ok(LunarBeaconReport {
            rows: vec![before, after, bigger],
            sigma_ure_m: sigma,
            beacon_pdop_improvement,
            constellation_pdop_improvement,
            elevation_mask_deg: mask_deg,
            epoch_s,
        })
    }
}

/// Units and provenance for every numeric leaf this pack emits. See
/// [`crate::field_schema`] for the path grammar and the closed provenance vocabulary;
/// tests/field_units_global.rs runs the audit over the emitted document.
///
/// Note the provenance split that matters for reading these numbers: the DOPs and the
/// accuracies are `computed`, but `sigma_ure_m` is `modelled-input` — a budget the caller
/// may override and which nothing here measured. Every accuracy in metres is that modelled
/// budget multiplied by a computed DOP, so its magnitude is only ever as good as the budget.
const UNITS: &[(&str, &str, &str, &str)] = &[
    // (JSON path, unit, provenance class, note - "" for no note)
    (
        "rows[].n_visible_sats",
        "count",
        "computed",
        "satellites above the elevation mask at this epoch, not the configured total",
    ),
    (
        "rows[].n_visible_beacons",
        "count",
        "computed",
        "beacons clearing the airless two-height horizon; routinely FEWER than the number \
         configured, which is why the visible count is reported rather than the configured one",
    ),
    (
        "rows[].dop.gdop",
        "1",
        "computed",
        "geometric dilution of precision",
    ),
    (
        "rows[].dop.pdop",
        "1",
        "computed",
        "position dilution of precision",
    ),
    (
        "rows[].dop.hdop",
        "1",
        "computed",
        "horizontal dilution of precision",
    ),
    (
        "rows[].dop.vdop",
        "1",
        "computed",
        "vertical dilution of precision",
    ),
    (
        "rows[].dop.tdop",
        "1",
        "computed",
        "time dilution of precision",
    ),
    (
        "rows[].accuracy.pos_3d_m",
        "m",
        "computed",
        "PDOP x sigma_URE; inherits the modelled ranging budget",
    ),
    (
        "rows[].accuracy.horizontal_m",
        "m",
        "computed",
        "HDOP x sigma_URE; inherits the modelled ranging budget",
    ),
    (
        "rows[].accuracy.vertical_m",
        "m",
        "computed",
        "VDOP x sigma_URE; inherits the modelled ranging budget",
    ),
    (
        "rows[].accuracy.time_m",
        "m",
        "computed",
        "TDOP x sigma_URE - the time solution expressed as a range, not a duration",
    ),
    (
        "sigma_ure_m",
        "m",
        "modelled-input",
        "root-sum-square of the clock-synchronisation, multipath and survey terms, every one \
         a modelled allocation rather than a measured link",
    ),
    (
        "beacon_pdop_improvement",
        "1",
        "computed",
        "PDOP without beacons divided by PDOP with them; greater than one is an improvement",
    ),
    (
        "constellation_pdop_improvement",
        "1",
        "computed",
        "PDOP of the baseline constellation divided by that of the larger one",
    ),
    (
        "elevation_mask_deg",
        "deg",
        "input",
        "satellite elevation mask applied",
    ),
    (
        "epoch_s",
        "s",
        "input",
        "seconds after the constellation epoch at which the snapshot is taken",
    ),
];

fn units_block() -> serde_json::Value {
    let mut m = serde_json::Map::new();
    for (path, unit, provenance, note) in UNITS {
        let mut e = serde_json::Map::new();
        e.insert("unit".into(), serde_json::Value::String((*unit).into()));
        e.insert(
            "provenance".into(),
            serde_json::Value::String((*provenance).into()),
        );
        if !note.is_empty() {
            e.insert("note".into(), serde_json::Value::String((*note).into()));
        }
        m.insert((*path).into(), serde_json::Value::Object(e));
    }
    serde_json::Value::Object(m)
}

fn beacon_json(r: &LunarBeaconReport) -> Result<String, String> {
    let mut doc = serde_json::to_value(r).map_err(|e| format!("serialising beacon report: {e}"))?;
    match doc.as_object_mut() {
        Some(o) => {
            o.insert("units".into(), units_block());
        }
        None => return Err("the beacon report must serialise to a JSON object".to_string()),
    }
    serde_json::to_string_pretty(&doc).map_err(|e| format!("serialising beacon report: {e}"))
}

fn fmt_dop(d: &Option<Dop>) -> String {
    match d {
        Some(d) => format!(
            "GDOP {:.4}  PDOP {:.4}  HDOP {:.4}  VDOP {:.4}  TDOP {:.4}",
            d.gdop, d.pdop, d.hdop, d.vdop, d.tdop
        ),
        None => "no solution (fewer than four usable sources, or singular)".to_string(),
    }
}

fn beacon_summary(r: &LunarBeaconReport) -> String {
    let mut s = String::new();
    s.push_str(&format!(
        "Lunar surface-beacon augmentation — mask {:.1} deg, epoch +{:.0} s, \
         per-beacon sigma_URE {:.4} m\n",
        r.elevation_mask_deg, r.epoch_s, r.sigma_ure_m
    ));
    for row in &r.rows {
        s.push_str(&format!(
            "  {:<44}  sats {:>2}  beacons {:>2}  {}\n",
            row.label,
            row.n_visible_sats,
            row.n_visible_beacons,
            fmt_dop(&row.dop)
        ));
        if let Some(a) = row.accuracy {
            s.push_str(&format!(
                "  {:<44}  realised 1-sigma: 3D {:.3} m  H {:.3} m  V {:.3} m\n",
                "", a.pos_3d_m, a.horizontal_m, a.vertical_m
            ));
        }
    }
    match r.beacon_pdop_improvement {
        Some(f) => s.push_str(&format!("  beacons improve PDOP by {f:.3}x; ",)),
        None => s.push_str("  beacon improvement undefined (a geometry had no solution); "),
    }
    match r.constellation_pdop_improvement {
        Some(f) => s.push_str(&format!("a larger constellation instead, {f:.3}x\n")),
        None => s.push_str("the larger constellation had no solution\n"),
    }
    s.push_str(
        "  MODELLED: the constellation, the beacon placement and the error budget are \
         illustrative inputs.\n  The DOP kernel underneath is the gnss_lib_py-validated one \
         and the beacon horizon is the L01 closed form.\n",
    );
    s
}

fn beacon_svg(r: &LunarBeaconReport) -> String {
    let (w, h) = (900.0_f64, 360.0_f64);
    let mut s = format!(
        "<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"{w:.0}\" height=\"{h:.0}\" \
         font-family=\"sans-serif\" font-size=\"12\" fill=\"#bcb3a3\">\
         <rect width=\"{w:.0}\" height=\"{h:.0}\" fill=\"#0c0b08\"/>"
    );
    s.push_str(
        "<text x=\"24\" y=\"32\" font-size=\"15\" fill=\"#e8e0d0\">\
         Surface-beacon augmentation — PDOP by configuration</text>",
    );
    let pdops: Vec<f64> = r
        .rows
        .iter()
        .filter_map(|x| x.dop.map(|d| d.pdop))
        .collect();
    let max = pdops.iter().cloned().fold(1.0_f64, f64::max);
    let (x0, y0, bar_h, gap) = (300.0_f64, 70.0_f64, 34.0_f64, 22.0_f64);
    let track = w - x0 - 90.0;
    for (i, row) in r.rows.iter().enumerate() {
        let y = y0 + i as f64 * (bar_h + gap);
        s.push_str(&format!(
            "<text x=\"24\" y=\"{:.0}\">{}</text>",
            y + bar_h * 0.65,
            xml_escape(&row.label)
        ));
        match row.dop {
            Some(d) => {
                let len = (d.pdop / max) * track;
                s.push_str(&format!(
                    "<rect x=\"{x0:.0}\" y=\"{y:.0}\" width=\"{len:.1}\" height=\"{bar_h:.0}\" \
                     fill=\"#c9a227\" opacity=\"0.85\"/>\
                     <text x=\"{:.0}\" y=\"{:.0}\" fill=\"#e8e0d0\">PDOP {:.3}</text>",
                    x0 + len + 10.0,
                    y + bar_h * 0.65,
                    d.pdop
                ));
            }
            None => s.push_str(&format!(
                "<text x=\"{x0:.0}\" y=\"{:.0}\" fill=\"#b4553c\">no solution</text>",
                y + bar_h * 0.65
            )),
        }
    }
    s.push_str(&format!(
        "<text x=\"24\" y=\"{:.0}\" fill=\"#8d8577\">lower is better; \
         per-beacon sigma_URE {:.3} m, mask {:.1} deg</text></svg>",
        h - 22.0,
        r.sigma_ure_m,
        r.elevation_mask_deg
    ));
    s
}

fn xml_escape(s: &str) -> String {
    s.replace('&', "&amp;")
        .replace('<', "&lt;")
        .replace('>', "&gt;")
}

#[cfg(test)]
mod tests {
    use super::*;

    /// Build an MCMF position from selenographic latitude/longitude (deg) and antenna
    /// height (m) above the mean sphere. Right-handed, +Z at the north pole.
    fn site(lat_deg: f64, lon_deg: f64, height_m: f64) -> Vec3 {
        let lat = lat_deg.to_radians();
        let lon = lon_deg.to_radians();
        let r = R_MOON_M + height_m;
        [
            r * lat.cos() * lon.cos(),
            r * lat.cos() * lon.sin(),
            r * lat.sin(),
        ]
    }

    /// A high-altitude relay above a given sub-point (a crude MCI-ish position for a
    /// geometry test): radius `R_MOON + alt_m` toward the (lat, lon) direction.
    fn relay(lat_deg: f64, lon_deg: f64, alt_m: f64) -> Vec3 {
        site(lat_deg, lon_deg, alt_m)
    }

    /// Place a surface site at ground distance `dist_m` and azimuth `az_deg` from a
    /// reference (lat, lon), at antenna height `height_m` (spherical direct geodesic).
    /// Used to put beacons a few km from the user at diverse azimuths, within horizon.
    fn offset_site(lat_deg: f64, lon_deg: f64, dist_m: f64, az_deg: f64, height_m: f64) -> Vec3 {
        let lat = lat_deg.to_radians();
        let lon = lon_deg.to_radians();
        let az = az_deg.to_radians();
        let ang = dist_m / R_MOON_M;
        let lat2 = (lat.sin() * ang.cos() + lat.cos() * ang.sin() * az.cos()).asin();
        let lon2 =
            lon + (az.sin() * ang.sin() * lat.cos()).atan2(ang.cos() - lat.sin() * lat2.sin());
        let r = R_MOON_M + height_m;
        [
            r * lat2.cos() * lon2.cos(),
            r * lat2.cos() * lon2.sin(),
            r * lat2.sin(),
        ]
    }

    #[test]
    fn beacon_error_budget_rss_is_closed_form() {
        // Oracle: user-equivalent ranging error is the root-sum-square of independent
        // components (Kaplan & Hegarty, UERE budget). clock 1.0, multipath 2.0,
        // survey 0.5 -> sqrt(1 + 4 + 0.25) = sqrt(5.25) = 2.29128784...
        let b = BeaconErrorBudget {
            clock_sync_m: 1.0,
            multipath_m: 2.0,
            survey_m: 0.5,
        };
        assert!((b.sigma_ure_m() - 2.291_287_847_5).abs() < 1e-9);
    }

    #[test]
    fn realized_accuracy_is_dop_times_uere() {
        // Oracle: the standard GNSS accuracy relation sigma = DOP * sigma_URE per
        // component. This is what converts the paper's "GDOP 1.6" into metres.
        let d = Dop {
            gdop: 2.0,
            pdop: 1.6,
            hdop: 1.1,
            vdop: 1.2,
            tdop: 0.9,
        };
        let sigma = 2.2912878;
        let a = realized_accuracy(&d, sigma);
        assert!((a.pos_3d_m - 1.6 * sigma).abs() < 1e-9);
        assert!((a.horizontal_m - 1.1 * sigma).abs() < 1e-9);
        assert!((a.vertical_m - 1.2 * sigma).abs() < 1e-9);
        assert!((a.time_m - 0.9 * sigma).abs() < 1e-9);
    }

    #[test]
    fn beacon_visibility_respects_the_airless_horizon() {
        // Oracle: L01 surface_los_max. A user on a 2 m mast and a beacon on a 2 m mast
        // see each other only within sqrt(2 R h_u) + sqrt(2 R h_b) ≈ 5.27 km; place one
        // beacon just inside that range and one well beyond.
        let user = site(-88.0, 0.0, 2.0);
        // Near beacon: a small along-surface offset (~2 km). Far beacon: ~50 km away.
        let near = site(-88.0, 2.0, 2.0); // ~1.1 km of arc at this latitude
        let far = site(-80.0, 0.0, 2.0); // ~240 km of arc
        assert!(beacon_visible(user, near), "near beacon should be visible");
        assert!(
            !beacon_visible(user, far),
            "far beacon should be over the horizon"
        );
    }

    #[test]
    fn beacons_enable_a_solution_where_sparse_orbit_only_cannot() {
        // A polar user with only THREE visible satellites has no DOP (rank-deficient);
        // adding two surveyed surface beacons completes a solvable geometry. This is the
        // sparse-coverage case P2 targets. DOP assembly inherits the Validated kernel.
        let user = site(-85.0, 0.0, 1.6);
        let sats = [
            relay(-70.0, 0.0, 5.0e6),
            relay(-75.0, 120.0, 5.0e6),
            relay(-72.0, 240.0, 5.0e6),
        ];
        assert!(
            crate::lunar_service::service_dop(user, &sats, 5.0_f64.to_radians()).is_none(),
            "three satellites alone must be rank-deficient"
        );
        // Two surveyed beacons 4 km from the user (within the ~5.6 km horizon) at
        // azimuths 90 deg apart.
        let beacons = [
            offset_site(-85.0, 0.0, 4_000.0, 0.0, 3.0),
            offset_site(-85.0, 0.0, 4_000.0, 90.0, 3.0),
        ];
        assert_eq!(
            visible_beacons(user, &beacons).len(),
            2,
            "both beacons visible"
        );
        let d = dop_with_beacons(user, &sats, &beacons, 5.0_f64.to_radians())
            .expect("3 sats + 2 beacons is solvable");
        assert!(d.gdop.is_finite() && d.gdop > 0.0, "GDOP {}", d.gdop);
    }

    #[test]
    fn beacons_cut_the_polar_gdop() {
        // Four satellites clustered high over the pole give a poorly-conditioned,
        // large-GDOP geometry for an -85 deg user; three surface beacons spread in
        // azimuth add the horizontal rows that collapse it. Asserts the P2 mechanism
        // (a large GDOP reduction), not the paper's exact 16.2 -> 1.6 (that scenario is
        // reproduced in the Phase-4 pack).
        let user = site(-85.0, 0.0, 1.6);
        let sats = [
            relay(-84.0, 0.0, 5.0e6),
            relay(-84.0, 30.0, 5.0e6),
            relay(-83.5, 60.0, 5.0e6),
            relay(-84.5, 90.0, 5.0e6),
        ];
        let sats_only = crate::lunar_service::service_dop(user, &sats, 5.0_f64.to_radians())
            .expect("clustered sats give a (large) GDOP");
        // Three beacons 4 km from the user (within horizon) at 120 deg azimuth spacing.
        let beacons = [
            offset_site(-85.0, 0.0, 4_000.0, 0.0, 3.0),
            offset_site(-85.0, 0.0, 4_000.0, 120.0, 3.0),
            offset_site(-85.0, 0.0, 4_000.0, 240.0, 3.0),
        ];
        assert_eq!(
            visible_beacons(user, &beacons).len(),
            3,
            "all beacons visible"
        );
        let augmented = dop_with_beacons(user, &sats, &beacons, 5.0_f64.to_radians())
            .expect("sats + beacons solvable");
        assert!(
            augmented.gdop < sats_only.gdop,
            "beacons should cut GDOP: {} -> {}",
            sats_only.gdop,
            augmented.gdop
        );
    }
}
