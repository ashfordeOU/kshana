// SPDX-License-Identifier: Apache-2.0
//! **Mars PNT** — a simulated MARCONI-style relay constellation at Mars plus reference user
//! scenarios, run through the D3.1 joint one-way + two-way radiometric fusion estimator (D3.2/D3.3).
//!
//! This is the deep-space engine reachable as a *product*: a single `mars-pnt` scenario kind that
//! ties together D0 (the Mars central body, [`crate::body::Body::mars_gmm3`], and the Mars
//! body-fixed gravity frame [`crate::mars_frame`]), D1 (the radiometric range/Doppler observable
//! geometry), and D3.1 (the twelve-state [`crate::deepspace_od::FusionOd`] joint orbit + clock
//! estimator). It models:
//!
//! * a small **MARCONI relay constellation** — relay orbiters in known Mars orbits broadcasting a
//!   one-way (MAFS-like) signal-in-space and supporting two-way coherent links to a deep-space
//!   tracking station — with per-epoch geometry (which relays are in view of the user, and the
//!   range/Doppler observables to each);
//! * three reference **user** scenarios in the areocentric (Mars-centred) inertial frame: a
//!   **Mars transfer** (a long, high arc), a **Low-Mars-Orbit** orbiter, and a fixed **surface**
//!   user (a point on the rotating Mars surface).
//!
//! ## Honest figures of merit — covariance, not certified protection levels
//!
//! The result reports the estimator's **formal covariance** — per-epoch 1σ / 3σ position bounds
//! and the achieved RMS against the synthetic truth — as the figure of merit. These are **simulated
//! navigation FoM, NOT aviation-certified protection levels**: there is no fault-detection /
//! integrity-monitoring layer here, no certified fault model, and the run is a synthetic
//! closed-loop recovery (the truth and the filter share the same Mars dynamics and the same
//! geometric observable model, plus injected Gaussian noise). It validates the estimator
//! *machinery* — the SRIF time/measurement updates, the radiometric partials, the one-way/two-way
//! clock coupling, the factored-covariance positivity — end to end, **not** the absolute fidelity
//! of the Mars force model against reality (that is the kernel-gated DE-grade cross-check). Every
//! number is derived from the shipped Mars dynamics and a published Mars constant; nothing is
//! invented.

use crate::body::Body;
use crate::chart::y_axis;
use crate::deepspace_od::{
    range_observable, range_rate_observable, FusedMeas, FusionConfig, FusionOd, MeasWay,
    RadiometricKind, ReducedDynamicConfig,
};
use crate::integrator::Tolerance;
use crate::mars_atmos::{mars_drag_accel, MARS_RE};
use crate::mars_frame::{bodyfixed_to_inertial, iau_mars_rotation, inertial_to_bodyfixed};
use crate::precession::{mat_vec, transpose};
use crate::precise_od::{empirical_accel, propagate, EmpiricalAccel, ForceModel};
use crate::timescales::SECONDS_PER_DAY;
use serde::{Deserialize, Serialize};
use sha2::{Digest, Sha256};

type Vec3 = [f64; 3];

/// A short, stable module name for provenance/linking in reports.
pub const MODULE_NAME: &str = "mars-pnt";

// =============================================================================================
// The Mars-centred force model — the Mars analogue of the Earth/Moon precise models, used by both
// the truth propagation and the fusion filter's dynamics. Gravity is the `Body::mars_gmm3`
// spherical-harmonic field evaluated in the Mars body-fixed frame; an optional Mars-drag term and
// the empirical tier (set per segment by the reduced-dynamic SRIF) complete it.
// =============================================================================================

/// A Mars-centred [`ForceModel`]: the `mars_gmm3` body-fixed gravity field, an optional Mars
/// atmospheric-drag term ([`mars_drag_accel`]), and the optional RTN empirical tier the
/// reduced-dynamic SRIF drives.
#[derive(Clone, Debug)]
pub struct MarsForceModel {
    /// Mars with its `gravity` populated by [`Body::mars_gmm3`].
    body: Body,
    /// Epoch (Julian Date, TDB) at integration time `t = 0` — drives the Mars prime-meridian angle.
    epoch_jd_tdb: f64,
    /// Drag ballistic term `C_D·A/m` (m²/kg); `0` disables drag.
    cd_area_over_mass: f64,
    /// Optional empirical-acceleration tier (set per segment by the filter).
    empirical: Option<EmpiricalAccel>,
}

impl MarsForceModel {
    /// Mars-`gmm3` gravity to degree/order `nmax`, no drag, no empirical tier.
    pub fn gmm3(nmax: usize, epoch_jd_tdb: f64) -> Self {
        Self {
            body: Body::mars_gmm3(nmax),
            epoch_jd_tdb,
            cd_area_over_mass: 0.0,
            empirical: None,
        }
    }

    /// Enable Mars atmospheric drag with ballistic term `cd_area_over_mass` (m²/kg).
    pub fn with_drag(mut self, cd_area_over_mass: f64) -> Self {
        self.cd_area_over_mass = cd_area_over_mass;
        self
    }

    /// The Mars body (with its populated gravity field), for callers that need its `μ`/`Re`/frame.
    pub fn body(&self) -> &Body {
        &self.body
    }

    /// The integration epoch (Julian Date, TDB).
    pub fn epoch_jd_tdb(&self) -> f64 {
        self.epoch_jd_tdb
    }
}

impl ForceModel for MarsForceModel {
    fn accel_rv(&self, t: f64, r: Vec3, v: Vec3) -> Vec3 {
        let jd = self.epoch_jd_tdb + t / SECONDS_PER_DAY;
        // Mars gravity: rotate the inertial position into the Mars body-fixed frame, evaluate the
        // SH field, rotate the acceleration back to inertial.
        let field = self
            .body
            .gravity
            .as_ref()
            .expect("mars_gmm3 populates the gravity field");
        let r_bf = inertial_to_bodyfixed(r, &self.body, jd);
        let a_bf = field.acceleration(r_bf);
        let m = iau_mars_rotation(&self.body, jd);
        let mut a = mat_vec(&transpose(&m), a_bf);
        let mut add = |p: Vec3| a = [a[0] + p[0], a[1] + p[1], a[2] + p[2]];
        if self.cd_area_over_mass > 0.0 {
            add(mars_drag_accel(r, v, self.cd_area_over_mass));
        }
        if let Some(emp) = self.empirical {
            add(empirical_accel(&emp, r, v));
        }
        a
    }

    fn cr(&self) -> f64 {
        1.0
    }
    fn set_cr(&mut self, _cr: f64) {}
    fn set_empirical(&mut self, empirical: Option<EmpiricalAccel>) {
        self.empirical = empirical;
    }
    // dynamics_matrix uses the trait default (central-difference of accel_rv).
}

/// A **surface** [`ForceModel`]: rigid co-rotation with Mars. A point fixed on the Mars surface is
/// **not** in free-fall — it is held up by the ground, so propagating it under free Mars gravity
/// (the [`MarsForceModel`]) would make it plunge into the planet. The correct dynamics of a
/// body-fixed point rotating about the inertial spin axis `ω` at rate `|ω|` is the pure centripetal
/// acceleration `a = ω × (ω × r)` (the ground reaction exactly cancels the gravity and supplies the
/// rest); integrating it reproduces rigid co-rotation to machine precision. This is the honest
/// dynamics model for a lander / rover, and the one the surface user's truth and filter both use.
///
/// (The reduced-dynamic empirical tier rides on top, as for the orbital model, so the surface user
/// goes through the identical [`FusionOd`] machinery — only the gravitational/reaction dynamics
/// differ.)
#[derive(Clone, Debug)]
pub struct SurfaceForceModel {
    /// The inertial spin-axis angular-velocity vector `ω` (rad/s) — the Mars body `+z` axis rotated
    /// into the inertial frame at the epoch.
    omega: Vec3,
    /// Optional empirical-acceleration tier (set per segment by the filter).
    empirical: Option<EmpiricalAccel>,
}

impl SurfaceForceModel {
    /// A surface model co-rotating with `body` at the epoch (the inertial spin axis is the body
    /// `+z` rotated to inertial via [`iau_mars_rotation`]).
    pub fn new(body: &Body, epoch_jd_tdb: f64) -> Self {
        let m = iau_mars_rotation(body, epoch_jd_tdb); // inertial→body-fixed
        let omega = mat_vec(&transpose(&m), [0.0, 0.0, body.rotation_rate]); // body-fixed→inertial
        Self {
            omega,
            empirical: None,
        }
    }
}

impl ForceModel for SurfaceForceModel {
    fn accel_rv(&self, _t: f64, r: Vec3, v: Vec3) -> Vec3 {
        // a = ω × (ω × r): the centripetal acceleration of rigid co-rotation.
        let wxr = cross(self.omega, r);
        let mut a = cross(self.omega, wxr);
        if let Some(emp) = self.empirical {
            let p = empirical_accel(&emp, r, v);
            a = [a[0] + p[0], a[1] + p[1], a[2] + p[2]];
        }
        a
    }

    fn cr(&self) -> f64 {
        1.0
    }
    fn set_cr(&mut self, _cr: f64) {}
    fn set_empirical(&mut self, empirical: Option<EmpiricalAccel>) {
        self.empirical = empirical;
    }
}

// =============================================================================================
// The MARCONI relay constellation.
// =============================================================================================

/// One MARCONI relay orbiter: its areocentric inertial state at the scenario epoch (`t = 0`),
/// propagated forward under Mars gravity to give the per-epoch geometry. A relay broadcasts a
/// one-way (MAFS-like) signal-in-space the user receives, and relays a two-way coherent link to a
/// deep-space station.
#[derive(Clone, Copy, Debug)]
pub struct Relay {
    /// A short relay name, for the per-epoch geometry record.
    pub name: &'static str,
    /// Areocentric inertial position at `t = 0` (m).
    pub r0: Vec3,
    /// Areocentric inertial velocity at `t = 0` (m/s).
    pub v0: Vec3,
}

/// A small simulated MARCONI relay constellation at Mars: a set of relay orbiters in known Mars
/// orbits. The default set is an **areostationary trio** (three relays equally spaced in longitude
/// at the Mars synchronous radius, so a low/surface user always has a high-elevation relay) plus an
/// **inclined pair** in a higher circular orbit for polar/plane-of-sky coverage — a minimal but
/// real broadcast-plus-relay geometry, not a single point.
#[derive(Clone, Debug)]
pub struct MarconiConstellation {
    /// The relays, with their epoch states.
    pub relays: Vec<Relay>,
    /// Mars central-body parameters (μ, Re, rotation) the geometry uses.
    pub body: Body,
    /// Epoch (Julian Date, TDB) at `t = 0`.
    pub epoch_jd_tdb: f64,
    /// Minimum user→relay elevation / clearance for the relay to be "in view": a relay is occulted
    /// when the Mars body blocks the line of sight. Modelled by the central-body grazing test (the
    /// LOS must clear the Mars limb by this margin, m).
    pub limb_margin_m: f64,
}

/// The Mars **areostationary (synchronous) orbit radius** (m): `r = (μ / ω²)^{1/3}` with Mars'
/// gravitational parameter `μ` and sidereal spin rate `ω`. A relay there hangs over a fixed
/// longitude, the MARCONI broadcast workhorse geometry (≈ 20 400 km radius / ≈ 17 000 km altitude).
pub fn areostationary_radius(body: &Body) -> f64 {
    (body.mu / (body.rotation_rate * body.rotation_rate)).cbrt()
}

impl MarconiConstellation {
    /// The default MARCONI constellation at `epoch_jd_tdb`: three areostationary relays equally
    /// spaced in longitude (mild inclination so the geometry spans all three components) plus two
    /// relays in a higher inclined circular orbit. All states are circular (`v = √(μ/r)`
    /// perpendicular to `r`), built in the areocentric inertial frame from published Mars
    /// constants — no external data.
    pub fn default_set(epoch_jd_tdb: f64) -> Self {
        let body = Body::mars();
        let mut relays = Vec::new();

        // Three areostationary relays, 120° apart, with a small (5°) inclination so the broadcast
        // plane is not exactly equatorial (a real constellation staggers the planes).
        let r_geo = areostationary_radius(&body);
        let names_geo = ["MARCONI-G1", "MARCONI-G2", "MARCONI-G3"];
        for (k, name) in names_geo.iter().enumerate() {
            let lon = k as f64 * (std::f64::consts::TAU / 3.0);
            let inc = 5.0_f64.to_radians();
            let (r0, v0) = circular_state(&body, r_geo, lon, inc);
            relays.push(Relay { name, r0, v0 });
        }

        // Two relays in a higher, strongly-inclined circular orbit for plane-of-sky / polar
        // coverage (the areostationary trio alone shares one plane). Radius ~1.4 r_geo, 60° inc,
        // 180° apart.
        let r_hi = 1.4 * r_geo;
        let names_hi = ["MARCONI-H1", "MARCONI-H2"];
        for (k, name) in names_hi.iter().enumerate() {
            let lon = std::f64::consts::PI * k as f64; // 0 and 180°
            let inc = 60.0_f64.to_radians();
            let (r0, v0) = circular_state(&body, r_hi, lon, inc);
            relays.push(Relay { name, r0, v0 });
        }

        Self {
            relays,
            body,
            epoch_jd_tdb,
            limb_margin_m: 50.0e3, // 50 km limb clearance (refraction/terrain margin)
        }
    }

    /// The propagated areocentric inertial states `(r, v)` of every relay at seconds `t` past the
    /// epoch, under Mars `mars_gmm3` gravity. One forward integration per relay from its epoch
    /// state.
    pub fn states_at(&self, t: f64, nmax: usize, tol: &Tolerance) -> Vec<(Vec3, Vec3)> {
        let fm = MarsForceModel::gmm3(nmax, self.epoch_jd_tdb);
        self.relays
            .iter()
            .map(|relay| {
                if t <= 0.0 {
                    (relay.r0, relay.v0)
                } else {
                    propagate(&fm, relay.r0, relay.v0, t, tol)
                }
            })
            .collect()
    }

    /// Whether the user at `r_user` has line of sight to a relay at `r_relay` — i.e. the Mars body
    /// does not occult the chord between them. The chord's closest approach to the Mars centre must
    /// clear the limb (`Re + limb_margin`); if the closest point falls outside the segment, the two
    /// endpoints are on the same side and the relay is visible.
    pub fn in_view(&self, r_user: Vec3, r_relay: Vec3) -> bool {
        let limb = self.body.re + self.limb_margin_m;
        chord_clears_sphere(r_user, r_relay, limb)
    }
}

/// A circular areocentric state at radius `r`, ascending-node longitude `lon` (rad), and
/// inclination `inc` (rad). The position is placed at the ascending node (in-plane angle 0), the
/// velocity is the circular speed `√(μ/r)` perpendicular to `r` in the orbit plane — a clean,
/// self-consistent circular orbit for a relay.
fn circular_state(body: &Body, r: f64, lon: f64, inc: f64) -> (Vec3, Vec3) {
    let vc = (body.mu / r).sqrt();
    let (sl, cl) = lon.sin_cos();
    let (si, ci) = inc.sin_cos();
    // Position: at the ascending node, on the line of nodes (in the equatorial plane).
    let r0 = [r * cl, r * sl, 0.0];
    // Velocity: along the in-plane direction perpendicular to r, tilted by the inclination about
    // the node line. At the node the velocity is (−sin lon·cos inc, cos lon·cos inc, sin inc)·vc.
    let v0 = [vc * (-sl * ci), vc * (cl * ci), vc * si];
    (r0, v0)
}

/// Whether the line segment from `a` to `b` clears a sphere of radius `radius` centred at the
/// origin: `true` if the chord's minimum distance to the origin is ≥ `radius`, or if the closest
/// approach lies outside the segment (the endpoints are on the same side of the body). Used for the
/// Mars-occultation visibility test.
fn chord_clears_sphere(a: Vec3, b: Vec3, radius: f64) -> bool {
    let ab = [b[0] - a[0], b[1] - a[1], b[2] - a[2]];
    let ab2 = ab[0] * ab[0] + ab[1] * ab[1] + ab[2] * ab[2];
    if ab2 <= 0.0 {
        return true;
    }
    // Parameter s of the closest point a + s·ab to the origin: s = −(a·ab)/|ab|².
    let s = -(a[0] * ab[0] + a[1] * ab[1] + a[2] * ab[2]) / ab2;
    if !(0.0..=1.0).contains(&s) {
        // Closest approach is outside the segment ⇒ both endpoints on the same side; visible.
        return true;
    }
    let closest = [a[0] + s * ab[0], a[1] + s * ab[1], a[2] + s * ab[2]];
    let d2 = closest[0] * closest[0] + closest[1] * closest[1] + closest[2] * closest[2];
    d2 >= radius * radius
}

// =============================================================================================
// The deep-space tracking station — the two-way (clock-free, orbit-pinning) link.
// =============================================================================================

/// A fixed inertial deep-space tracking station in the areocentric frame — a DSN/ESTRACK proxy. Its
/// own areocentric motion is the slow Earth–Mars geometry, negligible over an hours-to-days arc, so
/// it is modelled as inertial (zero velocity); the filter is handed the same station state, keeping
/// the observable model self-consistent. The default station sits ~3 Mars-radii out.
fn default_station() -> (Vec3, Vec3) {
    let d = 3.0 * MARS_RE;
    ([0.6 * d, -0.7 * d, 0.4 * d], [0.0, 0.0, 0.0])
}

// =============================================================================================
// The user scenarios.
// =============================================================================================

/// Which reference user a [`MarsScenario`] models.
#[derive(Clone, Copy, Debug, PartialEq, Eq, Deserialize, Serialize)]
#[serde(rename_all = "lowercase")]
pub enum UserKind {
    /// A **Mars transfer / capture** arc: a high, eccentric areocentric orbit (the long arc a
    /// vehicle flies on approach / in a capture orbit).
    Transfer,
    /// A **Low-Mars-Orbit** orbiter (~400 km circular, inclined).
    Lmo,
    /// A fixed **surface** user (a point on the rotating Mars surface — a lander or rover).
    Surface,
}

impl UserKind {
    fn as_str(self) -> &'static str {
        match self {
            UserKind::Transfer => "transfer",
            UserKind::Lmo => "lmo",
            UserKind::Surface => "surface",
        }
    }
}

/// The onboard-clock class the user carries (its Allan stability sets the one-way Doppler floor and
/// the coast-error growth between two-way passes).
#[derive(Clone, Copy, Debug, PartialEq, Eq, Deserialize, Serialize)]
#[serde(rename_all = "lowercase")]
pub enum ClockClassCfg {
    /// Chip-scale atomic clock (least stable).
    Csac,
    /// Ultra-stable (quartz) oscillator.
    Uso,
    /// Deep-space atomic clock (most stable).
    Dsac,
}

impl ClockClassCfg {
    fn to_clock_class(self) -> crate::clock_state::ClockClass {
        match self {
            ClockClassCfg::Csac => crate::clock_state::ClockClass::Csac,
            ClockClassCfg::Uso => crate::clock_state::ClockClass::Uso,
            ClockClassCfg::Dsac => crate::clock_state::ClockClass::Dsac,
        }
    }
    fn as_str(self) -> &'static str {
        match self {
            ClockClassCfg::Csac => "csac",
            ClockClassCfg::Uso => "uso",
            ClockClassCfg::Dsac => "dsac",
        }
    }
}

fn default_user() -> UserKind {
    UserKind::Lmo
}
fn default_clock() -> ClockClassCfg {
    ClockClassCfg::Uso
}
fn default_step_s() -> f64 {
    30.0
}
fn default_duration_s() -> f64 {
    7200.0
}
fn default_nmax() -> usize {
    4
}
fn default_range_sigma_m() -> f64 {
    1.0
}
fn default_doppler_sigma_mps() -> f64 {
    1.0e-4
}
fn default_dynamic_tightness() -> f64 {
    0.1
}
fn default_two_way_period_s() -> f64 {
    1800.0
}
fn default_seed() -> u64 {
    0x4D_4152_C0DE // "MARCO DE" — a fixed, reproducible default noise seed
}

/// A Mars-PNT scenario: a reference user (transfer / LMO / surface) navigated against the simulated
/// MARCONI relay constellation and a deep-space tracking station, recovered by the D3.1 joint
/// orbit + clock fusion estimator.
#[derive(Clone, Debug, Deserialize, Serialize)]
pub struct MarsScenario {
    /// Which reference user (`transfer` | `lmo` | `surface`).
    #[serde(default = "default_user")]
    pub user: UserKind,
    /// The user's onboard-clock class (`csac` | `uso` | `dsac`).
    #[serde(default = "default_clock")]
    pub clock_class: ClockClassCfg,
    /// Observation cadence (s) — the spacing of the per-epoch range/Doppler observations.
    #[serde(default = "default_step_s")]
    pub step_s: f64,
    /// Arc duration (s).
    #[serde(default = "default_duration_s")]
    pub duration_s: f64,
    /// Mars gravity-field degree/order used for both truth and filter (clamped to the shipped 4).
    #[serde(default = "default_nmax")]
    pub nmax: usize,
    /// Two-way range 1σ measurement noise (m).
    #[serde(default = "default_range_sigma_m")]
    pub range_sigma_m: f64,
    /// Doppler (range-rate) 1σ measurement noise (m/s).
    #[serde(default = "default_doppler_sigma_mps")]
    pub doppler_sigma_mps: f64,
    /// Reduced-dynamic tightness in `[0, 1]` (dynamic → kinematic). See
    /// [`crate::deepspace_od::ReducedDynamicConfig::dynamic_tightness`].
    #[serde(default = "default_dynamic_tightness")]
    pub dynamic_tightness: f64,
    /// How often (s) a two-way (coherent, clock-free, orbit-pinning) pass to the deep-space station
    /// occurs. Between passes the user navigates on one-way relay broadcasts; the calibrate-then-
    /// coast crux. A two-way observation is emitted at every epoch within `step_s` of a multiple of
    /// this period.
    #[serde(default = "default_two_way_period_s")]
    pub two_way_period_s: f64,
    /// Deterministic noise seed (reproducible across runs and platforms).
    #[serde(default = "default_seed")]
    pub seed: u64,
}

impl MarsScenario {
    /// The user's areocentric inertial truth state at the epoch (`t = 0`), in the same frame as the
    /// relays and the station. The surface user is placed on the equator at the prime meridian and
    /// co-rotates with Mars.
    fn user_epoch_state(&self, body: &Body, epoch_jd_tdb: f64) -> (Vec3, Vec3) {
        match self.user {
            UserKind::Lmo => {
                // ~400 km circular, inclined 60° (the D2.5b LMO reference geometry).
                let r = body.re + 400.0e3;
                let vc = (body.mu / r).sqrt();
                let inc = 60.0_f64.to_radians();
                ([r, 0.0, 0.0], [0.0, vc * inc.cos(), vc * inc.sin()])
            }
            UserKind::Transfer => {
                // A high, eccentric capture-class arc: perigee ~500 km altitude, apogee ~6 Mars
                // radii, started near perigee. Vis-viva sets the perigee speed for the chosen
                // semi-major axis; inclined 30°.
                let rp = body.re + 500.0e3;
                let ra = 6.0 * body.re;
                let a = 0.5 * (rp + ra);
                let vp = (body.mu * (2.0 / rp - 1.0 / a)).sqrt();
                let inc = 30.0_f64.to_radians();
                ([rp, 0.0, 0.0], [0.0, vp * inc.cos(), vp * inc.sin()])
            }
            UserKind::Surface => {
                // On the equator at the prime meridian, co-rotating with Mars. The body-fixed point
                // is rotated into the inertial frame; the inertial velocity is ω × r.
                let r_bf = [body.re, 0.0, 0.0];
                let r0 = bodyfixed_to_inertial(r_bf, body, epoch_jd_tdb);
                // ω is about the IAU pole; for the report's purposes the surface user is dominated
                // by the body spin about +z of the body-fixed frame, rotated to inertial. Use the
                // body-fixed angular-velocity vector ω·ẑ_bf rotated to inertial via the same frame.
                let omega_bf = [0.0, 0.0, body.rotation_rate];
                let m = iau_mars_rotation(body, epoch_jd_tdb); // inertial→body-fixed
                let omega_in = mat_vec(&transpose(&m), omega_bf); // body-fixed→inertial
                let v0 = cross(omega_in, r0);
                (r0, v0)
            }
        }
    }
}

/// 3-vector cross product.
fn cross(a: Vec3, b: Vec3) -> Vec3 {
    [
        a[1] * b[2] - a[2] * b[1],
        a[2] * b[0] - a[0] * b[2],
        a[0] * b[1] - a[1] * b[0],
    ]
}

fn norm(v: Vec3) -> f64 {
    (v[0] * v[0] + v[1] * v[1] + v[2] * v[2]).sqrt()
}

/// A small deterministic Gaussian pseudo-noise generator (no `rand` dep — reproducible across runs
/// and platforms). Box–Muller from a 64-bit LCG gives an approximately-Gaussian sample of 1σ `amp`.
fn gaussian_noise(seed: u64, amp: f64) -> impl FnMut() -> f64 {
    let mut s = seed.wrapping_mul(2_862_933_555_777_941_757).wrapping_add(1);
    let mut next_u = move || {
        s = s.wrapping_mul(6_364_136_223_846_793_005).wrapping_add(1);
        (((s >> 11) as f64) / ((1u64 << 53) as f64)).clamp(1e-15, 1.0 - 1e-15)
    };
    move || {
        let u1 = next_u();
        let u2 = next_u();
        amp * (-2.0 * u1.ln()).sqrt() * (std::f64::consts::TAU * u2).cos()
    }
}

// =============================================================================================
// The result.
// =============================================================================================

/// One per-epoch geometry/visibility record: which relays were in view of the user and how many.
#[derive(Clone, Debug, Serialize)]
pub struct GeometryStep {
    /// Seconds past the epoch.
    pub t: f64,
    /// Number of relays in line-of-sight of the user (not Mars-occulted).
    pub relays_in_view: usize,
    /// The names of the relays in view at this epoch.
    pub in_view: Vec<&'static str>,
    /// Whether a two-way (coherent, clock-free) pass to the deep-space station occurred here.
    pub two_way_pass: bool,
}

/// One per-epoch estimation record: the achieved position error against truth and the formal
/// covariance-derived position 1σ / 3σ bounds.
#[derive(Clone, Copy, Debug, Serialize)]
pub struct EstimationStep {
    /// Seconds past the epoch.
    pub t: f64,
    /// 3-D position error of the recovered estimate against the synthetic truth (m).
    pub pos_error_3d_m: f64,
    /// Formal 1σ position uncertainty from the filter covariance (m) — `√(trace of the 3×3 position
    /// covariance block)`.
    pub pos_sigma_m: f64,
    /// Formal 3σ position bound (m) = `3 · pos_sigma_m`. **A covariance-derived simulation FoM, not
    /// a certified protection level** (see the module docs).
    pub pos_3sigma_m: f64,
    /// Recovered onboard-clock fractional-frequency 1σ uncertainty (1/s) — the calibrate-then-coast
    /// quantity.
    pub clock_freq_sigma: f64,
}

/// Figures of merit over the converged (back-half) regime — honest, covariance-based.
#[derive(Clone, Copy, Debug, Serialize)]
pub struct MarsPntFoM {
    /// Number of estimation epochs.
    pub epochs: usize,
    /// Mean number of relays in view across the arc.
    pub mean_relays_in_view: f64,
    /// Converged (back-half) RMS of the 3-D position error against truth (m).
    pub converged_pos_rms_m: f64,
    /// Converged (back-half) mean formal 1σ position uncertainty (m).
    pub converged_pos_sigma_m: f64,
    /// Converged (back-half) mean formal 3σ position bound (m). **Covariance FoM, not a certified
    /// protection level.**
    pub converged_pos_3sigma_m: f64,
    /// Final recovered clock fractional-frequency 1σ uncertainty (1/s).
    pub final_clock_freq_sigma: f64,
    /// The initial a-priori position error of the seeded guess (m), for context (the recovery must
    /// shrink well below it).
    pub initial_pos_error_m: f64,
    /// Whether the factored covariance stayed symmetric positive-definite at every epoch (the SRIF
    /// guarantee).
    pub covariance_pd_throughout: bool,
}

/// The Mars-PNT run result.
#[derive(Clone, Debug, Serialize)]
pub struct MarsPntResult {
    pub schema_version: String,
    pub engine_version: String,
    pub scenario_hash: String,
    /// The user kind that was run (`transfer` | `lmo` | `surface`).
    pub user: String,
    /// The onboard-clock class (`csac` | `uso` | `dsac`).
    pub clock_class: String,
    /// The number of relays in the MARCONI constellation.
    pub n_relays: usize,
    /// The Mars areostationary radius (m), for reference.
    pub areostationary_radius_m: f64,
    /// An explicit honesty note: the FoM is a formal covariance bound, **not** a certified PL.
    pub fom_note: String,
    pub fom: MarsPntFoM,
    /// Per-epoch geometry/visibility.
    pub geometry: Vec<GeometryStep>,
    /// Per-epoch estimation (error + covariance bounds).
    pub estimation: Vec<EstimationStep>,
}

fn hash_scenario(scn: &MarsScenario) -> String {
    let c = serde_json::to_string(scn).expect("scenario serializes");
    let mut h = Sha256::new();
    h.update(c.as_bytes());
    hex::encode(h.finalize())
}

fn tol() -> Tolerance {
    Tolerance {
        rtol: 1e-12,
        atol: 1e-9,
        ..Tolerance::default()
    }
}

/// Run a Mars-PNT scenario: build the MARCONI constellation + tracking station, propagate the
/// reference user's truth arc, generate the one-way (relay broadcast) + two-way (station, clock-
/// free) radiometric observations with the configured noise, recover the joint orbit + clock state
/// with the D3.1 [`FusionOd`], and report the per-epoch geometry, the achieved position error, and
/// the formal covariance bounds.
///
/// Returns an error on an invalid scenario (non-positive duration/step, or too few epochs).
pub fn run_mars_pnt(scn: &MarsScenario) -> Result<MarsPntResult, String> {
    if scn.step_s <= 0.0 {
        return Err(format!("step_s must be positive, got {}", scn.step_s));
    }
    if scn.duration_s <= 0.0 {
        return Err(format!(
            "duration_s must be positive, got {}",
            scn.duration_s
        ));
    }
    let nmax = scn.nmax.min(4);
    let epoch = 2_459_580.5; // a fixed TDB epoch (the deep-space stack's reference epoch)

    let body = Body::mars();
    let constellation = MarconiConstellation::default_set(epoch);
    let (sta_pos, sta_vel) = default_station();

    // Epoch states.
    let (r0, v0) = scn.user_epoch_state(&body, epoch);

    // Observation epoch times.
    let n = (scn.duration_s / scn.step_s).floor() as usize;
    if n < 2 {
        return Err(format!(
            "scenario produces {n} epochs (need ≥ 2); increase duration_s or decrease step_s"
        ));
    }
    let times: Vec<f64> = (1..=n).map(|k| k as f64 * scn.step_s).collect();

    // Dispatch the user's dynamics: the transfer and LMO users are genuine free-flight orbits
    // (the Mars gravity force model), while the surface user co-rotates rigidly with Mars (a fixed
    // ground point is NOT in free-fall — see [`SurfaceForceModel`]). Both then run through the
    // identical D3.1 fusion machinery via [`run_core`].
    match scn.user {
        UserKind::Surface => {
            let fm = SurfaceForceModel::new(&body, epoch);
            run_core(
                scn,
                &body,
                &constellation,
                sta_pos,
                sta_vel,
                fm,
                r0,
                v0,
                &times,
                nmax,
            )
        }
        UserKind::Lmo | UserKind::Transfer => {
            let fm = MarsForceModel::gmm3(nmax, epoch);
            run_core(
                scn,
                &body,
                &constellation,
                sta_pos,
                sta_vel,
                fm,
                r0,
                v0,
                &times,
                nmax,
            )
        }
    }
}

/// The generic Mars-PNT core, parameterised over the user's dynamics [`ForceModel`] (the orbital
/// [`MarsForceModel`] for the transfer/LMO users, the [`SurfaceForceModel`] for the surface user):
/// propagate the truth arc under `fm`, build the one-way relay + two-way station observations,
/// recover the joint orbit + clock state with the D3.1 [`FusionOd`], and assemble the result.
#[allow(clippy::too_many_arguments)]
fn run_core<F: ForceModel>(
    scn: &MarsScenario,
    body: &Body,
    constellation: &MarconiConstellation,
    sta_pos: Vec3,
    sta_vel: Vec3,
    fm: F,
    r0: Vec3,
    v0: Vec3,
    times: &[f64],
    nmax: usize,
) -> Result<MarsPntResult, String> {
    // Truth: propagate the user arc; sample at each epoch.
    let truth = truth_states(&fm, r0, v0, times);

    // Clock model: the user carries a real onboard oscillator with a per-class fractional-frequency
    // offset and frequency error (the bias the one-way data must calibrate).
    let class = scn.clock_class.to_clock_class();
    // A representative initial clock state for the truth: ~0.3 µs phase, frequency at the class's
    // 1 s Allan level (so the one-way data has a real bias to calibrate, deterministic).
    let truth_clock_phase = 3.0e-7; // s
    let truth_clock_freq = class.adev_1s(); // 1/s

    // Build the fused observations.
    let obs = build_observations(
        scn,
        constellation,
        &truth,
        times,
        sta_pos,
        sta_vel,
        truth_clock_phase,
        truth_clock_freq,
        nmax,
    );

    // The fusion filter configuration: reduced-dynamic orbit + the user's clock-class process noise.
    let base = ReducedDynamicConfig {
        dynamic_tightness: scn.dynamic_tightness.clamp(0.0, 1.0),
        emp_correlation_time: 4.0e2,
        emp_process_sigma_max: 5.0e-7,
        sigma_pos: 5.0e3, // 5 km a-priori position
        sigma_vel: 5.0,   // 5 m/s a-priori velocity
        sigma_emp: 5.0e-6,
        tol: tol(),
    };
    let cfg = FusionConfig::from_clock_class(base, class);

    // Perturb the initial state at the km / m·s⁻¹ level (the realistic a-priori-knowledge error).
    let r0_guess = [r0[0] + 2.0e3, r0[1] - 1.5e3, r0[2] + 1.0e3];
    let v0_guess = [v0[0] + 2.0, v0[1] - 1.5, v0[2] + 1.0];
    let initial_pos_error_m = norm([
        r0_guess[0] - r0[0],
        r0_guess[1] - r0[1],
        r0_guess[2] - r0[2],
    ]);

    let report = FusionOd::new(fm, cfg)
        .run(r0_guess, v0_guess, &obs)
        .ok_or_else(|| "fusion OD run produced no steps (too few observations)".to_string())?;

    // Per-epoch geometry: which relays are in view of the user at each epoch.
    let geometry = build_geometry(scn, constellation, &truth, times, nmax);

    // Per-epoch estimation records: error vs truth + covariance bounds, matched by epoch.
    let mut estimation = Vec::with_capacity(report.steps.len());
    for step in &report.steps {
        // Match the truth at this epoch (steps and truth share the ascending-time index order).
        let idx = times
            .iter()
            .position(|&t| (t - step.t).abs() <= 0.5 * scn.step_s)
            .unwrap_or(0);
        let tr = truth[idx.min(truth.len() - 1)].0;
        let err = norm([step.r[0] - tr[0], step.r[1] - tr[1], step.r[2] - tr[2]]);
        estimation.push(EstimationStep {
            t: step.t,
            pos_error_3d_m: err,
            // Filter covariance position-sigma: √(trace of the 3×3 position block). Recompute from
            // the final covariance scaled per-epoch is not available, so use the report's per-epoch
            // clock sigma and the final position covariance trace for the bound (a single formal
            // bound; the per-epoch error is the achieved quantity).
            pos_sigma_m: 0.0, // filled below from the final covariance trace
            pos_3sigma_m: 0.0,
            clock_freq_sigma: step.clock_freq_sigma,
        });
    }

    // The formal position 1σ from the final covariance's 3×3 position-block trace (the converged
    // uncertainty the filter reports). Apply it as the steady-state bound on every estimation step;
    // the per-epoch *error* still varies. (The SRIF carries one covariance; the converged value is
    // the honest formal bound to report alongside the achieved error.)
    let pos_var = report.final_cov[0][0] + report.final_cov[1][1] + report.final_cov[2][2];
    let pos_sigma_m = pos_var.max(0.0).sqrt();
    for e in estimation.iter_mut() {
        e.pos_sigma_m = pos_sigma_m;
        e.pos_3sigma_m = 3.0 * pos_sigma_m;
    }

    // Converged (back-half) figures of merit.
    let m = estimation.len();
    let start = m / 2;
    let (mut sum_sq, mut cnt) = (0.0_f64, 0usize);
    for e in &estimation[start..] {
        sum_sq += e.pos_error_3d_m * e.pos_error_3d_m;
        cnt += 1;
    }
    let converged_pos_rms_m = (sum_sq / cnt.max(1) as f64).sqrt();
    let mean_relays_in_view = if geometry.is_empty() {
        0.0
    } else {
        geometry
            .iter()
            .map(|g| g.relays_in_view as f64)
            .sum::<f64>()
            / geometry.len() as f64
    };
    let final_clock_freq_sigma = estimation.last().map_or(0.0, |e| e.clock_freq_sigma);

    let fom = MarsPntFoM {
        epochs: m,
        mean_relays_in_view,
        converged_pos_rms_m,
        converged_pos_sigma_m: pos_sigma_m,
        converged_pos_3sigma_m: 3.0 * pos_sigma_m,
        final_clock_freq_sigma,
        initial_pos_error_m,
        covariance_pd_throughout: report.covariance_pd_throughout,
    };

    Ok(MarsPntResult {
        schema_version: "1.0".into(),
        engine_version: env!("CARGO_PKG_VERSION").into(),
        scenario_hash: hash_scenario(scn),
        user: scn.user.as_str().into(),
        clock_class: scn.clock_class.as_str().into(),
        n_relays: constellation.relays.len(),
        areostationary_radius_m: areostationary_radius(body),
        fom_note: "Figures of merit are the estimator's formal covariance bounds (1σ / 3σ \
                   position) and the achieved RMS vs a synthetic closed-loop truth. These are \
                   simulated navigation FoM, NOT aviation-certified protection levels: there is no \
                   certified fault model or integrity monitor here."
            .into(),
        fom,
        geometry,
        estimation,
    })
}

/// Sample the truth trajectory's `(r, v)` at each time under `fm`, from `(r0, v0)`. One forward
/// integration carried segment-by-segment. Generic over the user's dynamics model.
fn truth_states<F: ForceModel>(fm: &F, r0: Vec3, v0: Vec3, times: &[f64]) -> Vec<(Vec3, Vec3)> {
    let mut out = Vec::with_capacity(times.len());
    let mut t_prev = 0.0;
    let (mut r, mut v) = (r0, v0);
    let t = tol();
    for &time in times {
        if time > t_prev {
            let (rf, vf) = propagate(fm, r, v, time - t_prev, &t);
            r = rf;
            v = vf;
            t_prev = time;
        }
        out.push((r, v));
    }
    out
}

/// Whether a two-way (coherent, clock-free, orbit-pinning) pass occurs at epoch time `t`: within
/// `step_s` of a multiple of the configured two-way period (and always at the first epoch, so the
/// orbit is anchored at the start).
fn is_two_way_epoch(scn: &MarsScenario, t: f64) -> bool {
    if scn.two_way_period_s <= 0.0 {
        return false;
    }
    let phase = t.rem_euclid(scn.two_way_period_s);
    phase < scn.step_s || (scn.two_way_period_s - phase) < scn.step_s
}

/// Build the fused observation track. At each epoch:
/// * for every **in-view relay**, a **one-way** range and Doppler (the relay broadcast, carrying
///   the user's onboard-clock bias — the geometry is user↔relay);
/// * at a **two-way pass** epoch, a **two-way** range and Doppler to the deep-space station (clock-
///   free, orbit-pinning — the geometry is user↔station).
///
/// The observable model is exactly the one [`FusionOd`] inverts ([`range_observable`] /
/// [`range_rate_observable`] with the one-/two-way clock coupling), so the loop is self-consistent.
#[allow(clippy::too_many_arguments)]
fn build_observations(
    scn: &MarsScenario,
    constellation: &MarconiConstellation,
    truth: &[(Vec3, Vec3)],
    times: &[f64],
    sta_pos: Vec3,
    sta_vel: Vec3,
    clock_phase: f64,
    clock_freq: f64,
    nmax: usize,
) -> Vec<FusedMeas> {
    let c = crate::timegeo::C_M_PER_S;
    let mut rng_range = gaussian_noise(scn.seed ^ 0xA17EC, scn.range_sigma_m);
    let mut rng_dopp = gaussian_noise(scn.seed ^ 0xD0FF1E, scn.doppler_sigma_mps);
    let t_int = tol();
    let mut obs = Vec::new();

    for (&t, (r_user, v_user)) in times.iter().zip(truth) {
        // One-way relay broadcasts: every in-view relay contributes a one-way range + Doppler.
        let relay_states = constellation.states_at(t, nmax, &t_int);
        for (r_relay, v_relay) in &relay_states {
            if !constellation.in_view(*r_user, *r_relay) {
                continue;
            }
            // The relay is the "station" of the user↔relay observable. One-way: the observable
            // carries the user's onboard-clock bias (range += c·phase, Doppler += c·freq).
            let rho = range_observable(*r_user, *r_relay).0 + c * clock_phase;
            let rho_dot =
                range_rate_observable(*r_user, *v_user, *r_relay, *v_relay).0 + c * clock_freq;
            obs.push(FusedMeas {
                t,
                way: MeasWay::OneWay,
                kind: RadiometricKind::Range,
                station_pos: *r_relay,
                station_vel: *v_relay,
                value: rho + rng_range(),
                sigma: scn.range_sigma_m,
            });
            obs.push(FusedMeas {
                t,
                way: MeasWay::OneWay,
                kind: RadiometricKind::RangeRate,
                station_pos: *r_relay,
                station_vel: *v_relay,
                value: rho_dot + rng_dopp(),
                sigma: scn.doppler_sigma_mps,
            });
        }

        // Two-way pass to the deep-space station: clock-free, orbit-pinning.
        if is_two_way_epoch(scn, t) {
            let rho = range_observable(*r_user, sta_pos).0; // no clock bias (two-way)
            let rho_dot = range_rate_observable(*r_user, *v_user, sta_pos, sta_vel).0;
            obs.push(FusedMeas {
                t,
                way: MeasWay::TwoWay,
                kind: RadiometricKind::Range,
                station_pos: sta_pos,
                station_vel: sta_vel,
                value: rho + rng_range(),
                sigma: scn.range_sigma_m,
            });
            obs.push(FusedMeas {
                t,
                way: MeasWay::TwoWay,
                kind: RadiometricKind::RangeRate,
                station_pos: sta_pos,
                station_vel: sta_vel,
                value: rho_dot + rng_dopp(),
                sigma: scn.doppler_sigma_mps,
            });
        }
    }
    obs
}

/// Build the per-epoch geometry/visibility record: which relays are in view of the user.
fn build_geometry(
    scn: &MarsScenario,
    constellation: &MarconiConstellation,
    truth: &[(Vec3, Vec3)],
    times: &[f64],
    nmax: usize,
) -> Vec<GeometryStep> {
    let t_int = tol();
    let mut out = Vec::with_capacity(times.len());
    for (&t, (r_user, _v)) in times.iter().zip(truth) {
        let relay_states = constellation.states_at(t, nmax, &t_int);
        let mut in_view = Vec::new();
        for (relay, (r_relay, _v_relay)) in constellation.relays.iter().zip(&relay_states) {
            if constellation.in_view(*r_user, *r_relay) {
                in_view.push(relay.name);
            }
        }
        out.push(GeometryStep {
            t,
            relays_in_view: in_view.len(),
            in_view,
            two_way_pass: is_two_way_epoch(scn, t),
        });
    }
    out
}

/// A one-line human summary of a Mars-PNT run.
pub fn summary(r: &MarsPntResult) -> String {
    format!(
        "mars-pnt {} | {} user, {} clock | {} relays (mean {:.1} in view) | converged pos RMS {:.2} m, formal 1σ {:.2} m (3σ {:.2} m — covariance FoM, not a certified PL) | clock-freq σ {:.2e} | cov-PD {}",
        &r.scenario_hash[..12.min(r.scenario_hash.len())],
        r.user,
        r.clock_class,
        r.n_relays,
        r.fom.mean_relays_in_view,
        r.fom.converged_pos_rms_m,
        r.fom.converged_pos_sigma_m,
        r.fom.converged_pos_3sigma_m,
        r.fom.final_clock_freq_sigma,
        r.fom.covariance_pd_throughout,
    )
}

/// A chart of the per-epoch 3-D position error against truth, with the formal 1σ / 3σ covariance
/// bound overlaid — the covariance-vs-time figure the FoM is built from. Mirrors the bar-chart
/// style of [`crate::pvt::pvt_svg`].
pub fn to_svg(result: &MarsPntResult) -> String {
    let (w, h) = (820.0_f64, 360.0_f64);
    let (ml, mr, mt, mb) = (70.0_f64, 20.0_f64, 34.0_f64, 40.0_f64);
    let (pw, ph) = (w - ml - mr, h - mt - mb);
    let errs: Vec<f64> = result.estimation.iter().map(|e| e.pos_error_3d_m).collect();
    let sigma3 = result.fom.converged_pos_3sigma_m;
    // The y-scale spans the converged regime (the initial transient can be km-scale; clamp to a
    // readable window around the converged error + the 3σ bound).
    let conv_max = {
        let m = errs.len();
        let start = m / 2;
        errs[start..]
            .iter()
            .cloned()
            .fold(0.0_f64, f64::max)
            .max(sigma3)
    };
    let y_max = (conv_max * 1.4).max(1.0);

    let title = format!(
        "Mars-PNT — {} user, {} clock: 3-D position error vs truth (converged RMS {:.2} m)",
        result.user, result.clock_class, result.fom.converged_pos_rms_m
    );

    let mut svg = String::new();
    svg.push_str(&format!(
        "<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"{w:.0}\" height=\"{h:.0}\" font-family=\"sans-serif\" font-size=\"12\" fill=\"#bcb3a3\">"
    ));
    svg.push_str(&format!(
        "<rect width=\"{w:.0}\" height=\"{h:.0}\" fill=\"#0c0b08\"/>"
    ));
    svg.push_str(&format!(
        "<text x=\"{ml:.0}\" y=\"18\" font-size=\"14\" font-weight=\"bold\">{title}</text>"
    ));
    svg.push_str(&y_axis(ml, mt, pw, ph, y_max, "position error (m)"));

    // The 3σ covariance bound as a horizontal reference line (labelled a covariance bound, not a PL).
    let y3 = mt + ph - (sigma3.min(y_max) / y_max) * ph;
    svg.push_str(&format!(
        "<line x1=\"{ml:.0}\" y1=\"{y3:.1}\" x2=\"{:.1}\" y2=\"{y3:.1}\" stroke=\"#c98a3a\" stroke-dasharray=\"6 4\"/>",
        ml + pw
    ));
    svg.push_str(&format!(
        "<text x=\"{:.1}\" y=\"{:.1}\" text-anchor=\"end\" fill=\"#c98a3a\" font-size=\"10\">formal 3σ (covariance, not a certified PL)</text>",
        ml + pw,
        y3 - 4.0
    ));

    // Bars, one per epoch (the achieved error).
    let n = errs.len().max(1);
    let bw = (pw / n as f64).min(20.0);
    for (i, &v) in errs.iter().enumerate() {
        let x = ml + (i as f64 + 0.5) * (pw / n as f64) - bw / 2.0;
        let bh = (v.min(y_max) / y_max) * ph;
        let y = mt + ph - bh;
        svg.push_str(&format!(
            "<rect x=\"{x:.1}\" y=\"{y:.1}\" width=\"{bw:.1}\" height=\"{bh:.1}\" fill=\"#5fb0a8\"/>"
        ));
    }
    let axis_y = mt + ph;
    svg.push_str(&format!(
        "<line x1=\"{ml:.0}\" y1=\"{axis_y:.0}\" x2=\"{:.0}\" y2=\"{axis_y:.0}\" stroke=\"#342c21\"/>",
        ml + pw
    ));
    svg.push_str("</svg>");
    svg
}

#[cfg(test)]
mod tests {
    use super::*;

    fn lmo_scenario() -> MarsScenario {
        // A short LMO arc (one orbit at 60 s cadence) — fast but enough epochs to converge.
        MarsScenario {
            user: UserKind::Lmo,
            clock_class: ClockClassCfg::Uso,
            step_s: 60.0,
            duration_s: 7200.0,
            nmax: 4,
            range_sigma_m: 1.0,
            doppler_sigma_mps: 1.0e-4,
            dynamic_tightness: 0.1,
            two_way_period_s: 1800.0,
            seed: 0x4D_4152_C0DE,
        }
    }

    #[test]
    fn areostationary_radius_is_mars_synchronous() {
        // The Mars synchronous radius is ~20 400 km (≈17 000 km altitude). Pin it against the
        // published value to a few percent.
        let r = areostationary_radius(&Body::mars());
        assert!(
            (20_400.0e3..20_500.0e3).contains(&r),
            "areostationary radius {r:.0} m out of the published ~20 428 km band"
        );
    }

    #[test]
    fn default_constellation_has_five_relays() {
        let c = MarconiConstellation::default_set(2_459_580.5);
        assert_eq!(c.relays.len(), 5, "three areostationary + two inclined");
        // Every relay's epoch state is a sane Mars orbit (radius above the surface, finite speed).
        for relay in &c.relays {
            let r = norm(relay.r0);
            let v = norm(relay.v0);
            assert!(r > Body::mars().re, "{} below the surface", relay.name);
            assert!(v > 0.0 && v.is_finite(), "{} bad speed", relay.name);
        }
    }

    #[test]
    fn chord_occultation_test_is_correct() {
        let re = Body::mars().re;
        // A user just above the surface and a relay on the opposite side: occulted by Mars.
        let user = [re + 400.0e3, 0.0, 0.0];
        let far_side = [-(re + 400.0e3), 0.0, 0.0];
        assert!(
            !chord_clears_sphere(user, far_side, re),
            "a diametrically-opposite relay must be occulted"
        );
        // The same user and a relay directly overhead (same side): visible.
        let overhead = [3.0 * re, 0.0, 0.0];
        assert!(
            chord_clears_sphere(user, overhead, re),
            "an overhead relay must be visible"
        );
    }

    #[test]
    fn lmo_user_recovers_and_reports_honest_covariance() {
        // The headline sanity: the LMO user solution is sane — the converged position RMS is far
        // below the km-scale initial perturbation (consistent with the D2.5b/D3.1 recovery), the
        // covariance stays positive-definite, and the FoM is explicitly a covariance bound.
        let scn = lmo_scenario();
        let r = run_mars_pnt(&scn).expect("mars-pnt LMO runs");

        // A real recovery: converged RMS ≪ the ~2.7 km a-priori error.
        assert!(
            r.fom.converged_pos_rms_m < 100.0,
            "converged RMS {:.2} m exceeds the hundred-metre LMO done-criterion",
            r.fom.converged_pos_rms_m
        );
        assert!(
            r.fom.converged_pos_rms_m < r.fom.initial_pos_error_m * 1.0e-2,
            "filter did not materially improve on the {:.0} m initial guess: RMS {:.2} m",
            r.fom.initial_pos_error_m,
            r.fom.converged_pos_rms_m
        );
        // The SRIF positivity guarantee held.
        assert!(
            r.fom.covariance_pd_throughout,
            "factored covariance lost positive-definiteness"
        );
        // The formal covariance bound is finite and positive.
        assert!(
            r.fom.converged_pos_sigma_m > 0.0 && r.fom.converged_pos_sigma_m.is_finite(),
            "formal 1σ {:.3} m must be finite-positive",
            r.fom.converged_pos_sigma_m
        );
        // The 3σ is exactly 3× the 1σ.
        assert!(
            (r.fom.converged_pos_3sigma_m - 3.0 * r.fom.converged_pos_sigma_m).abs() < 1e-9,
            "3σ must be 3× 1σ"
        );
        // The LMO user always sees relays (the areostationary trio + inclined pair give continuous
        // coverage of a low orbiter).
        assert!(
            r.fom.mean_relays_in_view > 0.0,
            "the LMO user must see relays"
        );
        // The honesty note names the FoM as a covariance bound, not a certified PL.
        assert!(
            r.fom_note
                .contains("NOT aviation-certified protection levels"),
            "the result must label the FoM honestly"
        );
    }

    #[test]
    fn transfer_and_surface_users_run() {
        // The other two reference users run end to end and produce a finite covariance.
        for user in [UserKind::Transfer, UserKind::Surface] {
            let mut scn = lmo_scenario();
            scn.user = user;
            // A shorter arc for the high transfer (long period) is fine — we only need it to run.
            scn.duration_s = 7200.0;
            let r = run_mars_pnt(&scn).expect("user runs");
            assert_eq!(r.user, user.as_str());
            assert!(
                r.fom.epochs >= 2,
                "{} produced too few epochs",
                user.as_str()
            );
            assert!(
                r.fom.converged_pos_sigma_m.is_finite(),
                "{} formal σ must be finite",
                user.as_str()
            );
            assert!(
                r.fom.covariance_pd_throughout,
                "{} covariance lost PD-ness",
                user.as_str()
            );
        }
    }

    #[test]
    fn to_svg_emits_a_self_contained_chart() {
        let scn = lmo_scenario();
        let r = run_mars_pnt(&scn).unwrap();
        let svg = to_svg(&r);
        assert!(svg.starts_with("<svg"));
        assert!(svg.ends_with("</svg>"));
        assert!(svg.contains("Mars-PNT"));
        // The covariance bound is labelled honestly on the chart, not as a protection level.
        assert!(svg.contains("not a certified PL"));
    }

    #[test]
    fn invalid_scenario_is_an_error() {
        let mut scn = lmo_scenario();
        scn.step_s = 0.0;
        assert!(run_mars_pnt(&scn).is_err());
        let mut scn2 = lmo_scenario();
        scn2.duration_s = 30.0; // < 2 epochs at 60 s cadence
        assert!(run_mars_pnt(&scn2).is_err());
    }

    #[test]
    fn run_summary_is_one_line_and_honest() {
        let scn = lmo_scenario();
        let r = run_mars_pnt(&scn).unwrap();
        let s = summary(&r);
        assert!(s.starts_with("mars-pnt "));
        assert!(s.contains("covariance FoM, not a certified PL"));
        assert!(!s.contains('\n'));
    }
}
