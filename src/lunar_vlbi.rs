// SPDX-License-Identifier: AGPL-3.0-only
//! Lunar geodetic VLBI delay observable for an Earth baseline observing a lunar beacon.
//!
//! Two ground stations on the Earth (a VLBI baseline) observe a one-way signal emitted by a
//! transmitter on the lunar surface (a NovaMoon-class beacon). The geodetic observable is the
//! **near-field two-range difference** of the signal's geometric path to each station:
//!
//! ```text
//! tau_geom = ( |r2 − r_B| − |r1 − r_B| ) / c        [s]
//! ```
//!
//! with `r1`, `r2` the two stations and `r_B` the beacon, all in **geocentric inertial** (GCRS)
//! metres. The full observable adds the station clock offsets and a differenced Shapiro term:
//!
//! ```text
//! tau = tau_geom + (clk2 − clk1) + ( shapiro(r_B, r2) − shapiro(r_B, r1) )
//! ```
//!
//! **Far-field limit (the cross-check).** As `|r_B| → ∞` the spherical wavefront flattens to a
//! plane wave and the geometry collapses to the plane-of-sky Δ-DOR observable: with
//! `B = r2 − r1` and `ŝ_B = r_B/|r_B|`,
//!
//! ```text
//! tau_geom → −(B·ŝ_B)/c.
//! ```
//!
//! The crate's [`crate::radiometric::delta_dor`] with a zero quasar direction returns exactly
//! `−(B·ŝ_B)/c`, so [`geometric_delay_s`] must match `delta_dor(r_B, [0,0,0], B)` to machine
//! precision at a huge beacon distance. At true lunar distance the two differ by a non-zero
//! near-field (wavefront-curvature) term — tens to hundreds of microseconds — which
//! [`near_field_correction_s`] isolates. This `ReferenceImpl` cross-check against a
//! same-codebase plane-wave observable is the module's oracle.
//!
//! **Partials.** The partial of the geometric delay with respect to the beacon position is
//!
//! ```text
//! dtau/dr_B = ( (r_B − r2)/|r_B − r2| − (r_B − r1)/|r_B − r1| ) / c,
//! ```
//!
//! verified by central finite difference (relative error < 1e-5); the station partials are
//! `dtau/dr1 = −(r1 − r_B)/(|r1 − r_B|·c)` and `dtau/dr2 = (r2 − r_B)/(|r2 − r_B|·c)`.
//!
//! **Honesty / caveats.** This is a `Modelled` capability, **NOT** validated against real VLBI
//! data. The geometry is honest (a near-field two-range difference, Shapiro reused from
//! `radiometric`), but several deliberate simplifications are carried openly:
//!
//! * **Polar motion is dropped** (`xp = yp = 0` in [`station_inertial_position`]): the GCRS↔ITRS
//!   matrix omits the sub-arcsecond pole wander, so station inertial positions carry a
//!   few-metre frame error — below this model's fidelity but not zero.
//! * **Frame-consistency caveat.** The beacon is built from the Montenbruck-Gill geocentric
//!   Moon series ([`crate::ephem::moon_position`], mean-equator/equinox of date) plus an
//!   IAU-2015 ME body-fixed offset ([`crate::lunar_frame::icrf_to_iau_moon`], ICRF), and
//!   `jd_tdb ≈ jd_tt` is used. The mean-equator-of-date vs ICRF mismatch and the TDB≈TT
//!   approximation are below the model fidelity but mean the inertial frames are not rigorously
//!   the same realization.
//! * **No light-time iteration / no Earth-rotation-during-light-time / no media (troposphere,
//!   ionosphere, plasma) / no relativistic aberration** beyond the differenced Shapiro term.
//!
//! Nothing here claims a TRL, flight heritage, or any agency endorsement.

use crate::frames::Geodetic;
use crate::lunar::Selenographic;
use crate::precession::{mat_vec, transpose, Vec3};

// ---------------------------------------------------------------------------
// Inline 3-vector helpers (the module keeps its own to stay self-contained).
// ---------------------------------------------------------------------------

/// Vector difference `a − b`.
fn sub(a: Vec3, b: Vec3) -> Vec3 {
    [a[0] - b[0], a[1] - b[1], a[2] - b[2]]
}

/// Vector sum `a + b`.
fn add(a: Vec3, b: Vec3) -> Vec3 {
    [a[0] + b[0], a[1] + b[1], a[2] + b[2]]
}

/// Euclidean norm `|v|`.
fn norm(v: Vec3) -> f64 {
    (v[0] * v[0] + v[1] * v[1] + v[2] * v[2]).sqrt()
}

/// Speed of light (m/s).
const C: f64 = crate::timegeo::C_M_PER_S;

// ---------------------------------------------------------------------------
// Geometry primitives.
// ---------------------------------------------------------------------------

/// Geocentric **inertial** (GCRS) position of a ground station (m), from its WGS-84 geodetic
/// coordinates `g` at the epoch given by `jd_tt` / `jd_ut1`.
///
/// The station is placed in the Earth-fixed (ITRS/ECEF) frame by [`crate::frames::geodetic_to_ecef`]
/// and rotated into the geocentric celestial (GCRS) frame by the transpose of the GCRS→ITRS matrix
/// ([`crate::cio::gcrs_to_itrs_matrix`]).
///
/// **Caveat:** polar motion is dropped (`xp = yp = 0`), so the inertial position carries the
/// (few-metre) frame error of the omitted pole wander.
pub fn station_inertial_position(g: Geodetic, jd_tt: f64, jd_ut1: f64) -> Vec3 {
    let r_ecef = crate::frames::geodetic_to_ecef(g);
    let m = crate::cio::gcrs_to_itrs_matrix(jd_tt, jd_ut1, 0.0, 0.0);
    mat_vec(&transpose(&m), r_ecef)
}

/// Geocentric **inertial** position of a lunar-surface beacon (m) at TT epoch `jd_tt`.
///
/// The beacon's selenographic coordinates `sel` are placed in the Moon body-fixed frame by
/// [`crate::lunar::selenographic_to_mcmf`], rotated into the inertial frame by the transpose of the
/// ICRF→IAU-Moon matrix ([`crate::lunar_frame::icrf_to_iau_moon`]), then added to the geocentric
/// Moon position ([`crate::ephem::moon_position`]). `jd_tdb ≈ jd_tt` is used (see the module-level
/// frame-consistency caveat).
pub fn beacon_inertial_position(sel: Selenographic, jd_tt: f64) -> Vec3 {
    let t_tt_jc = (jd_tt - crate::timescales::JD_J2000) / 36_525.0;
    let moon_geo = crate::ephem::moon_position(t_tt_jc);
    let r_body = crate::lunar::selenographic_to_mcmf(sel);
    // body-fixed → inertial is the transpose of ICRF→body-fixed.
    let m = crate::lunar_frame::icrf_to_iau_moon(jd_tt);
    let r_inertial_offset = mat_vec(&transpose(&m), r_body);
    add(moon_geo, r_inertial_offset)
}

/// The **near-field geometric VLBI delay** (s): the difference of the geometric ranges from the
/// beacon to station 2 and to station 1, divided by `c`.
///
/// `tau_geom = (|r2 − r_beacon| − |r1 − r_beacon|) / c`. This is the geometry-only term; the full
/// observable ([`vlbi_delay_s`]) adds the clock and Shapiro terms.
pub fn geometric_delay_s(r1: Vec3, r2: Vec3, r_beacon: Vec3) -> f64 {
    (norm(sub(r2, r_beacon)) - norm(sub(r1, r_beacon))) / C
}

/// The **full VLBI delay observable** (s): the geometric delay plus the station clock-offset
/// difference and, when `with_shapiro` is set, the differenced gravitational (Shapiro) delay
/// through the Earth's potential.
///
/// `tau = tau_geom + (clk2 − clk1) + with_shapiro·(shapiro(r_B, r2) − shapiro(r_B, r1))`, the
/// Shapiro term reusing [`crate::radiometric::shapiro_delay`] with `MU_EARTH`.
pub fn vlbi_delay_s(
    r1: Vec3,
    r2: Vec3,
    r_beacon: Vec3,
    clk1_s: f64,
    clk2_s: f64,
    with_shapiro: bool,
) -> f64 {
    let mut tau = geometric_delay_s(r1, r2, r_beacon) + (clk2_s - clk1_s);
    if with_shapiro {
        let sh2 = crate::radiometric::shapiro_delay(r_beacon, r2, crate::forces::MU_EARTH);
        let sh1 = crate::radiometric::shapiro_delay(r_beacon, r1, crate::forces::MU_EARTH);
        tau += sh2 - sh1;
    }
    tau
}

/// Partial of the geometric delay with respect to the **beacon** position (s/m, per axis):
/// `dtau/dr_B = ( (r_B − r2)/|r_B − r2| − (r_B − r1)/|r_B − r1| ) / c`.
pub fn delay_partials_beacon(r1: Vec3, r2: Vec3, r_beacon: Vec3) -> Vec3 {
    let d2 = sub(r_beacon, r2);
    let d1 = sub(r_beacon, r1);
    let n2 = norm(d2);
    let n1 = norm(d1);
    [
        (d2[0] / n2 - d1[0] / n1) / C,
        (d2[1] / n2 - d1[1] / n1) / C,
        (d2[2] / n2 - d1[2] / n1) / C,
    ]
}

/// Partial of the geometric delay with respect to **station 1** position (s/m, per axis):
/// `dtau/dr1 = −(r1 − r_B)/(|r1 − r_B|·c)`.
pub fn delay_partials_station1(r1: Vec3, r_beacon: Vec3) -> Vec3 {
    let d = sub(r1, r_beacon);
    let n = norm(d);
    [-d[0] / (n * C), -d[1] / (n * C), -d[2] / (n * C)]
}

/// Partial of the geometric delay with respect to **station 2** position (s/m, per axis):
/// `dtau/dr2 = (r2 − r_B)/(|r2 − r_B|·c)`.
pub fn delay_partials_station2(r2: Vec3, r_beacon: Vec3) -> Vec3 {
    let d = sub(r2, r_beacon);
    let n = norm(d);
    [d[0] / (n * C), d[1] / (n * C), d[2] / (n * C)]
}

/// The **near-field correction** (s): the geometric (near-field) delay minus the far-field
/// plane-wave Δ-DOR delay `−(B·ŝ_B)/c` (= [`crate::radiometric::delta_dor`] with a zero quasar
/// direction). This is the wavefront-curvature term that vanishes as the beacon recedes to
/// infinity and is non-zero (tens of µs to a few ms) at true lunar distance.
pub fn near_field_correction_s(r1: Vec3, r2: Vec3, r_beacon: Vec3) -> f64 {
    let baseline = sub(r2, r1);
    let far_field = crate::radiometric::delta_dor(r_beacon, [0.0, 0.0, 0.0], baseline);
    geometric_delay_s(r1, r2, r_beacon) - far_field
}

// ---------------------------------------------------------------------------
// Scenario.
// ---------------------------------------------------------------------------

fn d_st1_lat() -> f64 {
    40.4256 // Goldstone-ish (DSN, California)
}
fn d_st1_lon() -> f64 {
    -116.8893
}
fn d_st1_alt() -> f64 {
    1000.0
}
fn d_st2_lat() -> f64 {
    -35.4014 // Canberra-ish (DSN, Australia)
}
fn d_st2_lon() -> f64 {
    148.9819
}
fn d_st2_alt() -> f64 {
    688.0
}
fn d_beacon_lat() -> f64 {
    0.0 // near-side equatorial beacon
}
fn d_beacon_lon() -> f64 {
    0.0
}
fn d_beacon_alt() -> f64 {
    0.0
}
fn d_epoch_year() -> i32 {
    2024
}
fn d_epoch_month() -> u32 {
    1
}
fn d_epoch_day() -> u32 {
    1
}
fn d_horizon_hours() -> f64 {
    6.0
}
fn d_step_min() -> f64 {
    30.0
}

/// A runnable lunar-VLBI scenario: two Earth ground stations observing a lunar-surface beacon,
/// sampled over a horizon. The TOML `kind = "lunar-vlbi"` entry the engine dispatches to
/// [`LunarVlbiScenario::run`]. All angles are degrees in the TOML and converted to radians
/// internally.
#[derive(Clone, Copy, Debug, serde::Deserialize)]
pub struct LunarVlbiScenario {
    /// Station 1 geodetic latitude (deg).
    #[serde(default = "d_st1_lat")]
    pub station1_lat_deg: f64,
    /// Station 1 geodetic longitude (deg).
    #[serde(default = "d_st1_lon")]
    pub station1_lon_deg: f64,
    /// Station 1 altitude above the WGS-84 ellipsoid (m).
    #[serde(default = "d_st1_alt")]
    pub station1_alt_m: f64,
    /// Station 2 geodetic latitude (deg).
    #[serde(default = "d_st2_lat")]
    pub station2_lat_deg: f64,
    /// Station 2 geodetic longitude (deg).
    #[serde(default = "d_st2_lon")]
    pub station2_lon_deg: f64,
    /// Station 2 altitude above the WGS-84 ellipsoid (m).
    #[serde(default = "d_st2_alt")]
    pub station2_alt_m: f64,
    /// Beacon selenographic latitude (deg).
    #[serde(default = "d_beacon_lat")]
    pub beacon_lat_deg: f64,
    /// Beacon selenographic longitude (deg).
    #[serde(default = "d_beacon_lon")]
    pub beacon_lon_deg: f64,
    /// Beacon altitude above the mean lunar sphere (m).
    #[serde(default = "d_beacon_alt")]
    pub beacon_alt_m: f64,
    /// Epoch UTC year.
    #[serde(default = "d_epoch_year")]
    pub epoch_year: i32,
    /// Epoch UTC month (1–12).
    #[serde(default = "d_epoch_month")]
    pub epoch_month: u32,
    /// Epoch UTC day (1–31).
    #[serde(default = "d_epoch_day")]
    pub epoch_day: u32,
    /// Pass horizon (hours).
    #[serde(default = "d_horizon_hours")]
    pub horizon_hours: f64,
    /// Sampling step (minutes).
    #[serde(default = "d_step_min")]
    pub step_min: f64,
}

impl Default for LunarVlbiScenario {
    fn default() -> Self {
        LunarVlbiScenario {
            station1_lat_deg: d_st1_lat(),
            station1_lon_deg: d_st1_lon(),
            station1_alt_m: d_st1_alt(),
            station2_lat_deg: d_st2_lat(),
            station2_lon_deg: d_st2_lon(),
            station2_alt_m: d_st2_alt(),
            beacon_lat_deg: d_beacon_lat(),
            beacon_lon_deg: d_beacon_lon(),
            beacon_alt_m: d_beacon_alt(),
            epoch_year: d_epoch_year(),
            epoch_month: d_epoch_month(),
            epoch_day: d_epoch_day(),
            horizon_hours: d_horizon_hours(),
            step_min: d_step_min(),
        }
    }
}

/// One per-epoch VLBI sample.
#[derive(Clone, Copy, Debug, serde::Serialize)]
pub struct LunarVlbiSample {
    /// Hours from the scenario epoch.
    pub t_hours: f64,
    /// Full VLBI delay (s).
    pub delay_s: f64,
    /// Geometric (near-field) delay (s).
    pub geometric_delay_s: f64,
    /// Near-field correction vs the far-field plane wave (µs).
    pub near_field_correction_us: f64,
    /// Beacon geocentric range (km).
    pub beacon_range_km: f64,
}

/// The result of a [`LunarVlbiScenario`]: summary geometry plus per-epoch samples.
#[derive(Clone, Debug, serde::Serialize)]
pub struct LunarVlbiReport {
    /// Earth baseline length |r2 − r1| at the epoch (km).
    pub baseline_km: f64,
    /// Beacon geocentric range at the epoch (km).
    pub beacon_range_km: f64,
    /// Full VLBI delay at the epoch (s).
    pub delay_s: f64,
    /// Delay rate at the epoch by finite difference (s/s).
    pub delay_rate_s_per_s: f64,
    /// Near-field correction at the epoch (µs).
    pub near_field_correction_us: f64,
    /// Number of samples taken over the horizon.
    pub samples: usize,
    /// Minimum full VLBI delay over the horizon (s).
    pub min_delay_s: f64,
    /// Maximum full VLBI delay over the horizon (s).
    pub max_delay_s: f64,
    /// Horizon (hours).
    pub horizon_hours: f64,
    /// Per-epoch samples.
    pub series: Vec<LunarVlbiSample>,
}

impl LunarVlbiScenario {
    fn geodetic1(&self) -> Geodetic {
        Geodetic {
            lat_rad: self.station1_lat_deg.to_radians(),
            lon_rad: self.station1_lon_deg.to_radians(),
            alt_m: self.station1_alt_m,
        }
    }
    fn geodetic2(&self) -> Geodetic {
        Geodetic {
            lat_rad: self.station2_lat_deg.to_radians(),
            lon_rad: self.station2_lon_deg.to_radians(),
            alt_m: self.station2_alt_m,
        }
    }
    fn beacon_sel(&self) -> Selenographic {
        Selenographic {
            lat_rad: self.beacon_lat_deg.to_radians(),
            lon_rad: self.beacon_lon_deg.to_radians(),
            alt_m: self.beacon_alt_m,
        }
    }

    /// Geometry at a single offset `t_hours` from the scenario epoch: returns
    /// `(r1, r2, r_beacon)` in geocentric inertial metres.
    fn geometry_at(&self, t_hours: f64) -> (Vec3, Vec3, Vec3) {
        let jd_utc = crate::timescales::julian_date(
            self.epoch_year,
            self.epoch_month,
            self.epoch_day,
            0,
            0,
            0.0,
        ) + t_hours / 24.0;
        let jd_tt = crate::timescales::utc_to_tt(jd_utc);
        let jd_ut1 = crate::timescales::utc_to_ut1(jd_utc, 0.0);
        let r1 = station_inertial_position(self.geodetic1(), jd_tt, jd_ut1);
        let r2 = station_inertial_position(self.geodetic2(), jd_tt, jd_ut1);
        let r_b = beacon_inertial_position(self.beacon_sel(), jd_tt);
        (r1, r2, r_b)
    }

    /// Sample the pass over the horizon and summarise the VLBI delay, its rate, and the
    /// near-field correction.
    pub fn run(&self) -> LunarVlbiReport {
        let step_h = (self.step_min / 60.0).max(1e-6);
        let n = (self.horizon_hours / step_h).floor() as usize;
        let mut series: Vec<LunarVlbiSample> = Vec::with_capacity(n + 1);
        let mut min_delay = f64::INFINITY;
        let mut max_delay = f64::NEG_INFINITY;
        for i in 0..=n {
            let t = i as f64 * step_h;
            let (r1, r2, r_b) = self.geometry_at(t);
            let delay = vlbi_delay_s(r1, r2, r_b, 0.0, 0.0, true);
            let geom = geometric_delay_s(r1, r2, r_b);
            let nfc_us = near_field_correction_s(r1, r2, r_b) * 1e6;
            let range_km = norm(r_b) / 1e3;
            min_delay = min_delay.min(delay);
            max_delay = max_delay.max(delay);
            series.push(LunarVlbiSample {
                t_hours: t,
                delay_s: delay,
                geometric_delay_s: geom,
                near_field_correction_us: nfc_us,
                beacon_range_km: range_km,
            });
        }

        // Epoch geometry + a one-step finite-difference delay rate at the epoch.
        let (r1, r2, r_b) = self.geometry_at(0.0);
        let baseline_km = norm(sub(r2, r1)) / 1e3;
        let beacon_range_km = norm(r_b) / 1e3;
        let delay0 = vlbi_delay_s(r1, r2, r_b, 0.0, 0.0, true);
        let nfc_us0 = near_field_correction_s(r1, r2, r_b) * 1e6;
        let dt_h = step_h.min(self.horizon_hours.max(step_h));
        let (r1b, r2b, r_bb) = self.geometry_at(dt_h);
        let delay1 = vlbi_delay_s(r1b, r2b, r_bb, 0.0, 0.0, true);
        let dt_s = dt_h * 3600.0;
        let delay_rate = if dt_s > 0.0 {
            (delay1 - delay0) / dt_s
        } else {
            0.0
        };

        if series.is_empty() {
            // Degenerate horizon: at least record the epoch sample.
            min_delay = delay0;
            max_delay = delay0;
            series.push(LunarVlbiSample {
                t_hours: 0.0,
                delay_s: delay0,
                geometric_delay_s: geometric_delay_s(r1, r2, r_b),
                near_field_correction_us: nfc_us0,
                beacon_range_km,
            });
        }

        LunarVlbiReport {
            baseline_km,
            beacon_range_km,
            delay_s: delay0,
            delay_rate_s_per_s: delay_rate,
            near_field_correction_us: nfc_us0,
            samples: series.len(),
            min_delay_s: min_delay,
            max_delay_s: max_delay,
            horizon_hours: self.horizon_hours,
            series,
        }
    }
}

/// Render a [`LunarVlbiReport`] as a self-contained SVG: the full VLBI delay (µs) over the pass.
pub fn lunar_vlbi_svg(r: &LunarVlbiReport) -> String {
    let (w, h) = (820.0_f64, 360.0_f64);
    let (ml, mr, mt, mb) = (70.0_f64, 20.0_f64, 36.0_f64, 50.0_f64);
    let (pw, ph) = (w - ml - mr, h - mt - mb);
    let t_max = r.horizon_hours.max(1e-9);
    let y_lo = (r.min_delay_s * 1e6).min(0.0);
    let y_hi = (r.max_delay_s * 1e6).max(0.0);
    let span = (y_hi - y_lo).max(1e-9);
    let xof = |t: f64| ml + (t / t_max) * pw;
    let yof = |v_us: f64| mt + ph - ((v_us - y_lo) / span) * ph;
    let mut svg = String::new();
    svg.push_str(&format!(
        "<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"{w:.0}\" height=\"{h:.0}\" font-family=\"sans-serif\" font-size=\"12\" fill=\"#bcb3a3\">"
    ));
    svg.push_str(&format!(
        "<rect width=\"{w:.0}\" height=\"{h:.0}\" fill=\"#0c0b08\"/>"
    ));
    svg.push_str(&format!(
        "<text x=\"{ml:.0}\" y=\"18\" font-size=\"15\" font-weight=\"bold\">Lunar VLBI delay (baseline {:.0} km, beacon range {:.0} km, near-field {:.1} µs)</text>",
        r.baseline_km, r.beacon_range_km, r.near_field_correction_us
    ));
    if r.series.len() >= 2 {
        let pts: Vec<String> = r
            .series
            .iter()
            .map(|s| format!("{:.1},{:.1}", xof(s.t_hours), yof(s.delay_s * 1e6)))
            .collect();
        svg.push_str(&format!(
            "<polyline fill=\"none\" stroke=\"#e0bd84\" points=\"{}\"/>",
            pts.join(" ")
        ));
    }
    let axis_y = mt + ph;
    svg.push_str(&format!(
        "<line x1=\"{ml:.0}\" y1=\"{mt:.0}\" x2=\"{ml:.0}\" y2=\"{axis_y:.0}\" stroke=\"#342c21\"/>"
    ));
    svg.push_str(&format!(
        "<line x1=\"{ml:.0}\" y1=\"{axis_y:.0}\" x2=\"{:.0}\" y2=\"{axis_y:.0}\" stroke=\"#342c21\"/>",
        ml + pw
    ));
    svg.push_str(&format!(
        "<text x=\"{ml:.0}\" y=\"{:.0}\" font-size=\"11\">delay {:.3} µs at epoch · {} samples over {:.1} h</text>",
        h - 18.0,
        r.delay_s * 1e6,
        r.samples,
        r.horizon_hours
    ));
    svg.push_str("</svg>");
    svg
}

#[cfg(test)]
mod tests {
    use super::*;

    fn jd_tt_2024() -> f64 {
        let jd_utc = crate::timescales::julian_date(2024, 1, 1, 0, 0, 0.0);
        crate::timescales::utc_to_tt(jd_utc)
    }
    fn jd_ut1_2024() -> f64 {
        let jd_utc = crate::timescales::julian_date(2024, 1, 1, 0, 0, 0.0);
        crate::timescales::utc_to_ut1(jd_utc, 0.0)
    }

    #[test]
    fn station_position_is_about_earth_radius() {
        // A station near sea level sits ~6371-6378 km from geocentre (within a few km).
        let g = Geodetic {
            lat_rad: 40.0_f64.to_radians(),
            lon_rad: -116.0_f64.to_radians(),
            alt_m: 1000.0,
        };
        let r = station_inertial_position(g, jd_tt_2024(), jd_ut1_2024());
        let mag_km = norm(r) / 1e3;
        assert!(
            (6356.0..6380.0).contains(&mag_km),
            "station magnitude {mag_km} km not within Earth-radius band"
        );
    }

    #[test]
    fn beacon_range_is_lunar_distance() {
        // Sample across a month; the beacon (on the Moon's surface) sits at lunar distance.
        for k in 0..8 {
            let jd_tt = jd_tt_2024() + (k as f64) * 3.7;
            let sel = Selenographic {
                lat_rad: 0.0,
                lon_rad: 0.0,
                alt_m: 0.0,
            };
            let r_b = beacon_inertial_position(sel, jd_tt);
            let range_km = norm(r_b) / 1e3;
            // Perigee ~356500 km, apogee ~406700 km; the surface offset is ±1737 km.
            assert!(
                (354_000.0..409_000.0).contains(&range_km),
                "beacon range {range_km} km at sample {k} not at lunar distance"
            );
        }
    }

    #[test]
    fn far_field_matches_delta_dor() {
        // A synthetic beacon at 1e15 m along +x with a realistic baseline: the near-field
        // geometric delay must collapse to the plane-wave Δ-DOR observable.
        let r1 = [4.0e6, 1.0e6, 4.5e6];
        let r2 = [-3.5e6, 2.0e6, -4.0e6];
        let r_b = [1.0e15, 0.0, 0.0];
        let geom = geometric_delay_s(r1, r2, r_b);
        let baseline = sub(r2, r1);
        let dor = crate::radiometric::delta_dor(r_b, [0.0, 0.0, 0.0], baseline);
        assert!(
            (geom - dor).abs() < 1e-9,
            "far-field geometric delay {geom} vs delta_dor {dor} differ by {}",
            (geom - dor).abs()
        );
    }

    #[test]
    fn near_field_correction_has_lunar_magnitude() {
        // At true lunar distance the wavefront curvature is a non-trivial correction.
        let r1 = station_inertial_position(
            Geodetic {
                lat_rad: 40.0_f64.to_radians(),
                lon_rad: -116.0_f64.to_radians(),
                alt_m: 1000.0,
            },
            jd_tt_2024(),
            jd_ut1_2024(),
        );
        let r2 = station_inertial_position(
            Geodetic {
                lat_rad: -35.0_f64.to_radians(),
                lon_rad: 149.0_f64.to_radians(),
                alt_m: 700.0,
            },
            jd_tt_2024(),
            jd_ut1_2024(),
        );
        let r_b = beacon_inertial_position(
            Selenographic {
                lat_rad: 0.0,
                lon_rad: 0.0,
                alt_m: 0.0,
            },
            jd_tt_2024(),
        );
        let nfc = near_field_correction_s(r1, r2, r_b);
        let nfc_abs_us = nfc.abs() * 1e6;
        assert!(
            (1.0..2000.0).contains(&nfc_abs_us),
            "near-field correction {nfc_abs_us} µs outside [1, 2000] µs"
        );
    }

    #[test]
    fn beacon_partials_match_finite_difference() {
        let r1 = station_inertial_position(
            Geodetic {
                lat_rad: 40.0_f64.to_radians(),
                lon_rad: -116.0_f64.to_radians(),
                alt_m: 1000.0,
            },
            jd_tt_2024(),
            jd_ut1_2024(),
        );
        let r2 = station_inertial_position(
            Geodetic {
                lat_rad: -35.0_f64.to_radians(),
                lon_rad: 149.0_f64.to_radians(),
                alt_m: 700.0,
            },
            jd_tt_2024(),
            jd_ut1_2024(),
        );
        let r_b = beacon_inertial_position(
            Selenographic {
                lat_rad: 10.0_f64.to_radians(),
                lon_rad: 20.0_f64.to_radians(),
                alt_m: 0.0,
            },
            jd_tt_2024(),
        );
        let analytic = delay_partials_beacon(r1, r2, r_b);
        // Central finite difference, 1 km step on each beacon axis.
        let dx = 1.0e3;
        for axis in 0..3 {
            let mut rp = r_b;
            let mut rm = r_b;
            rp[axis] += dx;
            rm[axis] -= dx;
            let fd = (geometric_delay_s(r1, r2, rp) - geometric_delay_s(r1, r2, rm)) / (2.0 * dx);
            let rel = (analytic[axis] - fd).abs() / fd.abs().max(1e-30);
            assert!(
                rel < 1e-5,
                "beacon partial axis {axis}: analytic {} vs FD {} rel-err {rel}",
                analytic[axis],
                fd
            );
        }
    }

    #[test]
    fn station_partials_match_finite_difference() {
        let r1 = [4.0e6, 1.0e6, 4.5e6];
        let r2 = [-3.5e6, 2.0e6, -4.0e6];
        let r_b = beacon_inertial_position(
            Selenographic {
                lat_rad: 5.0_f64.to_radians(),
                lon_rad: -10.0_f64.to_radians(),
                alt_m: 0.0,
            },
            jd_tt_2024(),
        );
        let p1 = delay_partials_station1(r1, r_b);
        let p2 = delay_partials_station2(r2, r_b);
        let dx = 1.0e3;
        for axis in 0..3 {
            let mut r1p = r1;
            let mut r1m = r1;
            r1p[axis] += dx;
            r1m[axis] -= dx;
            let fd1 =
                (geometric_delay_s(r1p, r2, r_b) - geometric_delay_s(r1m, r2, r_b)) / (2.0 * dx);
            let rel1 = (p1[axis] - fd1).abs() / fd1.abs().max(1e-30);
            assert!(rel1 < 1e-5, "station1 partial axis {axis} rel-err {rel1}");

            let mut r2p = r2;
            let mut r2m = r2;
            r2p[axis] += dx;
            r2m[axis] -= dx;
            let fd2 =
                (geometric_delay_s(r1, r2p, r_b) - geometric_delay_s(r1, r2m, r_b)) / (2.0 * dx);
            let rel2 = (p2[axis] - fd2).abs() / fd2.abs().max(1e-30);
            assert!(rel2 < 1e-5, "station2 partial axis {axis} rel-err {rel2}");
        }
    }

    #[test]
    fn clock_term_adds_exactly() {
        // A geometry symmetric across the x-z plane (r1, r2 mirror images in y) with the beacon
        // on that plane makes the two ranges identical, so the geometric delay is exactly 0 and
        // the clock difference is the only contribution — provable to the f64 ULP with no
        // cancellation against a large geometric term.
        let r1 = [4.0e6, 1.0e6, 4.5e6];
        let r2 = [4.0e6, -1.0e6, 4.5e6];
        let r_b = [3.0e8, 0.0, 2.0e8];
        let base = vlbi_delay_s(r1, r2, r_b, 0.0, 0.0, false);
        assert_eq!(
            base, 0.0,
            "symmetric geometry should give zero geometric delay"
        );
        let with_clk = vlbi_delay_s(r1, r2, r_b, 0.0, 1.0e-6, false);
        assert_eq!(
            with_clk - base,
            1.0e-6,
            "clock term {} did not add exactly 1e-6 s",
            with_clk - base
        );
    }

    #[test]
    fn scenario_run_is_finite_and_at_lunar_distance() {
        let r = LunarVlbiScenario::default().run();
        assert!(r.delay_s.is_finite());
        assert!(r.delay_rate_s_per_s.is_finite());
        assert!(
            r.baseline_km > 0.0,
            "baseline {} km not positive",
            r.baseline_km
        );
        assert!(
            (354_000.0..409_000.0).contains(&r.beacon_range_km),
            "scenario beacon range {} km not at lunar distance",
            r.beacon_range_km
        );
        assert!(r.samples >= 1);
        assert!(r.min_delay_s.is_finite() && r.max_delay_s.is_finite());
        assert!(r.min_delay_s <= r.delay_s && r.delay_s <= r.max_delay_s);
        for s in &r.series {
            assert!(s.delay_s.is_finite());
            assert!((354_000.0..409_000.0).contains(&s.beacon_range_km));
        }
    }

    #[test]
    fn svg_is_self_contained() {
        let r = LunarVlbiScenario::default().run();
        let svg = lunar_vlbi_svg(&r);
        assert!(svg.starts_with("<svg"));
        assert!(svg.ends_with("</svg>"));
        assert!(svg.contains("Lunar VLBI"));
    }

    #[test]
    fn run_toml_lunar_vlbi_dispatches() {
        let out = crate::api::run_toml("kind=\"lunar-vlbi\"\n").unwrap();
        assert!(
            out.summary.contains("lunar-vlbi"),
            "summary missing kind: {}",
            out.summary
        );
        let j: serde_json::Value = serde_json::from_str(&out.json).unwrap();
        assert!(j["beacon_range_km"].as_f64().unwrap() > 300_000.0);
        assert!(out.svg.starts_with("<svg"));
    }
}
