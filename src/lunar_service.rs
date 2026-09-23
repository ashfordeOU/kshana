// SPDX-License-Identifier: AGPL-3.0-only
//! Lunar navigation **service-volume** analysis: DOP / coverage / availability and
//! generalised lunar ARAIM protection levels over a lunar surface region, from a
//! Moonlight / LCNS-class lunar-orbit constellation.
//!
//! This module *composes* three already-built pieces rather than reinventing any of
//! them:
//!
//! * [`crate::orbit::dop`] — the **VALIDATED** (vs gnss_lib_py) DOP kernel. It takes a
//!   user position and a slice of satellite positions in any consistent Cartesian
//!   frame and returns `(gdop, pdop, hdop, vdop, tdop)`. We pass Moon-fixed (MCMF)
//!   positions, exactly as [`crate::lunar::lunar_site_dop`] already does — the lunar
//!   `spherical_enu` and the orbit `enu_basis` agree (both radial-up, `+z`-seeded
//!   East), so the horizontal/vertical split is correct.
//! * [`crate::lunar`] — the LunaNet LNIS lunar ARAIM machinery
//!   ([`crate::lunar::lunar_araim`], the σ_URE ≈ 30 m + `P_sat` ≈ 1e-4 budget, the
//!   MCI↔MCMF reduction, selenographic coordinates) and the south-pole protection-level
//!   pass it is checked against.
//! * [`crate::lunar::relay_position_mci`] — the circular-Keplerian lunar-orbit
//!   propagator (mean motion from [`crate::lunar::MOON_GM_M3_S2`]).
//!
//! Honest scope (the moat): the constellation parameters are **illustrative,
//! public-source approximations** of public descriptions of the system *class* — they
//! are **not** the real Moonlight/LCNS ephemeris and imply **no** affiliation,
//! endorsement, heritage, certification or TRL. The DOP geometry is validated by reuse
//! of the gnss_lib_py-checked kernel; the coverage/availability/integrity **composition**
//! is **MODELLED**: a circular-Keplerian relay set (not the differential-corrected
//! elliptical-frozen LCNS orbits or a 9:2 NRHO), a mean-rotation Moon (no physical
//! libration / precessing pole), and LunaNet LNIS integrity parameters from published
//! material. It demonstrates the lunar service-volume *method*, not an operational
//! Moonlight availability number.
//!
//! ## Public sources for the illustrative constellation
//!
//! Public ESA material describes Lunar Communications and Navigation Services (LCNS) /
//! Moonlight as a small constellation (≈ 4 satellites in the first phase) on
//! **elliptical lunar frozen orbits** chosen to favour **south-pole** coverage (the
//! Artemis target region), with apolune over the south. The defaults below place 4
//! satellites on an inclined, eccentric, ~12 h-class lunar orbit with apolune toward
//! the southern hemisphere — an *approximation* of that public description, used only as
//! an illustrative geometry. Sources (public, for the system class only): ESA Moonlight
//! / LCNS public material; NASA/ESA LunaNet Interoperability Specification (LNIS).

use crate::lunar::{
    mci_to_mcmf, selenographic_to_mcmf, Selenographic, LUNAR_SIGMA_URE_M, MOON_GM_M3_S2, R_MOON_M,
};
use crate::orbit::Dop;
use crate::raim::IntegrityBudget;
use serde::{Deserialize, Serialize};

type Vec3 = [f64; 3];

fn dot(a: Vec3, b: Vec3) -> f64 {
    a[0] * b[0] + a[1] * b[1] + a[2] * b[2]
}

// ---------------------------------------------------------------------------
// Illustrative Moonlight / LCNS-class constellation
// ---------------------------------------------------------------------------

/// One illustrative lunar-orbit satellite in classical-element form, propagated in the
/// Moon-centred inertial (MCI) frame at the Keplerian mean motion for
/// [`crate::lunar::MOON_GM_M3_S2`]. An *elliptical* generalisation of
/// [`crate::lunar::LunarRelay`] (which is circular): with `eccentricity = 0` and
/// `argp_deg = 0` the two reduce to the same orbit.
#[derive(Clone, Copy, Debug, PartialEq)]
pub struct LunarSat {
    /// Semi-major axis (m).
    pub sma_m: f64,
    /// Eccentricity (0 = circular).
    pub eccentricity: f64,
    /// Inclination (deg).
    pub inc_deg: f64,
    /// Right ascension of the ascending node (deg).
    pub raan_deg: f64,
    /// Argument of perilune (deg).
    pub argp_deg: f64,
    /// Mean anomaly at epoch (deg).
    pub mean_anom_deg: f64,
}

impl LunarSat {
    /// MCI position (m) at `t_s` seconds past epoch. Solves Kepler's equation for the
    /// eccentric then true anomaly, forms the perifocal position and rotates it by the
    /// 3-1-3 (RAAN, inclination, argument-of-perilune) sequence — the same convention as
    /// [`crate::lunar::relay_position_mci`], generalised to non-zero eccentricity.
    pub fn position_mci(&self, t_s: f64) -> Vec3 {
        let n = (MOON_GM_M3_S2 / self.sma_m.powi(3)).sqrt();
        let e = self.eccentricity;
        let m = self.mean_anom_deg.to_radians() + n * t_s;
        // Kepler's equation M = E − e sin E by Newton-Raphson (exact for e = 0).
        let mut ea = m;
        if e != 0.0 {
            for _ in 0..40 {
                let d = (ea - e * ea.sin() - m) / (1.0 - e * ea.cos());
                ea -= d;
                if d.abs() < 1e-13 {
                    break;
                }
            }
        }
        let r = self.sma_m * (1.0 - e * ea.cos());
        let nu =
            2.0 * ((1.0 + e).sqrt() * (ea * 0.5).sin()).atan2((1.0 - e).sqrt() * (ea * 0.5).cos());
        let u = self.argp_deg.to_radians() + nu;
        let (su, cu) = u.sin_cos();
        let (si, ci) = self.inc_deg.to_radians().sin_cos();
        let (sraan, craan) = self.raan_deg.to_radians().sin_cos();
        [
            r * (craan * cu - sraan * ci * su),
            r * (sraan * cu + craan * ci * su),
            r * (si * su),
        ]
    }
}

/// An **illustrative, public-source** Moonlight / LCNS-class lunar navigation
/// constellation. Not affiliated with, endorsed by, or representative of the real
/// system; the parameters approximate *public* descriptions of the system class and are
/// used only to exercise the service-volume method. See the module docs for sources.
#[derive(Clone, Debug, PartialEq)]
pub struct LunarConstellation {
    /// The satellites making up this constellation, in generation order.
    pub sats: Vec<LunarSat>,
}

impl LunarConstellation {
    /// Build a constellation from an explicit satellite set.
    pub fn new(sats: Vec<LunarSat>) -> Self {
        Self { sats }
    }

    /// The default illustrative LCNS-class constellation: `n` satellites (clamped to
    /// `[1, 24]`, default-call uses 4) phased evenly in mean anomaly on a shared
    /// inclined, eccentric, south-favouring elliptical lunar orbit. The orbit
    /// (`sma ≈ R_moon + 8000 km`, `e = 0.6`, `i = 57.7°`, `argp = 90°`) places apolune
    /// over the southern hemisphere so a south-pole user sees the satellites dwelling
    /// high — an *approximation* of the public "elliptical lunar frozen orbit favouring
    /// the south pole" description. **Illustrative; public-source; not affiliated with
    /// ESA.**
    pub fn illustrative_lcns(n: usize) -> Self {
        let n = n.clamp(1, 24);
        // ~8000 km perilune altitude → high apolune; a ~12 h-class period.
        let sma_m = R_MOON_M + 8_000_000.0;
        let sats = (0..n)
            .map(|k| LunarSat {
                sma_m,
                eccentricity: 0.6,
                inc_deg: 57.7,
                // Spread the planes a little so the geometry is not degenerate.
                raan_deg: 360.0 * (k as f64) / (n as f64),
                argp_deg: 90.0, // apolune over the south
                mean_anom_deg: 360.0 * (k as f64) / (n as f64),
            })
            .collect();
        Self { sats }
    }

    /// Number of satellites.
    pub fn n_sats(&self) -> usize {
        self.sats.len()
    }

    /// MCI positions of every satellite at `t_s` seconds past epoch.
    pub fn positions_mci(&self, t_s: f64) -> Vec<Vec3> {
        self.sats.iter().map(|s| s.position_mci(t_s)).collect()
    }

    /// MCMF (Moon-fixed) positions of every satellite at `t_s`: each is propagated in
    /// MCI then reduced to MCMF with [`crate::lunar::mci_to_mcmf`] so a rotating surface
    /// user and the satellites share one frame (mixing MCI satellites with an MCMF user
    /// rotates the geometry wrongly over a pass — always reduce first).
    pub fn positions_mcmf(&self, t_s: f64) -> Vec<Vec3> {
        self.sats
            .iter()
            .map(|s| mci_to_mcmf(s.position_mci(t_s), t_s))
            .collect()
    }
}

impl Default for LunarConstellation {
    fn default() -> Self {
        Self::illustrative_lcns(4)
    }
}

// ---------------------------------------------------------------------------
// Visibility, DOP, coverage, protection level
// ---------------------------------------------------------------------------

/// Line-of-sight unit vectors from a lunar surface user (MCMF) to the satellites
/// (MCMF) that clear the elevation mask. Elevation is measured above the **local
/// horizon**, whose normal is the surface-normal `up = user / |user|` (the geocentric
/// radial), so a satellite is visible iff the cosine of the LOS against `up` exceeds
/// `sin(mask)` — equivalently the LOS elevation `≥ elev_mask`. For a surface user this
/// `elevation ≥ mask ≥ 0` test already excludes satellites behind the Moon's own limb
/// (a satellite below the local horizon is occulted by the body), matching
/// [`crate::lunar::lunar_visible`].
///
/// Returns the **LOS unit vectors** (one per visible satellite). The DOP kernel only
/// needs the LOS directions, but it is called with full positions elsewhere; for callers
/// that want positions use [`visible_sat_positions`].
pub fn visible_sats(user_mcmf: Vec3, sats_mcmf: &[Vec3], elev_mask_rad: f64) -> Vec<Vec3> {
    let up = unit_or_zero(user_mcmf);
    let sin_mask = elev_mask_rad.sin();
    let mut out = Vec::new();
    for &s in sats_mcmf {
        let d = [
            s[0] - user_mcmf[0],
            s[1] - user_mcmf[1],
            s[2] - user_mcmf[2],
        ];
        let n = (d[0] * d[0] + d[1] * d[1] + d[2] * d[2]).sqrt();
        if n == 0.0 {
            continue;
        }
        let e = [d[0] / n, d[1] / n, d[2] / n];
        // sin(elevation) = e · up.
        if dot(e, up) >= sin_mask {
            out.push(e);
        }
    }
    out
}

/// The **positions** (MCMF) of the satellites visible above the mask — the same
/// visibility test as [`visible_sats`] but returning positions for downstream DOP /
/// ARAIM calls (both of which take full positions and recompute the LOS internally).
pub fn visible_sat_positions(user_mcmf: Vec3, sats_mcmf: &[Vec3], elev_mask_rad: f64) -> Vec<Vec3> {
    let up = unit_or_zero(user_mcmf);
    let sin_mask = elev_mask_rad.sin();
    sats_mcmf
        .iter()
        .copied()
        .filter(|&s| {
            let d = [
                s[0] - user_mcmf[0],
                s[1] - user_mcmf[1],
                s[2] - user_mcmf[2],
            ];
            let n = (d[0] * d[0] + d[1] * d[1] + d[2] * d[2]).sqrt();
            n > 0.0 && {
                let e = [d[0] / n, d[1] / n, d[2] / n];
                dot(e, up) >= sin_mask
            }
        })
        .collect()
}

fn unit_or_zero(v: Vec3) -> Vec3 {
    let n = (v[0] * v[0] + v[1] * v[1] + v[2] * v[2]).sqrt();
    if n == 0.0 {
        [0.0, 0.0, 0.0]
    } else {
        [v[0] / n, v[1] / n, v[2] / n]
    }
}

/// Topocentric look angles and slant range from a lunar surface user to one satellite.
///
/// Returns `(azimuth_deg, elevation_deg, range_m)` in the user's local east-north-up
/// frame, with azimuth measured clockwise from north in `[0, 360)`. Elevation is
/// negative for a satellite below the local horizon, so the caller applies its own
/// mask; this function does not filter.
///
/// The per-satellite slant range is what a link budget needs and what the aggregate
/// coverage/DOP summary discards, so this is the geometry a joint communications and
/// navigation analysis has to see. Pure geometry: deterministic, no randomness.
pub fn topocentric(user_mcmf: Vec3, sat_mcmf: Vec3) -> (f64, f64, f64) {
    fn cross3(a: Vec3, b: Vec3) -> Vec3 {
        [
            a[1] * b[2] - a[2] * b[1],
            a[2] * b[0] - a[0] * b[2],
            a[0] * b[1] - a[1] * b[0],
        ]
    }
    fn norm3(v: Vec3) -> f64 {
        dot(v, v).sqrt()
    }
    let up = unit_or_zero(user_mcmf);
    // Local east/north from the body spin axis. At a pole the east direction is
    // degenerate; fall back to the x axis so azimuth stays finite there.
    let mut east = cross3([0.0, 0.0, 1.0], up);
    if norm3(east) < 1e-12 {
        east = [1.0, 0.0, 0.0];
    } else {
        east = unit_or_zero(east);
    }
    let north = unit_or_zero(cross3(up, east));
    let d = [
        sat_mcmf[0] - user_mcmf[0],
        sat_mcmf[1] - user_mcmf[1],
        sat_mcmf[2] - user_mcmf[2],
    ];
    let rng = norm3(d);
    if rng < 1e-9 {
        return (0.0, 90.0, 0.0);
    }
    let e = unit_or_zero(d);
    let sin_el = dot(e, up).clamp(-1.0, 1.0);
    let el_deg = sin_el.asin().to_degrees();
    let az_deg = {
        let a = dot(e, east).atan2(dot(e, north)).to_degrees();
        if a < 0.0 {
            a + 360.0
        } else {
            a
        }
    };
    (az_deg, el_deg, rng)
}

/// Off-boresight angle (rad) at a **nadir-pointing** satellite, between its boresight
/// (the direction from the satellite to the centre of the Moon) and the line of sight to
/// a surface user. Both vectors are Moon-centred Moon-fixed (MCMF); the result is in
/// `[0, π]`.
///
/// This is the angle the transmit antenna pattern
/// ([`crate::antenna::pattern_gain_dbi`]) is a function of, and it is the one look angle
/// the topocentric triple cannot give: azimuth and elevation are measured at the *user*,
/// while the pattern is evaluated at the *satellite*. Zero at the sub-satellite point, and
/// `asin(R/r)` at the limb for a satellite at Moon-centred radius `r` — both pinned by
/// test against elementary triangle trigonometry, which is a different expression from the
/// dot product used here.
///
/// Degenerate inputs (a satellite at the Moon's centre, or coincident with the user)
/// return `0.0` rather than a NaN, so a sweep cannot be poisoned by one bad sample.
pub fn nadir_off_boresight_rad(sat_mcmf: Vec3, user_mcmf: Vec3) -> f64 {
    let boresight = unit_or_zero([-sat_mcmf[0], -sat_mcmf[1], -sat_mcmf[2]]);
    let los = unit_or_zero([
        user_mcmf[0] - sat_mcmf[0],
        user_mcmf[1] - sat_mcmf[1],
        user_mcmf[2] - sat_mcmf[2],
    ]);
    // `unit_or_zero` returns the zero vector for a degenerate input, and the zero vector
    // has zero self-dot — so this catches both degeneracies without touching the
    // perpendicular case, where the boresight dot is zero but the vectors are unit.
    if dot(boresight, boresight) == 0.0 || dot(los, los) == 0.0 {
        return 0.0;
    }
    dot(boresight, los).clamp(-1.0, 1.0).acos()
}

/// One per-satellite geometry sample at one epoch for one site.
#[derive(Clone, Debug, Serialize)]
pub struct GeometrySample {
    /// Seconds from scenario epoch.
    pub t_s: f64,
    /// Satellite index within the constellation.
    pub sat: usize,
    /// Azimuth from the site, degrees clockwise from local north, in `[0, 360)`.
    /// MODELLED: the geometry is the illustrative constellation, not a flown ephemeris.
    pub az_deg: f64,
    /// Elevation above the site's local horizon plane, degrees, in `[-90, 90]`.
    pub el_deg: f64,
    /// Slant range from the site to the satellite, kilometres — the quantity a link
    /// budget consumes, which the aggregate coverage summary collapses away.
    pub range_km: f64,
    /// Whether this satellite clears the scenario elevation mask at this epoch.
    pub visible: bool,
    /// Off-boresight angle at the satellite (deg) between its nadir boresight and the
    /// line of sight to the site — [`nadir_off_boresight_rad`] in degrees. Present only
    /// when `export_antenna` is configured; pure geometry, independent of the antenna.
    #[serde(skip_serializing_if = "Option::is_none")]
    pub off_boresight_deg: Option<f64>,
    /// Transmit-antenna gain toward the site (dBi) from the **real** aperture pattern,
    /// [`crate::antenna::pattern_gain_dbi`] at `off_boresight_deg`. Present only when
    /// `export_antenna` is configured.
    #[serde(skip_serializing_if = "Option::is_none")]
    pub pattern_gain_dbi: Option<f64>,
    /// Whether the site lies inside the satellite's half-power beam under the **real**
    /// pattern: `pattern_gain_dbi ≥ boresight_gain_dbi − 10·log₁₀(2)`
    /// ([`crate::antenna::within_half_power_beam`]).
    #[serde(skip_serializing_if = "Option::is_none")]
    pub in_beam_pattern: Option<bool>,
    /// Whether the site lies inside the satellite's half-power beam under the
    /// **symmetric approximation**: `off_boresight_deg ≤ ½·√(31000/G_lin)`
    /// ([`crate::antenna::symmetric_beamwidth_rad`]). Emitted beside, never in place of,
    /// `in_beam_pattern`.
    #[serde(skip_serializing_if = "Option::is_none")]
    pub in_beam_symmetric: Option<bool>,
}

/// Dilution of precision at a lunar surface user from the visible satellites — a thin
/// reuse of the **VALIDATED** [`crate::orbit::dop`] kernel. Filters by the elevation
/// mask, then passes the visible **positions** straight to the kernel (DOP is
/// frame-agnostic; MCMF is consistent). `None` if fewer than four satellites are
/// visible or the geometry is singular.
pub fn service_dop(user_mcmf: Vec3, sats_mcmf: &[Vec3], elev_mask_rad: f64) -> Option<Dop> {
    let vis = visible_sat_positions(user_mcmf, sats_mcmf, elev_mask_rad);
    crate::orbit::dop(user_mcmf, &vis)
}

/// Coverage / availability statistics over a service volume (a set of surface points ×
/// a set of epochs).
#[derive(Clone, Copy, Debug, PartialEq, Serialize)]
pub struct CoverageStats {
    /// Number of (point, epoch) samples evaluated.
    pub n_samples: usize,
    /// Samples with ≥ 4 visible satellites.
    pub n_four_plus: usize,
    /// Samples with ≥ 4 visible AND PDOP < threshold (the availability numerator).
    pub n_available: usize,
    /// Fraction of samples with ≥ 4 satellites and PDOP < threshold.
    pub coverage_fraction: f64,
    /// Minimum number of visible satellites seen across all samples.
    pub min_sats: usize,
    /// Maximum number of visible satellites seen across all samples.
    pub max_sats: usize,
    /// Minimum PDOP over the samples that had a defined PDOP (≥ 4 sats).
    pub pdop_min: Option<f64>,
    /// Mean PDOP over the samples that had a defined PDOP.
    pub pdop_mean: Option<f64>,
    /// Maximum PDOP over the samples that had a defined PDOP.
    pub pdop_max: Option<f64>,
    /// Median GDOP over the samples that had a defined DOP (≥ 4 sats) — an order
    /// statistic robust to the heavy tail of a sparse polar constellation, where the
    /// mean is dominated by a few near-singular epochs. `None` if no sample had a
    /// defined DOP.
    pub gdop_median: Option<f64>,
    /// Fraction of ALL (point, epoch) samples whose GDOP was defined and below 6 (the
    /// usable-geometry threshold) — the "time below GDOP 6" figure of the service.
    pub frac_below_gdop6: f64,
}

/// The one operation the coverage / DOP sweep needs from a constellation: place every
/// satellite in the Moon-fixed (MCMF) frame at an epoch. Implemented by both the idealized
/// Keplerian [`LunarConstellation`] and the perturbed
/// [`crate::lunar_perturbed::PerturbedConstellation`] (J2 + C22 + Earth/Sun third body), so the
/// identical service-volume sweep runs against either geometry.
pub trait PositionsMcmf {
    /// MCMF (Moon-fixed) positions (m) of every satellite at `t_s` seconds past epoch.
    fn positions_mcmf(&self, t_s: f64) -> Vec<Vec3>;
}

impl PositionsMcmf for LunarConstellation {
    fn positions_mcmf(&self, t_s: f64) -> Vec<Vec3> {
        // Inherent method (chosen over the trait method by Rust's resolution) — no recursion.
        LunarConstellation::positions_mcmf(self, t_s)
    }
}

impl PositionsMcmf for crate::lunar_perturbed::PerturbedConstellation {
    fn positions_mcmf(&self, t_s: f64) -> Vec<Vec3> {
        crate::lunar_perturbed::PerturbedConstellation::positions_mcmf(self, t_s)
    }
}

/// Coverage / availability over a service volume: for every `(grid point, epoch)`
/// sample, place the constellation in MCMF, count visible satellites and compute the
/// PDOP (reusing [`service_dop`]), and accumulate the fraction of samples with ≥ 4
/// satellites and `PDOP < pdop_threshold`, plus the PDOP and visible-count envelopes.
///
/// Generic over any [`PositionsMcmf`] provider, so the same sweep serves both the idealized
/// Keplerian and the perturbed (J2/C22/third-body) constellation geometries.
///
/// `grid_points_selenographic` are surface points (their altitude is honoured);
/// `times_s` are epochs (seconds past the MCI/MCMF-aligned epoch).
pub fn coverage<C: PositionsMcmf + ?Sized>(
    constellation: &C,
    grid_points_selenographic: &[Selenographic],
    times_s: &[f64],
    elev_mask_rad: f64,
    pdop_threshold: f64,
) -> CoverageStats {
    let users: Vec<Vec3> = grid_points_selenographic
        .iter()
        .map(|&s| selenographic_to_mcmf(s))
        .collect();

    let mut n_samples = 0usize;
    let mut n_four_plus = 0usize;
    let mut n_available = 0usize;
    let mut min_sats = usize::MAX;
    let mut max_sats = 0usize;
    let mut pdop_min = f64::INFINITY;
    let mut pdop_max = 0.0_f64;
    let mut pdop_sum = 0.0_f64;
    let mut pdop_n = 0usize;
    let mut gdops: Vec<f64> = Vec::new();
    let mut n_below_gdop6 = 0usize;

    for &t in times_s {
        let sats = constellation.positions_mcmf(t);
        for &user in &users {
            n_samples += 1;
            let vis = visible_sat_positions(user, &sats, elev_mask_rad);
            let nv = vis.len();
            min_sats = min_sats.min(nv);
            max_sats = max_sats.max(nv);
            if nv >= 4 {
                n_four_plus += 1;
                if let Some(d) = crate::orbit::dop(user, &vis) {
                    pdop_min = pdop_min.min(d.pdop);
                    pdop_max = pdop_max.max(d.pdop);
                    pdop_sum += d.pdop;
                    pdop_n += 1;
                    gdops.push(d.gdop);
                    if d.gdop < 6.0 {
                        n_below_gdop6 += 1;
                    }
                    if d.pdop < pdop_threshold {
                        n_available += 1;
                    }
                }
            }
        }
    }

    // Median GDOP as an exact order statistic over the defined-DOP samples.
    let gdop_median = if gdops.is_empty() {
        None
    } else {
        gdops.sort_by(|a, b| a.partial_cmp(b).unwrap_or(std::cmp::Ordering::Equal));
        let mid = gdops.len() / 2;
        Some(if gdops.len() % 2 == 0 {
            0.5 * (gdops[mid - 1] + gdops[mid])
        } else {
            gdops[mid]
        })
    };
    let frac_below_gdop6 = if n_samples == 0 {
        0.0
    } else {
        n_below_gdop6 as f64 / n_samples as f64
    };

    let coverage_fraction = if n_samples == 0 {
        0.0
    } else {
        n_available as f64 / n_samples as f64
    };
    CoverageStats {
        n_samples,
        n_four_plus,
        n_available,
        coverage_fraction,
        min_sats: if n_samples == 0 { 0 } else { min_sats },
        max_sats,
        pdop_min: (pdop_n > 0).then_some(pdop_min),
        pdop_mean: (pdop_n > 0).then(|| pdop_sum / pdop_n as f64),
        pdop_max: (pdop_n > 0).then_some(pdop_max),
        gdop_median,
        frac_below_gdop6,
    }
}

/// One row of the constellation-size sweep ([`sweep_over_n`]) — the P2 Table 1 record.
#[derive(Clone, Copy, Debug, PartialEq, Serialize)]
pub struct NSweepRow {
    /// Number of satellites in the illustrative ELFO constellation.
    pub n_sats: usize,
    /// Availability (fraction of samples with ≥ 4 sats and PDOP below threshold).
    pub coverage_fraction: f64,
    /// Median GDOP over the defined-DOP samples.
    pub gdop_median: Option<f64>,
    /// Fraction of samples with a usable GDOP below 6.
    pub frac_below_gdop6: f64,
}

/// Sweep the illustrative ELFO constellation size `N` over `[n_min, n_max]` (clamped to
/// the 1..=24 supported range), returning the availability / median-GDOP / time-below-6
/// row for each — P2 Table 1. The median GDOP crossing 6 near `N ≈ 12` and any
/// non-monotone bump fall out of this sweep directly. Deterministic order statistics
/// over the Validated per-sample GDOP kernel.
pub fn sweep_over_n(
    n_min: usize,
    n_max: usize,
    grid_points_selenographic: &[Selenographic],
    times_s: &[f64],
    elev_mask_rad: f64,
    pdop_threshold: f64,
) -> Vec<NSweepRow> {
    (n_min.max(1)..=n_max.min(24))
        .map(|n| {
            let c = coverage(
                &LunarConstellation::illustrative_lcns(n),
                grid_points_selenographic,
                times_s,
                elev_mask_rad,
                pdop_threshold,
            );
            NSweepRow {
                n_sats: n,
                coverage_fraction: c.coverage_fraction,
                gdop_median: c.gdop_median,
                frac_below_gdop6: c.frac_below_gdop6,
            }
        })
        .collect()
}

/// Generalised lunar ARAIM protection level for an **arbitrary** surface user point
/// (selenographic), reusing the same LunaNet LNIS σ_URE + ARAIM PL machinery the
/// south-pole pass uses ([`crate::lunar::lunar_araim`]). The user point is mapped to
/// MCMF, the satellites are taken as MCMF (the caller reduces a constellation with
/// [`LunarConstellation::positions_mcmf`]), and the zero-residual all-in-view ARAIM PL
/// is returned.
///
/// Reduces to the south-pole result as a special case: with `user_selenographic` at the
/// south pole and the same satellite geometry / budget, this returns exactly what a
/// direct [`crate::lunar::lunar_araim`] call at the south pole returns (it *is* that
/// call). `None` if fewer than six satellites are usable (the ARAIM single-fault
/// hypothesis set needs `n − 1 ≥ 5` redundancy) or the geometry is singular.
pub fn lunar_protection_level(
    user_selenographic: Selenographic,
    sats_mcmf: &[Vec3],
    budget: IntegrityBudget,
) -> Option<ProtLevel> {
    lunar_protection_level_with_sigma(user_selenographic, sats_mcmf, LUNAR_SIGMA_URE_M, budget)
}

/// As [`lunar_protection_level`], but with the signal-in-space ranging accuracy
/// `sigma_ure_m` as an explicit parameter.
///
/// Protection levels are linear and homogeneous in the ranging sigma when the
/// nominal bias is zero, so exposing it lets a service-volume sweep answer what
/// ranging accuracy an alert limit requires, rather than only whether a fixed
/// LNIS-class value passes. Passing `LUNAR_SIGMA_URE_M` reproduces
/// [`lunar_protection_level`] bit-for-bit.
pub fn lunar_protection_level_with_sigma(
    user_selenographic: Selenographic,
    sats_mcmf: &[Vec3],
    sigma_ure_m: f64,
    budget: IntegrityBudget,
) -> Option<ProtLevel> {
    let user = selenographic_to_mcmf(user_selenographic);
    let resid = vec![0.0; sats_mcmf.len()];
    crate::lunar::lunar_araim_with_sigma(user, sats_mcmf, &resid, sigma_ure_m, budget).map(|r| {
        ProtLevel {
            hpl_m: r.hpl_m,
            vpl_m: r.vpl_m,
            n_used: r.n_used,
            sigma_ure_m,
        }
    })
}

/// A generalised lunar protection level at a service-volume point.
#[derive(Clone, Copy, Debug, PartialEq, Serialize)]
pub struct ProtLevel {
    /// Horizontal protection level (m).
    pub hpl_m: f64,
    /// Vertical protection level (m).
    pub vpl_m: f64,
    /// Satellites used in the all-in-view solution.
    pub n_used: usize,
    /// LunaNet LNIS σ_URE (m) the PL scales with.
    pub sigma_ure_m: f64,
}

// ---------------------------------------------------------------------------
// Scenario
// ---------------------------------------------------------------------------

fn d_n_sats() -> usize {
    // An illustrative *expanded* LCNS-class set. The first-phase public description is
    // ~4 satellites, but the generalised lunar ARAIM protection level needs ≥ 6
    // satellites in view (the single-fault hypothesis set needs n−1 ≥ 5 redundancy), so
    // the default scenario uses a fuller constellation to exercise the PL envelope as
    // well as the DOP/coverage headline. Still illustrative; public-source; not
    // affiliated with ESA.
    8
}
fn d_sma_km() -> f64 {
    R_MOON_M / 1000.0 + 8_000.0
}
fn d_ecc() -> f64 {
    0.6
}
fn d_inc_deg() -> f64 {
    57.7
}
fn d_argp_deg() -> f64 {
    90.0
}
fn d_lat_min_deg() -> f64 {
    -90.0
}
fn d_lat_max_deg() -> f64 {
    -60.0
}
fn d_lat_step_deg() -> f64 {
    10.0
}
fn d_lon_min_deg() -> f64 {
    -180.0
}
fn d_lon_max_deg() -> f64 {
    180.0
}
fn d_lon_step_deg() -> f64 {
    60.0
}
fn d_horizon_hours() -> f64 {
    12.0
}
fn d_step_min() -> f64 {
    60.0
}
fn d_elev_mask_deg() -> f64 {
    5.0
}
fn d_pdop_threshold() -> f64 {
    6.0
}
fn d_alert_limit_m() -> f64 {
    50.0
}
fn d_p_hmi() -> f64 {
    1e-4
}
fn d_sigma_ure_m() -> f64 {
    LUNAR_SIGMA_URE_M
}
/// S-band lunar augmented-forward-signal carrier (Hz) — the same 2.4 GHz the
/// `lunar-attack-surface` and `lunar-jamming` packs already run at, so a geometry export
/// and a jamming run describe the same radio.
fn d_export_carrier_hz() -> f64 {
    2.4e9
}
/// Aperture (illumination) efficiency of the satellite transmit dish — the engine-wide
/// representative [`crate::antenna::DEFAULT_APERTURE_EFFICIENCY`] (0.60).
fn d_export_efficiency() -> f64 {
    crate::antenna::DEFAULT_APERTURE_EFFICIENCY
}

/// Satellite transmit-antenna configuration for the per-satellite geometry export.
///
/// Supplying this turns the geometry export from look angles into a **link-facing**
/// export: each row gains the off-boresight angle at the satellite and the transmit gain
/// toward the site from the real aperture pattern, and the report gains an
/// [`AntennaPatternBlock`]. Purely additive — leaving it out reproduces the previous
/// export byte-for-byte.
///
/// It is only read when the export site (`export_site_lat_deg` + `export_site_lon_deg`)
/// is also set: without a site there is no direction to evaluate the pattern along. A
/// non-finite or non-positive `diameter_m` / `carrier_hz`, or an `efficiency` outside
/// `(0, 1]`, leaves the antenna block off rather than emitting a number derived from an
/// impossible aperture.
#[derive(Clone, Copy, Debug, Deserialize, Serialize)]
pub struct ExportAntennaCfg {
    /// Satellite transmit-dish diameter (m). No default: the pattern is a statement about
    /// a specific aperture, so the caller has to name one.
    pub diameter_m: f64,
    /// Carrier frequency (Hz). Default 2.4e9 (S-band lunar AFS).
    #[serde(default = "d_export_carrier_hz")]
    pub carrier_hz: f64,
    /// Aperture (illumination) efficiency in `(0, 1]`. Default 0.60.
    #[serde(default = "d_export_efficiency")]
    pub efficiency: f64,
}

impl ExportAntennaCfg {
    /// Whether this configuration describes a physically evaluable aperture.
    fn is_usable(&self) -> bool {
        self.diameter_m.is_finite()
            && self.diameter_m > 0.0
            && self.carrier_hz.is_finite()
            && self.carrier_hz > 0.0
            && self.efficiency.is_finite()
            && self.efficiency > 0.0
            && self.efficiency <= 1.0
    }
}

/// A runnable lunar navigation **service-volume** scenario. The TOML
/// `kind = "moonlight-service-volume"` entry the engine dispatches here builds an
/// illustrative LCNS-class constellation, sweeps a selenographic lat/lon grid over a
/// time horizon, and reports DOP / coverage / availability plus the generalised lunar
/// ARAIM protection-level envelope over the service volume.
///
/// **Illustrative; public-source; not affiliated with ESA. MODELLED** — see the module
/// docs for the honesty boundary.
#[derive(Clone, Debug, Deserialize)]
pub struct LunarServiceScenario {
    /// Number of satellites in the illustrative constellation (1 to 24).
    #[serde(default = "d_n_sats")]
    pub n_sats: usize,
    /// Semi-major axis (km).
    #[serde(default = "d_sma_km")]
    pub sma_km: f64,
    /// Eccentricity.
    #[serde(default = "d_ecc")]
    pub eccentricity: f64,
    /// Inclination (deg).
    #[serde(default = "d_inc_deg")]
    pub inc_deg: f64,
    /// Argument of perilune (deg).
    #[serde(default = "d_argp_deg")]
    pub argp_deg: f64,
    /// Service-volume grid: minimum latitude (deg).
    #[serde(default = "d_lat_min_deg")]
    pub lat_min_deg: f64,
    /// Service-volume grid: maximum latitude (deg).
    #[serde(default = "d_lat_max_deg")]
    pub lat_max_deg: f64,
    /// Service-volume grid: latitude step (deg).
    #[serde(default = "d_lat_step_deg")]
    pub lat_step_deg: f64,
    /// Service-volume grid: minimum longitude (deg).
    #[serde(default = "d_lon_min_deg")]
    pub lon_min_deg: f64,
    /// Service-volume grid: maximum longitude (deg).
    #[serde(default = "d_lon_max_deg")]
    pub lon_max_deg: f64,
    /// Service-volume grid: longitude step (deg).
    #[serde(default = "d_lon_step_deg")]
    pub lon_step_deg: f64,
    /// Time horizon (hours).
    #[serde(default = "d_horizon_hours")]
    pub horizon_hours: f64,
    /// Time step (minutes).
    #[serde(default = "d_step_min")]
    pub step_min: f64,
    /// Elevation mask (deg).
    #[serde(default = "d_elev_mask_deg")]
    pub elev_mask_deg: f64,
    /// PDOP availability threshold.
    #[serde(default = "d_pdop_threshold")]
    pub pdop_threshold: f64,
    /// Surface-ops alert limit (m) — the HPL availability bound for the PL pass.
    #[serde(default = "d_alert_limit_m")]
    pub alert_limit_m: f64,
    /// Integrity-risk budget `P_HMI`.
    #[serde(default = "d_p_hmi")]
    pub p_hmi: f64,
    /// Signal-in-space ranging accuracy (m, 1-sigma user range error). Defaults to
    /// the LNIS-class [`LUNAR_SIGMA_URE_M`]. Protection levels are linear in this,
    /// so sweeping it turns the sweep into a ranging-accuracy requirement over the
    /// whole service volume rather than a pass/fail at one fixed value.
    #[serde(default = "d_sigma_ure_m")]
    pub sigma_ure_m: f64,
    /// Run the sweep against the **perturbed** constellation twin (lunar J2 + C22 + Earth/Sun
    /// third body, each satellite numerically propagated from its epoch elements) instead of the
    /// idealized Keplerian constellation. Off by default. The perturbation MECHANISM and its
    /// propagation are Validated (analytic secular rates + an independent SciPy DOP853
    /// integrator oracle); the resulting perturbed geometry is a Modelled/representative twin —
    /// not tied to an external DE440 ephemeris. Propagating every satellite at every epoch is
    /// far heavier than the closed-form Keplerian path, so keep the horizon / step modest.
    #[serde(default)]
    pub perturbed: bool,
    /// Optional per-satellite geometry export: selenographic latitude (deg) of one
    /// site. When both this and `export_site_lon_deg` are set, the report carries a
    /// `per_sat_geometry` array giving azimuth, elevation and slant range to every
    /// satellite at every epoch for that one site.
    ///
    /// The aggregate coverage and DOP summary deliberately collapses per-satellite
    /// geometry, but slant range is exactly what a link budget consumes, so a joint
    /// communications-and-navigation analysis cannot be done from the summary alone.
    /// Purely additive: leaving these unset reproduces the previous report exactly.
    #[serde(default)]
    pub export_site_lat_deg: Option<f64>,
    /// Selenographic longitude (deg) of the per-satellite geometry export site.
    #[serde(default)]
    pub export_site_lon_deg: Option<f64>,
    /// Optional satellite transmit-antenna configuration for the geometry export. See
    /// [`ExportAntennaCfg`]. Read only when the export site is also set; purely additive.
    #[serde(default)]
    pub export_antenna: Option<ExportAntennaCfg>,
    /// Optional path to a **real, retrieved** constellation geometry — either a tabulated
    /// Moon-centred state ephemeris (the evaluation of an SPK/BSP kernel) or a published
    /// constellation definition in classical elements. See
    /// [`crate::lunar_ephemeris`] for the file format, the two provenance classes, and why
    /// this reads an evaluated kernel rather than parsing a binary one.
    ///
    /// **Unset by default, and unset means nothing changes**: the scenario emits exactly
    /// the bytes it emitted before this field existed. When it *is* set, the file's
    /// geometry drives the headline coverage / DOP / protection-level figures, an
    /// `ephemeris` provenance block records the bytes it came from, and an
    /// `ephemeris_comparison` block carries the **σ_URE requirement** under that geometry
    /// beside the unchanged Keplerian and perturbed results and the explicit difference
    /// between them. The illustrative results are never replaced — this is a revision,
    /// reported as one.
    ///
    /// With a path set, [`Self::perturbed`] no longer selects the headline geometry (the
    /// file does); the perturbed twin is computed regardless, as one comparison row.
    ///
    /// Reading it needs the filesystem, so use [`Self::try_run`] rather than
    /// [`Self::run`] when a scenario may name a file.
    #[serde(default)]
    pub ephemeris_path: Option<String>,
}

impl Default for LunarServiceScenario {
    fn default() -> Self {
        Self {
            n_sats: d_n_sats(),
            sma_km: d_sma_km(),
            eccentricity: d_ecc(),
            inc_deg: d_inc_deg(),
            argp_deg: d_argp_deg(),
            lat_min_deg: d_lat_min_deg(),
            lat_max_deg: d_lat_max_deg(),
            lat_step_deg: d_lat_step_deg(),
            lon_min_deg: d_lon_min_deg(),
            lon_max_deg: d_lon_max_deg(),
            lon_step_deg: d_lon_step_deg(),
            horizon_hours: d_horizon_hours(),
            step_min: d_step_min(),
            elev_mask_deg: d_elev_mask_deg(),
            pdop_threshold: d_pdop_threshold(),
            alert_limit_m: d_alert_limit_m(),
            p_hmi: d_p_hmi(),
            sigma_ure_m: d_sigma_ure_m(),
            perturbed: false,
            export_site_lat_deg: None,
            export_site_lon_deg: None,
            export_antenna: None,
            ephemeris_path: None,
        }
    }
}

// ---------------------------------------------------------------------------
// The antenna-pattern block: the real pattern beside the approximation it replaces.
// ---------------------------------------------------------------------------

/// The real transmit pattern, the symmetric approximation that usually stands in for it,
/// and the **in-beam correction** between them, for one geometry export.
///
/// The engine has carried a real aperture pattern since P1
/// ([`crate::antenna::pattern_gain_dbi`]) and nothing outside `antenna.rs` used it; a
/// gain figure paired with a beamwidth rule of thumb was doing the work instead. Both are
/// emitted here, side by side and both labelled, because the point is the *difference*:
/// `in_beam_correction_links` is real minus approximate, so a reader can see what the
/// approximation bought or cost rather than being asked to trust one of them.
///
/// The approximation is **not** removed or corrected anywhere. It is reported.
#[derive(Clone, Debug, Serialize)]
pub struct AntennaPatternBlock {
    /// Satellite transmit-dish diameter (m) — echoed input.
    pub diameter_m: f64,
    /// Carrier frequency (Hz) — echoed input.
    pub carrier_hz: f64,
    /// Aperture efficiency — echoed input.
    pub efficiency: f64,
    /// Boresight gain `G₀ = 10·log₁₀(η(πD/λ)²)` (dBi).
    pub boresight_gain_dbi: f64,
    /// Real half-power beamwidth `1.02·λ/D` (deg), full width across the main lobe.
    pub half_power_beamwidth_deg: f64,
    /// Half of [`Self::half_power_beamwidth_deg`] — the beam-edge angle from boresight.
    pub half_power_half_angle_deg: f64,
    /// First-null (edge-of-main-lobe) angle from boresight (deg), `asin(1.22·λ/D)`.
    /// Absent when the aperture is smaller than ≈ 1.22 wavelengths.
    #[serde(skip_serializing_if = "Option::is_none")]
    pub first_null_deg: Option<f64>,
    /// Beamwidth (deg) the **symmetric approximation** derives from `boresight_gain_dbi`
    /// alone: `√(K/G_lin)` with `K = 31000 deg²`.
    pub symmetric_beamwidth_deg: f64,
    /// Half of [`Self::symmetric_beamwidth_deg`] — the approximation's beam-edge angle.
    pub symmetric_half_angle_deg: f64,
    /// The symmetric relation's constant `K` (deg²), stated rather than buried.
    pub symmetric_relation_constant_deg2: f64,
    /// Aperture efficiency the symmetric relation implies when paired with the
    /// `θ₃dB[deg] = 70·λ/D` rule of thumb it is normally quoted with: ≈ **0.641**. This is
    /// the efficiency a published gain→beamwidth analysis is assuming, said or unsaid.
    pub symmetric_implied_efficiency_70deg_rule: f64,
    /// Aperture efficiency the symmetric relation implies when paired with this engine's
    /// uniform circular aperture (`1.02·λ/D`): ≈ 0.920. Above `efficiency`, which is why
    /// the approximate beam comes out wider than the real one.
    pub symmetric_implied_efficiency_uniform_aperture: f64,
    /// `symmetric_beamwidth_deg / half_power_beamwidth_deg`. Equals
    /// `√(symmetric_implied_efficiency_uniform_aperture / efficiency)` exactly.
    pub beamwidth_ratio_symmetric_over_pattern: f64,
    /// Number of exported rows the in-beam counts were taken over: the **visible** rows
    /// only (a satellite below the site's local horizon cannot serve it, whatever its beam
    /// is doing).
    pub n_links_evaluated: usize,
    /// Rows in beam under the **real pattern**.
    pub in_beam_pattern_links: usize,
    /// Rows in beam under the **symmetric approximation**.
    pub in_beam_symmetric_links: usize,
    /// **The in-beam pattern correction**, in links: `in_beam_pattern_links −
    /// in_beam_symmetric_links`. Negative means the approximation over-counts, i.e. it
    /// claims coverage the real pattern does not deliver.
    pub in_beam_correction_links: i64,
    /// [`Self::in_beam_pattern_links`] averaged over epochs — satellites in beam per epoch.
    pub in_beam_pattern_sats_per_epoch: f64,
    /// [`Self::in_beam_symmetric_links`] averaged over epochs.
    pub in_beam_symmetric_sats_per_epoch: f64,
    /// The correction as satellites per epoch — the figure "agree to within one satellite"
    /// is about, on average.
    pub in_beam_correction_sats_per_epoch: f64,
    /// The largest single-epoch `|real − approximate|` in-beam count over the horizon.
    /// This, not the mean, is the worst case a per-epoch claim has to survive.
    pub max_abs_epoch_correction_sats: usize,
    /// Unit and provenance class of every numeric field this block and the per-satellite
    /// rows emit.
    pub units: serde_json::Value,
    /// Honest scope note.
    pub note: &'static str,
}

/// Unit and provenance class for every numeric field the antenna-pattern block and the
/// per-satellite geometry rows emit — paths relative to the report root, matching the
/// contract [`crate::lunar_jamming`] and [`crate::linkbudget`] publish.
const ANTENNA_UNITS: &[(&str, &str, &str, &str)] = &[
    // (JSON path, unit, provenance class, note — "" for no note)
    ("antenna_pattern.diameter_m", "m", "input", ""),
    ("antenna_pattern.carrier_hz", "Hz", "input", ""),
    (
        "antenna_pattern.efficiency",
        "fraction",
        "input",
        "aperture (illumination) efficiency of the transmit dish",
    ),
    (
        "antenna_pattern.boresight_gain_dbi",
        "dBi",
        "computed",
        "antenna::boresight_gain_dbi, closed-form aperture theory",
    ),
    (
        "antenna_pattern.half_power_beamwidth_deg",
        "deg",
        "computed",
        "antenna::half_power_beamwidth_rad, 1.02 lambda/D; the exact Airy width is 1.02899 lambda/D",
    ),
    (
        "antenna_pattern.half_power_half_angle_deg",
        "deg",
        "computed",
        "half of half_power_beamwidth_deg",
    ),
    (
        "antenna_pattern.first_null_deg",
        "deg",
        "computed",
        "antenna::first_null_angle_rad, asin(1.22 lambda/D); absent for an aperture under ~1.22 wavelengths",
    ),
    (
        "antenna_pattern.symmetric_beamwidth_deg",
        "deg",
        "modelled",
        "the APPROXIMATION: sqrt(31000/G_lin) from the boresight gain alone, no aperture",
    ),
    (
        "antenna_pattern.symmetric_half_angle_deg",
        "deg",
        "modelled",
        "half of symmetric_beamwidth_deg",
    ),
    (
        "antenna_pattern.symmetric_relation_constant_deg2",
        "deg^2",
        "modelled",
        "K in G_lin = K/theta_deg^2; the satcom working value, 4*pi*(180/pi)^2 = 41253 at unit efficiency",
    ),
    (
        "antenna_pattern.symmetric_implied_efficiency_70deg_rule",
        "fraction",
        "computed",
        "aperture efficiency the symmetric relation implies against the 70 lambda/D deg rule: 0.641",
    ),
    (
        "antenna_pattern.symmetric_implied_efficiency_uniform_aperture",
        "fraction",
        "computed",
        "same, against this engine's uniform circular aperture (1.02 lambda/D): 0.920",
    ),
    (
        "antenna_pattern.beamwidth_ratio_symmetric_over_pattern",
        "dimensionless",
        "computed",
        "sqrt(symmetric_implied_efficiency_uniform_aperture / efficiency)",
    ),
    (
        "antenna_pattern.n_links_evaluated",
        "count",
        "computed",
        "visible (epoch, satellite) rows; rows below the elevation mask are excluded",
    ),
    (
        "antenna_pattern.in_beam_pattern_links",
        "count",
        "computed",
        "real pattern: pattern_gain_dbi >= boresight_gain_dbi - 10*log10(2)",
    ),
    (
        "antenna_pattern.in_beam_symmetric_links",
        "count",
        "modelled",
        "symmetric approximation: off_boresight_deg <= symmetric_half_angle_deg",
    ),
    (
        "antenna_pattern.in_beam_correction_links",
        "count",
        "computed",
        "THE CORRECTION: in_beam_pattern_links - in_beam_symmetric_links; negative = the approximation over-counts",
    ),
    (
        "antenna_pattern.in_beam_pattern_sats_per_epoch",
        "count/epoch",
        "computed",
        "",
    ),
    (
        "antenna_pattern.in_beam_symmetric_sats_per_epoch",
        "count/epoch",
        "modelled",
        "",
    ),
    (
        "antenna_pattern.in_beam_correction_sats_per_epoch",
        "count/epoch",
        "computed",
        "the correction averaged over epochs",
    ),
    (
        "antenna_pattern.max_abs_epoch_correction_sats",
        "count",
        "computed",
        "worst single-epoch |real - approximate| in-beam count over the horizon",
    ),
    ("per_sat_geometry.t_s", "s", "computed", "seconds from epoch"),
    ("per_sat_geometry.sat", "index", "computed", ""),
    (
        "per_sat_geometry.az_deg",
        "deg",
        "computed",
        "clockwise from local north at the site, [0, 360)",
    ),
    (
        "per_sat_geometry.el_deg",
        "deg",
        "computed",
        "above the site's local horizon plane",
    ),
    (
        "per_sat_geometry.range_km",
        "km",
        "computed",
        "slant range site to satellite",
    ),
    (
        "per_sat_geometry.off_boresight_deg",
        "deg",
        "computed",
        "at the SATELLITE, from its nadir boresight to the site; lunar_service::nadir_off_boresight_rad",
    ),
    (
        "per_sat_geometry.pattern_gain_dbi",
        "dBi",
        "computed",
        "antenna::pattern_gain_dbi, the real Airy aperture pattern at off_boresight_deg",
    ),
    (
        "per_sat_geometry.visible",
        "boolean",
        "computed",
        "el_deg >= elev_mask_deg; only these rows enter the in-beam counts",
    ),
    (
        "per_sat_geometry.in_beam_pattern",
        "boolean",
        "computed",
        "real pattern: pattern_gain_dbi >= boresight_gain_dbi - 10*log10(2)",
    ),
    (
        "per_sat_geometry.in_beam_symmetric",
        "boolean",
        "modelled",
        "symmetric approximation: off_boresight_deg <= symmetric_half_angle_deg",
    ),
];

/// Render [`ANTENNA_UNITS`] as the block's `units` object.
fn antenna_units_block() -> serde_json::Value {
    let mut m = serde_json::Map::new();
    for (path, unit, provenance, note) in ANTENNA_UNITS {
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

/// Unit and provenance class for every numeric field the `moonlight-service-volume`
/// report emits at the defaults.
///
/// Two percentages are emitted as percentages, not fractions: `coverage_pct` is
/// `coverage_fraction * 100` and `pl_availability_pct` is a count ratio times 100, so
/// their unit is `%` rather than `1`. The DOP rows are dimensionless by construction (a
/// dilution of precision is a ratio), and the protection-level rows are metres from the
/// reused lunar ARAIM machinery.
///
/// The optional `per_sat_geometry` and `antenna_pattern` blocks are not described here:
/// they are emitted only when `export_site_lat_deg` / `export_site_lon_deg` (and, for the
/// antenna block, `export_antenna`) are configured, and are absent from the default
/// document.
pub const UNITS: &[crate::field_schema::FieldUnit] = {
    use crate::field_schema::{FieldUnit, ProvenanceClass::*};
    &[
        FieldUnit {
            path: "n_sats",
            unit: "count",
            provenance: Computed,
            definition: "satellites in the illustrative LCNS-class constellation the sweep \
                         ran against, as built from the `n_sats` input",
        },
        FieldUnit {
            path: "n_grid_points",
            unit: "count",
            provenance: Computed,
            definition: "selenographic grid points swept, from the lat/lon min, max and step \
                         inputs",
        },
        FieldUnit {
            path: "n_epochs",
            unit: "count",
            provenance: Computed,
            definition: "epochs swept, from `horizon_hours` at `step_min`",
        },
        FieldUnit {
            path: "n_samples",
            unit: "count",
            provenance: Computed,
            definition: "(grid point, epoch) samples evaluated, n_grid_points * n_epochs",
        },
        FieldUnit {
            path: "elev_mask_deg",
            unit: "deg",
            provenance: Input,
            definition: "elevation above the site's local horizon a satellite must clear to \
                         count as visible",
        },
        FieldUnit {
            path: "pdop_threshold",
            unit: "1",
            provenance: Input,
            definition: "PDOP a sample must be below (together with 4 or more visible \
                         satellites) to count as covered",
        },
        FieldUnit {
            path: "alert_limit_m",
            unit: "m",
            provenance: Input,
            definition: "horizontal alert limit the protection-level availability is graded \
                         against",
        },
        FieldUnit {
            path: "sigma_ure_m",
            unit: "m",
            provenance: Input,
            definition: "signal-in-space ranging accuracy (1-sigma user range error) the \
                         protection levels scale linearly with",
        },
        FieldUnit {
            path: "coverage_pct",
            unit: "%",
            provenance: Computed,
            definition: "percentage of all (grid point, epoch) samples with 4 or more visible \
                         satellites AND PDOP below the threshold",
        },
        FieldUnit {
            path: "min_sats",
            unit: "count",
            provenance: Computed,
            definition: "fewest satellites visible at any sampled point and epoch",
        },
        FieldUnit {
            path: "max_sats",
            unit: "count",
            provenance: Computed,
            definition: "most satellites visible at any sampled point and epoch",
        },
        FieldUnit {
            path: "pdop_min",
            unit: "1",
            provenance: Computed,
            definition: "smallest position dilution of precision over the samples that had a \
                         defined PDOP (4 or more visible satellites, non-singular geometry)",
        },
        FieldUnit {
            path: "pdop_mean",
            unit: "1",
            provenance: Computed,
            definition: "arithmetic mean PDOP over those same samples",
        },
        FieldUnit {
            path: "pdop_max",
            unit: "1",
            provenance: Computed,
            definition: "largest PDOP over those same samples",
        },
        FieldUnit {
            path: "hpl_min_m",
            unit: "m",
            provenance: Computed,
            definition: "smallest horizontal protection level over the samples that admitted \
                         one",
        },
        FieldUnit {
            path: "hpl_max_m",
            unit: "m",
            provenance: Computed,
            definition: "largest horizontal protection level over those samples",
        },
        FieldUnit {
            path: "vpl_min_m",
            unit: "m",
            provenance: Computed,
            definition: "smallest vertical protection level over those samples",
        },
        FieldUnit {
            path: "vpl_max_m",
            unit: "m",
            provenance: Computed,
            definition: "largest vertical protection level over those samples",
        },
        FieldUnit {
            path: "n_pl_samples",
            unit: "count",
            provenance: Computed,
            definition: "samples for which the lunar ARAIM engine returned a protection level",
        },
        FieldUnit {
            path: "pl_availability_pct",
            unit: "%",
            provenance: Computed,
            definition: "percentage of the protection-level samples whose HPL is at or below \
                         the alert limit",
        },
    ]
};

/// The result of a [`LunarServiceScenario`]: the DOP / coverage / availability summary
/// over the service volume plus the generalised protection-level envelope and the
/// availability against the alert limit.
#[derive(Clone, Debug, Serialize)]
pub struct LunarServiceReport {
    /// Satellites in the constellation.
    pub n_sats: usize,
    /// Selenographic grid points swept.
    pub n_grid_points: usize,
    /// Epochs evaluated at each grid point.
    pub n_epochs: usize,
    /// Grid-point by epoch samples evaluated.
    pub n_samples: usize,
    /// Elevation mask below which a satellite is not counted visible (deg).
    pub elev_mask_deg: f64,
    /// PDOP above which a sample is not counted as covered.
    pub pdop_threshold: f64,
    /// Alert limit the protection levels are scored against (m).
    pub alert_limit_m: f64,
    /// Signal-in-space ranging accuracy assumed per satellite (m, 1-sigma).
    pub sigma_ure_m: f64,
    /// Coverage fraction (≥ 4 sats AND PDOP < threshold) as a percentage.
    pub coverage_pct: f64,
    /// Fewest satellites visible at any evaluated sample.
    pub min_sats: usize,
    /// Most satellites visible at any evaluated sample.
    pub max_sats: usize,
    /// Smallest PDOP over the samples with a solvable geometry.
    pub pdop_min: f64,
    /// Mean PDOP over the samples with a solvable geometry.
    pub pdop_mean: f64,
    /// Largest PDOP over the samples with a solvable geometry.
    pub pdop_max: f64,
    /// Minimum HPL (m) over the volume samples that admitted a protection level (≥ 6 sats).
    pub hpl_min_m: f64,
    /// Maximum HPL (m) over those samples.
    pub hpl_max_m: f64,
    /// Minimum VPL (m) over those samples.
    pub vpl_min_m: f64,
    /// Maximum VPL (m) over those samples.
    pub vpl_max_m: f64,
    /// Samples that admitted a protection level (≥ 6 sats, non-singular).
    pub n_pl_samples: usize,
    /// Fraction of PL samples with HPL ≤ alert limit, as a percentage.
    pub pl_availability_pct: f64,
    /// Per-satellite azimuth, elevation and slant range for the optional export site.
    /// `None` unless both `export_site_lat_deg` and `export_site_lon_deg` are set.
    #[serde(skip_serializing_if = "Option::is_none")]
    pub per_sat_geometry: Option<Vec<GeometrySample>>,
    /// The real transmit pattern beside the symmetric approximation, and the in-beam
    /// correction between them. `None` unless the export site **and** a usable
    /// `export_antenna` are both configured.
    #[serde(skip_serializing_if = "Option::is_none")]
    pub antenna_pattern: Option<AntennaPatternBlock>,
    /// Honest scope note (illustrative / modelled).
    pub note: &'static str,
    /// True when the sweep ran against the perturbed (J2/C22/third-body) constellation twin
    /// rather than the idealized Keplerian one. Omitted from JSON when false so the default
    /// (idealized) output is byte-identical to before this option existed.
    #[serde(skip_serializing_if = "skip_if_false")]
    pub perturbed: bool,
    /// Where the headline geometry came from, when `ephemeris_path` named a file: the
    /// bytes, their SHA-256, the upstream document, and the frame caveat. `None` — and
    /// absent from the JSON — whenever `ephemeris_path` is unset.
    #[serde(skip_serializing_if = "Option::is_none")]
    pub ephemeris: Option<crate::lunar_ephemeris::EphemerisSourceBlock>,
    /// The σ_URE requirement under the real geometry, **beside** the unchanged Keplerian
    /// and perturbed results, with the difference between them as its own named quantity.
    /// `None` — and absent from the JSON — whenever `ephemeris_path` is unset.
    #[serde(skip_serializing_if = "Option::is_none")]
    pub ephemeris_comparison: Option<SigmaRequirementComparison>,
}

impl LunarServiceReport {
    /// G11 — the per-satellite geometry as a long-form table, emitted at runtime as
    /// `<scenario>.table.csv`.
    ///
    /// `per_sat_geometry` is the largest array this crate publishes: one row per
    /// (epoch, satellite), 2304 rows in the released joint communications-and-navigation
    /// table. It reached consumers only as a JSON array, which is exactly the shape that
    /// truncated a sibling scenario's 57-point curve to 23 points under a column claiming
    /// all of them. One row per link cannot be truncated into something that still looks
    /// whole: a short file is visibly short, and the row count is on the header line.
    ///
    /// `None` when no export site is configured, because the array does not exist then;
    /// an empty table would claim a run produced no links rather than that none were
    /// asked for.
    ///
    /// The four antenna columns are present only when `export_antenna` was configured,
    /// and the header says which case this file is, so a reader never has to infer
    /// whether a blank column means "no antenna" or "no value".
    ///
    /// Precision follows the sibling emitters: 7 significant figures on every float. Full
    /// `f64` here would fork the bytes between builds of the same source on last-ULP
    /// differences, which this programme has measured elsewhere; the JSON report still
    /// carries the unrounded values. `t_s` and `sat` together are the exact join key.
    pub fn per_sat_geometry_csv(&self) -> Option<String> {
        let rows = self.per_sat_geometry.as_ref()?;
        let with_antenna = self.antenna_pattern.is_some();

        let mut s = String::new();
        s.push_str(&format!(
            "# moonlight-service-volume per-satellite geometry (emitted at runtime as \
             <scenario>.table.csv) - one row per (epoch, satellite) for the export site, \
             {} row(s). `t_s` and `sat` together are the exact join key. Units: t_s \
             seconds, az_deg/el_deg degrees, range_km kilometres{}. Provenance: the DOP \
             geometry kernel is Validated; the constellation is {}. {}\n",
            rows.len(),
            // Naming a column the file does not carry would send a reader looking for it.
            if with_antenna {
                ", off_boresight_deg degrees, pattern_gain_dbi dBi"
            } else {
                ""
            },
            match &self.ephemeris {
                None => "the illustrative public-source LCNS-class set, Modelled",
                Some(e) => e.provenance_class.as_str(),
            },
            if with_antenna {
                "The four antenna columns are present because export_antenna was \
                 configured; in_beam_pattern is the real aperture pattern and \
                 in_beam_symmetric the approximation it is reported beside."
            } else {
                "The antenna columns are absent because export_antenna was not \
                 configured - they are omitted, not blank."
            },
        ));

        if with_antenna {
            s.push_str(
                "t_s,sat,az_deg,el_deg,range_km,visible,off_boresight_deg,\
                 pattern_gain_dbi,in_beam_pattern,in_beam_symmetric\n",
            );
        } else {
            s.push_str("t_s,sat,az_deg,el_deg,range_km,visible\n");
        }

        // An Option that is None where the header promised a column would be a silent
        // hole, so it is written as the empty field and the header explains the case.
        let f = |v: Option<f64>| match v {
            Some(x) => format!("{x:.6e}"),
            None => String::new(),
        };
        let b = |v: Option<bool>| match v {
            Some(x) => x.to_string(),
            None => String::new(),
        };
        for r in rows {
            s.push_str(&format!(
                "{:.6e},{},{:.6e},{:.6e},{:.6e},{}",
                r.t_s, r.sat, r.az_deg, r.el_deg, r.range_km, r.visible
            ));
            if with_antenna {
                s.push_str(&format!(
                    ",{},{},{},{}",
                    f(r.off_boresight_deg),
                    f(r.pattern_gain_dbi),
                    b(r.in_beam_pattern),
                    b(r.in_beam_symmetric),
                ));
            }
            s.push('\n');
        }
        Some(s)
    }
}

// ---------------------------------------------------------------------------
// The σ_URE requirement, and the three geometries it is evaluated over
// ---------------------------------------------------------------------------

/// The signal-in-space ranging accuracy (σ_URE, metres) a protection-level envelope
/// implies for an alert limit: the largest σ_URE at which `hpl_m` — evaluated at
/// `sigma_ure_m` — still meets `alert_limit_m`.
///
/// Exact, not fitted. With a zero nominal bias the ARAIM protection level is linear and
/// homogeneous in the ranging sigma (`lunar_protection_level_with_sigma` scales the whole
/// budget by it, and `protection_levels_are_exactly_linear_in_sigma` pins that), so
/// `HPL(σ) = σ · HPL(σ₀)/σ₀` and the σ that lands `HPL` on the alert limit is
/// `AL · σ₀ / HPL(σ₀)`.
///
/// `None` when there is no protection level to invert — no sample admitted one, or the
/// inputs are not a positive, finite pair.
pub fn sigma_required_m(alert_limit_m: f64, sigma_ure_m: f64, hpl_m: f64) -> Option<f64> {
    (hpl_m.is_finite() && hpl_m > 0.0 && sigma_ure_m.is_finite() && sigma_ure_m > 0.0)
        .then(|| alert_limit_m * sigma_ure_m / hpl_m)
}

/// One geometry's row in the σ_URE-requirement comparison: what the sweep found, and the
/// ranging accuracy the alert limit therefore demands of it.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct SigmaRequirementRow {
    /// Which geometry this row is: `ephemeris`, `keplerian` or `perturbed`.
    pub geometry: &'static str,
    /// The provenance class of every figure in this row — `published-ephemeris`,
    /// `published-elements`, `modelled-keplerian` or `modelled-perturbed`. A
    /// kernel-derived figure and an element-derived one are distinguishable by this
    /// string alone.
    pub provenance: String,
    /// Satellites in this geometry.
    pub n_sats: usize,
    /// Coverage / availability over the service volume, percent.
    pub coverage_pct: f64,
    /// Samples that admitted a protection level (≥ 6 satellites, non-singular).
    pub n_pl_samples: usize,
    /// Worst (largest) HPL over those samples, metres, at the run's `sigma_ure_m`.
    pub hpl_max_m: f64,
    /// 95th-percentile HPL (nearest-rank) over those samples, metres — the robust
    /// companion to `hpl_max_m`, so one near-singular sample cannot set the requirement
    /// on its own.
    pub hpl_p95_m: f64,
    /// Fraction of PL samples already meeting the alert limit at the run's `sigma_ure_m`,
    /// percent.
    pub pl_availability_pct: f64,
    /// **The requirement**: σ_URE (m) at which every PL sample meets the alert limit.
    #[serde(skip_serializing_if = "Option::is_none")]
    pub sigma_required_m: Option<f64>,
    /// The requirement taken at the 95th-percentile HPL instead of the worst sample.
    #[serde(skip_serializing_if = "Option::is_none")]
    pub sigma_required_p95_m: Option<f64>,
}

/// The σ_URE requirement under a real, retrieved geometry beside the illustrative
/// Keplerian and perturbed results, and the difference between them.
///
/// Nothing here replaces anything. The Keplerian row is the figure the engine published
/// before this block existed, recomputed unchanged from the same scenario fields; the
/// ephemeris row is the new one; and the deltas and ratios are emitted as their own named
/// quantities so the magnitude of the change is the reported result rather than something
/// a reader has to infer by comparing two runs.
#[derive(Clone, Debug, Serialize)]
pub struct SigmaRequirementComparison {
    /// Alert limit (m) the requirement is taken against — echoed input.
    pub alert_limit_m: f64,
    /// σ_URE (m) the sweeps were evaluated at, and which the requirement inverts.
    pub sigma_ure_m: f64,
    /// The real, retrieved geometry named by `ephemeris_path`.
    pub ephemeris: SigmaRequirementRow,
    /// The illustrative Keplerian constellation — the pre-existing published result.
    pub keplerian: SigmaRequirementRow,
    /// The SAME illustrative Keplerian constellation re-run at the RETRIEVED set's own
    /// satellite count, so the comparison separates constellation DESIGN from constellation
    /// SIZE.
    ///
    /// Present only when the two counts differ; when they already match, `keplerian` is
    /// itself the like-for-like row and a duplicate would say nothing. Without this a
    /// five-satellite retrieved set is scored against an eight-satellite illustrative one
    /// and the reader cannot tell which part of the gap is the design and which part is
    /// three more satellites.
    #[serde(skip_serializing_if = "Option::is_none")]
    pub keplerian_matched: Option<SigmaRequirementRow>,
    /// `ephemeris.sigma_required_m − keplerian_matched.sigma_required_m` (m) — the
    /// size-controlled difference. Absent whenever `keplerian_matched` is.
    #[serde(skip_serializing_if = "Option::is_none")]
    pub sigma_requirement_delta_vs_keplerian_matched_m: Option<f64>,
    /// `ephemeris.sigma_required_m / keplerian_matched.sigma_required_m` — the
    /// size-controlled ratio. Absent whenever `keplerian_matched` is.
    #[serde(skip_serializing_if = "Option::is_none")]
    pub sigma_requirement_ratio_vs_keplerian_matched: Option<f64>,
    /// The perturbed (J2 + C22 + Earth/Sun third body) twin of the same elements.
    pub perturbed: SigmaRequirementRow,
    /// `ephemeris.sigma_required_m − keplerian.sigma_required_m` (m).
    #[serde(skip_serializing_if = "Option::is_none")]
    pub sigma_requirement_delta_vs_keplerian_m: Option<f64>,
    /// `ephemeris.sigma_required_m / keplerian.sigma_required_m` (dimensionless).
    #[serde(skip_serializing_if = "Option::is_none")]
    pub sigma_requirement_ratio_vs_keplerian: Option<f64>,
    /// `ephemeris.sigma_required_m − perturbed.sigma_required_m` (m).
    #[serde(skip_serializing_if = "Option::is_none")]
    pub sigma_requirement_delta_vs_perturbed_m: Option<f64>,
    /// `ephemeris.sigma_required_m / perturbed.sigma_required_m` (dimensionless).
    #[serde(skip_serializing_if = "Option::is_none")]
    pub sigma_requirement_ratio_vs_perturbed: Option<f64>,
    /// Unit and provenance class of every numeric field this block emits.
    pub units: serde_json::Value,
    /// Honest scope note.
    pub note: &'static str,
}

/// Unit and provenance class for every numeric field the ephemeris provenance block and
/// the σ_URE-requirement comparison emit — paths relative to the report root, the same
/// contract [`ANTENNA_UNITS`] publishes.
///
/// The provenance column is doing real work here: `published-ephemeris` marks a figure
/// that came out of a kernel-derived state table, `published-elements` one that came out
/// of a published constellation definition, and `modelled-keplerian` /
/// `modelled-perturbed` the illustrative geometries. A reader can tell which is which
/// from the class alone, without knowing how the run was configured.
const EPHEMERIS_UNITS: &[(&str, &str, &str, &str)] = &[
    // (JSON path, unit, provenance class, note — "" for no note)
    (
        "ephemeris.n_sats",
        "count",
        "input",
        "satellites in the retrieved file",
    ),
    (
        "ephemeris.n_epochs",
        "count",
        "input",
        "tabulated epochs per satellite; absent for a closed-form element set",
    ),
    (
        "ephemeris.covered_until_s",
        "s",
        "input",
        "last epoch the table covers, past the file epoch; the sweep is refused beyond it",
    ),
    (
        "ephemeris.published_frame_tie_angle_deg",
        "deg",
        "computed",
        "angle between the OP-frame z axis published elements are stated in and the lunar spin axis MCI z means here; lunar_ephemeris::published_frame_tie_angle_deg",
    ),
    (
        "ephemeris_comparison.alert_limit_m",
        "m",
        "input",
        "the HPL bound the requirement is taken against",
    ),
    (
        "ephemeris_comparison.sigma_ure_m",
        "m",
        "input",
        "the sigma the sweeps ran at; the requirement inverts the linear PL scaling in it",
    ),
    (
        "ephemeris_comparison.sigma_requirement_delta_vs_keplerian_m",
        "m",
        "computed",
        "THE REVISION: ephemeris sigma_required_m - keplerian sigma_required_m",
    ),
    (
        "ephemeris_comparison.sigma_requirement_ratio_vs_keplerian",
        "dimensionless",
        "computed",
        "ephemeris sigma_required_m / keplerian sigma_required_m",
    ),
    (
        "ephemeris_comparison.sigma_requirement_delta_vs_perturbed_m",
        "m",
        "computed",
        "ephemeris sigma_required_m - perturbed sigma_required_m",
    ),
    (
        "ephemeris_comparison.sigma_requirement_ratio_vs_perturbed",
        "dimensionless",
        "computed",
        "ephemeris sigma_required_m / perturbed sigma_required_m",
    ),
];

/// Unit and provenance class of the per-geometry row fields. The provenance class is
/// *per row*, so it is supplied by the row itself (`SigmaRequirementRow::provenance`) and
/// these entries name it as `per-row`; the unit is fixed.
const SIGMA_ROW_UNITS: &[(&str, &str, &str)] = &[
    ("n_sats", "count", "satellites in this geometry"),
    (
        "coverage_pct",
        "percent",
        ">= 4 satellites AND PDOP below threshold",
    ),
    (
        "n_pl_samples",
        "count",
        "samples that admitted an ARAIM protection level",
    ),
    (
        "hpl_max_m",
        "m",
        "worst horizontal protection level over the service volume at sigma_ure_m",
    ),
    (
        "hpl_p95_m",
        "m",
        "95th-percentile (nearest-rank) horizontal protection level",
    ),
    (
        "pl_availability_pct",
        "percent",
        "PL samples already meeting the alert limit at sigma_ure_m",
    ),
    (
        "sigma_required_m",
        "m",
        "THE REQUIREMENT: alert_limit_m * sigma_ure_m / hpl_max_m",
    ),
    (
        "sigma_required_p95_m",
        "m",
        "the same inversion taken at hpl_p95_m",
    ),
];

/// Render [`EPHEMERIS_UNITS`] and [`SIGMA_ROW_UNITS`] as the comparison block's `units`
/// object, with one entry per emitted numeric path (the per-geometry rows expanded for
/// each of the three geometries, each carrying that geometry's own provenance class).
fn ephemeris_units_block(rows: &[(&str, &str)]) -> serde_json::Value {
    let mut m = serde_json::Map::new();
    let mut put = |path: String, unit: &str, provenance: &str, note: &str| {
        let mut e = serde_json::Map::new();
        e.insert("unit".into(), serde_json::Value::String(unit.into()));
        e.insert(
            "provenance".into(),
            serde_json::Value::String(provenance.into()),
        );
        if !note.is_empty() {
            e.insert("note".into(), serde_json::Value::String(note.into()));
        }
        m.insert(path, serde_json::Value::Object(e));
    };
    for (path, unit, provenance, note) in EPHEMERIS_UNITS {
        put((*path).into(), unit, provenance, note);
    }
    for (geometry, provenance) in rows {
        for (field, unit, note) in SIGMA_ROW_UNITS {
            put(
                format!("ephemeris_comparison.{geometry}.{field}"),
                unit,
                provenance,
                note,
            );
        }
    }
    serde_json::Value::Object(m)
}

/// serde `skip_serializing_if` predicate: omit a `false` boolean.
fn skip_if_false(b: &bool) -> bool {
    !*b
}

impl LunarServiceScenario {
    fn grid(&self) -> Vec<Selenographic> {
        let mut pts = Vec::new();
        let mut lat = self.lat_min_deg;
        let lat_step = if self.lat_step_deg.abs() < 1e-9 {
            1.0
        } else {
            self.lat_step_deg.abs()
        };
        let n_lat = (((self.lat_max_deg + 1e-9 - self.lat_min_deg) / lat_step)
            .ceil()
            .max(0.0) as usize)
            .saturating_add(2);
        for _ in 0..n_lat {
            if lat > self.lat_max_deg + 1e-9 {
                break;
            }
            let mut lon = self.lon_min_deg;
            let lon_step = if self.lon_step_deg.abs() < 1e-9 {
                1.0
            } else {
                self.lon_step_deg.abs()
            };
            // Avoid duplicating the longitude wrap (−180 and +180 are the same meridian).
            let lon_hi = if (self.lon_max_deg - self.lon_min_deg - 360.0).abs() < 1e-6 {
                self.lon_max_deg - lon_step + 1e-9
            } else {
                self.lon_max_deg + 1e-9
            };
            let n_lon = (((lon_hi - self.lon_min_deg) / lon_step).ceil().max(0.0) as usize)
                .saturating_add(2);
            for _ in 0..n_lon {
                if lon > lon_hi {
                    break;
                }
                pts.push(Selenographic {
                    lat_rad: lat.to_radians(),
                    lon_rad: lon.to_radians(),
                    alt_m: 0.0,
                });
                lon += lon_step;
            }
            lat += lat_step;
        }
        pts
    }

    fn times(&self) -> Vec<f64> {
        let mut ts = Vec::new();
        let horizon_s = self.horizon_hours * 3600.0;
        let step_s = if self.step_min.abs() < 1e-9 {
            3600.0
        } else {
            self.step_min.abs() * 60.0
        };
        let mut t = 0.0;
        let n_t = (((horizon_s - 1e-6) / step_s).ceil().max(0.0) as usize).saturating_add(2);
        for _ in 0..n_t {
            if t >= horizon_s - 1e-6 {
                break;
            }
            ts.push(t);
            t += step_s;
        }
        if ts.is_empty() {
            ts.push(0.0);
        }
        ts
    }

    /// The illustrative constellation this scenario's element fields describe, and the
    /// satellite count actually used.
    ///
    /// The constellation builder's cap was lifted to 24 (see [`LunarConstellation::illustrative_lcns`],
    /// and the L10 test asserting it), but this scenario clamp was left at the old value of
    /// 12, so any requested count above 12 was silently reduced and an N-sweep appeared to
    /// saturate there. The two are aligned here so larger constellations are actually
    /// evaluated.
    fn keplerian_sats(&self) -> (Vec<LunarSat>, usize) {
        let n = self.n_sats.clamp(1, 24);
        (self.keplerian_sats_at(n), n)
    }

    /// The same illustrative design at an ARBITRARY satellite count.
    ///
    /// The count is not a label on this constellation, it is part of its geometry: both the
    /// RAAN and the mean anomaly are spread as `360 k / n`, so a five-satellite set is a
    /// differently phased constellation and not the eight-satellite one with three members
    /// hidden. Anything comparing against a retrieved set of a different size has to rebuild
    /// here rather than re-report, or it prints one constellation's coverage under another
    /// one's satellite count.
    fn keplerian_sats_at(&self, n: usize) -> Vec<LunarSat> {
        let sma_m = self.sma_km * 1000.0;
        let n = n.clamp(1, 24);
        (0..n)
            .map(|k| LunarSat {
                sma_m,
                eccentricity: self.eccentricity,
                inc_deg: self.inc_deg,
                raan_deg: 360.0 * (k as f64) / (n as f64),
                argp_deg: self.argp_deg,
                mean_anom_deg: 360.0 * (k as f64) / (n as f64),
            })
            .collect()
    }

    /// The perturbed twin of the SAME epoch elements: each satellite numerically
    /// propagated under the full ELFO model (J2 + C22 + Earth/Sun third body). Much
    /// heavier than the closed-form Keplerian path — one adaptive integration per
    /// satellite per epoch.
    fn perturbed_constellation(
        sats: &[LunarSat],
    ) -> crate::lunar_perturbed::PerturbedConstellation {
        use crate::lunar_perturbed as lp;
        let states0 = sats
            .iter()
            .map(|s| {
                lp::elements_to_state(
                    s.sma_m,
                    s.eccentricity,
                    s.inc_deg,
                    s.raan_deg,
                    s.argp_deg,
                    s.mean_anom_deg,
                )
            })
            .collect();
        lp::PerturbedConstellation::new(
            states0,
            lp::LunarPerturbations::elfo_full(),
            lp::default_tolerance(),
        )
    }

    /// Build the illustrative constellation, sweep the grid × horizon, and summarise the
    /// DOP / coverage / availability + protection-level envelope. Deterministic (pure
    /// geometry; no randomness).
    ///
    /// # Panics
    ///
    /// Only when [`Self::ephemeris_path`] is set and the named file cannot be read or
    /// parsed — the one part of this scenario that touches the world outside it. With the
    /// path unset (the default, and every pre-existing caller) this cannot fail. Use
    /// [`Self::try_run`] when a scenario may name a file.
    pub fn run(&self) -> LunarServiceReport {
        self.try_run()
            .unwrap_or_else(|e| panic!("moonlight-service-volume: {e}"))
    }

    /// [`Self::run`], returning the ephemeris-loading failure instead of panicking.
    ///
    /// With [`Self::ephemeris_path`] unset this is exactly [`Self::run`] and always
    /// succeeds. With it set, the named file supplies the headline geometry, and the
    /// report additionally carries the provenance block and the σ_URE-requirement
    /// comparison against the unchanged Keplerian and perturbed results.
    pub fn try_run(&self) -> Result<LunarServiceReport, String> {
        let (sats, n) = self.keplerian_sats();
        let Some(path) = self.ephemeris_path.as_deref() else {
            // Unchanged path: exactly what this scenario emitted before `ephemeris_path`
            // existed, byte for byte.
            return Ok(if self.perturbed {
                self.sweep(&Self::perturbed_constellation(&sats), n, true).0
            } else {
                self.sweep(&LunarConstellation::new(sats), n, false).0
            });
        };

        let eph = crate::lunar_ephemeris::LunarEphemeris::load(path)?;
        // An extrapolated state is not an ephemeris: refuse a horizon the table does not
        // cover rather than quietly running off the end of it.
        if let Some(until) = eph.covered_until_s() {
            let last = self.times().last().copied().unwrap_or(0.0);
            if last > until + 1e-6 {
                return Err(format!(
                    "lunar ephemeris {path} covers {until} s past its epoch but the scenario \
                     horizon reaches {last} s; shorten horizon_hours or retrieve a longer arc \
                     (extrapolating a tabulated ephemeris is refused)"
                ));
            }
        }

        let (mut report, ex_eph) = self.sweep(&eph, eph.n_sats(), false);
        // The headline geometry is no longer the illustrative set, so the headline note
        // must stop calling it that. The default note is untouched.
        report.note = match eph.format() {
            crate::lunar_ephemeris::EphemerisFormat::States => {
                "Headline geometry is a RETRIEVED, tabulated Moon-centred state ephemeris \
                 (provenance class published-ephemeris) named by ephemeris_path, not the \
                 illustrative LCNS-class set; see the `ephemeris` block for the bytes and \
                 their source. DOP geometry reuses the gnss_lib_py-validated kernel; the \
                 LNIS integrity budget is unchanged and remains MODELLED. The illustrative \
                 Keplerian and perturbed results are retained in `ephemeris_comparison`."
            }
            crate::lunar_ephemeris::EphemerisFormat::Elements => {
                "Headline geometry is a RETRIEVED, published constellation DEFINITION \
                 (provenance class published-elements) named by ephemeris_path, propagated \
                 by this engine's Kepler solver — not the illustrative LCNS-class set; see \
                 the `ephemeris` block for the bytes, their source and the published-frame \
                 tie. DOP geometry reuses the gnss_lib_py-validated kernel; the LNIS \
                 integrity budget is unchanged and remains MODELLED. The illustrative \
                 Keplerian and perturbed results are retained in `ephemeris_comparison`."
            }
        };
        let (kep, ex_kep) = self.sweep(&LunarConstellation::new(sats.clone()), n, false);
        let (per, ex_per) = self.sweep(&Self::perturbed_constellation(&sats), n, true);

        let row = |geometry: &'static str,
                   provenance: &str,
                   r: &LunarServiceReport,
                   ex: &SweepExtras| SigmaRequirementRow {
            geometry,
            provenance: provenance.to_string(),
            n_sats: r.n_sats,
            coverage_pct: r.coverage_pct,
            n_pl_samples: r.n_pl_samples,
            hpl_max_m: r.hpl_max_m,
            hpl_p95_m: ex.hpl_p95_m(),
            pl_availability_pct: r.pl_availability_pct,
            sigma_required_m: sigma_required_m(self.alert_limit_m, self.sigma_ure_m, r.hpl_max_m),
            sigma_required_p95_m: sigma_required_m(
                self.alert_limit_m,
                self.sigma_ure_m,
                ex.hpl_p95_m(),
            ),
        };
        let eph_class = eph.provenance_class();
        let e_row = row("ephemeris", eph_class, &report, &ex_eph);
        // The like-for-like baseline: the illustrative set at the RETRIEVED count. Computed
        // only when the counts differ, so a run whose retrieved set is already the same size
        // emits exactly the bytes it emitted before this field existed.
        let matched = (report.n_sats != n).then(|| {
            let m_sats = self.keplerian_sats_at(report.n_sats);
            let m_n = m_sats.len();
            let (m_kep, ex_m) = self.sweep(&LunarConstellation::new(m_sats), m_n, false);
            row("keplerian-matched", "modelled-keplerian", &m_kep, &ex_m)
        });
        let k_row = row("keplerian", "modelled-keplerian", &kep, &ex_kep);
        let p_row = row("perturbed", "modelled-perturbed", &per, &ex_per);
        let delta = |a: Option<f64>, b: Option<f64>| match (a, b) {
            (Some(x), Some(y)) => Some(x - y),
            _ => None,
        };
        let ratio = |a: Option<f64>, b: Option<f64>| match (a, b) {
            (Some(x), Some(y)) if y != 0.0 => Some(x / y),
            _ => None,
        };
        let comparison = SigmaRequirementComparison {
            alert_limit_m: self.alert_limit_m,
            sigma_ure_m: self.sigma_ure_m,
            sigma_requirement_delta_vs_keplerian_m: delta(
                e_row.sigma_required_m,
                k_row.sigma_required_m,
            ),
            sigma_requirement_ratio_vs_keplerian: ratio(
                e_row.sigma_required_m,
                k_row.sigma_required_m,
            ),
            sigma_requirement_delta_vs_perturbed_m: delta(
                e_row.sigma_required_m,
                p_row.sigma_required_m,
            ),
            sigma_requirement_ratio_vs_perturbed: ratio(
                e_row.sigma_required_m,
                p_row.sigma_required_m,
            ),
            sigma_requirement_delta_vs_keplerian_matched_m: delta(
                e_row.sigma_required_m,
                matched.as_ref().and_then(|m| m.sigma_required_m),
            ),
            sigma_requirement_ratio_vs_keplerian_matched: ratio(
                e_row.sigma_required_m,
                matched.as_ref().and_then(|m| m.sigma_required_m),
            ),
            units: ephemeris_units_block(&{
                let mut g = vec![
                    ("ephemeris", eph_class),
                    ("keplerian", "modelled-keplerian"),
                    ("perturbed", "modelled-perturbed"),
                ];
                // Document the matched row only when it is emitted: a units entry for a
                // field the document does not carry is an orphan the global gate rejects.
                if matched.is_some() {
                    g.push(("keplerian_matched", "modelled-keplerian"));
                }
                g
            }),
            ephemeris: e_row,
            keplerian: k_row,
            keplerian_matched: matched,
            perturbed: p_row,
            note: "The Keplerian row is the pre-existing published result, recomputed \
                   unchanged from the same scenario fields; it is emitted BESIDE the \
                   ephemeris row, never replaced by it. sigma_required_m inverts the exact \
                   linear scaling of the ARAIM protection level in the ranging sigma at zero \
                   nominal bias, so it is the sigma at which EVERY protection-level sample \
                   over the service volume meets the alert limit. Nothing is tuned to bring \
                   the geometries together: the delta and the ratio ARE the result. The DOP \
                   kernel and the LNIS integrity budget are unchanged from the Keplerian run \
                   — only the geometry differs. When the retrieved set has a DIFFERENT \
                   satellite count from the scenario's, a `keplerian_matched` row carries the \
                   illustrative constellation re-run at the retrieved count, so the \
                   size-controlled comparison is available beside the as-configured one; \
                   without it a five-satellite retrieved set is scored against an \
                   eight-satellite illustrative one and the design and the size are \
                   conflated.",
        };
        report.ephemeris = Some(crate::lunar_ephemeris::source_block(&eph));
        report.ephemeris_comparison = Some(comparison);
        Ok(report)
    }

    /// Sweep the service volume against a constellation geometry (idealized or perturbed) and
    /// summarise DOP / coverage / availability + the protection-level envelope. Generic over the
    /// [`PositionsMcmf`] provider; deterministic (pure geometry; no randomness). The idealized
    /// path (`perturbed = false`) is numerically identical to the pre-refactor `run`.
    ///
    /// The second element is the per-sample detail the report summarises away
    /// ([`SweepExtras`]); it is internal, never serialised, and cannot change the report.
    fn sweep<C: PositionsMcmf + ?Sized>(
        &self,
        constellation: &C,
        n: usize,
        perturbed: bool,
    ) -> (LunarServiceReport, SweepExtras) {
        let grid = self.grid();
        let times = self.times();
        let elev_mask_rad = self.elev_mask_deg.to_radians();

        let stats = coverage(
            constellation,
            &grid,
            &times,
            elev_mask_rad,
            self.pdop_threshold,
        );

        // Protection-level envelope over the same service volume.
        let budget = IntegrityBudget {
            p_hmi_vert: self.p_hmi,
            p_hmi_horz: self.p_hmi,
            p_fa: 1e-5,
        };
        let mut hpl_min = f64::INFINITY;
        let mut hpl_max = 0.0_f64;
        let mut vpl_min = f64::INFINITY;
        let mut vpl_max = 0.0_f64;
        let mut n_pl = 0usize;
        let mut n_pl_avail = 0usize;
        let mut hpl_all: Vec<f64> = Vec::new();
        for &t in &times {
            let sats_mcmf = constellation.positions_mcmf(t);
            for &g in &grid {
                // Only the satellites above the mask feed the ARAIM PL — same visibility
                // gate as the DOP path.
                let user = selenographic_to_mcmf(g);
                let vis = visible_sat_positions(user, &sats_mcmf, elev_mask_rad);
                if let Some(pl) =
                    lunar_protection_level_with_sigma(g, &vis, self.sigma_ure_m, budget)
                {
                    hpl_min = hpl_min.min(pl.hpl_m);
                    hpl_max = hpl_max.max(pl.hpl_m);
                    vpl_min = vpl_min.min(pl.vpl_m);
                    vpl_max = vpl_max.max(pl.vpl_m);
                    hpl_all.push(pl.hpl_m);
                    n_pl += 1;
                    if pl.hpl_m <= self.alert_limit_m {
                        n_pl_avail += 1;
                    }
                }
            }
        }

        // Optional per-satellite geometry export for one site (additive; None by default).
        // The antenna block is a second, independently optional layer on top of it.
        let antenna = self.export_antenna.filter(ExportAntennaCfg::is_usable);
        let mut antenna_pattern: Option<AntennaPatternBlock> = None;
        let geom: Option<Vec<GeometrySample>> =
            match (self.export_site_lat_deg, self.export_site_lon_deg) {
                (Some(lat), Some(lon)) => {
                    let site = Selenographic {
                        lat_rad: lat.to_radians(),
                        lon_rad: lon.to_radians(),
                        alt_m: 0.0,
                    };
                    let user = selenographic_to_mcmf(site);
                    // Antenna constants, hoisted out of the loop: they depend on the dish
                    // and the carrier, never on the geometry.
                    let ant = antenna.map(|a| {
                        let g0 = crate::antenna::boresight_gain_dbi(
                            a.diameter_m,
                            a.carrier_hz,
                            a.efficiency,
                        );
                        let sym_half = 0.5 * crate::antenna::symmetric_beamwidth_rad(g0);
                        (a, g0, sym_half)
                    });
                    let mut out = Vec::new();
                    // Per-epoch in-beam tallies, so the worst single epoch is reported and
                    // not just the horizon mean.
                    let mut n_eval = 0usize;
                    let mut n_pattern = 0usize;
                    let mut n_symmetric = 0usize;
                    let mut max_abs_epoch_delta = 0usize;
                    for &t in &times {
                        let sats_mcmf = constellation.positions_mcmf(t);
                        let (mut ep_pattern, mut ep_symmetric) = (0usize, 0usize);
                        for (k, &sp) in sats_mcmf.iter().enumerate() {
                            let (az, el, rng_m) = topocentric(user, sp);
                            let visible = el >= self.elev_mask_deg;
                            let mut row = GeometrySample {
                                t_s: t,
                                sat: k,
                                az_deg: az,
                                el_deg: el,
                                range_km: rng_m / 1000.0,
                                visible,
                                off_boresight_deg: None,
                                pattern_gain_dbi: None,
                                in_beam_pattern: None,
                                in_beam_symmetric: None,
                            };
                            if let Some((a, _g0, sym_half)) = ant {
                                let theta = nadir_off_boresight_rad(sp, user);
                                let in_pattern = crate::antenna::within_half_power_beam(
                                    a.diameter_m,
                                    a.carrier_hz,
                                    a.efficiency,
                                    theta,
                                );
                                let in_symmetric = theta <= sym_half;
                                row.off_boresight_deg = Some(theta.to_degrees());
                                row.pattern_gain_dbi = Some(crate::antenna::pattern_gain_dbi(
                                    a.diameter_m,
                                    a.carrier_hz,
                                    a.efficiency,
                                    theta,
                                ));
                                row.in_beam_pattern = Some(in_pattern);
                                row.in_beam_symmetric = Some(in_symmetric);
                                // The counts are over servable links only: a satellite the
                                // site cannot see is not serving it, whatever its beam does.
                                if visible {
                                    n_eval += 1;
                                    if in_pattern {
                                        n_pattern += 1;
                                        ep_pattern += 1;
                                    }
                                    if in_symmetric {
                                        n_symmetric += 1;
                                        ep_symmetric += 1;
                                    }
                                }
                            }
                            out.push(row);
                        }
                        max_abs_epoch_delta =
                            max_abs_epoch_delta.max(ep_pattern.abs_diff(ep_symmetric));
                    }
                    if let Some((a, g0, sym_half)) = ant {
                        let hpbw =
                            crate::antenna::half_power_beamwidth_rad(a.diameter_m, a.carrier_hz);
                        let sym_full = 2.0 * sym_half;
                        let n_ep = times.len().max(1) as f64;
                        antenna_pattern = Some(AntennaPatternBlock {
                            diameter_m: a.diameter_m,
                            carrier_hz: a.carrier_hz,
                            efficiency: a.efficiency,
                            boresight_gain_dbi: g0,
                            half_power_beamwidth_deg: hpbw.to_degrees(),
                            half_power_half_angle_deg: (0.5 * hpbw).to_degrees(),
                            first_null_deg: crate::antenna::first_null_angle_rad(
                                a.diameter_m,
                                a.carrier_hz,
                            )
                            .map(f64::to_degrees),
                            symmetric_beamwidth_deg: sym_full.to_degrees(),
                            symmetric_half_angle_deg: sym_half.to_degrees(),
                            symmetric_relation_constant_deg2:
                                crate::antenna::SYMMETRIC_GAIN_BEAMWIDTH_CONST_DEG2,
                            symmetric_implied_efficiency_70deg_rule:
                                crate::antenna::symmetric_relation_implied_efficiency(
                                    70.0_f64.to_radians(),
                                ),
                            symmetric_implied_efficiency_uniform_aperture:
                                crate::antenna::symmetric_relation_implied_efficiency(
                                    crate::antenna::UNIFORM_APERTURE_HPBW_COEFF,
                                ),
                            beamwidth_ratio_symmetric_over_pattern: sym_full / hpbw,
                            n_links_evaluated: n_eval,
                            in_beam_pattern_links: n_pattern,
                            in_beam_symmetric_links: n_symmetric,
                            in_beam_correction_links: n_pattern as i64 - n_symmetric as i64,
                            in_beam_pattern_sats_per_epoch: n_pattern as f64 / n_ep,
                            in_beam_symmetric_sats_per_epoch: n_symmetric as f64 / n_ep,
                            in_beam_correction_sats_per_epoch: (n_pattern as f64
                                - n_symmetric as f64)
                                / n_ep,
                            max_abs_epoch_correction_sats: max_abs_epoch_delta,
                            units: antenna_units_block(),
                            note: "The real Airy aperture pattern and the symmetric \
                                   gain-to-beamwidth approximation are BOTH reported; neither \
                                   replaces the other. The approximation carries an aperture \
                                   efficiency of its own (0.641 against the 70 lambda/D rule), \
                                   so on a dish of a different efficiency it returns a beam of \
                                   the wrong width. MODELLED geometry: the illustrative \
                                   LCNS-class constellation, a nadir-pointing transmit dish, \
                                   and no pointing error, terrain masking or feed spillover.",
                        });
                    }
                    Some(out)
                }
                _ => None,
            };

        let report = LunarServiceReport {
            n_sats: n,
            n_grid_points: grid.len(),
            n_epochs: times.len(),
            n_samples: stats.n_samples,
            elev_mask_deg: self.elev_mask_deg,
            pdop_threshold: self.pdop_threshold,
            alert_limit_m: self.alert_limit_m,
            sigma_ure_m: self.sigma_ure_m,
            coverage_pct: stats.coverage_fraction * 100.0,
            min_sats: stats.min_sats,
            max_sats: stats.max_sats,
            pdop_min: stats.pdop_min.unwrap_or(0.0),
            pdop_mean: stats.pdop_mean.unwrap_or(0.0),
            pdop_max: stats.pdop_max.unwrap_or(0.0),
            hpl_min_m: if hpl_min.is_finite() { hpl_min } else { 0.0 },
            hpl_max_m: hpl_max,
            vpl_min_m: if vpl_min.is_finite() { vpl_min } else { 0.0 },
            vpl_max_m: vpl_max,
            n_pl_samples: n_pl,
            pl_availability_pct: if n_pl == 0 {
                0.0
            } else {
                n_pl_avail as f64 / n_pl as f64 * 100.0
            },
            per_sat_geometry: geom,
            antenna_pattern,
            note: "Illustrative, public-source LCNS-class constellation; not affiliated with ESA. \
                   DOP geometry reuses the gnss_lib_py-validated kernel; coverage/integrity MODELLED.",
            perturbed,
            ephemeris: None,
            ephemeris_comparison: None,
        };
        (report, SweepExtras::new(hpl_all))
    }
}

/// Per-sample detail one [`LunarServiceScenario::sweep`] produced that the report
/// summarises away. Internal: never serialised, never reachable from the report, so it
/// cannot move a published byte. It exists so the σ_URE requirement can be taken at a
/// robust order statistic as well as at the worst sample.
#[derive(Clone, Debug, Default)]
struct SweepExtras {
    /// Every horizontal protection level the sweep produced, ascending.
    hpl_sorted_m: Vec<f64>,
}

impl SweepExtras {
    fn new(mut hpl: Vec<f64>) -> Self {
        hpl.sort_by(|a, b| a.partial_cmp(b).unwrap_or(std::cmp::Ordering::Equal));
        Self { hpl_sorted_m: hpl }
    }

    /// Nearest-rank 95th percentile of the HPL samples; `0.0` when there were none (the
    /// same "no protection level" sentinel `hpl_max_m` uses).
    fn hpl_p95_m(&self) -> f64 {
        let n = self.hpl_sorted_m.len();
        if n == 0 {
            return 0.0;
        }
        let rank = ((0.95 * n as f64).ceil() as usize).clamp(1, n);
        self.hpl_sorted_m[rank - 1]
    }
}

/// Render a [`LunarServiceReport`] as a self-contained SVG summary: the visible-sat and
/// PDOP envelopes and the coverage/availability headline over the service volume.
pub fn lunar_service_svg(r: &LunarServiceReport) -> String {
    let (w, h) = (820.0_f64, 360.0_f64);
    let (ml, mr, mt, mb) = (70.0_f64, 20.0_f64, 36.0_f64, 50.0_f64);
    let (pw, ph) = (w - ml - mr, h - mt - mb);
    // PDOP bar chart: min / mean / max.
    let vals = [
        ("PDOP min", r.pdop_min),
        ("PDOP mean", r.pdop_mean),
        ("PDOP max", r.pdop_max),
    ];
    let y_max = (r.pdop_max * 1.2).max(r.pdop_threshold * 1.2).max(1.0);
    let yof = |v: f64| mt + ph - (v.min(y_max) / y_max) * ph;
    let mut svg = String::new();
    svg.push_str(&format!(
        "<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"{w:.0}\" height=\"{h:.0}\" font-family=\"sans-serif\" font-size=\"12\" fill=\"#bcb3a3\">"
    ));
    svg.push_str(&format!(
        "<rect width=\"{w:.0}\" height=\"{h:.0}\" fill=\"#0c0b08\"/>"
    ));
    svg.push_str(&format!(
        "<text x=\"{ml:.0}\" y=\"18\" font-size=\"15\" font-weight=\"bold\">Lunar service volume — {} sats, {} pts × {} epochs: {:.1}% coverage (PDOP&lt;{:.1})</text>",
        r.n_sats, r.n_grid_points, r.n_epochs, r.coverage_pct, r.pdop_threshold
    ));
    svg.push_str(&format!(
        "<text x=\"{ml:.0}\" y=\"32\" font-size=\"11\">sats {}–{} | HPL {:.0}–{:.0} m | VPL {:.0}–{:.0} m | PL avail {:.1}% (AL {:.0} m, σ_URE {:.0} m)</text>",
        r.min_sats, r.max_sats, r.hpl_min_m, r.hpl_max_m, r.vpl_min_m, r.vpl_max_m, r.pl_availability_pct, r.alert_limit_m, r.sigma_ure_m
    ));
    // PDOP threshold line.
    svg.push_str(&format!(
        "<line x1=\"{:.1}\" y1=\"{:.1}\" x2=\"{:.1}\" y2=\"{:.1}\" stroke=\"#e5645a\" stroke-dasharray=\"4 3\"/>",
        ml,
        yof(r.pdop_threshold),
        ml + pw,
        yof(r.pdop_threshold)
    ));
    let bar_w = pw / (vals.len() as f64 * 2.0);
    for (i, (label, v)) in vals.iter().enumerate() {
        let x = ml + (i as f64 * 2.0 + 0.5) * bar_w;
        let y = yof(*v);
        let bh = (mt + ph) - y;
        svg.push_str(&format!(
            "<rect x=\"{x:.1}\" y=\"{y:.1}\" width=\"{bar_w:.1}\" height=\"{bh:.1}\" fill=\"#e0bd84\"/>"
        ));
        svg.push_str(&format!(
            "<text x=\"{:.1}\" y=\"{:.1}\" font-size=\"11\" text-anchor=\"middle\">{} {:.2}</text>",
            x + bar_w / 2.0,
            (mt + ph) + 16.0,
            label,
            v
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
    svg.push_str("</svg>");
    svg
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::lunar::{lunar_araim, lunar_sky_geometry};
    use std::f64::consts::FRAC_PI_2;

    fn budget() -> IntegrityBudget {
        IntegrityBudget {
            p_hmi_vert: 1e-4,
            p_hmi_horz: 1e-4,
            p_fa: 1e-5,
        }
    }

    /// The DOP path is an exact reuse of the validated kernel: `service_dop` on a
    /// hand-set geometry equals a direct `orbit::dop` on the same visible LOS positions.
    #[test]
    fn dop_reuses_validated_kernel() {
        // User on the near-side equator; six satellites high overhead at 8000 km slant.
        let user = [R_MOON_M, 0.0, 0.0];
        let azels = [
            (0.0, 75.0),
            (60.0, 60.0),
            (120.0, 50.0),
            (200.0, 65.0),
            (270.0, 55.0),
            (320.0, 70.0),
        ];
        let sats = lunar_sky_geometry(user, 8.0e6, &azels);
        let mask = 5.0_f64.to_radians();
        let via_service = service_dop(user, &sats, mask).expect("≥4 visible");
        // The identity: filter to the same visible set, call the kernel directly.
        let vis = visible_sat_positions(user, &sats, mask);
        let direct = crate::orbit::dop(user, &vis).expect("≥4 visible");
        assert_eq!(
            via_service, direct,
            "service_dop must be the validated kernel"
        );
    }

    /// The generalised protection level reduces to the existing south-pole result: at
    /// the south pole, with the same geometry and budget, `lunar_protection_level`
    /// equals a direct `lunar::lunar_araim` call (it is that same machinery).
    #[test]
    fn pl_reduces_to_south_pole_case() {
        // Reuse the exact south-pole user + a six-relay sky the south-pole pass uses.
        let sp = Selenographic {
            lat_rad: -FRAC_PI_2,
            lon_rad: 0.0,
            alt_m: 0.0,
        };
        let user = selenographic_to_mcmf(sp);
        let base: [(f64, f64); 6] = [
            (10.0, 70.0),
            (70.0, 35.0),
            (140.0, 55.0),
            (210.0, 28.0),
            (280.0, 60.0),
            (330.0, 40.0),
        ];
        let sats = lunar_sky_geometry(user, 6.0e6, &base);

        // Reference: the existing lunar.rs south-pole PL machinery, called directly.
        let resid = vec![0.0; sats.len()];
        let reference = lunar_araim(user, &sats, &resid, budget()).expect("ref PL");

        // Generalised: the same user point expressed selenographically, same sats.
        let generalised = lunar_protection_level(sp, &sats, budget()).expect("gen PL");

        assert!(
            (generalised.hpl_m - reference.hpl_m).abs() < 1e-9,
            "HPL {} vs reference {}",
            generalised.hpl_m,
            reference.hpl_m
        );
        assert!(
            (generalised.vpl_m - reference.vpl_m).abs() < 1e-9,
            "VPL {} vs reference {}",
            generalised.vpl_m,
            reference.vpl_m
        );
        assert_eq!(generalised.n_used, reference.n_used);
    }

    /// Sanity monotonicity: adding satellites cannot reduce coverage (more relays ⇒
    /// at least as many available samples ⇒ coverage non-decreasing).
    #[test]
    fn coverage_monotone_in_constellation_size() {
        let grid: Vec<Selenographic> = [-90.0_f64, -80.0, -70.0]
            .iter()
            .flat_map(|&lat| {
                [-120.0_f64, 0.0, 120.0]
                    .iter()
                    .map(move |&lon| Selenographic {
                        lat_rad: lat.to_radians(),
                        lon_rad: lon.to_radians(),
                        alt_m: 0.0,
                    })
            })
            .collect();
        let times: Vec<f64> = (0..6).map(|k| k as f64 * 3600.0).collect();
        let mask = 5.0_f64.to_radians();

        let small = LunarConstellation::illustrative_lcns(4);
        let large = LunarConstellation::illustrative_lcns(8);
        let cs = coverage(&small, &grid, &times, mask, 6.0);
        let cl = coverage(&large, &grid, &times, mask, 6.0);
        assert!(
            cl.coverage_fraction >= cs.coverage_fraction - 1e-12,
            "coverage must be non-decreasing in constellation size: small {} large {}",
            cs.coverage_fraction,
            cl.coverage_fraction
        );
        // And the larger constellation never shows fewer satellites at the best sample.
        assert!(cl.max_sats >= cs.max_sats);
    }

    /// L10: the coverage summary reports the median GDOP order statistic and the fraction
    /// of samples with a usable (< 6) GDOP, both derived from the Validated DOP kernel.
    #[test]
    fn coverage_reports_median_gdop_and_time_below_6() {
        let grid: Vec<Selenographic> = [-90.0_f64, -80.0]
            .iter()
            .flat_map(|&lat| {
                [-120.0_f64, 0.0, 120.0]
                    .iter()
                    .map(move |&lon| Selenographic {
                        lat_rad: lat.to_radians(),
                        lon_rad: lon.to_radians(),
                        alt_m: 0.0,
                    })
            })
            .collect();
        let times: Vec<f64> = (0..8).map(|k| k as f64 * 3600.0).collect();
        let c = coverage(
            &LunarConstellation::illustrative_lcns(8),
            &grid,
            &times,
            5.0_f64.to_radians(),
            6.0,
        );
        // Median GDOP is defined and never below the DOP floor of 1.
        let m = c.gdop_median.expect("some sample had a defined DOP");
        assert!(m >= 1.0, "median GDOP {m}");
        // The time-below-6 fraction is a valid probability.
        assert!((0.0..=1.0).contains(&c.frac_below_gdop6));
    }

    /// L10: the N-sweep reaches N = 24 (the lifted cap, was 12), is deterministic, and
    /// shows availability non-decreasing with constellation size.
    #[test]
    fn n_sweep_reaches_24_and_is_deterministic() {
        assert_eq!(
            LunarConstellation::illustrative_lcns(24).n_sats(),
            24,
            "satellite cap lifted to 24"
        );
        let grid: Vec<Selenographic> = [-90.0_f64, -80.0]
            .iter()
            .map(|&lat| Selenographic {
                lat_rad: lat.to_radians(),
                lon_rad: 0.0,
                alt_m: 0.0,
            })
            .collect();
        let times: Vec<f64> = (0..6).map(|k| k as f64 * 3600.0).collect();
        let mask = 5.0_f64.to_radians();
        let rows = sweep_over_n(4, 24, &grid, &times, mask, 6.0);
        assert_eq!(rows.len(), 21, "N = 4..=24 inclusive");
        assert_eq!(rows[0].n_sats, 4);
        assert_eq!(rows.last().unwrap().n_sats, 24);
        // Deterministic order statistics.
        assert_eq!(rows, sweep_over_n(4, 24, &grid, &times, mask, 6.0));
        // Availability improves with size.
        assert!(rows.last().unwrap().coverage_fraction >= rows[0].coverage_fraction - 1e-12);
    }

    /// Visibility honours the elevation mask: a satellite placed just below the mask is
    /// excluded; raising it above the mask includes it.
    #[test]
    fn visibility_respects_mask() {
        let user = [R_MOON_M, 0.0, 0.0];
        // One satellite at 3° elevation, one at 20°.
        let low = lunar_sky_geometry(user, 5.0e6, &[(0.0, 3.0)]);
        let high = lunar_sky_geometry(user, 5.0e6, &[(0.0, 20.0)]);
        let mask = 5.0_f64.to_radians();
        assert_eq!(
            visible_sats(user, &low, mask).len(),
            0,
            "a 3° satellite must be below a 5° mask"
        );
        assert_eq!(
            visible_sats(user, &high, mask).len(),
            1,
            "a 20° satellite must clear a 5° mask"
        );
        // Boundary: the LOS unit vectors returned are unit-length.
        let v = visible_sats(user, &high, mask);
        let n = (v[0][0] * v[0][0] + v[0][1] * v[0][1] + v[0][2] * v[0][2]).sqrt();
        assert!((n - 1.0).abs() < 1e-12);
    }

    /// `service_dop` returns None with fewer than four visible satellites.
    #[test]
    fn service_dop_none_below_four() {
        let user = [R_MOON_M, 0.0, 0.0];
        let sats = lunar_sky_geometry(user, 5.0e6, &[(0.0, 70.0), (90.0, 60.0), (180.0, 50.0)]);
        assert!(service_dop(user, &sats, 5.0_f64.to_radians()).is_none());
    }

    /// The default constellation propagates to constant geocentric radius bounds and the
    /// elliptical orbit varies its radius between perilune and apolune.
    #[test]
    fn elliptical_orbit_radius_varies_between_peri_and_apo() {
        let c = LunarConstellation::default();
        let s = c.sats[0];
        let a = s.sma_m;
        let e = s.eccentricity;
        let peri = a * (1.0 - e);
        let apo = a * (1.0 + e);
        // Sample one full period and check the radius stays within [peri, apo].
        let n = (MOON_GM_M3_S2 / a.powi(3)).sqrt();
        let period = std::f64::consts::TAU / n;
        let mut rmin = f64::INFINITY;
        let mut rmax = 0.0_f64;
        for k in 0..50 {
            let t = period * k as f64 / 49.0;
            let p = s.position_mci(t);
            let r = (p[0] * p[0] + p[1] * p[1] + p[2] * p[2]).sqrt();
            rmin = rmin.min(r);
            rmax = rmax.max(r);
        }
        assert!(rmin >= peri - 1.0 && rmax <= apo + 1.0);
        assert!(
            rmax - rmin > 0.5 * (apo - peri),
            "should sample a real spread"
        );
    }

    /// The scenario runs deterministically (pure geometry — same inputs, identical JSON).
    #[test]
    fn scenario_is_deterministic() {
        let scn = LunarServiceScenario::default();
        let a = scn.run();
        let b = scn.run();
        assert_eq!(
            serde_json::to_string(&a).unwrap(),
            serde_json::to_string(&b).unwrap()
        );
    }

    /// The scenario produces a self-consistent report: counts add up, the SVG is well
    /// formed, and the JSON carries the honest illustrative/modelled note.
    #[test]
    fn scenario_report_self_consistent() {
        let scn = LunarServiceScenario::default();
        let r = scn.run();
        assert_eq!(r.n_samples, r.n_grid_points * r.n_epochs);
        assert!(r.n_grid_points > 0 && r.n_epochs > 0);
        assert!(r.coverage_pct >= 0.0 && r.coverage_pct <= 100.0);
        assert!(r.pl_availability_pct >= 0.0 && r.pl_availability_pct <= 100.0);
        assert!(r.max_sats >= r.min_sats);
        assert!((r.sigma_ure_m - LUNAR_SIGMA_URE_M).abs() < 1e-9);
        let svg = lunar_service_svg(&r);
        assert!(svg.starts_with("<svg") && svg.ends_with("</svg>"));
        let json = serde_json::to_string(&r).unwrap();
        assert!(json.contains("not affiliated with ESA"));
        assert!(json.contains("MODELLED"));
    }

    /// `topocentric` against geometry whose answer is known without running the code:
    /// straight overhead is elevation 90 deg; a satellite displaced due north / due east
    /// of an equatorial site on the local horizon plane takes azimuth 0 / 90 deg; and the
    /// slant range is the Euclidean distance.
    #[test]
    fn topocentric_matches_hand_computed_geometry() {
        // Equatorial site on the prime meridian: up = +x, east = +y, north = +z.
        let user = [R_MOON_M, 0.0, 0.0];

        let (_, el, rng) = topocentric(user, [R_MOON_M + 1000.0, 0.0, 0.0]);
        assert!((el - 90.0).abs() < 1e-9, "straight up is 90 deg, got {el}");
        assert!((rng - 1000.0).abs() < 1e-6, "range {rng}");

        let (az, el, _) = topocentric(user, [R_MOON_M, 0.0, 1000.0]);
        assert!(
            el.abs() < 1e-9,
            "horizon-plane target has zero elevation, got {el}"
        );
        assert!((az - 0.0).abs() < 1e-9, "due north is azimuth 0, got {az}");

        let (az, el, _) = topocentric(user, [R_MOON_M, 1000.0, 0.0]);
        assert!(
            el.abs() < 1e-9,
            "horizon-plane target has zero elevation, got {el}"
        );
        assert!((az - 90.0).abs() < 1e-9, "due east is azimuth 90, got {az}");

        let (az, _, _) = topocentric(user, [R_MOON_M, -1000.0, 0.0]);
        assert!(
            (az - 270.0).abs() < 1e-9,
            "due west is azimuth 270, got {az}"
        );

        // Below the horizon plane, on the far side of the Moon: negative elevation.
        let (_, el, _) = topocentric(user, [-(R_MOON_M + 1000.0), 0.0, 0.0]);
        assert!(
            el < -80.0,
            "antipodal target is far below the horizon, got {el}"
        );

        // A polar site has a degenerate east direction; azimuth must stay finite there.
        let (az, el, rng) = topocentric([0.0, 0.0, R_MOON_M], [0.0, 0.0, R_MOON_M + 500.0]);
        assert!(az.is_finite() && el.is_finite() && rng.is_finite());
        assert!((el - 90.0).abs() < 1e-9);
    }

    /// The geometry export and the visibility filter are two SEPARATE pieces of code
    /// reading the same geometry (`topocentric` takes an arcsine, `visible_sat_positions`
    /// compares a dot product against sin(mask)). If they ever disagree, the exported
    /// `visible` flag would contradict the coverage statistics computed beside it, so
    /// this pins them together over a whole sweep.
    #[test]
    fn exported_geometry_agrees_with_the_visibility_filter() {
        let scn = LunarServiceScenario {
            n_sats: 8,
            horizon_hours: 6.0,
            step_min: 30.0,
            elev_mask_deg: 5.0,
            export_site_lat_deg: Some(-89.0),
            export_site_lon_deg: Some(0.0),
            ..LunarServiceScenario::default()
        };
        let r = scn.run();
        let geom = r
            .per_sat_geometry
            .as_ref()
            .expect("the export site is set, so the report must carry the geometry");
        assert!(!geom.is_empty());

        let site = Selenographic {
            lat_rad: (-89.0f64).to_radians(),
            lon_rad: 0.0,
            alt_m: 0.0,
        };
        let user = selenographic_to_mcmf(site);
        // The same illustrative constellation `run` builds for this satellite count.
        let sma_m = scn.sma_km * 1000.0;
        let n = scn.n_sats;
        let constellation = LunarConstellation::new(
            (0..n)
                .map(|k| LunarSat {
                    sma_m,
                    eccentricity: scn.eccentricity,
                    inc_deg: scn.inc_deg,
                    raan_deg: 360.0 * (k as f64) / (n as f64),
                    argp_deg: scn.argp_deg,
                    mean_anom_deg: 360.0 * (k as f64) / (n as f64),
                })
                .collect(),
        );
        let mask_rad = scn.elev_mask_deg.to_radians();

        let mut checked = 0usize;
        let mut times: Vec<f64> = geom.iter().map(|g| g.t_s).collect();
        times.dedup();
        for &t in &times {
            let sats = constellation.positions_mcmf(t);
            let vis = visible_sat_positions(user, &sats, mask_rad);
            let n_vis_filter = vis.len();
            let n_vis_export = geom.iter().filter(|g| g.t_s == t && g.visible).count();
            assert_eq!(
                n_vis_filter, n_vis_export,
                "at t = {t} the visibility filter sees {n_vis_filter} satellites but the \
                 export flags {n_vis_export}"
            );
            checked += 1;
        }
        assert!(
            checked >= 12,
            "the sweep must cover the whole horizon, got {checked} epochs"
        );

        // Every exported flag is exactly the mask applied to the exported elevation, and
        // every exported range is positive and finite.
        for g in geom {
            assert_eq!(
                g.visible,
                g.el_deg >= scn.elev_mask_deg,
                "sat {} at t = {}: visible={} but el={} against a {} deg mask",
                g.sat,
                g.t_s,
                g.visible,
                g.el_deg,
                scn.elev_mask_deg
            );
            assert!(
                (0.0..360.0).contains(&g.az_deg),
                "azimuth out of range: {}",
                g.az_deg
            );
            assert!(
                (-90.0..=90.0).contains(&g.el_deg),
                "elevation out of range: {}",
                g.el_deg
            );
            assert!(g.range_km.is_finite() && g.range_km > 0.0);
        }
    }

    /// The export is purely additive: with no export site the report carries no geometry
    /// and is byte-identical to the same scenario before the export existed.
    #[test]
    fn geometry_export_is_off_by_default_and_changes_nothing() {
        let plain = LunarServiceScenario::default();
        let with_site = LunarServiceScenario {
            export_site_lat_deg: Some(-89.0),
            export_site_lon_deg: Some(0.0),
            ..LunarServiceScenario::default()
        };
        let a = plain.run();
        let b = with_site.run();
        assert!(
            a.per_sat_geometry.is_none(),
            "the export must be off by default"
        );
        assert!(b.per_sat_geometry.is_some());

        // Everything the report said before the export existed is unchanged by it.
        let mut va = serde_json::to_value(&a).unwrap();
        let mut vb = serde_json::to_value(&b).unwrap();
        va.as_object_mut().unwrap().remove("per_sat_geometry");
        vb.as_object_mut().unwrap().remove("per_sat_geometry");
        assert_eq!(va, vb);
    }

    /// One latitude/longitude alone is not enough to place a site, so the export stays
    /// off unless BOTH coordinates are given.
    #[test]
    fn geometry_export_needs_both_coordinates() {
        for (lat, lon) in [(Some(-89.0), None), (None, Some(0.0))] {
            let scn = LunarServiceScenario {
                export_site_lat_deg: lat,
                export_site_lon_deg: lon,
                ..LunarServiceScenario::default()
            };
            assert!(
                scn.run().per_sat_geometry.is_none(),
                "a half-specified site ({lat:?}, {lon:?}) must not produce an export"
            );
        }
    }

    /// The signal-in-space ranging accuracy is exposed as a scenario parameter, and the
    /// protection levels are exactly linear in it — which is what makes the sweep a
    /// ranging-accuracy REQUIREMENT over the service volume rather than a pass/fail at
    /// one fixed value. At the default value the report is unchanged.
    #[test]
    fn protection_levels_are_linear_in_the_exposed_sigma() {
        let base = LunarServiceScenario {
            n_sats: 8,
            horizon_hours: 6.0,
            ..LunarServiceScenario::default()
        };
        let at_default = base.run();
        assert!((at_default.sigma_ure_m - LUNAR_SIGMA_URE_M).abs() < 1e-12);

        let unit = LunarServiceScenario {
            sigma_ure_m: 1.0,
            ..base.clone()
        }
        .run();
        let ten = LunarServiceScenario {
            sigma_ure_m: 10.0,
            ..base
        }
        .run();
        assert!(
            (ten.hpl_min_m - 10.0 * unit.hpl_min_m).abs() < 1e-9 * ten.hpl_min_m.abs(),
            "HPL must scale exactly with sigma: {} vs {}",
            ten.hpl_min_m,
            10.0 * unit.hpl_min_m
        );
        assert!(
            (ten.vpl_max_m - 10.0 * unit.vpl_max_m).abs() < 1e-9 * ten.vpl_max_m.abs(),
            "VPL must scale exactly with sigma"
        );
        // The geometry underneath is untouched by a ranging-accuracy change.
        assert_eq!(unit.coverage_pct, ten.coverage_pct);
        assert_eq!(unit.min_sats, ten.min_sats);
        assert_eq!(unit.max_sats, ten.max_sats);
    }

    /// The service-volume constellation builder supports 24 satellites, and the scenario
    /// must not silently truncate below that: a satellite-count sweep that saturates at a
    /// clamp looks exactly like a geometry result, which is the more dangerous failure.
    #[test]
    fn satellite_count_is_not_clamped_below_the_builder_limit() {
        let mk = |n: usize| LunarServiceScenario {
            n_sats: n,
            horizon_hours: 3.0,
            ..LunarServiceScenario::default()
        };
        let a = mk(16).run();
        let b = mk(24).run();
        assert_eq!(a.n_sats, 16);
        assert_eq!(b.n_sats, 24);
        assert_ne!(
            (a.coverage_pct, a.pdop_mean),
            (b.coverage_pct, b.pdop_mean),
            "16 and 24 satellites must not report identical geometry — that is what a \
             stale clamp looks like"
        );
        // Above the builder limit the scenario still clamps, and says 24.
        assert_eq!(mk(40).run().n_sats, 24);
    }

    // -----------------------------------------------------------------------
    // The antenna pattern in the geometry export.
    // -----------------------------------------------------------------------

    /// The documented working point: the illustrative LCNS-class shell seen from a
    /// Shackleton-class south-polar site, with the engine's own representative lunar
    /// transmit aperture (1 m dish at 2.4 GHz, η = 0.60 — the `lunar-attack-surface` /
    /// `antenna::tests` dish). A 10 kbit/s S-band link closes across every visible link
    /// of this geometry, so the aperture is a valid operating point, not a strawman.
    fn working_point() -> LunarServiceScenario {
        LunarServiceScenario {
            n_sats: 8,
            export_site_lat_deg: Some(-89.9),
            export_site_lon_deg: Some(0.0),
            export_antenna: Some(ExportAntennaCfg {
                diameter_m: 1.0,
                carrier_hz: 2.4e9,
                efficiency: 0.60,
            }),
            ..LunarServiceScenario::default()
        }
    }

    /// ORACLE — closed-form triangle trigonometry, an expression independent of the dot
    /// product `nadir_off_boresight_rad` evaluates.
    ///
    /// For a satellite on the `+z` axis at Moon-centred radius `r` and a surface point at
    /// central angle `γ`, the off-nadir angle satisfies
    /// `tan θ = R·sin γ / (r − R·cos γ)`. Two limits are also pinned without any algebra:
    /// the sub-satellite point (`γ = 0`) is exactly on boresight, and the limb
    /// (`cos γ = R/r`) sits at exactly `asin(R/r)`.
    #[test]
    fn off_boresight_matches_hand_computed_triangle_geometry() {
        let r = R_MOON_M + 8_000_000.0;
        let sat = [0.0, 0.0, r];

        // Sub-satellite point: exactly on boresight.
        assert!(nadir_off_boresight_rad(sat, [0.0, 0.0, R_MOON_M]).abs() < 1e-12);

        // Interior points against the closed form.
        for i in 1..=20 {
            let gamma = (R_MOON_M / r).acos() * (i as f64) / 20.0;
            let user = [R_MOON_M * gamma.sin(), 0.0, R_MOON_M * gamma.cos()];
            let got = nadir_off_boresight_rad(sat, user);
            let want = (R_MOON_M * gamma.sin()).atan2(r - R_MOON_M * gamma.cos());
            assert!(
                (got - want).abs() < 1e-12,
                "gamma = {gamma}: got {got} rad, closed form {want} rad"
            );
        }

        // The limb sits at exactly asin(R/r) — the largest off-nadir angle that can
        // reach the body at all.
        let gamma_limb = (R_MOON_M / r).acos();
        let limb = [
            R_MOON_M * gamma_limb.sin(),
            0.0,
            R_MOON_M * gamma_limb.cos(),
        ];
        assert!((nadir_off_boresight_rad(sat, limb) - (R_MOON_M / r).asin()).abs() < 1e-12);

        // Degenerate inputs stay finite rather than poisoning a sweep with a NaN.
        assert_eq!(
            nadir_off_boresight_rad([0.0, 0.0, 0.0], [0.0, 0.0, 0.0]),
            0.0
        );
        assert_eq!(nadir_off_boresight_rad(sat, sat), 0.0);
    }

    /// R1, pinned: with no `export_antenna` the geometry export is exactly what it was —
    /// the same six keys per row and no antenna block anywhere. A new capability that
    /// quietly rewrites the old output is not additive.
    #[test]
    fn without_an_antenna_the_export_is_the_previous_export_unchanged() {
        let scn = LunarServiceScenario {
            export_antenna: None,
            ..working_point()
        };
        let v: serde_json::Value = serde_json::to_value(scn.run()).unwrap();
        assert!(
            v.get("antenna_pattern").is_none(),
            "no antenna configured, so no antenna block"
        );
        let row = &v["per_sat_geometry"][0];
        // serde_json orders keys, so compare the sorted key set.
        let keys: Vec<&str> = row
            .as_object()
            .unwrap()
            .keys()
            .map(|s| s.as_str())
            .collect();
        assert_eq!(
            keys,
            vec!["az_deg", "el_deg", "range_km", "sat", "t_s", "visible"],
            "the pre-existing row shape must be unchanged without an antenna"
        );

        // And configuring one adds fields without moving any of those six.
        let with = serde_json::to_value(working_point().run()).unwrap();
        let row_with = &with["per_sat_geometry"][0];
        for k in ["t_s", "sat", "az_deg", "el_deg", "range_km", "visible"] {
            assert_eq!(row[k], row_with[k], "field {k} moved");
        }
    }

    /// R3: every numeric field the antenna block and the per-satellite rows emit carries
    /// a unit **and** a provenance class. Walks the produced JSON, not the table, so a
    /// field added without a units entry fails here.
    #[test]
    fn every_emitted_numeric_field_of_the_antenna_export_has_a_unit_and_a_provenance_class() {
        let v: serde_json::Value = serde_json::to_value(working_point().run()).unwrap();
        let units = v["antenna_pattern"]["units"]
            .as_object()
            .expect("the antenna block carries a units block");
        for (k, u) in units {
            assert!(
                u.get("unit").and_then(|x| x.as_str()).is_some(),
                "{k} has no unit"
            );
            assert!(
                u.get("provenance").and_then(|x| x.as_str()).is_some(),
                "{k} has no provenance class"
            );
        }
        let mut missing: Vec<String> = Vec::new();
        let mut check = |prefix: &str, obj: &serde_json::Value| {
            if let Some(m) = obj.as_object() {
                for (k, val) in m {
                    if (val.is_number() || val.is_boolean())
                        && !units.contains_key(&format!("{prefix}.{k}"))
                    {
                        missing.push(format!("{prefix}.{k}"));
                    }
                }
            }
        };
        check("antenna_pattern", &v["antenna_pattern"]);
        check("per_sat_geometry", &v["per_sat_geometry"][0]);
        assert!(
            missing.is_empty(),
            "emitted numeric fields with no units entry: {missing:?}"
        );
    }

    /// The whole point of the block: BOTH in-beam counts are emitted, and the correction
    /// between them is exactly their difference — never a single "corrected" number with
    /// the approximation quietly deleted.
    ///
    /// The counts are also checked against the per-row flags they summarise, so the
    /// headline and the table underneath it cannot drift apart, and the per-epoch figures
    /// are checked against the link totals.
    #[test]
    fn both_in_beam_counts_are_emitted_with_their_difference_as_the_correction() {
        let r = working_point().run();
        let ap = r
            .antenna_pattern
            .as_ref()
            .expect("an antenna is configured");
        let geom = r.per_sat_geometry.as_ref().expect("a site is configured");

        let vis: Vec<&GeometrySample> = geom.iter().filter(|g| g.visible).collect();
        assert_eq!(ap.n_links_evaluated, vis.len());
        assert_eq!(
            ap.in_beam_pattern_links,
            vis.iter()
                .filter(|g| g.in_beam_pattern == Some(true))
                .count()
        );
        assert_eq!(
            ap.in_beam_symmetric_links,
            vis.iter()
                .filter(|g| g.in_beam_symmetric == Some(true))
                .count()
        );
        assert_eq!(
            ap.in_beam_correction_links,
            ap.in_beam_pattern_links as i64 - ap.in_beam_symmetric_links as i64
        );
        let n_ep = r.n_epochs as f64;
        assert!(
            (ap.in_beam_correction_sats_per_epoch
                - (ap.in_beam_pattern_sats_per_epoch - ap.in_beam_symmetric_sats_per_epoch))
                .abs()
                < 1e-12
        );
        assert!(
            (ap.in_beam_pattern_sats_per_epoch * n_ep - ap.in_beam_pattern_links as f64).abs()
                < 1e-9
        );
    }

    /// ORACLE — set inclusion from closed-form algebra, then measured.
    ///
    /// The symmetric relation carries its own aperture efficiency: its half-angle is
    /// `28.019/√η · λ/D` degrees, against the aperture's true half-power half-angle of
    /// `29.479·λ/D` degrees, so the approximate cone strictly **contains** the real beam
    /// for every `η ≤ 0.9035` and the correction can only be `≤ 0`. At the engine's
    /// representative `η = 0.60` that containment must hold row by row.
    ///
    /// The measured size of the correction at the documented working point is pinned as a
    /// literal, because it is the finding: the real pattern puts **0** of 76 visible links
    /// inside the half-power beam while the approximation claims **28**. The nearest row
    /// to either beam edge is 0.069° away, so these counts are not a rounding artefact.
    #[test]
    fn the_symmetric_approximation_over_counts_the_beam_and_by_how_much() {
        let r = working_point().run();
        let ap = r
            .antenna_pattern
            .as_ref()
            .expect("an antenna is configured");
        let geom = r.per_sat_geometry.as_ref().unwrap();

        // Containment, row by row: nothing may be in the real beam and outside the
        // approximate one.
        for g in geom {
            if g.in_beam_pattern == Some(true) {
                assert_eq!(
                    g.in_beam_symmetric,
                    Some(true),
                    "row at {} deg off boresight is inside the real beam but outside the \
                     approximate one — the containment algebra is broken",
                    g.off_boresight_deg.unwrap()
                );
            }
        }
        assert!(ap.in_beam_correction_links <= 0);
        assert!(ap.beamwidth_ratio_symmetric_over_pattern > 1.0);

        // The measured finding at the documented working point.
        assert_eq!(ap.n_links_evaluated, 76);
        assert_eq!(ap.in_beam_pattern_links, 0);
        assert_eq!(ap.in_beam_symmetric_links, 28);
        assert_eq!(ap.in_beam_correction_links, -28);
        assert_eq!(ap.max_abs_epoch_correction_sats, 3);
        assert!(
            (ap.in_beam_correction_sats_per_epoch + 7.0 / 3.0).abs() < 1e-12,
            "correction {} sats/epoch",
            ap.in_beam_correction_sats_per_epoch
        );
    }

    /// The report describes itself: a reader holding only the emitted JSON can recompute
    /// each row's in-beam verdicts from that row's own numbers and the block's stated
    /// beam edges. Nothing here needs the engine.
    #[test]
    fn each_row_in_beam_verdict_is_recomputable_from_the_emitted_report_alone() {
        let r = working_point().run();
        let ap = r.antenna_pattern.as_ref().unwrap();
        let geom = r.per_sat_geometry.as_ref().unwrap();
        assert!(!geom.is_empty());
        for g in geom {
            let gain = g.pattern_gain_dbi.expect("an antenna is configured");
            let theta = g.off_boresight_deg.expect("an antenna is configured");
            assert_eq!(
                g.in_beam_pattern,
                Some(gain >= ap.boresight_gain_dbi - crate::antenna::HALF_POWER_DROP_DB),
                "row at {theta} deg, gain {gain} dBi"
            );
            assert_eq!(
                g.in_beam_symmetric,
                Some(theta <= ap.symmetric_half_angle_deg),
                "row at {theta} deg"
            );
        }
    }

    /// An antenna that cannot exist must not produce a number. A zero / negative /
    /// non-finite dish, an impossible efficiency or a zero carrier leaves the block off,
    /// and the geometry export itself is untouched.
    #[test]
    fn an_impossible_aperture_leaves_the_block_off_rather_than_emitting_a_number() {
        for bad in [
            ExportAntennaCfg {
                diameter_m: 0.0,
                carrier_hz: 2.4e9,
                efficiency: 0.6,
            },
            ExportAntennaCfg {
                diameter_m: -1.0,
                carrier_hz: 2.4e9,
                efficiency: 0.6,
            },
            ExportAntennaCfg {
                diameter_m: f64::NAN,
                carrier_hz: 2.4e9,
                efficiency: 0.6,
            },
            ExportAntennaCfg {
                diameter_m: 1.0,
                carrier_hz: 0.0,
                efficiency: 0.6,
            },
            ExportAntennaCfg {
                diameter_m: 1.0,
                carrier_hz: 2.4e9,
                efficiency: 0.0,
            },
            ExportAntennaCfg {
                diameter_m: 1.0,
                carrier_hz: 2.4e9,
                efficiency: 1.5,
            },
        ] {
            let r = LunarServiceScenario {
                export_antenna: Some(bad),
                ..working_point()
            }
            .run();
            assert!(
                r.antenna_pattern.is_none(),
                "an impossible aperture produced a block: {bad:?}"
            );
            let g = r.per_sat_geometry.as_ref().expect("the site is still set");
            assert!(g[0].off_boresight_deg.is_none() && g[0].pattern_gain_dbi.is_none());
        }

        // And an antenna with no export site has nothing to point at.
        let r = LunarServiceScenario {
            export_site_lat_deg: None,
            export_site_lon_deg: None,
            ..working_point()
        }
        .run();
        assert!(r.antenna_pattern.is_none() && r.per_sat_geometry.is_none());
    }

    /// The antenna export is deterministic and changes nothing about the navigation
    /// summary beside it — the coverage, DOP and protection-level figures are identical
    /// with and without it.
    #[test]
    fn the_antenna_export_is_deterministic_and_leaves_the_navigation_summary_alone() {
        let a = serde_json::to_string(&working_point().run()).unwrap();
        let b = serde_json::to_string(&working_point().run()).unwrap();
        assert_eq!(a, b);

        let with = working_point().run();
        let without = LunarServiceScenario {
            export_antenna: None,
            ..working_point()
        }
        .run();
        assert_eq!(with.coverage_pct, without.coverage_pct);
        assert_eq!(with.pdop_mean, without.pdop_mean);
        assert_eq!(with.hpl_min_m, without.hpl_min_m);
        assert_eq!(with.pl_availability_pct, without.pl_availability_pct);
        assert_eq!(with.n_samples, without.n_samples);
    }

    // -----------------------------------------------------------------------
    // ephemeris_path: the real-geometry route, and the rules it has to obey
    // -----------------------------------------------------------------------

    /// SHA-256 of `serde_json::to_string` of the DEFAULT scenario's report. The bit-for-bit
    /// pin for R1: with `ephemeris_path` unset, not one byte of the published result may
    /// move. Never update this to make a test pass — a change here is a changed published
    /// number and has to be reported as a revision.
    ///
    /// PIN-SCOPE:    the whole default `lunar-navigation-service` report document, every
    ///               byte of `serde_json::to_string` of it.
    /// PIN-EXCLUDES: nothing — the whole document, deliberately. Any cross-cutting change
    ///               that adds a field to every scenario document is IN scope here and
    ///               must re-baseline this digest as part of that change.
    const DEFAULT_REPORT_SHA256: &str =
        "a0872964c7313b96a96d075ac3eda6a621af31432dce43cc1c651fec3ce8b84d";

    /// The same document, as values rather than as a digest, for the portable layer.
    ///
    /// A digest answers "did anything change" and nothing else; on a host whose libm
    /// rounds a transcendental differently it answers "yes" for a reason that is not a
    /// change. This literal carries the same claim in a form that survives the crossing —
    /// and when it does fail it names the field, which the digest never could.
    /// Regenerate with the `zzz_emit_default_report` emitter above.
    const DEFAULT_REPORT_PORTABLE: &str = r#"{
      "alert_limit_m": 50.0,
      "coverage_pct": 37.84722222222222,
      "elev_mask_deg": 5.0,
      "hpl_max_m": 4176.665442880556,
      "hpl_min_m": 138.72572640573344,
      "max_sats": 7,
      "min_sats": 4,
      "n_epochs": 12,
      "n_grid_points": 24,
      "n_pl_samples": 249,
      "n_samples": 288,
      "n_sats": 8,
      "note": "Illustrative, public-source LCNS-class constellation; not affiliated with ESA. DOP geometry reuses the gnss_lib_py-validated kernel; coverage/integrity MODELLED.",
      "pdop_max": 180.30393367673344,
      "pdop_mean": 13.742839339512948,
      "pdop_min": 2.191490320232946,
      "pdop_threshold": 6.0,
      "pl_availability_pct": 0.0,
      "sigma_ure_m": 30.0,
      "vpl_max_m": 6707.573553544267,
      "vpl_min_m": 436.2056898877597
    }"#;

    /// Unique temp paths per CALL, not per test: the library tests run as parallel threads
    /// of ONE process, so a name derived from the test would collide with itself across
    /// repeats and with any sibling that happened to reuse it.
    fn temp_ephemeris(body: &str) -> std::path::PathBuf {
        use std::sync::atomic::{AtomicUsize, Ordering};
        static N: AtomicUsize = AtomicUsize::new(0);
        let p = std::env::temp_dir().join(format!(
            "kshana_lunar_eph_{}_{}.csv",
            std::process::id(),
            N.fetch_add(1, Ordering::Relaxed)
        ));
        std::fs::write(&p, body).expect("write temp ephemeris");
        p
    }

    fn fixture(name: &str) -> String {
        std::path::Path::new(env!("CARGO_MANIFEST_DIR"))
            .join("tests/fixtures/lunar_ephemeris")
            .join(name)
            .to_string_lossy()
            .into_owned()
    }

    fn sha256_hex(bytes: &[u8]) -> String {
        use sha2::Digest;
        hex::encode(sha2::Sha256::digest(bytes))
    }

    /// The historical key set of the report, exactly as it was before `ephemeris_path`
    /// existed. Both new keys are `Option` + `skip_serializing_if`, so with the path unset
    /// neither may appear.
    const HISTORICAL_REPORT_KEYS: &[&str] = &[
        "alert_limit_m",
        "coverage_pct",
        "elev_mask_deg",
        "hpl_max_m",
        "hpl_min_m",
        "max_sats",
        "min_sats",
        "n_epochs",
        "n_grid_points",
        "n_pl_samples",
        "n_samples",
        "n_sats",
        "note",
        "pdop_max",
        "pdop_mean",
        "pdop_min",
        "pdop_threshold",
        "pl_availability_pct",
        "sigma_ure_m",
        "vpl_max_m",
        "vpl_min_m",
    ];

    /// Emit the portable expected document for the guard below. Not a check: run with
    /// `cargo test --lib -- --ignored --nocapture zzz_emit_default_report` after an
    /// INTENTIONAL change. The exact SHA-256 pin is never re-taken this way.
    #[test]
    #[ignore = "emitter, not a check"]
    fn zzz_emit_default_report() {
        let r = LunarServiceScenario::default().run();
        println!(
            "{}",
            serde_json::to_string_pretty(&serde_json::to_value(&r).unwrap()).unwrap()
        );
    }

    /// **R1, additive only.** With `ephemeris_path` unset the default scenario emits
    /// bit-for-bit what it emitted before the field existed: the same key set, and the
    /// same bytes — pinned by hash, so a numeric drift of one ULP fails here.
    #[test]
    fn with_no_ephemeris_path_the_report_is_bit_for_bit_unchanged() {
        let r = LunarServiceScenario::default().run();
        let v = serde_json::to_value(&r).unwrap();
        let mut keys: Vec<&str> = v.as_object().unwrap().keys().map(|s| s.as_str()).collect();
        keys.sort_unstable();
        assert_eq!(
            keys, HISTORICAL_REPORT_KEYS,
            "the default report's key set moved; ephemeris_path must be purely additive"
        );
        // Portable layer: field by field, on every platform.
        let want: serde_json::Value =
            serde_json::from_str(DEFAULT_REPORT_PORTABLE).expect("the pinned document parses");
        let moved = crate::test_support::json_diff(&v, &want);
        assert!(
            moved.is_empty(),
            "the default moonlight-service-volume report changed; with ephemeris_path unset \
             nothing may move:\n{}",
            moved.join("\n")
        );
        // Exact layer: the whole document to the byte, where the digest was taken.
        let bytes = serde_json::to_string(&r).unwrap();
        if crate::test_support::ON_BASELINE_HOST {
            assert_eq!(
                sha256_hex(bytes.as_bytes()),
                DEFAULT_REPORT_SHA256,
                "the default moonlight-service-volume report changed in the last bit; with \
                 ephemeris_path unset nothing may move"
            );
        }
        // Explicitly setting the field to None must produce the same bytes, not merely an
        // equal-looking report.
        let explicit = LunarServiceScenario {
            ephemeris_path: None,
            ..LunarServiceScenario::default()
        }
        .run();
        assert_eq!(bytes, serde_json::to_string(&explicit).unwrap());
    }

    /// The perturbed default is equally frozen — the second pre-existing published path.
    #[test]
    fn with_no_ephemeris_path_the_perturbed_report_emits_no_new_blocks() {
        let r = LunarServiceScenario {
            perturbed: true,
            horizon_hours: 3.0,
            lat_max_deg: -80.0,
            lon_step_deg: 120.0,
            ..LunarServiceScenario::default()
        }
        .run();
        let v = serde_json::to_value(&r).unwrap();
        assert!(
            v.get("ephemeris").is_none() && v.get("ephemeris_comparison").is_none(),
            "no ephemeris_path, so neither new block may be emitted"
        );
        assert_eq!(v["perturbed"], serde_json::json!(true));
    }

    fn published_run() -> LunarServiceReport {
        LunarServiceScenario {
            ephemeris_path: Some(fixture("lncss_case_a_navi613.csv")),
            ..LunarServiceScenario::default()
        }
        .try_run()
        .expect("the committed published-constellation fixture loads and runs")
    }

    /// The published candidate constellation drives the headline, and the pre-existing
    /// Keplerian result is emitted BESIDE it — identical to the run that produces it on
    /// its own. A revision, never a silent correction.
    #[test]
    fn the_keplerian_result_is_retained_unchanged_beside_the_published_one() {
        let r = published_run();
        let c = r.ephemeris_comparison.as_ref().expect("comparison emitted");
        let alone = LunarServiceScenario::default().run();
        assert_eq!(c.keplerian.n_sats, alone.n_sats);
        assert_eq!(c.keplerian.coverage_pct, alone.coverage_pct);
        assert_eq!(c.keplerian.hpl_max_m, alone.hpl_max_m);
        assert_eq!(c.keplerian.n_pl_samples, alone.n_pl_samples);
        assert_eq!(c.keplerian.pl_availability_pct, alone.pl_availability_pct);
        // And the headline really is the published geometry, not the illustrative one.
        assert_ne!(
            r.hpl_max_m, alone.hpl_max_m,
            "the published constellation must actually drive the headline"
        );
        assert_eq!(r.hpl_max_m, c.ephemeris.hpl_max_m);
    }

    /// The requirement is the exact inversion of the protection level's linearity in the
    /// ranging sigma, for every geometry: `sigma_required · HPL_max / sigma_ure = AL`.
    /// Then an END-TO-END re-run AT that sigma must actually reach full availability —
    /// a different expression answering the same question, so an algebra slip cannot pass.
    #[test]
    fn the_sigma_requirement_is_the_exact_inversion_of_the_alert_limit() {
        let r = published_run();
        let c = r.ephemeris_comparison.as_ref().unwrap();
        for row in [&c.ephemeris, &c.keplerian, &c.perturbed] {
            let s = row.sigma_required_m.expect("every row admits a PL here");
            assert!(
                (s * row.hpl_max_m / c.sigma_ure_m - c.alert_limit_m).abs() < 1e-9,
                "{}: sigma_required {s} does not land HPL_max on the alert limit",
                row.geometry
            );
            // A hair under the requirement, because at exactly the requirement the worst
            // sample's HPL lands ON the alert limit and the `<=` test then turns on the
            // last bit of the floating-point division.
            let at = LunarServiceScenario {
                sigma_ure_m: s * (1.0 - 1e-9),
                ephemeris_path: (row.geometry == "ephemeris")
                    .then(|| fixture("lncss_case_a_navi613.csv")),
                perturbed: row.geometry == "perturbed",
                ..LunarServiceScenario::default()
            }
            .try_run()
            .unwrap();
            assert!(
                at.pl_availability_pct > 99.999,
                "{}: at sigma_required {s} the PL availability is {}%, not 100%",
                row.geometry,
                at.pl_availability_pct
            );
            // And a hair over it must NOT be fully available, or the "requirement" would
            // be a bound nothing actually binds.
            let over = LunarServiceScenario {
                sigma_ure_m: s * 1.01,
                ephemeris_path: (row.geometry == "ephemeris")
                    .then(|| fixture("lncss_case_a_navi613.csv")),
                perturbed: row.geometry == "perturbed",
                ..LunarServiceScenario::default()
            }
            .try_run()
            .unwrap();
            assert!(
                over.pl_availability_pct < 100.0,
                "{}: 1% above sigma_required the service is still fully available, so the \
                 requirement is not binding",
                row.geometry
            );
        }
    }

    /// The difference is emitted as its own named quantity, and it is exactly the
    /// difference — not a rounded or separately re-derived one.
    #[test]
    fn the_difference_is_its_own_named_quantity() {
        let c = published_run().ephemeris_comparison.unwrap();
        let (e, k, p) = (
            c.ephemeris.sigma_required_m.unwrap(),
            c.keplerian.sigma_required_m.unwrap(),
            c.perturbed.sigma_required_m.unwrap(),
        );
        assert_eq!(c.sigma_requirement_delta_vs_keplerian_m, Some(e - k));
        assert_eq!(c.sigma_requirement_ratio_vs_keplerian, Some(e / k));
        assert_eq!(c.sigma_requirement_delta_vs_perturbed_m, Some(e - p));
        assert_eq!(c.sigma_requirement_ratio_vs_perturbed, Some(e / p));
    }

    /// **R3, provenance.** A figure from a kernel-derived state table and one from
    /// published elements must be distinguishable by their provenance class alone — and
    /// both from the two modelled geometries.
    #[test]
    fn every_geometry_carries_a_distinct_provenance_class() {
        let by_elements = published_run().ephemeris_comparison.unwrap();
        assert_eq!(by_elements.ephemeris.provenance, "published-elements");
        assert_eq!(by_elements.keplerian.provenance, "modelled-keplerian");
        assert_eq!(by_elements.perturbed.provenance, "modelled-perturbed");

        let by_kernel = LunarServiceScenario {
            ephemeris_path: Some(fixture("horizons_lunar_orbiters_2023001_12h.csv")),
            ..LunarServiceScenario::default()
        }
        .try_run()
        .expect("the committed real-ephemeris fixture loads and runs")
        .ephemeris_comparison
        .unwrap();
        assert_eq!(by_kernel.ephemeris.provenance, "published-ephemeris");
        assert_ne!(
            by_kernel.ephemeris.provenance, by_elements.ephemeris.provenance,
            "a kernel-derived figure and an element-derived one must not share a class"
        );
        // The real spacecraft set cannot support a protection level at all, and the
        // requirement is ABSENT rather than invented from an empty envelope.
        assert_eq!(by_kernel.ephemeris.n_pl_samples, 0);
        assert_eq!(by_kernel.ephemeris.sigma_required_m, None);
        assert_eq!(by_kernel.sigma_requirement_delta_vs_keplerian_m, None);
    }

    /// **R3, units.** Every numeric field the two new blocks emit carries a unit AND a
    /// provenance class. Walks the produced JSON, not the tables, so a field added without
    /// a units entry fails here.
    #[test]
    fn every_emitted_numeric_field_of_the_ephemeris_blocks_has_a_unit_and_a_provenance_class() {
        let v = serde_json::to_value(published_run()).unwrap();
        let units = v["ephemeris_comparison"]["units"]
            .as_object()
            .expect("the comparison block carries a units block");
        for (k, u) in units {
            assert!(
                u.get("unit").and_then(|x| x.as_str()).is_some(),
                "{k} has no unit"
            );
            assert!(
                u.get("provenance").and_then(|x| x.as_str()).is_some(),
                "{k} has no provenance class"
            );
        }
        let mut missing: Vec<String> = Vec::new();
        let mut check = |prefix: &str, obj: &serde_json::Value| {
            if let Some(m) = obj.as_object() {
                for (k, val) in m {
                    if (val.is_number() || val.is_boolean())
                        && !units.contains_key(&format!("{prefix}.{k}"))
                    {
                        missing.push(format!("{prefix}.{k}"));
                    }
                }
            }
        };
        check("ephemeris", &v["ephemeris"]);
        check("ephemeris_comparison", &v["ephemeris_comparison"]);
        for g in ["ephemeris", "keplerian", "keplerian_matched", "perturbed"] {
            check(
                &format!("ephemeris_comparison.{g}"),
                &v["ephemeris_comparison"][g],
            );
        }
        assert!(
            missing.is_empty(),
            "emitted numeric fields with no units entry: {missing:?}"
        );
    }

    /// The provenance block ties every figure in the run to the exact bytes it came from,
    /// and to the upstream document behind them.
    #[test]
    fn the_provenance_block_names_the_bytes_and_the_upstream_document() {
        let r = published_run();
        let e = r.ephemeris.as_ref().unwrap();
        let on_disk = std::fs::read(fixture("lncss_case_a_navi613.csv")).unwrap();
        assert_eq!(
            e.sha256,
            sha256_hex(&on_disk),
            "the reported hash must be of the file actually read"
        );
        assert_eq!(
            e.source_sha256.len(),
            64,
            "the upstream document's hash is recorded"
        );
        assert!(e.url.starts_with("https://"), "the source URL is recorded");
        assert!(!e.retrieved.is_empty(), "the retrieval date is recorded");
        // The published frame is not the frame the elements are read in, and the size of
        // that tilt is stated rather than hidden.
        assert!(e.published_frame.starts_with("OP"));
        let tie = e
            .published_frame_tie_angle_deg
            .expect("the frame tie is quantified");
        assert!(
            (1.0..15.0).contains(&tie),
            "tie angle {tie} deg is implausible"
        );
    }

    /// ORACLE: the size-matched Keplerian row must be a DIFFERENT CONSTELLATION, not the
    /// as-configured one relabelled.
    ///
    /// The illustrative design spreads both RAAN and mean anomaly as `360 k / n`, so the
    /// satellite count is part of the geometry. A matched row built by passing a new count
    /// to the sweep while handing it the eight-satellite element set compiles, runs, and
    /// reports `n_sats = 5` against eight satellites' coverage — the failure this asserts
    /// against, and the one that was actually written first.
    #[test]
    fn the_size_matched_baseline_rebuilds_the_constellation_rather_than_relabelling_it() {
        let r = LunarServiceScenario {
            ephemeris_path: Some(fixture("lans_demo_ntrs20250009447.csv")),
            ..LunarServiceScenario::default()
        }
        .try_run()
        .expect("the five-satellite LANS set runs");
        let c = r
            .ephemeris_comparison
            .as_ref()
            .expect("a retrieved geometry emits the comparison");
        let m = c
            .keplerian_matched
            .as_ref()
            .expect("five retrieved satellites against eight configured must emit the matched row");

        assert_eq!(
            m.n_sats, c.ephemeris.n_sats,
            "matched row must take the RETRIEVED count"
        );
        assert_ne!(
            m.n_sats, c.keplerian.n_sats,
            "the premise: the counts differ"
        );
        // The defect: identical coverage under a different reported count.
        assert_ne!(
            m.coverage_pct, c.keplerian.coverage_pct,
            "the matched row reports {} satellites but the as-configured row's coverage \
             ({}%) — the constellation was relabelled, not rebuilt",
            m.n_sats, c.keplerian.coverage_pct
        );
        // ...and it must sit between them: fewer satellites than the eight-satellite run,
        // and this design still beats the retrieved set it is controlling for.
        assert!(
            m.coverage_pct < c.keplerian.coverage_pct,
            "fewer satellites cannot cover more: matched {} vs configured {}",
            m.coverage_pct,
            c.keplerian.coverage_pct
        );
        assert!(
            m.coverage_pct > c.ephemeris.coverage_pct,
            "matched {} vs retrieved {}",
            m.coverage_pct,
            c.ephemeris.coverage_pct
        );
    }

    /// The matched row is ABSENT when it would say nothing: LNCSS case A is itself an
    /// eight-satellite set, so the as-configured row is already like-for-like and a
    /// duplicate of it would be noise. This also keeps that run byte-identical to what it
    /// emitted before the field existed.
    #[test]
    fn no_size_matched_row_when_the_counts_already_agree() {
        let r = LunarServiceScenario {
            ephemeris_path: Some(fixture("lncss_case_a_navi613.csv")),
            ..LunarServiceScenario::default()
        }
        .try_run()
        .expect("the eight-satellite LNCSS case A runs");
        let c = r.ephemeris_comparison.as_ref().expect("comparison present");
        assert_eq!(
            c.ephemeris.n_sats, c.keplerian.n_sats,
            "the premise: counts agree"
        );
        assert!(
            c.keplerian_matched.is_none(),
            "a matched row that duplicates the keplerian row says nothing"
        );
        assert!(c.sigma_requirement_ratio_vs_keplerian_matched.is_none());
    }

    /// An extrapolated state is not an ephemeris: a horizon past the end of the table is
    /// refused, with the numbers in the message, rather than silently run off the end.
    #[test]
    fn a_horizon_past_the_end_of_the_table_is_refused() {
        let e = LunarServiceScenario {
            ephemeris_path: Some(fixture("horizons_lunar_orbiters_2023001_12h.csv")),
            horizon_hours: 48.0,
            ..LunarServiceScenario::default()
        }
        .try_run()
        .expect_err("must refuse to extrapolate");
        assert!(e.contains("extrapolating"), "unhelpful message: {e}");
    }

    /// A missing or malformed file is an error the caller sees, never a quiet fallback to
    /// the illustrative geometry dressed up as a retrieved one.
    #[test]
    fn a_bad_ephemeris_path_is_an_error_not_a_silent_fallback() {
        let missing = LunarServiceScenario {
            ephemeris_path: Some("/nonexistent/kshana-no-such-ephemeris.csv".to_string()),
            ..LunarServiceScenario::default()
        }
        .try_run()
        .expect_err("a missing file must fail");
        assert!(
            missing.contains("cannot read"),
            "unhelpful message: {missing}"
        );

        let p = temp_ephemeris("not a kshana ephemeris at all\n");
        let bad = LunarServiceScenario {
            ephemeris_path: Some(p.to_string_lossy().into_owned()),
            ..LunarServiceScenario::default()
        }
        .try_run()
        .expect_err("a malformed file must fail");
        assert!(bad.contains("first line"), "unhelpful message: {bad}");
        let _ = std::fs::remove_file(&p);
    }

    /// The committed published-constellation fixture is the paper's Table 1 case A,
    /// satellite for satellite: the eight `[RAAN, mean anomaly]` pairs its caption
    /// enumerates, on the one shared orbit the table gives.
    #[test]
    fn the_committed_published_constellation_is_the_sources_own_satellite_set() {
        let e = crate::lunar_ephemeris::LunarEphemeris::load(&fixture("lncss_case_a_navi613.csv"))
            .expect("loads");
        let want: [(f64, f64); 8] = [
            (0.0, 0.0),
            (0.0, 90.0),
            (0.0, 180.0),
            (0.0, 270.0),
            (180.0, 0.0),
            (180.0, 90.0),
            (180.0, 180.0),
            (180.0, 270.0),
        ];
        assert_eq!(e.n_sats(), want.len());
        for (s, (raan, anom)) in e.elements().iter().zip(want) {
            assert_eq!((s.raan_deg, s.mean_anom_deg), (raan, anom));
            assert_eq!(s.sma_m, 6_143_000.0);
            assert_eq!(s.eccentricity, 0.6);
            assert_eq!(s.inc_deg, 51.7);
            assert_eq!(s.argp_deg, 90.0);
        }
    }

    /// The second committed published constellation is the joint ESA/NASA/JAXA LANS
    /// interoperability-demonstration reference set, satellite for satellite and digit for
    /// digit as its Table 3 prints them — stated in ICRF at an epoch, so it takes the
    /// rigorous IAU reduction and carries **no** frame-tie approximation, and it brings its
    /// source's own "notional" caveat with it.
    #[test]
    fn the_committed_lans_demo_constellation_matches_its_source_table() {
        let e =
            crate::lunar_ephemeris::LunarEphemeris::load(&fixture("lans_demo_ntrs20250009447.csv"))
                .expect("loads");
        assert_eq!(e.n_sats(), 5);
        assert_eq!(
            e.state_frame(),
            crate::lunar_ephemeris::StateFrame::Icrf,
            "the source states ICRF, so the reduction must be the IAU one"
        );
        // (sma_km, ecc, inc_deg, raan_deg, argp_deg) exactly as Table 3 prints them.
        let want = [
            (9748.14, 0.70, 48.04, 89.49, 123.60),
            (3870.00, 0.0, 104.428, 53.563, 90.0),
            (11999.2626, 0.655, 32.22, -162.33, 75.96),
            (12027.7960, 0.641, 31.33, -164.02, 76.14),
            (11993.3508, 0.721, 79.07, -42.86, 68.18),
        ];
        for (s, (a, ecc, inc, raan, argp)) in e.elements().iter().zip(want) {
            assert_eq!(s.sma_m, a * 1000.0);
            assert_eq!(s.eccentricity, ecc);
            assert_eq!(s.inc_deg, inc);
            assert_eq!(s.raan_deg, raan);
            assert_eq!(s.argp_deg, argp);
        }

        let r = LunarServiceScenario {
            ephemeris_path: Some(fixture("lans_demo_ntrs20250009447.csv")),
            ..LunarServiceScenario::default()
        }
        .try_run()
        .expect("runs");
        let b = r.ephemeris.as_ref().unwrap();
        assert!(
            b.published_frame_tie_angle_deg.is_none(),
            "an ICRF-stated element set has no OP-frame tie to report"
        );
        assert!(
            b.source_caveat.contains("NOTIONAL"),
            "the source's own caveat must travel with the numbers: {:?}",
            b.source_caveat
        );
        // Five satellites can never put the six in view the single-fault ARAIM hypothesis
        // set needs, so there is no protection level and therefore NO sigma requirement —
        // reported as absent rather than manufactured from an empty envelope.
        let c = r.ephemeris_comparison.as_ref().unwrap();
        assert_eq!(c.ephemeris.n_pl_samples, 0);
        assert_eq!(c.ephemeris.sigma_required_m, None);
        assert_eq!(c.sigma_requirement_ratio_vs_keplerian, None);
        // The Keplerian and perturbed rows are still there, unchanged, beside it.
        assert!(c.keplerian.sigma_required_m.is_some());
        assert!(c.perturbed.sigma_required_m.is_some());
    }

    /// The committed real-ephemeris fixture is four real spacecraft over a 12 h arc, and
    /// the states put them where those spacecraft actually were: three low lunar orbiters
    /// within a few thousand kilometres of the Moon, and CAPSTONE out on its NRHO, tens of
    /// thousands. A unit or transcription error could not survive this.
    #[test]
    fn the_committed_real_ephemeris_is_four_real_spacecraft_where_they_really_were() {
        let e = crate::lunar_ephemeris::LunarEphemeris::load(&fixture(
            "horizons_lunar_orbiters_2023001_12h.csv",
        ))
        .expect("loads");
        assert_eq!(e.n_sats(), 4);
        assert_eq!(e.n_epochs(), Some(145));
        assert_eq!(e.covered_until_s(), Some(43_200.0));
        let r = e.positions_mcmf(0.0);
        let radius_km = |v: [f64; 3]| (v[0] * v[0] + v[1] * v[1] + v[2] * v[2]).sqrt() / 1000.0;
        for (k, low) in [(0usize, true), (1, true), (2, true), (3, false)] {
            let rad = radius_km(r[k]);
            if low {
                assert!(
                    (1700.0..4000.0).contains(&rad),
                    "sat {k} is a low lunar orbiter but sits at {rad} km"
                );
            } else {
                assert!(
                    (10_000.0..120_000.0).contains(&rad),
                    "sat {k} is the NRHO pathfinder but sits at {rad} km"
                );
            }
        }
    }

    /// G11 regression guard: the long-form geometry table publishes EVERY link, and the
    /// row count is on the header line so a truncated file is visibly short.
    ///
    /// The defect this exists to prevent is not hypothetical. A sibling scenario's
    /// 57-point array reached a released table as a JSON string truncated at 400
    /// characters, publishing 23 points under a column that claimed all 57, and nothing
    /// objected because a truncated array still parses as an array.
    #[test]
    fn long_form_geometry_publishes_every_link() {
        let scn = LunarServiceScenario {
            export_site_lat_deg: Some(-89.9),
            export_site_lon_deg: Some(0.0),
            ..Default::default()
        };
        let report = scn.run();
        let n = report
            .per_sat_geometry
            .as_ref()
            .expect("export site set, so the array exists")
            .len();
        let csv = report.per_sat_geometry_csv().expect("csv");
        let body: Vec<&str> = csv
            .lines()
            .filter(|l| !l.starts_with('#') && !l.starts_with("t_s,"))
            .collect();
        assert_eq!(
            body.len(),
            n,
            "the table dropped rows: {} of {n}",
            body.len()
        );
        assert!(
            csv.contains(&format!("{n} row(s)")),
            "the header must state the row count so a short file is visibly short"
        );
        // Every data row carries the same field count as the header it is under.
        let cols = csv
            .lines()
            .find(|l| l.starts_with("t_s,"))
            .expect("header")
            .split(',')
            .count();
        assert_eq!(
            cols, 6,
            "without an antenna the table is the six geometry columns"
        );
        for (i, l) in body.iter().enumerate() {
            assert_eq!(l.split(',').count(), cols, "row {i} is ragged: {l:?}");
        }
    }

    /// The antenna columns appear only when an antenna was configured, and the header
    /// says which case the file is — so a reader never has to infer whether a missing
    /// column means "no antenna" or "no value".
    #[test]
    fn long_form_geometry_adds_the_antenna_columns_only_when_configured() {
        let base = LunarServiceScenario {
            export_site_lat_deg: Some(-89.9),
            export_site_lon_deg: Some(0.0),
            ..Default::default()
        };
        let plain = base.run().per_sat_geometry_csv().expect("csv");
        assert!(!plain.contains("pattern_gain_dbi"));
        assert!(plain.contains("are absent because export_antenna was not"));

        let with_antenna = LunarServiceScenario {
            export_antenna: Some(ExportAntennaCfg {
                diameter_m: 0.5,
                carrier_hz: 2.4e9,
                efficiency: 0.60,
            }),
            ..base
        };
        let csv = with_antenna.run().per_sat_geometry_csv().expect("csv");
        let header = csv.lines().find(|l| l.starts_with("t_s,")).expect("header");
        assert_eq!(header.split(',').count(), 10);
        for c in [
            "off_boresight_deg",
            "pattern_gain_dbi",
            "in_beam_pattern",
            "in_beam_symmetric",
        ] {
            assert!(header.contains(c), "missing column {c}");
        }
    }

    /// No export site, no array, no file. An empty table would claim the run produced no
    /// links, when in fact none were asked for.
    #[test]
    fn long_form_geometry_is_absent_when_no_export_site_is_configured() {
        let report = LunarServiceScenario::default().run();
        assert!(report.per_sat_geometry.is_none());
        assert!(report.per_sat_geometry_csv().is_none());
    }
}
