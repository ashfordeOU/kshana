// SPDX-License-Identifier: AGPL-3.0-only
//! The engine's CR3BP 9:2 L2 southern NRHO against the orbit CAPSTONE flew (JPL Horizons,
//! NAIF -1176, Moon-centred ICRF, March 2023): a measurement of the mean geometry, not a
//! validation (a CR3BP orbit is not an ephemeris-model orbit).
//!
//! Pre-registration: `docs/design/evidence/cap29d-capstone-nrho/PREREGISTRATION.md` (committed
//! alone, 4e868170, before the ephemeris was fetched). Fixture:
//! `tests/fixtures/capstone_horizons/` (NOTICE.md). Bars: period within 3 %, apolune radius
//! within 5 %, perilune radius within 20 % of CAPSTONE's means.
//!
//! ## Result
//!
//! First run 2026-10-13: all three hold. CAPSTONE (2023-03, 4 perilunes, 5 apolunes): period
//! 6.5004 d, perilune 3384.7 km, apolune 71182.4 km. CR3BP 9:2 NRHO: 6.5699 d, 3245.3 km,
//! 71215.0 km. Gaps: period 1.07e-2, apolune 4.6e-4, perilune 4.1e-2. A measurement, not a
//! validation.

use kshana::cr3bp::{differential_correct_halo, Cr3bpState, EARTH_MOON_DIST_KM, EARTH_MOON_MU};

/// (JD TDB, Moon-centred distance km) from the Horizons CSV vectors.
fn horizons() -> Vec<(f64, f64)> {
    let text = include_str!("fixtures/capstone_horizons/capstone_2023-03_moon_icrf.txt");
    let a = text.find("$$SOE").expect("SOE") + 5;
    let b = text.find("$$EOE").expect("EOE");
    text[a..b]
        .lines()
        .filter(|l| !l.trim().is_empty())
        .map(|l| {
            let f: Vec<&str> = l.split(',').map(str::trim).collect();
            let x: f64 = f[2].parse().unwrap();
            let y: f64 = f[3].parse().unwrap();
            let z: f64 = f[4].parse().unwrap();
            (f[0].parse().unwrap(), (x * x + y * y + z * z).sqrt())
        })
        .collect()
}

/// Local extrema of the distance, refined by a parabola through the three samples:
/// (minima, maxima) as (JD, km).
fn extrema(s: &[(f64, f64)]) -> (Vec<(f64, f64)>, Vec<(f64, f64)>) {
    let (mut mins, mut maxs) = (Vec::new(), Vec::new());
    for i in 1..s.len() - 1 {
        let (y0, y1, y2) = (s[i - 1].1, s[i].1, s[i + 1].1);
        let is_min = y1 < y0 && y1 <= y2;
        let is_max = y1 > y0 && y1 >= y2;
        if !(is_min || is_max) {
            continue;
        }
        let h = s[i + 1].0 - s[i].0;
        let den = y0 - 2.0 * y1 + y2;
        let off = 0.5 * (y0 - y2) / den;
        let t = s[i].0 + off * h;
        let v = y1 - 0.25 * (y0 - y2) * off;
        if is_min {
            mins.push((t, v));
        } else {
            maxs.push((t, v));
        }
    }
    (mins, maxs)
}

#[test]
fn cr3bp_nrho_matches_capstone_mean_geometry() {
    let s = horizons();
    // PIN-SCOPE:    the row count of the committed Horizons response (30 days at 10 minutes)
    // PIN-EXCLUDES: every value in it; the comparison below carries its own bars
    assert_eq!(s.len(), 4321, "30 days at 10 minutes");
    let (mins, maxs) = extrema(&s);
    let mean = |v: &[(f64, f64)]| v.iter().map(|p| p.1).sum::<f64>() / v.len() as f64;
    let (rp, ra) = (mean(&mins), mean(&maxs));
    let p = (mins.last().unwrap().0 - mins[0].0) / (mins.len() - 1) as f64;

    let mu = EARTH_MOON_MU;
    let nrho = differential_correct_halo(
        &Cr3bpState {
            r: [1.0220, 0.0, -0.1800],
            v: [0.0, -0.1020, 0.0],
        },
        mu,
        1e-11,
        80,
    )
    .expect("the 9:2 NRHO corrects");
    let ep = nrho.period_days();
    let erp = nrho.perilune_radius_km(mu, 600);
    let ic = nrho.ic.r;
    let era =
        ((ic[0] - (1.0 - mu)).powi(2) + ic[1].powi(2) + ic[2].powi(2)).sqrt() * EARTH_MOON_DIST_KM;

    let (dp, da, dr) = (
        (ep - p).abs() / p,
        (era - ra).abs() / ra,
        (erp - rp).abs() / rp,
    );
    println!(
        "CAPSTONE {} perilunes / {} apolunes: period {p:.4} d, perilune {rp:.1} km, apolune {ra:.1} km",
        mins.len(),
        maxs.len()
    );
    println!("CR3BP 9:2 NRHO: period {ep:.4} d, perilune {erp:.1} km, apolune {era:.1} km");
    println!("gaps: period {dp:.3e} (bar 3e-2), apolune {da:.3e} (bar 5e-2), perilune {dr:.3e} (bar 2e-1)");
    assert!(dp <= 0.03 && da <= 0.05 && dr <= 0.20);
}
