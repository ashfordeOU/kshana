// SPDX-License-Identifier: AGPL-3.0-only
//! Pre-registered comparison, amendment: the Earth split from the Earth-Moon barycentre and the
//! rotation to the ICRF, the two parts of the Standish planet-position row that
//! `tests/solar_system_standish_preregistered.rs` does not reach.
//!
//! # Pre-registration (written 2026-10-02, before any fixture of this file was fetched)
//!
//! The VALIDATED row "Planet positions across the solar system from the JPL Standish Keplerian
//! elements" also claims (a) the Earth, split from the Earth-Moon barycentre (EMB) by the
//! Montenbruck & Gill lunar series and the mass ratio, and (b) positions rotated to the ICRF
//! (International Celestial Reference Frame) by the JPL page's obliquity, composed as
//! `kshana::ephem_provider::AnalyticSolarSystem`. The first pre-registered test (commit 80451866)
//! exercises only `ephem::standish_state` for the barycentres in the ecliptic. This file adds the
//! two missing paths, at the same bar and on the same grid. The test
//! `tests/solar_system_horizons_reference.rs::earth_from_the_barycentre_and_the_moon`, whose bar
//! was set after its comparison, is not a promotion basis for the Earth.
//!
//! **Disclosure (outcome partly known).** The Table 1 barycentre results of commit 07b3c2a9 were
//! seen before this was written (largest RMS over the figure 0.778). Case B is a rotation of the
//! same Standish positions and case A moves the EMB by at most about 4 671 km (the Earth's
//! distance from the EMB), against an EMB distance bar of 6 000 km RMS; so the outcome is largely
//! predictable from what was seen. The comparison is still run as written and its bar is fixed
//! here.
//!
//! **Disclosure (the RMS statistic).** The RMS statistic of the first pre-registration was chosen
//! knowing that an earlier 27-epoch comparison reached 1.87 times the nominal figure at its
//! maximum; single-epoch errors in that run reach 3.83 times the figure. The Explanatory
//! Supplement calls the figures "approximate errors" and does not define them as RMS values. This
//! amendment keeps the same RMS statistic and the same 1.0 factor; maxima are printed, not gating.
//!
//! **Oracle.** JPL (Jet Propulsion Laboratory) Horizons system, API version 1.2
//! (<https://ssd.jpl.nasa.gov/api/horizons.api>), planetary ephemeris DE441 (a US Government
//! work, free to use). `EPHEM_TYPE=VECTORS`, `CENTER='500@10'` (the Sun's body centre),
//! `REF_SYSTEM=ICRF`, `VEC_CORR=NONE` (geometric), `VEC_TABLE=1`, `OUT_UNITS=KM-S`, time scale
//! TDB (barycentric dynamical time).
//!
//! **Grid.** The Table 1 grid of the first pre-registration: JD(TDB) = 2378496.5 + 10.25 k,
//! k = 0 to 8908, dropping JD 2466154.5 (an epoch of the old fixture): 8908 epochs per target.
//! Positions stored rounded to 1 km, as in the first pre-registration.
//!
//! **Case A, the Earth in the ecliptic.** Horizons target 399 (the Earth's body centre),
//! `REF_PLANE=ECLIPTIC`. Kshana: `AnalyticSolarSystem { table: Some(StandishTable::Table1) }
//! .heliocentric_state("Earth", jd)` (ICRF), turned back to the J2000 ecliptic with
//! `kshana::ephem::icrf_to_ecliptic`. Bar: the EMB row of Table 8.10.1, 1800 to 2050:
//! RMS of lambda at most 20", of phi at most 8", of rho at most 6 000 km (1.0 times). The lunar
//! series' own error, scaled by the mass ratio 0.0121, is a few km, far below that bar.
//!
//! **Case B, the ICRF.** `REF_PLANE=FRAME` (the ICRF equator and equinox), targets 1, 2, 3, 4, 5,
//! 6 (the barycentres of Table 1, 3 being the EMB) and 399 (the Earth). Kshana: for 1, 2, 4, 5,
//! 6 `AnalyticSolarSystem { table: Some(Table1) }.heliocentric_state(name, jd)` with the names
//! Mercury, Venus, Mars, Jupiter, Saturn; for 3 `ephem::ecliptic_to_icrf(standish_state(
//! EarthMoonBarycentre, t, Table1).pos_m)` (the same rotation `AnalyticSolarSystem` applies; the
//! EMB has no body name there); for 399 `heliocentric_state("Earth", jd)`. Both Kshana's and
//! Horizons' ICRF vectors are then expressed in J2000 ecliptic components by one rotation typed
//! in this test, about x by the IAU 1976 obliquity 84381.448 arcsec (the obliquity Horizons
//! states for its J2000 ecliptic), not by Kshana's own constant: a rotation applied to both
//! sides is only a choice of component basis, and keeping it out of Kshana means an error in
//! Kshana's ICRF rotation (`ephem::ecliptic_to_icrf`, obliquity 23.43928 deg) shows up as an error
//! here. Bars: each body's Table 8.10.1 1800 to 2050 row (the EMB row for 399), RMS at most 1.0
//! times, per component lambda, phi, rho.
//!
//! **Bar source.** Explanatory Supplement to the Astronomical Almanac, 3rd ed., Chapter 8
//! (Standish and Williams), Table 8.10.1, from `ch8.pdf` page 27, SHA-256
//! fa177870ea85697631c3813dae54939a940fbb8096f8386f78718f40b1626104, typed in
//! `tests/solar_system_standish_preregistered.rs` and repeated below.
//!
//! **Outcome rule.** Every RMS of cases A and B within its bar: these paths of the row are
//! supported. Any one outside: the strict test stays ignored with the measured ratio, a gated
//! test pins the finding, and the row does not keep VALIDATED for that path.
//!
//! Fixture: `tests/fixtures/solar_system_standish_earth_icrf_preregistered/` (generator, NOTICE,
//! CSVs), fetched only after this header was committed.
//!
//! # Result (run 2026-10-02, after the pre-registration commit 8d38a28b)
//!
//! Every RMS is inside its bar. Case A, the Earth in the ecliptic: RMS over the EMB figure 0.433
//! (lambda), 0.360 (phi), 0.483 (rho); maxima 1.30, 0.98, 1.30 times. Case B, the ICRF: the
//! largest RMS over the figure is 0.778 (Saturn's distance), then 0.763 (Mars' longitude); the
//! Earth 0.433 / 0.360 / 0.483; maxima reach 3.87 times (Mercury's latitude), not gating. The
//! Earth and the EMB give the same ratios to three digits: the lunar-series offset agrees with
//! DE441's Earth-EMB offset far inside the EMB bar.

use kshana::ephem::{ecliptic_to_icrf, icrf_to_ecliptic, standish_state, Planet, StandishTable};
use kshana::ephem_provider::AnalyticSolarSystem;

const ARCSEC_PER_RAD: f64 = 206_264.806_247_096_36;

/// IAU 1976 obliquity of the J2000 ecliptic (arcsec), typed here, not read from Kshana.
const OBLIQUITY_J2000_ARCSEC: f64 = 84_381.448;

/// Table 8.10.1, 1800 AD to 2050 AD: lambda ["], phi ["], rho [1000 km].
fn bar_for(id: usize) -> [f64; 3] {
    match id {
        1 => [15.0, 1.0, 1.0],
        2 => [20.0, 1.0, 4.0],
        3 | 399 => [20.0, 8.0, 6.0],
        4 => [40.0, 2.0, 25.0],
        5 => [400.0, 10.0, 600.0],
        6 => [600.0, 25.0, 1500.0],
        _ => panic!("no Table 1 row for {id}"),
    }
}

fn name_of(id: usize) -> &'static str {
    match id {
        1 => "Mercury",
        2 => "Venus",
        3 => "Earth-Moon barycentre",
        4 => "Mars",
        5 => "Jupiter",
        6 => "Saturn",
        399 => "Earth",
        _ => panic!("unexpected target {id}"),
    }
}

struct Row {
    id: usize,
    jd: f64,
    pos_km: [f64; 3],
}

fn fixture(file: &str) -> Vec<Row> {
    let path = format!(
        "{}/tests/fixtures/solar_system_standish_earth_icrf_preregistered/{file}",
        env!("CARGO_MANIFEST_DIR")
    );
    let text = std::fs::read_to_string(&path).unwrap_or_else(|e| panic!("read {path}: {e}"));
    text.lines()
        .filter(|l| !l.starts_with('#') && !l.trim().is_empty())
        .map(|l| {
            let c: Vec<&str> = l.split(',').map(str::trim).collect();
            let num = |s: &str| -> f64 { s.parse().unwrap_or_else(|_| panic!("bad number {s}")) };
            Row {
                id: c[0].parse().expect("id"),
                jd: num(c[1]),
                pos_km: [num(c[2]), num(c[3]), num(c[4])],
            }
        })
        .collect()
}

/// ICRF to J2000 ecliptic components with the obliquity typed above.
fn equator_to_ecliptic_typed(v: [f64; 3]) -> [f64; 3] {
    let (s, c) = (OBLIQUITY_J2000_ARCSEC / ARCSEC_PER_RAD).sin_cos();
    [v[0], c * v[1] + s * v[2], -s * v[1] + c * v[2]]
}

fn lbr(p: [f64; 3]) -> (f64, f64, f64) {
    let r = (p[0] * p[0] + p[1] * p[1] + p[2] * p[2]).sqrt();
    (p[1].atan2(p[0]), (p[2] / r).asin(), r)
}

/// Model minus oracle, both in ecliptic components (km): lambda ["], phi ["], rho [1000 km].
fn error(model_km: [f64; 3], oracle_km: [f64; 3]) -> [f64; 3] {
    let (lm, bm, rm) = lbr(model_km);
    let (lo, bo, ro) = lbr(oracle_km);
    let pi = std::f64::consts::PI;
    let dl = (lm - lo + pi).rem_euclid(2.0 * pi) - pi;
    [
        dl * ARCSEC_PER_RAD,
        (bm - bo) * ARCSEC_PER_RAD,
        (rm - ro) / 1e3,
    ]
}

const T1: AnalyticSolarSystem = AnalyticSolarSystem {
    table: Some(StandishTable::Table1),
};

/// Kshana's heliocentric ICRF position (m) of target `id` at `jd` (TDB).
fn kshana_icrf_m(id: usize, jd: f64) -> [f64; 3] {
    if id == 3 {
        let t = (jd - 2_451_545.0) / 36_525.0;
        let s = standish_state(Planet::EarthMoonBarycentre, t, StandishTable::Table1)
            .expect("EMB state");
        return ecliptic_to_icrf(s.pos_m);
    }
    T1.heliocentric_state(name_of(id), jd)
        .expect("Kshana state")
        .0
}

fn km(v: [f64; 3]) -> [f64; 3] {
    v.map(|x| x / 1e3)
}

/// Score one series; push failures, print RMS/bar and max/bar.
fn score(label: &str, id: usize, errs: &[[f64; 3]], failures: &mut Vec<String>) {
    assert_eq!(
        errs.len(),
        8908,
        "{label} {}: pre-registered epoch count",
        name_of(id)
    );
    let bar = bar_for(id);
    let n = errs.len() as f64;
    let mut rms = [0.0; 3];
    let mut max = [0.0_f64; 3];
    for e in errs {
        for k in 0..3 {
            rms[k] += e[k] * e[k];
            max[k] = max[k].max(e[k].abs());
        }
    }
    let rms = rms.map(|s| (s / n).sqrt());
    println!(
        "{label} {:<22} n={} RMS/bar: lambda {:.3}, phi {:.3}, rho {:.3}; RMS {:.3}\" {:.3}\" {:.3} Mm; max/bar {:.2} {:.2} {:.2}",
        name_of(id),
        errs.len(),
        rms[0] / bar[0],
        rms[1] / bar[1],
        rms[2] / bar[2],
        rms[0],
        rms[1],
        rms[2],
        max[0] / bar[0],
        max[1] / bar[1],
        max[2] / bar[2],
    );
    for (k, what) in ["lambda", "phi", "rho"].iter().enumerate() {
        if rms[k] > bar[k] {
            failures.push(format!(
                "{label} {} {what}: RMS {:.4} = {:.3} x the Table 8.10.1 figure {}",
                name_of(id),
                rms[k],
                rms[k] / bar[k],
                bar[k]
            ));
        }
    }
}

/// Case A: the Earth (Horizons 399) in the J2000 ecliptic, through `AnalyticSolarSystem` and
/// `icrf_to_ecliptic`, at the EMB row of Table 8.10.1.
#[test]
fn earth_from_the_split_barycentre_is_within_the_emb_table_8_10_1_rms() {
    let rows = fixture("horizons_earth_ecliptic.csv");
    let errs: Vec<[f64; 3]> = rows
        .iter()
        .filter(|r| r.id == 399)
        .map(|r| error(km(icrf_to_ecliptic(kshana_icrf_m(399, r.jd))), r.pos_km))
        .collect();
    let mut failures = Vec::new();
    score("A ecliptic", 399, &errs, &mut failures);
    assert!(failures.is_empty(), "{failures:#?}");
}

/// Case B: the Table 1 barycentres and the Earth in the ICRF, both sides turned to ecliptic
/// components by the typed IAU 1976 obliquity, at each body's Table 8.10.1 row.
#[test]
fn icrf_positions_are_within_the_table_8_10_1_rms() {
    let rows = fixture("horizons_icrf.csv");
    let mut failures = Vec::new();
    for id in [1, 2, 3, 4, 5, 6, 399] {
        let errs: Vec<[f64; 3]> = rows
            .iter()
            .filter(|r| r.id == id)
            .map(|r| {
                error(
                    equator_to_ecliptic_typed(km(kshana_icrf_m(id, r.jd))),
                    equator_to_ecliptic_typed(r.pos_km),
                )
            })
            .collect();
        score("B ICRF", id, &errs, &mut failures);
    }
    assert!(failures.is_empty(), "{failures:#?}");
}
