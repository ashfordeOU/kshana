// SPDX-License-Identifier: AGPL-3.0-only
//! Externally check the `space_weather` capability against two named authorities,
//! with two DIFFERENT and clearly-separated honesty levels.
//!
//! PART (a) — TEMPERATURE PARITY (gated to < 1 K -> the validatable sub-claim).
//!   Oracle: the PUBLISHED Jacchia-1971 closed form for the nighttime
//!   global-minimum exospheric temperature and its geomagnetic increment
//!     T_c   = 379 + 3.24*Fbar + 1.3*(F - Fbar)
//!     dT    = 28*Kp + 0.03*exp(Kp)
//!   (Jacchia 1971, SAO Special Report 332; collated in Montenbruck & Gill,
//!   "Satellite Orbits", Springer 2000, Eqs. 3.42-3.45). The reference numbers in
//!   tests/fixtures/space_weather/space_weather_reference.txt are these published
//!   equations recomputed from first principles (coefficients typed from the
//!   citation, NOT from kshana) over the
//!     F107 in {70,100,150,200,230} x Kp in {0,2,4,6,8}
//!   grid, with Fbar = F107. kshana's `exospheric_temperature` reproduces each to
//!   far better than 1 K.
//!
//!   Honest scope of (a): kshana implements exactly this published closed form, so
//!   this is a PARITY / transcription-fidelity check against a named, citable
//!   authority and its canonical anchor magnitudes (606/865/1124 K at solar
//!   min/mean/max F10.7) — the same class of check as klobuchar vs the IS-GPS-200
//!   worked example. It catches a transposed coefficient or a units slip; it is
//!   not an independent re-derivation of the thermosphere physics. The MSISCMP
//!   rows below show NRLMSISE-00's own exospheric temperature differs from J71 by
//!   tens-to-100+ K — which is precisely why only the published-J71 parity is
//!   gated, and the absolute thermosphere state stays modelled.
//!
//! PART (b) — DENSITY CHARACTERISATION (directional / order-of-magnitude only;
//!   the density row stays MODELLED).
//!   Oracle: pymsis 0.12.0 NRLMSISE-00 (MSIS v0; Picone et al. 2002), total mass
//!   density at 300/400/500/800 km for solar-min/mean/max x quiet/storm. kshana's
//!   `density_activity_factor` is a single-coefficient calibrated scale-height
//!   coupling, NOT NRLMSISE-00 absolute density, so it is checked ONLY for:
//!     * correct sign (hotter/active thermosphere => denser),
//!     * monotonicity in T_inf,
//!     * the 400 km solar-cycle swing within the SAME ORDER OF MAGNITUDE (factor
//!       of 3) as NRLMSISE-00, and storm-increment direction.
//!   The 300/500/800 km magnitude divergences are MEASURED and DOCUMENTED here
//!   (see the eprintln summary), not gated. This part exists to PROVE the density
//!   correction stays modelled.
//!
//! Reference data, provenance and the committed generator live in
//! `tests/fixtures/space_weather/`.

use kshana::space_weather::{density_activity_factor, exospheric_temperature};

const REF: &str = include_str!("fixtures/space_weather/space_weather_reference.txt");

// (a) Published Jacchia-1971 temperature parity tolerance: 1 K over the grid.
const TEMP_TOL_K: f64 = 1.0;
// (b) Order-of-magnitude band for the 400 km solar-cycle swing vs NRLMSISE-00:
// kshana/NRLMSISE within a factor of 3 (same order of magnitude). This DOCUMENTS,
// not hides, the modelling gap: NRLMSISE-00 v0 gives a steeper swing than the
// classic 5-10x band kshana is calibrated to.
const SWING_OOM_LO: f64 = 1.0 / 3.0;
const SWING_OOM_HI: f64 = 3.0;
// Reference altitudes used by the density grid (km).
const ALTS_KM: [f64; 4] = [300.0, 400.0, 500.0, 800.0];

/// kshana exospheric T_inf via the convention `exospheric_temperature(f107, f107a, kp)`.
fn kshana_t_inf(f107: f64, f107a: f64, kp: f64) -> f64 {
    exospheric_temperature(f107, f107a, kp)
}

/// J71 solar-cycle (solarmax_quiet / solarmin_quiet) density factor at `alt_km`.
fn kshana_solarcycle_factor(alt_km: f64) -> f64 {
    let t_min = kshana_t_inf(70.0, 70.0, 0.0);
    let t_max = kshana_t_inf(230.0, 230.0, 0.0);
    density_activity_factor(alt_km * 1000.0, t_max)
        / density_activity_factor(alt_km * 1000.0, t_min)
}

#[test]
fn exospheric_temperature_matches_published_jacchia_1971() {
    let mut n = 0usize;
    let mut worst = 0.0_f64;
    for line in REF.lines() {
        if !line.starts_with("J71TEMP ") {
            continue;
        }
        // J71TEMP f107 f107a kp t_c dt_geo t_inf
        let p: Vec<&str> = line.split_whitespace().collect();
        assert_eq!(p.len(), 7, "J71TEMP row needs 7 fields: {line}");
        let f107: f64 = p[1].parse().unwrap();
        let f107a: f64 = p[2].parse().unwrap();
        let kp: f64 = p[3].parse().unwrap();
        let t_inf_want: f64 = p[6].parse().unwrap();

        let got = kshana_t_inf(f107, f107a, kp);
        let d = (got - t_inf_want).abs();
        worst = worst.max(d);
        assert!(
            d <= TEMP_TOL_K,
            "J71 T_inf(F107={f107}, F107a={f107a}, Kp={kp}): kshana {got:.4} K vs \
             published Jacchia-1971 {t_inf_want:.4} K (|Δ|={d:.3e} > {TEMP_TOL_K} K)",
        );
        n += 1;
    }
    assert!(
        n >= 25,
        "expected >=25 Jacchia-1971 temperature parity cases, got {n}"
    );
    eprintln!(
        "space_weather PART (a): {n} cases vs published Jacchia-1971 T_inf, \
         worst |Δ| = {worst:.3e} K (gate {TEMP_TOL_K} K) -> VALIDATABLE."
    );
}

#[test]
fn density_factor_direction_and_order_of_magnitude_vs_nrlmsise00() {
    // --- Robust DIRECTIONAL facts (must hold; characterisation, not fit) ---

    // Sign + monotonicity: the J71 solar-cycle factor rises above 1 and is
    // strictly increasing in altitude-leverage at every reference altitude.
    let mut last = 0.0_f64;
    for &alt in &ALTS_KM {
        let f = kshana_solarcycle_factor(alt);
        assert!(
            f > 1.0,
            "solar-max must be denser than solar-min at {alt} km (factor {f})"
        );
        assert!(
            f > last,
            "solar-cycle swing must grow with altitude: {alt} km gave {f} <= {last}"
        );
        last = f;
    }

    // Monotone in T_inf at a fixed altitude (hotter thermosphere -> denser).
    let alt_m = 400_000.0;
    let cold = density_activity_factor(alt_m, kshana_t_inf(70.0, 70.0, 0.0));
    let hot = density_activity_factor(alt_m, kshana_t_inf(230.0, 230.0, 0.0));
    assert!(
        cold < 1.0 && hot > 1.0 && hot > cold,
        "cold {cold} hot {hot}"
    );

    // Storm densifies at every NRLMSISE-00 reference altitude (sign check).
    for &alt in &ALTS_KM {
        let quiet = density_activity_factor(alt * 1000.0, kshana_t_inf(150.0, 150.0, 0.0));
        let storm = density_activity_factor(alt * 1000.0, kshana_t_inf(150.0, 150.0, 6.0));
        assert!(
            storm > quiet,
            "storm must densify at {alt} km: {storm} <= {quiet}"
        );
    }

    // --- NRLMSISE-00 ratios from the committed oracle fixture ---
    let mut msis_solarcycle: std::collections::HashMap<u32, f64> = Default::default();
    let mut msis_storm_mean: std::collections::HashMap<u32, f64> = Default::default();
    for line in REF.lines() {
        if let Some(rest) = line.strip_prefix("MSISRATIO solarcycle ") {
            let p: Vec<&str> = rest.split_whitespace().collect();
            let alt = p[0].parse::<f64>().unwrap() as u32;
            msis_solarcycle.insert(alt, p[1].parse().unwrap());
        } else if let Some(rest) = line.strip_prefix("MSISRATIO storm_solarmean ") {
            let p: Vec<&str> = rest.split_whitespace().collect();
            let alt = p[0].parse::<f64>().unwrap() as u32;
            msis_storm_mean.insert(alt, p[1].parse().unwrap());
        }
    }
    assert!(
        msis_solarcycle.len() == 4 && msis_storm_mean.len() == 4,
        "expected NRLMSISE-00 ratio rows for all 4 altitudes"
    );

    // GATED order-of-magnitude check: the 400 km solar-cycle swing agrees with
    // NRLMSISE-00 to within a factor of 3 (same order of magnitude). This is the
    // ONLY density comparison that is asserted; it is deliberately loose because
    // density stays MODELLED.
    let k400 = kshana_solarcycle_factor(400.0);
    let m400 = msis_solarcycle[&400];
    let ratio = k400 / m400;
    assert!(
        (SWING_OOM_LO..=SWING_OOM_HI).contains(&ratio),
        "400 km solar-cycle swing: kshana {k400:.2}x vs NRLMSISE-00 {m400:.2}x \
         (kshana/NRLMSISE = {ratio:.3}, outside [{SWING_OOM_LO:.3}, {SWING_OOM_HI:.3}])"
    );

    // Both models must agree the 400 km storm increment is a modest >1 factor
    // (direction + rough magnitude, NOT tight): NRLMSISE-00 storm/quiet at 400 km
    // is a low single-digit factor and so is kshana.
    let k_storm400 = density_activity_factor(400_000.0, kshana_t_inf(150.0, 150.0, 6.0))
        / density_activity_factor(400_000.0, kshana_t_inf(150.0, 150.0, 0.0));
    let m_storm400 = msis_storm_mean[&400];
    assert!(
        k_storm400 > 1.0 && m_storm400 > 1.0,
        "storm increment must be >1 in both models"
    );
    let storm_ratio = k_storm400 / m_storm400;
    assert!(
        (0.5..=2.0).contains(&storm_ratio),
        "400 km storm increment: kshana {k_storm400:.3}x vs NRLMSISE-00 {m_storm400:.3}x \
         (ratio {storm_ratio:.3})"
    );

    // --- DOCUMENT the per-altitude divergences (measured, NOT gated) ---
    eprintln!("space_weather PART (b) CHARACTERISATION (density stays MODELLED):");
    eprintln!(
        "  solar-cycle swing kshana vs NRLMSISE-00 (MSIS v0): \
         300km {:.1}/{:.1}x  400km {:.1}/{:.1}x  500km {:.1}/{:.1}x  800km {:.1}/{:.1}x",
        kshana_solarcycle_factor(300.0),
        msis_solarcycle[&300],
        k400,
        m400,
        kshana_solarcycle_factor(500.0),
        msis_solarcycle[&500],
        kshana_solarcycle_factor(800.0),
        msis_solarcycle[&800],
    );
    eprintln!(
        "  -> GATED: 400 km swing within factor 3 (kshana/NRLMSISE = {ratio:.3}); \
         500/800 km diverge (kshana's calibrated coupling has NO per-altitude validity \
         aloft: 800 km kshana {:.0}x vs NRLMSISE-00 {:.0}x). 400 km storm increment \
         agrees to {:.0}%.",
        kshana_solarcycle_factor(800.0),
        msis_solarcycle[&800],
        (storm_ratio - 1.0).abs() * 100.0,
    );
}
