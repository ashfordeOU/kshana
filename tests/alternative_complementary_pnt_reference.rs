// SPDX-License-Identifier: AGPL-3.0-only
//! Externally validate kshana's IGRF-14 geomagnetic-field synthesis — the
//! field-evaluation core of the magnetic-anomaly leg of the alternative /
//! complementary-PNT capability — against an **independent third-party
//! authority**: ppigrf 2.1.0 ("Pure Python IGRF", Karl M. Laundal, MIT), the
//! IAGA-VMOD reference implementation shipping the official IGRF14.shc
//! coefficient file (IAGA IGRF 14th generation, DOI 10.5281/zenodo.14012302).
//!
//! ppigrf is a different codebase from `src/igrf.rs` (different language,
//! different Legendre recursion, different geodetic→geocentric reduction), fed
//! byte-identical geodetic inputs (lat, lon, height above the WGS-84 ellipsoid)
//! at the IGRF epoch 2025.0 over a near-global ~2500-point grid. Agreement to a
//! few nT / a few millidegrees is therefore a genuine external check, not a
//! self-consistency test. ppigrf returns the field in east/north/up; the fixture
//! maps it to kshana's north/east/down (X=Bn, Y=Be, Z=-Bu) and derives D, I with
//! kshana's own definitions (D=atan2(Y,X), I=atan2(Z,H)).
//!
//! Tolerance: IGRF is itself meaningful only to ~1 nT, and the two
//! implementations differ only in float reassociation and the exact form of the
//! geodetic reduction, so the field components agree to well under 1 nT. The gate
//! is 5 nT per component (X/Y/Z/F), RMS < 1 nT, and 0.01° on D/I — tight, not
//! order-of-magnitude.
//!
//! Honest scope: this validates the IGRF main-field *synthesis* only. The
//! map-matching / CRLB geolocation-accuracy layer that consumes this field is a
//! modelling claim and is NOT validated here.
//!
//! Reference data, provenance and the committed generator live in
//! `tests/fixtures/alternative_complementary_pnt/`.

use kshana::igrf::magnetic_field;

const REF: &str = include_str!(
    "fixtures/alternative_complementary_pnt/alternative_complementary_pnt_reference.txt"
);

/// Epoch of the committed reference (decimal year). Must match the generator.
const YEAR: f64 = 2025.0;

/// Per-component absolute tolerance on the field (nT). The two synthesis codes
/// agree far inside this; the floor exists only to absorb float reassociation
/// and the slightly different geodetic reductions.
const TOL_NT: f64 = 5.0;
/// RMS bound across all components of all points (nT).
const RMS_NT: f64 = 1.0;
/// Angle tolerance on declination / inclination (deg).
const TOL_DEG: f64 = 0.01;

/// Smallest declination difference accounting for the ±180° wrap (atan2 branch).
fn ang_diff(a: f64, b: f64) -> f64 {
    let mut d = (a - b) % 360.0;
    if d > 180.0 {
        d -= 360.0;
    } else if d < -180.0 {
        d += 360.0;
    }
    d.abs()
}

#[test]
fn igrf_synthesis_matches_ppigrf_over_global_grid() {
    let mut n = 0usize;
    let mut worst_xyz = 0.0_f64; // worst per-component |Δ| on X,Y,Z,F (nT)
    let mut worst_d = 0.0_f64; // worst |Δ| on declination (deg)
    let mut worst_i = 0.0_f64; // worst |Δ| on inclination (deg)
    let mut sse = 0.0_f64; // sum of squared field-component errors (nT²)
    let mut n_comp = 0usize; // number of field components summed for RMS

    for line in REF.lines() {
        if !line.starts_with("IGRF ") {
            continue;
        }
        // IGRF lat lon alt | X Y Z F D I
        let parts: Vec<&str> = line.splitn(2, '|').collect();
        assert_eq!(parts.len(), 2, "IGRF row needs a '|': {line}");
        let head: Vec<f64> = parts[0]
            .trim_start_matches("IGRF")
            .split_whitespace()
            .map(|x| x.parse().unwrap())
            .collect();
        assert_eq!(head.len(), 3, "expected lat lon alt: {line}");
        let vals: Vec<f64> = parts[1]
            .split_whitespace()
            .map(|x| x.parse().unwrap())
            .collect();
        assert_eq!(vals.len(), 6, "expected X Y Z F D I: {line}");

        let (lat, lon, alt) = (head[0], head[1], head[2]);
        let (x, y, z, f, d, i) = (vals[0], vals[1], vals[2], vals[3], vals[4], vals[5]);

        let m = magnetic_field(lat, lon, alt, YEAR);

        for (lbl, got, want) in [
            ("X", m.north_nt, x),
            ("Y", m.east_nt, y),
            ("Z", m.down_nt, z),
            ("F", m.total_nt, f),
        ] {
            let e = (got - want).abs();
            worst_xyz = worst_xyz.max(e);
            sse += e * e;
            n_comp += 1;
            assert!(
                e <= TOL_NT,
                "IGRF {lbl} at ({lat},{lon},{alt}): kshana {got:.3} nT vs ppigrf {want:.3} nT \
                 (|Δ|={e:.3} > {TOL_NT} nT)",
            );
        }

        let ed = ang_diff(m.declination_deg, d);
        worst_d = worst_d.max(ed);
        assert!(
            ed <= TOL_DEG,
            "IGRF D at ({lat},{lon},{alt}): kshana {:.5}° vs ppigrf {d:.5}° (|Δ|={ed:.5} > {TOL_DEG}°)",
            m.declination_deg,
        );

        let ei = ang_diff(m.inclination_deg, i);
        worst_i = worst_i.max(ei);
        assert!(
            ei <= TOL_DEG,
            "IGRF I at ({lat},{lon},{alt}): kshana {:.5}° vs ppigrf {i:.5}° (|Δ|={ei:.5} > {TOL_DEG}°)",
            m.inclination_deg,
        );

        n += 1;
    }

    assert!(n >= 1900, "expected >=1900 IGRF reference points, got {n}");

    let rms = (sse / n_comp as f64).sqrt();
    assert!(
        rms <= RMS_NT,
        "field-component RMS error {rms:.4} nT exceeds {RMS_NT} nT over {n} points",
    );

    eprintln!(
        "alternative_complementary_pnt_reference: {n} points vs ppigrf 2.1.0 (IGRF14.shc) @ {YEAR}; \
         worst |ΔXYZF|={worst_xyz:.3e} nT, RMS={rms:.3e} nT, worst |ΔD|={worst_d:.3e}°, worst |ΔI|={worst_i:.3e}°"
    );
}
