// SPDX-License-Identifier: AGPL-3.0-only
//! Pre-registered comparison: the light-time solver itself, separated from the Standish
//! positions, against JPL Horizons' one-way light time.
//!
//! # Pre-registration (written 2026-10-02, before any fixture of this file was fetched)
//!
//! **Why.** `tests/solar_system_light_time_preregistered.rs` (commit aa701595) compares the
//! light time on the analytic Standish positions, at a bar of 21 000 to 4 400 000 km set by
//! those positions. The retardation of the transmitter, which is what the fixed-point solver
//! adds over distance divided by c, is about v times the light time, roughly 1e-4 of the range,
//! far inside that bar: a solver stopped after its first iterate (the instantaneous range over
//! c, no retarded transmitter) still passes it. That test is kept as a non-gating accuracy
//! statement for the analytic path; this one is the promotion basis for the solver.
//!
//! **Quantity.** The Newtonian one-way light time tau from a body to the Earth's centre, received
//! at epoch t (TDB), from `kshana::solar_system::link_on(&provider, &ssb, &target, &Body::earth(),
//! t).one_way_light_time_s`, which calls `kshana::radiometric::light_time_solution` (the
//! fixed-point solver with the transmitter at its retarded position). `provider` is an
//! `EphemerisProvider` defined in this test, backed by DE441 positions (below); `ssb` is the
//! solar-system barycentre, the centre all positions are taken from. Error dtau = Kshana minus
//! oracle, seconds.
//!
//! **Positions fed to Kshana.** JPL Horizons API 1.2, DE441 (US Government work, free to use):
//! `EPHEM_TYPE=VECTORS`, `CENTER='500@0'` (the solar-system barycentre), `REF_PLANE=FRAME`,
//! `REF_SYSTEM=ICRF`, `VEC_CORR=NONE` (geometric), `VEC_TABLE=1`, `OUT_UNITS=KM-S`, TDB, for
//! targets 399 (the Earth's centre), 10 (the Sun), 301 (the Moon), 1, 2, 4, 5, 6 (the Mercury,
//! Venus, Mars, Jupiter and Saturn barycentres), every 1 day from JD 2458849.5 (2020-01-01 0h
//! TDB) to JD 2461041.5 (2026-01-01 0h TDB), 2193 epochs per body, stored as Horizons prints
//! them (no rounding). Between nodes the provider uses 8-point Lagrange interpolation on the
//! nodes floor(t)-3 to floor(t)+4 (t in days from the first node). Error budget stated before
//! the fetch: the interpolation error is below 1 m for every body (Mercury near perihelion,
//! (n h)^8 scaling, is the worst, about 1e-3 km; the Earth's monthly wobble about the
//! Earth-Moon barycentre about 4e-5 km; the Moon about 3e-3 km), i.e. below 1e-8 s of light
//! time; Horizons prints 16 significant digits.
//!
//! **Oracle.** JPL Horizons API 1.2, DE441: the one-way light time `LT` of a `VECTORS` request
//! with `VEC_CORR='LT'`, `CENTER='500@399'`, `VEC_TABLE=6`, `REF_PLANE=FRAME`, `REF_SYSTEM=ICRF`,
//! `OUT_UNITS=KM-S`, TDB, the epoch being the reception time at the observer; targets 1, 2, 4,
//! 5, 6, 10 and 301. The generator records Horizons' own legend for `LT`; if it does not
//! describe a Newtonian one-way down-leg light time, the comparison is void and is reported, not
//! re-scored.
//!
//! **Sample (fresh).** Reception epochs JD(TDB) = 2458860.3 + 1.375 k, k = 0 to 1575 (1576
//! epochs, 2020-01-11 to 2025-12-17, none on a position node), per target: 11 032 light times.
//!
//! **Interpolation precondition.** The generator also fetches the geometric barycentric
//! positions (same query as the nodes) of all eight bodies at the 1576 reception epochs. Before
//! the gate, the test checks that the provider's interpolated positions there agree with those
//! direct positions within 10 m for every body and epoch (3.3e-8 s of light time). If not, the
//! comparison is void.
//!
//! **Tolerance (gate).** For every target and every epoch, |dtau| <= **1e-6 s** (300 m). The
//! bar is fixed from the stated error budget (interpolation under 1e-8 s, print precision under
//! 1e-9 s) with a wide margin, and it is three to five orders of magnitude below the
//! retardation effect the solver adds (v tau / c: about 1e-2 to 1 s for these targets). The RMS
//! and the maximum are printed.
//!
//! **Not compared here.** `radiometric::two_way_range` and `radiometric::shapiro_delay`, which the
//! row reports alongside the one-way light time, are not compared with any external value by
//! this test.
//!
//! **Mutation to show afterwards.** Stopping `radiometric::solve_light_time` after its first
//! iterate (the instantaneous range over c) must turn this test red.
//!
//! Fixture: `tests/fixtures/solar_system_light_time_solver_preregistered/` (generator, NOTICE,
//! CSVs), fetched only after this header was committed.

use kshana::body::Body;
use kshana::ephem_provider::EphemerisProvider;
use kshana::solar_system::link_on;
use std::collections::HashMap;

type Vec3 = [f64; 3];

const NODE_JD0: f64 = 2_458_849.5;
const NODE_COUNT: usize = 2193;
const EPOCHS: usize = 1576;
const TOL_S: f64 = 1.0e-6;
const INTERP_PRECONDITION_M: f64 = 10.0;
const SSB: &str = "Solar System Barycentre";

fn fixture_lines(file: &str) -> Vec<Vec<String>> {
    let path = format!(
        "{}/tests/fixtures/solar_system_light_time_solver_preregistered/{file}",
        env!("CARGO_MANIFEST_DIR")
    );
    let text = std::fs::read_to_string(&path).unwrap_or_else(|e| panic!("read {path}: {e}"));
    text.lines()
        .filter(|l| !l.starts_with('#') && !l.trim().is_empty())
        .map(|l| l.split(',').map(|s| s.trim().to_string()).collect())
        .collect()
}

fn num(s: &str) -> f64 {
    s.parse().unwrap_or_else(|_| panic!("bad number {s}"))
}

fn horizons_id(name: &str) -> usize {
    match name {
        "Earth" => 399,
        "Sun" => 10,
        "Moon" => 301,
        "Mercury" => 1,
        "Venus" => 2,
        "Mars" => 4,
        "Jupiter" => 5,
        "Saturn" => 6,
        _ => panic!("no table for {name}"),
    }
}

/// DE441 barycentric ICRF positions on a 1-day grid, interpolated by 8-point Lagrange.
#[derive(Debug)]
struct De441Table {
    /// Horizons ID -> node positions (m), node k at JD NODE_JD0 + k.
    nodes: HashMap<usize, Vec<Vec3>>,
}

impl De441Table {
    fn load() -> Self {
        let mut nodes: HashMap<usize, Vec<Vec3>> = HashMap::new();
        for c in fixture_lines("horizons_barycentric_nodes.csv") {
            let id: usize = c[0].parse().expect("id");
            let jd = num(&c[1]);
            let v = nodes.entry(id).or_default();
            assert_eq!(jd, NODE_JD0 + v.len() as f64, "node grid for {id}");
            v.push([num(&c[2]) * 1e3, num(&c[3]) * 1e3, num(&c[4]) * 1e3]);
        }
        for (id, v) in &nodes {
            assert_eq!(v.len(), NODE_COUNT, "node count for {id}");
        }
        assert_eq!(nodes.len(), 8, "eight bodies");
        De441Table { nodes }
    }

    fn position(&self, id: usize, jd: f64) -> Vec3 {
        let v = &self.nodes[&id];
        let x = jd - NODE_JD0;
        let k = x.floor() as isize;
        let first = k - 3;
        assert!(
            first >= 0 && (first + 7) < v.len() as isize,
            "JD {jd} outside the interpolation range"
        );
        let mut out = [0.0; 3];
        for i in 0..8 {
            let xi = (first + i) as f64;
            let mut w = 1.0;
            for j in 0..8 {
                if j != i {
                    let xj = (first + j) as f64;
                    w *= (x - xj) / (xi - xj);
                }
            }
            let p = v[(first + i) as usize];
            for d in 0..3 {
                out[d] += w * p[d];
            }
        }
        out
    }

    fn of(&self, body: &Body, jd: f64) -> Vec3 {
        if body.name == SSB {
            [0.0; 3]
        } else {
            self.position(horizons_id(body.name), jd)
        }
    }
}

impl EphemerisProvider for De441Table {
    fn relative_position(&self, target: &Body, center: &Body, jd_tdb: f64) -> Option<Vec3> {
        let t = self.of(target, jd_tdb);
        let c = self.of(center, jd_tdb);
        Some([t[0] - c[0], t[1] - c[1], t[2] - c[2]])
    }
}

fn ssb() -> Body {
    Body {
        name: SSB,
        ..Body::sun()
    }
}

fn target(id: usize) -> Body {
    match id {
        1 => Body::mercury(),
        2 => Body::venus(),
        4 => Body::mars(),
        5 => Body::jupiter(),
        6 => Body::saturn(),
        10 => Body::sun(),
        301 => Body::moon(),
        _ => panic!("unexpected target {id}"),
    }
}

/// Precondition: interpolated positions at the reception epochs equal Horizons' direct ones
/// within 10 m.
fn check_interpolation(table: &De441Table) {
    let mut worst = 0.0_f64;
    let mut n = 0;
    for c in fixture_lines("horizons_barycentric_at_epochs.csv") {
        let id: usize = c[0].parse().expect("id");
        let jd = num(&c[1]);
        let direct = [num(&c[2]) * 1e3, num(&c[3]) * 1e3, num(&c[4]) * 1e3];
        let p = table.position(id, jd);
        let d =
            ((p[0] - direct[0]).powi(2) + (p[1] - direct[1]).powi(2) + (p[2] - direct[2]).powi(2))
                .sqrt();
        worst = worst.max(d);
        n += 1;
    }
    println!("interpolation precondition: {n} positions, worst {worst:.3e} m (limit {INTERP_PRECONDITION_M} m)");
    assert_eq!(n, 8 * EPOCHS, "direct positions at every reception epoch");
    assert!(
        worst <= INTERP_PRECONDITION_M,
        "interpolation precondition fails ({worst:.3e} m): comparison void"
    );
}

#[test]
#[ignore = "pre-registered; not yet run"]
fn light_time_solver_on_de441_positions_matches_horizons_lt_within_1e_6_s() {
    let table = De441Table::load();
    check_interpolation(&table);
    let center = ssb();
    let mut per: HashMap<usize, (f64, f64, usize)> = HashMap::new();
    for c in fixture_lines("horizons_light_time.csv") {
        let id: usize = c[0].parse().expect("id");
        let jd = num(&c[1]);
        let lt = num(&c[2]);
        let out = link_on(&table, &center, &target(id), &Body::earth(), jd).expect("link");
        let d = out.one_way_light_time_s - lt;
        let e = per.entry(id).or_insert((0.0, 0.0, 0));
        e.0 += d * d;
        e.1 = e.1.max(d.abs());
        e.2 += 1;
    }
    let mut failures = Vec::new();
    for id in [1, 2, 4, 5, 6, 10, 301] {
        let (s, max, n) = per[&id];
        assert_eq!(n, EPOCHS, "{id}: pre-registered epoch count");
        let rms = (s / n as f64).sqrt();
        println!(
            "{:<8} n={n} RMS dtau {rms:.3e} s, max |dtau| {max:.3e} s, max/bar {:.3}",
            target(id).name,
            max / TOL_S
        );
        if max > TOL_S {
            failures.push(format!(
                "{}: max |dtau| {max:.3e} s > {TOL_S:.0e} s",
                target(id).name
            ));
        }
    }
    assert!(failures.is_empty(), "{failures:#?}");
}
