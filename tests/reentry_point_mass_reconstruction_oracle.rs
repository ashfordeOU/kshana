// SPDX-License-Identifier: AGPL-3.0-only
//! Planar point-mass ballistic entry against reconstructed flight entries (matrix row
//! "Ballistic re-entry corridor (Allen-Eggers)", round-2 amendment).
//!
//! # Pre-registration (amendment, fixed 2026-10-02 before any new paper was fetched and
//! before the integrator existed)
//!
//! Why an amendment: the round-1 comparison (`tests/reentry_reconstruction_oracle.rs`)
//! put the Allen-Eggers closed form (constant flight-path angle, no gravity, exponential
//! atmosphere with H = 7200 m) against the Stardust best-estimated trajectory and found
//! +88 %. The closed form cannot follow a shallow, faster-than-escape entry whose path
//! flattens and lofts before the peak. The engine gains a second, integrated solution of
//! the same ballistic problem; the quantity compared (peak deceleration) and the bar are
//! unchanged, but the Kshana side and its inputs change, so this is a new comparison.
//! The round-1 test stays as the record of the closed form.
//!
//! * **Quantity.** Peak sensed (drag) deceleration in Earth g, `D/m / 9.80665`, and, where
//!   a reconstruction prints it in text or a table, the atmosphere-relative speed at that
//!   peak.
//! * **Kshana side.** `reentry::simulate_planar_entry`: a planar point mass over a
//!   spherical, non-rotating Earth of radius 6 378 137 m with inverse-square gravity
//!   (mu = 3.986004418e14 m^3/s^2) and a non-rotating atmosphere; drag only (no lift) with
//!   a constant ballistic coefficient B = m / (C_D A); density from the US Standard
//!   Atmosphere 1976 (0-86 km from the standard's seven-layer hydrostatic definition in
//!   geopotential altitude; 86-1000 km by log-linear interpolation in the standard's
//!   tabulated densities; zero above 1000 km); fixed-step fourth-order Runge-Kutta with a
//!   0.01 s step from the entry interface until 10 km altitude or 100 m/s; the peak is the
//!   largest per-step drag deceleration. No parameter is fitted.
//! * **Inputs, fixed by rule before the sources are read.** Entry speed and flight-path
//!   angle as printed at the entry interface, atmosphere-relative if both relative and
//!   inertial values are printed, otherwise inertial (disclosed per entry); the
//!   entry-interface altitude is the printed interface radius minus 6 378 137 m, or the
//!   printed interface altitude when no radius is printed. B = m / (C_D pi D^2 / 4), where
//!   m is the entry mass printed in the reconstruction (or in the mission paper it cites),
//!   D the printed maximum (heat-shield) diameter, and C_D the drag coefficient the
//!   capsule's published aerodynamic database prints for hypersonic continuum flow at zero
//!   angle of attack (where it prints several, the one at the highest continuum Mach
//!   number). Stardust's database is Mitcheltree et al., "Aerodynamics of Stardust Sample
//!   Return Capsule" (NASA Technical Reports Server, NTRS, 20040105538). An entry whose
//!   mass, diameter or drag coefficient is not printed in a public source is reported as
//!   BLOCKED with the missing input named, never filled by assumption.
//! * **Entries.** Stardust 2006 (round-1 fixture: 12.9 km/s, -8.2 deg inertial, interface
//!   radius 6503.14 km, best-estimated maximum 32.89 g, Desai and Qualls, NTRS
//!   20080008567), plus Genesis 2004 and Hayabusa 2010 if a public copy prints, in text or a
//!   table, a RECONSTRUCTED (or best-estimated) peak deceleration together with the
//!   entry-interface speed and flight-path angle. A pre-entry nominal prediction is not an
//!   oracle value. Candidates found on NTRS by title before this amendment (not yet read):
//!   Genesis 20080010667, 20080019649, 20050217463, 20050060761; Hayabusa 20110015027,
//!   20110013225, 20160000307.
//! * **Oracle kind.** Measured, with the caveat recorded in round 1: these are
//!   tracking-constrained reconstructions, not accelerometer records, unless a source says
//!   otherwise.
//! * **Tolerance (unchanged from round 1).** Peak deceleration within 15 % relative of every
//!   included entry, and speed at peak within 15 % where printed. Any miss keeps the row
//!   MODELLED. Values are read from text or tables only; a plot is never read.
//!
//! # Disclosures, stated before the comparison
//!
//! * A diagnostic script written during the round-2 research
//!   (`scratch/research-c/entry3dof.py`, outside the repository) integrates the same kind of
//!   planar entry with an approximate US76 and computed predicted Stardust peaks for a
//!   range of ballistic coefficients; its predictions were seen during that research, so
//!   the Stardust outcome of this comparison was anticipated. Its source was read for this
//!   amendment; it was not run in this session.
//! * The Stardust best-estimated peak (32.89 g) has been known since round 1, and the
//!   Stardust reconstruction was re-read for this amendment to find its printed mass
//!   (46 kg). The NTRS search above listed titles only.

/// The pre-registered comparison. Not yet run.
#[test]
#[ignore = "pre-registered; not yet run"]
fn point_mass_peak_deceleration_matches_reconstructed_entries() {
    panic!("pre-registered; the comparison is written after the integrator and the fixture");
}
