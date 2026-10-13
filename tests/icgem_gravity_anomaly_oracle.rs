// SPDX-License-Identifier: AGPL-3.0-only
//! External oracle for the gravity-anomaly synthesis (WP-10, RM-17): Kshana's
//! `gravity_anomaly_sa_parallel_mgal` on the bundled EGM2008 coefficients (degree 70) against
//! grids computed by the ICGEM Calculation Service (GFZ), an independent implementation.
//!
//! Bars pre-registered in `xval/icgem-egm2008/PREREGISTRATION.md` before the first run:
//! per region, RMS of (Kshana - ICGEM) <= 0.005 mGal and max |Kshana - ICGEM| <= 0.02 mGal.
//!
//! The ICGEM output carries no explicit licence, so the grids are not vendored. Fetch them
//! with
//! `bash tools/fetch_icgem_grid.sh tools/icgem gravity_anomaly_sa chad 19 25 9 15` and
//! `bash tools/fetch_icgem_grid.sh tools/icgem gravity_anomaly_sa deathvalley 242 245 35 38`.
//! The SHA-256 of each file's numeric body (the rows after `end_of_head`; the header holds
//! the job date) is pinned below, so a changed service output fails loudly instead of
//! silently moving the comparison.

use kshana::gravity_sh::{SphericalHarmonicField, WGS84_ELLIPSOID};
use sha2::{Digest, Sha256};

/// (region tag, nodes, SHA-256 of the GDF body) as first fetched on 2026-10-13.
const GRIDS: &[(&str, usize, &str)] = &[
    (
        "chad",
        625,
        "aabd15b479e00934776946984d9c29f469575a0e452f14dd789ef4d5a9f5e014",
    ),
    (
        "deathvalley",
        169,
        "f42275345e2e9c33a8996aaca8e541eca9f791d32ad5f76d93103f345a068671",
    ),
];

/// Pre-registered bars (mGal).
const RMS_BAR_MGAL: f64 = 0.005;
const MAX_BAR_MGAL: f64 = 0.02;

/// Read a fetched grid, check its pinned body hash, and return (lon, lat, value) rows.
fn read_grid(tag: &str, nodes: usize, sha: &str) -> Vec<(f64, f64, f64)> {
    let path = format!("tools/icgem/egm2008_n70_gravity_anomaly_sa_{tag}.gdf");
    let text = std::fs::read_to_string(&path)
        .unwrap_or_else(|_| panic!("fetch {path} first (see the module doc)"));
    let body = text
        .split_once("end_of_head")
        .and_then(|(_, rest)| rest.split_once('\n'))
        .map(|(_, rows)| rows)
        .expect("GDF has an end_of_head line");
    let digest = hex::encode(Sha256::digest(body.as_bytes()));
    assert_eq!(
        digest, sha,
        "{path}: the ICGEM output changed since it was pinned"
    );
    let rows: Vec<(f64, f64, f64)> = body
        .lines()
        .filter(|l| !l.trim().is_empty())
        .map(|l| {
            let v: Vec<f64> = l
                .split_whitespace()
                .map(|x| x.parse().expect("numeric GDF row"))
                .collect();
            (v[0], v[1], v[2])
        })
        .collect();
    assert_eq!(rows.len(), nodes, "{path}: node count");
    rows
}

/// RMS and max |difference| of Kshana against one ICGEM grid, with the worst node.
fn compare(rows: &[(f64, f64, f64)]) -> (f64, f64, (f64, f64)) {
    let field = SphericalHarmonicField::egm2008_truncated(70);
    let (mut ss, mut max, mut worst) = (0.0, 0.0_f64, (0.0, 0.0));
    for &(lon, lat, icgem) in rows {
        let ours = field.gravity_anomaly_sa_parallel_mgal(
            &WGS84_ELLIPSOID,
            true,
            lat.to_radians(),
            0.0,
            &[lon.to_radians()],
        )[0];
        let d = ours - icgem;
        ss += d * d;
        if d.abs() > max {
            max = d.abs();
            worst = (lat, lon);
        }
    }
    ((ss / rows.len() as f64).sqrt(), max, worst)
}

#[test]
#[ignore = "needs the ICGEM grids fetched via tools/fetch_icgem_grid.sh (not vendored)"]
fn egm2008_n70_gravity_anomaly_sa_matches_icgem() {
    for &(tag, nodes, sha) in GRIDS {
        let (rms, max, (lat, lon)) = compare(&read_grid(tag, nodes, sha));
        println!("{tag}: rms {rms:.3e} mGal, max {max:.3e} mGal at ({lat}, {lon})");
        assert!(
            rms <= RMS_BAR_MGAL,
            "{tag}: RMS {rms} mGal > {RMS_BAR_MGAL}"
        );
        assert!(
            max <= MAX_BAR_MGAL,
            "{tag}: max {max} mGal > {MAX_BAR_MGAL} at ({lat}, {lon})"
        );
    }
}

/// A few ICGEM values cited with attribution so the external check also runs in CI
/// (ICGEM Calculation Service, GFZ Potsdam, Ince et al. 2019, doi:10.5194/essd-11-647-2019;
/// model EGM2008, Pavlis et al. 2012; same request as above, fetched 2026-10-13):
/// (lon deg, lat deg, gravity_anomaly_sa mGal).
const CITED: &[(f64, f64, f64)] = &[
    (19.0, 15.0, -2.599184744168),
    (22.0, 15.0, 15.711916717526),
    (25.0, 14.25, 14.935956234453),
    (23.5, 13.5, 10.559944370293),
    (22.0, 12.0, -6.253907363910),
    (25.0, 9.0, -4.527847615806),
    (242.0, 38.0, 9.333895912575),
    (245.0, 38.0, 6.562405699263),
    (244.0, 36.25, -3.285443550209),
    (245.0, 35.0, -8.712418184534),
];

#[test]
fn egm2008_n70_matches_cited_icgem_values() {
    // The same pre-registered bars, over the cited nodes.
    let (rms, max, (lat, lon)) = compare(CITED);
    assert!(rms <= RMS_BAR_MGAL, "cited nodes: RMS {rms} mGal");
    assert!(
        max <= MAX_BAR_MGAL,
        "cited nodes: max {max} mGal at ({lat}, {lon})"
    );
}
