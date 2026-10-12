// SPDX-License-Identifier: AGPL-3.0-only
//! High-degree Mars (GMM-3) and Moon (GRAIL GL0660B) gravity read from the PDS SHADR tables
//! ([`SphericalHarmonicField::from_shadr`]) and evaluated by
//! [`SphericalHarmonicField::acceleration`], compared with pyshtools 4.14.1 (an independent
//! spherical-harmonic implementation that reads the same files itself) at the points and bars
//! pre-registered in `xval/planetary-gravity-pyshtools/PREREGISTRATION.md`.
//!
//! PIN-SCOPE:    the body-fixed gravitational acceleration of the SHADR-loaded fields at the
//!               pre-registered points, against the committed pyshtools values
//!               (`tests/fixtures/planetary_gravity/oracle_*.txt`), within the pre-registered
//!               relative bars; the header GM/radius and selected coefficients against the
//!               values printed in the PDS products, exactly.
//! PIN-EXCLUDES: the body orientation (which frame the field is attached in), any orbit
//!               propagated through the field, the coefficient uncertainties, and degrees above
//!               20 unless the data-gate variables point at the full PDS files.
//!
//! Data gate (full-degree tests are `#[ignore]`d and need the original PDS files; fetch them
//! with `xval/planetary-gravity-pyshtools/fetch_data.sh`):
//!   KSHANA_GMM3_SHA      path to gmm3_120_sha.tab   (GMM-3, d/o 120)
//!   KSHANA_GRAIL_SHA     path to jggrx_0660b_sha.tab (GL0660B, d/o 660)
//!   KSHANA_GL0660B_GFC   path to the ICGEM GL0660B.gfc (reader cross-check only)

use kshana::body::Body;
use kshana::gravity_pds::ShadrHeader;
use kshana::gravity_sh::SphericalHarmonicField;
use kshana::propagator::ForceModel;

const GMM3_20: &str = include_str!("fixtures/planetary_gravity/gmm3_120_sha_to20.tab");
const GRAIL_20: &str = include_str!("fixtures/planetary_gravity/jggrx_0660b_sha_to20.tab");
const ORACLE_CROP: &str = include_str!("fixtures/planetary_gravity/oracle_crop20.txt");
const ORACLE_FULL: &str = include_str!("fixtures/planetary_gravity/oracle_full.txt");

type Vec3 = [f64; 3];

struct OracleRow {
    id: String,
    lmax: usize,
    r: f64,
    lat_deg: f64,
    lon_deg: f64,
    g: Vec3, // (radial, south, east), m/s²
}

fn oracle(text: &str) -> Vec<OracleRow> {
    text.lines()
        .filter(|l| !l.starts_with('#') && !l.trim().is_empty())
        .map(|l| {
            let p: Vec<&str> = l.split_whitespace().collect();
            let f = |i: usize| p[i].parse::<f64>().unwrap();
            OracleRow {
                id: p[0].to_string(),
                lmax: p[1].parse().unwrap(),
                r: f(2),
                lat_deg: f(3),
                lon_deg: f(4),
                g: [f(5), f(6), f(7)],
            }
        })
        .collect()
}

/// Kshana's acceleration at an oracle point, projected on (radial, south, east).
fn kshana_rse(field: &SphericalHarmonicField, row: &OracleRow) -> Vec3 {
    let (sp, cp) = row.lat_deg.to_radians().sin_cos();
    let (sl, cl) = row.lon_deg.to_radians().sin_cos();
    let pos = [row.r * cp * cl, row.r * cp * sl, row.r * sp];
    let a = field.acceleration(pos);
    let er = [cp * cl, cp * sl, sp];
    let es = [sp * cl, sp * sl, -cp];
    let ee = [-sl, cl, 0.0];
    let dot = |u: Vec3| a[0] * u[0] + a[1] * u[1] + a[2] * u[2];
    [dot(er), dot(es), dot(ee)]
}

fn norm(v: Vec3) -> f64 {
    (v[0] * v[0] + v[1] * v[1] + v[2] * v[2]).sqrt()
}

/// `(e_tot, e_pert)` of the pre-registration for one point.
fn errors(field: &SphericalHarmonicField, row: &OracleRow) -> (f64, f64) {
    let a = kshana_rse(field, row);
    let d = norm([a[0] - row.g[0], a[1] - row.g[1], a[2] - row.g[2]]);
    let gpm = -field.gm / (row.r * row.r);
    let pert = norm([row.g[0] - gpm, row.g[1], row.g[2]]);
    (d / norm(row.g), d / pert)
}

/// Compare every oracle row whose id is in `ids` (a prefix filter `M`/`L` plus an explicit
/// list); returns the worst `(e_tot, e_pert)` and prints every point.
fn check(
    field: &SphericalHarmonicField,
    rows: &[OracleRow],
    ids: &[&str],
    tot_bar: f64,
    pert_bar: f64,
    label: &str,
) -> (f64, f64) {
    let mut worst = (0.0f64, 0.0f64);
    let mut n = 0;
    for row in rows.iter().filter(|r| ids.contains(&r.id.as_str())) {
        assert_eq!(row.lmax, field.nmax, "{label} {}: oracle degree", row.id);
        let (et, ep) = errors(field, row);
        eprintln!(
            "{label} {:>3}  r={:>10.0} lat={:>6.1} lon={:>6.1}  e_tot={et:.3e}  e_pert={ep:.3e}",
            row.id, row.r, row.lat_deg, row.lon_deg
        );
        assert!(
            et <= tot_bar && ep <= pert_bar,
            "{label} {}: e_tot {et:.3e} (bar {tot_bar:e}), e_pert {ep:.3e} (bar {pert_bar:e})",
            row.id
        );
        worst = (worst.0.max(et), worst.1.max(ep));
        n += 1;
    }
    assert_eq!(n, ids.len(), "{label}: every pre-registered point present");
    eprintln!("{label} worst e_tot={:.3e} e_pert={:.3e}", worst.0, worst.1);
    worst
}

const MARS_IDS: [&str; 9] = ["M1", "M2", "M3", "M4", "M5", "M6", "M7", "M8", "M9"];
const MOON_IDS: [&str; 10] = ["L1", "L2", "L3", "L4", "L5", "L6", "L7", "L8", "L9", "L10"];

/// The coefficient record `(n, m)` of a SHADR table, parsed with `str::parse` (the published
/// text, independent of the reader under test).
fn record(text: &str, n: usize, m: usize) -> (f64, f64) {
    for line in text.lines().skip(1) {
        let f: Vec<&str> = line.split(',').map(str::trim).collect();
        if f.len() >= 4 && f[0] == n.to_string() && f[1] == m.to_string() {
            return (f[2].parse().unwrap(), f[3].parse().unwrap());
        }
    }
    panic!("no record ({n}, {m})");
}

fn published_values_gmm3(text: &str, field: &SphericalHarmonicField) {
    // Header record: Re = 3.3960000000000000e+03 km, GM = 4.2828372854187757e+04 km³/s².
    assert_eq!(field.re, 3.396e3 * 1e3);
    assert_eq!(field.gm, 4.282_837_285_418_775_7e4 * 1e9);
    // PDS label DESCRIPTION: "GM = 0.4282837285418775E+05 km**3/s**2".
    let label_gm = 0.428_283_728_541_877_5e5 * 1e9;
    assert!((field.gm - label_gm).abs() / label_gm <= 1e-15);
    for (n, m) in [(2, 0), (2, 2), (3, 0), (20, 20)] {
        let (c, s) = record(text, n, m);
        assert_eq!(field.cbar(n, m), Some(c), "GMM-3 C({n},{m})");
        assert_eq!(field.sbar(n, m), Some(s), "GMM-3 S({n},{m})");
    }
    assert_eq!(field.cbar(0, 0), Some(1.0));
}

fn published_values_grail(text: &str, field: &SphericalHarmonicField) {
    // Header: Re = 0.1738E+04 km (label: "The reference radius = 1738.0 km"),
    // GM = 0.4902800305555400E+04 km³/s².
    assert_eq!(field.re, 1_738_000.0);
    assert_eq!(field.gm, 0.490_280_030_555_54e4 * 1e9);
    assert_eq!(field.cbar(2, 0), Some(-0.908_808_346_622_200_1e-4));
    for (n, m) in [(2, 2), (3, 1), (20, 20)] {
        let (c, s) = record(text, n, m);
        assert_eq!(field.cbar(n, m), Some(c), "GL0660B C({n},{m})");
        assert_eq!(field.sbar(n, m), Some(s), "GL0660B S({n},{m})");
    }
    assert_eq!(field.cbar(0, 0), Some(1.0));
}

#[test]
fn crop_headers_and_coefficients_match_the_published_products() {
    let h = ShadrHeader::parse(GMM3_20).unwrap();
    assert_eq!((h.degree, h.order, h.normalization), (20, 20, 1));
    let f = SphericalHarmonicField::from_shadr(GMM3_20, 200).unwrap();
    assert_eq!(f.nmax, 20);
    published_values_gmm3(GMM3_20, &f);
    let g = SphericalHarmonicField::from_shadr(GRAIL_20, 200).unwrap();
    assert_eq!(g.nmax, 20);
    published_values_grail(GRAIL_20, &g);
}

#[test]
fn crop_d20_matches_pyshtools() {
    let rows = oracle(ORACLE_CROP);
    let mars = SphericalHarmonicField::from_shadr(GMM3_20, 20).unwrap();
    let moon = SphericalHarmonicField::from_shadr(GRAIL_20, 20).unwrap();
    check(&mars, &rows, &MARS_IDS, 1e-12, 1e-9, "A GMM-3 d/o 20");
    check(&moon, &rows, &MOON_IDS, 1e-12, 1e-9, "A GL0660B d/o 20");
}

#[test]
fn a_shadr_field_attached_to_a_body_drives_the_propagator() {
    // Wiring (MODELLED): the propagator's central gravity with an attached SHADR field is the
    // field's body-fixed acceleration rotated through the body's IAU orientation.
    let f = SphericalHarmonicField::from_shadr(GMM3_20, 20).unwrap();
    let body = Body::mars().with_gravity_field(f.clone());
    let mut fm = ForceModel::two_body().with_body(body.clone());
    fm.epoch_jd_tt = 2_460_000.5;
    let r = [2.1e6, -2.6e6, 1.4e6];
    let a = fm.accel(r);
    let rb = kshana::mars_frame::inertial_to_bodyfixed(r, &body, fm.epoch_jd_tt);
    let want = kshana::mars_frame::bodyfixed_to_inertial(f.acceleration(rb), &body, fm.epoch_jd_tt);
    let d = norm([a[0] - want[0], a[1] - want[1], a[2] - want[2]]);
    assert!(d <= 1e-15 * norm(want), "wiring residual {d}");
    // The default Mars is untouched (two-body + J2..J4, no field).
    assert!(Body::mars().gravity.is_none());
}

fn read_env(var: &str) -> String {
    let p = std::env::var(var).unwrap_or_else(|_| panic!("set {var} (see the module docs)"));
    std::fs::read_to_string(&p).unwrap_or_else(|e| panic!("{var}={p}: {e}"))
}

/// Number of coefficient records in a SHADR table.
fn n_records(text: &str) -> usize {
    text.lines()
        .skip(1)
        .filter(|l| l.split(',').count() >= 4)
        .count()
}

#[test]
#[ignore = "data gate: set KSHANA_GMM3_SHA to the PDS gmm3_120_sha.tab"]
fn full_gmm3_d120_matches_pyshtools() {
    let text = read_env("KSHANA_GMM3_SHA");
    assert_eq!(n_records(&text), 7380, "label ROWS = 7380");
    let h = ShadrHeader::parse(&text).unwrap();
    assert_eq!((h.degree, h.order), (120, 120));
    let f = SphericalHarmonicField::from_shadr(&text, 120).unwrap();
    assert_eq!(f.nmax, 120);
    published_values_gmm3(&text, &f);
    let rows = oracle(ORACLE_FULL);
    check(&f, &rows, &MARS_IDS, 1e-12, 1e-8, "B GMM-3 d/o 120");
}

#[test]
#[ignore = "data gate: set KSHANA_GRAIL_SHA to the PDS jggrx_0660b_sha.tab"]
fn full_gl0660b_d660_matches_pyshtools() {
    let text = read_env("KSHANA_GRAIL_SHA");
    assert_eq!(n_records(&text), 218_790, "degrees 1..660");
    let h = ShadrHeader::parse(&text).unwrap();
    assert_eq!((h.degree, h.order), (660, 660));
    let f = SphericalHarmonicField::from_shadr(&text, 660).unwrap();
    assert_eq!(f.nmax, 660);
    published_values_grail(&text, &f);
    let rows = oracle(ORACLE_FULL);
    // Pre-registered: |latitude| <= 60 deg only.
    check(
        &f,
        &rows,
        &["L1", "L2", "L3", "L4", "L9", "L10"],
        1e-11,
        1e-6,
        "C GL0660B d/o 660",
    );
    // Informational (no claim): above the evaluator's unscaled-recurrence latitude limit.
    for row in rows
        .iter()
        .filter(|r| ["L5", "L6", "L7", "L8"].contains(&r.id.as_str()))
    {
        let (et, ep) = errors(&f, row);
        eprintln!(
            "C-info GL0660B d/o 660 {:>3} lat={:>6.1}  e_tot={et:.3e}  e_pert={ep:.3e}",
            row.id, row.lat_deg
        );
    }
}

#[test]
#[ignore = "data gate: set KSHANA_GRAIL_SHA and KSHANA_GL0660B_GFC (ICGEM GL0660B.gfc)"]
fn gl0660b_icgem_gfc_equals_the_pds_shadr_reading() {
    let shadr = SphericalHarmonicField::from_shadr(&read_env("KSHANA_GRAIL_SHA"), 660).unwrap();
    let gfc = SphericalHarmonicField::from_gfc(&read_env("KSHANA_GL0660B_GFC"), 660).unwrap();
    assert_eq!(gfc.nmax, 660);
    assert_eq!(gfc.gm, shadr.gm);
    assert_eq!(gfc.re, shadr.re);
    for n in 0..=660 {
        for m in 0..=n {
            assert_eq!(gfc.cbar(n, m), shadr.cbar(n, m), "C({n},{m})");
            assert_eq!(gfc.sbar(n, m), shadr.sbar(n, m), "S({n},{m})");
        }
    }
}
