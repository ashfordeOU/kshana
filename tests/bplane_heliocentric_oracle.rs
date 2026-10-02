// SPDX-License-Identifier: AGPL-3.0-only
//! External oracles for the heliocentric half of the verification row "B-plane targeting &
//! patched-conic gravity assist": the heliocentric velocity change of the assist
//! (`bplane::assist_delta_v`), the heliocentric osculating elements (`bplane::elements_aei`)
//! and the Tisserand parameter (`bplane::tisserand`). The B-plane, turn-angle and asymptote
//! half is compared with the General Mission Analysis Tool in `tests/bplane_gmat_oracle.rs`.
//!
//! Why a new comparison: an adversarial verifier showed that `tests/bplane_gmat_oracle.rs`
//! never touches `tisserand` or `elements_aei` (a mutant changing the Tisserand coefficient 2
//! to 3 left it green) and checks the assist velocity change only indirectly. This file adds
//! those parts of the row's claim; the earlier test and its tolerances are unchanged.
//!
//! Pre-registration (validation 0.30, round 2, batch "tools", repair; written 2026-10-02
//! before any fixture below was generated, before the General Mission Analysis Tool or sbpy
//! was run on any of these inputs, and before Kshana computed any Tisserand value for the
//! published objects). Disclosed: the published table in part C (the oracle itself) was read
//! while choosing it; no comparison was made.
//!
//! ## A. Assist velocity change, against the General Mission Analysis Tool
//!
//! Inputs: the 192 hyperbolic Earth-centred states of `tests/fixtures/bplane_gmat_oracle/
//! states.txt` (read from that file, unchanged). Kshana: `flyby_from_state` gives `v∞`, `Ŝ`
//! and the outgoing asymptote; `assist_delta_v(v∞·Ŝ, v∞·Ŝ_out)`. Oracle: the General Mission
//! Analysis Tool (GMAT) R2026a, Apache-2.0, run headless as a separate program, reports
//! `C3Energy` and the incoming and outgoing asymptote right ascension and declination for the
//! same states (`gmat_planetocentric_report.txt`); its velocity change is
//! `√C3·(û_out − (−û_in,GMAT))`, with GMAT's incoming direction pointing out along the
//! inbound branch (`−Ŝ`, amendment 1 of the earlier test).
//! Tolerances: `|v∞ − √C3| ≤ 1e-9·v∞` and `|Δv_Kshana − Δv_GMAT| ≤ 1e-9·v∞` (vector norm) on
//! every state.
//!
//! ## B. Heliocentric elements and the Tisserand parameter, against GMAT and sbpy
//!
//! Inputs (generator `tests/fixtures/bplane_heliocentric_oracle/make_fixture.py`, independent
//! of the engine): for each planetocentric state `k` of part A the generator rebuilds, in
//! numpy, the arrival direction `Ŝ` and the departure direction of the same hyperbola from its
//! elements, and places the encounter at a planet on a circular orbit in the ecliptic of the
//! Sun-centred mean-ecliptic J2000 frame: radius `a_P`, longitude `L_k = k·137.507764° mod
//! 360°`, velocity `v_c = √(μ_☉/a_P)` along the orbit. The planet is taken from Mercury,
//! Venus, Earth, Mars, Jupiter (`a_P` = 0.38709927, 0.72333566, 1.00000261, 1.52371034,
//! 5.20288700 au; 1 au = 149 597 870.7 km) as entry `k mod n` of those with
//! `v∞ ≤ 0.27·v_c` (so both heliocentric arcs stay bound). The two heliocentric states are
//! `(r_P, v_P + v∞·Ŝ)` (before) and `(r_P, v_P + v∞·Ŝ_out)` (after). The generator drops a
//! state whose inclination, from its own vectors, is below 1e-2 rad or above π − 1e-2 rad
//! (the arccosine is ill-conditioned there); it prints the number dropped. Each state is
//! written once with 17 significant digits (`helio_states.txt`), and both sides read the same
//! decimal strings. `μ_☉ = 132 712 440 041.939 38 km³/s²` (DE440), set explicitly as
//! `Sun.Mu` in the script.
//!
//! Oracles: (1) GMAT R2026a reports `SMA`, `ECC` (origin Sun) and `INC` (axes MJ2000Ec) for
//! every heliocentric state (`gmat_helio_report.txt`, 16 significant digits). (2) sbpy 0.6.0
//! (BSD-3-Clause, https://github.com/NASA-Planetary-Science/sbpy), `sbpy.data.Orbit.tisserand`
//! with the planet passed as an `Orbit` of semi-major axis `a_P`, computes the Tisserand
//! parameter from GMAT's `SMA`, `ECC` and `INC` (`sbpy_tisserand.txt`), in a separate Python
//! process. Kshana: `elements_aei(r, v, μ_☉)` and `tisserand(a, e, i, a_P)` from the same state.
//! Tolerances, on every heliocentric state:
//! - `|a − SMA| ≤ 1e-9·SMA`, `|e − ECC| ≤ 1e-9·ECC`, `|i − INC| ≤ 1e-12 rad`;
//! - `|T_Kshana − T_sbpy| ≤ 1e-9`;
//! - the closed-form link with the oracle's speed: `|T_Kshana − (3 − C3/v_c²)| ≤ 1e-9`, with
//!   `C3` from GMAT for the planetocentric state `k` (exact for a circular planet orbit at the
//!   encounter radius).
//! Preconditions: all 384 − (dropped) states reported by GMAT and sbpy, all finite, every
//! GMAT `SMA` positive.
//!
//! ## C. The Tisserand closed form, against published values
//!
//! Oracle (Reference, published): T. Kasuga and D. Jewitt, "Asteroid-Meteoroid Complexes",
//! chapter 8 of *Meteoroids: Sources of Meteors on Earth and Beyond* (Cambridge University
//! Press, 2019), arXiv:2010.16079, Table 8.1, which prints for twelve objects the semi-major
//! axis `a` (au, 3 decimals), eccentricity `e` (3 decimals), inclination `i` (deg, 3 decimals)
//! and `T_J` (3 decimals), with `T_J` defined by its equation (8.3) for `a_J = 5.2 au`.
//! Kshana: `tisserand(a, e, i, 5.2)` from the printed `a`, `e`, `i`. Tolerance per object: the
//! printed `T_J`'s half unit (5e-4) plus the worst-case linear propagation of the printed
//! inputs' half units (5e-4 au, 5e-4, 5e-4 deg) through the analytic partial derivatives of
//! equation (8.3) written in this file (`rounding_bound`), evaluated at the printed values.
//!
//! ## Discrimination checks, pre-registered
//! - The verifier's mutant: the Tisserand coefficient 2 → 3 in `bplane::tisserand` must turn
//!   parts B and C red.
//! - Vis-viva mutant: `2.0 / rm` → `1.9 / rm` in `bplane::elements_aei` must turn part B red.
//! - Assist mutant: `assist_delta_v` returning `v_inf_in − v_inf_out` must turn part A red.
//!
//! The strict tests below are ignored until the fixture exists and the comparison has run.

use kshana::bplane::{assist_delta_v, elements_aei, flyby_from_state, tisserand};
use std::path::PathBuf;

const MU_EARTH_KM: f64 = 398_600.441_5;
const MU_SUN_KM: f64 = 132_712_440_041.939_38;
const N_PLANETOCENTRIC: usize = 192;
const TOL_REL: f64 = 1e-9;
const TOL_INC_RAD: f64 = 1e-12;
const TOL_T: f64 = 1e-9;
const MIN_INC_RAD: f64 = 1e-2;

fn read(dir: &str, name: &str) -> String {
    let p = PathBuf::from(env!("CARGO_MANIFEST_DIR"))
        .join("tests/fixtures")
        .join(dir)
        .join(name);
    std::fs::read_to_string(&p).unwrap_or_else(|e| panic!("{}: {e}", p.display()))
}

fn rows(text: &str) -> Vec<Vec<f64>> {
    text.lines()
        .filter(|l| {
            let t = l.trim_start();
            !t.is_empty() && !t.starts_with('#') && !t.starts_with('%')
        })
        .map(|l| {
            l.split_whitespace()
                .map(|t| t.parse().unwrap_or_else(|_| panic!("number: {t}")))
                .collect()
        })
        .collect()
}

fn radec_unit(ra_deg: f64, dec_deg: f64) -> [f64; 3] {
    let (ra, dec) = (ra_deg.to_radians(), dec_deg.to_radians());
    [dec.cos() * ra.cos(), dec.cos() * ra.sin(), dec.sin()]
}

fn norm(a: [f64; 3]) -> f64 {
    (a[0] * a[0] + a[1] * a[1] + a[2] * a[2]).sqrt()
}

/// GMAT's C3 per planetocentric state id (1-based), from `gmat_planetocentric_report.txt`:
/// `id C3Energy IncomingRHA IncomingDHA OutgoingRHA OutgoingDHA`.
fn gmat_planetocentric() -> Vec<Vec<f64>> {
    let g = rows(&read(
        "bplane_heliocentric_oracle",
        "gmat_planetocentric_report.txt",
    ));
    assert_eq!(g.len(), N_PLANETOCENTRIC, "GMAT reported every state");
    for (k, r) in g.iter().enumerate() {
        assert_eq!(r.len(), 6);
        assert_eq!(r[0] as usize, k + 1, "row order");
        assert!(r.iter().all(|x| x.is_finite()), "GMAT non-finite: {r:?}");
    }
    g
}

#[test]
#[ignore = "pre-registered; not yet run"]
fn assist_delta_v_matches_gmat_asymptotes_and_c3() {
    let states = rows(&read("bplane_gmat_oracle", "states.txt"));
    assert_eq!(states.len(), N_PLANETOCENTRIC);
    let g = gmat_planetocentric();
    let (mut w_v, mut w_dv) = (0.0f64, 0.0f64);
    for (s, g) in states.iter().zip(&g) {
        assert_eq!(s[0], g[0], "row order");
        let f = flyby_from_state(
            [s[1], s[2], s[3]],
            [s[4], s[5], s[6]],
            MU_EARTH_KM,
            [0.0, 0.0, 1.0],
        )
        .expect("hyperbolic state");
        let v = f.v_inf;
        let vin = [v * f.s_in[0], v * f.s_in[1], v * f.s_in[2]];
        let vout = [v * f.s_out[0], v * f.s_out[1], v * f.s_out[2]];
        let dv = assist_delta_v(vin, vout);
        let vg = g[1].sqrt();
        let u_in_branch = radec_unit(g[2], g[3]); // GMAT: −Ŝ
        let u_out = radec_unit(g[4], g[5]);
        let dv_g = [
            vg * (u_out[0] + u_in_branch[0]),
            vg * (u_out[1] + u_in_branch[1]),
            vg * (u_out[2] + u_in_branch[2]),
        ];
        let d_v = (v - vg).abs() / v;
        let d_dv = norm([dv[0] - dv_g[0], dv[1] - dv_g[1], dv[2] - dv_g[2]]) / v;
        w_v = w_v.max(d_v);
        w_dv = w_dv.max(d_dv);
        assert!(d_v <= TOL_REL, "state {}: v∞ {v} vs √C3 {vg}", s[0]);
        assert!(
            d_dv <= TOL_REL,
            "state {}: Δv {dv:?} vs GMAT {dv_g:?}",
            s[0]
        );
    }
    println!("worst: v∞ {w_v:.3e} relative, Δv {w_dv:.3e} relative to v∞");
}

#[test]
#[ignore = "pre-registered; not yet run"]
fn heliocentric_elements_and_tisserand_match_gmat_and_sbpy() {
    let c3 = gmat_planetocentric();
    // helio_states.txt: id k branch planet a_P_km X Y Z VX VY VZ (km, km/s), SunMJ2000Ec
    let states = rows(&read("bplane_heliocentric_oracle", "helio_states.txt"));
    // gmat_helio_report.txt: id SMA ECC INC(deg)
    let gmat = rows(&read("bplane_heliocentric_oracle", "gmat_helio_report.txt"));
    // sbpy_tisserand.txt: id T
    let sbpy = rows(&read("bplane_heliocentric_oracle", "sbpy_tisserand.txt"));
    assert!(states.len() > 2 * N_PLANETOCENTRIC - 40, "too many dropped");
    assert_eq!(gmat.len(), states.len(), "GMAT reported every state");
    assert_eq!(sbpy.len(), states.len(), "sbpy reported every state");
    let (mut w_a, mut w_e, mut w_i, mut w_ts, mut w_tl) = (0.0f64, 0.0f64, 0.0f64, 0.0f64, 0.0f64);
    for ((s, g), t) in states.iter().zip(&gmat).zip(&sbpy) {
        assert_eq!(s.len(), 11);
        assert_eq!(g.len(), 4);
        assert_eq!(t.len(), 2);
        assert!(s[0] == g[0] && s[0] == t[0], "row order");
        assert!(
            g.iter().chain(t).all(|x| x.is_finite()),
            "non-finite oracle"
        );
        assert!(g[1] > 0.0, "state {}: GMAT SMA not bound", s[0]);
        let a_p = s[4];
        let (a, e, i) = elements_aei([s[5], s[6], s[7]], [s[8], s[9], s[10]], MU_SUN_KM);
        let inc = g[3].to_radians();
        assert!(
            (MIN_INC_RAD..=std::f64::consts::PI - MIN_INC_RAD).contains(&inc),
            "state {}: input precondition (inclination) violated",
            s[0]
        );
        let tk = tisserand(a, e, i, a_p);
        let k = s[1] as usize;
        let vc2 = MU_SUN_KM / a_p;
        let t_link = 3.0 - c3[k - 1][1] / vc2;
        let (d_a, d_e, d_i) = (
            (a - g[1]).abs() / g[1],
            (e - g[2]).abs() / g[2],
            (i - inc).abs(),
        );
        let (d_ts, d_tl) = ((tk - t[1]).abs(), (tk - t_link).abs());
        w_a = w_a.max(d_a);
        w_e = w_e.max(d_e);
        w_i = w_i.max(d_i);
        w_ts = w_ts.max(d_ts);
        w_tl = w_tl.max(d_tl);
        let id = s[0];
        assert!(d_a <= TOL_REL, "state {id}: a {a} vs SMA {}", g[1]);
        assert!(d_e <= TOL_REL, "state {id}: e {e} vs ECC {}", g[2]);
        assert!(d_i <= TOL_INC_RAD, "state {id}: i {i} vs INC {inc}");
        assert!(d_ts <= TOL_T, "state {id}: T {tk} vs sbpy {}", t[1]);
        assert!(d_tl <= TOL_T, "state {id}: T {tk} vs 3 − C3/v_c² {t_link}");
    }
    println!(
        "{} states; worst: a {w_a:.3e} rel, e {w_e:.3e} rel, i {w_i:.3e} rad, T vs sbpy \
         {w_ts:.3e}, T vs 3 − C3/v_c² {w_tl:.3e}",
        states.len()
    );
}

/// Kasuga & Jewitt (2019), Table 8.1: object, a (au), e, i (deg), T_J.
const KASUGA_JEWITT_2019: [(&str, f64, f64, f64, f64); 12] = [
    ("Phaethon", 1.271, 0.890, 22.253, 4.509),
    ("2005 UD", 1.275, 0.872, 28.682, 4.504),
    ("1999 YC", 1.422, 0.831, 38.226, 4.114),
    ("2003 EH1", 3.123, 0.619, 70.838, 2.065),
    ("96P/Machholz 1", 3.018, 0.959, 59.975, 1.939),
    ("169P/NEAT", 2.604, 0.767, 11.304, 2.887),
    ("P/2003 T12", 2.568, 0.776, 11.475, 2.894),
    ("2017 MB1", 2.372, 0.753, 8.508, 3.071),
    ("2P/Encke", 2.215, 0.848, 11.781, 3.025),
    ("1566 Icarus", 1.078, 0.827, 22.852, 5.296),
    ("2007 MK6", 1.081, 0.819, 25.138, 5.284),
    ("2003 WY25", 3.046, 0.685, 5.9000, 2.816),
];
const A_J_AU: f64 = 5.2;

/// Worst-case linear propagation of the printed inputs' half units through equation (8.3),
/// `T = a_J/a + 2·cos i·√((1 − e²)·a/a_J)`, plus the printed `T_J`'s half unit.
fn rounding_bound(a: f64, e: f64, i_deg: f64) -> f64 {
    let (da, de, di) = (5e-4, 5e-4, 5e-4f64.to_radians());
    let i = i_deg.to_radians();
    let q = ((1.0 - e * e) * a / A_J_AU).sqrt();
    let dt_da = -A_J_AU / (a * a) + i.cos() * q / a;
    let dt_de = -2.0 * i.cos() * e * a / (A_J_AU * q);
    let dt_di = -2.0 * i.sin() * q;
    5e-4 + dt_da.abs() * da + dt_de.abs() * de + dt_di.abs() * di
}

#[test]
#[ignore = "pre-registered; not yet run"]
fn tisserand_matches_kasuga_jewitt_2019_table_8_1() {
    let mut worst = 0.0f64;
    for (name, a, e, i_deg, t_pub) in KASUGA_JEWITT_2019 {
        let t = tisserand(a, e, i_deg.to_radians(), A_J_AU);
        let bound = rounding_bound(a, e, i_deg);
        let d = (t - t_pub).abs();
        worst = worst.max(d / bound);
        println!("{name}: T {t:.6} vs {t_pub} (|d| {d:.2e}, bound {bound:.2e})");
        assert!(
            d <= bound,
            "{name}: T {t} vs published {t_pub}, bound {bound}"
        );
    }
    println!("worst |d|/bound {worst:.3}");
}
