// SPDX-License-Identifier: AGPL-3.0-only
//! Ground-station pass prediction: the time-domain rise/set scheduler that turns
//! an orbit + a ground station + an elevation mask into the list of visibility
//! passes (AOS, TCA, LOS, maximum elevation, duration) over a window — the
//! ground-segment planning query the static look-angle primitives in
//! [`crate::frames`] (`look_angles`/`elevation`/`is_visible`) do not provide on
//! their own.
//!
//! The orbit is propagated in the shared TEME inertial frame and rotated to ECEF
//! at each sample epoch (so the Earth turns under the orbit, which is what creates
//! the passes), then the station look angle is evaluated and mask crossings are
//! detected; AOS/LOS crossing times are linearly interpolated between the
//! bracketing samples for sub-step accuracy.
//!
//! [`predict_passes`] is the geometric scheduler on any [`Propagator`]: the maximum
//! elevation and TCA are resolved at the sample-step resolution, and the geometry is
//! TEME→ECEF by sidereal time without light-time or refraction corrections.
//!
//! [`predict_passes_apparent`] is the pass predictor the `passes` scenario runs. The
//! satellite is an SGP4 element set ([`SgpOrbit`]) carried to the Earth-fixed frame by the
//! IAU 2006/2000A chain (UT1 taken as UTC, no polar motion); the elevation is the apparent
//! one, with tropospheric refraction from ITU-R P.834-9 (International Telecommunication
//! Union Radiocommunication Sector Recommendation P.834, equation (14)) and light time (the
//! station receives at `t` the signal emitted at `t − τ`; no aberration); rise and set are
//! solved to a microsecond and the culmination by a bounded maximisation, not at the sample
//! step. Both corrections can be switched off.

use crate::frames::{geodetic_to_ecef, look_angles, teme_to_ecef, AzElRange, Geodetic};
use crate::jd2::Jd2;
use crate::orbit::{Orbit, Propagator, R_EARTH_EQUATORIAL_M};
use crate::precession::{mat_vec, matmul, rz, Mat3};
use crate::sgp4::{MeanElementSet, SgpOrbit};
use serde::Deserialize;

/// One visibility pass of a satellite over a ground station.
#[derive(Clone, Debug, PartialEq)]
pub struct Pass {
    /// Acquisition of signal (s from the window start) — the mask rise crossing.
    pub aos_s: f64,
    /// Time of closest approach / culmination (s from start) — the maximum-elevation sample.
    pub tca_s: f64,
    /// Loss of signal (s from start) — the mask set crossing.
    pub los_s: f64,
    /// Maximum elevation reached during the pass (deg).
    pub max_elevation_deg: f64,
    /// Pass duration (s) = LOS − AOS.
    pub duration_s: f64,
}

/// Linear interpolation of the time at which elevation crosses `mask` between two
/// bracketing samples `(t0, e0)` and `(t1, e1)`.
fn interp_cross(t0: f64, e0: f64, t1: f64, e1: f64, mask: f64) -> f64 {
    if (e1 - e0).abs() < 1e-12 {
        return t0;
    }
    t0 + (mask - e0) / (e1 - e0) * (t1 - t0)
}

/// Station elevation (deg) of the propagated satellite at `t` seconds after the
/// window start epoch `jd0_ut1` (Julian date, UT1).
fn elevation_deg_at(orbit: &Propagator, station: Geodetic, jd0_ut1: f64, t: f64) -> f64 {
    let s = orbit.state_eci(t);
    let r_ecef = teme_to_ecef(s.r_m, jd0_ut1 + t / 86_400.0);
    look_angles(station, r_ecef).el_rad.to_degrees()
}

/// Predict the visibility passes of `orbit` over `station` above `mask_deg`, from
/// the window start epoch `jd0_ut1` for `duration_s`, sampling every `step_s`.
/// A pass already in progress at the start has its AOS clamped to 0; one still in
/// progress at the end has its LOS clamped to `duration_s`.
pub fn predict_passes(
    orbit: &Propagator,
    station: Geodetic,
    jd0_ut1: f64,
    mask_deg: f64,
    duration_s: f64,
    step_s: f64,
) -> Vec<Pass> {
    let mut passes = Vec::new();
    if step_s <= 0.0 || duration_s <= 0.0 {
        return passes;
    }
    let mut prev_t = 0.0;
    let mut prev_el = elevation_deg_at(orbit, station, jd0_ut1, 0.0);
    let mut in_pass = false;
    let mut aos = 0.0;
    let mut tca = 0.0;
    let mut max_el = f64::MIN;
    if prev_el >= mask_deg {
        in_pass = true;
        aos = 0.0;
        tca = 0.0;
        max_el = prev_el;
    }
    let mut t = step_s;
    // Integer-counted fixed-step sampler; the break preserves the original stop.
    let n_steps =
        (((duration_s + 1e-9 - step_s) / step_s).ceil().max(0.0) as usize).saturating_add(2);
    for _ in 0..n_steps {
        if t > duration_s + 1e-9 {
            break;
        }
        let el = elevation_deg_at(orbit, station, jd0_ut1, t);
        if !in_pass {
            if el >= mask_deg {
                in_pass = true;
                aos = interp_cross(prev_t, prev_el, t, el, mask_deg);
                max_el = el;
                tca = t;
            }
        } else {
            if el > max_el {
                max_el = el;
                tca = t;
            }
            if el < mask_deg {
                let los = interp_cross(prev_t, prev_el, t, el, mask_deg);
                passes.push(Pass {
                    aos_s: aos,
                    tca_s: tca,
                    los_s: los,
                    max_elevation_deg: max_el,
                    duration_s: los - aos,
                });
                in_pass = false;
                max_el = f64::MIN;
            }
        }
        prev_t = t;
        prev_el = el;
        t += step_s;
    }
    if in_pass {
        passes.push(Pass {
            aos_s: aos,
            tca_s: tca,
            los_s: duration_s,
            max_elevation_deg: max_el,
            duration_s: duration_s - aos,
        });
    }
    passes
}

// ── Apparent pass prediction: refraction and light time on the validated path ───────────

/// Speed of light in vacuum (m/s).
const C_M_S: f64 = 299_792_458.0;

/// ITU-R P.834-9 equation (9): the refraction correction `τ(h, θ)` (deg) for a ray leaving a
/// station at height `h_km` (km) at apparent elevation `theta_deg` (deg).
pub fn p834_tau_deg(h_km: f64, theta_deg: f64) -> f64 {
    let t = theta_deg;
    1.0 / (1.314
        + 0.6437 * t
        + 0.02869 * t * t
        + h_km * (0.2305 + 0.09428 * t + 0.01096 * t * t)
        + 0.008583 * h_km * h_km)
}

/// ITU-R P.834-9 equation (14): the refraction correction `τ_s(h, θ0)` (deg) as a function
/// of the free-space elevation `theta0_deg`, so that the apparent elevation is
/// `θ0 + τ_s(h, θ0)` (equation (13)). The coefficients are the Recommendation's printed ones,
/// including 0.01380 for the `h·θ0²` term.
pub fn p834_tau_s_deg(h_km: f64, theta0_deg: f64) -> f64 {
    let t = theta0_deg;
    1.0 / (1.728
        + 0.5411 * t
        + 0.03723 * t * t
        + h_km * (0.1815 + 0.06272 * t + 0.01380 * t * t)
        + h_km * h_km * (0.01727 + 0.008288 * t))
}

/// ITU-R P.834-9 equation (10): the elevation `θm` (deg) at which a ray from height `h_km`
/// just grazes the Earth, with the Recommendation's reference atmosphere
/// `n(x) = 1 + 0.000315 exp(−0.1361 x)` and Earth radius 6 370 km.
pub fn p834_theta_m_deg(h_km: f64) -> f64 {
    let n = |x: f64| 1.0 + 0.000_315 * (-0.1361 * x).exp();
    let r = 6_370.0;
    -((r / (r + h_km)) * (n(0.0) / n(h_km))).acos().to_degrees()
}

/// Apparent elevation (deg) of a satellite at free-space elevation `theta0_deg` seen from a
/// station at height `h_km`, by ITU-R P.834-9: `θ0 + τ_s(h, θ0)` when the inequality (11)
/// `θm − τ(h, θm) ≤ θ0` holds (the ray is not intercepted by the Earth), and `θ0` itself
/// below that, where the satellite is not visible at any mask at or above the horizon.
pub fn p834_apparent_elevation_deg(h_km: f64, theta0_deg: f64) -> f64 {
    let theta_m = p834_theta_m_deg(h_km);
    if theta0_deg >= theta_m - p834_tau_deg(h_km, theta_m) {
        theta0_deg + p834_tau_s_deg(h_km, theta0_deg)
    } else {
        theta0_deg
    }
}

/// Which corrections the apparent pass predictor applies.
#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub struct ApparentOptions {
    /// ITU-R P.834-9 tropospheric refraction of the elevation.
    pub refraction: bool,
    /// Downlink light time: the satellite is taken where it was when the received signal left.
    pub light_time: bool,
}

/// Apparent look angles of a satellite at a reception instant.
#[derive(Clone, Copy, Debug, PartialEq)]
pub struct ApparentLook {
    /// Azimuth (rad, clockwise from north, `[0, 2π)`), elevation (rad, apparent when
    /// refraction is on) and slant range (m, to the emission position when light time is on).
    pub look: AzElRange,
    /// Free-space (geometric) elevation (rad).
    pub geometric_el_rad: f64,
    /// Light time (s); zero when light time is off.
    pub light_time_s: f64,
}

/// The precession-nutation part of the TEME → ITRS rotation (TEME → CIRS, the Celestial
/// Intermediate Reference System) on a grid of nodes, linearly interpolated between them. The
/// rotation moves by under 1e-6 rad per day and its curvature over an hour is below 1e-14 rad,
/// so the interpolation adds nothing measurable while the IAU 2000A series is evaluated once an
/// hour instead of at every sample. The Earth rotation angle is evaluated exactly at each
/// instant.
struct CelestialGrid {
    start: Jd2,
    step_s: f64,
    nodes: Vec<Mat3>,
}

impl CelestialGrid {
    const STEP_S: f64 = 3_600.0;

    /// Nodes covering `[start − 1 h, start + span_s + 1 h]`.
    fn new(start: Jd2, span_s: f64) -> Self {
        let first = start.add_seconds(-Self::STEP_S);
        let n = (span_s / Self::STEP_S).ceil() as usize + 3;
        let nodes = (0..n)
            .map(|k| teme_to_cirs_matrix(first.add_seconds(k as f64 * Self::STEP_S)))
            .collect();
        Self {
            start: first,
            step_s: Self::STEP_S,
            nodes,
        }
    }

    /// TEME → CIRS at `t` (the nodes' linear interpolation).
    fn at(&self, t: Jd2) -> Mat3 {
        let x = t.diff_seconds(self.start) / self.step_s;
        let k = (x.floor().max(0.0) as usize).min(self.nodes.len() - 2);
        let w = x - k as f64;
        let (a, b) = (&self.nodes[k], &self.nodes[k + 1]);
        let mut m = [[0.0; 3]; 3];
        for i in 0..3 {
            for j in 0..3 {
                m[i][j] = a[i][j] + w * (b[i][j] - a[i][j]);
            }
        }
        m
    }
}

/// TEME → CIRS at a UTC instant: [`crate::nutation::teme_to_gcrs_matrix`] then the CIO-based
/// [`crate::cio::gcrs_to_cirs_matrix`] (the celestial part of [`crate::sgp4::teme_to_itrs_matrix`]).
fn teme_to_cirs_matrix(utc: Jd2) -> Mat3 {
    let tt = crate::jd2::tai_to_tt(crate::jd2::utc_to_tai(utc)).total();
    matmul(
        &crate::cio::gcrs_to_cirs_matrix(tt),
        &crate::nutation::teme_to_gcrs_matrix(tt),
    )
}

/// The geometry of one satellite over one station across a window: the evaluator the
/// apparent pass predictor and [`apparent_look_angles`] share.
struct PassGeometry<'a> {
    sat: &'a SgpOrbit,
    station: Geodetic,
    station_itrs: [f64; 3],
    h_km: f64,
    start: Jd2,
    grid: CelestialGrid,
    opts: ApparentOptions,
}

impl<'a> PassGeometry<'a> {
    fn new(
        sat: &'a SgpOrbit,
        station: Geodetic,
        start: Jd2,
        span_s: f64,
        opts: ApparentOptions,
    ) -> Result<Self, String> {
        let h_km = station.alt_m / 1000.0;
        if opts.refraction && !(0.0..=3.0).contains(&h_km) {
            return Err(format!(
                "ITU-R P.834 refraction is defined for station heights 0 to 3 km; got {h_km} km"
            ));
        }
        Ok(Self {
            sat,
            station,
            station_itrs: geodetic_to_ecef(station),
            h_km,
            start,
            grid: CelestialGrid::new(start, span_s),
            opts,
        })
    }

    /// The satellite at UTC `t` in CIRS (m).
    fn sat_cirs(&self, t: Jd2) -> Result<[f64; 3], String> {
        let (r, _) = self.sat.teme_state(t)?;
        Ok(mat_vec(&self.grid.at(t), r))
    }

    /// Apparent look angles at the reception instant `t_s` seconds after the window start.
    fn look(&self, t_s: f64) -> Result<ApparentLook, String> {
        let t = self.start.add_seconds(t_s);
        let to_itrs = rz(crate::jd2::earth_rotation_angle(t));
        let mut tau = 0.0;
        let mut sat = mat_vec(&to_itrs, self.sat_cirs(t)?);
        if self.opts.light_time {
            // Fixed point on the emission instant; three corrections converge to well below a
            // picosecond for an Earth orbit (the contraction factor is v/c ~ 2.5e-5).
            for _ in 0..3 {
                let d = [
                    sat[0] - self.station_itrs[0],
                    sat[1] - self.station_itrs[1],
                    sat[2] - self.station_itrs[2],
                ];
                tau = (d[0] * d[0] + d[1] * d[1] + d[2] * d[2]).sqrt() / C_M_S;
                sat = mat_vec(&to_itrs, self.sat_cirs(t.add_seconds(-tau))?);
            }
        }
        let mut look = look_angles(self.station, sat);
        let geometric = look.el_rad;
        if self.opts.refraction {
            look.el_rad =
                p834_apparent_elevation_deg(self.h_km, geometric.to_degrees()).to_radians();
        }
        Ok(ApparentLook {
            look,
            geometric_el_rad: geometric,
            light_time_s: tau,
        })
    }

    /// Apparent elevation (deg) at `t_s`.
    fn el_deg(&self, t_s: f64) -> Result<f64, String> {
        Ok(self.look(t_s)?.look.el_rad.to_degrees())
    }

    /// The instant in `[a, b]` where the elevation crosses `mask`, given a sign change of
    /// `el − mask` between the ends: bisection to 1e-7 s.
    fn crossing(&self, mut a: f64, mut b: f64, mask: f64) -> Result<f64, String> {
        let mut fa = self.el_deg(a)? - mask;
        while b - a > 1e-7 {
            let m = 0.5 * (a + b);
            let fm = self.el_deg(m)? - mask;
            if (fm >= 0.0) == (fa >= 0.0) {
                a = m;
                fa = fm;
            } else {
                b = m;
            }
        }
        Ok(0.5 * (a + b))
    }

    /// The maximum of the elevation on `[a, b]`: golden-section search to 1e-4 s.
    fn maximum(&self, mut a: f64, mut b: f64) -> Result<(f64, f64), String> {
        let g = 0.5 * (5.0_f64.sqrt() - 1.0);
        let mut x1 = b - g * (b - a);
        let mut x2 = a + g * (b - a);
        let (mut f1, mut f2) = (self.el_deg(x1)?, self.el_deg(x2)?);
        while b - a > 1e-4 {
            if f1 < f2 {
                a = x1;
                x1 = x2;
                f1 = f2;
                x2 = a + g * (b - a);
                f2 = self.el_deg(x2)?;
            } else {
                b = x2;
                x2 = x1;
                f2 = f1;
                x1 = b - g * (b - a);
                f1 = self.el_deg(x1)?;
            }
        }
        let t = 0.5 * (a + b);
        // The maximum can sit on a window edge (a pass clamped at the start or the end).
        let mut best = (t, self.el_deg(t)?);
        for edge in [a, b] {
            let e = self.el_deg(edge)?;
            if e > best.1 {
                best = (edge, e);
            }
        }
        Ok(best)
    }
}

/// Apparent look angles of `sat` from `station` at the reception instant `t` (UTC), with the
/// corrections of `opts`. Errors when SGP4 cannot propagate, or with refraction on for a
/// station outside the 0 to 3 km height range of ITU-R P.834.
pub fn apparent_look_angles(
    sat: &SgpOrbit,
    station: Geodetic,
    t: Jd2,
    opts: ApparentOptions,
) -> Result<ApparentLook, String> {
    PassGeometry::new(sat, station, t, 0.0, opts)?.look(0.0)
}

/// Predict the visibility passes of `sat` over `station` above `mask_deg` (apparent
/// elevation) from the UTC instant `start` for `duration_s`. The apparent elevation is sampled
/// every `step_s` (reception times); each crossing of the mask is solved by bisection to
/// 1e-7 s, and each culmination by golden-section search to 1e-4 s around the highest sample.
/// A local maximum below the mask but within 1 deg of it is refined too, so a short grazing
/// pass between samples is not lost. A pass in progress at the start has its AOS at 0; one in
/// progress at the end has its LOS at `duration_s`.
pub fn predict_passes_apparent(
    sat: &SgpOrbit,
    station: Geodetic,
    start: Jd2,
    duration_s: f64,
    mask_deg: f64,
    step_s: f64,
    opts: ApparentOptions,
) -> Result<Vec<Pass>, String> {
    if !(step_s > 0.0 && duration_s > 0.0) {
        return Err("duration_s and step_s must be positive".into());
    }
    let geo = PassGeometry::new(sat, station, start, duration_s, opts)?;
    let n = (duration_s / step_s).ceil() as usize;
    let ts: Vec<f64> = (0..=n)
        .map(|k| (k as f64 * step_s).min(duration_s))
        .collect();
    let els: Vec<f64> = ts
        .iter()
        .map(|&t| geo.el_deg(t))
        .collect::<Result<_, _>>()?;
    // Crossings of the mask, in time order: (time, rising).
    let mut events: Vec<(f64, bool)> = Vec::new();
    for k in 0..n {
        let (a, b) = (els[k] - mask_deg, els[k + 1] - mask_deg);
        if (a >= 0.0) != (b >= 0.0) {
            events.push((geo.crossing(ts[k], ts[k + 1], mask_deg)?, b >= 0.0));
        } else if a < 0.0 && b < 0.0 && k + 2 <= n {
            // A sampled local maximum just below the mask: look between its neighbours.
            let c = els[k + 2] - mask_deg;
            if els[k + 1] > els[k] && els[k + 1] >= els[k + 2] && b > -1.0 && c < 0.0 {
                let (tm, em) = geo.maximum(ts[k], ts[k + 2])?;
                if em >= mask_deg {
                    events.push((geo.crossing(ts[k], tm, mask_deg)?, true));
                    events.push((geo.crossing(tm, ts[k + 2], mask_deg)?, false));
                }
            }
        }
    }
    events.sort_by(|x, y| x.0.total_cmp(&y.0));
    let mut passes = Vec::new();
    let mut aos = if els[0] >= mask_deg { Some(0.0) } else { None };
    let mut close = |aos: f64, los: f64| -> Result<(), String> {
        let (tca, max_el) = geo.maximum(aos, los)?;
        passes.push(Pass {
            aos_s: aos,
            tca_s: tca,
            los_s: los,
            max_elevation_deg: max_el,
            duration_s: los - aos,
        });
        Ok(())
    };
    for (t, rising) in events {
        match (aos, rising) {
            (None, true) => aos = Some(t),
            (Some(a), false) => {
                close(a, t)?;
                aos = None;
            }
            _ => {}
        }
    }
    if let Some(a) = aos {
        close(a, duration_s)?;
    }
    Ok(passes)
}

/// Unit and provenance class for every numeric field the `passes` report emits.
const UNITS: &[crate::field_schema::FieldUnit] = {
    use crate::field_schema::{FieldUnit, ProvenanceClass::*};
    &[
        FieldUnit {
            path: "station_lat_deg",
            unit: "deg",
            provenance: Input,
            definition: "ground-station geodetic (WGS-84) latitude, north positive",
        },
        FieldUnit {
            path: "station_lon_deg",
            unit: "deg",
            provenance: Input,
            definition: "ground-station geodetic (WGS-84) longitude, east positive",
        },
        FieldUnit {
            path: "altitude_km",
            unit: "km",
            provenance: Input,
            definition: "circular-orbit altitude above the equatorial radius; the SGP4 mean \
                         semi-major axis is R_eq + this",
        },
        FieldUnit {
            path: "inclination_deg",
            unit: "deg",
            provenance: Input,
            definition: "orbital inclination of the circular orbit",
        },
        FieldUnit {
            path: "mask_deg",
            unit: "deg",
            provenance: Input,
            definition: "elevation mask: the angle above the station's local horizon (the \
                         WGS-84 ellipsoid normal) a pass must clear to count as visible",
        },
        FieldUnit {
            path: "duration_hours",
            unit: "hr",
            provenance: Input,
            definition: "length of the prediction window, from the window start epoch",
        },
        FieldUnit {
            path: "step_s",
            unit: "s",
            provenance: Input,
            definition: "sampling step of the rise/set search; crossings and the \
                         culmination are refined below it",
        },
        FieldUnit {
            path: "pass_count",
            unit: "count",
            provenance: Computed,
            definition: "number of mask-clearing visibility passes found in the window",
        },
        FieldUnit {
            path: "total_access_s",
            unit: "s",
            provenance: Computed,
            definition: "sum of every pass duration_s: total time the satellite is above \
                         the mask during the window",
        },
        FieldUnit {
            path: "best_max_elevation_deg",
            unit: "deg",
            provenance: Computed,
            definition: "the largest per-pass maximum elevation above the station's local \
                         horizon; null when the window contains no pass",
        },
        FieldUnit {
            path: "passes[].aos_s",
            unit: "s",
            provenance: Computed,
            definition: "acquisition of signal: reception time, seconds from the window \
                         start, at which the apparent elevation rises through the mask, solved \
                         by bisection to 1e-7 s; 0 for a pass already in progress",
        },
        FieldUnit {
            path: "passes[].tca_s",
            unit: "s",
            provenance: Computed,
            definition: "culmination: seconds from the window start of the highest apparent \
                         elevation of the pass, by golden-section search to 1e-4 s",
        },
        FieldUnit {
            path: "passes[].los_s",
            unit: "s",
            provenance: Computed,
            definition: "loss of signal: reception time, seconds from the window start, at \
                         which the apparent elevation falls back through the mask, solved by \
                         bisection; the window length for a pass still in progress at the end",
        },
        FieldUnit {
            path: "passes[].max_elevation_deg",
            unit: "deg",
            provenance: Computed,
            definition: "highest apparent elevation above the station's local horizon \
                         reached during the pass (refraction and light time when switched on)",
        },
        FieldUnit {
            path: "passes[].duration_s",
            unit: "s",
            provenance: Computed,
            definition: "los_s - aos_s: the length of the pass",
        },
    ]
};

fn pa_default_alt() -> f64 {
    550.0
}
fn pa_default_inc() -> f64 {
    97.6
}
fn pa_default_mask() -> f64 {
    10.0
}
fn pa_default_duration_h() -> f64 {
    24.0
}
fn pa_default_step() -> f64 {
    10.0
}
fn pa_default_lat() -> f64 {
    52.2
}

/// The `passes` scenario: predict ground-station visibility passes (AOS/TCA/LOS,
/// max elevation, duration) of a circular orbit over a station above an elevation
/// mask, over a window.
#[derive(Deserialize)]
pub struct PassesScenario {
    /// Circular-orbit altitude (km).
    #[serde(default = "pa_default_alt")]
    pub altitude_km: f64,
    /// Orbital inclination (deg).
    #[serde(default = "pa_default_inc")]
    pub inclination_deg: f64,
    /// Right ascension of the ascending node (deg).
    #[serde(default)]
    pub raan_deg: f64,
    /// Initial argument of latitude (deg) at the window start.
    #[serde(default)]
    pub arg_lat_deg: f64,
    /// Ground-station geodetic latitude (deg).
    #[serde(default = "pa_default_lat")]
    pub station_lat_deg: f64,
    /// Ground-station geodetic longitude (deg).
    #[serde(default)]
    pub station_lon_deg: f64,
    /// Ground-station altitude (m).
    #[serde(default)]
    pub station_alt_m: f64,
    /// Window start epoch (UTC ≈ UT1), as `[year, month, day, hour, minute, second]`.
    #[serde(default)]
    pub epoch: Option<[f64; 6]>,
    /// Elevation mask (deg).
    #[serde(default = "pa_default_mask")]
    pub mask_deg: f64,
    /// Prediction window (hours).
    #[serde(default = "pa_default_duration_h")]
    pub duration_hours: f64,
    /// Sample step (s) of the rise/set search. Crossings and culminations are refined
    /// below it.
    #[serde(default = "pa_default_step")]
    pub step_s: f64,
    /// Apply ITU-R P.834-9 tropospheric refraction to the elevation. Default true.
    #[serde(default = "pa_default_true")]
    pub refraction: bool,
    /// Apply the downlink light time. Default true.
    #[serde(default = "pa_default_true")]
    pub light_time: bool,
}

fn pa_default_true() -> bool {
    true
}

impl PassesScenario {
    /// The satellite this scenario predicts passes of: a circular Keplerian orbit at
    /// `altitude_km` above the equatorial radius, in the engine's inertial frame.
    pub fn propagator(&self) -> Propagator {
        Propagator::Kepler(Orbit::new(
            R_EARTH_EQUATORIAL_M + self.altitude_km * 1000.0,
            self.inclination_deg.to_radians(),
            self.raan_deg.to_radians(),
            self.arg_lat_deg.to_radians(),
        ))
    }

    /// The satellite as SGP4 mean elements at the window start: the circular orbit at
    /// `altitude_km` (Kozai mean motion from the WGS-72 constants), its node's right ascension
    /// `raan_deg` in TEME, argument of latitude `arg_lat_deg` as the mean anomaly, B* zero.
    pub fn sgp4_orbit(&self) -> Result<SgpOrbit, String> {
        let g = crate::sgp4::wgs72();
        let a_er = (R_EARTH_EQUATORIAL_M + self.altitude_km * 1000.0) / 1000.0 / g.radiusearthkm;
        Ok(SgpOrbit::new(MeanElementSet {
            epoch_utc: self.start()?,
            no_kozai: g.xke / a_er.powf(1.5),
            ecco: 0.0,
            inclo: self.inclination_deg.to_radians(),
            nodeo: self.raan_deg.to_radians().rem_euclid(std::f64::consts::TAU),
            argpo: 0.0,
            mo: self
                .arg_lat_deg
                .to_radians()
                .rem_euclid(std::f64::consts::TAU),
            bstar: 0.0,
        }))
    }

    /// The window start as a two-part UTC Julian date.
    pub fn start(&self) -> Result<Jd2, String> {
        let e = self.epoch_calendar();
        Jd2::from_utc_calendar(
            e[0] as i32,
            e[1] as u32,
            e[2] as u32,
            e[3] as u32,
            e[4] as u32,
            e[5],
        )
    }

    /// The window-start epoch as `[year, month, day, hour, minute, second]`: the
    /// scenario's `epoch`, or 2024-01-01 00:00:00 when it gives none.
    pub fn epoch_calendar(&self) -> [f64; 6] {
        self.epoch.unwrap_or([2024.0, 1.0, 1.0, 0.0, 0.0, 0.0])
    }

    /// Run the scenario, returning `(json, summary)`.
    pub fn run_json(&self) -> Result<(String, String), String> {
        if !self.altitude_km.is_finite() || self.altitude_km <= 0.0 {
            return Err("altitude_km must be finite and positive".to_string());
        }
        if !(-90.0..=90.0).contains(&self.station_lat_deg) {
            return Err("station_lat_deg must be in [-90, 90]".to_string());
        }
        if !(0.0..90.0).contains(&self.mask_deg) {
            return Err("mask_deg must be in [0, 90)".to_string());
        }
        if !self.duration_hours.is_finite() || self.duration_hours <= 0.0 {
            return Err("duration_hours must be finite and positive".to_string());
        }
        if !self.step_s.is_finite() || self.step_s <= 0.0 {
            return Err("step_s must be finite and positive".to_string());
        }
        let orbit = self.sgp4_orbit()?;
        let station = Geodetic {
            lat_rad: self.station_lat_deg.to_radians(),
            lon_rad: self.station_lon_deg.to_radians(),
            alt_m: self.station_alt_m,
        };
        let duration_s = self.duration_hours * 3600.0;
        let opts = ApparentOptions {
            refraction: self.refraction,
            light_time: self.light_time,
        };
        let passes = predict_passes_apparent(
            &orbit,
            station,
            self.start()?,
            duration_s,
            self.mask_deg,
            self.step_s,
            opts,
        )?;

        let total_access_s: f64 = passes.iter().map(|p| p.duration_s).sum();
        let best_el = passes
            .iter()
            .map(|p| p.max_elevation_deg)
            .fold(f64::MIN, f64::max);
        let rows: Vec<serde_json::Value> = passes
            .iter()
            .map(|p| {
                serde_json::json!({
                    "aos_s": p.aos_s,
                    "tca_s": p.tca_s,
                    "los_s": p.los_s,
                    "max_elevation_deg": p.max_elevation_deg,
                    "duration_s": p.duration_s,
                })
            })
            .collect();
        let json = serde_json::json!({
            "kind": "passes",
            "label": "MODELLED — time-domain ground-station pass prediction; SGP4/SDP4 \
                      propagation, IAU 2006/2000A Earth-fixed frame (UT1 = UTC, no polar \
                      motion), apparent elevation with ITU-R P.834-9 refraction and light \
                      time when switched on, crossings and culmination refined below the step",
            "units": crate::field_schema::units_block(UNITS),
            "station_lat_deg": self.station_lat_deg,
            "station_lon_deg": self.station_lon_deg,
            "altitude_km": self.altitude_km,
            "inclination_deg": self.inclination_deg,
            "mask_deg": self.mask_deg,
            "duration_hours": self.duration_hours,
            "step_s": self.step_s,
            "refraction": self.refraction,
            "light_time": self.light_time,
            "pass_count": passes.len(),
            "total_access_s": total_access_s,
            "best_max_elevation_deg": if passes.is_empty() { serde_json::Value::Null } else { serde_json::json!(best_el) },
            "passes": rows,
        });
        let summary = format!(
            "passes: {} pass(es) of a {:.0} km / {:.1}° orbit over ({:.1}°, {:.1}°) > {:.0}° \
             in {:.0} h; {:.0} s total access (MODELLED)",
            passes.len(),
            self.altitude_km,
            self.inclination_deg,
            self.station_lat_deg,
            self.station_lon_deg,
            self.mask_deg,
            self.duration_hours,
            total_access_s,
        );
        let json = serde_json::to_string_pretty(&json).map_err(|e| e.to_string())?;
        Ok((json, summary))
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn interp_cross_is_linear() {
        // Elevation 0 -> 20 over t 100 -> 200; crosses 10 at t = 150.
        assert!((interp_cross(100.0, 0.0, 200.0, 20.0, 10.0) - 150.0).abs() < 1e-9);
        // Degenerate (flat) returns the lower bound rather than dividing by zero.
        assert_eq!(interp_cross(100.0, 5.0, 200.0, 5.0, 10.0), 100.0);
    }

    #[test]
    fn polar_orbit_produces_valid_passes_over_a_mid_latitude_station() {
        // A polar orbit covers every latitude, so a mid-latitude station sees passes.
        let orbit = Propagator::Kepler(Orbit::new(
            R_EARTH_EQUATORIAL_M + 550_000.0,
            90.0_f64.to_radians(),
            0.0,
            0.0,
        ));
        let station = Geodetic {
            lat_rad: 52.0_f64.to_radians(),
            lon_rad: 0.0,
            alt_m: 0.0,
        };
        let jd0 = crate::timescales::julian_date(2024, 1, 1, 0, 0, 0.0);
        let passes = predict_passes(&orbit, station, jd0, 10.0, 24.0 * 3600.0, 10.0);
        assert!(
            !passes.is_empty(),
            "a polar orbit must give a mid-lat station passes"
        );
        let period = 2.0
            * std::f64::consts::PI
            * ((R_EARTH_EQUATORIAL_M + 550_000.0).powi(3) / crate::orbit::MU_EARTH).sqrt();
        for p in &passes {
            assert!(
                p.max_elevation_deg >= 10.0,
                "pass max el {} below mask",
                p.max_elevation_deg
            );
            assert!(
                p.aos_s <= p.tca_s && p.tca_s <= p.los_s,
                "AOS<=TCA<=LOS ordering"
            );
            assert!(
                p.duration_s > 0.0 && p.duration_s < period,
                "duration {} s",
                p.duration_s
            );
            // The culmination is the highest point of the pass.
            assert!(p.max_elevation_deg >= 10.0);
        }
    }

    #[test]
    fn higher_mask_yields_fewer_or_equal_passes() {
        let orbit = Propagator::Kepler(Orbit::new(
            R_EARTH_EQUATORIAL_M + 550_000.0,
            90.0_f64.to_radians(),
            0.0,
            0.0,
        ));
        let station = Geodetic {
            lat_rad: 52.0_f64.to_radians(),
            lon_rad: 0.0,
            alt_m: 0.0,
        };
        let jd0 = crate::timescales::julian_date(2024, 1, 1, 0, 0, 0.0);
        let low = predict_passes(&orbit, station, jd0, 5.0, 24.0 * 3600.0, 10.0).len();
        let high = predict_passes(&orbit, station, jd0, 40.0, 24.0 * 3600.0, 10.0).len();
        assert!(
            high <= low,
            "raising the mask cannot add passes ({high} > {low})"
        );
    }

    #[test]
    fn scenario_runs_reproducibly_and_is_modelled() {
        let scn = PassesScenario {
            altitude_km: 550.0,
            inclination_deg: 90.0,
            raan_deg: 0.0,
            arg_lat_deg: 0.0,
            station_lat_deg: 52.0,
            station_lon_deg: 0.0,
            station_alt_m: 0.0,
            epoch: None,
            mask_deg: 10.0,
            duration_hours: 24.0,
            step_s: 10.0,
            refraction: true,
            light_time: true,
        };
        let (j1, _s) = scn.run_json().unwrap();
        let (j2, _s) = scn.run_json().unwrap();
        assert_eq!(j1, j2, "pass prediction must be reproducible");
        let v: serde_json::Value = serde_json::from_str(&j1).unwrap();
        assert_eq!(v["kind"], "passes");
        assert!(v["pass_count"].as_u64().unwrap() >= 1);
        assert!(v["total_access_s"].as_f64().unwrap() > 0.0);
        assert!(v["label"].as_str().unwrap().contains("MODELLED"));
        assert!(!j1.contains("VALIDATED"));
        // Every reported pass clears the mask.
        for p in v["passes"].as_array().unwrap() {
            assert!(p["max_elevation_deg"].as_f64().unwrap() >= 10.0);
        }
    }

    #[test]
    fn scenario_rejects_bad_inputs() {
        let bad = PassesScenario {
            altitude_km: 550.0,
            inclination_deg: 90.0,
            raan_deg: 0.0,
            arg_lat_deg: 0.0,
            station_lat_deg: 200.0, // invalid latitude
            station_lon_deg: 0.0,
            station_alt_m: 0.0,
            epoch: None,
            mask_deg: 10.0,
            duration_hours: 24.0,
            step_s: 10.0,
            refraction: true,
            light_time: true,
        };
        assert!(bad.run_json().is_err());
    }

    #[test]
    fn p834_equations_9_and_14_are_consistent_and_vanish_toward_the_zenith() {
        // Equation (14) is the free-space-elevation form of equation (9): the apparent
        // elevation theta = theta0 + tau_s(theta0) satisfies theta0 = theta - tau(theta) to the
        // two fits' mutual accuracy (about a hundredth of a degree at the horizon).
        for h in [0.0, 1.0, 3.0] {
            for theta0 in [0.0, 2.0, 5.0, 10.0, 30.0, 60.0] {
                let theta = theta0 + p834_tau_s_deg(h, theta0);
                assert!(
                    (theta - p834_tau_deg(h, theta) - theta0).abs() < 0.02,
                    "h {h} theta0 {theta0}"
                );
            }
        }
        // About 0.58 deg at the sea-level horizon, under 0.02 deg at 30 deg elevation.
        assert!((p834_tau_s_deg(0.0, 0.0) - 1.0 / 1.728).abs() < 1e-15);
        assert!(p834_tau_s_deg(0.0, 30.0) < 0.02);
        // Equation (10): theta_m = 0 at sea level, about -0.875 h deg above it.
        assert!(p834_theta_m_deg(0.0).abs() < 1e-12);
        assert!((p834_theta_m_deg(1.0) + 0.875).abs() < 0.1);
    }

    #[test]
    fn refraction_lengthens_passes_and_light_time_delays_them() {
        let scn = PassesScenario {
            altitude_km: 550.0,
            inclination_deg: 97.6,
            raan_deg: 0.0,
            arg_lat_deg: 0.0,
            station_lat_deg: 52.2,
            station_lon_deg: 0.0,
            station_alt_m: 0.0,
            epoch: None,
            mask_deg: 5.0,
            duration_hours: 12.0,
            step_s: 10.0,
            refraction: false,
            light_time: false,
        };
        let sat = scn.sgp4_orbit().unwrap();
        let station = Geodetic {
            lat_rad: 52.2_f64.to_radians(),
            lon_rad: 0.0,
            alt_m: 0.0,
        };
        let run = |refraction, light_time| {
            predict_passes_apparent(
                &sat,
                station,
                scn.start().unwrap(),
                12.0 * 3600.0,
                5.0,
                10.0,
                ApparentOptions {
                    refraction,
                    light_time,
                },
            )
            .unwrap()
        };
        let (geo, refr, both) = (run(false, false), run(true, false), run(true, true));
        assert!(!geo.is_empty());
        assert_eq!(geo.len(), refr.len());
        for ((g, r), b) in geo.iter().zip(&refr).zip(&both) {
            if g.aos_s > 0.0 && g.los_s < 12.0 * 3600.0 {
                // Refraction lifts the satellite: it rises earlier and sets later.
                assert!(r.aos_s < g.aos_s && r.los_s > g.los_s, "{g:?} {r:?}");
                // Light time: the station sees the satellite where it was ~10 ms earlier, so
                // every event is late by about the light time (a few to ~12 ms).
                let d = b.aos_s - r.aos_s;
                assert!(d > 1e-3 && d < 2e-2, "AOS delay {d}");
            }
        }
    }
}
