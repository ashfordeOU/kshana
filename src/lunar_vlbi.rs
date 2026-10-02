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
//! **Kernel path.** [`KernelGeometry`] computes the same delay from the NAIF kernels the
//! engine reads itself ([`crate::naif_kernel`]): JPL DE440 Earth and Moon, the DE440 lunar
//! principal axes and the ITRF93 Earth orientation (with UT1 and polar motion), each light time
//! converged in the barycentric frame (station at reception, beacon at emission, the Earth's
//! motion during the flight), and beacon partials with the light-time factor `1/(c − û·V)`.
//! Against ANISE light times through the same kernels it agrees to 0.12 ps on 75 delays and
//! 2.9e-7 relative on the partials (`tests/lunar_vlbi_anise_oracle.rs`). It is Newtonian: no
//! Shapiro, media or barycentric-to-geocentric scale term, and the reception epoch is in the
//! SPICE ephemeris-time convention ([`crate::naif_kernel::naif_et_from_utc`]).
//!
//! **Honesty / caveats (the analytic path below).** The analytic path is **NOT** validated: the
//! geometry is honest (a near-field two-range difference, Shapiro reused from `radiometric`),
//! but several deliberate simplifications are carried openly, and against the same ANISE
//! oracle it is 24 µs off (mostly the analytic Moon centre):
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
// The kernel path: DE440 positions, DE440 lunar principal axes, ITRF93 Earth
// orientation, and a converged light time.
// ---------------------------------------------------------------------------

/// NAIF codes used by the kernel path.
const NAIF_EARTH_MOON: (i32, i32) = (399, 301);
/// NAIF frame code of the ITRF93 Earth body-fixed frame (high-precision Earth PCK).
pub const FRAME_ITRF93: i32 = 3000;
/// NAIF frame code of the DE440 lunar principal-axis frame.
pub const FRAME_MOON_PA_DE440: i32 = 31008;

/// DE440-grade geometry for the delay, read from NAIF kernels by the engine's own
/// [`crate::naif_kernel`] reader: the planetary ephemeris (SPK, e.g. `de440s.bsp`), the Earth
/// orientation (binary PCK `earth_latest_high_prec.bpc`, ITRF93: precession, nutation, UT1 and
/// polar motion) and the lunar orientation (binary PCK `moon_pa_de440_200625.bpc`, the DE440
/// principal axes with physical libration).
#[derive(Clone, Debug)]
pub struct KernelGeometry {
    spk: crate::naif_kernel::SpkKernel,
    earth: crate::naif_kernel::PckKernel,
    moon: crate::naif_kernel::PckKernel,
}

/// One converged light time from the beacon to a station.
#[derive(Clone, Copy, Debug)]
pub struct LightTimeSolution {
    /// Light time (s).
    pub light_time_s: f64,
    /// Unit vector from the beacon at emission to the station at reception (J2000).
    pub unit_beacon_to_station: Vec3,
    /// Barycentric velocity of the beacon at emission (m/s, J2000).
    pub beacon_velocity_m_s: Vec3,
    /// Iterations used.
    pub iterations: usize,
}

impl KernelGeometry {
    /// Wrap three parsed kernels.
    pub fn new(
        spk: crate::naif_kernel::SpkKernel,
        earth_orientation: crate::naif_kernel::PckKernel,
        moon_orientation: crate::naif_kernel::PckKernel,
    ) -> Self {
        Self {
            spk,
            earth: earth_orientation,
            moon: moon_orientation,
        }
    }

    /// Read the three kernels from disk.
    pub fn open(
        spk: &std::path::Path,
        earth_orientation: &std::path::Path,
        moon_orientation: &std::path::Path,
    ) -> Result<Self, String> {
        Ok(Self::new(
            crate::naif_kernel::SpkKernel::open(spk)?,
            crate::naif_kernel::PckKernel::open(earth_orientation)?,
            crate::naif_kernel::PckKernel::open(moon_orientation)?,
        ))
    }

    /// Geocentric J2000 position (m) of an Earth-fixed (ITRF93) point at ET `(t_hi, t_lo)`.
    pub fn station_j2000(&self, ecef: Vec3, t_hi: f64, t_lo: f64) -> Result<Vec3, String> {
        let (r, _) = self.earth.rotation_from_j2000(FRAME_ITRF93, t_hi, t_lo)?;
        Ok(crate::naif_kernel::mat_vec(
            &crate::naif_kernel::mat_t(&r),
            ecef,
        ))
    }

    /// Geocentric J2000 position (m) and velocity (m/s) of a point fixed in the DE440 lunar
    /// principal-axis frame (`body`, m from the Moon's centre) at ET `(t_hi, t_lo)`.
    pub fn beacon_geocentric(
        &self,
        body: Vec3,
        t_hi: f64,
        t_lo: f64,
    ) -> Result<(Vec3, Vec3), String> {
        let (earth, moon) = NAIF_EARTH_MOON;
        let m = self.spk.state(moon, earth, t_hi, t_lo)?;
        let (r, dr) = self
            .moon
            .rotation_from_j2000(FRAME_MOON_PA_DE440, t_hi, t_lo)?;
        // r_j2000 = Rᵀ b; its rate is (dR/dt)ᵀ b.
        let off = crate::naif_kernel::mat_vec(&crate::naif_kernel::mat_t(&r), body);
        let doff = crate::naif_kernel::mat_vec(&crate::naif_kernel::mat_t(&dr), body);
        Ok((add(m[0], off), add(m[1], doff)))
    }

    /// The converged Newtonian light time from a beacon fixed in the lunar principal-axis frame
    /// (`body`, m) to an Earth-fixed station (`ecef`, m) receiving at ET `(t_hi, t_lo)`, in the
    /// solar-system barycentric frame: `c·LT = |E(t) + s(t) − E(t − LT) − G(t − LT) − p|`, with
    /// `E` the Earth's barycentric position, `s` the station, `G` the beacon relative to the
    /// Earth's centre and `p` an optional J2000 offset of the beacon (m; zero for the delay,
    /// used to check partials). `E(t) − E(t − LT)` is the Earth's Taylor step
    /// `v·LT − a·LT²/2` from its kernel velocity and acceleration at `t`; the neglected cubic
    /// term is below 1e-9 m. Iterated until the light time moves by less than 1e-15 s.
    pub fn light_time(
        &self,
        ecef: Vec3,
        body: Vec3,
        t_hi: f64,
        t_lo: f64,
        offset: Vec3,
    ) -> Result<LightTimeSolution, String> {
        let s = self.station_j2000(ecef, t_hi, t_lo)?;
        let e = self.spk.state(NAIF_EARTH_MOON.0, 0, t_hi, t_lo)?;
        let (v_e, a_e) = (e[1], e[2]);
        let mut lt = {
            let (g, _) = self.beacon_geocentric(body, t_hi, t_lo)?;
            norm(sub(s, add(g, offset))) / C
        };
        for it in 1..=30 {
            let d_e = [
                v_e[0] * lt - 0.5 * a_e[0] * lt * lt,
                v_e[1] * lt - 0.5 * a_e[1] * lt * lt,
                v_e[2] * lt - 0.5 * a_e[2] * lt * lt,
            ];
            let (g, g_dot) = self.beacon_geocentric(body, t_hi, t_lo - lt)?;
            let rho = sub(add(s, d_e), add(g, offset));
            let r = norm(rho);
            let next = r / C;
            let done = (next - lt).abs() <= 1e-15;
            lt = next;
            if done {
                let v_earth_te = [
                    v_e[0] - a_e[0] * lt,
                    v_e[1] - a_e[1] * lt,
                    v_e[2] - a_e[2] * lt,
                ];
                return Ok(LightTimeSolution {
                    light_time_s: lt,
                    unit_beacon_to_station: [rho[0] / r, rho[1] / r, rho[2] / r],
                    beacon_velocity_m_s: add(v_earth_te, g_dot),
                    iterations: it,
                });
            }
        }
        Err("light time did not converge to 1e-15 s in 30 iterations".into())
    }

    /// The near-field VLBI delay `LT(station 2) − LT(station 1)` (s) at the common reception
    /// epoch ET `(t_hi, t_lo)`, each light time converged by [`light_time`](Self::light_time).
    /// No Shapiro, media or barycentric-to-geocentric time-scale term.
    pub fn delay_s(
        &self,
        ecef1: Vec3,
        ecef2: Vec3,
        body: Vec3,
        t_hi: f64,
        t_lo: f64,
    ) -> Result<f64, String> {
        let z = [0.0; 3];
        Ok(self.light_time(ecef2, body, t_hi, t_lo, z)?.light_time_s
            - self.light_time(ecef1, body, t_hi, t_lo, z)?.light_time_s)
    }

    /// Partial of [`delay_s`](Self::delay_s) with respect to a J2000 offset of the beacon at
    /// emission (s/m), analytic with the light-time factor: for each station
    /// `∂LT/∂p = −û / (c − û·V)`, `û` the unit vector from beacon to station and `V` the
    /// beacon's barycentric velocity at emission; the delay partial is station 2's minus
    /// station 1's.
    pub fn delay_partials_beacon(
        &self,
        ecef1: Vec3,
        ecef2: Vec3,
        body: Vec3,
        t_hi: f64,
        t_lo: f64,
    ) -> Result<Vec3, String> {
        let z = [0.0; 3];
        let part = |ecef: Vec3| -> Result<Vec3, String> {
            let sol = self.light_time(ecef, body, t_hi, t_lo, z)?;
            let u = sol.unit_beacon_to_station;
            let v = sol.beacon_velocity_m_s;
            let den = C - (u[0] * v[0] + u[1] * v[1] + u[2] * v[2]);
            Ok([-u[0] / den, -u[1] / den, -u[2] / den])
        };
        let (p1, p2) = (part(ecef1)?, part(ecef2)?);
        Ok(sub(p2, p1))
    }

    /// Partial of [`delay_s`](Self::delay_s) with respect to the beacon's body-fixed position
    /// `body` (s/m, components along the DE440 lunar principal axes). For each station the
    /// light-time partial is `∂LT/∂b = −R_M(t − LT)·û / (c − û·V)`, `R_M` the J2000-to-principal
    /// axes rotation at that station's emission epoch; the delay partial is station 2's minus
    /// station 1's.
    pub fn delay_partials_beacon_body(
        &self,
        ecef1: Vec3,
        ecef2: Vec3,
        body: Vec3,
        t_hi: f64,
        t_lo: f64,
    ) -> Result<Vec3, String> {
        let z = [0.0; 3];
        let part = |ecef: Vec3| -> Result<Vec3, String> {
            let sol = self.light_time(ecef, body, t_hi, t_lo, z)?;
            let u = sol.unit_beacon_to_station;
            let v = sol.beacon_velocity_m_s;
            let den = C - (u[0] * v[0] + u[1] * v[1] + u[2] * v[2]);
            let (r, _) = self.moon.rotation_from_j2000(
                FRAME_MOON_PA_DE440,
                t_hi,
                t_lo - sol.light_time_s,
            )?;
            let ub = crate::naif_kernel::mat_vec(&r, u);
            Ok([-ub[0] / den, -ub[1] / den, -ub[2] / den])
        };
        let (p1, p2) = (part(ecef1)?, part(ecef2)?);
        Ok(sub(p2, p1))
    }

    /// Partials of [`delay_s`](Self::delay_s) with respect to the two stations' Earth-fixed
    /// (ITRF93) positions (s/m), returned as `(∂τ/∂s1, ∂τ/∂s2)`. For a station the light-time
    /// partial is `∂LT/∂s = R_E(t)·û / (c − û·V)`, `R_E` the J2000-to-ITRF93 rotation at the
    /// reception epoch; the delay `LT(2) − LT(1)` takes it with a minus sign for station 1.
    pub fn delay_partials_stations(
        &self,
        ecef1: Vec3,
        ecef2: Vec3,
        body: Vec3,
        t_hi: f64,
        t_lo: f64,
    ) -> Result<(Vec3, Vec3), String> {
        let z = [0.0; 3];
        let (r_e, _) = self.earth.rotation_from_j2000(FRAME_ITRF93, t_hi, t_lo)?;
        let part = |ecef: Vec3| -> Result<Vec3, String> {
            let sol = self.light_time(ecef, body, t_hi, t_lo, z)?;
            let u = sol.unit_beacon_to_station;
            let v = sol.beacon_velocity_m_s;
            let den = C - (u[0] * v[0] + u[1] * v[1] + u[2] * v[2]);
            let ue = crate::naif_kernel::mat_vec(&r_e, u);
            Ok([ue[0] / den, ue[1] / den, ue[2] / den])
        };
        let p1 = part(ecef1)?;
        let p2 = part(ecef2)?;
        Ok(([-p1[0], -p1[1], -p1[2]], p2))
    }
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
#[derive(Clone, Debug, serde::Deserialize)]
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
    /// Opt-in kernel path: a planetary SPK (e.g. JPL `de440s.bsp`). When this and the two
    /// orientation kernels below are all set, every sample is computed by [`KernelGeometry`]:
    /// the stations' WGS-84 coordinates are read as ITRF93 positions, the beacon is placed on
    /// the 1737.4 km sphere in the DE440 lunar principal-axis frame, the epochs are converted
    /// with [`crate::naif_kernel::naif_et_from_utc`], each light time is converged in the
    /// barycentric frame, and the report adds the epoch's beacon and station partials. Unset
    /// (the default), the analytic path runs.
    #[serde(default)]
    pub planetary_kernel_path: Option<String>,
    /// Kernel path: the binary Earth-orientation PCK (ITRF93, e.g. `earth_latest_high_prec.bpc`).
    #[serde(default)]
    pub earth_orientation_kernel_path: Option<String>,
    /// Kernel path: the binary lunar-orientation PCK (MOON_PA_DE440, e.g.
    /// `moon_pa_de440_200625.bpc`).
    #[serde(default)]
    pub moon_orientation_kernel_path: Option<String>,
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
            planetary_kernel_path: None,
            earth_orientation_kernel_path: None,
            moon_orientation_kernel_path: None,
        }
    }
}

/// Unit and provenance class for every numeric field the `lunar-vlbi` report emits.
///
/// Delays are seconds of the near-field two-range difference; the delay *rate* is a
/// seconds-of-delay per second-of-time ratio, so it is dimensionless. The near-field
/// correction is reported in microseconds because that is its magnitude at lunar
/// distance, while the delay it corrects is reported in seconds.
pub const UNITS: &[crate::field_schema::FieldUnit] = {
    use crate::field_schema::{FieldUnit, ProvenanceClass::*};
    &[
        FieldUnit {
            path: "baseline_km",
            unit: "km",
            provenance: Computed,
            definition: "Earth baseline length |r2 - r1| at the epoch, the two configured \
                         stations reduced to geocentric inertial (GCRS) coordinates",
        },
        FieldUnit {
            path: "beacon_range_km",
            unit: "km",
            provenance: Computed,
            definition: "geocentric range |r_B| of the lunar-surface beacon at the epoch",
        },
        FieldUnit {
            path: "delay_s",
            unit: "s",
            provenance: Computed,
            definition: "full VLBI delay at the epoch: the near-field two-range difference \
                         (|r2 - r_B| - |r1 - r_B|)/c plus the differenced Shapiro term, with \
                         both station clock offsets zero",
        },
        FieldUnit {
            path: "delay_rate_s_per_s",
            unit: "s/s",
            provenance: Computed,
            definition: "one-step forward finite difference of the full delay, \
                         (delay(t0 + dt) - delay(t0)) / dt; seconds of delay per second of \
                         time, hence dimensionless",
        },
        FieldUnit {
            path: "near_field_correction_us",
            unit: "us",
            provenance: Computed,
            definition: "wavefront-curvature term at the epoch: the near-field geometric \
                         delay minus the far-field plane-wave delay -(B.s_B)/c, in \
                         microseconds",
        },
        FieldUnit {
            path: "samples",
            unit: "count",
            provenance: Computed,
            definition: "epochs in `series`, sampled at `step_min` out to `horizon_hours`",
        },
        FieldUnit {
            path: "min_delay_s",
            unit: "s",
            provenance: Computed,
            definition: "smallest full VLBI delay over the sampled horizon",
        },
        FieldUnit {
            path: "max_delay_s",
            unit: "s",
            provenance: Computed,
            definition: "largest full VLBI delay over the sampled horizon",
        },
        FieldUnit {
            path: "horizon_hours",
            unit: "hr",
            provenance: Input,
            definition: "length of the observed pass",
        },
        FieldUnit {
            path: "series[].t_hours",
            unit: "hr",
            provenance: Computed,
            definition: "offset of this sample from the scenario epoch",
        },
        FieldUnit {
            path: "series[].delay_s",
            unit: "s",
            provenance: Computed,
            definition: "full VLBI delay at this sample, as `delay_s` at the epoch",
        },
        FieldUnit {
            path: "series[].geometric_delay_s",
            unit: "s",
            provenance: Computed,
            definition: "geometric (near-field) two-range-difference delay at this sample, \
                         (|r2 - r_B| - |r1 - r_B|)/c, without the Shapiro or clock terms",
        },
        FieldUnit {
            path: "series[].near_field_correction_us",
            unit: "us",
            provenance: Computed,
            definition: "wavefront-curvature correction at this sample, in microseconds",
        },
        FieldUnit {
            path: "series[].beacon_range_km",
            unit: "km",
            provenance: Computed,
            definition: "geocentric beacon range at this sample",
        },
        FieldUnit {
            path: "epoch_partials.beacon_body_s_per_m[]",
            unit: "s/m",
            provenance: Computed,
            definition: "kernel path only: partial of the light-time delay at the epoch with \
                         respect to the beacon's body-fixed position, components along the \
                         DE440 lunar principal axes",
        },
        FieldUnit {
            path: "epoch_partials.station1_itrf93_s_per_m[]",
            unit: "s/m",
            provenance: Computed,
            definition: "kernel path only: partial of the light-time delay at the epoch with \
                         respect to station 1's Earth-fixed (ITRF93) position",
        },
        FieldUnit {
            path: "epoch_partials.station2_itrf93_s_per_m[]",
            unit: "s/m",
            provenance: Computed,
            definition: "kernel path only: partial of the light-time delay at the epoch with \
                         respect to station 2's Earth-fixed (ITRF93) position",
        },
    ]
};

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
    /// Which geometry produced the delays: `"analytic"` (the default series Moon and mean
    /// lunar frame, one instantaneous geometry) or `"kernel"` ([`KernelGeometry`]: DE440,
    /// MOON_PA_DE440 and ITRF93 kernels with converged light times).
    pub geometry_path: &'static str,
    /// Kernel path only: the delay partials at the epoch.
    #[serde(skip_serializing_if = "Option::is_none")]
    pub epoch_partials: Option<LunarVlbiEpochPartials>,
}

/// The kernel path's delay partials at the scenario epoch (s/m).
#[derive(Clone, Copy, Debug, serde::Serialize)]
pub struct LunarVlbiEpochPartials {
    /// With respect to the beacon's position along the DE440 lunar principal axes.
    pub beacon_body_s_per_m: Vec3,
    /// With respect to station 1's ITRF93 position.
    pub station1_itrf93_s_per_m: Vec3,
    /// With respect to station 2's ITRF93 position.
    pub station2_itrf93_s_per_m: Vec3,
}

/// One sample's geometry, whichever path computed it: `(geometric delay, full delay,
/// near-field correction, beacon range, baseline)` in s, s, s, m, m.
type SampleGeometry = (f64, f64, f64, f64, f64);

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

    /// The kernel path's geometry, when all three kernel paths are set; `None` for the
    /// analytic path. Setting only some of them is an error.
    fn kernel_geometry(&self) -> Result<Option<KernelGeometry>, String> {
        match (
            self.planetary_kernel_path.as_deref(),
            self.earth_orientation_kernel_path.as_deref(),
            self.moon_orientation_kernel_path.as_deref(),
        ) {
            (None, None, None) => Ok(None),
            (Some(spk), Some(earth), Some(moon)) => Ok(Some(KernelGeometry::open(
                std::path::Path::new(spk),
                std::path::Path::new(earth),
                std::path::Path::new(moon),
            )?)),
            _ => Err("the kernel path needs planetary_kernel_path, \
                      earth_orientation_kernel_path and moon_orientation_kernel_path together"
                .to_string()),
        }
    }

    /// Reception epoch `t_hours` after the scenario epoch, as NAIF ephemeris time `(hi, lo)`.
    fn et_at(&self, t_hours: f64) -> (f64, f64) {
        let jd_day = crate::timescales::julian_date(
            self.epoch_year,
            self.epoch_month,
            self.epoch_day,
            0,
            0,
            0.0,
        );
        crate::naif_kernel::naif_et_from_utc(jd_day, t_hours * 3_600.0)
    }

    /// The kernel path's station ITRF93 positions and beacon body-fixed position (m).
    fn kernel_points(&self) -> (Vec3, Vec3, Vec3) {
        (
            crate::frames::geodetic_to_ecef(self.geodetic1()),
            crate::frames::geodetic_to_ecef(self.geodetic2()),
            crate::lunar::selenographic_to_mcmf(self.beacon_sel()),
        )
    }

    /// One sample on either path.
    fn sample_at(
        &self,
        kernel: Option<&KernelGeometry>,
        t_hours: f64,
    ) -> Result<SampleGeometry, String> {
        let (r1, r2, r_b, geom) = match kernel {
            None => {
                let (r1, r2, r_b) = self.geometry_at(t_hours);
                (r1, r2, r_b, geometric_delay_s(r1, r2, r_b))
            }
            Some(k) => {
                let (s1, s2, body) = self.kernel_points();
                let (hi, lo) = self.et_at(t_hours);
                let r1 = k.station_j2000(s1, hi, lo)?;
                let r2 = k.station_j2000(s2, hi, lo)?;
                let (r_b, _) = k.beacon_geocentric(body, hi, lo)?;
                (r1, r2, r_b, k.delay_s(s1, s2, body, hi, lo)?)
            }
        };
        // The full delay adds the differenced Shapiro term to this path's geometric delay
        // (on the analytic path exactly `vlbi_delay_s`, as before the kernel path existed).
        let full = match kernel {
            None => vlbi_delay_s(r1, r2, r_b, 0.0, 0.0, true),
            Some(_) => {
                geom + (vlbi_delay_s(r1, r2, r_b, 0.0, 0.0, true) - geometric_delay_s(r1, r2, r_b))
            }
        };
        let far_field = crate::radiometric::delta_dor(r_b, [0.0, 0.0, 0.0], sub(r2, r1));
        Ok((geom, full, geom - far_field, norm(r_b), norm(sub(r2, r1))))
    }

    /// Sample the pass over the horizon and summarise the VLBI delay, its rate, and the
    /// near-field correction. Panics if the kernel path is configured and fails; use
    /// [`try_run`](Self::try_run) to receive the error.
    pub fn run(&self) -> LunarVlbiReport {
        self.try_run().expect("lunar-vlbi scenario")
    }

    /// As [`run`](Self::run), returning an error when a configured kernel cannot be read or
    /// does not cover an epoch.
    pub fn try_run(&self) -> Result<LunarVlbiReport, String> {
        let kernel = self.kernel_geometry()?;
        let k = kernel.as_ref();
        let step_h = (self.step_min / 60.0).max(1e-6);
        let n = (self.horizon_hours / step_h).floor() as usize;
        let mut series: Vec<LunarVlbiSample> = Vec::with_capacity(n + 1);
        let mut min_delay = f64::INFINITY;
        let mut max_delay = f64::NEG_INFINITY;
        for i in 0..=n {
            let t = i as f64 * step_h;
            let (geom, delay, nfc, range_m, _) = self.sample_at(k, t)?;
            min_delay = min_delay.min(delay);
            max_delay = max_delay.max(delay);
            series.push(LunarVlbiSample {
                t_hours: t,
                delay_s: delay,
                geometric_delay_s: geom,
                near_field_correction_us: nfc * 1e6,
                beacon_range_km: range_m / 1e3,
            });
        }

        // Epoch geometry + a one-step finite-difference delay rate at the epoch.
        let (geom0, delay0, nfc0, range0_m, baseline0_m) = self.sample_at(k, 0.0)?;
        let baseline_km = baseline0_m / 1e3;
        let beacon_range_km = range0_m / 1e3;
        let nfc_us0 = nfc0 * 1e6;
        let dt_h = step_h.min(self.horizon_hours.max(step_h));
        let (_, delay1, _, _, _) = self.sample_at(k, dt_h)?;
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
                geometric_delay_s: geom0,
                near_field_correction_us: nfc_us0,
                beacon_range_km,
            });
        }

        let epoch_partials = match k {
            None => None,
            Some(k) => {
                let (s1, s2, body) = self.kernel_points();
                let (hi, lo) = self.et_at(0.0);
                let (p1, p2) = k.delay_partials_stations(s1, s2, body, hi, lo)?;
                Some(LunarVlbiEpochPartials {
                    beacon_body_s_per_m: k.delay_partials_beacon_body(s1, s2, body, hi, lo)?,
                    station1_itrf93_s_per_m: p1,
                    station2_itrf93_s_per_m: p2,
                })
            }
        };

        Ok(LunarVlbiReport {
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
            geometry_path: if k.is_some() { "kernel" } else { "analytic" },
            epoch_partials,
        })
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

    /// The cut DE440, ITRF93 and MOON_PA_DE440 kernels the integration tests use
    /// (2024-01-01, 25 h).
    fn fixture_kernels() -> (String, String, String) {
        let d = concat!(
            env!("CARGO_MANIFEST_DIR"),
            "/tests/fixtures/lunar_vlbi_anise_oracle/kernels/"
        );
        (
            format!("{d}de440s_2024-01-01.bsp"),
            format!("{d}earth_itrf93_2024-01-01.bpc"),
            format!("{d}moon_pa_de440_2024-01-01.bpc"),
        )
    }

    /// The body-frame beacon partials and the ITRF93 station partials of the kernel path equal
    /// a central difference of its own converged delay (an internal check of the algebra, not
    /// an oracle).
    #[test]
    fn kernel_partials_match_a_central_difference_of_the_kernel_delay() {
        let (spk, earth, moon) = fixture_kernels();
        let k = KernelGeometry::open(
            std::path::Path::new(&spk),
            std::path::Path::new(&earth),
            std::path::Path::new(&moon),
        )
        .unwrap();
        let g = |lat: f64, lon: f64, h: f64| {
            crate::frames::geodetic_to_ecef(Geodetic {
                lat_rad: lat.to_radians(),
                lon_rad: lon.to_radians(),
                alt_m: h,
            })
        };
        let s1 = g(40.4256, -116.8893, 1000.0);
        let s2 = g(-35.4014, 148.9819, 688.0);
        let body = [1_737_400.0, 0.0, 0.0];
        let (hi, lo) = crate::naif_kernel::naif_et_from_utc(2_460_310.5, 5.0 * 3_600.0);
        let h = 2_000.0;
        let fd = |f: &dyn Fn(Vec3) -> f64| -> Vec3 {
            let mut out = [0.0; 3];
            for (i, o) in out.iter_mut().enumerate() {
                let mut e = [0.0; 3];
                e[i] = h;
                let m = [-e[0], -e[1], -e[2]];
                *o = (f(e) - f(m)) / (2.0 * h);
            }
            out
        };
        let rel = |a: Vec3, b: Vec3| norm(sub(a, b)) / norm(b);
        let pb = k.delay_partials_beacon_body(s1, s2, body, hi, lo).unwrap();
        let fb = fd(&|e| k.delay_s(s1, s2, add(body, e), hi, lo).unwrap());
        assert!(rel(pb, fb) < 1e-6, "beacon body partials {}", rel(pb, fb));
        let (p1, p2) = k.delay_partials_stations(s1, s2, body, hi, lo).unwrap();
        let f1 = fd(&|e| k.delay_s(add(s1, e), s2, body, hi, lo).unwrap());
        let f2 = fd(&|e| k.delay_s(s1, add(s2, e), body, hi, lo).unwrap());
        assert!(rel(p1, f1) < 1e-8, "station 1 partials {}", rel(p1, f1));
        assert!(rel(p2, f2) < 1e-8, "station 2 partials {}", rel(p2, f2));
    }

    /// With the three kernels set the scenario runs on the kernel path: its geometric delays
    /// are `KernelGeometry::delay_s` at the NAIF epochs, the report says so and carries the
    /// epoch partials; with one kernel missing the run is refused.
    #[test]
    fn scenario_kernel_path_emits_the_kernel_delay() {
        let (spk, earth, moon) = fixture_kernels();
        let scn = LunarVlbiScenario {
            planetary_kernel_path: Some(spk.clone()),
            earth_orientation_kernel_path: Some(earth.clone()),
            moon_orientation_kernel_path: Some(moon.clone()),
            ..LunarVlbiScenario::default()
        };
        let r = scn.try_run().unwrap();
        assert_eq!(r.geometry_path, "kernel");
        let k = KernelGeometry::open(
            std::path::Path::new(&spk),
            std::path::Path::new(&earth),
            std::path::Path::new(&moon),
        )
        .unwrap();
        let (s1, s2, body) = scn.kernel_points();
        assert_eq!(body, [1_737_400.0, 0.0, 0.0]);
        for s in &r.series {
            let (hi, lo) = crate::naif_kernel::naif_et_from_utc(2_460_310.5, s.t_hours * 3_600.0);
            let want = k.delay_s(s1, s2, body, hi, lo).unwrap();
            assert_eq!(s.geometric_delay_s, want);
            assert!(
                (s.delay_s - s.geometric_delay_s).abs() < 1e-9,
                "Shapiro is sub-ns"
            );
        }
        let p = r.epoch_partials.expect("kernel path partials");
        let (hi, lo) = crate::naif_kernel::naif_et_from_utc(2_460_310.5, 0.0);
        assert_eq!(
            p.beacon_body_s_per_m,
            k.delay_partials_beacon_body(s1, s2, body, hi, lo).unwrap()
        );
        // The analytic default is unchanged and labelled.
        let a = LunarVlbiScenario::default().try_run().unwrap();
        assert_eq!(a.geometry_path, "analytic");
        assert!(a.epoch_partials.is_none());
        // The two paths differ by the analytic path's recorded tens of microseconds.
        let gap = (a.series[0].geometric_delay_s - r.series[0].geometric_delay_s).abs();
        assert!((1e-7..1e-4).contains(&gap), "analytic vs kernel {gap:e} s");
        let partial = LunarVlbiScenario {
            moon_orientation_kernel_path: None,
            ..scn
        };
        assert!(partial.try_run().unwrap_err().contains("together"));
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
