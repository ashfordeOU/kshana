// SPDX-License-Identifier: AGPL-3.0-only
//! Library comparison for the computed orientation of the solar-system bodies
//! (`body::Body::iau_rotation_et`) against the NAIF SPICE Toolkit.
//!
//! ## Pre-registration (written 2026-10-02, before the fixture was generated or SPICE was run)
//!
//! * Quantity: the rotation matrix from the J2000 (International Celestial Reference Frame
//!   axes) frame to the body's International Astronomical Union (IAU) body-fixed frame, as
//!   Kshana computes it from its own constants (`Body::iau_rotation_et`, the 3-1-3 sequence
//!   `R_z(W) R_x(90 deg - dec) R_z(90 deg + ra)` with the pole and prime meridian evaluated at
//!   the epoch, including every century rate, quadratic term and periodic term the body carries).
//!   This is a computed quantity, not a transcription of a constant: an omitted rate, an omitted
//!   periodic term, a wrong phase angle, a wrong time argument or a wrong rotation order all move
//!   the matrix.
//! * Oracle (kind: Library): the NAIF SPICE Toolkit (CSPICE N0067 through spiceypy 8.2.0, MIT
//!   licence for spiceypy; the toolkit is public NASA/JPL software), `pxform('J2000',
//!   'IAU_<BODY>', et)`, which evaluates the orientation model of the NAIF generic kernel
//!   `pck00011.tpc` (IAU Working Group on Cartographic Coordinates and Rotational Elements, 2015
//!   report, with the NAIF corrections the kernel documents). Run by the committed generator
//!   `tests/fixtures/body_orientation_spice_oracle/generate_body_orientation_spice_oracle.py`,
//!   which calls no Kshana code; its output is committed beside it with the kernel hashes.
//! * Inputs: 41 epochs `et_k = (k - 20) x 70 000 000.5 s` past J2000 in Barycentric Dynamical
//!   Time (TDB), k = 0..40 (about 1955 to 2044); the same `et` is handed to both sides.
//! * Bodies in the verdict: the fourteen this row adds (Mercury, Venus, Jupiter, Saturn, Uranus,
//!   Neptune, Pluto, Phobos, Deimos, Io, Europa, Ganymede, Callisto, Titan). Sun, Earth, Moon and
//!   Mars carry conventional constants owned by other rows and are reported for information only.
//! * Metric: the angle of `R_K R_S^T`, computed as `2 asin(|R_K - R_S|_F / (2 sqrt 2))`.
//! * Tolerance: **1e-9 rad at every epoch for every one of the fourteen bodies** (574 matrices).
//!   Source: the double-precision rounding of the largest rotation argument in the set. Phobos's
//!   prime meridian reaches about 1.8e7 deg (3.2e5 rad) at |d| = 16 204 days, where one unit in
//!   the last place is 5.8e-11 rad; two independent evaluations, each with a handful of
//!   roundings, can differ by a few of those, and 1e-9 rad leaves a factor of about five above
//!   that. Any modelling difference (a missing periodic term of Phobos's prime meridian is
//!   1.1 deg) is larger by many orders of magnitude.
//! * The constants half of the row (GM against `gm_de440.tpc`, equatorial radius against
//!   `pck00011.tpc` RADII\[0\], pole and prime-meridian constants) is re-run, unchanged, by the
//!   round-1 pre-registered test `tests/body_constants_naif_oracle.rs`.
//! * PROMOTE only if every one of the 574 matrices is within tolerance and the round-1
//!   constants test passes.

use kshana::body::Body;

const ADDED: [&str; 14] = [
    "Mercury", "Venus", "Jupiter", "Saturn", "Uranus", "Neptune", "Pluto", "Phobos", "Deimos",
    "Io", "Europa", "Ganymede", "Callisto", "Titan",
];

const TOL_RAD: f64 = 1.0e-9;

fn fixture() -> String {
    let p = concat!(
        env!("CARGO_MANIFEST_DIR"),
        "/tests/fixtures/body_orientation_spice_oracle/spice_orientation.csv"
    );
    std::fs::read_to_string(p).unwrap_or_else(|e| panic!("read {p}: {e}"))
}

/// (body, et, SPICE matrix) rows of the fixture.
fn rows() -> Vec<(String, f64, [[f64; 3]; 3])> {
    fixture()
        .lines()
        .filter(|l| !l.starts_with('#') && !l.trim().is_empty())
        .map(|l| {
            let f: Vec<&str> = l.split(',').collect();
            assert_eq!(f.len(), 12, "malformed row: {l}");
            let v = |i: usize| f[i].parse::<f64>().expect("number");
            let mut m = [[0.0; 3]; 3];
            for (i, row) in m.iter_mut().enumerate() {
                for (j, e) in row.iter_mut().enumerate() {
                    *e = v(3 + 3 * i + j);
                }
            }
            (f[0].to_string(), v(2), m)
        })
        .collect()
}

/// Rotation angle between two rotation matrices (rad).
fn angle(a: &[[f64; 3]; 3], b: &[[f64; 3]; 3]) -> f64 {
    let mut s = 0.0;
    for i in 0..3 {
        for j in 0..3 {
            let d = a[i][j] - b[i][j];
            s += d * d;
        }
    }
    2.0 * (s.sqrt() / (2.0 * std::f64::consts::SQRT_2)).min(1.0).asin()
}

/// Per body: (largest angle, epochs within tolerance, epochs).
fn compare() -> Vec<(String, f64, usize, usize)> {
    let mut out: Vec<(String, f64, usize, usize)> = Vec::new();
    for (name, et, m_s) in rows() {
        let b = Body::by_name(&name).unwrap_or_else(|| panic!("{name} is not a Kshana body"));
        let m_k = b.iau_rotation_et(et);
        let a = angle(&m_k, &m_s);
        if out.last().map(|r| r.0 != name).unwrap_or(true) {
            out.push((name.clone(), 0.0, 0, 0));
        }
        let r = out.last_mut().unwrap();
        r.1 = r.1.max(a);
        r.2 += usize::from(a <= TOL_RAD);
        r.3 += 1;
    }
    for (n, worst, ok, all) in &out {
        let tag = if ADDED.contains(&n.as_str()) {
            "verdict"
        } else {
            "information"
        };
        eprintln!("M109 orientation {n:9} ({tag}): worst {worst:.3e} rad, {ok}/{all} within 1e-9 rad");
    }
    out
}

/// The pre-registered comparison: every matrix of the fourteen added bodies within 1e-9 rad.
#[test]
#[ignore = "pre-registered; not yet run"]
fn orientation_matches_spice_pxform_for_the_fourteen_added_bodies() {
    let res = compare();
    let verdict: Vec<_> = res
        .iter()
        .filter(|r| ADDED.contains(&r.0.as_str()))
        .collect();
    assert_eq!(verdict.len(), 14, "every added body is in the fixture");
    let n: usize = verdict.iter().map(|r| r.3).sum();
    assert_eq!(n, 14 * 41, "41 epochs per body");
    for (name, worst, ok, all) in verdict {
        assert_eq!(
            ok, all,
            "{name}: {} of {all} epochs outside 1e-9 rad (worst {worst:.3e} rad)",
            all - ok
        );
    }
}
