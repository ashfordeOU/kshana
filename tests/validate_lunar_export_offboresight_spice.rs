// SPDX-License-Identifier: AGPL-3.0-only
//! Pre-registered external validation of the "Off-boresight antenna pattern in the lunar
//! geometry export" row (`lunar_service` per-satellite export with `export_antenna`).
//!
//! ## The quantity
//!
//! Per exported (epoch, satellite) row: the off-boresight angle AT THE SATELLITE between
//! its nadir boresight (the direction to the Moon's centre) and the line of sight to the
//! export site; whether the satellite clears the site's 5 deg elevation mask; the transmit
//! gain toward the site from the uniformly illuminated circular-aperture (Airy) pattern;
//! the in-beam flag under that pattern (gain within 10*log10(2) dB of boresight) and under
//! the symmetric approximation (angle <= half of sqrt(31000 / G_lin) deg). Per run: the
//! visible-link count, both in-beam counts, the correction (real minus approximate) and the
//! worst single-epoch correction.
//!
//! ## The inputs
//!
//! **Part A — flown orbiters.** The committed JPL Horizons evaluation of JPL's
//! reconstructed spacecraft kernels,
//! `tests/fixtures/lunar_ephemeris/horizons_lunar_orbiters_2023001_12h.csv` (LRO, the Lunar
//! Reconnaissance Orbiter; Danuri; Chandrayaan-2; CAPSTONE; Moon-centred ICRF, the
//! International Celestial Reference Frame, 5 min step, epoch 2023-01-01 00:00 TDB,
//! Barycentric Dynamical Time). Horizons is an accepted Reference; these states are inputs
//! to both sides. Run through the scenario's `ephemeris_path` with horizon 11 h and a
//! 5 min step (epochs on the table nodes), at six export sites fixed here, before any
//! result is seen — (lat, lon) deg = (-89.5, 0), (-60, 45), (-20, -100), (0, 0), (35, 160),
//! (75, -30) — and two apertures at 2.4 GHz with efficiency 0.60: a 0.3 m dish (wide beam,
//! so low orbiters give a mix of in-beam and out-of-beam links) and a 1.0 m dish.
//!
//! **Part B — the documented working point.** The row's own measured disagreement:
//! the default eight-satellite illustrative LCNS-class (Lunar Communications and
//! Navigation Services) element set, site (-89.9, 0) deg, 1 m dish at 2.4 GHz,
//! efficiency 0.60, 12 h horizon, 60 min step — 76 visible links, 0 in beam under the real
//! pattern against 28 under the approximation, worst epoch 3. The element set and the
//! engine's mean-rotation Moon-fixed frame convention (a uniform rotation about the spin
//! axis at the sidereal rate, zero at t = 0) are stated inputs of the illustrative
//! constellation.
//!
//! ## The oracle (Library)
//!
//! * **Geometry, Part A:** NAIF SPICE toolkit N0067 through `spiceypy` 8.2.0 (MIT; NAIF
//!   kernels are US Government work, free) with `pck00011.tpc` (the IAU, International
//!   Astronomical Union, 2015 rotation model of the Moon, frame `IAU_MOON`, the same body
//!   frame the engine reduces ICRF states into; not `MOON_PA`, which differs by about
//!   700 m) and `naif0012.tls`. The site is `latrec(1737.4 km, lon, lat)` in `IAU_MOON`,
//!   rotated to J2000 by `pxform` at `et = (epoch_jd_tdb - 2451545.0) * 86400 + t`
//!   (TDB seconds, the time scale the Horizons file states). The off-boresight angle is
//!   `vsep(-r_sat, r_site - r_sat)` and the elevation is `90 deg - vsep(r_site,
//!   r_sat - r_site)`.
//! * **Geometry, Part B:** satellite states from ANISE 0.10.6 (Mozilla Public Licence 2.0)
//!   Keplerian two-body propagation (`Orbit.from_keplerian_mean_anomaly`, `at_epoch`),
//!   rotated by the stated mean-rotation convention, angles by SPICE `vsep` as in Part A.
//! * **Pattern:** the oracle recomputes the gain itself with SciPy 1.18.1
//!   `scipy.special.j1` (BSD-3-Clause): `G0 = 10 log10(eta (pi D / lambda)^2)`,
//!   `lambda = 299792458 / f`, `G = G0 + 10 log10((2 J1(x) / x)^2)`,
//!   `x = (pi D / lambda) sin(theta)`; both in-beam flags follow from it. It does not lean
//!   on the pattern's own row.
//!
//! Generator: `tests/fixtures/lunar_export_offboresight_spice/gen_offboresight_spice.py`;
//! output committed, no Python at run time.
//!
//! ## Tolerances, fixed before the first comparison
//!
//! * Off-boresight angle: **1e-3 deg** per row.
//! * Visibility flag: **exact**, except rows whose oracle elevation is within 1e-3 deg of
//!   the mask, which are listed separately and excluded from the flag comparison.
//! * Both in-beam flags: **exact**, except rows whose oracle angle is within 1e-3 deg of the
//!   respective beam edge, listed separately.
//! * Transmit gain: **0.01 dB** for rows inside the first null of the pattern (the angle
//!   tolerance moves the gain by at most about 2e-3 dB there); beyond the first null the
//!   pattern is near its zeros and only the linear gain relative to boresight is compared,
//!   to **1e-4** absolute.
//! * Counts (links evaluated, in beam under each pattern, the correction, the worst-epoch
//!   correction): **exact** when no row is in an edge band; otherwise each count may differ
//!   by no more than the number of edge-band rows, which is reported.
//!
//! ## What this does not validate
//!
//! The two implied aperture efficiencies the block emits (0.641 against the 70 lambda/D
//! rule, 0.920 against 1.02 lambda/D) are closed-form algebra on stated rules of thumb; no
//! independent library or published worked value recomputes them here.

#[allow(dead_code)]
const REFERENCE_A: &str = "tests/fixtures/lunar_export_offboresight_spice/flown_orbiters.csv";
#[allow(dead_code)]
const REFERENCE_B: &str = "tests/fixtures/lunar_export_offboresight_spice/working_point.csv";

/// Off-boresight angle tolerance (deg).
#[allow(dead_code)]
const ANGLE_TOL_DEG: f64 = 1.0e-3;
/// Gain tolerance inside the first null (dB).
#[allow(dead_code)]
const GAIN_TOL_DB: f64 = 1.0e-2;
/// Linear gain tolerance relative to boresight beyond the first null.
#[allow(dead_code)]
const GAIN_LIN_REL_TOL: f64 = 1.0e-4;

#[test]
#[ignore = "pre-registered; not yet run"]
fn flown_orbiter_export_matches_spice_geometry_and_scipy_pattern() {
    unimplemented!("pre-registration: the comparison is written after this commit");
}

#[test]
#[ignore = "pre-registered; not yet run"]
fn documented_working_point_matches_anise_propagation_and_scipy_pattern() {
    unimplemented!("pre-registration: the comparison is written after this commit");
}
