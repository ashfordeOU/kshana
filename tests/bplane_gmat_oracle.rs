// SPDX-License-Identifier: AGPL-3.0-only
//! External-library oracle for B-plane targeting and the patched-conic flyby geometry
//! (`kshana::bplane`, verification row "B-plane targeting & patched-conic gravity assist").
//!
//! Pre-registration (validation 0.30, round 2, batch "tools"; written 2026-10-01 before the
//! fixture was generated and before the General Mission Analysis Tool was run on any state).
//!
//! Quantity: for a hyperbolic Earth-centred Cartesian state `(r, v)`, the B-plane components
//! `B·T̂` and `B·R̂` and the magnitude `|B|` (km), with `T̂` in the xy-plane of the
//! Earth mean-equator J2000 frame (`T̂ = Ŝ × ẑ / |Ŝ × ẑ|`, `R̂ = Ŝ × T̂`); the incoming
//! asymptote direction `Ŝ`; the turn angle `δ = 2·asin(1/e)`; and the outgoing asymptote
//! (the engine deflects `Ŝ` by `δ` about the orbit normal with `bplane::deflect`, the
//! patched-conic gravity-assist step). Kshana computes all of these with
//! `bplane::flyby_from_state`, which uses the row's closed forms (`hyperbolic_sma`,
//! `flyby_eccentricity`, `impact_parameter`, `turn_angle`, `bplane_frame`,
//! `bplane_components`, `deflect`).
//!
//! Inputs: a grid of 192 hyperbolic states: hyperbolic-excess speed v∞ in
//! {0.5, 2, 5, 12} km/s, periapsis radius in {6578, 12000, 45000} km, four orientations
//! (inclination, right ascension of the ascending node, argument of periapsis) and four
//! positions on the hyperbola (true anomaly at -0.9, -0.5, 0 and +0.4 of the asymptotic
//! true anomaly, so inbound, periapsis and outbound states). The generator
//! `tests/fixtures/bplane_gmat_oracle/make_fixture.py` prints each state once with 17
//! significant digits; the General Mission Analysis Tool and this test read the identical
//! decimal strings. Gravitational parameter 398600.4415 km³/s², set explicitly on both
//! sides (`Earth.Mu` in the script).
//!
//! Oracle (Library): NASA General Mission Analysis Tool (GMAT) R2026a, Apache-2.0,
//! https://sourceforge.net/projects/gmat/, run headless (`GmatConsole`) as a separate
//! program. Its `BdotT`, `BdotR`, `BVectorMag` (Kizner's method, GMAT Mathematical
//! Specification R2026a section 3.2.7) and the `IncomingRHA`/`IncomingDHA`,
//! `OutgoingRHA`/`OutgoingDHA` asymptote directions in `EarthMJ2000Eq`, reported with 16
//! significant digits. Only its printed numbers are committed.
//!
//! Tolerances (from the 0.30 validation plan row for M060, unchanged; the asymptote-direction
//! checks are added here before the run, at the turn-angle bar):
//! - `|B·T̂ − BdotT| ≤ 1e-6 km`, `|B·R̂ − BdotR| ≤ 1e-6 km` and `||B| − BVectorMag| ≤ 1e-6 km`
//!   on every state;
//! - turn angle: `|δ − ∠(GMAT incoming, GMAT outgoing asymptote)| ≤ 1e-9 rad` on every state;
//! - incoming and outgoing asymptote directions: the angle between Kshana's and GMAT's unit
//!   vectors `≤ 1e-9 rad` on every state;
//! - all 192 states reported by GMAT, none non-finite.
//!
//! Discrimination check, pre-registered: flipping the sign of the `√(1 − 1/e²)` term in the
//! engine's incoming asymptote (`Ŝ = ê/e − …`, which yields the outgoing asymptote instead)
//! must turn this test red.

use kshana::bplane::flyby_from_state;
use std::path::PathBuf;

const MU_KM: f64 = 398_600.441_5;
const TOL_B_KM: f64 = 1e-6;
const TOL_ANGLE_RAD: f64 = 1e-9;
const N_STATES: usize = 192;

fn fixture(name: &str) -> String {
    let p = PathBuf::from(env!("CARGO_MANIFEST_DIR"))
        .join("tests/fixtures/bplane_gmat_oracle")
        .join(name);
    std::fs::read_to_string(&p).unwrap_or_else(|e| panic!("{}: {e}", p.display()))
}

fn radec_unit(ra_deg: f64, dec_deg: f64) -> [f64; 3] {
    let (ra, dec) = (ra_deg.to_radians(), dec_deg.to_radians());
    [dec.cos() * ra.cos(), dec.cos() * ra.sin(), dec.sin()]
}

/// Angle between two vectors, by atan2 of the cross and dot products (well conditioned near
/// 0 and π).
fn angle(a: [f64; 3], b: [f64; 3]) -> f64 {
    let c = [
        a[1] * b[2] - a[2] * b[1],
        a[2] * b[0] - a[0] * b[2],
        a[0] * b[1] - a[1] * b[0],
    ];
    let cn = (c[0] * c[0] + c[1] * c[1] + c[2] * c[2]).sqrt();
    let d = a[0] * b[0] + a[1] * b[1] + a[2] * b[2];
    cn.atan2(d)
}

fn numbers(line: &str) -> Vec<f64> {
    line.split_whitespace()
        .map(|t| t.parse().unwrap_or_else(|_| panic!("number: {t}")))
        .collect()
}

#[test]
#[ignore = "pre-registered; not yet run"]
fn bplane_matches_gmat_over_a_hyperbolic_grid() {
    let states: Vec<Vec<f64>> = fixture("states.txt")
        .lines()
        .filter(|l| !l.starts_with('#') && !l.trim().is_empty())
        .map(numbers)
        .collect();
    let gmat: Vec<Vec<f64>> = fixture("gmat_bplane_report.txt")
        .lines()
        .filter(|l| {
            let t = l.trim_start();
            !t.is_empty() && (t.starts_with('-') || t.as_bytes()[0].is_ascii_digit())
        })
        .map(numbers)
        .collect();
    assert_eq!(states.len(), N_STATES, "state count");
    assert_eq!(gmat.len(), N_STATES, "GMAT reported every state");

    let (mut w_bt, mut w_br, mut w_bm, mut w_d, mut w_in, mut w_out) =
        (0.0f64, 0.0f64, 0.0f64, 0.0f64, 0.0f64, 0.0f64);
    for (s, g) in states.iter().zip(&gmat) {
        // states.txt: id x y z vx vy vz (km, km/s)
        // report:     id BdotT BdotR BVectorMag InRHA InDHA OutRHA OutDHA
        assert_eq!(s.len(), 7);
        assert_eq!(g.len(), 8);
        assert_eq!(s[0], g[0], "row order");
        assert!(g.iter().all(|x| x.is_finite()), "GMAT non-finite: {g:?}");
        let f = flyby_from_state(
            [s[1], s[2], s[3]],
            [s[4], s[5], s[6]],
            MU_KM,
            [0.0, 0.0, 1.0],
        )
        .expect("hyperbolic state");
        let g_in = radec_unit(g[4], g[5]);
        let g_out = radec_unit(g[6], g[7]);
        let d_bt = (f.b_dot_t - g[1]).abs();
        let d_br = (f.b_dot_r - g[2]).abs();
        let d_bm = (f.b_mag - g[3]).abs();
        let d_turn = (f.turn_angle - angle(g_in, g_out)).abs();
        let d_in = angle(f.s_in, g_in);
        let d_out = angle(f.s_out, g_out);
        w_bt = w_bt.max(d_bt);
        w_br = w_br.max(d_br);
        w_bm = w_bm.max(d_bm);
        w_d = w_d.max(d_turn);
        w_in = w_in.max(d_in);
        w_out = w_out.max(d_out);
        let id = s[0];
        assert!(
            d_bt <= TOL_B_KM,
            "state {id}: B·T {} vs {}",
            f.b_dot_t,
            g[1]
        );
        assert!(
            d_br <= TOL_B_KM,
            "state {id}: B·R {} vs {}",
            f.b_dot_r,
            g[2]
        );
        assert!(d_bm <= TOL_B_KM, "state {id}: |B| {} vs {}", f.b_mag, g[3]);
        assert!(
            d_turn <= TOL_ANGLE_RAD,
            "state {id}: turn angle off by {d_turn}"
        );
        assert!(
            d_in <= TOL_ANGLE_RAD,
            "state {id}: incoming asymptote off by {d_in}"
        );
        assert!(
            d_out <= TOL_ANGLE_RAD,
            "state {id}: outgoing asymptote off by {d_out}"
        );
    }
    println!(
        "worst: B.T {w_bt:.3e} km, B.R {w_br:.3e} km, |B| {w_bm:.3e} km, turn {w_d:.3e} rad, \
         incoming {w_in:.3e} rad, outgoing {w_out:.3e} rad"
    );
}
