// SPDX-License-Identifier: AGPL-3.0-only
//! The porkchop on the DE440 ephemeris (`maneuver::porkchop_kernel`, Earth to the Mars
//! barycentre, 2026-2028) against SPICE heliocentric states and pykep 3.0.1's Lambert.
//!
//! Pre-registration: `docs/design/evidence/cap20b-porkchop-de440/PREREGISTRATION.md`
//! (2d857fb1). Oracle: `tests/fixtures/porkchop_de440/` (generate.py, reference.csv, NOTICE.md).
//! The engine reads the committed de440s cut in the same directory, which reproduces de440s bit
//! for bit over the window. Bars: the same finite cells; every C3 and V∞ within 1e-8 relative;
//! the same minimum-C3 cell.
//!
//! ## Result
//!
//! First run 2026-10-13: all hold. 304 cells finite on both sides; worst C3 2.46e-14 and V∞
//! 2.58e-14 relative (bar 1e-8); minimum C3 9.1997 km²/s² at the same cell (departure
//! 2026-10-31, arrival 2027-08-15) on both sides.

use kshana::ephem_provider::KernelEphemeris;
use kshana::maneuver::porkchop_kernel;

const DIR: &str = concat!(env!("CARGO_MANIFEST_DIR"), "/tests/fixtures/porkchop_de440");

#[test]
fn de440_porkchop_matches_spice_and_pykep() {
    let k = KernelEphemeris::open(std::path::Path::new(&format!(
        "{DIR}/de440s_2026-08-30_2028-04-15.bsp"
    )))
    .expect("the cut opens");
    let text = std::fs::read_to_string(format!("{DIR}/reference.csv")).expect("reference");
    let rows: Vec<[f64; 4]> = text
        .lines()
        .filter(|l| !l.starts_with('#') && !l.is_empty())
        .map(|l| {
            let v: Vec<f64> = l.split(',').map(|x| x.parse().unwrap()).collect();
            [v[0], v[1], v[2], v[3]]
        })
        .collect();
    let dep: Vec<f64> = (0..16).map(|k| 2_461_284.5 + 10.0 * k as f64).collect();
    let arr: Vec<f64> = (0..19).map(|k| 2_461_557.5 + 15.0 * k as f64).collect();
    assert_eq!(rows.len(), dep.len() * arr.len());
    let g = porkchop_kernel(&k, 399, 4, &dep, &arr, 1.327_124_400_41e20).expect("sweep");
    let (mut wc, mut wv, mut finite) = (0.0_f64, 0.0_f64, 0);
    let mut best_ref = (f64::INFINITY, 0, 0);
    for (n, r) in rows.iter().enumerate() {
        let (i, j) = (n / arr.len(), n % arr.len());
        assert_eq!((r[0], r[1]), (dep[i], arr[j]), "cell order");
        let (c3, vi) = (g.c3_km2s2[i][j], g.vinf_arr_kms[i][j]);
        assert_eq!(
            c3.is_finite(),
            r[2].is_finite(),
            "cell ({i},{j}) finiteness"
        );
        if r[2].is_finite() {
            finite += 1;
            wc = wc.max((c3 - r[2]).abs() / r[2]);
            wv = wv.max((vi - r[3]).abs() / r[3]);
            if r[2] < best_ref.0 {
                best_ref = (r[2], i, j);
            }
        }
    }
    let (bc3, bi, bj) = g.min_c3().expect("a finite cell");
    println!(
        "{finite} finite cells: worst C3 {wc:.3e}, V-infinity {wv:.3e} relative; minimum C3 \
         {bc3:.4} km2/s2 at ({bi},{bj}), reference {:.4} at ({},{})",
        best_ref.0, best_ref.1, best_ref.2
    );
    assert!(wc <= 1e-8 && wv <= 1e-8);
    assert_eq!((bi, bj), (best_ref.1, best_ref.2));
}
