// SPDX-License-Identifier: AGPL-3.0-only
//! Numerical orbit propagator: a configurable force model integrated by the adaptive
//! Runge–Kutta driver, the first **non-analytic** propagator in Kshana (the rest of the
//! orbit stack is the analytic SGP4/SDP4 of [`crate::sgp4`]).
//!
//! It wires the orbital force model of [`crate::forces`] (two-body `−μr/|r|³`, the J2/zonal
//! field, the **epoch-driven Sun/Moon third body**, **solar-radiation pressure**, and
//! **atmospheric drag**) into the step-doubling integrator of [`crate::integrator`], turning
//! `f(t, [r; v]) = [v; a(t, r, v)]` into a state propagator. The third-body and SRP terms are
//! genuinely *time-varying* (the [`crate::ephem`] Sun/Moon ephemerides are sampled at
//! `epoch_jd_tt + t/86400` each RHS evaluation — the Sun once, shared by the Sun third body and
//! SRP) and drag is genuinely *velocity-dependent* (it opposes the velocity relative to the
//! co-rotating atmosphere), so the RHS passes both `r` and `v` to the acceleration. Its
//! correctness is pinned
//! **against analytic truth that is stronger than a numerical cross-tool would be**:
//!
//! * the unperturbed two-body propagation must reproduce the **exact** universal-variable
//!   Kepler solution ([`crate::maneuver::kepler_universal`]) to sub-metre over a 24-hour LEO
//!   orbit — for the two-body problem the closed form *is* the truth, so this is a tighter
//!   gate than the "vs a numerical reference < 10 m" the milestone phrases it as;
//! * specific energy and angular momentum are conserved over the same arc;
//! * the J2-perturbed nodal regression reproduces the closed-form secular rate
//!   [`crate::forces::j2_secular_rates`] to first-order theory accuracy.
//!
//! It also exposes [`solve_kepler_checked`], a Newton solver for Kepler's equation that
//! **returns `Err` instead of a wrong answer** when it fails to converge within a bounded
//! iteration count (e.g. the near-perigee high-eccentricity `e = 0.999` case), and
//! [`solve_kepler_robust`], the shared Markley-starter solver of [`crate::kepler`] that converges
//! for every `0 ≤ e < 1`.
//!
//! Three adaptive drivers are selectable ([`Integrator`]): RK4 step doubling (the default,
//! [`propagate`]), Dormand–Prince RK5(4) ([`propagate_dopri`]) and Hairer's DOP853
//! ([`propagate_dop853`]).
//!
//! ## Scope (honest)
//!
//! The force model spans **two-body + the J2..J6 zonal field + the epoch-driven Sun/Moon third
//! body + solar-radiation pressure + atmospheric drag + the post-Newtonian relativistic
//! correction** (the cannonball SRP model with a conical umbra+penumbra eclipse, quadratic drag
//! against the Vallado piecewise-exponential atmosphere, and the Schwarzschild perigee-advance
//! term). A full **tesseral** Earth geopotential (the bundled EGM2008 field to degree/order 70,
//! or any ICGEM `.gfc` model through [`crate::gravity_sh::SphericalHarmonicField::from_gfc`]) is
//! available as an **opt-in** [`Geopotential`] ([`ForceModel::with_geopotential`],
//! [`ForceModel::with_egm2008`]); the default stays the zonal path, so every existing output is
//! unchanged. The field is evaluated in the Earth-fixed frame reached either by the Earth rotation
//! angle alone ([`EarthFixedFrame::Era`], the integration frame then being the
//! celestial-intermediate frame) or by the full CIO-based GCRS→ITRS chain with nominal Earth
//! orientation ([`EarthFixedFrame::Cio`]). The WGS-84 oblate-Earth shadow and solar limb
//! darkening are opt-in through [`ForceModel::srp_shadow`] (see `ROADMAP.md`). By default the third-body/SRP ephemerides are the
//! [`crate::ephem`] *low-precision* analytical series (~0.005° Sun, ~0.3° Moon); the opt-in
//! ephemeris tier ([`ForceModel::with_ephemeris`]) reads them from any [`EphemerisProvider`], e.g.
//! a DE440 SPK kernel through [`crate::ephem_provider::KernelEphemeris`]. The drag density
//! defaults to the static exponential model, with NRLMSISE-00 opt-in via
//! [`ForceModel::drag_density`]. What is delivered is the integrator + the
//! two-body/J2/zonal/tesseral/third-body/SRP/drag/relativity force model + the analytic-truth
//! validation harness, the three adaptive drivers (step doubling, Dormand–Prince 5(4), DOP853) and
//! the convergence-guarded and robust Kepler solvers.

use crate::body::Body;
use crate::cio::{earth_rotation_angle, gcrs_to_itrs_matrix};
use crate::ephem::{moon_position, sun_position};
use crate::ephem_provider::{tt_to_tdb_jd2, EphemerisProvider};
use crate::forces::{
    drag_accel_with_density, j2_accel, lense_thirring_accel, relativistic_accel, srp_accel,
    third_body_accel, two_body_accel_body, zonal_accel, DensityModel, EARTH_ZONALS_J2_J6, MU_EARTH,
    MU_MOON, MU_SUN,
};
use crate::gravity_sh::SphericalHarmonicField;
use crate::integrator::{
    integrate, integrate_dop853_checked, integrate_dopri, rk4_step, Dop853Error, Tolerance,
};
use crate::jd2::Jd2;
use crate::precession::{julian_centuries_tt, mat_vec, transpose, Mat3};
use crate::sgp4::Sgp4;
use crate::timescales::SECONDS_PER_DAY;
use std::sync::atomic::{AtomicUsize, Ordering};
use std::sync::Arc;

type Vec3 = [f64; 3];

fn cross(a: Vec3, b: Vec3) -> Vec3 {
    [
        a[1] * b[2] - a[2] * b[1],
        a[2] * b[0] - a[0] * b[2],
        a[0] * b[1] - a[1] * b[0],
    ]
}

fn dot(a: Vec3, b: Vec3) -> f64 {
    a[0] * b[0] + a[1] * b[1] + a[2] * b[2]
}

fn norm(a: Vec3) -> f64 {
    dot(a, a).sqrt()
}

/// Which perturbations the propagated force model includes on top of two-body gravity.
///
/// `Clone` (not `Copy`): the [`body`](Self::body) carries an optional
/// [`crate::gravity_sh::SphericalHarmonicField`], which owns heap data and is not `Copy`.
#[derive(Clone, Debug, Default)]
pub struct ForceModel {
    /// The central body the gravity is taken about. Defaults to [`Body::earth`], for which the
    /// central-gravity path is **byte-identical** to the historical Earth-hard-coded code; set a
    /// different body with [`with_body`](Self::with_body) to propagate about Mars, the Moon, etc.
    pub body: Body,
    /// Include the J2 oblateness perturbation.
    pub j2: bool,
    /// Optional zonal-harmonic field (`[J2, J3, …]` from degree 2) integrated via
    /// [`crate::forces::zonal_accel`]. When `Some`, it supersedes the `j2`-only path and the
    /// full supplied zonal set is used on top of two-body gravity.
    pub zonals: Option<&'static [f64]>,
    /// Include the Sun's third-body perturbation, using the [`crate::ephem::sun_position`]
    /// low-precision ephemeris advanced from [`epoch_jd_tt`](Self::epoch_jd_tt).
    pub sun: bool,
    /// Include the Moon's third-body perturbation, using [`crate::ephem::moon_position`].
    pub moon: bool,
    /// Propagation epoch as a Julian Date in TT (the instant of integration time `t = 0`). The
    /// perturber positions are evaluated at `epoch_jd_tt + t/86400` days, so the Sun/Moon
    /// actually advance along their orbits during the integration — this is what makes the
    /// third-body force *time-varying* rather than frozen at the start. Ignored when
    /// [`sun`](Self::sun), [`moon`](Self::moon) and [`srp`](Self::srp) are all `false`.
    pub epoch_jd_tt: f64,
    /// Include solar-radiation pressure ([`crate::forces::srp_accel`], cannonball model with the
    /// cylindrical-shadow eclipse), using the same epoch-driven [`crate::ephem::sun_position`].
    pub srp: bool,
    /// SRP radiation-pressure coefficient `cᵣ` (dimensionless; ≈1 absorptive, →2 specular). Used
    /// only when [`srp`](Self::srp) is `true`.
    pub cr: f64,
    /// SRP cross-section-to-mass ratio `A/m` (m²/kg). Used only when [`srp`](Self::srp) is `true`.
    pub area_over_mass: f64,
    /// The SRP eclipse model (opt-in refinements of the default spherical conical shadow:
    /// the WGS-84 oblate shadow, optionally with solar limb darkening). The default leaves the
    /// historical [`crate::forces::srp_accel`] path bit-for-bit unchanged.
    pub srp_shadow: crate::srp_shadow::ShadowModel,
    /// Include atmospheric drag ([`crate::forces::drag_accel`], quadratic drag against the
    /// co-rotating atmosphere of [`crate::forces::atmospheric_density`]). Unlike the other terms
    /// this is **velocity-dependent**, so it is applied in [`accel_rv`](Self::accel_rv)/the RHS,
    /// not the position-only [`accel_at`](Self::accel_at).
    pub drag: bool,
    /// Drag ballistic area term `C_D·A/m` (m²/kg). Used only when [`drag`](Self::drag) is `true`.
    pub cd_area_over_mass: f64,
    /// Include the post-Newtonian (Schwarzschild) relativistic correction
    /// ([`crate::forces::relativistic_accel`]). Like atmospheric drag this is
    /// **velocity-dependent**, so it is applied in [`accel_rv`](Self::accel_rv)/the RHS rather
    /// than the position-only [`accel_at`](Self::accel_at).
    pub relativity: bool,
    /// Include the post-Newtonian **Lense–Thirring** frame-dragging correction
    /// ([`crate::forces::lense_thirring_accel`]) — the gravitomagnetic term beyond
    /// Schwarzschild. Velocity-dependent; applied in [`accel_rv`](Self::accel_rv)/the RHS.
    pub lense_thirring: bool,
    /// Include the **solid Earth + ocean tide** perturbation ([`crate::tides::tidal_acceleration`],
    /// IERS Conventions 2010 Ch.6). Like the third body it is epoch-driven (evaluated at
    /// `epoch_jd_tt + t/86400`), so set the epoch via [`third_body`](Self::third_body). The
    /// permanent tide is removed so it does not double-count a zero-tide static field.
    pub tides: bool,
    /// Include the opt-in **S1 (diurnal) atmospheric tide** ([`crate::tides::s1_air_tide_acceleration`],
    /// Biancale & Bode 2006 model N1, degrees 2–6). Epoch-driven like [`tides`](Self::tides) and
    /// independent of it; off by default, so no existing output moves.
    pub air_tide_s1: bool,
    /// Opt-in **ephemeris tier** for the Sun and Moon positions that feed the third-body and SRP
    /// terms. `None` (the default) keeps the [`crate::ephem`] low-precision analytic series, bit for
    /// bit. `Some` reads the positions from an [`crate::ephem_provider::EphemerisProvider`] — a
    /// JPL DE440 kernel through [`crate::ephem_provider::KernelEphemeris`] is the intended use —
    /// at the TDB epoch of each right-hand-side evaluation. Set it with
    /// [`with_ephemeris`](Self::with_ephemeris).
    pub ephemeris: Option<ForceEphemeris>,
    /// Opt-in **drag-density tier** used when [`drag`](Self::drag) is on. The default,
    /// [`DensityModel::Exponential`], is the static piecewise-exponential model, bit for bit; set
    /// [`DensityModel::Nrlmsise00`] (with [`drag_density`](Self::drag_density)) for the
    /// NRLMSISE-00 thermosphere at fixed F10.7/Ap, sampled at `epoch_jd_tt + t/86400`.
    pub drag_density: DensityModel,
    /// Optional **tesseral Earth geopotential** (opt-in; `None` by default). When `Some`, its
    /// spherical-harmonic field is the whole central gravity: it supersedes the two-body,
    /// [`j2`](Self::j2), [`zonals`](Self::zonals) and [`Body::gravity`] paths (the field carries
    /// its own `GM` and `C̄₀₀`). `None` leaves every historical output bit-for-bit unchanged.
    pub geopotential: Option<Geopotential>,
}

/// A shared [`EphemerisProvider`] for the propagator's opt-in ephemeris tier
/// ([`ForceModel::ephemeris`]), with a count of the evaluations the provider could not serve.
///
/// The kernel positions are geocentric in the ICRF (the kernel's J2000 frame), so with this tier
/// the integration frame is the GCRF; the analytic series of the default tier are mean of date to
/// within their own truncation error. When the provider returns `None` at some epoch (outside the
/// kernel's coverage), that evaluation falls back to the analytic series and the fallback is
/// counted; [`fallbacks`](Self::fallbacks) reports it, so a run that left the kernel is visible
/// rather than silent. [`ForceModel::with_ephemeris`] refuses a provider that cannot serve the
/// epoch itself.
#[derive(Clone)]
pub struct ForceEphemeris {
    provider: Arc<dyn EphemerisProvider + Send + Sync>,
    fallbacks: Arc<AtomicUsize>,
}

impl std::fmt::Debug for ForceEphemeris {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        f.debug_struct("ForceEphemeris")
            .field("provider", &self.provider)
            .field("fallbacks", &self.fallbacks())
            .finish()
    }
}

impl ForceEphemeris {
    /// Wrap a provider.
    pub fn new(provider: Arc<dyn EphemerisProvider + Send + Sync>) -> Self {
        Self {
            provider,
            fallbacks: Arc::new(AtomicUsize::new(0)),
        }
    }

    /// The wrapped provider.
    pub fn provider(&self) -> &(dyn EphemerisProvider + Send + Sync) {
        self.provider.as_ref()
    }

    /// How many right-hand-side evaluations fell back to the analytic series because the provider
    /// returned no position (shared by every clone of this model).
    pub fn fallbacks(&self) -> usize {
        self.fallbacks.load(Ordering::Relaxed)
    }

    /// The geocentric position (m) of `body` at the TT epoch `jd_tt`, from the provider at the
    /// corresponding TDB epoch, or the analytic `fallback` (counted) when it has none.
    fn geocentric(&self, body: &Body, jd_tt: Jd2, fallback: impl FnOnce() -> Vec3) -> Vec3 {
        let jd_tdb = tt_to_tdb_jd2(jd_tt);
        match self
            .provider
            .relative_position_jd2(body, &Body::earth(), jd_tdb)
        {
            Some(p) => p,
            None => {
                self.fallbacks.fetch_add(1, Ordering::Relaxed);
                fallback()
            }
        }
    }
}

/// The Earth-fixed frame an opt-in [`Geopotential`] is evaluated in, i.e. how the propagator's
/// inertial position is rotated into the frame the `C̄_nm, S̄_nm` coefficients are defined in.
#[derive(Clone, Copy, Debug, Default, PartialEq, Eq)]
pub enum EarthFixedFrame {
    /// A rotation about the inertial z axis by the Earth rotation angle
    /// ([`crate::cio::earth_rotation_angle`], IAU 2000) at UT1 = TT + `ut1_minus_tt_s`. The
    /// inertial integration frame is then the celestial intermediate frame of date with its
    /// precession–nutation frozen, which is the propagator's plain-ECI convention. The default.
    #[default]
    Era,
    /// The full CIO-based GCRS→ITRS rotation ([`crate::cio::gcrs_to_itrs_matrix`], SOFA
    /// `c2tcio`: IAU 2006/2000A precession–nutation, Earth rotation angle) with nominal Earth
    /// orientation (UT1 = TT + `ut1_minus_tt_s`, no polar motion). The inertial integration frame
    /// is then the GCRS, as in [`crate::precise_od`].
    Cio,
}

/// Which spherical-harmonic evaluator a [`Geopotential`] calls.
#[derive(Clone, Copy, Debug, Default, PartialEq, Eq)]
pub enum FieldEvaluator {
    /// [`SphericalHarmonicField::acceleration`]: the classic spherical-partials form. Accurate
    /// away from the poles to degree ~180; the evaluator the degree-70 Orekit tier validates. The
    /// default.
    #[default]
    Classic,
    /// [`SphericalHarmonicField::acceleration_hf`]: the Holmes–Featherstone modified forward-column
    /// form, free of underflow and of the polar singularity to degree 2190. Use it above degree
    /// ~180 or for orbits that pass close to the poles.
    HolmesFeatherstone,
}

/// An opt-in tesseral Earth gravity field for [`ForceModel`]: a fully-normalized
/// [`SphericalHarmonicField`] (shared, so cloning a model never copies a high-degree field), the
/// [`EarthFixedFrame`] it is evaluated in, and the UT1 offset that sets the Earth's rotation.
#[derive(Clone, Debug)]
pub struct Geopotential {
    /// The spherical-harmonic field (Earth-fixed, central term included).
    pub field: Arc<SphericalHarmonicField>,
    /// The Earth-fixed frame the field is evaluated in.
    pub frame: EarthFixedFrame,
    /// `UT1 − TT` (s) used for the Earth rotation angle; `0` (the default) takes UT1 = TT, a
    /// fixed ~69 s (~0.3°) rotation offset that callers with real Earth orientation replace.
    pub ut1_minus_tt_s: f64,
    /// The spherical-harmonic evaluator.
    pub evaluator: FieldEvaluator,
}

impl Geopotential {
    /// A geopotential over `field`, evaluated in the [`EarthFixedFrame::Era`] frame with UT1 = TT.
    pub fn new(field: SphericalHarmonicField) -> Self {
        Self {
            field: Arc::new(field),
            frame: EarthFixedFrame::Era,
            ut1_minus_tt_s: 0.0,
            evaluator: FieldEvaluator::Classic,
        }
    }

    /// The bundled EGM2008 field truncated to degree/order `nmax` (clamped to the shipped 70).
    pub fn egm2008(nmax: usize) -> Self {
        Self::new(SphericalHarmonicField::egm2008_truncated(nmax))
    }

    /// Select the Earth-fixed frame (chainable).
    pub fn in_frame(mut self, frame: EarthFixedFrame) -> Self {
        self.frame = frame;
        self
    }

    /// Select the spherical-harmonic evaluator (chainable). Choosing
    /// [`FieldEvaluator::HolmesFeatherstone`] builds the field's recursion table once, here.
    pub fn with_evaluator(mut self, evaluator: FieldEvaluator) -> Self {
        if evaluator == FieldEvaluator::HolmesFeatherstone {
            self.field.prepare_high_degree();
        }
        self.evaluator = evaluator;
        self
    }

    /// Set `UT1 − TT` in seconds (chainable).
    pub fn with_ut1_minus_tt(mut self, ut1_minus_tt_s: f64) -> Self {
        self.ut1_minus_tt_s = ut1_minus_tt_s;
        self
    }

    /// The inertial→Earth-fixed rotation matrix at TT epoch `jd_tt`.
    pub fn inertial_to_earth_fixed(&self, jd_tt: f64) -> Mat3 {
        let jd_ut1 = jd_tt + self.ut1_minus_tt_s / SECONDS_PER_DAY;
        match self.frame {
            EarthFixedFrame::Era => {
                let (s, c) = earth_rotation_angle(jd_ut1).sin_cos();
                [[c, s, 0.0], [-s, c, 0.0], [0.0, 0.0, 1.0]]
            }
            EarthFixedFrame::Cio => gcrs_to_itrs_matrix(jd_tt, jd_ut1, 0.0, 0.0),
        }
    }

    /// The central gravitational acceleration (m/s², inertial) at inertial position `r` (m) and
    /// TT epoch `jd_tt`: rotate `r` into the Earth-fixed frame, evaluate the field there, rotate
    /// the acceleration back.
    pub fn acceleration(&self, jd_tt: f64, r: Vec3) -> Vec3 {
        let m = self.inertial_to_earth_fixed(jd_tt);
        let r_ef = mat_vec(&m, r);
        let a_ef = match self.evaluator {
            FieldEvaluator::Classic => self.field.acceleration(r_ef),
            FieldEvaluator::HolmesFeatherstone => self.field.acceleration_hf(r_ef),
        };
        mat_vec(&transpose(&m), a_ef)
    }
}

impl ForceModel {
    /// Point-mass (two-body) gravity only.
    pub fn two_body() -> Self {
        Self::default()
    }

    /// Two-body plus the J2 oblateness perturbation.
    pub fn with_j2() -> Self {
        Self {
            j2: true,
            ..Self::default()
        }
    }

    /// Two-body plus the full Earth zonal field through degree 6 (`J2..J6`).
    pub fn with_zonals_j2_j6() -> Self {
        Self {
            j2: true,
            zonals: Some(&EARTH_ZONALS_J2_J6),
            ..Self::default()
        }
    }

    /// Add the epoch-driven Sun and/or Moon third-body perturbation to this model. `epoch_jd_tt`
    /// is the Julian Date (TT) at integration time `t = 0`; the perturber positions advance to
    /// `epoch_jd_tt + t/86400` days during the integration, so the force is genuinely
    /// time-varying. Composable with any gravity model, e.g.
    /// `ForceModel::with_zonals_j2_j6().third_body(true, true, epoch)`.
    pub fn third_body(mut self, sun: bool, moon: bool, epoch_jd_tt: f64) -> Self {
        self.sun = sun;
        self.moon = moon;
        self.epoch_jd_tt = epoch_jd_tt;
        self
    }

    /// Add epoch-driven solar-radiation pressure to this model with radiation-pressure
    /// coefficient `cr` (≈1.0–2.0) and cross-section-to-mass ratio `area_over_mass` (m²/kg). SRP
    /// needs the Sun's position, so set the epoch via [`third_body`](Self::third_body) (or rely
    /// on `epoch_jd_tt = 0`); the Sun is sampled at the same advanced epoch as the third body, so
    /// `with_zonals_j2_j6().third_body(true, true, epoch).solar_radiation(1.5, 0.02)` shares one
    /// ephemeris evaluation. Composable with any gravity / third-body configuration.
    pub fn solar_radiation(mut self, cr: f64, area_over_mass: f64) -> Self {
        self.srp = true;
        self.cr = cr;
        self.area_over_mass = area_over_mass;
        self
    }

    /// Select the SRP eclipse model (chainable; default the spherical conical shadow).
    pub fn srp_shadow(mut self, model: crate::srp_shadow::ShadowModel) -> Self {
        self.srp_shadow = model;
        self
    }

    /// Add atmospheric drag with ballistic area term `cd_area_over_mass = C_D·A/m` (m²/kg). Drag
    /// is **velocity-dependent**, so it enters via [`accel_rv`](Self::accel_rv) and the integrator
    /// RHS rather than the position-only [`accel_at`](Self::accel_at). Composable with any other
    /// configuration, e.g. `ForceModel::with_zonals_j2_j6().drag(0.02)`.
    pub fn drag(mut self, cd_area_over_mass: f64) -> Self {
        self.drag = true;
        self.cd_area_over_mass = cd_area_over_mass;
        self
    }

    /// Select the drag-density tier (chainable after [`drag`](Self::drag)), e.g.
    /// `ForceModel::two_body().third_body(false, false, epoch).drag(0.02)
    /// .drag_density(DensityModel::Nrlmsise00 { f107a: 150.0, f107: 150.0, ap: 15.0 })`. The
    /// NRLMSISE-00 tier is time dependent, so set the epoch (via [`third_body`](Self::third_body)
    /// or [`epoch_jd_tt`](Self::epoch_jd_tt)).
    pub fn drag_density(mut self, model: DensityModel) -> Self {
        self.drag_density = model;
        self
    }

    /// Add the post-Newtonian (Schwarzschild) relativistic correction
    /// ([`crate::forces::relativistic_accel`]) to this model. Like drag it is
    /// velocity-dependent, so it enters via [`accel_rv`](Self::accel_rv) and the integrator RHS.
    /// It needs no parameters and composes with any configuration, e.g.
    /// `ForceModel::with_zonals_j2_j6().relativity()`.
    pub fn relativity(mut self) -> Self {
        self.relativity = true;
        self
    }

    /// Enable the Lense–Thirring frame-dragging correction (chainable, like [`relativity`](Self::relativity)).
    pub fn lense_thirring(mut self) -> Self {
        self.lense_thirring = true;
        self
    }

    /// Enable the solid Earth + ocean tide perturbation (IERS Ch.6). It is epoch-driven, so set
    /// the epoch via [`third_body`](Self::third_body) (or the `epoch_jd_tt` field); e.g.
    /// `ForceModel::with_zonals_j2_j6().third_body(true, true, epoch).tides()`.
    pub fn tides(mut self) -> Self {
        self.tides = true;
        self
    }

    /// Enable the opt-in S1 atmospheric tide (chainable); set the epoch via
    /// [`third_body`](Self::third_body).
    pub fn air_tide_s1(mut self) -> Self {
        self.air_tide_s1 = true;
        self
    }

    /// Set the central body the gravity is taken about (default [`Body::earth`]). The two-body
    /// term uses `body.mu`, and a full tesseral [`Body::gravity`] field, when present, supersedes
    /// the J2/zonal path. Composable with any configuration, e.g.
    /// `ForceModel::two_body().with_body(Body::mars())`.
    pub fn with_body(mut self, body: Body) -> Self {
        self.body = body;
        self
    }

    /// Take the Sun and Moon positions of the third-body and SRP terms from `provider` (the opt-in
    /// DE-grade ephemeris tier, [`ForceModel::ephemeris`]) instead of the analytic series. The
    /// epoch must already be set (with [`third_body`](Self::third_body)); the provider must serve
    /// the geocentric Sun and Moon there, or this returns `Err` and nothing is changed. A
    /// [`crate::ephem_provider::KernelEphemeris`] over `de440s.bsp` is the intended provider.
    pub fn with_ephemeris(
        mut self,
        provider: Arc<dyn EphemerisProvider + Send + Sync>,
    ) -> Result<Self, String> {
        let jd_tdb = tt_to_tdb_jd2(Jd2::new(self.epoch_jd_tt));
        for body in [Body::sun(), Body::moon()] {
            if provider
                .relative_position_jd2(&body, &Body::earth(), jd_tdb)
                .is_none()
            {
                return Err(format!(
                    "the ephemeris provider has no geocentric {} at JD(TT) {}",
                    body.name, self.epoch_jd_tt
                ));
            }
        }
        self.ephemeris = Some(ForceEphemeris::new(provider));
        Ok(self)
    }

    /// The geocentric Sun and Moon (m) the perturbation terms use at integration time `t`, from
    /// the opt-in ephemeris tier when set, else the analytic series at `tjc` (the default path,
    /// unchanged). Only the requested bodies are evaluated.
    fn perturbers(
        &self,
        t: f64,
        tjc: f64,
        want_sun: bool,
        want_moon: bool,
    ) -> (Option<Vec3>, Option<Vec3>) {
        match &self.ephemeris {
            None => (
                want_sun.then(|| sun_position(tjc)),
                want_moon.then(|| moon_position(tjc)),
            ),
            Some(e) => {
                let jd_tt = Jd2::new(self.epoch_jd_tt).add_seconds(t);
                (
                    want_sun.then(|| e.geocentric(&Body::sun(), jd_tt, || sun_position(tjc))),
                    want_moon.then(|| e.geocentric(&Body::moon(), jd_tt, || moon_position(tjc))),
                )
            }
        }
    }

    /// Use the opt-in tesseral Earth [`Geopotential`] as the central gravity (it supersedes the
    /// two-body/J2/zonal/[`Body::gravity`] paths). Composable with every other term, e.g.
    /// `ForceModel::two_body().with_geopotential(Geopotential::egm2008(70)).third_body(true, true, epoch)`.
    pub fn with_geopotential(mut self, geopotential: Geopotential) -> Self {
        self.geopotential = Some(geopotential);
        self
    }

    /// Shorthand for [`with_geopotential`](Self::with_geopotential) over the bundled EGM2008
    /// field to degree/order `nmax` (≤ 70) in the [`EarthFixedFrame::Era`] frame with UT1 = TT.
    pub fn with_egm2008(self, nmax: usize) -> Self {
        self.with_geopotential(Geopotential::egm2008(nmax))
    }

    /// The time-independent **central** gravity (m/s², ECI) at position `r` (m): two-body plus
    /// the configured J2/zonal field, but *not* the third-body terms (which depend on time
    /// through the ephemeris — see [`accel_at`](Self::accel_at)). For a model without Sun/Moon
    /// this is the full acceleration.
    ///
    /// The central gravity is taken about [`self.body`](Self::body): the two-body term uses
    /// `body.mu` ([`crate::forces::two_body_accel_body`]), and when the body carries a full
    /// tesseral [`Body::gravity`] field that supersedes the J2/zonal path. For the default
    /// [`Body::earth`] (`μ = MU_EARTH`, no SH field) this reduces to the historical
    /// `two_body_accel(r) (+ j2_accel / + zonal_accel)` arithmetic **bit-for-bit**.
    pub fn accel(&self, r: Vec3) -> Vec3 {
        self.central_accel_at(self.epoch_jd_tt, r)
    }

    /// The central gravity (m/s², ECI) at position `r` and absolute epoch `jd_tt`. A full tesseral
    /// [`Body::gravity`] field is evaluated in the **body-fixed frame** (rotate `r` into the
    /// body-fixed frame with [`crate::mars_frame`], evaluate the field there, rotate the
    /// acceleration back), so the field's tesseral/longitude structure rotates with the body — the
    /// epoch is what selects the body's orientation. The Earth default has `gravity: None`, so this
    /// SH branch never runs for Earth and the goldens are untouched; the two-body/J2/zonal path is
    /// epoch-independent, so for Earth `central_accel_at(_, r)` is bit-for-bit the legacy `accel`.
    ///
    /// TDB ≈ TT is used for the body orientation (sub-2-ms agreement ⇒ a sub-µas orientation
    /// error, far below the gravity-field accuracy at this degree).
    fn central_accel_at(&self, jd_tt: f64, r: Vec3) -> Vec3 {
        // The opt-in tesseral Earth geopotential is the whole central field when present. It is
        // `None` by default, so this branch never runs for a historical configuration.
        if let Some(gp) = &self.geopotential {
            return gp.acceleration(jd_tt, r);
        }
        if let Some(field) = &self.body.gravity {
            // Rotate the inertial position into the body-fixed frame, evaluate the Mars-fixed
            // field, rotate the acceleration back to inertial (mirrors `crate::lunar_od`).
            let r_bf = crate::mars_frame::inertial_to_bodyfixed(r, &self.body, jd_tt);
            let a_bf = field.acceleration(r_bf);
            return crate::mars_frame::bodyfixed_to_inertial(a_bf, &self.body, jd_tt);
        }
        let tb = two_body_accel_body(r, &self.body);
        if let Some(jn) = self.zonals {
            let zo = zonal_accel(r, jn);
            [tb[0] + zo[0], tb[1] + zo[1], tb[2] + zo[2]]
        } else if self.j2 {
            let j = j2_accel(r);
            [tb[0] + j[0], tb[1] + j[1], tb[2] + j[2]]
        } else {
            tb
        }
    }

    /// The full acceleration (m/s², ECI) at integration time `t` (seconds since the epoch) and
    /// position `r` (m): the central gravity of [`accel`](Self::accel) plus, when enabled, the
    /// Sun/Moon third-body perturbations and solar-radiation pressure, all evaluated at the
    /// *advanced* epoch `epoch_jd_tt + t/86400`. The Sun ephemeris is computed once and shared by
    /// the Sun third body and SRP. When none of those are enabled this is identical to `accel(r)`
    /// for every `t`.
    pub fn accel_at(&self, t: f64, r: Vec3) -> Vec3 {
        // The central gravity is evaluated at the *advanced* epoch `epoch_jd_tt + t/86400`. This
        // only matters for a body-fixed [`Body::gravity`] tesseral field, whose orientation is
        // epoch-dependent (the planet rotates under the spacecraft); the two-body/J2/zonal path —
        // including the entire Earth path, where `gravity: None` — is epoch-independent, so this is
        // bit-for-bit `self.accel(r)` for Earth and any non-SH body, keeping the goldens untouched.
        let jd_tt = self.epoch_jd_tt + t / SECONDS_PER_DAY;
        let mut a = self.central_accel_at(jd_tt, r);
        if self.sun || self.moon || self.srp {
            let tjc = julian_centuries_tt(jd_tt);
            // The Sun ephemeris feeds both the Sun third body and SRP — evaluate it once.
            let (sun, moon) = self.perturbers(t, tjc, self.sun || self.srp, self.moon);
            if self.sun {
                let sun = sun.expect(
                    "`sun` is Some whenever `self.sun || self.srp`, and `self.sun` holds here",
                );
                let p = third_body_accel(r, sun, MU_SUN);
                a = [a[0] + p[0], a[1] + p[1], a[2] + p[2]];
            }
            if self.moon {
                let moon = moon.expect("`moon` is Some whenever `self.moon` holds");
                let p = third_body_accel(r, moon, MU_MOON);
                a = [a[0] + p[0], a[1] + p[1], a[2] + p[2]];
            }
            if self.srp {
                let sun = sun.expect(
                    "`sun` is Some whenever `self.sun || self.srp`, and `self.srp` holds here",
                );
                let p = match self.srp_shadow {
                    crate::srp_shadow::ShadowModel::ConicalSphere => {
                        srp_accel(r, sun, self.cr, self.area_over_mass)
                    }
                    m => crate::forces::srp_accel_with_lit_fraction(
                        r,
                        sun,
                        self.cr,
                        self.area_over_mass,
                        m.lit_fraction(r, sun),
                    ),
                };
                a = [a[0] + p[0], a[1] + p[1], a[2] + p[2]];
            }
        }
        if self.tides {
            let p = crate::tides::tidal_acceleration(r, jd_tt);
            a = [a[0] + p[0], a[1] + p[1], a[2] + p[2]];
        }
        if self.air_tide_s1 {
            let p = crate::tides::s1_air_tide_acceleration(r, jd_tt);
            a = [a[0] + p[0], a[1] + p[1], a[2] + p[2]];
        }
        a
    }

    /// The full acceleration (m/s², ECI) at time `t`, position `r` and velocity `v`: the
    /// position/time-dependent terms of [`accel_at`](Self::accel_at) plus, when enabled, the
    /// **velocity-dependent atmospheric drag** [`crate::forces::drag_accel`]. This is what the
    /// integrator RHS evaluates. With drag disabled it is identical to `accel_at(t, r)`.
    pub fn accel_rv(&self, t: f64, r: Vec3, v: Vec3) -> Vec3 {
        let mut a = self.accel_at(t, r);
        if self.drag {
            let d = drag_accel_with_density(
                r,
                v,
                self.cd_area_over_mass,
                &self.drag_density,
                self.epoch_jd_tt + t / SECONDS_PER_DAY,
            );
            a = [a[0] + d[0], a[1] + d[1], a[2] + d[2]];
        }
        if self.relativity {
            let g = relativistic_accel(r, v);
            a = [a[0] + g[0], a[1] + g[1], a[2] + g[2]];
        }
        if self.lense_thirring {
            let g = lense_thirring_accel(r, v);
            a = [a[0] + g[0], a[1] + g[1], a[2] + g[2]];
        }
        a
    }

    /// The first-order ODE right-hand side `f(t, [r; v]) = [v; a(t, r, v)]` for the integrator.
    /// The `t`-dependence is real (Sun/Moon/SRP sampled at `epoch_jd_tt + t/86400`) and so is the
    /// velocity dependence (atmospheric drag opposes the velocity relative to the co-rotating
    /// atmosphere) — hence the RHS passes both `r` and `v` to [`accel_rv`](Self::accel_rv).
    fn rhs(&self) -> impl Fn(f64, &[f64]) -> Vec<f64> + '_ {
        move |t: f64, y: &[f64]| {
            let a = self.accel_rv(t, [y[0], y[1], y[2]], [y[3], y[4], y[5]]);
            vec![y[3], y[4], y[5], a[0], a[1], a[2]]
        }
    }
}

/// Whether an initial state and duration are all finite (no NaN/Inf). The adaptive integrators
/// loop until an error norm falls below tolerance; a non-finite input makes that norm NaN, which
/// never converges, so callers guard with this and fail closed instead of hanging.
fn state_is_finite(r0: Vec3, v0: Vec3, t_end: f64) -> bool {
    t_end.is_finite() && r0.iter().all(|x| x.is_finite()) && v0.iter().all(|x| x.is_finite())
}

/// Numerically propagate the ECI state `(r0, v0)` (m, m/s) forward by `t_end` seconds under
/// `model`, with adaptive step-doubling error control to `tol`. Returns the final `(r, v)`.
pub fn propagate(
    r0: Vec3,
    v0: Vec3,
    t_end: f64,
    model: &ForceModel,
    tol: &Tolerance,
) -> (Vec3, Vec3) {
    // A non-finite initial state or duration makes the adaptive step controller's error norm
    // NaN, which never satisfies the tolerance and spins forever. Fail closed (NaN in → NaN out).
    if !state_is_finite(r0, v0, t_end) {
        return (r0, v0);
    }
    let f = model.rhs();
    let y0 = vec![r0[0], r0[1], r0[2], v0[0], v0[1], v0[2]];
    // Initial step: a small fraction of the orbital period is a safe, well-scaled guess.
    let h0 = (t_end / 1000.0).max(1.0).min(t_end.max(1e-3));
    let sol = integrate(&f, 0.0, &y0, t_end, h0, tol);
    (
        [sol.y[0], sol.y[1], sol.y[2]],
        [sol.y[3], sol.y[4], sol.y[5]],
    )
}

/// Numerically propagate `(r0, v0)` forward by `t_end` seconds under `model` using the adaptive
/// **Dormand–Prince RK5(4)** driver ([`crate::integrator::integrate_dopri`]) instead of step
/// doubling. Same force model and result as [`propagate`]; the embedded pair reaches the same
/// tolerance in fewer function evaluations (and the two agree to well within tolerance).
pub fn propagate_dopri(
    r0: Vec3,
    v0: Vec3,
    t_end: f64,
    model: &ForceModel,
    tol: &Tolerance,
) -> (Vec3, Vec3) {
    if !state_is_finite(r0, v0, t_end) {
        return (r0, v0);
    }
    let f = model.rhs();
    let y0 = vec![r0[0], r0[1], r0[2], v0[0], v0[1], v0[2]];
    let h0 = (t_end / 1000.0).max(1.0).min(t_end.max(1e-3));
    let sol = integrate_dopri(&f, 0.0, &y0, t_end, h0, tol);
    (
        [sol.y[0], sol.y[1], sol.y[2]],
        [sol.y[3], sol.y[4], sol.y[5]],
    )
}

/// Numerically propagate `(r0, v0)` by `t_end` seconds (either sign) under `model` with the
/// adaptive **DOP853** driver ([`crate::integrator::integrate_dop853_checked`]), the first step
/// chosen automatically. Returns the final `(r, v)`, or the reason the run stopped short (the
/// error carries the last accepted state). A non-finite input is an error.
pub fn propagate_dop853_checked(
    r0: Vec3,
    v0: Vec3,
    t_end: f64,
    model: &ForceModel,
    tol: &Tolerance,
) -> Result<(Vec3, Vec3), Dop853Error> {
    let f = model.rhs();
    let y0 = vec![r0[0], r0[1], r0[2], v0[0], v0[1], v0[2]];
    let run = integrate_dop853_checked(&f, 0.0, &y0, t_end, 0.0, tol)?;
    Ok((
        [run.y[0], run.y[1], run.y[2]],
        [run.y[3], run.y[4], run.y[5]],
    ))
}

/// [`propagate_dop853_checked`] as a plain `(r, v)`, with the existing propagators' contract for
/// a non-finite input (returned unchanged, NaN in → NaN out) and a **NaN state** when the
/// integration stops short of `t_end` (fail closed: never a state at the wrong epoch).
pub fn propagate_dop853(
    r0: Vec3,
    v0: Vec3,
    t_end: f64,
    model: &ForceModel,
    tol: &Tolerance,
) -> (Vec3, Vec3) {
    if !state_is_finite(r0, v0, t_end) {
        return (r0, v0);
    }
    propagate_dop853_checked(r0, v0, t_end, model, tol).unwrap_or(([f64::NAN; 3], [f64::NAN; 3]))
}

/// An inertial (TEME/ECI) state returned by a [`Propagator`], in **SI units** — position in
/// metres, velocity in metres per second. This is the common currency of the trait, so the
/// analytic SGP4 (which works in km, km/s) and the numerical propagator (which works in m, m/s)
/// can be used interchangeably without a caller tracking each one's units.
#[derive(Clone, Copy, Debug, PartialEq)]
pub struct StateVector {
    /// Position in metres (TEME/ECI).
    pub r: Vec3,
    /// Velocity in metres per second (TEME/ECI).
    pub v: Vec3,
}

/// An error returned by a [`Propagator`].
#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub enum PropagatorError {
    /// The analytic SGP4/SDP4 model returned a non-physical state, carrying its integer error
    /// code (1 eccentricity, 2 mean motion, 3 perturbed eccentricity, 4 semi-latus rectum,
    /// 6 decayed).
    Sgp4(i32),
}

impl core::fmt::Display for PropagatorError {
    fn fmt(&self, f: &mut core::fmt::Formatter<'_>) -> core::fmt::Result {
        match self {
            PropagatorError::Sgp4(code) => write!(f, "SGP4 propagation error (code {code})"),
        }
    }
}

impl std::error::Error for PropagatorError {}

/// An orbit propagator: it advances an orbital state to a time `t_seconds` **after its own
/// epoch** and returns the inertial state in SI units. Implemented by both the analytic
/// [`Sgp4`] and the numerical [`NumericalPropagator`], so callers can hold a
/// `Box<dyn Propagator>` and treat TLE-driven and force-model-driven orbits uniformly.
pub trait Propagator {
    /// The inertial (TEME/ECI) state at `t_seconds` past epoch, in metres and m/s.
    fn state_at(&self, t_seconds: f64) -> Result<StateVector, PropagatorError>;
    /// A short, stable name of the dynamical model, for provenance and reporting.
    fn model_name(&self) -> &'static str;
}

/// Which adaptive driver a [`NumericalPropagator`] integrates the force model with.
#[derive(Clone, Copy, Debug, Default, PartialEq, Eq)]
pub enum Integrator {
    /// RK4 with step-doubling error control ([`propagate`]). The default.
    #[default]
    StepDoubling,
    /// The Dormand–Prince RK5(4) embedded pair ([`propagate_dopri`]) — same result, fewer
    /// function evaluations per step.
    DormandPrince,
    /// Hairer's DOP853 8(5,3) pair ([`propagate_dop853`]) with automatic initial step: the
    /// highest-order option, cheapest at tight tolerances. A run that cannot meet the tolerance
    /// returns a NaN state (fail closed) rather than a short-of-epoch one.
    Dop853,
}

/// A first-class numerical propagator: the [`ForceModel`] integrated from an initial inertial
/// state `(r0, v0)` (SI units) to a [`Tolerance`] by the chosen [`Integrator`]. It implements
/// [`Propagator`] so the numerical force-model orbit is a peer of the analytic [`Sgp4`] behind
/// one interface — the wiring the milestone calls for.
#[derive(Clone, Debug)]
pub struct NumericalPropagator {
    /// Initial position at epoch (m, TEME/ECI).
    pub r0: Vec3,
    /// Initial velocity at epoch (m/s, TEME/ECI).
    pub v0: Vec3,
    /// The force model to integrate.
    pub model: ForceModel,
    /// Integration tolerance / step bounds.
    pub tol: Tolerance,
    /// Which adaptive driver to use.
    pub integrator: Integrator,
}

impl NumericalPropagator {
    /// A two-body propagator from `(r0, v0)` (m, m/s) with the default tolerance and the
    /// step-doubling driver. Add perturbations with [`with_model`](Self::with_model).
    pub fn two_body(r0: Vec3, v0: Vec3) -> Self {
        Self {
            r0,
            v0,
            model: ForceModel::two_body(),
            tol: Tolerance::default(),
            integrator: Integrator::default(),
        }
    }

    /// Replace the force model (e.g. with [`ForceModel::with_zonals_j2_j6`] or a drag/SRP build).
    pub fn with_model(mut self, model: ForceModel) -> Self {
        self.model = model;
        self
    }

    /// Set the integration tolerance and step bounds.
    pub fn with_tolerance(mut self, tol: Tolerance) -> Self {
        self.tol = tol;
        self
    }

    /// Choose the adaptive driver.
    pub fn with_integrator(mut self, integrator: Integrator) -> Self {
        self.integrator = integrator;
        self
    }
}

impl Propagator for NumericalPropagator {
    fn state_at(&self, t_seconds: f64) -> Result<StateVector, PropagatorError> {
        let (r, v) = match self.integrator {
            Integrator::StepDoubling => {
                propagate(self.r0, self.v0, t_seconds, &self.model, &self.tol)
            }
            Integrator::DormandPrince => {
                propagate_dopri(self.r0, self.v0, t_seconds, &self.model, &self.tol)
            }
            Integrator::Dop853 => {
                propagate_dop853(self.r0, self.v0, t_seconds, &self.model, &self.tol)
            }
        };
        Ok(StateVector { r, v })
    }

    fn model_name(&self) -> &'static str {
        "numerical-cowell"
    }
}

impl Propagator for Sgp4 {
    fn state_at(&self, t_seconds: f64) -> Result<StateVector, PropagatorError> {
        // SGP4 takes minutes past epoch and returns TEME km / km·s⁻¹; convert to SI.
        let (r_km, v_km) = self
            .propagate(t_seconds / 60.0)
            .map_err(PropagatorError::Sgp4)?;
        Ok(StateVector {
            r: [r_km[0] * 1000.0, r_km[1] * 1000.0, r_km[2] * 1000.0],
            v: [v_km[0] * 1000.0, v_km[1] * 1000.0, v_km[2] * 1000.0],
        })
    }

    fn model_name(&self) -> &'static str {
        "sgp4"
    }
}

/// Right ascension of the ascending node `Ω` (rad) of the osculating orbit for state
/// `(r, v)`: the in-plane angle of the node vector `n = ẑ × (r × v)`.
pub fn raan_rad(r: Vec3, v: Vec3) -> f64 {
    let h = cross(r, v);
    // n = ẑ × h = (−h_y, h_x, 0).
    let n = [-h[1], h[0], 0.0];
    n[1].atan2(n[0])
}

/// Two-body specific orbital energy `ε = v²/2 − μ/|r|` (J/kg). Conserved exactly under pure
/// two-body gravity (the integrator's drift check). Under a perturbing potential (J2 or the
/// zonal field) the *total* energy `ε − R(r)` including the disturbing potential
/// [`crate::forces::zonal_potential`] is the conserved quantity, not this bare two-body `ε`.
pub fn specific_energy(r: Vec3, v: Vec3) -> f64 {
    0.5 * dot(v, v) - MU_EARTH / norm(r)
}

/// Trace the orbit at a fixed RK4 step `h` (s) for `t_end` s, returning `(t, Ω(t))` samples.
/// A fixed step (rather than the adaptive driver, which only returns the final state) gives a
/// uniform time series for fitting the secular nodal rate. Small `h` keeps the truncation
/// error far below the secular signal being measured.
pub fn nodal_history(
    r0: Vec3,
    v0: Vec3,
    t_end: f64,
    h: f64,
    model: &ForceModel,
) -> Vec<(f64, f64)> {
    let f = model.rhs();
    let mut y = vec![r0[0], r0[1], r0[2], v0[0], v0[1], v0[2]];
    let mut t = 0.0;
    let mut out = vec![(0.0, raan_rad(r0, v0))];
    // Fixed step `h`: bound the loop by the exact step count (integer counter);
    // the `t >= t_end - 1e-9` break preserves the original stop condition.
    let n_steps = (((t_end - 1e-9) / h).ceil().max(0.0) as usize).saturating_add(2);
    for _ in 0..n_steps {
        if t >= t_end - 1e-9 {
            break;
        }
        y = rk4_step(&f, t, &y, h);
        t += h;
        out.push((t, raan_rad([y[0], y[1], y[2]], [y[3], y[4], y[5]])));
    }
    out
}

/// Least-squares slope of an unwrapped angle time series `(t, θ)` (rad/s) — the secular rate
/// with the periodic (short-period) oscillation averaged out. The angle is unwrapped to
/// remove ±2π jumps before fitting.
pub fn secular_slope(samples: &[(f64, f64)]) -> f64 {
    // Unwrap.
    let mut theta = Vec::with_capacity(samples.len());
    let mut prev = samples[0].1;
    let mut offset = 0.0;
    for &(_, th) in samples {
        let mut d = th - prev;
        // Normalize the step into (−π, π]. Integer-counted by |d|/2π; the break
        // preserves the exact subtraction sequence of the original wrap loops.
        let wraps = (d.abs() / std::f64::consts::TAU).ceil() as usize + 1;
        for _ in 0..wraps {
            if d <= std::f64::consts::PI {
                break;
            }
            d -= std::f64::consts::TAU;
        }
        for _ in 0..wraps {
            if d >= -std::f64::consts::PI {
                break;
            }
            d += std::f64::consts::TAU;
        }
        offset += d;
        theta.push(samples[0].1 + offset);
        prev = th;
    }
    // Ordinary least-squares slope.
    let n = samples.len() as f64;
    let mean_t = samples.iter().map(|&(t, _)| t).sum::<f64>() / n;
    let mean_y = theta.iter().sum::<f64>() / n;
    let mut num = 0.0;
    let mut den = 0.0;
    for (i, &(t, _)) in samples.iter().enumerate() {
        num += (t - mean_t) * (theta[i] - mean_y);
        den += (t - mean_t) * (t - mean_t);
    }
    num / den
}

/// Non-convergence of [`solve_kepler_checked`]: the residual still exceeded the tolerance
/// after the iteration budget was spent.
#[derive(Clone, Copy, Debug, PartialEq)]
pub struct KeplerNonConvergence {
    /// `|E − e·sin E − M|` at the last iterate.
    pub residual: f64,
    /// Iterations spent.
    pub iters: usize,
}

/// Solve Kepler's equation `M = E − e·sin E` for the eccentric anomaly `E` (rad) by
/// Newton–Raphson from the `E₀ = M` start, **returning `Err` rather than a wrong answer**
/// when it does not converge within `max_iter`. The bare `E₀ = M` start is deliberately
/// simple so the guard is meaningful: a near-perigee high-eccentricity case (`e = 0.999`)
/// where `f'(E) = 1 − e·cos E` collapses toward zero overshoots and fails to converge in a
/// bounded budget — exactly the case a silent fixed-iteration solver would return garbage
/// for. (This routine's job is the convergence *guard*.) This is a **legacy** solver kept numerically unchanged because
/// committed outputs depend on it; the robust solver, valid for all `0 ≤ e < 1`, is
/// [`solve_kepler_robust`] (Markley 1995 starter, [`crate::kepler`]).
pub fn solve_kepler_checked(
    mean_anomaly: f64,
    e: f64,
    max_iter: usize,
) -> Result<f64, KeplerNonConvergence> {
    const TOL: f64 = 1e-12;
    if e == 0.0 {
        return Ok(mean_anomaly);
    }
    let mut ea = mean_anomaly;
    for _ in 0..max_iter {
        let residual = ea - e * ea.sin() - mean_anomaly;
        if residual.abs() < TOL {
            return Ok(ea);
        }
        let deriv = 1.0 - e * ea.cos();
        ea -= residual / deriv;
    }
    let final_residual = (ea - e * ea.sin() - mean_anomaly).abs();
    if final_residual < TOL {
        Ok(ea)
    } else {
        Err(KeplerNonConvergence {
            residual: final_residual,
            iters: max_iter,
        })
    }
}

/// Solve Kepler's equation `M = E − e·sin E` for `E` (rad) with the shared robust solver
/// ([`crate::kepler::solve_kepler_markley`]: Markley's 1995 cubic starter and fifth-order
/// correction, then Newton polishing to a few ulps), valid for every finite `M` and `0 ≤ e < 1`,
/// including the near-perigee `e = 0.999` case where [`solve_kepler_checked`] reports
/// non-convergence. Returns `Err` on invalid input (`e ∉ [0, 1)`, non-finite values; reported
/// with `iters = 0` and an infinite residual) or non-convergence.
pub fn solve_kepler_robust(mean_anomaly: f64, e: f64) -> Result<f64, KeplerNonConvergence> {
    match crate::kepler::solve_kepler_markley(mean_anomaly, e) {
        Ok(sol) => Ok(sol.ecc_anomaly),
        Err(crate::kepler::KeplerError::InvalidInput) => Err(KeplerNonConvergence {
            residual: f64::INFINITY,
            iters: 0,
        }),
        Err(crate::kepler::KeplerError::NonConvergence { residual, iters }) => {
            Err(KeplerNonConvergence { residual, iters })
        }
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::forces::j2_secular_rates;
    use crate::maneuver::kepler_universal;

    /// A representative LEO circular-ish state at a = 7000 km, i = 45°.
    fn leo_state() -> (Vec3, Vec3) {
        let a = 7.0e6;
        let v = (MU_EARTH / a).sqrt(); // circular speed
        let inc = 45.0_f64.to_radians();
        // r along +x; v in the orbit plane inclined 45° about x.
        let r0 = [a, 0.0, 0.0];
        let v0 = [0.0, v * inc.cos(), v * inc.sin()];
        (r0, v0)
    }

    #[test]
    fn two_body_propagation_matches_the_exact_kepler_solution_over_24h() {
        // The unperturbed numerical orbit must land on the exact universal-variable Kepler
        // solution — for two-body that closed form IS the truth, a tighter gate than a
        // numerical reference.
        let (r0, v0) = leo_state();
        let day = 86_400.0;
        let tol = Tolerance {
            rtol: 1e-12,
            atol: 1e-9,
            ..Tolerance::default()
        };
        let (r_num, _v_num) = propagate(r0, v0, day, &ForceModel::two_body(), &tol);
        let (r_exact, _v_exact) = kepler_universal(r0, v0, day, MU_EARTH);
        let err = norm([
            r_num[0] - r_exact[0],
            r_num[1] - r_exact[1],
            r_num[2] - r_exact[2],
        ]);
        assert!(err < 10.0, "24h two-body residual {err} m vs exact Kepler");
        // In fact it is far below the 10 m the milestone asks for.
        assert!(err < 1.0, "should be sub-metre: {err} m");
    }

    #[test]
    fn dopri_propagation_matches_exact_kepler_and_agrees_with_the_rk4_path() {
        // The Dormand–Prince RK5(4) propagator must clear the same analytic-truth gate as the
        // step-doubling one: sub-metre against the exact universal-variable Kepler solution over a
        // 24 h LEO orbit. And the two adaptive drivers must agree with each other to well within
        // tolerance (same force model, same physics — only the error-control scheme differs).
        let (r0, v0) = leo_state();
        let day = 86_400.0;
        let tol = Tolerance {
            rtol: 1e-12,
            atol: 1e-9,
            ..Tolerance::default()
        };
        let (r_dp, _) = propagate_dopri(r0, v0, day, &ForceModel::two_body(), &tol);
        let (r_exact, _) = kepler_universal(r0, v0, day, MU_EARTH);
        let err = norm([
            r_dp[0] - r_exact[0],
            r_dp[1] - r_exact[1],
            r_dp[2] - r_exact[2],
        ]);
        assert!(
            err < 1.0,
            "DP5(4) 24h two-body residual {err} m vs exact Kepler"
        );

        // The two drivers agree on a perturbed (J2..J6) orbit, where there is no closed form.
        let (r_rk4, _) = propagate(r0, v0, day, &ForceModel::with_zonals_j2_j6(), &tol);
        let (r_dp2, _) = propagate_dopri(r0, v0, day, &ForceModel::with_zonals_j2_j6(), &tol);
        let agree = norm([
            r_rk4[0] - r_dp2[0],
            r_rk4[1] - r_dp2[1],
            r_rk4[2] - r_dp2[2],
        ]);
        assert!(
            agree < 1.0,
            "step-doubling and DP5(4) must agree on the J2..J6 orbit: {agree} m"
        );
    }

    #[test]
    fn two_body_conserves_energy_and_angular_momentum() {
        let (r0, v0) = leo_state();
        let day = 86_400.0;
        let tol = Tolerance {
            rtol: 1e-12,
            atol: 1e-9,
            ..Tolerance::default()
        };
        let e0 = specific_energy(r0, v0);
        let h0 = norm(cross(r0, v0));
        let (r1, v1) = propagate(r0, v0, day, &ForceModel::two_body(), &tol);
        let e1 = specific_energy(r1, v1);
        let h1 = norm(cross(r1, v1));
        assert!(
            (e1 - e0).abs() / e0.abs() < 1e-9,
            "energy drift {}",
            e1 - e0
        );
        assert!(
            (h1 - h0).abs() / h0 < 1e-9,
            "ang-momentum drift {}",
            h1 - h0
        );
    }

    #[test]
    fn j2_nodal_regression_reproduces_the_secular_formula() {
        // Propagate a J2-perturbed ISS-like orbit for a day and fit the secular RAAN rate;
        // it must agree with the closed-form first-order j2_secular_rates. The agreement is
        // to first-order theory (the residual is the O(J2²) higher-order secular term, ~0.1%),
        // not to machine precision — so this is a physics check, validated within 2%.
        let a = 6.778e6; // ~400 km altitude
        let inc = 51.6_f64.to_radians();
        let v = (MU_EARTH / a).sqrt();
        let r0 = [a, 0.0, 0.0];
        let v0 = [0.0, v * inc.cos(), v * inc.sin()];

        let day = 86_400.0;
        let hist = nodal_history(r0, v0, day, 10.0, &ForceModel::with_j2());
        let rate_num = secular_slope(&hist);
        let rate_formula = j2_secular_rates(a, 0.0, inc).raan;

        // Both are the westward nodal regression (negative for a prograde orbit).
        assert!(rate_num < 0.0 && rate_formula < 0.0);
        let rel = (rate_num - rate_formula).abs() / rate_formula.abs();
        assert!(
            rel < 0.02,
            "numerical Ω̇ {rate_num} vs formula {rate_formula} (rel {rel})"
        );
        // Sanity: the day's nodal drift is the textbook ~ −5°/day for the ISS.
        let deg_per_day = rate_formula.to_degrees() * day;
        assert!((deg_per_day + 5.0).abs() < 0.6, "Ω̇ {deg_per_day} °/day");
    }

    #[test]
    fn solve_kepler_converges_on_a_well_conditioned_case() {
        // Moderate eccentricity converges and satisfies the equation.
        let m = 1.0;
        let e = 0.3;
        let ea = solve_kepler_checked(m, e, 30).expect("should converge");
        assert!((ea - e * ea.sin() - m).abs() < 1e-12);
        // Circular is exact in one shot.
        assert_eq!(solve_kepler_checked(0.7, 0.0, 30), Ok(0.7));
    }

    #[test]
    fn solve_kepler_returns_err_on_nonconvergence_at_high_eccentricity() {
        // At e = 0.999 the Newton step from the bare E₀ = M start overshoots wildly for M
        // near perigee; M = 0.3 rad diverges and does not converge within 30 iterations, so
        // the solver returns Err rather than a silently wrong eccentric anomaly. (Most other
        // M values do converge — see the well-conditioned test — so this is a real guard, not
        // a broken solver.)
        let result = solve_kepler_checked(0.3, 0.999, 30);
        assert!(
            result.is_err(),
            "expected non-convergence Err, got {result:?}"
        );
        if let Err(nc) = result {
            assert_eq!(nc.iters, 30);
            assert!(nc.residual > 1e-12);
        }
    }

    #[test]
    fn third_body_rhs_samples_the_ephemeris_at_the_advanced_epoch() {
        // The headline of this wave: the third body is wired into the *time-varying* RHS, with
        // the perturber position read at epoch_jd_tt + t/86400. Prove the wiring exactly (to
        // machine precision), not with a tolerance band: the Sun term added by accel_at must be
        // the third-body acceleration evaluated at the ephemeris position for that instant.
        use crate::timescales::JD_J2000;
        let epoch = JD_J2000; // 2000-01-01 12:00 TT → tjc = 0 at t = 0.
        let model = ForceModel::two_body().third_body(true, false, epoch);
        let r = [7.0e6, 1.0e6, -2.0e6];
        let central = model.accel(r);

        // At t = 0 the Sun is sampled at tjc(epoch). Compare against central + the hand-composed
        // third-body term by *bit-identical* equality (accel_at adds the very same vector), which
        // dodges the catastrophic cancellation of subtracting the ~8 m/s² central term.
        let a0 = model.accel_at(0.0, r);
        let sun0 = sun_position(julian_centuries_tt(epoch));
        let expect0 = third_body_accel(r, sun0, MU_SUN);
        for k in 0..3 {
            assert_eq!(
                a0[k],
                central[k] + expect0[k],
                "t=0 Sun term mismatch axis {k}"
            );
        }

        // At t = one day the Sun is sampled exactly one day later (the 86400 s ↔ 1 day, and the
        // 1 day ↔ 1/36525 century, conversions the wiring depends on).
        let a1 = model.accel_at(SECONDS_PER_DAY, r);
        let sun1 = sun_position(julian_centuries_tt(epoch + 1.0));
        let expect1 = third_body_accel(r, sun1, MU_SUN);
        for k in 0..3 {
            assert_eq!(
                a1[k],
                central[k] + expect1[k],
                "t=1day Sun term mismatch axis {k}"
            );
        }
        // And the perturber genuinely moved between the two samples (~1°/day of solar motion),
        // so the RHS is not silently frozen at the start.
        let moved = norm([sun1[0] - sun0[0], sun1[1] - sun0[1], sun1[2] - sun0[2]]);
        assert!(
            moved > 1e9,
            "Sun should advance ~2.6e9 m in a day, moved {moved} m"
        );

        // With no third body enabled, accel_at is time-independent and equals accel — the
        // existing two-body/J2/zonal goldens are untouched.
        let plain = ForceModel::with_j2();
        for &t in &[0.0, 1234.0, SECONDS_PER_DAY] {
            assert_eq!(plain.accel_at(t, r), plain.accel(r));
        }
    }

    #[test]
    fn third_body_perturbs_a_leo_orbit_at_the_textbook_magnitudes() {
        // Two robust, hand-derivable signatures. (1) The *instantaneous* third-body tidal
        // acceleration at LEO sits at the textbook magnitudes — Sun ~5e-7 m/s², Moon ~1.1e-6
        // m/s² (the Moon's geocentric tidal pull is ~2× the Sun's). These follow directly from
        // a_tidal ≈ 2·GM·R_orbit/d³ and need no integration, so they cannot be confounded by the
        // finite-arc geometry. (2) Over a day each body moves the orbit measurably off the
        // two-body path but stays a small, bounded perturbation. NOTE: the day-long *displacement*
        // ordering is NOT simply the accel ratio (the Moon's tidal axis rotates ~13×/day faster,
        // changing the forcing direction), so only the instantaneous accel ordering is asserted.
        use crate::timescales::JD_J2000;
        let (r0, v0) = leo_state();
        let day = 86_400.0;
        let epoch = JD_J2000;
        let tol = Tolerance {
            rtol: 1e-12,
            atol: 1e-9,
            ..Tolerance::default()
        };

        // (1) Instantaneous tidal magnitudes = accel_at minus the central gravity.
        let central = ForceModel::two_body().accel(r0);
        let tidal = |m: ForceModel| {
            let a = m.accel_at(0.0, r0);
            norm([a[0] - central[0], a[1] - central[1], a[2] - central[2]])
        };
        let a_sun = tidal(ForceModel::two_body().third_body(true, false, epoch));
        let a_moon = tidal(ForceModel::two_body().third_body(false, true, epoch));
        assert!(
            (2.0e-7..=8.0e-7).contains(&a_sun),
            "Sun tidal accel {a_sun} m/s² outside ~5e-7 band"
        );
        assert!(
            (5.0e-7..=2.0e-6).contains(&a_moon),
            "Moon tidal accel {a_moon} m/s² outside ~1.1e-6 band"
        );
        assert!(
            a_moon > a_sun,
            "Moon tidal accel ({a_moon}) must exceed the Sun's ({a_sun})"
        );

        // (2) Each body perturbs the day-long trajectory, bounded.
        let (r_tb, _) = propagate(r0, v0, day, &ForceModel::two_body(), &tol);
        let sep = |m: &ForceModel| {
            let (r, _) = propagate(r0, v0, day, m, &tol);
            norm([r[0] - r_tb[0], r[1] - r_tb[1], r[2] - r_tb[2]])
        };
        for (name, m) in [
            ("Sun", ForceModel::two_body().third_body(true, false, epoch)),
            (
                "Moon",
                ForceModel::two_body().third_body(false, true, epoch),
            ),
        ] {
            let s = sep(&m);
            assert!(
                s > 1e-3,
                "{name} third body must perturb the orbit, sep {s} m"
            );
            assert!(
                s < 1e5,
                "{name} third body must stay a small perturbation, sep {s} m"
            );
        }
    }

    #[test]
    fn third_body_propagation_depends_on_the_epoch() {
        // Epoch-driven means the same initial state + arc gives a different trajectory at a
        // different epoch. Choosing epochs a quarter-year apart rotates the Sun (and its tidal
        // axis) by ~90° relative to the inertial orbit — a full-order change in the tidal field
        // (unlike a half-year flip, which leaves the leading tidal tensor nearly invariant). So
        // the two final states must differ, while each stays a bounded small perturbation.
        use crate::timescales::JD_J2000;
        let (r0, v0) = leo_state();
        let arc = 2.0 * 86_400.0;
        let tol = Tolerance {
            rtol: 1e-12,
            atol: 1e-9,
            ..Tolerance::default()
        };
        let prop = |epoch: f64| {
            propagate(
                r0,
                v0,
                arc,
                &ForceModel::two_body().third_body(true, false, epoch),
                &tol,
            )
            .0
        };
        let r_jan = prop(JD_J2000); // Sun near ecliptic longitude ~280°.
        let r_apr = prop(JD_J2000 + 91.31); // ~90° of solar motion later.
        let diff = norm([
            r_jan[0] - r_apr[0],
            r_jan[1] - r_apr[1],
            r_jan[2] - r_apr[2],
        ]);
        assert!(
            diff > 1e-3,
            "epoch must change the trajectory, diff {diff} m"
        );
        assert!(diff < 1e5, "epoch effect must stay bounded, diff {diff} m");
    }

    #[test]
    fn srp_perturbs_a_leo_orbit_and_scales_linearly_with_area_to_mass() {
        // SRP rides the same epoch-driven RHS as the third body. Two hand-derivable signatures:
        // (1) over a day it nudges a LEO orbit off the no-SRP path by a small, bounded amount;
        // (2) the cannonball SRP acceleration is exactly linear in A/m and the cylindrical-shadow
        // factor is position-only (identical across A/m to ~ms timing), so to first order the
        // day-long displacement scales ~linearly — doubling A/m ~doubles the separation.
        use crate::timescales::JD_J2000;
        let (r0, v0) = leo_state();
        let day = 86_400.0;
        let epoch = JD_J2000;
        let tol = Tolerance {
            rtol: 1e-12,
            atol: 1e-9,
            ..Tolerance::default()
        };
        // Baseline = full gravity + Sun/Moon third body, *no* SRP.
        let base = ForceModel::with_zonals_j2_j6().third_body(true, true, epoch);
        let (r_base, _) = propagate(r0, v0, day, &base, &tol);
        let sep = |aom: f64| {
            let (r, _) = propagate(r0, v0, day, &base.clone().solar_radiation(1.5, aom), &tol);
            norm([r[0] - r_base[0], r[1] - r_base[1], r[2] - r_base[2]])
        };
        let s1 = sep(0.02);
        let s2 = sep(0.04);
        assert!(s1 > 1e-3, "SRP must perturb the orbit, sep {s1} m");
        assert!(s1 < 1e4, "SRP must stay a small perturbation, sep {s1} m");
        let ratio = s2 / s1;
        assert!(
            (1.8..=2.2).contains(&ratio),
            "SRP displacement should scale ~linearly with A/m, ratio {ratio}"
        );
    }

    #[test]
    fn nrlmsise00_drag_tier_is_opt_in_and_decays_the_orbit() {
        // The default tier is the exponential model; selecting NRLMSISE-00 changes the drag
        // (and only when drag is on), still dissipates, and solar activity speeds the decay.
        assert_eq!(
            ForceModel::default().drag_density,
            DensityModel::Exponential
        );
        let alt = 400e3;
        let r0 = [crate::forces::RE_EARTH + alt, 0.0, 0.0];
        let vc = (MU_EARTH / (crate::forces::RE_EARTH + alt)).sqrt();
        let inc = 51.6_f64.to_radians();
        let v0 = [0.0, vc * inc.cos(), vc * inc.sin()];
        let epoch = 2_452_081.5; // 2001-06-21 00:00 TT
        let tol = Tolerance {
            rtol: 1e-12,
            atol: 1e-9,
            ..Tolerance::default()
        };
        let base = ForceModel::two_body().third_body(false, false, epoch);
        let msis = |f: f64, ap: f64| {
            base.clone()
                .drag(0.02)
                .drag_density(DensityModel::Nrlmsise00 {
                    f107a: f,
                    f107: f,
                    ap,
                })
        };
        // Without drag the tier is inert.
        let no_drag = base.clone().drag_density(DensityModel::Nrlmsise00 {
            f107a: 150.0,
            f107: 150.0,
            ap: 15.0,
        });
        let span = 6.0 * 3600.0;
        let (rb, vb) = propagate(r0, v0, span, &base, &tol);
        let (rn, vn) = propagate(r0, v0, span, &no_drag, &tol);
        assert_eq!((rb, vb), (rn, vn));
        let e0 = specific_energy(r0, v0);
        let (r_exp, v_exp) = propagate(r0, v0, span, &base.clone().drag(0.02), &tol);
        let (r_lo, v_lo) = propagate(r0, v0, span, &msis(70.0, 4.0), &tol);
        let (r_hi, v_hi) = propagate(r0, v0, span, &msis(230.0, 80.0), &tol);
        let (e_exp, e_lo, e_hi) = (
            specific_energy(r_exp, v_exp),
            specific_energy(r_lo, v_lo),
            specific_energy(r_hi, v_hi),
        );
        assert!(e_lo < e0 && e_hi < e_lo, "{e0} {e_lo} {e_hi}");
        assert_ne!(e_exp, e_lo);
    }

    #[test]
    fn drag_dissipates_energy_and_decays_the_orbit_monotonically() {
        // Drag is the one dissipative term: unlike the energy-conserving vacuum/zonal/third-body
        // models, a drag-perturbed orbit must LOSE specific energy and semi-major axis over time
        // (the orbit sinks). Use a 300 km orbit (denser atmosphere → measurable decay in a day).
        let alt = 300e3;
        let r0 = [crate::forces::RE_EARTH + alt, 0.0, 0.0];
        let vc = (MU_EARTH / (crate::forces::RE_EARTH + alt)).sqrt();
        let inc = 45.0_f64.to_radians();
        let v0 = [0.0, vc * inc.cos(), vc * inc.sin()];
        let day = 86_400.0;
        let tol = Tolerance {
            rtol: 1e-12,
            atol: 1e-9,
            ..Tolerance::default()
        };
        let drag_model = ForceModel::two_body().drag(0.02);
        let e0 = specific_energy(r0, v0);

        // The vacuum baseline conserves energy to ~1e-9; drag must strictly lower it.
        let (r_vac, v_vac) = propagate(r0, v0, day, &ForceModel::two_body(), &tol);
        assert!(
            (specific_energy(r_vac, v_vac) - e0).abs() / e0.abs() < 1e-9,
            "vacuum orbit must conserve energy"
        );

        // Secular decay: the two-body energy at successive day-fractions strictly decreases (each
        // sample spans several orbits, so the secular trend dominates the per-orbit ripple).
        let mut prev = e0;
        let mut e_day = e0;
        for k in 1..=4 {
            let (r, v) = propagate(r0, v0, day * f64::from(k) / 4.0, &drag_model, &tol);
            e_day = specific_energy(r, v);
            assert!(
                e_day < prev,
                "drag energy must decay monotonically: step {k} e {e_day} not < prev {prev}"
            );
            prev = e_day;
        }
        // Semi-major axis a = −μ/(2ε) shrank (ε more negative ⇒ smaller a ⇒ the orbit decayed).
        let a0 = -MU_EARTH / (2.0 * e0);
        let a_day = -MU_EARTH / (2.0 * e_day);
        assert!(
            a_day < a0,
            "drag must shrink the semi-major axis: a_day {a_day} not < a0 {a0}"
        );
        // And the decay is a real, bounded amount over the day (not numerical noise, not a crash).
        let drop = a0 - a_day;
        assert!(
            (1.0..=1e5).contains(&drop),
            "a-decay {drop} m/day outside the physical band for 300 km, C_D·A/m = 0.02"
        );
    }

    #[test]
    fn relativity_perturbs_the_orbit_without_dissipating_it() {
        // The Schwarzschild correction is conservative — it precesses the perigee but, unlike
        // drag, must NOT secularly decay the orbit. Two contrasting signatures over a day:
        // (1) it nudges the trajectory off the two-body path by a small bounded amount, yet
        // (2) it leaves the semi-major axis essentially unchanged (no energy sink) — the
        // opposite of `drag_dissipates_energy_and_decays_the_orbit_monotonically` above.
        let (r0, v0) = leo_state();
        let day = 86_400.0;
        let tol = Tolerance {
            rtol: 1e-12,
            atol: 1e-9,
            ..Tolerance::default()
        };
        let base = ForceModel::two_body();
        let (r_base, _) = propagate(r0, v0, day, &base, &tol);
        let (r_gr, v_gr) = propagate(r0, v0, day, &base.relativity(), &tol);
        let sep = norm([
            r_gr[0] - r_base[0],
            r_gr[1] - r_base[1],
            r_gr[2] - r_base[2],
        ]);
        assert!(sep > 1e-4, "relativity must perturb the orbit, sep {sep} m");
        assert!(
            sep < 1e5,
            "relativity must stay a tiny perturbation, sep {sep} m"
        );

        // Non-dissipative: a = −μ/(2ε) holds to well under a metre/day, whereas drag sinks it
        // by ≥1 m/day. This is the structural difference between a conservative and a
        // dissipative perturbation.
        let a0 = -MU_EARTH / (2.0 * specific_energy(r0, v0));
        let a_gr = -MU_EARTH / (2.0 * specific_energy(r_gr, v_gr));
        assert!(
            (a_gr - a0).abs() < 10.0,
            "relativity must not decay the semi-major axis: Δa {} m",
            a_gr - a0
        );
    }

    #[test]
    fn zonal_j2_j6_orbit_conserves_energy_and_perturbs_the_j2_orbit() {
        // The full J2..J6 zonal field is conservative and time-independent, so the TOTAL
        // energy — kinetic plus the central and zonal potential, v²/2 − μ/r − R(r) — is
        // conserved over a day (the bare two-body ε = v²/2 − μ/r is NOT, since the
        // perturbation does work on it). And the J3..J6 terms must actually move the
        // trajectory away from the J2-only orbit (regression against a silently-J2-only force
        // model) while staying a small correction (not a blow-up).
        use crate::forces::zonal_potential;
        let total =
            |r: Vec3, v: Vec3| specific_energy(r, v) - zonal_potential(r, &EARTH_ZONALS_J2_J6);
        let (r0, v0) = leo_state();
        let day = 86_400.0;
        let tol = Tolerance {
            rtol: 1e-12,
            atol: 1e-9,
            ..Tolerance::default()
        };
        let e0 = total(r0, v0);
        let (r_day, v_day) = propagate(r0, v0, day, &ForceModel::with_zonals_j2_j6(), &tol);
        let e1 = total(r_day, v_day);
        assert!(
            (e1 - e0).abs() / e0.abs() < 1e-8,
            "zonal field is conservative; total-energy drift {}",
            e1 - e0
        );

        // Over one orbital period the J2..J6 orbit must differ from the J2-only orbit.
        let period = 5400.0;
        let (r_zon, _) = propagate(r0, v0, period, &ForceModel::with_zonals_j2_j6(), &tol);
        let (r_j2, _) = propagate(r0, v0, period, &ForceModel::with_j2(), &tol);
        let sep = norm([r_zon[0] - r_j2[0], r_zon[1] - r_j2[1], r_zon[2] - r_j2[2]]);
        assert!(
            sep > 1e-3,
            "J3..J6 must perturb the orbit, separation {sep} m"
        );
        assert!(
            sep < 5.0e4,
            "J3..J6 must stay a small correction, separation {sep} m"
        );
    }

    #[test]
    fn lense_thirring_flag_perturbs_the_trajectory_minutely() {
        // Wiring check: enabling the frame-dragging flag must change the propagated state by a
        // tiny, bounded amount (it is ~100× below Schwarzschild, itself ~1e-9 of two-body), and
        // must not blow up or dissipate the orbit.
        let (r0, v0) = leo_state();
        let day = 86_400.0;
        let tol = Tolerance {
            rtol: 1e-12,
            atol: 1e-9,
            ..Tolerance::default()
        };
        let base = ForceModel::two_body();
        let (r_base, _) = propagate(r0, v0, day, &base, &tol);
        let (r_lt, _) = propagate(r0, v0, day, &base.lense_thirring(), &tol);
        let sep = norm([
            r_lt[0] - r_base[0],
            r_lt[1] - r_base[1],
            r_lt[2] - r_base[2],
        ]);
        assert!(sep > 0.0 && sep < 100.0, "LT day-long perturbation {sep} m");
    }

    // --- Propagator trait: the numerical propagator as a first-class peer of SGP4 ---

    /// A valid LEO two-line element set (ISS-like: i = 51.64°, e = 0.0007, ~15.5 rev/day)
    /// for exercising the SGP4 [`Propagator`] impl. The exact numbers need only be a
    /// self-consistent valid element set — the test compares the trait against the inherent
    /// method on the same object, not against an external reference.
    fn iss_like_tle() -> crate::tle::Tle {
        crate::tle::Tle {
            epoch_days_1950: 26000.0,
            bstar: 1.0e-4,
            ecco: 0.0007,
            argpo_rad: 1.0,
            inclo_rad: 51.64_f64.to_radians(),
            mo_rad: 2.0,
            no_kozai_rad_min: 15.50 * std::f64::consts::TAU / 1440.0,
            nodeo_rad: 0.5,
        }
    }

    #[test]
    fn numerical_propagator_trait_matches_exact_kepler() {
        // The NumericalPropagator, used through the Propagator trait, must clear the same
        // analytic-truth gate as the free function: sub-metre vs the exact Kepler solution.
        let (r0, v0) = leo_state();
        let day = 86_400.0;
        let prop = NumericalPropagator::two_body(r0, v0).with_tolerance(Tolerance {
            rtol: 1e-12,
            atol: 1e-9,
            ..Tolerance::default()
        });
        let s = prop
            .state_at(day)
            .expect("two-body propagation is infallible");
        let (r_exact, _) = kepler_universal(r0, v0, day, MU_EARTH);
        let err = norm([
            s.r[0] - r_exact[0],
            s.r[1] - r_exact[1],
            s.r[2] - r_exact[2],
        ]);
        assert!(err < 1.0, "trait two-body residual {err} m vs exact Kepler");
        assert_eq!(prop.model_name(), "numerical-cowell");
    }

    #[test]
    fn numerical_propagator_dormand_prince_selection_agrees() {
        // Selecting the Dormand–Prince driver through the trait must agree with step-doubling
        // (same physics, different error control) and still hit exact Kepler.
        let (r0, v0) = leo_state();
        let day = 86_400.0;
        let tol = Tolerance {
            rtol: 1e-12,
            atol: 1e-9,
            ..Tolerance::default()
        };
        let sd = NumericalPropagator::two_body(r0, v0)
            .with_tolerance(tol)
            .state_at(day)
            .unwrap();
        let dp = NumericalPropagator::two_body(r0, v0)
            .with_tolerance(tol)
            .with_integrator(Integrator::DormandPrince)
            .state_at(day)
            .unwrap();
        let sep = norm([sd.r[0] - dp.r[0], sd.r[1] - dp.r[1], sd.r[2] - dp.r[2]]);
        assert!(
            sep < 1.0,
            "the two adaptive drivers must agree, sep {sep} m"
        );
    }

    #[test]
    fn sgp4_propagator_trait_matches_inherent_method_in_si() {
        // The SGP4 Propagator impl must be exactly the inherent km/min method converted to
        // SI (m, m/s, seconds) — a unit-conversion identity, no tolerance.
        let sgp4 = iss_like_tle().to_sgp4(crate::sgp4::wgs72(), false);
        let t_s = 3600.0;
        let (r_km, v_km) = sgp4.propagate(t_s / 60.0).unwrap();
        let s = Propagator::state_at(&sgp4, t_s).unwrap();
        for k in 0..3 {
            assert_eq!(s.r[k], r_km[k] * 1000.0, "position component {k}");
            assert_eq!(s.v[k], v_km[k] * 1000.0, "velocity component {k}");
        }
        assert_eq!(sgp4.model_name(), "sgp4");
    }

    #[test]
    fn propagators_are_object_safe_and_polymorphic() {
        // The whole point of the trait: a heterogeneous set of propagators behind one
        // interface. Box<dyn Propagator> must compile and dispatch to both impls.
        let (r0, v0) = leo_state();
        let props: Vec<Box<dyn Propagator>> = vec![
            Box::new(NumericalPropagator::two_body(r0, v0)),
            Box::new(iss_like_tle().to_sgp4(crate::sgp4::wgs72(), false)),
        ];
        for p in &props {
            let s = p.state_at(600.0).expect("both propagate 10 min fine");
            assert!(s.r.iter().all(|x| x.is_finite()) && norm(s.r) > 6.0e6);
            assert!(!p.model_name().is_empty());
        }
    }

    #[test]
    fn non_finite_initial_state_returns_without_hanging() {
        // A NaN initial coordinate once made the adaptive step controller's error norm NaN, which
        // never satisfies the tolerance — an infinite hang. It must now return immediately.
        let nan = [f64::NAN, 0.0, 0.0];
        let v = [0.0, 7546.0, 0.0];
        let (r, _) = propagate(
            nan,
            v,
            100.0,
            &ForceModel::two_body(),
            &Tolerance::default(),
        );
        assert!(r[0].is_nan(), "NaN in → NaN out, not a hang");
        // Through the trait, too.
        let s = NumericalPropagator::two_body(nan, v)
            .state_at(100.0)
            .unwrap();
        assert!(s.r[0].is_nan());
    }

    /// A provider that serves the analytic Sun and Moon until a cutoff TDB date, then nothing.
    #[derive(Debug)]
    struct CutoffProvider {
        until_jd_tdb: f64,
    }

    impl EphemerisProvider for CutoffProvider {
        fn relative_position(&self, target: &Body, _center: &Body, jd_tdb: f64) -> Option<Vec3> {
            if jd_tdb > self.until_jd_tdb {
                return None;
            }
            let tjc = julian_centuries_tt(jd_tdb);
            match target.name {
                "Sun" => Some(sun_position(tjc)),
                "Moon" => Some(moon_position(tjc)),
                _ => None,
            }
        }
    }

    #[test]
    fn with_ephemeris_refuses_a_provider_without_the_sun_or_moon_at_the_epoch() {
        let epoch = 2_460_000.5;
        let p = Arc::new(CutoffProvider {
            until_jd_tdb: epoch - 1.0,
        });
        let err = ForceModel::two_body()
            .third_body(true, true, epoch)
            .with_ephemeris(p)
            .unwrap_err();
        assert!(err.contains("Sun"), "{err}");
    }

    #[test]
    fn the_ephemeris_tier_falls_back_and_counts_when_the_provider_runs_out() {
        // Inside the provider's span the tier matches the analytic series it serves to rounding
        // of the TT→TDB shift; beyond it every evaluation falls back to the analytic series and is
        // counted, and clones share the count.
        let epoch = 2_460_000.5;
        let p = Arc::new(CutoffProvider {
            until_jd_tdb: epoch + 0.5,
        });
        let m = ForceModel::two_body()
            .third_body(true, true, epoch)
            .with_ephemeris(p)
            .expect("provider covers the epoch");
        let plain = ForceModel::two_body().third_body(true, true, epoch);
        let r = [7.0e6, 1.0e6, 2.0e6];
        let fallbacks = || m.ephemeris.as_ref().unwrap().fallbacks();
        let (a, b) = (m.accel_at(3_600.0, r), plain.accel_at(3_600.0, r));
        let d = norm([a[0] - b[0], a[1] - b[1], a[2] - b[2]]);
        assert!(d < 1e-12, "inside the span: {d}");
        assert_eq!(fallbacks(), 0);
        let clone = m.clone();
        let _ = clone.accel_at(86_400.0, r); // beyond the span: Sun and Moon both fall back
        assert_eq!(fallbacks(), 2, "the count is shared with the clone");
        assert_eq!(m.accel_at(86_400.0, r), plain.accel_at(86_400.0, r));
        assert_eq!(fallbacks(), 4);
    }

    #[test]
    fn the_srp_shadow_model_is_opt_in_and_scales_the_srp_term() {
        use crate::srp_shadow::ShadowModel;
        let epoch = 2_451_545.0;
        let base = ForceModel::two_body()
            .third_body(false, false, epoch)
            .solar_radiation(1.5, 0.02);
        assert_eq!(base.srp_shadow, ShadowModel::ConicalSphere);
        let sun = sun_position(julian_centuries_tt(epoch));
        // A point in full sun and one deep in the umbra: every model gives 1 and 0 there.
        let lit = [
            sun[0] * 7.0e6 / norm(sun),
            sun[1] * 7.0e6 / norm(sun),
            sun[2] * 7.0e6 / norm(sun),
        ];
        let dark = [-lit[0], -lit[1], -lit[2]];
        for m in [
            ShadowModel::OblateEarth,
            ShadowModel::OblateEarthLimbDarkened,
        ] {
            let opt = base.clone().srp_shadow(m);
            assert_eq!(opt.accel_at(0.0, lit), base.accel_at(0.0, lit));
            assert_eq!(opt.accel_at(0.0, dark), base.accel_at(0.0, dark));
        }
    }

    #[test]
    fn the_s1_air_tide_flag_adds_exactly_the_s1_acceleration() {
        // Opt-in and additive: off by default, and when on the force changes by exactly the S1
        // term at the advanced epoch.
        let epoch = 2_455_197.5;
        let base = ForceModel::with_j2().third_body(false, false, epoch);
        assert!(!base.air_tide_s1);
        let with = base.clone().air_tide_s1();
        let r = [7.0e6, 1.0e6, 2.0e6];
        let t = 3_600.0;
        let (a0, a1) = (base.accel_at(t, r), with.accel_at(t, r));
        let s1 = crate::tides::s1_air_tide_acceleration(r, epoch + t / SECONDS_PER_DAY);
        for i in 0..3 {
            assert_eq!(a1[i], a0[i] + s1[i]);
        }
        assert!(norm(s1) > 0.0);
    }

    #[test]
    fn propagator_error_displays_the_sgp4_code() {
        // The error type must surface the underlying SGP4 integer code through Display.
        let e = PropagatorError::Sgp4(6);
        assert!(
            format!("{e}").contains('6'),
            "Display should name the code: {e}"
        );
    }
    // ── opt-in tesseral geopotential (RM-09) ────────────────────────────────────────────────

    #[test]
    fn the_default_model_carries_no_geopotential() {
        // Additivity: every constructor leaves the opt-in field off, so the historical central
        // gravity path (and every golden built on it) is untouched.
        for m in [
            ForceModel::two_body(),
            ForceModel::with_j2(),
            ForceModel::with_zonals_j2_j6(),
            ForceModel::default().third_body(true, true, 2_451_545.0),
        ] {
            assert!(m.geopotential.is_none());
        }
    }

    #[test]
    fn a_zonal_geopotential_reproduces_the_zonal_path_in_every_frame_rotation() {
        // A field holding only C̄00 = 1 and the J2..J6 zonals is axially symmetric, so rotating
        // into the Earth-fixed frame about z and back must reproduce the independently coded
        // two-body + zonal_accel path, whatever the Earth rotation angle. This ties the rotation
        // plumbing to code that never touches it.
        let mut f = SphericalHarmonicField::zeros(MU_EARTH, crate::forces::RE_EARTH, 6);
        f.set(0, 0, 1.0, 0.0);
        for (i, &j) in EARTH_ZONALS_J2_J6.iter().enumerate() {
            let n = i + 2;
            f.set(n, 0, -j / ((2 * n + 1) as f64).sqrt(), 0.0);
        }
        let tess = ForceModel::two_body().with_geopotential(Geopotential::new(f));
        let zonal = ForceModel::with_zonals_j2_j6();
        let r = [6.9e6, 1.1e6, 1.4e6];
        for t in [0.0, 1234.5, 40_000.0] {
            let a = tess.accel_at(t, r);
            let b = zonal.accel_at(t, r);
            let d = norm([a[0] - b[0], a[1] - b[1], a[2] - b[2]]);
            assert!(d / norm(b) < 1e-12, "t={t}: rel {}", d / norm(b));
        }
    }

    #[test]
    fn the_cio_frame_matches_the_precise_od_geopotential_bit_for_bit() {
        // In the CIO frame with UT1 = TT the opt-in path evaluates exactly the rotation and field
        // the precise orbit-determination force model uses, so the two must agree to the bit.
        use crate::precise_od::{ForceModel as _, PreciseForceModel};
        let epoch = 2_459_580.5;
        let ours = ForceModel::two_body()
            .with_geopotential(Geopotential::egm2008(30).in_frame(EarthFixedFrame::Cio))
            .third_body(false, false, epoch);
        let theirs = PreciseForceModel::egm2008(30, epoch);
        let (r, v) = ([6.9e6, 1.1e6, 1.4e6], [-1.0e3, 7.0e3, 1.5e3]);
        for t in [0.0, 600.0, 7200.0] {
            assert_eq!(ours.accel_at(t, r), theirs.accel_rv(t, r, v), "t = {t}");
        }
    }

    #[test]
    fn the_two_field_evaluators_agree_on_the_opt_in_path() {
        // Holmes–Featherstone and the classic recursion evaluate the same field; away from the
        // poles at degree 70 they must agree to rounding through the rotation plumbing too.
        let classic = Geopotential::egm2008(70);
        let hf = Geopotential::egm2008(70).with_evaluator(FieldEvaluator::HolmesFeatherstone);
        let r = [6.9e6, 1.1e6, 1.4e6];
        for jd in [2_451_545.0, 2_460_311.25] {
            let (a, b) = (classic.acceleration(jd, r), hf.acceleration(jd, r));
            let d = norm([a[0] - b[0], a[1] - b[1], a[2] - b[2]]);
            assert!(d / norm(a) < 1e-13, "jd {jd}: rel {}", d / norm(a));
        }
        assert_eq!(Geopotential::egm2008(8).evaluator, FieldEvaluator::Classic);
    }

    #[test]
    fn the_tesseral_orbit_conserves_the_jacobi_integral() {
        // A gravity field rotating uniformly about z conserves the Jacobi integral
        // J = ½|v|² − U(r) − ω·(r × v)_z in the inertial frame. The Earth rotation angle advances
        // at the constant IAU 2000 rate, so a 6 h EGM2008 20×20 propagation must hold J to the
        // integrator tolerance; a sign or frame error in the rotation breaks it at once.
        let epoch = 2_451_545.0;
        let gp = Geopotential::egm2008(20);
        let field = gp.field.clone();
        let model = ForceModel::two_body()
            .with_geopotential(gp.clone())
            .third_body(false, false, epoch);
        let omega = std::f64::consts::TAU * 1.002_737_811_911_354_5 / SECONDS_PER_DAY;
        let jacobi = |t: f64, r: Vec3, v: Vec3| {
            let m = gp.inertial_to_earth_fixed(epoch + t / SECONDS_PER_DAY);
            let u = field.potential(mat_vec(&m, r));
            0.5 * dot(v, v) - u - omega * (r[0] * v[1] - r[1] * v[0])
        };
        let (r0, v0) = leo_state();
        let tol = Tolerance {
            rtol: 1e-12,
            atol: 1e-9,
            ..Tolerance::default()
        };
        let t_end = 6.0 * 3600.0;
        let (r1, v1) = propagate_dopri(r0, v0, t_end, &model, &tol);
        let (j0, j1) = (jacobi(0.0, r0, v0), jacobi(t_end, r1, v1));
        let rel = ((j1 - j0) / j0).abs();
        assert!(rel < 1e-9, "Jacobi drift {rel:e} (J0 = {j0}, J1 = {j1})");
        // And the tesseral field genuinely moved the orbit away from the J2..J6 zonal one.
        let (rz, _) = propagate_dopri(r0, v0, t_end, &ForceModel::with_zonals_j2_j6(), &tol);
        let sep = norm([r1[0] - rz[0], r1[1] - rz[1], r1[2] - rz[2]]);
        assert!(sep > 10.0, "tesseral vs zonal separation only {sep} m");
    }

    #[test]
    fn dop853_propagation_matches_exact_kepler_over_24h() {
        let (r0, v0) = leo_state();
        let day = 86_400.0;
        let tol = Tolerance {
            rtol: 1e-12,
            atol: 1e-9,
            ..Tolerance::default()
        };
        let (r_num, v_num) = propagate_dop853(r0, v0, day, &ForceModel::two_body(), &tol);
        let (r_exact, v_exact) = kepler_universal(r0, v0, day, MU_EARTH);
        let err = norm([
            r_num[0] - r_exact[0],
            r_num[1] - r_exact[1],
            r_num[2] - r_exact[2],
        ]);
        let verr = norm([
            v_num[0] - v_exact[0],
            v_num[1] - v_exact[1],
            v_num[2] - v_exact[2],
        ]);
        assert!(err < 0.1, "DOP853 24h two-body residual {err} m");
        assert!(verr < 1e-4, "DOP853 24h velocity residual {verr} m/s");
        // Backward propagation returns to the start.
        let (rb, _) = propagate_dop853(r_num, v_num, -day, &ForceModel::two_body(), &tol);
        let back = norm([rb[0] - r0[0], rb[1] - r0[1], rb[2] - r0[2]]);
        assert!(back < 0.2, "round trip {back} m");
    }

    #[test]
    fn numerical_propagator_dop853_selection_agrees_and_default_is_unchanged() {
        let (r0, v0) = leo_state();
        let tol = Tolerance {
            rtol: 1e-12,
            atol: 1e-9,
            ..Tolerance::default()
        };
        let base = NumericalPropagator::two_body(r0, v0).with_tolerance(tol);
        assert_eq!(base.integrator, Integrator::StepDoubling);
        let a = base.state_at(5_400.0).unwrap();
        let b = base
            .clone()
            .with_integrator(Integrator::Dop853)
            .state_at(5_400.0)
            .unwrap();
        let d = norm([a.r[0] - b.r[0], a.r[1] - b.r[1], a.r[2] - b.r[2]]);
        assert!(d < 0.1, "DOP853 vs step doubling {d} m");
        // Non-finite input: returned unchanged, as for the other drivers.
        let (rn, _) = propagate_dop853(
            [f64::NAN, 0.0, 0.0],
            v0,
            60.0,
            &ForceModel::two_body(),
            &tol,
        );
        assert!(rn[0].is_nan());
        assert!(
            propagate_dop853_checked(r0, v0, f64::INFINITY, &ForceModel::two_body(), &tol).is_err()
        );
    }

    #[test]
    fn solve_kepler_robust_converges_where_the_checked_solver_fails() {
        // The legacy guard's failing case converges with the shared Markley solver.
        let ea = solve_kepler_robust(0.3, 0.999).expect("robust solver converges");
        assert!((ea - 0.999 * ea.sin() - 0.3).abs() < 1e-15);
        // Agrees with the legacy solver where that one converges.
        let legacy = solve_kepler_checked(1.0, 0.3, 30).unwrap();
        assert!((solve_kepler_robust(1.0, 0.3).unwrap() - legacy).abs() < 1e-14);
        assert!(solve_kepler_robust(1.0, 1.0).is_err());
    }
}
