// SPDX-License-Identifier: AGPL-3.0-only
//! Pre-registered external validation of the "Lunar surface-beacon DOP augmentation" row
//! (`kind = "lunar-beacon"`, module `lunar_beacon`).
//!
//! ## The quantity
//!
//! For a lunar surface user: which satellites clear the elevation mask, which surface
//! beacons clear the airless-Moon horizon, and the dilution of precision (DOP: geometric,
//! position, horizontal, vertical and time — GDOP, PDOP, HDOP, VDOP, TDOP) of the design
//! matrix that stacks the visible satellite rows and the visible beacon rows. Concretely:
//!
//! * the row's own golden geometry, exactly as `kind = "lunar-beacon"` runs it by default:
//!   user at -80 deg latitude, 0 deg longitude, 2 m antenna; beacons at (-80, 0), (-79, 60)
//!   and (-79, -60) deg, each 2000 m above the mean sphere; the illustrative six-satellite
//!   and 24-satellite LCNS-class (Lunar Communications and Navigation Services) element
//!   sets at t = 0; 5 deg mask. Every DOP in all three report rows, the visible satellite
//!   and beacon counts (5 satellites, 1 of 3 beacons), and the two PDOP improvement factors
//!   (2.355 and 4.002);
//! * **near-boundary cases** added so that an exact match discriminates (the golden case
//!   alone does not: its flanking beacons sit 333 km away against an 86 km horizon):
//!   beacons placed at straight-line ranges of the exact two-height horizon sum plus and
//!   minus 10 m, 100 m and 1 km, for user heights 2 m and 50 m and beacon heights 10 m and
//!   2000 m (a horizon formula missing the `h^2` term is 24 m short at 2000 m and fails the
//!   10 m cases); synthetic satellites at 5 deg plus and minus 0.001, 0.01 and 0.1 deg of
//!   elevation at several azimuths; and a three-beacon low-elevation configuration (beacons
//!   60 km out at azimuths 0, 120 and 240 deg, 2000 m high) whose DOP with the six
//!   satellites is compared as well, so a beacon that actually adds horizontal geometry is
//!   inside the comparison.
//!
//! ## The oracle (Library + P2)
//!
//! * **Library — visibility and look angles.** ANISE 0.10.6 (the Rust reimplementation of
//!   the NAIF SPICE toolkit, Python bindings, Mozilla Public Licence 2.0, Nyx Space):
//!   satellite states built from the stated Keplerian elements with ANISE's own
//!   element-to-Cartesian conversion (`Orbit.from_keplerian_mean_anomaly`, Moon GM as
//!   stated by the engine); azimuth and elevation of every satellite and beacon from the
//!   user with `Almanac.azimuth_elevation_range_sez`; beacon line of sight with
//!   `Almanac.line_of_sight_obstructed`, the Moon as the obstructing body (frame
//!   `IAU_MOON`, radius 1737.4 km from NAIF `pck00011.tpc`, the same sphere the engine
//!   uses). Kshana's geometry is therefore checked, not fed to the oracle: the only shared
//!   inputs are the stated elements, sites, heights and mask. At t = 0 the engine's
//!   mean-rotation Moon-fixed frame coincides with its inertial frame (rotation angle zero),
//!   a stated convention of the illustrative constellation.
//! * **P2 — the DOP.** numpy 2.4 (BSD-3-Clause, LAPACK `inv`) on the design matrix whose
//!   rows are `[-e_SEZ, 1]`, with `e_SEZ` the unit line of sight rebuilt from ANISE's
//!   azimuth and elevation in the user's south-east-zenith frame.
//!
//! Generator: `tests/fixtures/lunar_beacon_anise/gen_lunar_beacon_anise.py`; its output is
//! committed so the test needs no Python at run time.
//!
//! ## Tolerances, fixed before the first comparison
//!
//! * Visible satellite sets and visible beacon sets: **exact** in every case.
//! * Every DOP component and both improvement factors: **1e-9 relative**.
//!
//! ## What this does not validate (P2 scoping, stated rather than implied)
//!
//! The metres. The per-beacon user-equivalent ranging error is a root-sum-square of three
//! illustrative magnitudes (1.0, 0.5 and 0.3 m) and `sigma = DOP x sigma_URE` is a scalar
//! multiplication; both are closed forms outside P2 and outside this comparison. The
//! constellation, the beacon placement and the heights are illustrative inputs: per P2 the
//! validated claim is visibility plus DOP on this committed geometry, not the accuracy of a
//! fielded service.

use kshana::api::run_toml;
use kshana::lunar::{selenographic_to_mcmf, Selenographic};
use kshana::lunar_beacon::{beacon_visible, dop_with_beacons};
use kshana::lunar_service::{visible_sat_positions, LunarConstellation};
use kshana::orbit::Dop;
use serde_json::Value;

const REFERENCE: &str = "tests/fixtures/lunar_beacon_anise/reference.txt";

/// Relative tolerance on every DOP and improvement factor.
const DOP_REL_TOL: f64 = 1.0e-9;

type Vec3 = [f64; 3];

fn site(lat_deg: f64, lon_deg: f64, alt_m: f64) -> Vec3 {
    selenographic_to_mcmf(Selenographic {
        lat_rad: lat_deg.to_radians(),
        lon_rad: lon_deg.to_radians(),
        alt_m,
    })
}

fn mask() -> f64 {
    5.0_f64.to_radians()
}

fn rel(a: f64, b: f64) -> f64 {
    (a - b).abs() / b.abs()
}

fn lines(tag: &str) -> Vec<Vec<String>> {
    std::fs::read_to_string(REFERENCE)
        .expect("the oracle output is committed")
        .lines()
        .filter(|l| l.split_whitespace().next() == Some(tag))
        .map(|l| l.split_whitespace().map(str::to_string).collect())
        .collect()
}

fn idx(field: &str) -> Vec<usize> {
    if field == "-" {
        Vec::new()
    } else {
        field.split('|').map(|x| x.parse().unwrap()).collect()
    }
}

fn five(f: &[String]) -> [f64; 5] {
    [0, 1, 2, 3, 4].map(|k| f[k].parse::<f64>().unwrap())
}

fn dop5(d: &Dop) -> [f64; 5] {
    [d.gdop, d.pdop, d.hdop, d.vdop, d.tdop]
}

fn dop_json(v: &Value) -> [f64; 5] {
    ["gdop", "pdop", "hdop", "vdop", "tdop"].map(|k| v[k].as_f64().unwrap())
}

fn check5(what: &str, got: [f64; 5], want: [f64; 5], worst: &mut f64) {
    for (k, name) in ["gdop", "pdop", "hdop", "vdop", "tdop"].iter().enumerate() {
        let e = rel(got[k], want[k]);
        *worst = worst.max(e);
        assert!(
            e <= DOP_REL_TOL,
            "{what} {name}: engine {:.12e}, ANISE+numpy {:.12e}, rel {e:.3e}",
            got[k],
            want[k]
        );
    }
}

/// Indices of the satellites the engine's mask keeps.
fn engine_visible(user: Vec3, sats: &[Vec3]) -> Vec<usize> {
    let vis = visible_sat_positions(user, sats, mask());
    (0..sats.len())
        .filter(|&i| vis.contains(&sats[i]))
        .collect()
}

#[test]
fn beacon_visibility_and_augmented_dop_match_anise_and_numpy() {
    let mut worst: f64 = 0.0;
    let user = site(-80.0, 0.0, 2.0);
    let beacons = [
        site(-80.0, 0.0, 2000.0),
        site(-79.0, 60.0, 2000.0),
        site(-79.0, -60.0, 2000.0),
    ];

    // ---- The golden geometry, through the runnable scenario kind itself. ----
    let out = run_toml("kind = \"lunar-beacon\"\n").expect("the lunar-beacon kind runs");
    let v: Value = serde_json::from_str(&out.json).unwrap();
    let rows = v["rows"].as_array().unwrap();
    let golden = lines("GOLDEN");
    assert_eq!(golden.len(), 2);
    let (g6, g24) = (&golden[0], &golden[1]);
    assert_eq!((g6[1].as_str(), g24[1].as_str()), ("6", "24"));

    // Visible sets, exact.
    let sats6 = LunarConstellation::illustrative_lcns(6).positions_mcmf(0.0);
    let sats24 = LunarConstellation::illustrative_lcns(24).positions_mcmf(0.0);
    assert_eq!(
        engine_visible(user, &sats6),
        idx(&g6[2]),
        "6-satellite visible set"
    );
    assert_eq!(
        engine_visible(user, &sats24),
        idx(&g24[2]),
        "24-satellite visible set"
    );
    let vb: Vec<usize> = (0..3)
        .filter(|&i| beacon_visible(user, beacons[i]))
        .collect();
    assert_eq!(vb, idx(&g6[3]), "visible beacon set");
    // ... and the counts the report prints.
    assert_eq!(
        rows[0]["n_visible_sats"].as_u64().unwrap() as usize,
        idx(&g6[2]).len()
    );
    assert_eq!(
        rows[1]["n_visible_beacons"].as_u64().unwrap() as usize,
        idx(&g6[3]).len()
    );
    assert_eq!(
        rows[2]["n_visible_sats"].as_u64().unwrap() as usize,
        idx(&g24[2]).len()
    );

    // DOP of all three report rows.
    let before = five(&g6[4..9]);
    let after = five(&g6[9..14]);
    let bigger = five(&g24[4..9]);
    check5("6 sats", dop_json(&rows[0]["dop"]), before, &mut worst);
    check5(
        "6 sats + beacons",
        dop_json(&rows[1]["dop"]),
        after,
        &mut worst,
    );
    check5("24 sats", dop_json(&rows[2]["dop"]), bigger, &mut worst);

    // The two improvement factors.
    for (key, want) in [
        ("beacon_pdop_improvement", before[1] / after[1]),
        ("constellation_pdop_improvement", before[1] / bigger[1]),
    ] {
        let got = v[key].as_f64().unwrap();
        let e = rel(got, want);
        worst = worst.max(e);
        assert!(
            e <= DOP_REL_TOL,
            "{key}: engine {got}, oracle {want}, rel {e:.3e}"
        );
    }

    // ---- Near-horizon beacons: exact. ----
    let horizon = lines("HORIZON");
    assert_eq!(horizon.len(), 72);
    let mut n_vis = 0;
    for f in &horizon {
        let p: Vec<f64> = f[1..8].iter().map(|x| x.parse().unwrap()).collect();
        let u = site(p[0], p[1], p[2]);
        let b = site(p[3], p[4], p[5]);
        let want = f[8] == "1";
        n_vis += usize::from(want);
        assert_eq!(
            beacon_visible(u, b),
            want,
            "user height {} m, beacon height {} m, {} m from the horizon sum",
            p[2],
            p[5],
            p[6]
        );
    }
    assert_eq!(n_vis, 36, "half the horizon cases are inside, half outside");

    // ---- Near-mask satellites: exact. ----
    let masks = lines("MASK");
    assert_eq!(masks.len(), 48);
    for f in &masks {
        let p: Vec<f64> = f[1..8].iter().map(|x| x.parse().unwrap()).collect();
        let u = site(p[0], p[1], p[2]);
        let s = [p[3], p[4], p[5]];
        let want = f[8] == "1";
        assert_eq!(
            visible_sat_positions(u, &[s], mask()).len() == 1,
            want,
            "satellite at ANISE elevation {:.6} deg from ({}, {})",
            p[6],
            p[0],
            p[1]
        );
    }

    // ---- Three low-elevation beacons that add horizontal geometry. ----
    let three = &lines("THREE")[0];
    let tb: Vec<Vec3> = three[2]
        .split(';')
        .map(|t| {
            let q: Vec<f64> = t.split(':').map(|x| x.parse().unwrap()).collect();
            site(q[0], q[1], q[2])
        })
        .collect();
    let tvis: Vec<usize> = (0..tb.len())
        .filter(|&i| beacon_visible(user, tb[i]))
        .collect();
    assert_eq!(tvis, idx(&three[3]));
    let d = dop_with_beacons(user, &sats6, &tb, mask()).expect("a solution exists");
    check5(
        "6 sats + 3 low beacons",
        dop5(&d),
        five(&three[4..9]),
        &mut worst,
    );

    println!(
        "beacon augmentation vs ANISE+numpy: visible sets exact (golden, 72 horizon cases, 48 \
         mask cases, three-beacon case); worst DOP rel {worst:.3e} (bar {DOP_REL_TOL})"
    );
}
