// SPDX-License-Identifier: AGPL-3.0-only
//! Planar point-mass ballistic entry against peak decelerations MEASURED by on-board
//! accelerometers (proposed matrix row "Planar point-mass ballistic entry peak deceleration
//! (US76, inverse-square gravity, curvature)", round-2 second amendment).
//!
//! # Pre-registration (second amendment, fixed 2026-10-02 before any accelerometer source
//! was searched for, fetched or read)
//!
//! Why a second amendment: the first amendment
//! (`tests/reentry_point_mass_reconstruction_oracle.rs`, pre-registered in commit 1b826fe8)
//! compared `reentry::simulate_planar_entry` with the Stardust and Genesis best-estimated
//! trajectories and agreed (+11.3 %, +5.6 %). A review found that those maxima are outputs of
//! the projects' own entry simulations (Genesis: "indistinguishable from the pre-entry
//! predicted trajectory" in the hypersonic regime; Stardust: a 0.83 % fitted drag
//! multiplier), so they are model outputs, not observations of the physical world, and do
//! not satisfy the Measured oracle kind of `docs/VALIDATION.md`. This amendment keeps the
//! quantity, the Kshana side, the input rule and the 15 % bar unchanged and changes only the
//! oracle: a peak deceleration recorded by an accelerometer carried on the entering capsule.
//! That earlier result was seen before this amendment was written (disclosed below).
//!
//! * **Quantity.** Peak sensed deceleration in Earth g (9.80665 m/s^2) during the hypersonic
//!   entry, before any parachute deployment. Kshana: `D/m / 9.80665`, the largest per-step
//!   drag deceleration of `reentry::simulate_planar_entry` (unchanged since commit 4ea48b58;
//!   no engine change is made for this amendment). Speed, altitude, time and flight-path
//!   angle at the peak are not compared.
//! * **Kshana side.** Unchanged: planar point mass, spherical non-rotating Earth of radius
//!   6 378 137 m, inverse-square gravity, non-rotating atmosphere, drag only with a constant
//!   ballistic coefficient, US Standard Atmosphere 1976, fourth-order Runge-Kutta at 0.01 s.
//!   No parameter is fitted.
//! * **Inputs, fixed by the same rule as the first amendment.** Entry speed and flight-path
//!   angle as printed at the entry interface, atmosphere-relative if both relative and
//!   inertial values are printed, otherwise inertial (disclosed per entry); interface
//!   altitude = printed interface radius minus 6 378 137 m, or the printed interface
//!   altitude when no radius is printed. A RECONSTRUCTED (post-flight) entry state is used
//!   when one is printed, otherwise the final pre-entry targeted state (disclosed).
//!   B = m / (C_D pi D^2 / 4): m the entry mass printed for the flight article, D its
//!   printed maximum (heat-shield) diameter, C_D the drag coefficient its published
//!   aerodynamic database prints for hypersonic continuum flow at zero angle of attack (the
//!   one at the highest continuum Mach number where several are printed). An entry whose
//!   state, mass, diameter or drag coefficient is not printed in a public source is
//!   BLOCKED with the missing input named, never filled by assumption.
//! * **Oracle (Measured).** The maximum deceleration recorded by an accelerometer on board
//!   the capsule itself, printed as a number in the text or a table of a public source
//!   (paper, report or agency release whose text attributes it to the on-board measurement).
//!   A value read off a plot, a pre-flight prediction, a trajectory reconstruction that is
//!   not an accelerometer record, or an unattributed figure is not an oracle value.
//! * **Entries (closed list, named before searching).** Ballistic Earth-entry capsules
//!   known or believed to have carried a recording accelerometer: Hayabusa2 sample-return
//!   capsule (2020-12-05, its flight-measurement module), Hayabusa sample-return capsule
//!   (2010-06-13), OSIRIS-REx sample-return capsule (2023-09-24). Each is included if and
//!   only if the oracle value and every input above are printed in a public source;
//!   otherwise it is reported BLOCKED with the missing item. No other entry is added after
//!   searching starts.
//! * **Tolerance (unchanged from rounds 1 and 2).** Peak deceleration within 15 % relative
//!   of the measured value for every included entry. Any miss keeps the row MODELLED. At
//!   least one included entry is required for a promotion; with none the row is BLOCKED.
//!
//! # Disclosures, stated before the comparison
//!
//! * The first amendment's results (Stardust +11.3 %, Genesis +5.6 %) and its mutation
//!   (curvature term removed: about +100 %) were seen before this amendment was written.
//! * Hayabusa: an unattributed "about 25 G" was seen on the open web during the first
//!   amendment and rejected there as not a reconstruction. No accelerometer value for any
//!   of the three listed capsules has been read by the author of this amendment.
//! * The engine is not changed for this amendment; there is nothing to tune.
//!
//! # Search result (2026-10-02, after the commit above): BLOCKED, comparison not run
//!
//! * **Hayabusa 2010: excluded.** The capsule carried no recording accelerometer (the
//!   flight was observed only from the ground and the air; NASA Technical Reports Server,
//!   NTRS, 20160000307). No measured value can exist.
//! * **OSIRIS-REx 2023: excluded.** The capsule sensed deceleration only with mechanical
//!   g-switches for parachute timing; no acceleration record exists. Its "peak
//!   deceleration" figures are POST2 simulation outputs (NTRS 20240000629, 20240014280).
//! * **Hayabusa2 2020: BLOCKED, oracle source unreadable here.** Its Reentry Environment
//!   Measurement Module (REMM) recorded three-axis acceleration at 125 Hz (JAXA press
//!   briefing of 2021-03-05, slide 6, which prints no peak value). The open-access paper
//!   that analyses the REMM record, Yamada and Yoshihara, "Post-Flight Analysis of
//!   Recovered Components of Hayabusa2 Sample Return Capsule", Journal of Evolving Space
//!   Activities 1 (2023) 16, doi 10.57350/jesa.16 (J-STAGE), could not be retrieved: the
//!   host refuses this session's network egress and the PDF exceeds the fetch tool's
//!   10 MB limit. The other REMM analyses, AIAA 2022-3801 ("Best Estimated Trajectory and
//!   Attitude Motion of Hayabusa2 SRC Reentry Flight") and an Elsevier book chapter, are
//!   paywalled. No measured Hayabusa2 peak deceleration has been read. Inputs located
//!   but not yet resolved by the rule: entry state 11.58 km/s and -12.0 deg at 200 km
//!   geodetic, labelled "derived" (Tsuda et al., Trans. JSASS 67(6) 340, 2024, Table 1;
//!   licensed CC BY-NC-ND 4.0, so numbers are cited, the paper is not vendored); mass "16 kg" and diameter "about 40 cm" (Yamada et al., Trans. JSASS Aerospace
//!   Tech. Japan 19(4) 514, 2021); a candidate drag-coefficient database, "The Aerodynamic
//!   Data Base for Asteroid Sample Return Capsule", ISAS report SP (2003), JAXA repository
//!   record 33260, which needs Japanese fonts to read and was not read.
//! * **Seen while searching (disclosed).** The 2021 Trans. JSASS paper (received 2019, a
//!   pre-flight document) prints a PREDICTED maximum deceleration of 41.26 G (standard
//!   deviation 0.48 G over a 5000-run Monte Carlo analysis) at 83.1 s; it is a prediction, not an oracle value, and it was read before any
//!   Kshana run for Hayabusa2 (none has been made).
//! * The missing input is a readable copy of doi 10.57350/jesa.16 (open access) or of AIAA
//!   2022-3801 that prints the REMM maximum deceleration as a number. With it, the inputs
//!   above are resolved by the unchanged rule, committed, and only then is this test run.

use kshana::reentry::{simulate_planar_entry, PlanarEntry, R_EARTH_M};

const REF: &str =
    include_str!("fixtures/reentry_point_mass_accelerometer_oracle/measured_entries.txt");

const REL_TOL: f64 = 0.15;

struct Entry {
    id: String,
    kshana_g: f64,
    measured_g: f64,
}

fn entries() -> Vec<Entry> {
    REF.lines()
        .filter_map(|l| l.strip_prefix("ENTRY "))
        .map(|rest| {
            let f: Vec<&str> = rest.split('|').map(str::trim).collect();
            let num = |i: usize| -> f64 { f[i].parse().unwrap() };
            let (v, gamma_deg, r_ei, m, d, cd, measured_g) =
                (num(1), num(2), num(4), num(5), num(6), num(7), num(8));
            let area = std::f64::consts::PI * d * d / 4.0;
            let r = simulate_planar_entry(&PlanarEntry {
                entry_speed_m_s: v,
                flight_path_angle_rad: gamma_deg.to_radians(),
                interface_altitude_m: r_ei - R_EARTH_M,
                ballistic_coeff_kg_m2: m / (cd * area),
            });
            eprintln!(
                "{}: B {:.3} kg/m^2, kshana {:.3} g at {:.1} km, {:.0} m/s; measured {:.2} g ({:+.2} %)",
                f[0],
                m / (cd * area),
                r.peak_deceleration_g,
                r.altitude_at_peak_m / 1000.0,
                r.speed_at_peak_m_s,
                measured_g,
                100.0 * (r.peak_deceleration_g - measured_g) / measured_g
            );
            Entry {
                id: f[0].to_string(),
                kshana_g: r.peak_deceleration_g,
                measured_g,
            }
        })
        .collect()
}

/// The pre-registered comparison: every included entry's peak deceleration within 15 % of
/// the on-board accelerometer maximum.
#[test]
#[ignore = "BLOCKED: no readable source prints an accelerometer-measured peak; not run"]
fn point_mass_peak_deceleration_matches_accelerometer_records() {
    let e = entries();
    assert!(
        !e.is_empty(),
        "no entry with a printed accelerometer maximum is included"
    );
    let bad: Vec<String> = e
        .iter()
        .filter(|x| (x.kshana_g - x.measured_g).abs() / x.measured_g > REL_TOL)
        .map(|x| format!("{}: {:.2} g vs {:.2} g", x.id, x.kshana_g, x.measured_g))
        .collect();
    assert!(bad.is_empty(), "outside 15 %: {}", bad.join("; "));
}
