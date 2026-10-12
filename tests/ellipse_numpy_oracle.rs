// SPDX-License-Identifier: AGPL-3.0-only
//! The horizontal error ellipse and the per-system cofactor against numpy, as pre-registered in
//! `xval/numpy-ellipse/PREREGISTRATION.md` (inputs, quantities, tolerances and decision rule
//! committed before the oracle was run). numpy inverts `GᵀG` and eigen-decomposes the
//! horizontal block on the committed visible sets of `tests/fixtures/skyline_orekit_oracle/`;
//! Kshana computes the same with `geometry::sky_geometry` from its own look angles. Pre-registered
//! in 0bbeeaee. Result: 270 cases pass; worst axis 5.1e-13 relative, orientation 5.3e-12 deg,
//! cofactor 1.0e-12 of the matrix scale.

use kshana::frames::{look_angles, Geodetic};
use kshana::geometry::{sky_geometry, ClockModel, SatelliteInput, SkyRequest};
use std::collections::BTreeMap;
use std::path::{Path, PathBuf};

const SIGMA_UERE_M: f64 = 1.5;
const CONFIDENCE: f64 = 0.95;
const TOL_WELL: f64 = 1e-9;
const TOL_ILL: f64 = 1e-6;
const PDOP_SPLIT: f64 = 20.0;
const TOL_ORIENT_DEG: f64 = 1e-6;
const MIN_GAP_REL: f64 = 1e-6;
const MASK_DEG: f64 = 5.0;

fn dir() -> PathBuf {
    Path::new(env!("CARGO_MANIFEST_DIR")).join("tests/fixtures/skyline_orekit_oracle")
}

fn rows(p: &Path) -> Vec<Vec<String>> {
    std::fs::read_to_string(p)
        .unwrap_or_else(|e| panic!("{}: {e}", p.display()))
        .lines()
        .skip(1)
        .filter(|l| !l.trim().is_empty())
        .map(|l| l.split(',').map(str::to_string).collect())
        .collect()
}

fn f(s: &str) -> f64 {
    s.parse().unwrap_or_else(|e| panic!("{s}: {e}"))
}

#[test]
fn ellipse_and_cofactor_agree_with_numpy_as_pre_registered() {
    let numpy = dir().join("outputs/numpy_ellipse.csv");
    // The output is committed: a missing file is a failure, never a skip.
    assert!(numpy.exists(), "the committed numpy output is missing");
    let d = dir().join("inputs");
    let sites: BTreeMap<String, Geodetic> = rows(&d.join("sites.csv"))
        .into_iter()
        .map(|r| {
            (
                r[0].clone(),
                Geodetic {
                    lat_rad: f(&r[1]).to_radians(),
                    lon_rad: f(&r[2]).to_radians(),
                    alt_m: f(&r[3]),
                },
            )
        })
        .collect();
    let mut sats: BTreeMap<(String, String), [f64; 3]> = BTreeMap::new();
    for r in rows(&d.join("sats.csv")) {
        sats.insert((r[0].clone(), r[1].clone()), [f(&r[2]), f(&r[3]), f(&r[4])]);
    }
    // The visible sets, in Orekit's row order (the order numpy used).
    let orekit = rows(&dir().join("outputs/orekit.csv"));
    let header: Vec<String> = std::fs::read_to_string(dir().join("outputs/orekit.csv"))
        .unwrap()
        .lines()
        .next()
        .unwrap()
        .split(',')
        .map(str::to_string)
        .collect();
    let masks: Vec<String> = header[5..]
        .iter()
        .map(|h| h.trim_start_matches("cut_").to_string())
        .collect();
    let mut sets: BTreeMap<(String, String, String), Vec<String>> = BTreeMap::new();
    for r in &orekit {
        for (k, m) in masks.iter().enumerate() {
            if f(&r[4]) >= MASK_DEG.max(f(&r[5 + k])) {
                sets.entry((r[0].clone(), r[1].clone(), m.clone()))
                    .or_default()
                    .push(r[2].clone());
            }
        }
    }
    let (mut n, mut near_circle, mut worst_axis, mut worst_orient, mut worst_q) =
        (0usize, 0usize, 0.0_f64, 0.0_f64, 0.0_f64);
    for r in rows(&numpy) {
        let key = (r[0].clone(), r[1].clone(), r[2].clone());
        let model = if r[3] == "common" {
            ClockModel::Common
        } else {
            ClockModel::PerSystem
        };
        let geo = sites[&r[0]];
        let satellites: Vec<SatelliteInput> = sets[&key]
            .iter()
            .map(|id| {
                let l = look_angles(geo, sats[&(r[1].clone(), id.clone())]);
                SatelliteInput {
                    id: Some(id.clone()),
                    system: Some(id.rsplit_once('-').unwrap().0.to_string()),
                    az_deg: Some(l.az_rad.to_degrees()),
                    el_deg: Some(l.el_rad.to_degrees()),
                    ..Default::default()
                }
            })
            .collect();
        assert_eq!(satellites.len(), r[4].parse::<usize>().unwrap(), "{key:?}");
        let g = sky_geometry(&SkyRequest {
            satellites: Some(satellites),
            mask_deg: Some(-90.0),
            clock: model,
            sigma_uere_m: Some(SIGMA_UERE_M),
            confidence: Some(CONFIDENCE),
            ..Default::default()
        })
        .unwrap();
        // (d) clock labels and states.
        let labels: Vec<&str> = r[5].split('|').collect();
        assert_eq!(g.clock_labels, labels, "{key:?} {}", r[3]);
        let tol = if f(&r[6]) < PDOP_SPLIT {
            TOL_WELL
        } else {
            TOL_ILL
        };
        let e = g.ellipse.expect("a fix");
        // (a) the axes.
        for (a, b) in [(e.semi_major_m, f(&r[7])), (e.semi_minor_m, f(&r[8]))] {
            let rel = (a - b).abs() / b.abs().max(1e-300);
            worst_axis = worst_axis.max(rel);
            assert!(rel <= tol, "(a) {key:?} {}: {a} vs {b}", r[3]);
        }
        // (b) the orientation, where it is defined.
        if f(&r[10]) > MIN_GAP_REL {
            let dd = (e.orientation_deg - f(&r[9])).rem_euclid(180.0);
            let dd = dd.min(180.0 - dd);
            worst_orient = worst_orient.max(dd);
            assert!(dd <= TOL_ORIENT_DEG, "(b) {key:?} {}: {dd} deg", r[3]);
        } else {
            near_circle += 1;
        }
        // (c) the cofactor, upper triangle row by row.
        let q = g.cofactor_enu.unwrap();
        let up: Vec<f64> = r[11].split(';').map(f).collect();
        let scale = up.iter().fold(0.0_f64, |m, v| m.max(v.abs()));
        let mut it = up.iter();
        for i in 0..q.len() {
            for j in i..q.len() {
                let o = it.next().expect("numpy gave the whole triangle");
                let diff = (q[i][j] - o).abs() / scale;
                worst_q = worst_q.max(diff);
                assert!(
                    diff <= tol,
                    "(c) {key:?} {} q[{i}][{j}]: {} vs {o}",
                    r[3],
                    q[i][j]
                );
            }
        }
        assert!(it.next().is_none(), "(d) {key:?}: state count differs");
        n += 1;
    }
    eprintln!(
        "ellipse oracle: {n} set-and-clock cases; worst axis {worst_axis:.3e} relative, \
         orientation {worst_orient:.3e} deg ({near_circle} near-circular, not compared), \
         cofactor {worst_q:.3e} of the matrix scale"
    );
    assert!(n > 200, "only {n} cases compared");
}
