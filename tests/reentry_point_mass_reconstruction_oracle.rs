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
//!
//! # Inputs resolved by the rule (written 2026-10-02 after reading the sources, before the
//! integrator was written or run)
//!
//! * **Stardust 2006.** 12 900 m/s and 8.2 deg, inertial (only inertial values are
//!   printed); interface radius 6503.14 km, so interface altitude 125 003 m; m = 46 kg
//!   (NTRS 20080008567 sec. II); D = 0.8128 m (NTRS 20040105538, reference area 0.51887
//!   m^2); C_D = 1.4828, Table 4 of NTRS 20040105538 at Mach 35.4, the highest Mach number
//!   below the Mach 38 the paper names as the upper edge of the continuum regime, zero
//!   angle of attack (axial coefficient = drag coefficient there). B = 59.789 kg/m^2.
//!   Oracle: best-estimated maximum 32.89 g (NTRS 20080008567 sec. V).
//! * **Genesis 2004.** 11 040 m/s and 8.0 deg, inertial (the reconstructions print only
//!   inertial values; the planet-relative -8.25 deg and 10.7 km/s in NTRS 20050050931 are a
//!   1999 pre-flight nominal, not the flight); interface radius 6503.14 km, printed as the
//!   entry-state reference radius in the cited mission paper NTRS 20050050931 (AAS 99-469),
//!   so 125 003 m; m = 205.6 kg (reconstruction, NTRS 20080019649); D = 1.52 m, the
//!   heat-shield dimension printed on the configuration drawing (Fig. 2 of NTRS
//!   20050060761, also in NTRS 20050050931; the text says "approximately 1.5 m"; a
//!   dimension label, not a value read off a plot, disclosed); C_D = 1.4828, because NTRS
//!   20050050931 states that the Stardust hypersonic-continuum database applies to Genesis
//!   unchanged. B = 76.412 kg/m^2. Oracle: best-estimated maximum 27.0 g (NTRS
//!   20080019649, also NTRS 20080010667 and 20050217463).
//! * **Hayabusa 2010: not included.** The three NTRS candidates print only pre-entry
//!   predicted states (NTRS 20110015027 Table 2) and observation planning; none prints a
//!   reconstructed peak deceleration. The figure "about 25 G" found on the open web is an
//!   unattributed estimate, not a reconstruction. A JAXA flight-data reconstruction in a
//!   public copy is the missing input.
//! * Neither entry prints the speed at peak deceleration in text or a table, so only the
//!   peak deceleration is compared.
//!
//! # Result (run 2026-10-02, after the integrator was committed)
//!
//! AGREES on both included entries. Stardust: 36.62 g against 32.89 g (+11.3 %), peak at
//! 54.3 km and 8362 m/s. Genesis: 28.52 g against 27.0 g (+5.6 %), peak at 50.8 km and
//! 6766 m/s. Both overpredict, as expected of a non-rotating atmosphere fed the inertial
//! speed (the atmosphere-relative speed is a few hundred m/s lower). Mutation: removing the
//! curvature term `V/r` from the flight-path-angle equation gives 66.0 g and 51.5 g
//! (+101 %, +91 %) and the test fails.
//!
//! # Review (2026-10-02, after the result): not a Measured oracle, no promotion
//!
//! An adversarial review ruled that both maxima are outputs of the projects' own entry
//! simulations, not observations: the Genesis hypersonic best-estimated trajectory is
//! "indistinguishable from the pre-entry predicted trajectory" (27.0 g against a predicted
//! 27.2 g, NTRS 20080019649) and the Stardust one differs from its simulation by a 0.83 %
//! fitted drag multiplier. The "Measured" kind declared above therefore does not hold
//! under `docs/VALIDATION.md`, and this agreement does not promote any row. The test stays
//! as a cross-check of the integrator against two agency six-degree-of-freedom entry
//! simulations; the bar is unchanged. The Measured route is the accelerometer comparison
//! in `tests/reentry_point_mass_accelerometer_oracle.rs`.

use kshana::reentry::{simulate_planar_entry, PlanarEntry, R_EARTH_M};

const REF: &str =
    include_str!("fixtures/reentry_point_mass_reconstruction_oracle/reconstructed_entries.txt");

const REL_TOL: f64 = 0.15;

struct Entry {
    id: String,
    kshana_g: f64,
    recon_g: f64,
}

fn entries() -> Vec<Entry> {
    REF.lines()
        .filter_map(|l| l.strip_prefix("ENTRY "))
        .map(|rest| {
            let f: Vec<&str> = rest.split('|').map(str::trim).collect();
            let num = |i: usize| -> f64 { f[i].parse().unwrap() };
            let (v, gamma_deg, r_ei, m, d, cd, recon_g) =
                (num(1), num(2), num(4), num(5), num(6), num(7), num(8));
            let area = std::f64::consts::PI * d * d / 4.0;
            let r = simulate_planar_entry(&PlanarEntry {
                entry_speed_m_s: v,
                flight_path_angle_rad: gamma_deg.to_radians(),
                interface_altitude_m: r_ei - R_EARTH_M,
                ballistic_coeff_kg_m2: m / (cd * area),
            });
            eprintln!(
                "{}: B {:.3} kg/m^2, kshana {:.3} g at {:.1} km, {:.0} m/s; reconstruction {:.2} g ({:+.2} %)",
                f[0],
                m / (cd * area),
                r.peak_deceleration_g,
                r.altitude_at_peak_m / 1000.0,
                r.speed_at_peak_m_s,
                recon_g,
                100.0 * (r.peak_deceleration_g - recon_g) / recon_g
            );
            Entry {
                id: f[0].to_string(),
                kshana_g: r.peak_deceleration_g,
                recon_g,
            }
        })
        .collect()
}

/// The pre-registered comparison: every included entry's peak deceleration within 15 %.
/// Result (2026-10-02): AGREES, Stardust +11.3 %, Genesis +5.6 %. A cross-check against
/// agency entry simulations, not a Measured oracle (see the review note above).
#[test]
fn point_mass_peak_deceleration_matches_reconstructed_entries() {
    let e = entries();
    assert_eq!(e.len(), 2, "Stardust and Genesis are the included entries");
    let bad: Vec<String> = e
        .iter()
        .filter(|x| (x.kshana_g - x.recon_g).abs() / x.recon_g > REL_TOL)
        .map(|x| format!("{}: {:.2} g vs {:.2} g", x.id, x.kshana_g, x.recon_g))
        .collect();
    assert!(bad.is_empty(), "outside 15 %: {}", bad.join("; "));
}
