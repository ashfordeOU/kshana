// SPDX-License-Identifier: AGPL-3.0-only
//! `cislunar-observability` scenario — planar cislunar constellation observability (P6).
//!
//! A small planar four-spacecraft cislunar constellation near the Moon is tracked by
//! inter-satellite ranging. The scenario answers the single question a batch estimator
//! designer needs before committing: *how much of a spacecraft's four-state
//! `[x, y, ẋ, ẏ]` does the arc actually make observable, and how does that grow with arc
//! length?* It assembles the observability structure of [`crate::observability_gramian`]
//! from the crate's finite-difference-validated CR3BP variational STM and the analytic
//! inter-satellite range/range-rate Jacobians, and emits three honest artifacts:
//!
//! 1. the **rank-vs-arc-length** table for a single range-only link — instantaneously
//!    rank-1, growing toward the full four-state as the arc lengthens (paper P6 Table 1);
//! 2. the observability **Gramian eigen-spectrum** and condition number over the arc; and
//! 3. the **range-only vs range+range-rate** instantaneous-rank comparison — the Doppler
//!    design lever that lifts a single snapshot off rank-1.
//!
//! 4. the **SRIF cross-validation** of the rank transition: an independent square-root
//!    information filter ([`crate::deepspace_od::Srif`], via [`crate::cislunar_srif`]) folds
//!    the same observability rows and its posterior covariance turns finite / well-conditioned
//!    *exactly* at the arc where the observable rank reaches the full four-state, with a
//!    condition number that tracks the Gramian conditioning (P6 rank-only → Validated against
//!    an independent estimator).
//!
//! ## Validated vs Modelled
//! * **Validated.** The rank is a rank-revealing singular-value threshold, cross-checked
//!   against the Gramian eigen-rank; the eigen-spectrum obeys the spectral invariants
//!   (`trace = Σλ`, `det = Πλ`); the STM is the finite-difference-validated CR3BP
//!   variational matrix; the range/range-rate Jacobian rows are finite-difference-validated
//!   analytic partials. The constellation initial conditions are **differential-corrected
//!   planar DROs** ([`crate::dro`]) that close to a tight periodicity residual and are
//!   retrograde. The rank transition is cross-validated against an independent SRIF estimator
//!   ([`crate::cislunar_srif`]). (See the unit tests of the underlying modules.)
//! * **Modelled.** The constellation *design* (which perilune amplitudes and phases the four
//!   DROs take) is a scenario choice, and the *specific* rank progression it produces is a
//!   property of that geometry, not a certified universal.
//!
//! ## Three dimensions, measurement noise, and other orbit families (R3)
//! The default path above is planar, noise-free and DRO-only, and stays so — it emits the
//! released document byte for byte. Five optional fields open the rest of the problem:
//! `spatial` estimates the full six-state `[x, y, z, ẋ, ẏ, ż]` from the crate's 6×6 CR3BP
//! STM; `sigma_range_m` puts a measurement covariance into the Gramian by whitening;
//! `family` sweeps L2 halo and near-rectilinear-halo constellations beside the DROs;
//! `n_spacecraft` sizes the constellation; and `sigma_pos_threshold_km` sets the bound of
//! the noise-dependent criterion. With any of them set the report gains an
//! `arc_threshold` block carrying **two** arc-length criteria, because there is no single
//! honest one:
//!
//! * the **rank criterion** (`rank(O) = state_dim`) is the published one. It is *invariant*
//!   to a homoscedastic measurement sigma — whitening multiplies `O` by a scalar, which
//!   cannot move a relative singular-value threshold — so it answers the three-dimensional
//!   question but not the noisy one; and
//! * the **estimability criterion** (formal 1σ position uncertainty below a stated bound,
//!   from `P = σ²(OᵀO)⁻¹`) is the one that does move with noise, and is swept over five
//!   bounds so the arbitrariness of the bound is visible rather than buried.
//!
//! Both are reported with the grid bracket the epoch spacing leaves them in, and a family
//! whose geometry can never reach full rank is reported as having **no** threshold rather
//! than an extrapolated one.

use crate::cislunar_srif::{full_rank_transition, srif_cross_validation, SrifArcPoint};
use crate::cr3bp::{
    differential_correct_halo, jacobi_constant, propagate_cr3bp, Cr3bpState, EARTH_MOON_DIST_KM,
    EARTH_MOON_MU, SIDEREAL_MONTH_DAYS,
};
use crate::intersat_range::{
    range_rate_row, range_rate_row_spatial, range_row, range_row_spatial, PlanarState, SpatialState,
};
use crate::observability_gramian::{
    cislunar_gdop, gramian, gramian_spectrum, observability_matrix, observable_rank,
    range_vs_range_rate_rank, rank_tolerance_note, rank_vs_arc, whitened_posterior, CislunarGdop,
    GramianSpectrum, Mat, ObsEpoch, RankArcPoint, RankLever, WhitenedPosterior, N_PLANAR,
    N_SPATIAL,
};
use serde::Deserialize;
use std::sync::{Mutex, OnceLock};

/// A differential-corrected DRO constellation member: the parent planar DRO's provenance and
/// the phased planar state this spacecraft rides.
#[derive(Clone, Debug)]
struct DroMember {
    /// The phased planar constellation state `[x, y, ẋ, ẏ]`.
    state: PlanarState,
    /// Perilune amplitude of the parent DRO (km).
    perilune_km: f64,
    /// Periodicity residual of the parent DRO (nondimensional closure error) — the Validated
    /// closure anchor.
    periodicity_residual: f64,
    /// Full period of the parent DRO (rotating-frame time units).
    period: f64,
    /// Phase fraction of the period at which this member rides the DRO.
    phase: f64,
}

/// The default four-spacecraft cislunar constellation: differential-corrected planar DROs at
/// prescribed perilune amplitudes (index 0 the chief, 1.. the beacons), each ridden at a distinct
/// phase so the constellation spans the plane. Built once for the Earth–Moon mass ratio and cached
/// (the differential correction is deterministic but not free), so repeated scenario runs are
/// cheap and byte-identical.
fn dro_constellation() -> &'static [DroMember] {
    static CELL: OnceLock<Vec<DroMember>> = OnceLock::new();
    CELL.get_or_init(|| {
        let mu = EARTH_MOON_MU;
        // (perpendicular-crossing distance from the Moon, phase fraction). The crossing distances
        // place the perilunes across ~18,000–44,000 km — within the ~11,500–46,000 km distant-
        // retrograde band — and the phases spread the members off the x-axis.
        let design = [
            (0.070_f64, 0.00_f64), // chief
            (0.048, 0.20),         // reference 0
            (0.095, 0.44),         // reference 1
            (0.118, 0.66),         // reference 2
        ];
        design
            .iter()
            .map(|&(d, phase)| {
                let dro = crate::dro::dro_from_crossing((1.0 - mu) + d, mu, 1e-12, 60)
                    .expect("cislunar constellation DRO must differential-correct");
                DroMember {
                    state: crate::dro::state_at(&dro, mu, phase, 24_000),
                    perilune_km: dro.perilune_km,
                    periodicity_residual: dro.periodicity_residual,
                    period: dro.period,
                    phase,
                }
            })
            .collect()
    })
}

// ── Orbit-family parameterisation (R3) ───────────────────────────────────────

/// Default constellation size: a chief plus three beacons.
const DEFAULT_SPACECRAFT: usize = 4;

/// The largest constellation the family seeders carry design points for.
const MAX_SPACECRAFT: usize = 8;

/// Design points for the planar-DRO family: `(perpendicular-crossing distance from the
/// Moon, phase fraction)`. The **first four are exactly the released four-spacecraft
/// design** — the default constellation is unchanged — and the rest extend it for larger
/// `n_spacecraft`, keeping the perilunes inside the ~11,500–46,000 km distant-retrograde
/// band and the phases spread around the orbit.
const DRO_DESIGN: [(f64, f64); MAX_SPACECRAFT] = [
    (0.070, 0.00), // chief
    (0.048, 0.20), // reference 0
    (0.095, 0.44), // reference 1
    (0.118, 0.66), // reference 2
    (0.060, 0.12),
    (0.085, 0.33),
    (0.105, 0.55),
    (0.130, 0.78),
];

/// Phase fractions of the parent orbit at which the halo / near-rectilinear-halo members
/// ride, index-aligned with their family parameters below.
const HALO_PHASES: [f64; MAX_SPACECRAFT] = [0.00, 0.20, 0.44, 0.66, 0.12, 0.33, 0.55, 0.78];

/// L2 **halo** family parameters: the `x` abscissa of the perpendicular `x`-`z` plane
/// crossing that [`differential_correct_halo`] holds fixed. Monotone so the corrector can
/// be run as a natural-parameter continuation (each solution seeds the next).
const HALO_X0: [f64; MAX_SPACECRAFT] = [
    1.0800, 1.0850, 1.0900, 1.0950, 1.1000, 1.1050, 1.1100, 1.1150,
];

/// Seed `(z0, ẏ0)` for the first L2 southern halo of [`HALO_X0`] — the guess the crate's
/// own halo unit test corrects from.
const HALO_SEED: (f64, f64) = (-0.10, -0.10);

/// L2 **near-rectilinear halo** (NRHO) family parameters, in the 9:2-class regime the
/// crate reproduces the published Gateway orbit at.
const NRHO_X0: [f64; MAX_SPACECRAFT] = [
    1.0220, 1.0245, 1.0270, 1.0295, 1.0320, 1.0345, 1.0370, 1.0395,
];

/// Seed `(z0, ẏ0)` for the first NRHO of [`NRHO_X0`] — the published 9:2 apolune guess the
/// crate's own NRHO unit test corrects from.
const NRHO_SEED: (f64, f64) = (-0.1800, -0.1020);

/// The cislunar orbit family a constellation rides.
///
/// The published planar result was derived on [`OrbitFamily::Dro`] alone. The other two are
/// the genuinely three-dimensional families of the Earth–Moon system, produced by the same
/// differential corrector ([`differential_correct_halo`]) that reproduces the published L2
/// southern 9:2 NRHO.
#[derive(Clone, Copy, Debug, Default, PartialEq, Eq)]
pub enum OrbitFamily {
    /// Planar distant retrograde orbits about the Moon — the released default, and the
    /// family the published arc-length threshold was measured on.
    #[default]
    Dro,
    /// L2 southern halo orbits: genuinely out-of-plane periodic orbits.
    Halo,
    /// L2 southern near-rectilinear halo orbits (the 9:2-class Gateway regime).
    Nrho,
}

impl OrbitFamily {
    /// The scenario-facing name of the family (`"dro"`, `"halo"`, `"nrho"`).
    pub fn as_str(self) -> &'static str {
        match self {
            OrbitFamily::Dro => "dro",
            OrbitFamily::Halo => "halo",
            OrbitFamily::Nrho => "nrho",
        }
    }

    /// Parse a family name, case-insensitively. Unknown names are an error rather than a
    /// silent fallback to the default.
    pub fn parse(s: &str) -> Result<Self, String> {
        match s.trim().to_ascii_lowercase().as_str() {
            "dro" => Ok(OrbitFamily::Dro),
            "halo" => Ok(OrbitFamily::Halo),
            "nrho" => Ok(OrbitFamily::Nrho),
            other => Err(format!(
                "unknown family `{other}`: expected one of dro, halo, nrho"
            )),
        }
    }

    /// `true` when every member of the family lies in the `z = 0` plane, so a constellation
    /// drawn wholly from it carries **no out-of-plane information at all** (every range row
    /// has `û_z = 0` and the CR3BP out-of-plane block decouples).
    pub fn is_planar(self) -> bool {
        matches!(self, OrbitFamily::Dro)
    }
}

/// One differential-corrected constellation member of any family, carried as a full
/// six-state so the planar and spatial paths share one representation.
#[derive(Clone, Copy, Debug)]
struct FamilyMember {
    /// The phased six-state `[x, y, z, ẋ, ẏ, ż]` this spacecraft rides.
    state: SpatialState,
    /// Perilune radius of the parent orbit (km).
    perilune_km: f64,
    /// Periodicity residual of the parent orbit (nondimensional closure error over one
    /// full period) — the Validated closure anchor.
    periodicity_residual: f64,
    /// Full period of the parent orbit (rotating-frame time units).
    period: f64,
    /// Phase fraction of the period at which this member rides the orbit.
    phase: f64,
    /// Peak out-of-plane excursion `max|z|` of the parent orbit (nondimensional length);
    /// exactly zero for the planar DRO family.
    z_amplitude: f64,
    /// Jacobi constant of the parent orbit.
    jacobi: f64,
}

/// Distance from the Moon (nondimensional) of a CR3BP state.
fn moon_distance(s: &Cr3bpState, mu: f64) -> f64 {
    let dx = s.r[0] - (1.0 - mu);
    (dx * dx + s.r[1] * s.r[1] + s.r[2] * s.r[2]).sqrt()
}

/// One incremental sweep of a periodic orbit, returning `(perilune_km, max|z|,
/// periodicity_residual)`. Marching the state forward in equal sub-steps costs a single
/// propagation per period instead of one per sample, and the closure residual is read off
/// the same sweep's end state.
fn sweep_orbit(ic: &Cr3bpState, mu: f64, period: f64, samples: usize) -> (f64, f64, f64) {
    let n = samples.max(2);
    let h = period / n as f64;
    let mut st = *ic;
    let mut min_d = moon_distance(&st, mu);
    let mut max_z: f64 = st.r[2].abs();
    for _ in 0..n {
        st = propagate_cr3bp(st, mu, h, 40);
        min_d = min_d.min(moon_distance(&st, mu));
        max_z = max_z.max(st.r[2].abs());
    }
    let resid = ((st.r[0] - ic.r[0]).powi(2)
        + (st.r[1] - ic.r[1]).powi(2)
        + (st.r[2] - ic.r[2]).powi(2)
        + (st.v[0] - ic.v[0]).powi(2)
        + (st.v[1] - ic.v[1]).powi(2)
        + (st.v[2] - ic.v[2]).powi(2))
    .sqrt();
    (min_d * EARTH_MOON_DIST_KM, max_z, resid)
}

/// The planar-DRO constellation as [`FamilyMember`]s. For the released four-spacecraft
/// design this is exactly [`dro_constellation`] lifted into the six-state embedding
/// (`z = ż = 0`), so the default path's numbers are untouched.
fn dro_members(mu: f64, n: usize) -> Result<Vec<FamilyMember>, String> {
    let lift = |m: &DroMember| FamilyMember {
        state: [m.state[0], m.state[1], 0.0, m.state[2], m.state[3], 0.0],
        perilune_km: m.perilune_km,
        periodicity_residual: m.periodicity_residual,
        period: m.period,
        phase: m.phase,
        z_amplitude: 0.0,
        jacobi: jacobi_constant(
            &Cr3bpState {
                r: [m.state[0], m.state[1], 0.0],
                v: [m.state[2], m.state[3], 0.0],
            },
            mu,
        ),
    };
    if n == DEFAULT_SPACECRAFT {
        return Ok(dro_constellation().iter().map(lift).collect());
    }
    let mut out = Vec::with_capacity(n);
    for &(d, phase) in DRO_DESIGN.iter().take(n) {
        let dro = crate::dro::dro_from_crossing((1.0 - mu) + d, mu, 1e-12, 60)
            .ok_or_else(|| format!("DRO at crossing distance {d} did not differential-correct"))?;
        out.push(lift(&DroMember {
            state: crate::dro::state_at(&dro, mu, phase, 24_000),
            perilune_km: dro.perilune_km,
            periodicity_residual: dro.periodicity_residual,
            period: dro.period,
            phase,
        }));
    }
    Ok(out)
}

/// The L2 halo / NRHO constellation as [`FamilyMember`]s, built by **natural-parameter
/// continuation** of the crate's differential corrector: each corrected orbit's `(z₀, ẏ₀)`
/// seeds the next abscissa, so the whole family follows from the one published seed the
/// crate's own unit tests validate.
fn halo_members(
    mu: f64,
    n: usize,
    x0_list: &[f64; MAX_SPACECRAFT],
    seed: (f64, f64),
    label: &str,
) -> Result<Vec<FamilyMember>, String> {
    let (mut z0, mut vy0) = seed;
    let mut out = Vec::with_capacity(n);
    for (i, &x0) in x0_list.iter().take(n).enumerate() {
        let guess = Cr3bpState {
            r: [x0, 0.0, z0],
            v: [0.0, vy0, 0.0],
        };
        let orbit = differential_correct_halo(&guess, mu, 1e-11, 80).ok_or_else(|| {
            format!("{label} member {i} at x0 = {x0} did not differential-correct")
        })?;
        z0 = orbit.ic.r[2];
        vy0 = orbit.ic.v[1];
        let (perilune_km, z_amplitude, periodicity_residual) =
            sweep_orbit(&orbit.ic, mu, orbit.period, 720);
        let phase = HALO_PHASES[i];
        let st = propagate_cr3bp(orbit.ic, mu, orbit.period * phase, 20_000);
        out.push(FamilyMember {
            state: [st.r[0], st.r[1], st.r[2], st.v[0], st.v[1], st.v[2]],
            perilune_km,
            periodicity_residual,
            period: orbit.period,
            phase,
            z_amplitude,
            jacobi: orbit.jacobi,
        });
    }
    Ok(out)
}

/// Memo of built constellations, keyed by `(family, n, μ bits)`. The differential
/// correction is deterministic but not free, so repeated scenario runs in one process
/// reuse the same members byte-for-byte.
#[allow(clippy::type_complexity)]
fn family_cache() -> &'static Mutex<Vec<((OrbitFamily, usize, u64), Vec<FamilyMember>)>> {
    static CELL: OnceLock<Mutex<Vec<((OrbitFamily, usize, u64), Vec<FamilyMember>)>>> =
        OnceLock::new();
    CELL.get_or_init(|| Mutex::new(Vec::new()))
}

/// The differential-corrected constellation of `family` with `n` members.
///
/// `mu` is the mass ratio the **family** is corrected at. Every family is seeded at the
/// Earth–Moon mass ratio ([`EARTH_MOON_MU`]) by the scenario, exactly as the released DRO
/// seeder always has been: the scenario's `mu` field governs the propagation along the
/// tracking arc, not which periodic orbits the constellation rides.
fn family_members(family: OrbitFamily, mu: f64, n: usize) -> Result<Vec<FamilyMember>, String> {
    let key = (family, n, mu.to_bits());
    if let Ok(cache) = family_cache().lock() {
        if let Some((_, v)) = cache.iter().find(|(k, _)| *k == key) {
            return Ok(v.clone());
        }
    }
    let built = match family {
        OrbitFamily::Dro => dro_members(mu, n)?,
        OrbitFamily::Halo => halo_members(mu, n, &HALO_X0, HALO_SEED, "halo")?,
        OrbitFamily::Nrho => halo_members(mu, n, &NRHO_X0, NRHO_SEED, "nrho")?,
    };
    if let Ok(mut cache) = family_cache().lock() {
        cache.push((key, built.clone()));
    }
    Ok(built)
}

/// The honesty label carried on the result document.
const LABEL: &str = "MODELLED planar cislunar constellation observability (P6). VALIDATED \
core: the observable RANK is a rank-revealing singular-value threshold cross-checked \
against the Gramian eigen-rank; the Gramian eigen-spectrum obeys the spectral invariants \
(trace = sum eig, det = prod eig, Frobenius^2 = sum eig^2); the variational STM is the \
finite-difference-validated CR3BP STM (crate::cr3bp); the range / range-rate Jacobian rows \
are finite-difference-validated analytic partials (cross-checked against the crate's 3-D \
range-rate observable); the four-spacecraft initial conditions are differential-corrected \
planar DROs (crate::dro) that close to a tight periodicity residual and are retrograde; and \
the rank transition is cross-validated against an independent square-root information filter \
(crate::cislunar_srif) whose posterior covariance turns finite exactly at full observable \
rank. MODELLED: the constellation design (which DRO perilune amplitudes and phases) and the \
specific rank-vs-arc progression it produces. Not a certified navigation-performance product.";

/// Rotating-frame time units per hour (`2π` time units = one sidereal month).
fn tu_per_hour() -> f64 {
    let days_per_hour = 1.0 / 24.0;
    let days_per_tu = SIDEREAL_MONTH_DAYS / (2.0 * std::f64::consts::PI);
    days_per_hour / days_per_tu
}

/// Seconds in one rotating-frame time unit — the de-normaliser for a velocity.
fn tu_seconds() -> f64 {
    SIDEREAL_MONTH_DAYS * 86_400.0 / (2.0 * std::f64::consts::PI)
}

/// Default bound of the **estimability** criterion: the formal 1σ position uncertainty
/// (km) the arc must drive the chief's initial state below. A stated engineering bound,
/// not a fitted one — [`SIGMA_POS_SWEEP_KM`] reports the threshold at four other bounds
/// beside it so the effect of the choice is visible rather than buried.
const DEFAULT_SIGMA_POS_THRESHOLD_KM: f64 = 1.0;

/// Formal-position-uncertainty bounds the estimability threshold is swept over (km).
const SIGMA_POS_SWEEP_KM: [f64; 5] = [1000.0, 100.0, 10.0, 1.0, 0.1];

/// The `cislunar-observability` scenario. Every field is optional; with no fields the
/// analysis runs the default differential-corrected planar-DRO constellation over a ~6-hour arc.
#[derive(Clone, Debug, Default, Deserialize)]
pub struct CislunarObservabilityScenario {
    /// Earth–Moon mass ratio (default [`EARTH_MOON_MU`]).
    pub mu: Option<f64>,
    /// Tracking-arc length in hours (default 6.0).
    pub arc_hours: Option<f64>,
    /// Number of epochs sampled along the arc (default 24).
    pub epochs: Option<usize>,
    /// RK4 sub-steps per STM propagation to each checkpoint (default 2000).
    pub steps: Option<usize>,
    /// Relative singular-value threshold for the observable-rank read (default 1e-6).
    pub rel_tol: Option<f64>,
    /// Estimate the full **spatial** six-state `[x, y, z, ẋ, ẏ, ż]` instead of the planar
    /// four-state (default `false` — the planar path is unchanged and remains the default).
    pub spatial: Option<bool>,
    /// One-sigma inter-satellite **range measurement noise**, metres (default 0.0, the
    /// noise-free Gramian). Enters by whitening every measurement Jacobian row by `1/σ`,
    /// which is what puts a measurement covariance `R = σ²I` into the Gramian.
    pub sigma_range_m: Option<f64>,
    /// Orbit **family** the constellation rides: `"dro"` (default, the released planar
    /// distant-retrograde design), `"halo"` or `"nrho"`.
    pub family: Option<String>,
    /// Number of spacecraft in the constellation, chief first (default 4, maximum 8).
    pub n_spacecraft: Option<usize>,
    /// Formal 1σ position-uncertainty bound of the **estimability** arc-length criterion,
    /// km (default 1.0). Only meaningful when `sigma_range_m > 0`.
    pub sigma_pos_threshold_km: Option<f64>,
}

/// One arc point of the noise-aware estimability read: the formal posterior uncertainty of
/// the chief's *initial* state from the whitened batch truncated at this epoch.
#[derive(Clone, Debug)]
struct PosteriorArcPoint {
    /// Index of the last epoch in this growing prefix.
    epoch_index: usize,
    /// Elapsed arc time (rotating-frame time units).
    arc_time: f64,
    /// The posterior read at this prefix.
    post: WhitenedPosterior,
    /// Formal 1σ position uncertainty (km), `None` when the geometry is rank-deficient or
    /// the run is noise-free (no measurement covariance exists).
    sigma_position_km: Option<f64>,
    /// Formal 1σ velocity uncertainty (mm/s), `None` for the same reasons.
    sigma_velocity_mm_s: Option<f64>,
}

/// The computed observability analysis.
struct Computed {
    mu: f64,
    arc_hours: f64,
    arc_time_tu: f64,
    rel_tol: f64,
    extended: bool,
    spatial: bool,
    family: OrbitFamily,
    n_spacecraft: usize,
    state_dim: usize,
    sigma_range_m: f64,
    sigma_range_nd: f64,
    whitening_scale: f64,
    sigma_pos_threshold_km: f64,
    members: Vec<FamilyMember>,
    chief: Vec<f64>,
    refs: Vec<Vec<f64>>,
    rank_arc: Vec<RankArcPoint>,
    spectrum: GramianSpectrum,
    lever: RankLever,
    gdop_range_only: CislunarGdop,
    gdop_range_rate: CislunarGdop,
    srif_arc: Vec<SrifArcPoint>,
    posterior_arc: Vec<PosteriorArcPoint>,
}

impl CislunarObservabilityScenario {
    /// The four planar constellation states `[x, y, ẋ, ẏ]` (rotating frame, normalised
    /// units): index 0 is the tracked *chief*, indices 1.. are the reference beacons.
    ///
    /// These are **differential-corrected planar distant-retrograde orbits** (DROs) about the
    /// Moon (which sits at `1−μ ≈ 0.988` on the x-axis), at prescribed perilune amplitudes and
    /// phases (see [`crate::dro`]). Each parent DRO closes to a tight periodicity residual and is
    /// retrograde — Validated — so the initial conditions are corrected periodic orbits, not
    /// hand-placed guesses. The specific amplitudes/phases (the constellation *design*) remain a
    /// Modelled choice. The DRO family is built for the Earth–Moon mass ratio and cached, so this
    /// seam stays deterministic and cheap across repeated runs.
    pub fn seed_states(&self) -> Vec<PlanarState> {
        dro_constellation().iter().map(|m| m.state).collect()
    }

    /// The constellation as full six-states `[x, y, z, ẋ, ẏ, ż]` for the selected
    /// [`OrbitFamily`] and `n_spacecraft`, chief first.
    ///
    /// For the default planar-DRO design these are exactly [`Self::seed_states`] embedded
    /// at `z = ż = 0`; for the halo and NRHO families they are differential-corrected
    /// out-of-plane periodic orbits produced by [`differential_correct_halo`] under
    /// natural-parameter continuation from the seed the crate's own halo/NRHO unit tests
    /// validate. Errors if a family member fails to converge or `n_spacecraft` is out of
    /// range.
    pub fn seed_states_spatial(&self) -> Result<Vec<SpatialState>, String> {
        let mu = self.mu.unwrap_or(EARTH_MOON_MU);
        let _ = mu;
        let family = self.orbit_family()?;
        let n = self.spacecraft_count()?;
        Ok(family_members(family, EARTH_MOON_MU, n)?
            .into_iter()
            .map(|m| m.state)
            .collect())
    }

    /// The selected orbit family (default [`OrbitFamily::Dro`]).
    fn orbit_family(&self) -> Result<OrbitFamily, String> {
        match &self.family {
            Some(s) => OrbitFamily::parse(s),
            None => Ok(OrbitFamily::default()),
        }
    }

    /// The validated constellation size (default 4, at most [`MAX_SPACECRAFT`]).
    fn spacecraft_count(&self) -> Result<usize, String> {
        let n = self.n_spacecraft.unwrap_or(DEFAULT_SPACECRAFT);
        if !(2..=MAX_SPACECRAFT).contains(&n) {
            return Err(format!(
                "n_spacecraft must be between 2 and {MAX_SPACECRAFT}, got {n}"
            ));
        }
        Ok(n)
    }

    /// Whether any of the three-dimensional / noisy / family extension fields is set away
    /// from its released default.
    ///
    /// With every one of them at its default the scenario takes the **identical** code path
    /// it always has and emits a byte-for-byte identical document; the extension blocks
    /// appear only once a caller asks for one of them (an unparseable family name counts as
    /// extended so the error surfaces instead of silently falling back).
    fn is_extended(&self) -> bool {
        self.spatial == Some(true)
            || self.sigma_range_m.is_some_and(|s| s != 0.0)
            || self
                .family
                .as_deref()
                .is_some_and(|f| OrbitFamily::parse(f) != Ok(OrbitFamily::Dro))
            || self.n_spacecraft.is_some_and(|n| n != DEFAULT_SPACECRAFT)
            || self.sigma_pos_threshold_km.is_some()
    }

    fn compute(&self) -> Result<Computed, String> {
        let mu = self.mu.unwrap_or(EARTH_MOON_MU);
        let arc_hours = self.arc_hours.unwrap_or(6.0);
        let n_epochs = self.epochs.unwrap_or(24);
        let steps = self.steps.unwrap_or(2000);
        let rel_tol = self.rel_tol.unwrap_or(1e-6);
        if !(arc_hours.is_finite() && arc_hours > 0.0) {
            return Err(format!(
                "arc_hours must be finite and positive, got {arc_hours}"
            ));
        }
        if n_epochs < 2 {
            return Err(format!("epochs must be ≥ 2, got {n_epochs}"));
        }
        if !(rel_tol.is_finite() && rel_tol > 0.0) {
            return Err(format!(
                "rel_tol must be finite and positive, got {rel_tol}"
            ));
        }
        let extended = self.is_extended();
        let spatial = self.spatial.unwrap_or(false);
        let family = self.orbit_family()?;
        let n_spacecraft = self.spacecraft_count()?;
        let sigma_range_m = self.sigma_range_m.unwrap_or(0.0);
        if !(sigma_range_m.is_finite() && sigma_range_m >= 0.0) {
            return Err(format!(
                "sigma_range_m must be finite and non-negative, got {sigma_range_m}"
            ));
        }
        let sigma_pos_threshold_km = self
            .sigma_pos_threshold_km
            .unwrap_or(DEFAULT_SIGMA_POS_THRESHOLD_KM);
        if !(sigma_pos_threshold_km.is_finite() && sigma_pos_threshold_km > 0.0) {
            return Err(format!(
                "sigma_pos_threshold_km must be finite and positive, got {sigma_pos_threshold_km}"
            ));
        }
        if !spatial && !family.is_planar() {
            return Err(format!(
                "family `{}` is an out-of-plane family and has no planar four-state \
                 representation: set spatial = true to sweep it",
                family.as_str()
            ));
        }
        let state_dim = if spatial { N_SPATIAL } else { N_PLANAR };
        let n_pos = state_dim / 2;
        // Whitening: R = σ²I ⇒ the information is the unit-weight Gram of the rows H/σ.
        // σ is given in metres; the state is in normalised Earth–Moon length units.
        let sigma_range_nd = sigma_range_m / (EARTH_MOON_DIST_KM * 1000.0);
        let whitening_scale = if sigma_range_nd > 0.0 {
            1.0 / sigma_range_nd
        } else {
            1.0
        };

        // The family is corrected at the Earth–Moon mass ratio (as the released DRO seeder
        // always has been); `mu` governs the propagation along the arc.
        let members = family_members(family, EARTH_MOON_MU, n_spacecraft)?;
        if members.len() < 2 {
            return Err("the constellation must carry at least a chief and one reference".into());
        }
        let project = |s: &SpatialState| -> Vec<f64> {
            if spatial {
                s.to_vec()
            } else {
                vec![s[0], s[1], s[3], s[4]]
            }
        };
        let chief = project(&members[0].state);
        let refs: Vec<Vec<f64>> = members[1..].iter().map(|m| project(&m.state)).collect();
        let arc_time_tu = arc_hours * tu_per_hour();

        // Build the single-link range-only arc (chief ↔ reference 0): the P6 Table-1
        // series. Each epoch carries the chief's STM Φ(t_k) and one range row, whitened by
        // the measurement sigma when one is given.
        let mut epochs_single: Vec<ObsEpoch> = Vec::with_capacity(n_epochs);
        let mut prev_t = 0.0;
        for k in 0..n_epochs {
            let t = arc_time_tu * (k as f64) / ((n_epochs - 1) as f64);
            let (h_row, phi): (Vec<f64>, Mat) = if spatial {
                let c6: SpatialState = members[0].state;
                let r6: SpatialState = members[1].state;
                let (cs, phi) = crate::observability_gramian::spatial_state_stm(&c6, mu, t, steps);
                let rs = crate::observability_gramian::spatial_propagate(&r6, mu, t, steps);
                let (_rho, r_row) = range_row_spatial(&cs, &rs);
                (r_row.to_vec(), phi.iter().map(|r| r.to_vec()).collect())
            } else {
                let c4: PlanarState = [chief[0], chief[1], chief[2], chief[3]];
                let r4: PlanarState = [refs[0][0], refs[0][1], refs[0][2], refs[0][3]];
                let (cs, phi) = crate::observability_gramian::planar_state_stm(&c4, mu, t, steps);
                let rs = crate::observability_gramian::planar_propagate(&r4, mu, t, steps);
                let (_rho, r_row) = range_row(&cs, &rs);
                (r_row.to_vec(), phi.iter().map(|row| row.to_vec()).collect())
            };
            let h_row = if whitening_scale == 1.0 {
                h_row
            } else {
                h_row.iter().map(|v| v * whitening_scale).collect()
            };
            epochs_single.push(ObsEpoch {
                h: vec![h_row],
                phi,
                dt: t - prev_t,
            });
            prev_t = t;
        }
        let rank_arc = rank_vs_arc(&epochs_single, rel_tol);
        let w = gramian(&epochs_single);
        let spectrum = gramian_spectrum(&w, rel_tol);

        // Independent SRIF cross-validation of the rank transition on the same single-link arc:
        // the square-root information filter's posterior covariance turns finite / well-conditioned
        // exactly when the observable rank reaches the full state dimension.
        let srif_arc = srif_cross_validation(&epochs_single, rel_tol);

        // The noise-aware read: the formal posterior uncertainty of the chief's initial
        // state over the same growing prefixes. Only computed for the extended path.
        let mut posterior_arc: Vec<PosteriorArcPoint> = Vec::new();
        if extended {
            let km_per_nd = EARTH_MOON_DIST_KM;
            let mm_s_per_nd = EARTH_MOON_DIST_KM * 1.0e6 / tu_seconds();
            let mut arc = 0.0;
            for k in 0..epochs_single.len() {
                arc += epochs_single[k].dt;
                let (o, _w) = observability_matrix(&epochs_single[..=k]);
                let post = whitened_posterior(&o, n_pos, rel_tol);
                // A formal uncertainty only exists once a measurement covariance does: with
                // σ = 0 the Gram is unit-weight and its inverse is not a covariance at all.
                let noisy = sigma_range_nd > 0.0;
                posterior_arc.push(PosteriorArcPoint {
                    epoch_index: k,
                    arc_time: arc,
                    sigma_position_km: if noisy {
                        post.sigma_position.map(|s| s * km_per_nd)
                    } else {
                        None
                    },
                    sigma_velocity_mm_s: if noisy {
                        post.sigma_velocity.map(|s| s * mm_s_per_nd)
                    } else {
                        None
                    },
                    post,
                });
            }
        }

        // Instantaneous (t=0) multi-link range-only vs range+range-rate lever.
        let lever = if spatial {
            let mut h_range: Mat = Vec::new();
            let mut h_both: Mat = Vec::new();
            for r in &members[1..] {
                let (_rho, rr) = range_row_spatial(&members[0].state, &r.state);
                h_range.push(rr.to_vec());
                h_both.push(rr.to_vec());
                let (_rd, rrr) = range_rate_row_spatial(&members[0].state, &r.state);
                h_both.push(rrr.to_vec());
            }
            RankLever {
                n_links: refs.len(),
                rank_range_only: observable_rank(&h_range, rel_tol),
                rank_range_rate: observable_rank(&h_both, rel_tol),
            }
        } else {
            let c4: PlanarState = [chief[0], chief[1], chief[2], chief[3]];
            let r4: Vec<PlanarState> = refs.iter().map(|r| [r[0], r[1], r[2], r[3]]).collect();
            range_vs_range_rate_rank(&c4, &r4, rel_tol)
        };

        // Instantaneous GDOP: range-only (rank-deficient → undefined) vs range+range-rate.
        let mut rows_ro: Mat = Vec::new();
        let mut rows_rr: Mat = Vec::new();
        if spatial {
            for r in &members[1..] {
                let (_rho, rr) = range_row_spatial(&members[0].state, &r.state);
                rows_ro.push(rr.to_vec());
                rows_rr.push(rr.to_vec());
                let (_rd, rrr) = range_rate_row_spatial(&members[0].state, &r.state);
                rows_rr.push(rrr.to_vec());
            }
        } else {
            let c4: PlanarState = [chief[0], chief[1], chief[2], chief[3]];
            for r in &refs {
                let r4: PlanarState = [r[0], r[1], r[2], r[3]];
                let (_rho, rr) = range_row(&c4, &r4);
                rows_ro.push(rr.to_vec());
                rows_rr.push(rr.to_vec());
                let (_rd, rrr) = range_rate_row(&c4, &r4);
                rows_rr.push(rrr.to_vec());
            }
        }
        let gdop_range_only = cislunar_gdop(&rows_ro, rel_tol);
        let gdop_range_rate = cislunar_gdop(&rows_rr, rel_tol);

        Ok(Computed {
            mu,
            arc_hours,
            arc_time_tu,
            rel_tol,
            extended,
            spatial,
            family,
            n_spacecraft,
            state_dim,
            sigma_range_m,
            sigma_range_nd,
            whitening_scale,
            sigma_pos_threshold_km,
            members,
            chief,
            refs,
            rank_arc,
            spectrum,
            lever,
            gdop_range_only,
            gdop_range_rate,
            srif_arc,
            posterior_arc,
        })
    }

    /// Run the scenario, returning `(json, summary, svg)`.
    pub fn run_output(&self) -> Result<(String, String, String), String> {
        let c = self.compute()?;
        Ok((self.json(&c)?, self.summary(&c), svg(&c)))
    }

    fn json(&self, c: &Computed) -> Result<String, String> {
        let rank_arc: Vec<serde_json::Value> = c
            .rank_arc
            .iter()
            .map(|p| {
                let mut row = serde_json::json!({
                    "epoch_index": p.epoch_index,
                    "arc_time_tu": p.arc_time,
                    "arc_hours": p.arc_time / tu_per_hour(),
                    "n_rows": p.n_rows,
                    "rank": p.rank,
                    "sigma_max": p.sigma_max,
                    "sigma_min": p.sigma_min,
                });
                // Present only on a prefix whose singular-value count exceeded what the matrix
                // shape admits, so the released document (rel_tol 1e-6, where the bound never
                // binds) is unchanged and a clamp is never silent.
                if let Some(reason) = &p.rank_limited_by {
                    row.as_object_mut()
                        .expect("rank row is an object")
                        .insert("rank_limited_by".into(), reason.as_str().into());
                }
                row
            })
            .collect();
        // Constellation provenance: one entry per member (chief first), carrying the parent
        // orbit's perilune amplitude, periodicity residual (the Validated closure), period,
        // phase. The key name `dro_provenance` is kept for the released document; in the
        // extended path it carries whichever family was asked for, each member naming it.
        let dro_provenance: Vec<serde_json::Value> = c
            .members
            .iter()
            .enumerate()
            .map(|(i, m)| {
                let state: Vec<f64> = if c.spatial {
                    m.state.to_vec()
                } else {
                    vec![m.state[0], m.state[1], m.state[3], m.state[4]]
                };
                let mut row = serde_json::json!({
                    "role": if i == 0 { "chief".to_string() } else { format!("reference {}", i - 1) },
                    "state": state,
                    "perilune_km": m.perilune_km,
                    "periodicity_residual": m.periodicity_residual,
                    "period_tu": m.period,
                    "phase_fraction": m.phase,
                });
                if c.extended {
                    let o = row.as_object_mut().expect("member row is an object");
                    o.insert("family".into(), c.family.as_str().into());
                    o.insert("z_amplitude_nd".into(), m.z_amplitude.into());
                    o.insert("jacobi_constant".into(), m.jacobi.into());
                }
                row
            })
            .collect();
        // SRIF cross-validation of the rank transition (P6 rank-only → Validated vs an
        // independent estimator).
        let srif_arc: Vec<serde_json::Value> = c
            .srif_arc
            .iter()
            .map(|p| {
                serde_json::json!({
                    "epoch_index": p.epoch_index,
                    "arc_time_tu": p.arc_time,
                    "arc_hours": p.arc_time / tu_per_hour(),
                    "n_rows": p.n_rows,
                    "observable_rank": p.gramian_rank,
                    "gramian_condition": condition_json(p.gramian_condition),
                    "srif_posterior_wellposed": p.srif_posterior_wellposed,
                    "srif_condition": condition_json(p.srif_condition),
                })
            })
            .collect();
        let transition = full_rank_transition(&c.srif_arc);
        let doc = serde_json::json!({
            "kind": "cislunar-observability",
            "label": LABEL,
            "mu": c.mu,
            "arc_hours": c.arc_hours,
            "arc_time_tu": c.arc_time_tu,
            "rel_tol": c.rel_tol,
            "state_dim": c.state_dim,
            "chief_state": c.chief,
            "reference_states": c.refs,
            "dro_provenance": {
                "members": dro_provenance,
                "note": "Validated: each constellation initial condition is a differential-corrected \
                    planar DRO (crate::dro) that closes over one period to the reported periodicity \
                    residual and is retrograde about the Moon. Perilune amplitudes and phases are at \
                    the Earth–Moon mass ratio. Modelled: the choice of amplitudes/phases (the \
                    constellation design)."
            },
            "rank_vs_arc": rank_arc,
            "rank_vs_arc_note": "Validated: rank via singular-value threshold (rank-revealing SVD), \
                cross-checked against the Gramian eigen-rank. Modelled: the specific 1→…→4 \
                progression, which depends on the (Modelled) constellation geometry.",
            "gramian_spectrum": {
                "eigenvalues_ascending": c.spectrum.eigenvalues,
                "min_eigenvalue": c.spectrum.min_eigenvalue,
                "max_eigenvalue": c.spectrum.max_eigenvalue,
                "trace": c.spectrum.trace,
                "condition": condition_json(c.spectrum.condition),
                "rank": c.spectrum.rank,
                "defect": c.spectrum.defect,
                "note": "Validated: symmetric spectrum from the crate's Jacobi eigensolver, \
                    invariant-checked (trace = sum eig, Frobenius^2 = sum eig^2, det = prod eig)."
            },
            "range_rate_lever": {
                "n_links": c.lever.n_links,
                "rank_range_only": c.lever.rank_range_only,
                "rank_range_rate": c.lever.rank_range_rate,
                "note": "Validated: instantaneous ranks via singular-value threshold. Range-only \
                    rows have zero velocity columns (rank ≤ position dimension); Doppler's \
                    non-zero velocity columns lift the rank toward the full four-state."
            },
            "gdop": {
                "range_only": gdop_json(&c.gdop_range_only),
                "range_rate": gdop_json(&c.gdop_range_rate),
                "note": "Validated: a rank-deficient / singular geometry is flagged undefined \
                    (via fim::design_metrics condition=inf), never a bogus finite GDOP — the \
                    same singular-geometry guard pvt::solve_spp applies."
            },
            "srif_cross_validation": {
                "arc": srif_arc,
                "full_rank_transition_epoch": transition,
                "note": "Validated: an independent square-root information filter \
                    (crate::deepspace_od::Srif) folds the same observability rows through \
                    Householder triangularization; its posterior covariance P = R⁻¹R⁻ᵀ turns \
                    finite / well-conditioned exactly at the epoch where the observable rank reaches \
                    the full four-state, and its condition number equals the observability-Gram \
                    condition (cond(P) = cond(OᵀO)) — the rank-only P6 transition upgraded to a \
                    cross-check against a second estimator. gramian_condition/srif_condition are the \
                    full-space λmax/λmin (\"inf\" below full rank)."
            }
        });
        let mut doc = if c.extended {
            extend_document(doc, c)
        } else {
            doc
        };
        // A rank read taken below the f64 noise floor is reported as such rather than being
        // quietly re-floored. Absent at every tolerance at or above sqrt(f64::EPSILON)
        // (~1.49e-8), so the released default document (rel_tol 1e-6) is unchanged.
        if let Some(note) = rank_tolerance_note(c.rel_tol) {
            doc.as_object_mut()
                .expect("the report is an object")
                .insert("rank_tolerance_note".into(), note.into());
        }
        serde_json::to_string_pretty(&doc).map_err(|e| e.to_string())
    }

    fn summary(&self, c: &Computed) -> String {
        let first = c.rank_arc.first();
        let last = c.rank_arc.last();
        let ro = match &c.gdop_range_only {
            CislunarGdop::Defined { gdop, .. } => format!("{gdop:.3}"),
            CislunarGdop::Undefined { .. } => "undefined".to_string(),
        };
        let rr = match &c.gdop_range_rate {
            CislunarGdop::Defined { gdop, .. } => format!("{gdop:.3}"),
            CislunarGdop::Undefined { .. } => "undefined".to_string(),
        };
        let max_resid = c
            .members
            .iter()
            .map(|m| m.periodicity_residual)
            .fold(0.0_f64, f64::max);
        let srif_epoch = match full_rank_transition(&c.srif_arc) {
            Some(e) => e.to_string(),
            None => "none".to_string(),
        };
        let base = format!(
            "cislunar-observability | {} s/c ({} refs) | {:.1} h arc, {} epochs | rank {} → {} \
             of {} over arc | Gramian λ [{:.2e}…{:.2e}] cond {} | instantaneous rank range-only \
             {} → range+rate {} ({} links) | GDOP range-only {} range+rate {} | DRO ICs (max \
             periodicity residual {:.1e}) | SRIF posterior finite at rank-4 epoch {} (Validated \
             rank/STM/DRO-closure/SRIF, Modelled design)",
            c.refs.len() + 1,
            c.refs.len(),
            c.arc_hours,
            c.rank_arc.len(),
            first.map(|p| p.rank).unwrap_or(0),
            last.map(|p| p.rank).unwrap_or(0),
            c.state_dim,
            c.spectrum.min_eigenvalue,
            c.spectrum.max_eigenvalue,
            condition_str(c.spectrum.condition),
            c.lever.rank_range_only,
            c.lever.rank_range_rate,
            c.lever.n_links,
            ro,
            rr,
            max_resid,
            srif_epoch,
        );
        if !c.extended {
            return base;
        }
        let hours = |i: usize| c.rank_arc[i].arc_time / tu_per_hour();
        let rank_thr = match first_full_rank(&c.rank_arc, c.state_dim) {
            Some(i) => format!("{:.3} h", hours(i)),
            None => format!("never (rank {} of {})", c.spectrum.rank, c.state_dim),
        };
        let est_thr = if c.sigma_range_nd > 0.0 {
            match (0..c.posterior_arc.len()).find(|&i| {
                c.posterior_arc[i]
                    .sigma_position_km
                    .is_some_and(|s| s <= c.sigma_pos_threshold_km)
            }) {
                Some(i) => format!("{:.3} h", hours(i)),
                None => "never".to_string(),
            }
        } else {
            "n/a (noise-free)".to_string()
        };
        format!(
            "{base} | {} family, {}-state, {} s/c, σ_range {:.3} m | rank threshold {} \
             (grid {:.3} h) | estimability threshold (σ_pos ≤ {:.3} km) {}",
            c.family.as_str(),
            c.state_dim,
            c.n_spacecraft,
            c.sigma_range_m,
            rank_thr,
            c.arc_hours / ((c.rank_arc.len().max(2) - 1) as f64),
            c.sigma_pos_threshold_km,
            est_thr,
        )
    }
}

/// The first index of `rank_arc` at which the observable rank reaches `state_dim`.
fn first_full_rank(rank_arc: &[RankArcPoint], state_dim: usize) -> Option<usize> {
    rank_arc.iter().position(|p| p.rank == state_dim)
}

/// A threshold report: the epoch a criterion is first met at, the arc length there, and the
/// **bracket** the epoch grid leaves it in — the true crossing lies in
/// `(bracket_low_hours, bracket_high_hours]`, never at a sharper resolution than the grid.
fn threshold_json(
    hit: Option<usize>,
    arc_hours_of: &dyn Fn(usize) -> f64,
    arc_tu_of: &dyn Fn(usize) -> f64,
    criterion: &str,
) -> serde_json::Value {
    match hit {
        Some(i) => serde_json::json!({
            "criterion": criterion,
            "reached": true,
            "epoch_index": i,
            "arc_hours": arc_hours_of(i),
            "arc_time_tu": arc_tu_of(i),
            "bracket_low_hours": if i == 0 { 0.0 } else { arc_hours_of(i - 1) },
            "bracket_high_hours": arc_hours_of(i),
        }),
        None => serde_json::json!({
            "criterion": criterion,
            "reached": false,
            "epoch_index": serde_json::Value::Null,
            "arc_hours": serde_json::Value::Null,
            "arc_time_tu": serde_json::Value::Null,
            "note": "the criterion is not met anywhere on this arc — no threshold exists here, \
                     and none is extrapolated",
        }),
    }
}

/// Attach the three-dimensional / noisy / family-parameterised extension blocks to the
/// released document. Called **only** when at least one of the extension fields is set away
/// from its default, so the released document is byte-for-byte untouched.
fn extend_document(mut doc: serde_json::Value, c: &Computed) -> serde_json::Value {
    let hours = |i: usize| c.rank_arc[i].arc_time / tu_per_hour();
    let tu = |i: usize| c.rank_arc[i].arc_time;
    let grid_hours = if c.rank_arc.len() > 1 {
        c.arc_hours / ((c.rank_arc.len() - 1) as f64)
    } else {
        c.arc_hours
    };

    // ── Criterion A: the rank threshold (the published criterion). ──
    let rank_hit = first_full_rank(&c.rank_arc, c.state_dim);
    let mut rank_criterion = threshold_json(
        rank_hit,
        &hours,
        &tu,
        "first arc length at which rank(O) = state_dim, with a direction counted when \
         σ_i > rel_tol·σ_max (the one P6 singular-value convention). This is the criterion the \
         published planar threshold was measured under. It is INVARIANT to a homoscedastic \
         measurement sigma: whitening multiplies O by the scalar 1/σ, leaving the relative \
         singular-value spectrum — hence rank, defect and condition — unchanged.",
    );
    {
        let o = rank_criterion
            .as_object_mut()
            .expect("rank criterion is an object");
        o.insert("state_dim".into(), c.state_dim.into());
        o.insert("rank_at_end".into(), c.spectrum.rank.into());
        o.insert("defect_at_end".into(), c.spectrum.defect.into());
        o.insert(
            "condition_at_end".into(),
            condition_json(c.spectrum.condition),
        );
    }

    // ── Criterion B: the estimability threshold (the noise-dependent one). ──
    let noisy = c.sigma_range_nd > 0.0;
    let sigma_km = |i: usize| c.posterior_arc.get(i).and_then(|p| p.sigma_position_km);
    let hit_at = |bound: f64| -> Option<usize> {
        (0..c.posterior_arc.len()).find(|&i| sigma_km(i).is_some_and(|s| s <= bound))
    };
    let est_criterion_text = format!(
        "first arc length at which the formal 1σ position uncertainty of the chief's INITIAL \
         state, σ_pos = sqrt(trace(P_rr)) with P = (ÕᵀÕ)⁻¹ and Õ the measurement-noise-whitened \
         observability matrix, falls to or below {:.6} km. This is the criterion under which an \
         arc-length threshold is noise-dependent at all: P scales as σ², so σ_pos scales as σ, \
         whereas the rank criterion above does not move with σ. The bound is a STATED engineering \
         choice, not a fitted one — estimability_sweep reports the threshold at four other bounds.",
        c.sigma_pos_threshold_km
    );
    let mut estimability = if noisy {
        threshold_json(
            hit_at(c.sigma_pos_threshold_km),
            &hours,
            &tu,
            &est_criterion_text,
        )
    } else {
        serde_json::json!({
            "criterion": est_criterion_text,
            "reached": false,
            "epoch_index": serde_json::Value::Null,
            "arc_hours": serde_json::Value::Null,
            "arc_time_tu": serde_json::Value::Null,
            "note": "sigma_range_m = 0: the run is noise-free, so no measurement covariance and \
                     no formal posterior uncertainty exist. The estimability criterion is \
                     undefined here rather than assigned a number.",
        })
    };
    {
        let o = estimability
            .as_object_mut()
            .expect("estimability criterion is an object");
        o.insert(
            "sigma_pos_threshold_km".into(),
            c.sigma_pos_threshold_km.into(),
        );
    }
    let sweep: Vec<serde_json::Value> = SIGMA_POS_SWEEP_KM
        .iter()
        .map(|&b| {
            let hit = if noisy { hit_at(b) } else { None };
            serde_json::json!({
                "sigma_pos_threshold_km": b,
                "reached": hit.is_some(),
                "epoch_index": hit.map(serde_json::Value::from).unwrap_or(serde_json::Value::Null),
                "arc_hours": hit.map(|i| serde_json::Value::from(hours(i))).unwrap_or(serde_json::Value::Null),
            })
        })
        .collect();

    // ── The posterior over the arc, and what stays unobservable at the end. ──
    let posterior: Vec<serde_json::Value> = c
        .posterior_arc
        .iter()
        .map(|p| {
            let mut row = serde_json::json!({
                "epoch_index": p.epoch_index,
                "arc_time_tu": p.arc_time,
                "arc_hours": p.arc_time / tu_per_hour(),
                "rank": p.post.rank,
                "defect": p.post.defect,
                "condition": condition_json(p.post.condition),
                "sigma_position_km": p.sigma_position_km,
                "sigma_velocity_mm_s": p.sigma_velocity_mm_s,
            });
            if let Some(reason) = &p.post.rank_limited_by {
                row.as_object_mut()
                    .expect("posterior row is an object")
                    .insert("rank_limited_by".into(), reason.as_str().into());
            }
            row
        })
        .collect();
    let last_post = c.posterior_arc.last();
    let basis: Vec<Vec<f64>> = last_post
        .map(|p| p.post.null_space.clone())
        .unwrap_or_default();
    let unobservable = serde_json::json!({
        "state_dim": c.state_dim,
        "rank": last_post.map(|p| p.post.rank).unwrap_or(0),
        "defect": last_post.map(|p| p.post.defect).unwrap_or(0),
        "basis": basis,
        "state_order": if c.spatial { "[x, y, z, xdot, ydot, zdot]" } else { "[x, y, xdot, ydot]" },
        "note": "Columns of `basis` are an orthonormal basis of the directions the whole arc \
                 leaves unobservable, in the rotating-frame state order named above. A wholly \
                 planar constellation estimating a six-state has defect 2 by construction: every \
                 coplanar range row has a zero out-of-plane column, and the CR3BP out-of-plane \
                 block decouples exactly at z = 0, so no arc length recovers z or zdot.",
    });

    // ── Unit and provenance class for every field the extension adds (R3). ──
    // Split across two `json!` invocations so the macro stays inside its expansion depth.
    let mut units = serde_json::json!({
        "state_dim": {"unit": "count", "provenance": "computed", "note": "4 planar, 6 spatial"},
        "n_spacecraft": {"unit": "count", "provenance": "input"},
        "measurement_noise.sigma_range_m": {"unit": "m", "provenance": "input", "note": "1-sigma inter-satellite range measurement noise"},
        "measurement_noise.sigma_range_nd": {"unit": "nondimensional length (Earth-Moon distances)", "provenance": "computed", "note": "sigma_range_m / 384400000 m"},
        "measurement_noise.whitening_scale": {"unit": "1/nondimensional length", "provenance": "computed", "note": "1/sigma_range_nd; every measurement Jacobian row is multiplied by it, which is what puts R = sigma^2 I into the Gramian"},
        "arc_threshold.epoch_grid_hours": {"unit": "h", "provenance": "computed", "note": "arc_hours/(epochs-1); no threshold is resolved finer than this"},
        "arc_threshold.rank_criterion.state_dim": {"unit": "count", "provenance": "computed"},
        "arc_threshold.rank_criterion.epoch_index": {"unit": "count (index)", "provenance": "computed"},
        "arc_threshold.rank_criterion.arc_hours": {"unit": "h", "provenance": "computed"},
        "arc_threshold.rank_criterion.arc_time_tu": {"unit": "rotating-frame time units", "provenance": "computed"},
        "arc_threshold.rank_criterion.bracket_low_hours": {"unit": "h", "provenance": "computed", "note": "last epoch NOT at full rank; the true crossing lies above this"},
        "arc_threshold.rank_criterion.bracket_high_hours": {"unit": "h", "provenance": "computed", "note": "first epoch at full rank; the true crossing lies at or below this"},
        "arc_threshold.rank_criterion.rank_at_end": {"unit": "count", "provenance": "computed"},
        "arc_threshold.rank_criterion.defect_at_end": {"unit": "count", "provenance": "computed"},
        "arc_threshold.rank_criterion.condition_at_end": {"unit": "ratio (dimensionless)", "provenance": "computed", "note": "lambda_max/lambda_min of the arc Gramian over the observable subspace; the string \"inf\" when singular"},
        "arc_threshold.estimability_criterion.sigma_pos_threshold_km": {"unit": "km", "provenance": "input"},
        "arc_threshold.estimability_criterion.epoch_index": {"unit": "count (index)", "provenance": "computed"},
        "arc_threshold.estimability_criterion.arc_hours": {"unit": "h", "provenance": "computed"},
        "arc_threshold.estimability_criterion.arc_time_tu": {"unit": "rotating-frame time units", "provenance": "computed"},
        "arc_threshold.estimability_criterion.bracket_low_hours": {"unit": "h", "provenance": "computed"},
        "arc_threshold.estimability_criterion.bracket_high_hours": {"unit": "h", "provenance": "computed"},
    });
    let units_rest = serde_json::json!({
        "arc_threshold.estimability_sweep[].sigma_pos_threshold_km": {"unit": "km", "provenance": "input"},
        "arc_threshold.estimability_sweep[].epoch_index": {"unit": "count (index)", "provenance": "computed"},
        "arc_threshold.estimability_sweep[].arc_hours": {"unit": "h", "provenance": "computed"},
        "posterior_vs_arc[].epoch_index": {"unit": "count (index)", "provenance": "computed"},
        "posterior_vs_arc[].arc_time_tu": {"unit": "rotating-frame time units", "provenance": "computed"},
        "posterior_vs_arc[].arc_hours": {"unit": "h", "provenance": "computed"},
        "posterior_vs_arc[].rank": {"unit": "count", "provenance": "computed"},
        "posterior_vs_arc[].defect": {"unit": "count", "provenance": "computed"},
        "posterior_vs_arc[].condition": {"unit": "ratio (dimensionless)", "provenance": "computed"},
        "posterior_vs_arc[].sigma_position_km": {"unit": "km", "provenance": "computed", "note": "sqrt(trace(P_rr)) of the whitened batch posterior; null when rank-deficient or noise-free"},
        "posterior_vs_arc[].sigma_velocity_mm_s": {"unit": "mm/s", "provenance": "computed", "note": "sqrt(trace(P_vv)) of the same posterior; null when rank-deficient or noise-free"},
        "gdop.range_only.rank": {"unit": "count", "provenance": "computed"},
        "gdop.range_only.defect": {"unit": "count", "provenance": "computed"},
        "gdop.range_rate.rank": {"unit": "count", "provenance": "computed", "note": "emitted by the undefined branch, which a six-state snapshot geometry falls into"},
        "gdop.range_rate.defect": {"unit": "count", "provenance": "computed", "note": "emitted by the undefined branch, which a six-state snapshot geometry falls into"},
        "unobservable_directions.state_dim": {"unit": "count", "provenance": "computed"},
        "unobservable_directions.rank": {"unit": "count", "provenance": "computed"},
        "unobservable_directions.defect": {"unit": "count", "provenance": "computed"},
        "unobservable_directions.basis[][]": {"unit": "fraction (dimensionless)", "provenance": "computed", "note": "orthonormal null-space basis vectors, one per column, in the state order named beside them"},
        "dro_provenance.members[].z_amplitude_nd": {"unit": "nondimensional length (Earth-Moon distances)", "provenance": "computed", "note": "peak out-of-plane excursion max|z| of the parent orbit; exactly 0 for the planar DRO family"},
        "dro_provenance.members[].jacobi_constant": {"unit": "nondimensional energy (CR3BP Jacobi constant)", "provenance": "computed"},
    });
    {
        let a = units.as_object_mut().expect("units is an object");
        for (k, v) in units_rest.as_object().expect("units is an object") {
            a.insert(k.clone(), v.clone());
        }
    }

    // The released `label` and the released `dro_provenance.note` both describe the planar
    // DRO run they were written for. They are byte-frozen on the default path (R1), so the
    // extension states plainly where they stop applying rather than leaving a stale claim.
    let extension_label = format!(
        "EXTENSION (R3) — this run is NOT the planar DRO configuration the `label` above \
         describes. State dimension {}; orbit family {}; {} spacecraft; range measurement \
         sigma {} m. Where `label` says \"planar\" and \"planar DROs\", read the family named \
         here. VALIDATED additions: the 6x6 variational STM is the same \
         finite-difference-validated CR3BP STM (crate::cr3bp) used at full width; the spatial \
         range / range-rate Jacobian rows are finite-difference-validated analytic partials, \
         the range-rate row cross-checked component-for-component against the crate's \
         independent 3-D deepspace_od::range_rate_observable; the halo / NRHO initial \
         conditions are differential-corrected periodic orbits from the same corrector that \
         reproduces the published L2 southern 9:2 NRHO, continued from that published seed, \
         and each member's closure residual is reported; the six-state RANK verdicts are \
         confirmed against an INDEPENDENT row-echelon rank (Gaussian elimination with partial \
         pivoting) that shares no code with the eigen/SVD route. HONEST SCOPE OF THE SRIF \
         LEG: the SRIF cross-validation above consumes the SAME measurement Jacobians and \
         reduces to the same O^T O, so its agreement is a consistency check between two \
         numerical machines, NOT independent corroboration of the threshold — it is not \
         counted as validation of any figure here. MODELLED: the family design (which \
         abscissae, amplitudes and phases), the epoch grid, the single-link arc, and the \
         stated position bound of the estimability criterion.",
        c.state_dim,
        c.family.as_str(),
        c.n_spacecraft,
        c.sigma_range_m,
    );
    if let Some(prov) = doc
        .get_mut("dro_provenance")
        .and_then(|p| p.as_object_mut())
    {
        prov.insert(
            "note".into(),
            format!(
                "Validated: each constellation initial condition is a differential-corrected \
                 periodic orbit of the {} family, closing over one period to the reported \
                 periodicity residual (planar DROs are additionally retrograde about the Moon). \
                 The family is corrected at the Earth-Moon mass ratio. Modelled: the choice of \
                 family parameters and phases (the constellation design). The key name \
                 `dro_provenance` is retained for the released document schema; it carries \
                 whichever family this run asked for.",
                c.family.as_str()
            )
            .into(),
        );
    }

    let obj = doc.as_object_mut().expect("the report is an object");
    obj.insert("extension_label".into(), extension_label.into());
    obj.insert("spatial".into(), c.spatial.into());
    obj.insert("family".into(), c.family.as_str().into());
    obj.insert("n_spacecraft".into(), c.n_spacecraft.into());
    obj.insert(
        "measurement_noise".into(),
        serde_json::json!({
            "sigma_range_m": c.sigma_range_m,
            "sigma_range_nd": c.sigma_range_nd,
            "whitening_scale": c.whitening_scale,
            "note": "Validated: measurement noise enters by WHITENING — with R = sigma^2 I the \
                     batch information is the unit-weight Gram of the rows H/sigma. Reported \
                     honestly: a homoscedastic sigma is a scalar multiple of O, so the observable \
                     RANK, the datum defect and the CONDITION NUMBER are invariant under it. What \
                     noise moves is the formal posterior covariance P = sigma^2 (O^T O)^-1, hence \
                     the estimability threshold, not the rank threshold.",
        }),
    );
    obj.insert(
        "arc_threshold".into(),
        serde_json::json!({
            "epoch_grid_hours": grid_hours,
            "rank_criterion": rank_criterion,
            "estimability_criterion": estimability,
            "estimability_sweep": sweep,
            "note": "Two criteria, both reported. The rank criterion is the published one and is \
                     noise-invariant by construction; the estimability criterion is the \
                     noise-dependent one. Neither is resolved finer than epoch_grid_hours, so each \
                     threshold is reported with the grid bracket it actually sits in.",
        }),
    );
    obj.insert("posterior_vs_arc".into(), posterior.into());
    obj.insert("unobservable_directions".into(), unobservable);
    obj.insert("units".into(), units);
    doc
}

fn condition_json(condition: f64) -> serde_json::Value {
    if condition.is_finite() {
        serde_json::Value::from(condition)
    } else {
        serde_json::Value::from("inf")
    }
}

fn condition_str(condition: f64) -> String {
    if condition.is_finite() {
        format!("{condition:.2e}")
    } else {
        "inf".to_string()
    }
}

fn gdop_json(g: &CislunarGdop) -> serde_json::Value {
    match g {
        CislunarGdop::Defined { gdop, rank } => serde_json::json!({
            "status": "defined",
            "gdop": gdop,
            "rank": rank,
        }),
        CislunarGdop::Undefined {
            rank,
            defect,
            reason,
        } => serde_json::json!({
            "status": "undefined",
            "rank": rank,
            "defect": defect,
            "reason": reason,
        }),
    }
}

/// Deterministic two-panel SVG: rank vs arc length (left) and the Gramian eigenvalue
/// spectrum as log-scaled bars (right). Fixed-precision formatting so no last-ULP jitter
/// can fork the bytes across platforms.
fn svg(c: &Computed) -> String {
    let (w, h) = (900.0_f64, 420.0_f64);
    let mut s = String::new();
    s.push_str(&format!(
        "<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"{w:.0}\" height=\"{h:.0}\" \
         font-family=\"sans-serif\" font-size=\"12\" fill=\"#bcb3a3\">"
    ));
    s.push_str(&format!(
        "<rect width=\"{w:.0}\" height=\"{h:.0}\" fill=\"#0c0b08\"/>"
    ));
    s.push_str(
        "<text x=\"24\" y=\"24\" font-size=\"15\" font-weight=\"bold\">Cislunar observability over a tracking arc (P6)</text>",
    );
    s.push_str(
        "<text x=\"24\" y=\"40\" font-size=\"11\" fill=\"#8a8172\">rank-vs-arc (range-only single link) · Gramian eigen-spectrum · differential-corrected DRO ICs + SRIF cross-check · MODELLED design, VALIDATED rank/STM/closure</text>",
    );

    // ── Left panel: rank vs arc length ──
    let (lx, ly, lw, lh) = (60.0_f64, 70.0_f64, 360.0_f64, 300.0_f64);
    let axis_y = ly + lh;
    s.push_str(&format!(
        "<text x=\"{lx:.0}\" y=\"{:.0}\" font-size=\"12\" fill=\"#8a8172\">observable rank vs arc length</text>",
        ly - 8.0
    ));
    s.push_str(&format!(
        "<line x1=\"{lx:.0}\" y1=\"{ly:.0}\" x2=\"{lx:.0}\" y2=\"{axis_y:.0}\" stroke=\"#342c21\"/>"
    ));
    s.push_str(&format!(
        "<line x1=\"{lx:.0}\" y1=\"{axis_y:.0}\" x2=\"{:.0}\" y2=\"{axis_y:.0}\" stroke=\"#342c21\"/>",
        lx + lw
    ));
    let rmax = c.state_dim as f64;
    let yof = |r: f64| axis_y - (r / rmax) * lh;
    for g in 0..=c.state_dim {
        let gy = yof(g as f64);
        s.push_str(&format!(
            "<line x1=\"{lx:.0}\" y1=\"{gy:.1}\" x2=\"{:.0}\" y2=\"{gy:.1}\" stroke=\"#241d15\" stroke-dasharray=\"3 4\"/>",
            lx + lw
        ));
        s.push_str(&format!(
            "<text x=\"{:.0}\" y=\"{:.1}\" text-anchor=\"end\" fill=\"#6b6355\">{g}</text>",
            lx - 6.0,
            gy + 4.0
        ));
    }
    let arc_max = c
        .rank_arc
        .last()
        .map(|p| p.arc_time)
        .unwrap_or(1.0)
        .max(1e-12);
    let xof = |t: f64| lx + (t / arc_max) * lw;
    let mut pts = String::new();
    for p in &c.rank_arc {
        pts.push_str(&format!(
            "{:.1},{:.1} ",
            xof(p.arc_time),
            yof(p.rank as f64)
        ));
    }
    s.push_str(&format!(
        "<polyline fill=\"none\" stroke=\"#d2925e\" stroke-width=\"2\" points=\"{}\"/>",
        pts.trim_end()
    ));
    for p in &c.rank_arc {
        s.push_str(&format!(
            "<circle cx=\"{:.1}\" cy=\"{:.1}\" r=\"2.4\" fill=\"#e0bd84\"/>",
            xof(p.arc_time),
            yof(p.rank as f64)
        ));
    }
    s.push_str(&format!(
        "<text x=\"{:.0}\" y=\"{:.0}\" text-anchor=\"middle\" fill=\"#8a8172\">arc length (rotating-frame time units, {:.1} h total)</text>",
        lx + lw / 2.0,
        axis_y + 26.0,
        c.arc_hours
    ));

    // ── Right panel: Gramian eigenvalue bars (log10) ──
    let (rx, ryy, rw, rh) = (520.0_f64, 70.0_f64, 340.0_f64, 300.0_f64);
    let raxis_y = ryy + rh;
    s.push_str(&format!(
        "<text x=\"{rx:.0}\" y=\"{:.0}\" font-size=\"12\" fill=\"#8a8172\">Gramian eigenvalues (log10)</text>",
        ryy - 8.0
    ));
    s.push_str(&format!(
        "<line x1=\"{rx:.0}\" y1=\"{ryy:.0}\" x2=\"{rx:.0}\" y2=\"{raxis_y:.0}\" stroke=\"#342c21\"/>"
    ));
    s.push_str(&format!(
        "<line x1=\"{rx:.0}\" y1=\"{raxis_y:.0}\" x2=\"{:.0}\" y2=\"{raxis_y:.0}\" stroke=\"#342c21\"/>",
        rx + rw
    ));
    let logs: Vec<f64> = c
        .spectrum
        .eigenvalues
        .iter()
        .map(|&l| if l > 0.0 { l.log10() } else { -30.0 })
        .collect();
    let lmin = logs.iter().cloned().fold(f64::INFINITY, f64::min);
    let lmax = logs.iter().cloned().fold(f64::NEG_INFINITY, f64::max);
    let span = (lmax - lmin).max(1.0);
    let base = lmin - 0.5;
    let neig = logs.len().max(1) as f64;
    let slot = rw / neig;
    let bw = slot * 0.6;
    for (i, &lg) in logs.iter().enumerate() {
        let frac = ((lg - base) / (span + 0.5)).clamp(0.02, 1.0);
        let bh = frac * rh;
        let bx = rx + slot * (i as f64 + 0.5) - bw / 2.0;
        let by = raxis_y - bh;
        s.push_str(&format!(
            "<rect x=\"{bx:.1}\" y=\"{by:.1}\" width=\"{bw:.1}\" height=\"{bh:.1}\" fill=\"#5fb0c9\"/>"
        ));
        s.push_str(&format!(
            "<text x=\"{:.1}\" y=\"{:.1}\" text-anchor=\"middle\" font-size=\"10\" fill=\"#e6ddcb\">{:.1}</text>",
            rx + slot * (i as f64 + 0.5),
            by - 4.0,
            lg
        ));
        s.push_str(&format!(
            "<text x=\"{:.1}\" y=\"{:.1}\" text-anchor=\"middle\" font-size=\"10\">λ{}</text>",
            rx + slot * (i as f64 + 0.5),
            raxis_y + 16.0,
            i + 1
        ));
    }
    s.push_str(&format!(
        "<text x=\"{:.0}\" y=\"{:.0}\" text-anchor=\"middle\" fill=\"#8a8172\">condition κ = {}</text>",
        rx + rw / 2.0,
        raxis_y + 34.0,
        condition_str(c.spectrum.condition)
    ));
    s.push_str("</svg>");
    s
}

#[cfg(test)]
mod tests {
    use super::*;
    use serde_json::Value;

    #[test]
    fn default_scenario_runs_and_is_modelled() {
        let (json, summary, svg) = CislunarObservabilityScenario::default()
            .run_output()
            .unwrap();
        let v: Value = serde_json::from_str(&json).unwrap();
        assert_eq!(v["kind"], "cislunar-observability");
        assert!(v["label"].as_str().unwrap().contains("MODELLED"));
        assert!(v["label"].as_str().unwrap().contains("VALIDATED"));
        assert_eq!(v["state_dim"], N_PLANAR);
        assert!(summary.contains("cislunar-observability"));
        assert!(svg.starts_with("<svg") && svg.ends_with("</svg>"));
    }

    #[test]
    fn rank_grows_from_one_to_full_over_the_arc() {
        let (json, _s, _svg) = CislunarObservabilityScenario::default()
            .run_output()
            .unwrap();
        let v: Value = serde_json::from_str(&json).unwrap();
        let table = v["rank_vs_arc"].as_array().unwrap();
        // A single instantaneous range snapshot is rank-1.
        assert_eq!(table[0]["rank"].as_u64().unwrap(), 1);
        // Rank is non-decreasing and reaches the full four-state by the end of the arc.
        let ranks: Vec<u64> = table.iter().map(|p| p["rank"].as_u64().unwrap()).collect();
        for w in ranks.windows(2) {
            assert!(w[1] >= w[0], "rank must not decrease: {ranks:?}");
        }
        assert_eq!(
            *ranks.last().unwrap(),
            N_PLANAR as u64,
            "full observability: {ranks:?}"
        );
    }

    #[test]
    fn range_rate_lever_lifts_instantaneous_rank() {
        let (json, _s, _svg) = CislunarObservabilityScenario::default()
            .run_output()
            .unwrap();
        let v: Value = serde_json::from_str(&json).unwrap();
        let ro = v["range_rate_lever"]["rank_range_only"].as_u64().unwrap();
        let rr = v["range_rate_lever"]["rank_range_rate"].as_u64().unwrap();
        assert!(rr > ro, "range+rate rank {rr} must exceed range-only {ro}");
    }

    #[test]
    fn range_only_snapshot_gdop_is_undefined() {
        let (json, _s, _svg) = CislunarObservabilityScenario::default()
            .run_output()
            .unwrap();
        let v: Value = serde_json::from_str(&json).unwrap();
        assert_eq!(v["gdop"]["range_only"]["status"], "undefined");
        // Range + range-rate spans the full state → a finite GDOP.
        assert_eq!(v["gdop"]["range_rate"]["status"], "defined");
    }

    #[test]
    fn gramian_spectrum_is_symmetric_and_reported() {
        let (json, _s, _svg) = CislunarObservabilityScenario::default()
            .run_output()
            .unwrap();
        let v: Value = serde_json::from_str(&json).unwrap();
        let eig = v["gramian_spectrum"]["eigenvalues_ascending"]
            .as_array()
            .unwrap();
        assert_eq!(eig.len(), N_PLANAR);
        // Ascending and non-negative (a symmetric PSD Gramian).
        let vals: Vec<f64> = eig.iter().map(|x| x.as_f64().unwrap()).collect();
        for w in vals.windows(2) {
            assert!(
                w[1] >= w[0] - 1e-15,
                "eigenvalues must be ascending: {vals:?}"
            );
        }
        assert!(vals[0] >= -1e-12);
    }

    #[test]
    fn is_deterministic() {
        let scn = CislunarObservabilityScenario::default();
        assert_eq!(scn.run_output().unwrap(), scn.run_output().unwrap());
    }

    #[test]
    fn seed_states_seam_returns_four_planar_states() {
        // The DRO-seeder seam: four planar [x,y,vx,vy] states, chief first.
        let states = CislunarObservabilityScenario::default().seed_states();
        assert_eq!(states.len(), 4);
        for s in &states {
            assert_eq!(s.len(), 4);
        }
    }

    #[test]
    fn seed_states_are_differential_corrected_closing_dros() {
        // Provenance: every constellation member is a corrected planar DRO that closes to the
        // tight periodicity residual (Validated) and is retrograde.
        let (json, _s, _svg) = CislunarObservabilityScenario::default()
            .run_output()
            .unwrap();
        let v: Value = serde_json::from_str(&json).unwrap();
        let members = v["dro_provenance"]["members"].as_array().unwrap();
        assert_eq!(members.len(), 4);
        for (i, m) in members.iter().enumerate() {
            let resid = m["periodicity_residual"].as_f64().unwrap();
            assert!(
                resid < 1e-8,
                "member {i} periodicity residual {resid:.3e} exceeds 1e-8"
            );
            let peri = m["perilune_km"].as_f64().unwrap();
            assert!(
                (10_000.0..=50_000.0).contains(&peri),
                "member {i} perilune {peri:.0} km outside the DRO band"
            );
        }
        assert_eq!(members[0]["role"], "chief");
    }

    #[test]
    fn srif_cross_validation_transitions_at_full_rank() {
        // The independent SRIF posterior turns finite exactly at the rank-4 arc, and its
        // condition tracks the Gramian conditioning there.
        let (json, summary, _svg) = CislunarObservabilityScenario::default()
            .run_output()
            .unwrap();
        let v: Value = serde_json::from_str(&json).unwrap();
        let arc = v["srif_cross_validation"]["arc"].as_array().unwrap();
        // First arc snapshot: rank-deficient ⇒ SRIF posterior not well-posed.
        assert!(!arc[0]["srif_posterior_wellposed"].as_bool().unwrap());
        // The last arc reaches full observable rank and a well-posed SRIF posterior.
        let last = arc.last().unwrap();
        assert_eq!(last["observable_rank"].as_u64().unwrap(), N_PLANAR as u64);
        assert!(last["srif_posterior_wellposed"].as_bool().unwrap());
        // At full rank both conditions are finite numbers (not "inf") and the same order.
        let gc = last["gramian_condition"].as_f64().unwrap();
        let sc = last["srif_condition"].as_f64().unwrap();
        assert!(gc.is_finite() && sc.is_finite());
        let ratio = sc / gc;
        assert!((0.1..=10.0).contains(&ratio), "cond ratio {ratio:.3e}");
        // The transition epoch is reported and the summary advertises the cross-check.
        assert!(v["srif_cross_validation"]["full_rank_transition_epoch"].is_number());
        assert!(summary.contains("SRIF posterior finite"));
    }

    /// FNV-1a 64 of a byte string — the additivity pin's hash.
    fn fnv1a64(s: &str) -> u64 {
        let mut h: u64 = 0xcbf2_9ce4_8422_2325;
        for b in s.as_bytes() {
            h ^= *b as u64;
            h = h.wrapping_mul(0x0000_0100_0000_01b3);
        }
        h
    }

    /// Re-emit the three additivity pins below — run with
    /// `--ignored --nocapture` after a deliberate change to the released document.
    #[test]
    #[ignore]
    fn zzz_emit_default_document_pins() {
        let (j, s, g) = CislunarObservabilityScenario::default()
            .run_output()
            .unwrap();
        println!("json    = 0x{:016x}", fnv1a64(&j));
        println!("summary = 0x{:016x}", fnv1a64(&s));
        println!("svg     = 0x{:016x}", fnv1a64(&g));
    }

    /// **R1 additivity pin.** With every extension field at its default the scenario emits
    /// the released document BYTE FOR BYTE — the three artifacts are hashed, not merely
    /// spot-checked — and setting each extension field explicitly to its default value
    /// changes nothing either.
    ///
    /// PIN-SCOPE:    all three released artifacts of the default `cislunar-observability`
    ///               run — result JSON, summary and SVG — byte for byte.
    /// PIN-EXCLUDES: nothing — the whole document, deliberately. A cross-cutting change
    ///               that appends a block to every scenario document is IN scope and must
    ///               re-baseline these three with `zzz_emit_default_document_pins`.
    #[test]
    fn default_document_is_bit_for_bit_the_released_one() {
        let (json, summary, svg) = CislunarObservabilityScenario::default()
            .run_output()
            .unwrap();
        assert_eq!(
            fnv1a64(&json),
            0x2207_bc72_0606_2c80,
            "released result-JSON byte drift"
        );
        assert_eq!(
            fnv1a64(&summary),
            0x7030_ab72_7e57_edbc,
            "released summary byte drift"
        );
        assert_eq!(
            fnv1a64(&svg),
            0xf75e_0fa5_ef14_755c,
            "released SVG byte drift"
        );

        // Every extension field named at its released default is a no-op.
        let explicit = CislunarObservabilityScenario {
            spatial: Some(false),
            sigma_range_m: Some(0.0),
            family: Some("dro".to_string()),
            n_spacecraft: Some(4),
            ..Default::default()
        };
        let (j2, s2, g2) = explicit.run_output().unwrap();
        assert_eq!(j2, json, "explicit defaults changed the document");
        assert_eq!(s2, summary);
        assert_eq!(g2, svg);
        // The extension blocks are absent from the released document.
        let v: Value = serde_json::from_str(&json).unwrap();
        for k in [
            "spatial",
            "family",
            "extension_label",
            "n_spacecraft",
            "measurement_noise",
            "arc_threshold",
            "posterior_vs_arc",
            "unobservable_directions",
            "units",
        ] {
            assert!(v.get(k).is_none(), "released document gained a `{k}` field");
        }
        // …and every released field is still present, unremoved.
        for k in [
            "kind",
            "label",
            "mu",
            "arc_hours",
            "arc_time_tu",
            "rel_tol",
            "state_dim",
            "chief_state",
            "reference_states",
            "dro_provenance",
            "rank_vs_arc",
            "rank_vs_arc_note",
            "gramian_spectrum",
            "range_rate_lever",
            "gdop",
            "srif_cross_validation",
        ] {
            assert!(v.get(k).is_some(), "released field `{k}` disappeared");
        }
    }

    /// Emitter for the three-dimensional / noisy / family sweep the R3 report quotes — run
    /// with `--ignored --nocapture --release` (the differential correctors are not cheap in
    /// a debug build). Prints, per configuration: the rank-criterion threshold and its grid
    /// bracket, the rank progression, the arc Gramian's rank / defect / condition /
    /// eigen-spectrum, the surviving unobservable directions, and the estimability threshold
    /// at each measurement sigma and each position bound.
    #[test]
    #[ignore]
    fn zzz_emit_threshold_sweep() {
        let configs: [(&str, bool, f64, usize); 5] = [
            ("dro", false, 6.0, 24),   // the published grid
            ("dro", false, 12.0, 145), // a 5-minute grid
            ("dro", true, 72.0, 865),
            ("halo", true, 72.0, 865),
            ("nrho", true, 72.0, 865),
        ];
        for (family, spatial, arc_hours, epochs) in configs {
            let head = format!(
                "{family}/{} arc {arc_hours} h, {epochs} epochs",
                if spatial { "spatial" } else { "planar" }
            );
            // Noise-free leg: the rank criterion.
            let scn = CislunarObservabilityScenario {
                arc_hours: Some(arc_hours),
                epochs: Some(epochs),
                spatial: Some(spatial),
                family: Some(family.to_string()),
                sigma_range_m: Some(0.0),
                sigma_pos_threshold_km: Some(1.0),
                ..Default::default()
            };
            let (json, summary, _g) = scn.run_output().expect("run");
            let v: Value = serde_json::from_str(&json).unwrap();
            let rc = v["arc_threshold"]["rank_criterion"].clone();
            let gs = &v["gramian_spectrum"];
            let mut steps = Vec::new();
            let mut cur = 0u64;
            for p in v["rank_vs_arc"].as_array().unwrap() {
                let r = p["rank"].as_u64().unwrap();
                if r > cur {
                    cur = r;
                    steps.push(format!("{r}@{:.4}h", p["arc_hours"].as_f64().unwrap()));
                }
            }
            println!("\n=== {head} ===");
            println!("  summary: {summary}");
            println!(
                "  grid {:.4} h | rank {} def {} | Gramian cond {} | lambda {}",
                v["arc_threshold"]["epoch_grid_hours"].as_f64().unwrap(),
                gs["rank"],
                gs["defect"],
                gs["condition"],
                gs["eigenvalues_ascending"]
            );
            println!(
                "  RANK THRESHOLD: {} (bracket {} .. {})",
                rc["arc_hours"], rc["bracket_low_hours"], rc["bracket_high_hours"]
            );
            println!("  rank steps: {}", steps.join(" "));
            println!(
                "  unobservable ({}): {}",
                v["unobservable_directions"]["defect"], v["unobservable_directions"]["basis"]
            );
            // Noisy legs: the estimability criterion.
            for sigma in [0.1_f64, 1.0, 10.0, 100.0] {
                let scn = CislunarObservabilityScenario {
                    arc_hours: Some(arc_hours),
                    epochs: Some(epochs),
                    spatial: Some(spatial),
                    family: Some(family.to_string()),
                    sigma_range_m: Some(sigma),
                    sigma_pos_threshold_km: Some(1.0),
                    ..Default::default()
                };
                let (json, _s, _g) = scn.run_output().expect("run");
                let v: Value = serde_json::from_str(&json).unwrap();
                let sweep: Vec<String> = v["arc_threshold"]["estimability_sweep"]
                    .as_array()
                    .unwrap()
                    .iter()
                    .map(|e| {
                        format!(
                            "{}km:{}",
                            e["sigma_pos_threshold_km"].as_f64().unwrap(),
                            match e["arc_hours"].as_f64() {
                                Some(h) => format!("{h:.4}h"),
                                None => "never".to_string(),
                            }
                        )
                    })
                    .collect();
                let last = v["posterior_vs_arc"].as_array().unwrap().last().unwrap();
                let at_rank_thr = match rc["epoch_index"].as_u64() {
                    Some(i) => v["posterior_vs_arc"][i as usize]["sigma_position_km"].to_string(),
                    None => "n/a".to_string(),
                };
                println!(
                    "  sigma {sigma:>7.1} m | sigma_pos@rank-thr {at_rank_thr} km | end sigma_pos {} km, sigma_vel {} mm/s | sweep {}",
                    last["sigma_position_km"],
                    last["sigma_velocity_mm_s"],
                    sweep.join(" ")
                );
            }
        }
        // Family provenance, once per family.
        for family in ["dro", "halo", "nrho"] {
            let scn = CislunarObservabilityScenario {
                spatial: Some(true),
                family: Some(family.to_string()),
                sigma_range_m: Some(1.0),
                ..Default::default()
            };
            let (json, _s, _g) = scn.run_output().unwrap();
            let v: Value = serde_json::from_str(&json).unwrap();
            for m in v["dro_provenance"]["members"].as_array().unwrap() {
                println!(
                    "PROV {family:<5} {:<12} perilune {:>10.1} km  period {:.5} tu  |z|max {:.5}  resid {:.3e}  C {:.6}",
                    m["role"].as_str().unwrap(),
                    m["perilune_km"].as_f64().unwrap(),
                    m["period_tu"].as_f64().unwrap(),
                    m["z_amplitude_nd"].as_f64().unwrap(),
                    m["periodicity_residual"].as_f64().unwrap(),
                    m["jacobi_constant"].as_f64().unwrap(),
                );
            }
        }
    }

    // ── The three-dimensional / noisy / family-parameterised path (R3) ───────

    /// A spatial scenario at the given family and measurement sigma, on a grid of
    /// `per_hour` epochs per hour. The tests use a half-hourly grid so a debug build stays
    /// quick; the five-minute numbers the R3 report quotes come from
    /// `zzz_emit_threshold_sweep`.
    fn spatial_run_grid(family: &str, arc_hours: f64, per_hour: f64, sigma_range_m: f64) -> Value {
        let epochs = ((arc_hours * per_hour) as usize) + 1;
        let scn = CislunarObservabilityScenario {
            arc_hours: Some(arc_hours),
            epochs: Some(epochs),
            spatial: Some(true),
            family: Some(family.to_string()),
            sigma_range_m: Some(sigma_range_m),
            sigma_pos_threshold_km: Some(1.0),
            ..Default::default()
        };
        let (json, _s, _g) = scn.run_output().expect("spatial run");
        serde_json::from_str(&json).expect("valid JSON")
    }

    /// [`spatial_run_grid`] on the half-hourly grid.
    fn spatial_run(family: &str, arc_hours: f64, sigma_range_m: f64) -> Value {
        spatial_run_grid(family, arc_hours, 2.0, sigma_range_m)
    }

    /// INDEPENDENT RANK ORACLE. Row-echelon rank by Gaussian elimination with partial
    /// pivoting — a completely different algorithm from the Jacobi-eigen / singular-value
    /// route the report reads its rank from, and one that shares no code with it. Used to
    /// confirm the six-state rank verdicts rather than re-deriving them through the same
    /// machinery (the SRIF cross-check consumes the SAME Jacobians and the SAME `OᵀO`, so it
    /// is a consistency check, not a second opinion on rank).
    #[allow(clippy::needless_range_loop)] // dense elimination: explicit (col, r, c) indexing
    fn rank_by_elimination(rows: &[Vec<f64>], tol: f64) -> usize {
        let mut a: Vec<Vec<f64>> = rows.to_vec();
        if a.is_empty() {
            return 0;
        }
        let n = a[0].len();
        // Scale-free tolerance: relative to the largest entry of the matrix.
        let amax = a
            .iter()
            .flat_map(|r| r.iter())
            .fold(0.0_f64, |m, v| m.max(v.abs()));
        if amax == 0.0 {
            return 0;
        }
        let thr = tol * amax;
        let mut rank = 0usize;
        let mut row = 0usize;
        for col in 0..n {
            let mut piv = row;
            let mut best = 0.0_f64;
            for (r, ar) in a.iter().enumerate().skip(row) {
                if ar[col].abs() > best {
                    best = ar[col].abs();
                    piv = r;
                }
            }
            if best <= thr {
                continue;
            }
            a.swap(piv, row);
            let pivot = a[row][col];
            for r in (row + 1)..a.len() {
                let f = a[r][col] / pivot;
                if f != 0.0 {
                    for c in col..n {
                        a[r][c] -= f * a[row][c];
                    }
                }
            }
            rank += 1;
            row += 1;
            if row == a.len() {
                break;
            }
        }
        rank
    }

    /// The **planar DRO family cannot make a six-state observable, at any arc length.**
    /// Every range row between two coplanar spacecraft has a zero out-of-plane column and
    /// the CR3BP out-of-plane block decouples exactly at `z = 0`, so the datum defect is
    /// exactly 2 and its null space is exactly the `z` and `ż` coordinate axes — an
    /// analytically known answer, so this is a closed-form oracle, not a self-check.
    #[test]
    fn spatial_planar_family_is_structurally_rank_deficient_at_any_arc() {
        for arc in [6.0_f64, 72.0] {
            let v = spatial_run("dro", arc, 0.0);
            assert_eq!(v["state_dim"], 6);
            let ud = &v["unobservable_directions"];
            assert_eq!(ud["rank"], 4, "arc {arc} h");
            assert_eq!(ud["defect"], 2, "arc {arc} h");
            // No threshold is reported, and none is extrapolated.
            let rc = &v["arc_threshold"]["rank_criterion"];
            assert_eq!(rc["reached"], false);
            assert!(rc["arc_hours"].is_null());
            // The null space is exactly span{e_z, e_zdot}: rows 2 and 5 carry the unit
            // entries and every other entry is zero.
            let basis = ud["basis"].as_array().unwrap();
            assert_eq!(basis.len(), 6);
            for (i, row) in basis.iter().enumerate() {
                let r: Vec<f64> = row
                    .as_array()
                    .unwrap()
                    .iter()
                    .map(|x| x.as_f64().unwrap())
                    .collect();
                assert_eq!(r.len(), 2);
                let norm = r[0].hypot(r[1]);
                if i == 2 || i == 5 {
                    assert!(
                        (norm - 1.0).abs() < 1e-12,
                        "row {i} of the null basis should be a unit out-of-plane axis, got {r:?}"
                    );
                } else {
                    assert!(
                        norm < 1e-12,
                        "row {i} of the null basis should be zero, got {r:?}"
                    );
                }
            }
        }
    }

    /// The genuinely three-dimensional families DO reach the full six-state — at an arc an
    /// order of magnitude longer than the planar four-state threshold. The rank verdict is
    /// confirmed by an INDEPENDENT row-echelon rank (Gaussian elimination), not by the
    /// eigen/SVD route that produced it.
    #[test]
    fn out_of_plane_families_reach_full_six_state_rank_much_later() {
        for family in ["halo", "nrho"] {
            let v = spatial_run(family, 72.0, 0.0);
            let rc = &v["arc_threshold"]["rank_criterion"];
            assert_eq!(rc["reached"], true, "{family} never reached full rank");
            let thr = rc["arc_hours"].as_f64().unwrap();
            assert!(
                thr > 10.0,
                "{family} six-state threshold {thr:.3} h is implausibly short"
            );
            assert_eq!(v["unobservable_directions"]["defect"], 0);
            assert_eq!(rc["rank_at_end"], 6);
            // The bracket is honest: the grid cannot resolve finer than one epoch.
            let lo = rc["bracket_low_hours"].as_f64().unwrap();
            let grid = v["arc_threshold"]["epoch_grid_hours"].as_f64().unwrap();
            assert!(
                (thr - lo - grid).abs() < 1e-9,
                "bracket is not one grid step"
            );
        }
    }

    /// INDEPENDENT ORACLE for the rank verdicts: a row-echelon rank of the same stacked
    /// observability matrix, by Gaussian elimination with partial pivoting, agrees with the
    /// reported singular-value rank — a different algorithm, not the same `OᵀO` read twice.
    #[test]
    fn six_state_rank_agrees_with_an_independent_row_echelon_rank() {
        let mu = EARTH_MOON_MU;
        for (family, arc_hours, want) in [("dro", 72.0, 4usize), ("nrho", 30.0, 6)] {
            let members = family_members(OrbitFamily::parse(family).unwrap(), mu, 4).unwrap();
            let n_epochs = 120usize;
            let arc_tu = arc_hours * tu_per_hour();
            let mut epochs: Vec<ObsEpoch> = Vec::with_capacity(n_epochs);
            let mut prev = 0.0;
            for k in 0..n_epochs {
                let t = arc_tu * (k as f64) / ((n_epochs - 1) as f64);
                let (cs, phi) =
                    crate::observability_gramian::spatial_state_stm(&members[0].state, mu, t, 2000);
                let rs =
                    crate::observability_gramian::spatial_propagate(&members[1].state, mu, t, 2000);
                let (_rho, row) = range_row_spatial(&cs, &rs);
                epochs.push(ObsEpoch {
                    h: vec![row.to_vec()],
                    phi: phi.iter().map(|r| r.to_vec()).collect(),
                    dt: t - prev,
                });
                prev = t;
            }
            let (o, _w) = observability_matrix(&epochs);
            let svd_rank = observable_rank(&o, 1e-6);
            let elim_rank = rank_by_elimination(&o, 1e-6);
            assert_eq!(
                svd_rank, elim_rank,
                "{family}: singular-value rank {svd_rank} vs independent row-echelon rank \
                 {elim_rank}"
            );
            assert_eq!(svd_rank, want, "{family} rank over a {arc_hours} h arc");
        }
    }

    /// **The rank-based arc-length threshold does not move with measurement noise.** A
    /// homoscedastic sigma whitens the observability matrix by a scalar, so the relative
    /// singular-value spectrum — hence the rank, the defect and the condition number — is
    /// unchanged. Reported rather than glossed: nothing here is tuned to make it so.
    #[test]
    fn rank_threshold_is_invariant_to_measurement_noise() {
        let mut seen: Option<(Value, Value, Value)> = None;
        for sigma in [0.0_f64, 0.1, 1.0, 10.0, 100.0] {
            let v = spatial_run("nrho", 30.0, sigma);
            let rc = &v["arc_threshold"]["rank_criterion"];
            let key = (
                rc["epoch_index"].clone(),
                rc["arc_hours"].clone(),
                rc["rank_at_end"].clone(),
            );
            match &seen {
                None => seen = Some(key),
                Some(prev) => assert_eq!(
                    *prev, key,
                    "the rank threshold moved with measurement sigma {sigma}"
                ),
            }
        }
        assert!(seen.is_some());
    }

    /// **The estimability threshold DOES move with measurement noise** — it is the criterion
    /// under which an arc-length threshold is noise-dependent at all. The posterior position
    /// sigma scales exactly linearly with the measurement sigma, so a decade of noise pushes
    /// the arc out monotonically.
    #[test]
    fn estimability_threshold_grows_monotonically_with_measurement_noise() {
        let mut last_hours = 0.0_f64;
        let mut last_sigma_pos: Option<f64> = None;
        for sigma in [0.1_f64, 1.0, 10.0] {
            let v = spatial_run("nrho", 54.0, sigma);
            let ec = &v["arc_threshold"]["estimability_criterion"];
            assert_eq!(ec["reached"], true, "σ = {sigma} m never reached the bound");
            let h = ec["arc_hours"].as_f64().unwrap();
            assert!(
                h > last_hours,
                "σ = {sigma} m threshold {h:.4} h did not exceed the previous {last_hours:.4} h"
            );
            last_hours = h;
            // P = σ²(OᵀO)⁻¹, so the posterior σ at a fixed arc is exactly ×10 per decade.
            let end = v["posterior_vs_arc"].as_array().unwrap().last().unwrap();
            let sp = end["sigma_position_km"].as_f64().unwrap();
            if let Some(prev) = last_sigma_pos {
                assert!(
                    ((sp / prev) - 10.0).abs() < 1e-6,
                    "posterior σ_pos ratio {} is not 10 for a decade of measurement σ",
                    sp / prev
                );
            }
            last_sigma_pos = Some(sp);
        }
        // A noise-free run has NO estimability threshold — null with a reason, never a
        // fabricated number.
        let free = spatial_run("nrho", 30.0, 0.0);
        let ec = &free["arc_threshold"]["estimability_criterion"];
        assert_eq!(ec["reached"], false);
        assert!(ec["arc_hours"].is_null());
        assert!(ec["note"].as_str().unwrap().contains("noise-free"));
    }

    /// **The noise-free spatial case reduces to the planar result on the shared subspace.**
    /// With the same planar DRO constellation, the spatial six-state run reaches rank 4 at
    /// exactly the arc the planar four-state run reaches full rank at — the six-state read
    /// is the four-state read plus two directions it can never see, not a different answer
    /// to the same question.
    #[test]
    fn spatial_noise_free_reduces_to_the_planar_threshold_on_the_shared_subspace() {
        let arc_hours = 6.0;
        let epochs = 13;
        let planar = {
            let scn = CislunarObservabilityScenario {
                arc_hours: Some(arc_hours),
                epochs: Some(epochs),
                n_spacecraft: Some(4),
                sigma_pos_threshold_km: Some(1.0),
                ..Default::default()
            };
            let (json, _s, _g) = scn.run_output().unwrap();
            serde_json::from_str::<Value>(&json).unwrap()
        };
        let spatial = spatial_run_grid("dro", arc_hours, 2.0, 0.0);
        let planar_thr = planar["arc_threshold"]["rank_criterion"]["arc_hours"]
            .as_f64()
            .unwrap();
        // The arc at which the SPATIAL run first reaches rank 4 (its ceiling).
        let spatial_rank4 = spatial["rank_vs_arc"]
            .as_array()
            .unwrap()
            .iter()
            .find(|p| p["rank"].as_u64().unwrap() == 4)
            .map(|p| p["arc_hours"].as_f64().unwrap())
            .expect("the spatial run should reach rank 4");
        assert!(
            (planar_thr - spatial_rank4).abs() < 1e-12,
            "planar full-rank arc {planar_thr} vs spatial rank-4 arc {spatial_rank4}"
        );
        // …and the whole rank progression coincides up to the planar ceiling.
        let pr: Vec<u64> = planar["rank_vs_arc"]
            .as_array()
            .unwrap()
            .iter()
            .map(|p| p["rank"].as_u64().unwrap())
            .collect();
        let sr: Vec<u64> = spatial["rank_vs_arc"]
            .as_array()
            .unwrap()
            .iter()
            .map(|p| p["rank"].as_u64().unwrap())
            .collect();
        assert_eq!(pr, sr, "planar and spatial rank progressions diverge");
    }

    /// Collect the dotted paths of every numeric leaf of a JSON document (`[]` marks an
    /// array level), so the extension's new numeric fields can be diffed against the
    /// released ones.
    fn numeric_paths(v: &Value, prefix: &str, out: &mut std::collections::BTreeSet<String>) {
        match v {
            Value::Object(m) => {
                for (k, val) in m {
                    let p = if prefix.is_empty() {
                        k.clone()
                    } else {
                        format!("{prefix}.{k}")
                    };
                    numeric_paths(val, &p, out);
                }
            }
            Value::Array(a) => {
                let p = format!("{prefix}[]");
                for e in a {
                    numeric_paths(e, &p, out);
                }
            }
            Value::Number(_) => {
                out.insert(prefix.to_string());
            }
            _ => {}
        }
    }

    /// **R3.** Every numeric field the extension adds beyond the released document carries
    /// both a unit and a provenance class, and the units block describes nothing that is not
    /// emitted. The new fields are found by DIFFING the numeric-leaf paths of the extended
    /// document against the released one, so a field added later without a unit fails here
    /// without anyone having to remember to list it.
    #[test]
    fn every_new_reported_figure_carries_a_unit_and_a_provenance_class() {
        let (released, _s, _g) = CislunarObservabilityScenario::default()
            .run_output()
            .unwrap();
        let released: Value = serde_json::from_str(&released).unwrap();
        let mut base = std::collections::BTreeSet::new();
        numeric_paths(&released, "", &mut base);

        // Two configurations so the union covers both the rank-deficient branch (a null
        // space, no finite posterior) and the full-rank noisy branch (thresholds reached).
        let docs = [spatial_run("dro", 6.0, 1.0), spatial_run("nrho", 54.0, 0.1)];
        let mut ext = std::collections::BTreeSet::new();
        for d in &docs {
            numeric_paths(d, "", &mut ext);
        }
        let units = docs[1]["units"].as_object().expect("a units block");
        assert!(!units.is_empty());
        for (field, meta) in units {
            assert!(meta["unit"].is_string(), "{field} has no unit");
            assert!(
                meta["provenance"].is_string(),
                "{field} has no provenance class"
            );
        }
        let described: std::collections::BTreeSet<&str> =
            units.keys().map(|k| k.as_str()).collect();
        for path in ext.difference(&base) {
            assert!(
                described.contains(path.as_str()),
                "numeric field `{path}` is new in the extended document but has no unit / \
                 provenance entry"
            );
        }
        // Nothing is documented that is never emitted.
        for d in &described {
            assert!(
                ext.contains(*d),
                "units documents `{d}`, which the report never emits"
            );
        }
    }

    /// The constellation provenance covers whichever family was asked for, and the
    /// out-of-plane families really are out of plane.
    #[test]
    fn family_provenance_is_reported_and_out_of_plane_families_are_out_of_plane() {
        for (family, min_z, peri_band) in [
            ("dro", 0.0_f64, (10_000.0_f64, 50_000.0_f64)),
            ("halo", 0.05, (10_000.0, 40_000.0)),
            ("nrho", 0.05, (2_000.0, 8_000.0)),
        ] {
            let v = spatial_run(family, 6.0, 1.0);
            assert_eq!(v["family"], family);
            assert_eq!(v["spatial"], true);
            assert_eq!(v["n_spacecraft"], 4);
            // The released `label` describes the planar DRO run; the extension says plainly
            // where it stops applying and refuses to count the SRIF leg as corroboration.
            let ext = v["extension_label"].as_str().unwrap();
            assert!(ext.contains(&format!("orbit family {family}")), "{ext}");
            assert!(ext.contains("NOT independent corroboration"), "{ext}");
            assert!(ext.contains("row-echelon rank"), "{ext}");
            let members = v["dro_provenance"]["members"].as_array().unwrap();
            assert_eq!(members.len(), 4);
            let note = v["dro_provenance"]["note"].as_str().unwrap();
            assert!(note.contains(&format!("{family} family")), "{note}");
            for (i, m) in members.iter().enumerate() {
                assert_eq!(m["family"], family);
                let z = m["z_amplitude_nd"].as_f64().unwrap();
                if family == "dro" {
                    assert_eq!(z, 0.0, "a DRO must be exactly planar");
                } else {
                    assert!(z > min_z, "{family} member {i} amplitude {z} is too planar");
                }
                let peri = m["perilune_km"].as_f64().unwrap();
                assert!(
                    (peri_band.0..=peri_band.1).contains(&peri),
                    "{family} member {i} perilune {peri:.0} km outside its band"
                );
                // Every member is a genuinely closing periodic orbit.
                let resid = m["periodicity_residual"].as_f64().unwrap();
                assert!(
                    resid < 1e-4,
                    "{family} member {i} closure residual {resid:.3e}"
                );
                assert!(m["jacobi_constant"].as_f64().unwrap().is_finite());
            }
        }
    }

    /// The scenario's own perilune sweep agrees with the crate's independent
    /// [`crate::cr3bp::PeriodicOrbit::perilune_radius_km`] — a different sampling scheme on
    /// the same corrected orbit.
    #[test]
    fn family_perilune_agrees_with_the_crate_perilune_oracle() {
        let mu = EARTH_MOON_MU;
        let guess = Cr3bpState {
            r: [NRHO_X0[0], 0.0, NRHO_SEED.0],
            v: [0.0, NRHO_SEED.1, 0.0],
        };
        let orbit = differential_correct_halo(&guess, mu, 1e-11, 80).expect("NRHO corrects");
        let (mine, _z, _r) = sweep_orbit(&orbit.ic, mu, orbit.period, 720);
        let theirs = orbit.perilune_radius_km(mu, 400);
        let rel = (mine - theirs).abs() / theirs;
        assert!(
            rel < 0.02,
            "perilune {mine:.1} km vs crate oracle {theirs:.1} km (relative {rel:.3e})"
        );
    }

    #[test]
    fn extended_run_is_deterministic() {
        let scn = CislunarObservabilityScenario {
            spatial: Some(true),
            family: Some("halo".to_string()),
            sigma_range_m: Some(1.0),
            arc_hours: Some(8.0),
            epochs: Some(12),
            ..Default::default()
        };
        assert_eq!(scn.run_output().unwrap(), scn.run_output().unwrap());
    }

    #[test]
    fn rejects_bad_extension_inputs() {
        let bad_family = CislunarObservabilityScenario {
            family: Some("lyapunov".to_string()),
            ..Default::default()
        };
        assert!(bad_family.run_output().is_err());
        // An out-of-plane family has no planar representation and must not be silently
        // flattened into one.
        let planar_halo = CislunarObservabilityScenario {
            family: Some("halo".to_string()),
            spatial: Some(false),
            ..Default::default()
        };
        let e = planar_halo.run_output().unwrap_err();
        assert!(e.contains("spatial = true"), "{e}");
        for n in [0usize, 1, MAX_SPACECRAFT + 1] {
            let scn = CislunarObservabilityScenario {
                n_spacecraft: Some(n),
                ..Default::default()
            };
            assert!(scn.run_output().is_err(), "n_spacecraft = {n} was accepted");
        }
        let neg = CislunarObservabilityScenario {
            sigma_range_m: Some(-1.0),
            ..Default::default()
        };
        assert!(neg.run_output().is_err());
        let bad_bound = CislunarObservabilityScenario {
            sigma_pos_threshold_km: Some(0.0),
            ..Default::default()
        };
        assert!(bad_bound.run_output().is_err());
    }

    /// A larger constellation still seeds, and the seam that exposes the six-states works.
    #[test]
    fn spacecraft_count_is_parameterised() {
        let scn = CislunarObservabilityScenario {
            n_spacecraft: Some(6),
            ..Default::default()
        };
        let states = scn.seed_states_spatial().unwrap();
        assert_eq!(states.len(), 6);
        let (json, _s, _g) = scn.run_output().unwrap();
        let v: Value = serde_json::from_str(&json).unwrap();
        assert_eq!(v["n_spacecraft"], 6);
        assert_eq!(v["dro_provenance"]["members"].as_array().unwrap().len(), 6);
        assert_eq!(v["range_rate_lever"]["n_links"], 5);
    }

    #[test]
    fn rejects_degenerate_arc() {
        let scn = CislunarObservabilityScenario {
            arc_hours: Some(0.0),
            ..Default::default()
        };
        assert!(scn.run_output().is_err());
        let scn = CislunarObservabilityScenario {
            epochs: Some(1),
            ..Default::default()
        };
        assert!(scn.run_output().is_err());
    }

    /// The rank read never reports more observable directions than the arc has measurement
    /// rows — on the published planar grid, at every tolerance including the ones far below
    /// the f64 rank-read noise floor where the raw singular-value count used to run past the
    /// matrix shape (epoch 1 reported rank 3 from 2 rows at rel_tol 1e-12; the whitened leg
    /// reported rank 2 from 1 row from rel_tol 1e-9 down).
    #[test]
    fn no_arc_prefix_reports_more_rank_than_it_has_rows() {
        for (rel_tol, sigma_range_m) in [
            (1e-6_f64, 0.0_f64),
            (1e-9, 0.0),
            (1e-12, 0.0),
            (1e-9, 1.0),
            (1e-10, 1.0),
            (1e-12, 1.0),
        ] {
            let scn = CislunarObservabilityScenario {
                arc_hours: Some(6.0),
                epochs: Some(24),
                rel_tol: Some(rel_tol),
                sigma_range_m: Some(sigma_range_m),
                ..Default::default()
            };
            let (json, _s, _g) = scn.run_output().expect("the published grid runs");
            let v: Value = serde_json::from_str(&json).unwrap();
            for row in v["rank_vs_arc"].as_array().expect("rank table") {
                let rows = row["n_rows"].as_u64().expect("n_rows");
                let rank = row["rank"].as_u64().expect("rank");
                assert!(
                    rank <= rows.min(N_PLANAR as u64),
                    "rel_tol {rel_tol:e}, sigma {sigma_range_m} m, epoch {}: rank {rank} from \
                     {rows} measurement rows is not a rank",
                    row["epoch_index"]
                );
            }
            // A tolerance below the noise floor is named in the document rather than being
            // quietly re-floored; at 1e-6 there is nothing to say.
            let note = v.get("rank_tolerance_note");
            if rel_tol < 1e-8 {
                assert!(
                    note.is_some(),
                    "rel_tol {rel_tol:e} must be reported as sub-floor"
                );
            } else {
                assert!(note.is_none(), "rel_tol {rel_tol:e} needs no note");
            }
        }
    }

    /// The measured reproduction, pinned: at `rel_tol = 1e-12` on the published noise-free
    /// grid the raw singular-value count at epoch 1 is 3 from two measurement rows, and the
    /// emitted rank is 2 with the clamp stated.
    #[test]
    fn the_sub_floor_rank_inflation_is_clamped_and_named() {
        let scn = CislunarObservabilityScenario {
            arc_hours: Some(6.0),
            epochs: Some(24),
            rel_tol: Some(1e-12),
            ..Default::default()
        };
        let (json, _s, _g) = scn.run_output().expect("the published grid runs");
        let v: Value = serde_json::from_str(&json).unwrap();
        let row = &v["rank_vs_arc"][1];
        assert_eq!(row["n_rows"], 2);
        assert_eq!(row["rank"], 2);
        let reason = row["rank_limited_by"]
            .as_str()
            .expect("the clamped row states its reason");
        assert!(
            reason.contains("count 3") && reason.contains("min(2, 4) = 2"),
            "reason: {reason}"
        );
    }
}
