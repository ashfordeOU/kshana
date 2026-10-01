// SPDX-License-Identifier: AGPL-3.0-only
//! Pre-registered comparison: the one-way planet-to-Earth light time against JPL Horizons, with
//! a bar derived only from the published Standish error table.
//!
//! # Pre-registration (written 2026-10-01, before any fixture was fetched or any number seen)
//!
//! This replaces, for the VALIDATED row "Light time between solar-system bodies", the bar of
//! `tests/solar_system_horizons_reference.rs::light_time_matches_horizons_within_the_position_bound`,
//! which was twice the post-hoc Standish distance bar. The old fixture and bar are not used.
//!
//! **Quantity.** The Newtonian one-way light time from a planet to the Earth's centre, received at
//! the epoch, from `kshana::solar_system::link(&AnalyticSolarSystem::default(), &target,
//! &Body::earth(), jd).one_way_light_time_s` (the radiometric fixed-point solver in the
//! heliocentric frame on the Standish Table 1 positions; the Earth split from the Earth-Moon
//! barycentre by the lunar series). Error dLT = Kshana minus oracle, in seconds.
//!
//! **Oracle.** JPL (Jet Propulsion Laboratory) Horizons system, API version 1.2
//! (<https://ssd.jpl.nasa.gov/api/horizons.api>), DE441 (US Government work, free to use): the
//! one-way light time `LT` of a `VECTORS` request with `VEC_CORR='LT'` (light-time corrected,
//! no stellar aberration), `CENTER='500@399'` (the Earth's body centre), `VEC_TABLE=6`
//! (LT, range, range rate), `REF_SYSTEM=ICRF`, `OUT_UNITS=KM-S`, time scale TDB (barycentric
//! dynamical time), the epoch being the reception time at the observer. Targets: the system
//! barycentres of Mercury, Venus, Mars, Jupiter and Saturn (IDs 1, 2, 4, 5, 6), the points the
//! Standish elements were fitted to.
//!
//! **Sample (fresh).** The Table 1 grid of `tests/solar_system_standish_preregistered.rs`:
//! JD(TDB) = 2378496.5 + 10.25 k, k = 0 to 8908, dropping k = 8552 (JD 2466154.5, an epoch of the
//! old fixture): 8908 epochs per target, 44 540 light times. LT is stored as Horizons prints it.
//!
//! **Tolerance (gate).** Per target: RMS over the sample of c dLT (c = 299 792 458 m/s) is at
//! most E_target + E_EMB, where for a body with Explanatory Supplement 3rd ed. Table 8.10.1
//! (1800 to 2050) errors lambda_err, phi_err (converted from arcsec to radians) and rho_err
//! (metres),
//!
//!   E = sqrt((a lambda_err)^2 + (a phi_err)^2 + rho_err^2),
//!
//! with a the Table 8.10.2 semi-major axis a_0 of that body times the astronomical unit
//! 149 597 870 700 m. E_EMB uses the Earth-Moon barycentre's row (20", 8", 6000 km,
//! a_0 = 1.00000261 au). The Table 8.10.1 figures are the ones transcribed in
//! `tests/solar_system_standish_preregistered.rs` (source `ch8.pdf`, SHA-256
//! fa177870ea85697631c3813dae54939a940fbb8096f8386f78718f40b1626104, page 27); the a_0 values
//! are typed here from Table 8.10.2 of the same page. The maximum |c dLT| is printed, not gating.
//! A miss is not fixed by changing the bar; the strict test then stays ignored with the measured
//! ratio and a gated test pins the finding.
//!
//! **Outcome rule.** All five RMS values within their bars: the row keeps VALIDATED on this test.
//!
//! Fixture: `tests/fixtures/solar_system_light_time_preregistered/` (generator, NOTICE, CSV),
//! fetched only after this header was committed. The generator also sends `REF_PLANE=FRAME`,
//! which this header did not name; it does not change the scalar `LT`.
//!
//! # Result (run 2026-10-01, after the pre-registration commit aa701595)
//!
//! Every RMS is inside its bar: RMS(c dLT) over the bar is 0.168 (Mercury), 0.259 (Venus),
//! 0.301 (Mars), 0.205 (Jupiter) and 0.265 (Saturn); the largest single error is 1.17 times the
//! bar (Mars). Mutation check: a 1e-3 relative error in the speed of light inside the solver
//! (`radiometric::solve_light_time`) turns the test red (Mercury 7.6, Venus 6.5, Mars 4.0 times
//! the bar). The bar is set by the Standish positions, so it cannot see light-time errors much
//! below about 2e-4 of the range; it validates the light time at the Standish accuracy only.

use kshana::body::Body;
use kshana::ephem_provider::AnalyticSolarSystem;
use kshana::solar_system::link;

const C_M_S: f64 = 299_792_458.0;
const AU_M: f64 = 149_597_870_700.0;
const RAD_PER_ARCSEC: f64 = std::f64::consts::PI / 648_000.0;

/// (Horizons ID, Table 8.10.1 1800-2050 lambda ["], phi ["], rho [1000 km], Table 8.10.2 a_0 [au]).
const TARGETS: [(usize, f64, f64, f64, f64); 5] = [
    (1, 15.0, 1.0, 1.0, 0.387_099_27),
    (2, 20.0, 1.0, 4.0, 0.723_335_66),
    (4, 40.0, 2.0, 25.0, 1.523_710_34),
    (5, 400.0, 10.0, 600.0, 5.202_887_00),
    (6, 600.0, 25.0, 1500.0, 9.536_675_94),
];
const EMB: (f64, f64, f64, f64) = (20.0, 8.0, 6.0, 1.000_002_61);

/// E = sqrt((a lambda)^2 + (a phi)^2 + rho^2), metres.
fn position_error_m(lambda_as: f64, phi_as: f64, rho_mm: f64, a_au: f64) -> f64 {
    let a = a_au * AU_M;
    let l = a * lambda_as * RAD_PER_ARCSEC;
    let p = a * phi_as * RAD_PER_ARCSEC;
    let r = rho_mm * 1.0e6;
    (l * l + p * p + r * r).sqrt()
}

fn body_of(id: usize) -> Body {
    match id {
        1 => Body::mercury(),
        2 => Body::venus(),
        4 => Body::mars(),
        5 => Body::jupiter(),
        6 => Body::saturn(),
        _ => panic!("unexpected target {id}"),
    }
}

/// Fixture rows: (Horizons target ID, JD(TDB) of reception, LT seconds).
fn fixture() -> Vec<(usize, f64, f64)> {
    let path = format!(
        "{}/tests/fixtures/solar_system_light_time_preregistered/horizons_light_time.csv",
        env!("CARGO_MANIFEST_DIR")
    );
    let text = std::fs::read_to_string(&path).unwrap_or_else(|e| panic!("read {path}: {e}"));
    text.lines()
        .filter(|l| !l.starts_with('#') && !l.trim().is_empty())
        .map(|l| {
            let c: Vec<&str> = l.split(',').map(str::trim).collect();
            (
                c[0].parse().expect("id"),
                c[1].parse().expect("jd"),
                c[2].parse().expect("lt"),
            )
        })
        .collect()
}

#[test]
fn light_time_rms_is_within_the_table_8_10_1_position_errors() {
    let rows = fixture();
    let eph = AnalyticSolarSystem::default();
    let e_emb = position_error_m(EMB.0, EMB.1, EMB.2, EMB.3);
    let mut failures = Vec::new();
    for (id, l, p, r, a) in TARGETS {
        let body = body_of(id);
        let bar_m = position_error_m(l, p, r, a) + e_emb;
        let mut sum = 0.0;
        let mut max: f64 = 0.0;
        let mut n = 0;
        for &(_, jd, lt) in rows.iter().filter(|row| row.0 == id) {
            let out = link(&eph, &body, &Body::earth(), jd).expect("light time");
            let d = C_M_S * (out.one_way_light_time_s - lt);
            sum += d * d;
            max = max.max(d.abs());
            n += 1;
        }
        assert_eq!(n, 8908, "{}: pre-registered epoch count", body.name);
        let rms = (sum / n as f64).sqrt();
        println!(
            "{:<8} n={n} RMS c dLT {:.1} km, bar {:.1} km, RMS/bar {:.3}; max {:.1} km, max/bar {:.2}",
            body.name,
            rms / 1e3,
            bar_m / 1e3,
            rms / bar_m,
            max / 1e3,
            max / bar_m
        );
        if rms > bar_m {
            failures.push(format!(
                "{}: RMS c dLT {:.1} km > bar {:.1} km ({:.3} x)",
                body.name,
                rms / 1e3,
                bar_m / 1e3,
                rms / bar_m
            ));
        }
    }
    assert!(failures.is_empty(), "{failures:#?}");
}
