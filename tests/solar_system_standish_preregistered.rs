// SPDX-License-Identifier: AGPL-3.0-only
//! Pre-registered comparison: the Standish Keplerian planet positions against JPL Horizons,
//! scored against the published error table.
//!
//! # Pre-registration (written 2026-10-01, before any fixture was fetched or any number seen)
//!
//! This replaces, for the VALIDATED row "Planet positions across the solar system from the JPL
//! Standish Keplerian elements", the bar of twice the nominal error that
//! `tests/solar_system_horizons_reference.rs` set after its first comparison. The old comparison
//! is not reused: its 27 epochs are excluded from this sample and its bar is not used.
//!
//! **Quantity.** The heliocentric position of each planet from `kshana::ephem::standish_state`
//! (mean ecliptic and equinox of J2000), expressed as heliocentric ecliptic longitude lambda,
//! latitude phi and distance rho; the error is Kshana minus the oracle per component, lambda
//! wrapped to plus or minus 180 degrees, lambda and phi in arcseconds, rho in thousands of km.
//!
//! **Oracle.** JPL (Jet Propulsion Laboratory) Horizons system, API version 1.2
//! (<https://ssd.jpl.nasa.gov/api/horizons.api>), planetary ephemeris DE441 (a US Government
//! work, free to use). Query per target: `EPHEM_TYPE=VECTORS`, `CENTER='500@10'` (the Sun's body
//! centre, so heliocentric), `REF_PLANE=ECLIPTIC`, `REF_SYSTEM=ICRF` (the J2000 mean ecliptic
//! and equinox), `VEC_CORR=NONE` (geometric), `VEC_TABLE=1`, `OUT_UNITS=KM-S`, time scale TDB
//! (barycentric dynamical time). Targets are the system barycentres, IDs 1 to 8 (the Standish
//! elements were fitted to barycentres; ID 3 is the Earth-Moon barycentre).
//!
//! **Sample (fresh).**
//! * Table 1 (fitted for 1800 AD to 2050 AD): Mercury, Venus, the Earth-Moon barycentre, Mars,
//!   Jupiter and Saturn (IDs 1 to 6) at JD(TDB) = 2378496.5 + 10.25 k (1800-01-01 0h onward),
//!   every grid epoch not after 2469807.5 (2050-01-01 0h): k = 0 to 8908, 8909 epochs. One grid
//!   epoch, JD 2466154.5 (k = 8552), is an epoch of the existing fixture and is dropped, so 8908
//!   epochs per planet. Uranus and Neptune from Table 1 are not in this row (they are the
//!   separate MODELLED row and stay so).
//! * Table 2 (Tables 2a and 2b of the JPL page, 8.10.3 and 8.10.4 of the Supplement, fitted for
//!   3000 BC to 3000 AD): all eight planets (IDs 1 to 8) at JD(TDB) = 625673.5 + 100.25 k
//!   (-2999-01-01 0h, Julian calendar) for every grid epoch not after 2816787.5 (3000-01-01 0h):
//!   k = 0 to 21856, 21857 epochs per planet; none coincides with an existing fixture epoch.
//! * The fixture stores x, y, z rounded to 1 km to keep it small. The smallest bar is 1 arcsec
//!   at Mercury (about 225 km at 0.31 au), so rounding contributes under 0.004 arcsec and under
//!   0.001 thousand km; this is stated before the comparison.
//!
//! **Tolerance (gate).** For every planet, table and component: the root-mean-square error over
//! the sample is at most **1.0 times** the "approximate error" of the Explanatory Supplement to
//! the Astronomical Almanac, 3rd edition, Chapter 8 (E. M. Standish and J. G. Williams, "Orbital
//! Ephemerides of the Sun, Moon, and Planets"), Section 8.10.3, Table 8.10.1, transcribed below
//! from the chapter PDF `ch8.pdf` (33 pages, the table on page 27), SHA-256
//! fa177870ea85697631c3813dae54939a940fbb8096f8386f78718f40b1626104. The same figures are printed
//! as "nominal errors" on the JPL page <https://ssd.jpl.nasa.gov/planets/approx_pos.html>.
//! The maximum error and the maximum over the tabulated figure are printed for each series and
//! are not gating. If a component exceeds its bar, that is a finding about the published table:
//! the bar is not changed, the strict test stays ignored with the measured ratio, and a gated
//! test pins the finding.
//!
//! Table 8.10.1 (lambda and phi in arcsec, rho in 1000 km):
//!
//! | Planet | T1 lambda | T1 phi | T1 rho | T2 lambda | T2 phi | T2 rho |
//! |---|---|---|---|---|---|---|
//! | Mercury | 15 | 1 | 1 | 20 | 15 | 1 |
//! | Venus | 20 | 1 | 4 | 40 | 30 | 8 |
//! | EM Bary | 20 | 8 | 6 | 40 | 15 | 15 |
//! | Mars | 40 | 2 | 25 | 100 | 40 | 30 |
//! | Jupiter | 400 | 10 | 600 | 600 | 100 | 1000 |
//! | Saturn | 600 | 25 | 1500 | 1000 | 100 | 4000 |
//! | Uranus | 50 | 2 | 1000 | 2000 | 30 | 8000 |
//! | Neptune | 10 | 1 | 200 | 400 | 15 | 4000 |
//!
//! (Pluto's row, 5 / 2 / 300 and 400 / 100 / 2500, is printed too; Pluto is not in this row.)
//! The table here is typed from the Supplement, not read from `kshana::ephem::standish_nominal_error`.
//!
//! **Outcome rule.** All 6 x 3 Table 1 and 8 x 3 Table 2 RMS values within their bars: the row
//! keeps VALIDATED on this test. Any one outside: the row is not supported by this comparison.
//!
//! Fixture: `tests/fixtures/solar_system_standish_preregistered/` (generator, NOTICE, CSVs),
//! fetched only after this header was committed.
//!
//! # Result (run 2026-10-01, after the pre-registration commit 80451866)
//!
//! Every RMS is inside its bar; the largest RMS over the Table 8.10.1 figure is 0.778 (Saturn's
//! distance, Table 1), then 0.774 (Venus' latitude, Table 2) and 0.763 (Mars' longitude, Table 1).
//! Maxima, not gating, reach 3.83 times the figure (Mercury's latitude, Table 1): the published
//! errors behave as RMS-like figures, not as bounds. Mutation check: dropping the Table 2b
//! mean-anomaly terms (b, c, s, f) turns the test red (Neptune's longitude RMS 5.25 times, Saturn's
//! 2.50 times, Jupiter's 1.72 times the figure).

use kshana::ephem::{standish_state, Planet, StandishTable};

const ARCSEC_PER_RAD: f64 = 206_264.806_247_096_36;

/// Explanatory Supplement 3rd ed. Table 8.10.1, 1800 AD to 2050 AD: lambda ["], phi ["], rho
/// [1000 km], Mercury to Neptune in heliocentric order.
const TABLE_8_10_1_T1: [[f64; 3]; 8] = [
    [15.0, 1.0, 1.0],
    [20.0, 1.0, 4.0],
    [20.0, 8.0, 6.0],
    [40.0, 2.0, 25.0],
    [400.0, 10.0, 600.0],
    [600.0, 25.0, 1500.0],
    [50.0, 2.0, 1000.0],
    [10.0, 1.0, 200.0],
];

/// Explanatory Supplement 3rd ed. Table 8.10.1, 3000 BC to 3000 AD.
const TABLE_8_10_1_T2: [[f64; 3]; 8] = [
    [20.0, 15.0, 1.0],
    [40.0, 30.0, 8.0],
    [40.0, 15.0, 15.0],
    [100.0, 40.0, 30.0],
    [600.0, 100.0, 1000.0],
    [1000.0, 100.0, 4000.0],
    [2000.0, 30.0, 8000.0],
    [400.0, 15.0, 4000.0],
];

const PLANETS: [Planet; 8] = [
    Planet::Mercury,
    Planet::Venus,
    Planet::EarthMoonBarycentre,
    Planet::Mars,
    Planet::Jupiter,
    Planet::Saturn,
    Planet::Uranus,
    Planet::Neptune,
];

/// One fixture row: Horizons target ID (1 to 8), JD(TDB), heliocentric ecliptic x y z (km).
struct Row {
    id: usize,
    jd: f64,
    pos_km: [f64; 3],
}

fn fixture(file: &str) -> Vec<Row> {
    let path = format!(
        "{}/tests/fixtures/solar_system_standish_preregistered/{file}",
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

fn lbr(p: [f64; 3]) -> (f64, f64, f64) {
    let r = (p[0] * p[0] + p[1] * p[1] + p[2] * p[2]).sqrt();
    (p[1].atan2(p[0]), (p[2] / r).asin(), r)
}

/// Kshana minus oracle: lambda ["], phi ["], rho [1000 km].
fn error(model_m: [f64; 3], oracle_km: [f64; 3]) -> [f64; 3] {
    let (lm, bm, rm) = lbr([model_m[0] / 1e3, model_m[1] / 1e3, model_m[2] / 1e3]);
    let (lo, bo, ro) = lbr(oracle_km);
    let pi = std::f64::consts::PI;
    let dl = (lm - lo + pi).rem_euclid(2.0 * pi) - pi;
    [
        dl * ARCSEC_PER_RAD,
        (bm - bo) * ARCSEC_PER_RAD,
        (rm - ro) / 1e3,
    ]
}

/// Per-series statistics: RMS and maximum absolute error per component, and the epoch count.
struct Stats {
    rms: [f64; 3],
    max: [f64; 3],
    n: usize,
}

fn stats(rows: &[Row], id: usize, table: StandishTable) -> Stats {
    let planet = PLANETS[id - 1];
    let mut sum = [0.0_f64; 3];
    let mut max = [0.0_f64; 3];
    let mut n = 0;
    for r in rows.iter().filter(|r| r.id == id) {
        let t = (r.jd - 2_451_545.0) / 36_525.0;
        let m = standish_state(planet, t, table).expect("Standish state");
        let e = error(m.pos_m, r.pos_km);
        for k in 0..3 {
            sum[k] += e[k] * e[k];
            max[k] = max[k].max(e[k].abs());
        }
        n += 1;
    }
    assert!(n > 0, "no fixture rows for target {id}");
    let rms = sum.map(|s| (s / n as f64).sqrt());
    Stats { rms, max, n }
}

/// Evaluate one table: returns the failures (planet, component, RMS / bar) and prints every series.
fn evaluate(
    file: &str,
    table: StandishTable,
    ids: &[usize],
    bars: &[[f64; 3]; 8],
    epochs: usize,
) -> Vec<String> {
    let rows = fixture(file);
    let mut failures = Vec::new();
    for &id in ids {
        let s = stats(&rows, id, table);
        assert_eq!(s.n, epochs, "target {id}: pre-registered epoch count");
        let bar = bars[id - 1];
        println!(
            "{table:?} {:<22} n={} RMS/bar: lambda {:.3}, phi {:.3}, rho {:.3}; RMS {:.3}\" {:.3}\" {:.3} Mm; max {:.2}\" {:.2}\" {:.2} Mm; max/bar {:.2} {:.2} {:.2}",
            PLANETS[id - 1].name(),
            s.n,
            s.rms[0] / bar[0],
            s.rms[1] / bar[1],
            s.rms[2] / bar[2],
            s.rms[0],
            s.rms[1],
            s.rms[2],
            s.max[0],
            s.max[1],
            s.max[2],
            s.max[0] / bar[0],
            s.max[1] / bar[1],
            s.max[2] / bar[2],
        );
        for (k, what) in ["lambda", "phi", "rho"].iter().enumerate() {
            if s.rms[k] > bar[k] {
                failures.push(format!(
                    "{table:?} {} {what}: RMS {:.4} = {:.3} x the Table 8.10.1 figure {}",
                    PLANETS[id - 1].name(),
                    s.rms[k],
                    s.rms[k] / bar[k],
                    bar[k]
                ));
            }
        }
    }
    failures
}

#[test]
fn standish_rms_errors_are_within_explanatory_supplement_table_8_10_1() {
    let mut failures = evaluate(
        "horizons_table1.csv",
        StandishTable::Table1,
        &[1, 2, 3, 4, 5, 6],
        &TABLE_8_10_1_T1,
        8908,
    );
    failures.extend(evaluate(
        "horizons_table2.csv",
        StandishTable::Table2,
        &[1, 2, 3, 4, 5, 6, 7, 8],
        &TABLE_8_10_1_T2,
        21857,
    ));
    assert!(failures.is_empty(), "{failures:#?}");
}
