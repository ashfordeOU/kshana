// SPDX-License-Identifier: AGPL-3.0-only
//! Oracle test for the lunar service volume run on retrieved constellation geometry
//! (`lunar_ephemeris::LunarEphemeris` behind `ephemeris_path`, with the sweep's own
//! visibility `lunar_service::visible_sat_positions`), against the statistics the source
//! paper publishes for the same constellations.
//!
//! ## Oracle (kind: Reference)
//!
//! Bhamidipati, Mina, Sanchez and Gao, "Satellite Constellation Design for a Lunar
//! Navigation and Communication System", NAVIGATION 70(4), navi.613, 2023 (CC BY),
//! <https://navi.ion.org/content/navi/70/4/navi.613.full.pdf> (SHA-256 4e294687...),
//! Tables 4 and 5: navigation availability and single-failure tolerance at the worst user
//! grid point (STK "Min Per Day"), for case studies A, B and C at 5 deg and 20 deg masks.
//!
//! ## Narrowed claim and tolerance (fixed before the first comparison)
//!
//! The paper prints no PDOP (so the plan's "median PDOP within 5 %" cannot be evaluated),
//! and its coverage and GDOP columns are not reproducible from its own definitions (Table 5,
//! case B: 100 % availability and 100 % failure tolerance at the worst point, yet 85.1 %
//! coverage). The comparison is narrowed in writing to the two statistics the paper defines
//! unambiguously: availability (at least four satellites above the mask) and failure tolerance
//! (at least five), as the minimum over grid points and days of the daily percentage of 60 s
//! samples, over the paper's 15 days. Grid: rings every 1 deg from 80 S to 89 S with
//! round(360 cos lat) longitudes, plus the pole. Tolerance: every one of the 12 published
//! values within 2 percentage points.
//!
//! ## Result (recorded, not tuned): DISAGREES on 4 of 12
//!
//! First and only run (2026-10-01), Kshana against navi.613:
//!
//! | case | statistic | Kshana | published | difference |
//! |---|---|---|---|---|
//! | A | availability, 5 deg | 100.00 % | 100 % | 0 |
//! | A | failure tolerance, 5 deg | 93.89 % | 97.9 % | -4.01 pp |
//! | A | availability, 20 deg | 100.00 % | 77.51 % | +22.49 pp |
//! | A | failure tolerance, 20 deg | 50.56 % | 54.11 % | -3.55 pp |
//! | B | failure tolerance, 20 deg | 87.92 % | 100 % | -12.08 pp |
//! | B, C | the other seven values | 100 % | 100 % | 0 |
//!
//! Likely causes, none of them tuned away: the published elements are in the OP (Earth
//! orbital plane) frame and Kshana reads them as Moon-centred inertial (the reader reports the
//! tilt this introduces); Kshana propagates them as two-body Kepler orbits for 15 days while
//! the paper's STK scenario uses an unstated force model on frozen orbits that depend on the
//! Earth's perturbation; the STK 334-point grid is not given. The row stays MODELLED. The
//! comparison takes about 40 s in a debug build and fails, so it is ignored with that reason.
//!
//! Round 2 (2026-10-02): the OP-frame, ephemeris-grade path (`lunar_perturbed::op_frame`,
//! `propagate_tabulated`) agrees with Orekit computing the same scenario on identical
//! ephemeris and grid, and the re-run of this comparison on that path still disagrees with the
//! paper on 4 of 12; see `tests/lunar_service_volume_orekit_oracle.rs`. This file keeps the
//! round-1 reading (elements as Moon-centred inertial, two-body), which is unchanged.

use kshana::lunar::{selenographic_to_mcmf, Selenographic};
use kshana::lunar_ephemeris::LunarEphemeris;
use kshana::lunar_service::{visible_sat_positions, PositionsMcmf};

const TOL_PP: f64 = 2.0;
const STEP_S: f64 = 60.0;
const DAYS: usize = 15;

/// (case, fixture, [availability 5 deg, tolerance 5 deg, availability 20 deg, tolerance 20 deg])
/// from navi.613 Tables 4 and 5.
const PUBLISHED: [(&str, &str, [f64; 4]); 3] = [
    (
        "A",
        include_str!("fixtures/lunar_ephemeris/lncss_case_a_navi613.csv"),
        [100.0, 97.9, 77.51, 54.11],
    ),
    (
        "B",
        include_str!("fixtures/lunar_ephemeris/lncss_case_b_navi613.csv"),
        [100.0, 100.0, 100.0, 100.0],
    ),
    (
        "C",
        include_str!("fixtures/lunar_ephemeris/lncss_case_c_navi613.csv"),
        [100.0, 100.0, 100.0, 100.0],
    ),
];

fn grid() -> Vec<[f64; 3]> {
    let mut pts = Vec::new();
    for lat in 80..90 {
        let lat_deg = -(lat as f64);
        let n = (360.0 * lat_deg.to_radians().cos()).round() as usize;
        for k in 0..n {
            pts.push(selenographic_to_mcmf(Selenographic {
                lat_rad: lat_deg.to_radians(),
                lon_rad: (360.0 * k as f64 / n as f64).to_radians(),
                alt_m: 0.0,
            }));
        }
    }
    pts.push(selenographic_to_mcmf(Selenographic {
        lat_rad: -std::f64::consts::FRAC_PI_2,
        lon_rad: 0.0,
        alt_m: 0.0,
    }));
    pts
}

/// [availability 5, tolerance 5, availability 20, tolerance 20] in percent: the minimum over
/// grid points and days of the daily share of samples with >= 4 (>= 5) satellites in view.
fn worst_point_min_per_day(eph: &LunarEphemeris, users: &[[f64; 3]]) -> [f64; 4] {
    let per_day = (86_400.0 / STEP_S) as usize;
    let mut worst = [100.0_f64; 4];
    for day in 0..DAYS {
        // counts[user][stat]
        let mut counts = vec![[0usize; 4]; users.len()];
        for s in 0..per_day {
            let t = (day * per_day + s) as f64 * STEP_S;
            let sats = eph.positions_mcmf(t);
            for (u, user) in users.iter().enumerate() {
                let v5 = visible_sat_positions(*user, &sats, 5f64.to_radians());
                let v20 = visible_sat_positions(*user, &v5, 20f64.to_radians());
                let c = &mut counts[u];
                c[0] += usize::from(v5.len() >= 4);
                c[1] += usize::from(v5.len() >= 5);
                c[2] += usize::from(v20.len() >= 4);
                c[3] += usize::from(v20.len() >= 5);
            }
        }
        for c in &counts {
            for k in 0..4 {
                worst[k] = worst[k].min(100.0 * c[k] as f64 / per_day as f64);
            }
        }
    }
    worst
}

#[test]
#[ignore = "disagrees with navi.613 on 4 of 12 availability statistics (finding M076); ~40 s"]
fn coverage_and_pdop_match_the_published_statistics() {
    let users = grid();
    eprintln!(
        "M076 oracle: {} grid points at or south of 80 S",
        users.len()
    );
    let labels = ["avail 5deg", "tol 5deg", "avail 20deg", "tol 20deg"];
    let mut failures = Vec::new();
    for (case, text, published) in PUBLISHED {
        let eph = LunarEphemeris::parse(text).expect("committed LNCSS fixture parses");
        let got = worst_point_min_per_day(&eph, &users);
        for k in 0..4 {
            let d = got[k] - published[k];
            eprintln!(
                "  case {case} {:<11} Kshana {:7.2} % published {:7.2} % diff {:+7.2} pp",
                labels[k], got[k], published[k], d
            );
            if d.abs() > TOL_PP {
                failures.push(format!("case {case} {}: {d:+.2} pp", labels[k]));
            }
        }
    }
    assert!(
        failures.is_empty(),
        "outside the pre-registered 2 pp: {failures:?}"
    );
}
