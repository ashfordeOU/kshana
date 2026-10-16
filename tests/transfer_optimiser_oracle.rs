// SPDX-License-Identifier: AGPL-3.0-only
//! The impulsive transfer optimiser on the DE440 ephemeris (`maneuver::optimise_transfer_kernel`,
//! CAP-20c) and the Earth-Mars C3 cross-check (CAP-20d).
//!
//! Pre-registration: `docs/design/evidence/cap20cd-transfer-optimiser/PREREGISTRATION.md`.
//! Oracle A: `tests/fixtures/transfer_optimiser/` (generate.py, reference.csv, NOTICE.md), an
//! independent SPICE + pykep 3.0.1 + SciPy 1.18.1 optimiser on the same committed de440s cut.
//! Bars A per optimisation: objective within 1e-7 relative, dates within 0.01 day, the other
//! quantity within 1e-4 relative. Reference B (secondary, published): NASA/TM-2010-216764
//! Table 2, the 2026 opportunity energy minima.
//!
//! ## Result
//!
//! First run 2026-10-14: oracle A holds on all four optimisations (worst objective 8.7e-13
//! relative, dates within 1e-5 day, other quantity within 2.5e-7 relative). Reference B: B1
//! (+0.42 %) and B3 (-0.04 %) MET; B2 NOT MET, Type I minimum C3 10.535 against the published
//! 11.11 (-5.18 %), the same value the library oracle finds; B4 dates within 2.6 days, MET.
//! Details in `docs/design/evidence/cap20cd-transfer-optimiser/RESULTS.md`.

use kshana::ephem_provider::KernelEphemeris;
use kshana::maneuver::{
    optimise_transfer_kernel, TransferObjective, TransferOptimum, TransferType,
};

const DIR: &str = concat!(env!("CARGO_MANIFEST_DIR"), "/tests/fixtures");
const MU_SUN: f64 = 1.327_124_400_41e20;
/// The pre-registered windows (00:00 TDB): departure 2026-09-15..2027-01-15, arrival
/// 2027-05-01..2028-03-01.
const DEP: (f64, f64) = (2_461_298.5, 2_461_420.5);
const ARR: (f64, f64) = (2_461_526.5, 2_461_831.5);

fn kernel() -> KernelEphemeris {
    KernelEphemeris::open(std::path::Path::new(&format!(
        "{DIR}/porkchop_de440/de440s_2026-08-30_2028-04-15.bsp"
    )))
    .expect("the cut opens")
}

fn run(k: &KernelEphemeris, t: TransferType, o: TransferObjective) -> TransferOptimum {
    optimise_transfer_kernel(k, 399, 4, DEP, ARR, o, t, MU_SUN, 2.0).expect("optimum")
}

fn parse(t: &str, o: &str) -> (TransferType, TransferObjective) {
    let tt = if t == "I" {
        TransferType::I
    } else {
        TransferType::II
    };
    let oo = if o == "MinC3" {
        TransferObjective::MinC3
    } else {
        TransferObjective::MinArrivalVinf
    };
    (tt, oo)
}

fn rel(a: f64, b: f64) -> f64 {
    (a - b).abs() / b.abs()
}

#[test]
fn transfer_optimiser_matches_spice_pykep_scipy() {
    let k = kernel();
    let text =
        std::fs::read_to_string(format!("{DIR}/transfer_optimiser/reference.csv")).expect("ref");
    let mut n = 0;
    for l in text
        .lines()
        .filter(|l| !l.starts_with('#') && !l.is_empty())
    {
        let f: Vec<&str> = l.split(',').collect();
        let (t, o) = parse(f[0], f[1]);
        let v: Vec<f64> = f[2..].iter().map(|x| x.parse().unwrap()).collect();
        let (dep, arr, c3, vinf) = (v[0], v[1], v[2], v[3]);
        let r = run(&k, t, o);
        let (obj, other) = match o {
            TransferObjective::MinC3 => (rel(r.c3_km2s2, c3), rel(r.vinf_arr_kms, vinf)),
            TransferObjective::MinArrivalVinf => (rel(r.vinf_arr_kms, vinf), rel(r.c3_km2s2, c3)),
        };
        let (dd, da) = ((r.dep_jd_tdb - dep).abs(), (r.arr_jd_tdb - arr).abs());
        println!(
            "{} {}: C3 {:.6} vs {:.6}, Vinf {:.6} vs {:.6}; objective {obj:.2e}, other \
             {other:.2e}, dates {dd:.2e} / {da:.2e} d, {} iterations",
            f[0], f[1], r.c3_km2s2, c3, r.vinf_arr_kms, vinf, r.iterations
        );
        assert!(obj <= 1e-7, "A1 {} {}: objective {obj:e}", f[0], f[1]);
        assert!(
            dd <= 0.01 && da <= 0.01,
            "A2 {} {}: dates {dd} / {da} d",
            f[0],
            f[1]
        );
        assert!(other <= 1e-4, "A3 {} {}: other {other:e}", f[0], f[1]);
        n += 1;
    }
    assert_eq!(n, 4);
}

/// Days from 2026-09-01 00:00 TDB (JD 2461284.5) of a calendar date in the published table.
fn jd(y: i32, m: u32, d: u32) -> f64 {
    let days = |y: i32, m: u32, d: u32| -> i64 {
        // Days from civil (proleptic Gregorian), Howard Hinnant's algorithm.
        let y = if m <= 2 { y - 1 } else { y } as i64;
        let era = y.div_euclid(400);
        let yoe = y - era * 400;
        let mp = (m as i64 + 9) % 12;
        let doy = (153 * mp + 2) / 5 + d as i64 - 1;
        let doe = yoe * 365 + yoe / 4 - yoe / 100 + doy;
        era * 146_097 + doe
    };
    2_461_284.5 + (days(y, m, d) - days(2026, 9, 1)) as f64
}

#[test]
fn transfer_optimiser_against_the_published_2026_handbook() {
    let k = kernel();
    // (case, optimum, published value, published departure, published arrival)
    let cases = [
        (
            "B1 Type II min C3",
            run(&k, TransferType::II, TransferObjective::MinC3),
            9.144,
            jd(2026, 10, 31),
            jd(2027, 8, 19),
        ),
        (
            "B2 Type I min C3",
            run(&k, TransferType::I, TransferObjective::MinC3),
            11.11,
            jd(2026, 11, 14),
            jd(2027, 8, 9),
        ),
        (
            "B3 Type II min arrival Vinf",
            run(&k, TransferType::II, TransferObjective::MinArrivalVinf),
            2.565,
            jd(2026, 11, 6),
            jd(2027, 9, 8),
        ),
    ];
    for (name, r, published, pd, pa) in cases {
        let value = if name.starts_with("B3") {
            r.vinf_arr_kms
        } else {
            r.c3_km2s2
        };
        let (dd, da) = (r.dep_jd_tdb - pd, r.arr_jd_tdb - pa);
        println!(
            "{name}: {value:.4} vs {published} ({:+.2} %), dates {dd:+.2} / {da:+.2} d",
            100.0 * (value - published) / published
        );
        // Recorded outcome (RESULTS.md): B1 and B3 MET, B2 NOT MET (-5.18 %: the library
        // oracle finds the same 10.535 km²/s², so the gap is to the published MIDAS value, not
        // between implementations); B4 MET for all three. The miss is asserted as a miss.
        if name.starts_with("B2") {
            assert!(
                rel(value, published) > 0.02,
                "{name} was recorded NOT MET (-5.18 %); now {value} vs {published}"
            );
        } else {
            assert!(
                rel(value, published) <= 0.02,
                "{name}: {value} vs {published}"
            );
        }
        assert!(
            dd.abs() <= 4.0 && da.abs() <= 4.0,
            "B4 {name}: {dd} / {da} d"
        );
    }
}
