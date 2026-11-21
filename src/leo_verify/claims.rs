// SPDX-License-Identifier: AGPL-3.0-only
//! LEO-PNT signal claims against orbit and link physics: does a published figure about a LEO
//! positioning service (a Doppler range, a relative speed, an orbital period, a horizon range, a
//! spreading loss, a "times stronger than GPS") follow from the orbit and the powers the same
//! publications state?
//!
//! Every claim names its source. The computation uses only the stated orbit (circular, altitude and
//! inclination), a spherical Earth of the stated radius rotating at the WGS 84 rate, `GM` of
//! WGS 84 and free-space geometry; the tolerance is part of the input, fixed before the run. A row
//! says whether the computed figure falls within that tolerance of the stated one: it does not say
//! that a service meets or misses anything, and it is no measurement of a service.
//!
//! Checks (`check` objects, one key each):
//!
//! | check | computed |
//! |---|---|
//! | `orbital_period_min` | `2π √(r³/GM)` |
//! | `orbital_speed_m_s` | `√(GM/r)` |
//! | `max_relative_speed_m_s` | the largest line-of-sight speed between the satellite and a static user on the rotating Earth, above the elevation mask (a grid search over orbit position, user latitude and longitude, refined) |
//! | `max_doppler_hz` | that speed times `f/c` |
//! | `max_doppler_rate_hz_s` | the largest rate of change of the Doppler for a static user above the mask |
//! | `max_doppler_ratio` | the system's largest Doppler over a reference orbit's, at one carrier |
//! | `max_doppler_rate_ratio` | the same for the Doppler rate |
//! | `horizon_slant_range_km` | `√(r² − R²)`, the range to a satellite on the horizon (the ground arc is reported beside it) |
//! | `altitude_ratio` | reference altitude over the system's |
//! | `spreading_loss_db` | `−10 log10(4π d²)` from the zenith range to the range at the mask, against a stated interval |
//! | `spreading_advantage` | the ratio of a reference orbit's spreading loss to the system's: at equal elevation, and over every pair of elevations above the mask, against a stated interval (spreading only: transmit power and antenna gains are not in it) |
//! | `power_advantage` | stated received-power intervals of the system and a reference signal: the like-for-like ratios (minimum to minimum, maximum to maximum) and the extremes, against a stated ratio |
//!
//! MODELLED. The orbit is circular and two-body, the Earth a sphere, no troposphere or ionosphere.

use super::{list_len, positive, within, work_limit};
use crate::portable_math::PortableFloat;
use serde::{Deserialize, Serialize};

/// WGS 84 `GM` (m³/s²).
pub const GM: f64 = 3.986_004_418e14;
/// WGS 84 Earth rotation rate (rad/s).
pub const OMEGA_E: f64 = 7.292_115_146_7e-5;
/// Speed of light (m/s).
pub const C: f64 = 299_792_458.0;
/// Most geometry searches in one run.
pub const MAX_SEARCHES: usize = 48;

fn d_radius() -> f64 {
    6371.0
}

/// A tolerance: the larger of an absolute value and a fraction of the stated value.
#[derive(Clone, Copy, Debug, Default, PartialEq, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct Tolerance {
    /// Absolute tolerance, in the stated value's unit (0 when absent).
    #[serde(default)]
    pub abs: Option<f64>,
    /// Relative tolerance, as a fraction of the stated value's magnitude (0 when absent).
    #[serde(default)]
    pub rel: Option<f64>,
}

impl Tolerance {
    fn of(&self, stated: f64) -> f64 {
        let a = self.abs.unwrap_or(0.0);
        let r = self.rel.unwrap_or(0.0) * stated.abs();
        a.max(r)
    }
}

/// A reference orbit (for the ratio checks).
#[derive(Clone, Copy, Debug, PartialEq, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct RefOrbit {
    /// Reference orbit altitude above the spherical Earth (km).
    pub altitude_km: f64,
    /// Reference orbit inclination (degrees).
    pub inclination_deg: f64,
}

/// What a claim states and how it is computed.
#[derive(Clone, Debug, PartialEq, Serialize, Deserialize)]
#[serde(rename_all = "snake_case", deny_unknown_fields)]
pub enum Check {
    /// Orbital period (minutes), checked against `2π √(r³/GM)` for the circular orbit.
    OrbitalPeriodMin {
        /// The stated period (minutes).
        stated: f64,
    },
    /// Orbital speed (m/s), checked against the circular two-body speed `√(GM/r)`.
    OrbitalSpeedMS {
        /// The stated orbital speed (m/s).
        stated: f64,
    },
    /// Largest line-of-sight speed to a static user above the mask (m/s), found by a
    /// grid search over orbit position and user latitude and longitude, then refined.
    MaxRelativeSpeedMS {
        /// The stated largest relative speed (m/s).
        stated: f64,
        /// Elevation mask (degrees, 0 to 60; default 0).
        #[serde(default)]
        mask_deg: f64,
    },
    /// Largest Doppler shift (Hz): the largest line-of-sight speed above the mask times `f/c`.
    MaxDopplerHz {
        /// Carrier frequency (MHz).
        carrier_mhz: f64,
        /// The stated largest Doppler shift (Hz).
        stated: f64,
        /// Elevation mask (degrees, 0 to 60; default 0).
        #[serde(default)]
        mask_deg: f64,
    },
    /// Largest Doppler rate (Hz/s): the largest rate of change of the line-of-sight speed
    /// above the mask, by central differences in time, times `f/c`.
    MaxDopplerRateHzS {
        /// Carrier frequency (MHz).
        carrier_mhz: f64,
        /// The stated largest Doppler rate (Hz/s).
        stated: f64,
        /// Elevation mask (degrees, 0 to 60; default 0).
        #[serde(default)]
        mask_deg: f64,
    },
    /// Ratio of the system's largest line-of-sight speed (so Doppler, at one carrier) to a
    /// reference orbit's, both searched above the same mask.
    MaxDopplerRatio {
        /// The reference orbit, on the system's Earth radius.
        reference: RefOrbit,
        /// The stated Doppler ratio (dimensionless, system over reference).
        stated: f64,
        /// Elevation mask (degrees, 0 to 60; default 0), applied to both orbits.
        #[serde(default)]
        mask_deg: f64,
    },
    /// Ratio of the system's largest Doppler rate to a reference orbit's, from the largest
    /// line-of-sight accelerations of each above the same mask.
    MaxDopplerRateRatio {
        /// The reference orbit, on the system's Earth radius.
        reference: RefOrbit,
        /// The stated Doppler-rate ratio (dimensionless, system over reference).
        stated: f64,
        /// Elevation mask (degrees, 0 to 60; default 0), applied to both orbits.
        #[serde(default)]
        mask_deg: f64,
    },
    /// Slant range to a satellite on the horizon (km), checked against `√(r² − R²)`; the
    /// ground arc is reported beside it.
    HorizonSlantRangeKm {
        /// The stated horizon slant range (km).
        stated: f64,
    },
    /// Reference altitude divided by the system's altitude, checked against a stated ratio.
    AltitudeRatio {
        /// Reference orbit altitude (km).
        reference_altitude_km: f64,
        /// The stated altitude ratio (dimensionless, reference over system).
        stated: f64,
    },
    /// Free-space spreading loss `−10 log10(4π d²)` (dB) from the range at the mask to the
    /// zenith range, checked as an interval against a stated interval (absolute tolerance).
    SpreadingLossDb {
        /// Lower end of the stated spreading-loss interval (dB).
        stated_min: f64,
        /// Upper end of the stated spreading-loss interval (dB).
        stated_max: f64,
        /// Elevation mask (degrees, 0 to 60; default 0) giving the longest range.
        #[serde(default)]
        mask_deg: f64,
    },
    /// Ratio of a reference orbit's squared range to the system's (spreading only), over
    /// every pair of elevations above the mask, checked against a stated interval.
    SpreadingAdvantage {
        /// Reference orbit altitude (km).
        reference_altitude_km: f64,
        /// Lower end of the stated advantage interval (linear ratio).
        stated_min: f64,
        /// Upper end of the stated advantage interval (linear ratio); the relative tolerance
        /// is taken of this value.
        stated_max: f64,
        /// Elevation mask (degrees, 0 to 60; default 0), applied to both orbits.
        #[serde(default)]
        mask_deg: f64,
    },
    /// A stated received-power ratio over a reference signal, compared in dB with the
    /// like-for-like and extreme differences of the stated power intervals.
    PowerAdvantage {
        /// The stated power ratio (linear, system over reference), converted to dB.
        stated_ratio: f64,
        /// The system's minimum and maximum received power (dBW).
        system_dbw: [f64; 2],
        /// The reference signal's minimum and maximum received power (dBW).
        reference_dbw: [f64; 2],
        /// Where the received powers come from.
        powers_source: String,
    },
}

/// One claim.
#[derive(Clone, Debug, PartialEq, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct Claim {
    /// Identifier of the claim, unique within its system.
    pub id: String,
    /// What the claim states and which computation checks it.
    pub check: Check,
    /// Tolerance on the stated value (or on each end of a stated interval).
    #[serde(default)]
    pub tolerance: Tolerance,
    /// Where the stated figure is published (document, section, page or URL, and the words).
    pub source: String,
    /// Optional free-text note, copied to the report row.
    #[serde(default)]
    pub note: Option<String>,
}

/// One system: a circular orbit and its claims.
#[derive(Clone, Debug, PartialEq, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct System {
    /// Name of the system, copied to each report row.
    pub name: String,
    /// Circular orbit altitude above the spherical Earth (km); must be positive.
    pub altitude_km: f64,
    /// Orbit inclination (degrees, 0 to 180).
    pub inclination_deg: f64,
    /// Earth radius used by the publication (km); default 6371.
    #[serde(default = "d_radius")]
    pub earth_radius_km: f64,
    /// Where the orbit is published.
    pub orbit_source: String,
    /// The claims checked against this orbit (at most 64).
    pub claims: Vec<Claim>,
}

/// Input of `kshana leo-verify signal-claims`.
#[derive(Clone, Debug, PartialEq, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct ClaimsInput {
    /// The systems to check (at most 32).
    pub systems: Vec<System>,
}

/// One checked claim.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct Row {
    /// Name of the system the claim belongs to.
    pub system: String,
    /// Identifier of the claim.
    pub id: String,
    /// Snake-case name of the check, such as `max_doppler_hz`.
    pub check: &'static str,
    /// Where the stated figure is published, copied from the claim.
    pub source: String,
    /// The claim's note, if any; omitted from the output when absent.
    #[serde(skip_serializing_if = "Option::is_none")]
    pub note: Option<String>,
    /// The stated value or interval.
    pub stated: serde_json::Value,
    /// The computed value or interval, with any figures beside it.
    pub computed: serde_json::Value,
    /// The tolerance applied (absolute, in the stated unit).
    pub tolerance: f64,
    /// `consistent` / `not_consistent` for a value; `within` / `outside` for an interval;
    /// `reached_like_for_like` / `reached_only_at_the_extremes` / `not_reached_with_cited_powers`
    /// for a power advantage.
    pub outcome: &'static str,
}

/// The report.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct ClaimsReport {
    /// One row per checked claim, in input order.
    pub rows: Vec<Row>,
    /// Rows whose outcome is `consistent`, `within` or `reached_like_for_like`.
    pub consistent: usize,
    /// All other rows: the row count less `consistent`.
    pub not_consistent: usize,
}

/// A circular orbit seen from a spherical rotating Earth.
#[derive(Clone, Copy, Debug)]
pub struct Geometry {
    /// Orbit radius (m).
    pub r: f64,
    /// Earth radius (m).
    pub re: f64,
    /// Inclination (rad).
    pub inc: f64,
}

impl Geometry {
    /// Geometry from an altitude (km), an inclination (degrees) and an Earth radius (km),
    /// stored in metres and radians.
    pub fn new(altitude_km: f64, inclination_deg: f64, earth_radius_km: f64) -> Self {
        Self {
            r: (earth_radius_km + altitude_km) * 1e3,
            re: earth_radius_km * 1e3,
            inc: inclination_deg.to_radians(),
        }
    }

    /// Circular orbital speed `√(GM/r)` (m/s).
    pub fn speed(&self) -> f64 {
        (GM / self.r).sqrt()
    }

    /// Orbital period `2π √(r³/GM)` (s).
    pub fn period_s(&self) -> f64 {
        2.0 * std::f64::consts::PI * (self.r.ppowi(3) / GM).sqrt()
    }

    /// Mean motion: orbital speed over orbit radius (rad/s).
    pub fn mean_motion(&self) -> f64 {
        self.speed() / self.r
    }

    /// Range rate (m/s, positive receding) for argument of latitude `u`, user latitude `phi` and
    /// inertial longitude `lam`; `None` below the mask.
    fn range_rate(&self, u: f64, phi: f64, lam: f64, sin_mask: f64) -> Option<f64> {
        let (su, cu) = u.psin_cos();
        let (si, ci) = self.inc.psin_cos();
        let v = self.speed();
        let s = [self.r * cu, self.r * su * ci, self.r * su * si];
        let vs = [-v * su, v * cu * ci, v * cu * si];
        let (sp, cp) = phi.psin_cos();
        let (sl, cl) = lam.psin_cos();
        let up = [cp * cl, cp * sl, sp];
        let p = [self.re * up[0], self.re * up[1], self.re * up[2]];
        let vp = [-OMEGA_E * p[1], OMEGA_E * p[0], 0.0];
        let d = [s[0] - p[0], s[1] - p[1], s[2] - p[2]];
        let n = (d[0] * d[0] + d[1] * d[1] + d[2] * d[2]).sqrt();
        if (d[0] * up[0] + d[1] * up[1] + d[2] * up[2]) / n < sin_mask {
            return None;
        }
        Some(((vs[0] - vp[0]) * d[0] + (vs[1] - vp[1]) * d[1] + (vs[2] - vp[2]) * d[2]) / n)
    }

    /// Rate of change of the range rate (m/s²) at the same geometry, by central differences in
    /// time (the satellite advances along its orbit, the user with the Earth).
    fn range_accel(&self, u: f64, phi: f64, lam: f64, sin_mask: f64) -> Option<f64> {
        let dt = 0.5;
        let n = self.mean_motion();
        let a = self.range_rate(u + n * dt, phi, lam + OMEGA_E * dt, sin_mask)?;
        let b = self.range_rate(u - n * dt, phi, lam - OMEGA_E * dt, sin_mask)?;
        Some((a - b) / (2.0 * dt))
    }

    /// The largest magnitude of `f` over visible geometry: a grid search, then a coordinate
    /// refinement from the best grid point.
    fn max_abs(&self, mask_deg: f64, f: impl Fn(&Self, f64, f64, f64, f64) -> Option<f64>) -> f64 {
        let sm = mask_deg.to_radians().psin();
        let tau = 2.0 * std::f64::consts::PI;
        let (nu, nphi, nlam) = (90usize, 37usize, 90usize);
        // Keep the best few grid points as starting points: the surface has several local maxima.
        const STARTS: usize = 8;
        let mut top: Vec<(f64, [f64; 3])> = Vec::with_capacity(STARTS + 1);
        for a in 0..nu {
            let u = tau * a as f64 / nu as f64;
            for b in 0..nphi {
                let phi = (-90.0 + 180.0 * b as f64 / (nphi - 1) as f64).to_radians();
                for c in 0..nlam {
                    let lam = tau * c as f64 / nlam as f64;
                    if let Some(q) = f(self, u, phi, lam, sm) {
                        if top.len() < STARTS || q.abs() > top[top.len() - 1].0 {
                            top.push((q.abs(), [u, phi, lam]));
                            top.sort_by(|x, y| y.0.total_cmp(&x.0));
                            top.truncate(STARTS);
                        }
                    }
                }
            }
        }
        let mut best = (0.0f64, [0.0f64; 3]);
        for start in top {
            let mut cur = start;
            let mut step = 0.05;
            while step > 1e-9 {
                let mut improved = false;
                for k in 0..3 {
                    for s in [1.0, -1.0] {
                        let mut y = cur.1;
                        y[k] += s * step;
                        y[1] =
                            y[1].clamp(-std::f64::consts::FRAC_PI_2, std::f64::consts::FRAC_PI_2);
                        if let Some(q) = f(self, y[0], y[1], y[2], sm) {
                            if q.abs() > cur.0 {
                                cur = (q.abs(), y);
                                improved = true;
                            }
                        }
                    }
                }
                if !improved {
                    step /= 2.0;
                }
            }
            if cur.0 > best.0 {
                best = cur;
            }
        }
        best.0
    }

    /// The largest line-of-sight speed to a static user above the mask (m/s).
    pub fn max_relative_speed(&self, mask_deg: f64) -> f64 {
        self.max_abs(mask_deg, |g, u, p, l, s| g.range_rate(u, p, l, s))
    }

    /// The largest rate of change of the line-of-sight speed above the mask (m/s²).
    pub fn max_relative_accel(&self, mask_deg: f64) -> f64 {
        self.max_abs(mask_deg, |g, u, p, l, s| g.range_accel(u, p, l, s))
    }

    /// Range (m) to a satellite at elevation `e` (rad).
    pub fn range_at(&self, e: f64) -> f64 {
        let (se, ce) = e.psin_cos();
        let rc = self.re * ce;
        (self.r * self.r - rc * rc).sqrt() - self.re * se
    }

    /// Ground arc (km) from the sub-satellite point to where the satellite is at elevation `e`.
    pub fn ground_arc_km(&self, e: f64) -> f64 {
        let lam = (self.re / self.r * e.pcos()).pacos() - e;
        self.re * lam / 1e3
    }
}

fn spreading_db(d: f64) -> f64 {
    -10.0 * (4.0 * std::f64::consts::PI * d * d).plog10()
}

fn round(v: f64, d: i32) -> f64 {
    let s = 10f64.ppowi(d);
    (v * s).round() / s
}

fn point(stated: f64, computed: f64, tol: f64) -> &'static str {
    if (computed - stated).abs() <= tol {
        "consistent"
    } else {
        "not_consistent"
    }
}

fn interval(stated: (f64, f64), computed: (f64, f64), tol: f64) -> &'static str {
    if computed.0 >= stated.0 - tol
        && computed.0 <= stated.1 + tol
        && computed.1 >= stated.0 - tol
        && computed.1 <= stated.1 + tol
        || (stated.0 >= computed.0 - tol && stated.1 <= computed.1 + tol)
    {
        "within"
    } else {
        "outside"
    }
}

/// Check every claim.
pub fn run(input: &ClaimsInput) -> Result<ClaimsReport, String> {
    list_len("systems", input.systems.len(), 32)?;
    // Each Doppler, relative-speed or Doppler-rate check is a geometry search (two for a ratio).
    let searches: usize = input
        .systems
        .iter()
        .flat_map(|s| &s.claims)
        .map(|c| match c.check {
            Check::MaxRelativeSpeedMS { .. }
            | Check::MaxDopplerHz { .. }
            | Check::MaxDopplerRateHzS { .. } => 1,
            Check::MaxDopplerRatio { .. } | Check::MaxDopplerRateRatio { .. } => 2,
            _ => 0,
        })
        .sum();
    work_limit(searches as f64, MAX_SEARCHES as f64)?;
    let mut rows = Vec::new();
    for s in &input.systems {
        positive("altitude_km", s.altitude_km)?;
        within("inclination_deg", s.inclination_deg, 0.0, 180.0)?;
        within("earth_radius_km", s.earth_radius_km, 6300.0, 6400.0)?;
        list_len("claims", s.claims.len(), 64)?;
        let g = Geometry::new(s.altitude_km, s.inclination_deg, s.earth_radius_km);
        for c in &s.claims {
            rows.push(check(s, &g, c)?);
        }
    }
    let consistent = rows
        .iter()
        .filter(|r| matches!(r.outcome, "consistent" | "within" | "reached_like_for_like"))
        .count();
    Ok(ClaimsReport {
        not_consistent: rows.len() - consistent,
        consistent,
        rows,
    })
}

fn check(s: &System, g: &Geometry, c: &Claim) -> Result<Row, String> {
    use serde_json::json;
    let mask = |m: f64| within("mask_deg", m, 0.0, 60.0);
    let (name, stated, computed, tol, outcome) = match &c.check {
        Check::OrbitalPeriodMin { stated } => {
            let v = g.period_s() / 60.0;
            let t = c.tolerance.of(*stated);
            (
                "orbital_period_min",
                json!(stated),
                json!(round(v, 2)),
                t,
                point(*stated, v, t),
            )
        }
        Check::OrbitalSpeedMS { stated } => {
            let v = g.speed();
            let t = c.tolerance.of(*stated);
            (
                "orbital_speed_m_s",
                json!(stated),
                json!(round(v, 1)),
                t,
                point(*stated, v, t),
            )
        }
        Check::MaxRelativeSpeedMS { stated, mask_deg } => {
            let v = g.max_relative_speed(mask(*mask_deg)?);
            let t = c.tolerance.of(*stated);
            (
                "max_relative_speed_m_s",
                json!(stated),
                json!(round(v, 1)),
                t,
                point(*stated, v, t),
            )
        }
        Check::MaxDopplerHz {
            carrier_mhz,
            stated,
            mask_deg,
        } => {
            let f = positive("carrier_mhz", *carrier_mhz)? * 1e6;
            let v = g.max_relative_speed(mask(*mask_deg)?) * f / C;
            let t = c.tolerance.of(*stated);
            (
                "max_doppler_hz",
                json!(stated),
                json!(round(v, 1)),
                t,
                point(*stated, v, t),
            )
        }
        Check::MaxDopplerRateHzS {
            carrier_mhz,
            stated,
            mask_deg,
        } => {
            let f = positive("carrier_mhz", *carrier_mhz)? * 1e6;
            let v = g.max_relative_accel(mask(*mask_deg)?) * f / C;
            let t = c.tolerance.of(*stated);
            (
                "max_doppler_rate_hz_s",
                json!(stated),
                json!(round(v, 2)),
                t,
                point(*stated, v, t),
            )
        }
        Check::MaxDopplerRatio {
            reference,
            stated,
            mask_deg,
        } => {
            let m = mask(*mask_deg)?;
            let r = Geometry::new(
                reference.altitude_km,
                reference.inclination_deg,
                s.earth_radius_km,
            );
            let (a, b) = (g.max_relative_speed(m), r.max_relative_speed(m));
            let v = a / b;
            let t = c.tolerance.of(*stated);
            (
                "max_doppler_ratio",
                json!(stated),
                json!({"ratio": round(v, 2), "system_m_s": round(a, 1), "reference_m_s": round(b, 1)}),
                t,
                point(*stated, v, t),
            )
        }
        Check::MaxDopplerRateRatio {
            reference,
            stated,
            mask_deg,
        } => {
            let m = mask(*mask_deg)?;
            let r = Geometry::new(
                reference.altitude_km,
                reference.inclination_deg,
                s.earth_radius_km,
            );
            let (a, b) = (g.max_relative_accel(m), r.max_relative_accel(m));
            let v = a / b;
            let t = c.tolerance.of(*stated);
            (
                "max_doppler_rate_ratio",
                json!(stated),
                json!({"ratio": round(v, 1), "system_m_s2": round(a, 4), "reference_m_s2": round(b, 6)}),
                t,
                point(*stated, v, t),
            )
        }
        Check::HorizonSlantRangeKm { stated } => {
            let v = g.range_at(0.0) / 1e3;
            let t = c.tolerance.of(*stated);
            (
                "horizon_slant_range_km",
                json!(stated),
                json!({"slant_range_km": round(v, 1), "ground_arc_km": round(g.ground_arc_km(0.0), 1)}),
                t,
                point(*stated, v, t),
            )
        }
        Check::AltitudeRatio {
            reference_altitude_km,
            stated,
        } => {
            let v = positive("reference_altitude_km", *reference_altitude_km)? / s.altitude_km;
            let t = c.tolerance.of(*stated);
            (
                "altitude_ratio",
                json!(stated),
                json!(round(v, 2)),
                t,
                point(*stated, v, t),
            )
        }
        Check::SpreadingLossDb {
            stated_min,
            stated_max,
            mask_deg,
        } => {
            let e = mask(*mask_deg)?.to_radians();
            let lo = spreading_db(g.range_at(e));
            let hi = spreading_db(g.range_at(std::f64::consts::FRAC_PI_2));
            let t = c.tolerance.abs.unwrap_or(0.0);
            (
                "spreading_loss_db",
                json!([stated_min, stated_max]),
                json!([round(lo, 1), round(hi, 1)]),
                t,
                interval((*stated_min, *stated_max), (lo, hi), t),
            )
        }
        Check::SpreadingAdvantage {
            reference_altitude_km,
            stated_min,
            stated_max,
            mask_deg,
        } => {
            let e = mask(*mask_deg)?.to_radians();
            let r = Geometry::new(
                positive("reference_altitude_km", *reference_altitude_km)?,
                0.0,
                s.earth_radius_km,
            );
            let z = std::f64::consts::FRAC_PI_2;
            let ratio = |dr: f64, ds: f64| (dr / ds).ppowi(2);
            let equal = (
                ratio(r.range_at(e), g.range_at(e)),
                ratio(r.range_at(z), g.range_at(z)),
            );
            let equal = (equal.0.min(equal.1), equal.0.max(equal.1));
            let any = (
                ratio(r.range_at(z), g.range_at(e)),
                ratio(r.range_at(e), g.range_at(z)),
            );
            let t = c.tolerance.of(*stated_max);
            (
                "spreading_advantage",
                json!([stated_min, stated_max]),
                json!({
                    "equal_elevation": [round(equal.0, 1), round(equal.1, 1)],
                    "any_elevations": [round(any.0, 1), round(any.1, 1)],
                    "spreading_only": true,
                }),
                t,
                interval((*stated_min, *stated_max), any, t),
            )
        }
        Check::PowerAdvantage {
            stated_ratio,
            system_dbw,
            reference_dbw,
            ..
        } => {
            let stated_db = 10.0 * positive("stated_ratio", *stated_ratio)?.plog10();
            let lmin = system_dbw[0] - reference_dbw[0];
            let lmax = system_dbw[1] - reference_dbw[1];
            let best = system_dbw[1] - reference_dbw[0];
            let worst = system_dbw[0] - reference_dbw[1];
            let t = c.tolerance.abs.unwrap_or(0.0);
            let x = |db: f64| round(10f64.ppowf(db / 10.0), 1);
            let outcome = if lmin.max(lmax) + t >= stated_db {
                "reached_like_for_like"
            } else if best + t >= stated_db {
                "reached_only_at_the_extremes"
            } else {
                "not_reached_with_cited_powers"
            };
            (
                "power_advantage",
                json!({"ratio": stated_ratio, "db": round(stated_db, 2)}),
                json!({
                    "minimum_to_minimum_db": round(lmin, 2), "minimum_to_minimum_ratio": x(lmin),
                    "maximum_to_maximum_db": round(lmax, 2), "maximum_to_maximum_ratio": x(lmax),
                    "system_maximum_to_reference_minimum_db": round(best, 2),
                    "system_maximum_to_reference_minimum_ratio": x(best),
                    "system_minimum_to_reference_maximum_db": round(worst, 2),
                    "system_minimum_to_reference_maximum_ratio": x(worst),
                }),
                t,
                outcome,
            )
        }
    };
    Ok(Row {
        system: s.name.clone(),
        id: c.id.clone(),
        check: name,
        source: c.source.clone(),
        note: c.note.clone(),
        stated,
        computed,
        tolerance: tol,
        outcome,
    })
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn kepler_and_horizon_geometry() {
        let g = Geometry::new(1080.0, 97.0, 6371.0);
        assert!((g.period_s() / 60.0 - 106.68).abs() < 0.01);
        assert!((g.speed() - 7314.0).abs() < 0.5);
        assert!((g.range_at(0.0) / 1e3 - 3864.0).abs() < 1.0);
        assert!((g.range_at(std::f64::consts::FRAC_PI_2) / 1e3 - 1080.0).abs() < 1e-6);
        // A GPS-height orbit: zenith spreading loss about −157 dB.
        let gps = Geometry::new(20200.0, 55.0, 6371.0);
        assert!((spreading_db(gps.range_at(std::f64::consts::FRAC_PI_2)) + 157.1).abs() < 0.1);
    }

    #[test]
    fn a_satellite_overhead_has_its_largest_doppler_rate_and_no_doppler() {
        // Polar orbit, user on the equator under the satellite: range rate zero at zenith.
        let g = Geometry::new(1080.0, 90.0, 6371.0);
        let rr = g.range_rate(0.0, 0.0, 0.0, 0.0).unwrap();
        assert!(rr.abs() < 1.0, "{rr}");
        // Overhead, the range acceleration is v²(1/h − 1/r): the satellite's transverse speed over
        // the range, less its own centripetal acceleration along the line of sight. The Earth's
        // rotation adds a few per cent.
        let acc = g.range_accel(0.0, 0.0, 0.0, 0.0).unwrap();
        let want = g.speed().powi(2) * (1.0 / 1.08e6 - 1.0 / g.r);
        assert!(acc > 0.95 * want && acc < 1.1 * want, "{acc} {want}");
    }
}
