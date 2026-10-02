// SPDX-License-Identifier: AGPL-3.0-only
//! M009 oracle: the jamming link budget against the measured carrier-to-noise-density (C/N0)
//! drop of a real receiver under the documented JammerTest 2024 power ramp.
//!
//! Pre-registration (written 2026-10-02, committed before the JammerTest 2024 test catalogue
//! and official log were fetched). Round 1 was BLOCKED: the transmission plan gives transmit
//! power and time slots but no jammer geometry or antenna. The organisers list a test catalogue
//! ("Testcatalog-2024.pdf", whose Appendix G the event briefing names for jammer details) and an
//! official log ("Logg_Jammertest_2024_v1.xlsx") on https://www.jammertest.no/previous-jammertests/.
//! This comparison runs only if those documents give the jammer F8.1 ("Porcus Major") position
//! (or its distance and bearing from the stationary receiver), its antenna gain or effective
//! isotropic radiated power (EIRP), and the start of the 1.6.4 ramp to the second. If any of the
//! three is missing the row stays BLOCKED and nothing is fitted.
//!
//! Quantity: the drop of the median GPS L1 C/A C/N0 of the stationary u-blox ZED-F9P receiver
//! (JammerTest 2024 dataset, Zenodo record 15911589, doi 10.5281/zenodo.15910563,
//! GPL-3.0-or-later, scenario 1.6.4, 2024-09-09) at each 2 dB power step of the documented ramp
//! (0.2 microwatt = -37 dBm to 50 W = 47 dBm, 20 s per step, from the logged start), relative to
//! the pre-jam median over the 60 s before the logged start.
//!
//! Measured (fixed now): per step, the median over all GPS L1 C/A C/N0 values in the central 10 s
//! of the step (step start + 5 s to + 15 s), from `rinex.csv`; a step with fewer than 4 GPS
//! satellites tracked in that window is not scored.
//!
//! Predicted (fixed now; the engine's `jamming` functions, no fitted parameter):
//! nominal = the measured pre-jam median; received signal power S = nominal + N0 with
//! N0 = `noise_density_dbw_per_hz(DEFAULT_TEMP_K)`; J/S = `j_over_s_db(P_step, G_jammer,
//! rx_antenna_gain_db(el_jammer), d, L1, S, 0)` with d the three-dimensional distance and el the
//! elevation of the jammer antenna seen from the receiver's mean `nav_pvt` position before the
//! ramp; G_jammer from the catalogue (or EIRP - P_tx if EIRP is given); effective =
//! `effective_cn0_dbhz(nominal, J/S, q_factor(type), CA_CHIP_RATE_HZ)` with type "broadband"
//! unless the catalogue states a narrowband or continuous-wave signal; predicted drop =
//! nominal - effective. Free-space propagation (the engine's model).
//!
//! Tolerance (the round-1 plan's): predicted drop within +/-3 dB of the measured drop at every
//! scored step whose predicted drop lies in [3, 20] dB (the range the receiver can measure above
//! its tracking threshold). PROMOTE only if at least three steps are scored and all agree.

use kshana::jamming::{
    effective_cn0_dbhz, j_over_s_db, noise_density_dbw_per_hz, q_factor, rx_antenna_gain_db,
    CA_CHIP_RATE_HZ, DEFAULT_TEMP_K, L1_HZ,
};

const DIR: &str = concat!(
    env!("CARGO_MANIFEST_DIR"),
    "/tests/fixtures/jamming_jammertest_cn0_oracle"
);

/// Geometry and ramp (from the catalogue and log): distance (m), jammer elevation (deg),
/// jammer antenna gain (dBi), jammer type, pre-jam median C/N0 (dB-Hz).
fn geometry() -> (f64, f64, f64, String, f64) {
    let text = std::fs::read_to_string(format!("{DIR}/geometry.tsv")).expect("geometry.tsv");
    let l = text.lines().nth(1).expect("row");
    let f: Vec<&str> = l.split('\t').collect();
    (
        f[0].parse().unwrap(),
        f[1].parse().unwrap(),
        f[2].parse().unwrap(),
        f[3].to_string(),
        f[4].parse().unwrap(),
    )
}

/// Per step: power (dBm), measured median C/N0 (dB-Hz), GPS satellites tracked.
fn steps() -> Vec<(f64, f64, usize)> {
    let text = std::fs::read_to_string(format!("{DIR}/steps.tsv")).expect("steps.tsv");
    text.lines()
        .skip(1)
        .filter(|l| !l.trim().is_empty())
        .map(|l| {
            let f: Vec<&str> = l.split('\t').collect();
            (
                f[0].parse().unwrap(),
                f[1].parse().unwrap(),
                f[2].parse().unwrap(),
            )
        })
        .collect()
}

pub fn predicted_drop_db(p_dbm: f64, d: f64, el_deg: f64, g_tx: f64, kind: &str, nom: f64) -> f64 {
    let s = nom + noise_density_dbw_per_hz(DEFAULT_TEMP_K);
    let js = j_over_s_db(
        p_dbm - 30.0,
        g_tx,
        rx_antenna_gain_db(el_deg.to_radians()),
        d,
        L1_HZ,
        s,
        0.0,
    );
    nom - effective_cn0_dbhz(nom, js, q_factor(kind, None), CA_CHIP_RATE_HZ)
}

/// Not run: BLOCKED (2026-10-02). The test catalogue (Testcatalog-2024.pdf, SHA-256
/// a7abd86383dcfa862eeca31258a7a5cc5cf05369ef2711a6370524b790b00630) gives F8.1's EIRP (up to
/// 50 W) and antenna (directional helix, RHCP, 10 dB gain) but not its position, height or
/// pointing at Bleik ("decided in field"; participants are told to note the transmitting antenna
/// themselves); the survey point "SENDER" in Appendix A is not attributed to F8.1. The official
/// log (Logg_Jammertest_2024_v1.xlsx) times every 10 s step of 1.6.4 (16:25:00 to 16:39:28 CEST,
/// "L2 missing") but its notes say multi-band power "refers to the most powerful band" and the
/// lower bands ran stronger, with relative levels only on the video stream, so the L1 EIRP of
/// 1.6.4 is not documented. The pre-registration also assumed 20 s steps; the log and catalogue
/// give 10 s, which a run would have had to amend first.
#[test]
#[ignore = "BLOCKED: F8.1 position and pointing at Bleik and the L1 share of the multi-band 1.6.4 power are not documented (checked 2026-10-02)"]
fn link_budget_predicts_the_measured_cn0_drop_within_3_db() {
    let (d, el, g, kind, nom) = geometry();
    let mut scored = 0;
    let mut bad = Vec::new();
    for (p, cn0, n) in steps() {
        let pred = predicted_drop_db(p, d, el, g, &kind, nom);
        let meas = nom - cn0;
        println!("P={p:6.1} dBm n={n:2} measured drop={meas:6.2} predicted={pred:6.2}");
        if n < 4 || !(3.0..=20.0).contains(&pred) {
            continue;
        }
        scored += 1;
        if (pred - meas).abs() > 3.0 {
            bad.push(p);
        }
    }
    assert!(scored >= 3, "only {scored} scored steps");
    assert!(bad.is_empty(), "steps outside 3 dB: {bad:?}");
}
