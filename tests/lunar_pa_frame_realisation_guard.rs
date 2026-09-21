// SPDX-License-Identifier: AGPL-3.0-only
//! Three realisations of "the Moon-fixed frame" are in circulation in this repository and
//! two of them are a kilometre apart. This test pins which is which, and pins the ORDERING
//! of the errors, because the ordering is what justifies the design.
//!
//! ## The three
//!
//! * **MER / DE430** — mean Earth / mean rotation axes, `tests/fixtures/lunar_llr/`
//!   `de430_retroreflectors_mer.csv`, Table 7 of the DE430 surface-coordinates memorandum.
//!   This is what `lunar_frame::icrf_to_iau_moon` realises and what the `lunar-llr-datum`
//!   scenario reads.
//! * **PA / DE430** — principal axes, `tests/fixtures/lunar_llr/de430_retroreflectors_pa.csv`,
//!   Table 6 of the SAME memorandum, machine-extracted from the same SHA-256-verified PDF.
//!   Carried as an independent published cross-check; nothing computes with it.
//! * **PA / DE440** — principal axes, `tests/fixtures/llr_geometry/`
//!   `de440_retroreflectors_pa.csv`, the Park et al. 2021 DE440 LLR solution. This is the
//!   catalogue the datum cluster actually uses, because it is the realisation the
//!   `lunar_orientation` rotation fixture is built from.
//!
//! ## Why the cross-check exists
//!
//! The DE440 coordinates reached this repository as hand-transcribed constants citing a
//! paper, with no machine-verifiable chain — and the branch's own provenance note named two
//! different tables for the same five rows. The DE430 PA catalogue is extracted by a
//! committed generator that refuses to emit a number until the source document's SHA-256
//! matches, and that re-derives radius/longitude/latitude from the published X/Y/Z before
//! writing. Pinning DE440 against DE430 turns a transcription into a corroborated one.
//!
//! ## The ordering, which is the actual engineering claim
//!
//! Measured here, at the five arrays:
//!
//! ```text
//!   PA(DE440) vs PA(DE430)   ~1.0-1.12 m     two realisations of the SAME frame
//!   1-day interpolation of the DE440 orientation series
//!                            ~14 m           the substrate's own resolution
//!   PA vs MER                ~672-871 m      two DIFFERENT frames
//! ```
//!
//! So the realisation difference is an order of magnitude BELOW the orientation substrate's
//! own interpolation error and can be ignored; the frame difference is nearly two orders
//! ABOVE it and cannot. That is why the cluster keeps a PA catalogue of its own instead of
//! being rebased onto the real-data MER catalogue, and it is why swapping the two files
//! would be a silent sub-kilometre systematic rather than a rounding difference.
//!
//! These bounds are deliberately loose enough never to flap on a re-extraction and tight
//! enough that a frame swap, a unit error or a truncated column fails the build.

use std::collections::BTreeMap;
use std::path::Path;

const MER_DE430: &str = "tests/fixtures/lunar_llr/de430_retroreflectors_mer.csv";
const PA_DE430: &str = "tests/fixtures/lunar_llr/de430_retroreflectors_pa.csv";
const PA_DE440: &str = "tests/fixtures/llr_geometry/de440_retroreflectors_pa.csv";
const ORIENTATION: &str = "tests/fixtures/llr_geometry/de440_moon_pa.csv";

/// Mean lunar radius (m), for the surface-band check.
const R_MOON_M: f64 = 1_737_400.0;

type Xyz = [f64; 3];

fn read(rel: &str) -> String {
    let root = Path::new(env!("CARGO_MANIFEST_DIR"));
    std::fs::read_to_string(root.join(rel)).unwrap_or_else(|e| panic!("{rel}: {e}"))
}

/// `Apollo 11` and `Apollo11` are the same array; the two catalogues spell it differently.
fn key(name: &str) -> String {
    name.chars().filter(|c| !c.is_whitespace()).collect()
}

/// Parse a retroreflector catalogue into {array: xyz}. Handles both the
/// `array,ilrs_target,x_m,y_m,z_m,...` and the `name,x_m,y_m,z_m` column layouts by
/// locating the columns BY NAME rather than by position — a positional reader would
/// silently transpose the two files into each other.
fn catalogue(rel: &str) -> BTreeMap<String, Xyz> {
    let body = read(rel);
    let mut rows = body
        .lines()
        .filter(|l| !l.starts_with('#') && !l.trim().is_empty());
    let header = rows
        .next()
        .unwrap_or_else(|| panic!("{rel}: no header row"));
    let cols: Vec<&str> = header.split(',').map(str::trim).collect();
    let idx = |n: &str| {
        cols.iter()
            .position(|c| *c == n)
            .unwrap_or_else(|| panic!("{rel}: no '{n}' column; columns are {cols:?}"))
    };
    let (ix, iy, iz) = (idx("x_m"), idx("y_m"), idx("z_m"));
    let iname = cols
        .iter()
        .position(|c| *c == "array" || *c == "name")
        .unwrap_or_else(|| panic!("{rel}: no 'array' or 'name' column"));

    let mut out = BTreeMap::new();
    for line in rows {
        let f: Vec<&str> = line.split(',').collect();
        let g = |i: usize| -> f64 {
            f[i].trim()
                .parse()
                .unwrap_or_else(|e| panic!("{rel}: unparseable coordinate {:?}: {e}", f[i]))
        };
        out.insert(key(f[iname].trim()), [g(ix), g(iy), g(iz)]);
    }
    out
}

fn dist(a: Xyz, b: Xyz) -> f64 {
    ((a[0] - b[0]).powi(2) + (a[1] - b[1]).powi(2) + (a[2] - b[2]).powi(2)).sqrt()
}

fn radius(a: Xyz) -> f64 {
    (a[0] * a[0] + a[1] * a[1] + a[2] * a[2]).sqrt()
}

/// Pair up two catalogues by array name, failing loudly if they do not cover the same set.
/// A silent intersection would let this whole test pass on one array.
fn paired(
    a: &BTreeMap<String, Xyz>,
    b: &BTreeMap<String, Xyz>,
    what: &str,
) -> Vec<(String, Xyz, Xyz)> {
    let ka: Vec<&String> = a.keys().collect();
    let kb: Vec<&String> = b.keys().collect();
    assert_eq!(
        ka, kb,
        "{what}: the two catalogues do not name the same arrays. Comparing only the \
         intersection would let this guard pass while one file had been replaced."
    );
    a.iter().map(|(k, va)| (k.clone(), *va, b[k])).collect()
}

#[test]
fn the_two_principal_axis_realisations_agree_to_about_a_metre() {
    let de440 = catalogue(PA_DE440);
    let de430 = catalogue(PA_DE430);
    let pairs = paired(&de440, &de430, "PA(DE440) vs PA(DE430)");
    assert_eq!(
        pairs.len(),
        5,
        "expected the five near-side arrays; a changed row count means a different product"
    );

    let mut worst = 0.0_f64;
    for (name, a, b) in &pairs {
        let d = dist(*a, *b);
        worst = worst.max(d);
        assert!(
            d < 3.0,
            "{name}: the DE440 and DE430 principal-axis coordinates differ by {d:.3} m. \
             Two realisations of the principal-axis frame should agree to about a metre. \
             A larger gap means one of these files is not what its header says it is — \
             check first whether a mean-Earth catalogue has been dropped in, which would \
             show as roughly 800 m."
        );
        assert!(
            d > 0.05,
            "{name}: the DE440 and DE430 principal-axis coordinates differ by only \
             {d:.3} m. These are independent solutions eight years apart and should NOT \
             be identical — if they are, one file has probably been copied over the other."
        );
    }
    assert!(
        worst > 0.5,
        "the worst DE440-vs-DE430 separation across all five arrays is only {worst:.3} m; \
         the two solutions genuinely differ by about a metre, so a smaller figure means \
         the two catalogues are no longer independent."
    );
}

#[test]
fn principal_axis_and_mean_earth_are_hundreds_of_metres_apart_at_identical_radii() {
    let mer = catalogue(MER_DE430);
    for (label, pa_file) in [("DE440", PA_DE440), ("DE430", PA_DE430)] {
        let pa = catalogue(pa_file);
        let pairs = paired(&pa, &mer, &format!("PA({label}) vs MER(DE430)"));
        assert_eq!(pairs.len(), 5, "{label}: expected five arrays");

        for (name, p, m) in &pairs {
            let d = dist(*p, *m);
            // The real spread is 672 m (Lunokhod 2) to 871 m (Lunokhod 1).
            assert!(
                (600.0..1000.0).contains(&d),
                "{name}: PA({label}) and MER sit {d:.1} m apart, outside the 600-1000 m \
                 band these frames are known to differ by. Either a file has been swapped \
                 for one in the other frame, or a coordinate column has moved."
            );
            // The frames share an origin and differ by a rotation, so the radii must match
            // even though the positions do not. This is the property that makes the
            // mistake invisible to every plausibility check.
            let dr = (radius(*p) - radius(*m)).abs();
            assert!(
                dr < 0.5,
                "{name}: PA({label}) radius differs from MER radius by {dr:.3} m. A frame \
                 rotation cannot change a geocentric radius; this is a transcription or \
                 unit error, not a frame difference."
            );
        }
    }
}

#[test]
fn every_catalogued_array_sits_on_the_lunar_surface() {
    let mut checked = 0usize;
    for rel in [MER_DE430, PA_DE430, PA_DE440] {
        for (name, xyz) in catalogue(rel) {
            let r = radius(xyz);
            assert!(
                (r - R_MOON_M).abs() < 10_000.0,
                "{rel}: {name} sits {r:.1} m from the lunar centre, {:.1} m off the mean \
                 radius. That is not relief - check the units and the column mapping.",
                r - R_MOON_M
            );
            checked += 1;
        }
    }
    assert_eq!(
        checked, 15,
        "expected 5 arrays in each of 3 catalogues; checked {checked}. A file that failed \
         to parse would silently reduce this count, so the guard asserts it rather than \
         trusting the loop to have run."
    );
}

/// The claim in the module header of `lunar_orientation`, measured rather than asserted.
///
/// Each interior node of the orientation series is predicted from its two neighbours — a
/// two-day chord — and compared against the node's own value. The error of a linear
/// interpolation grows as the square of the arc, so the one-day error the engine actually
/// incurs is about a quarter of what this measures.
///
/// PIN-SCOPE: the interpolation-error magnitude of the committed DE440 orientation series
///   and the row/column shape of that fixture.
/// PIN-EXCLUDES: the absolute accuracy of the DE440 solution itself, the Gram-Schmidt
///   implementation in `lunar_orientation` (this test re-implements it independently so a
///   shared bug cannot cancel), and any epoch outside the fixture's own window.
#[test]
fn the_orientation_series_interpolation_error_is_tens_of_metres_not_sub_metre() {
    let body = read(ORIENTATION);
    let rows: Vec<Vec<f64>> = body
        .lines()
        .filter(|l| !l.starts_with('#') && !l.trim().is_empty())
        .filter_map(|l| {
            let v: Result<Vec<f64>, _> = l.split(',').map(|x| x.trim().parse::<f64>()).collect();
            v.ok()
        })
        .collect();
    assert_eq!(
        rows.len(),
        731,
        "the DE440 orientation fixture should hold 731 daily rows; found {}. A changed \
         cadence changes the interpolation error this test bounds.",
        rows.len()
    );
    assert_eq!(rows[0].len(), 10, "expected t plus nine matrix elements");

    let mat = |v: &Vec<f64>| -> [[f64; 3]; 3] {
        [[v[1], v[2], v[3]], [v[4], v[5], v[6]], [v[7], v[8], v[9]]]
    };
    // Orthonormalise the COLUMNS, as `lunar_orientation` documents. Written out here
    // rather than imported so that a defect in the engine's own routine cannot hide by
    // being applied identically to both sides of the comparison.
    let gram_schmidt = |m: [[f64; 3]; 3]| -> [[f64; 3]; 3] {
        let col = |m: &[[f64; 3]; 3], k: usize| [m[0][k], m[1][k], m[2][k]];
        let dot = |a: [f64; 3], b: [f64; 3]| a[0] * b[0] + a[1] * b[1] + a[2] * b[2];
        let norm = |a: [f64; 3]| {
            let n = dot(a, a).sqrt();
            [a[0] / n, a[1] / n, a[2] / n]
        };
        let sub =
            |a: [f64; 3], b: [f64; 3], s: f64| [a[0] - s * b[0], a[1] - s * b[1], a[2] - s * b[2]];
        let c0 = norm(col(&m, 0));
        let c1 = norm(sub(col(&m, 1), c0, dot(col(&m, 1), c0)));
        let t = sub(col(&m, 2), c0, dot(col(&m, 2), c0));
        let c2 = norm(sub(t, c1, dot(t, c1)));
        [
            [c0[0], c1[0], c2[0]],
            [c0[1], c1[1], c2[1]],
            [c0[2], c1[2], c2[2]],
        ]
    };

    let mut worst_rad = 0.0_f64;
    let mut n = 0usize;
    for i in (1..rows.len() - 1).step_by(7) {
        let (a, b, t) = (mat(&rows[i - 1]), mat(&rows[i + 1]), mat(&rows[i]));
        let mut lin = [[0.0; 3]; 3];
        for r in 0..3 {
            for c in 0..3 {
                lin[r][c] = 0.5 * (a[r][c] + b[r][c]);
            }
        }
        let g = gram_schmidt(lin);
        // Angle of the relative rotation gᵀ·t, from its trace.
        let mut tr = 0.0;
        for d in 0..3 {
            for k in 0..3 {
                tr += g[k][d] * t[k][d];
            }
        }
        let ang = (((tr - 1.0) / 2.0).clamp(-1.0, 1.0)).acos();
        worst_rad = worst_rad.max(ang);
        n += 1;
    }
    assert!(
        n >= 100,
        "only {n} interior nodes were sampled; the bounds below are meaningless on a \
         handful of epochs. Fix the stride, do not relax this."
    );

    let two_day_m = worst_rad * R_MOON_M;
    let one_day_m = two_day_m / 4.0; // linear-interpolation error scales as the arc squared

    assert!(
        two_day_m < 150.0,
        "the two-day chord interpolation error is {two_day_m:.1} m at the lunar surface, \
         far above the ~55 m this series is known to carry. The fixture's cadence or its \
         contents have changed."
    );
    assert!(
        two_day_m > 10.0,
        "the two-day chord interpolation error measured only {two_day_m:.1} m. A linear \
         interpolation across two days of a 13.2 deg/day rotation cannot be that good — \
         the rows being compared are probably not the rows intended."
    );

    // The ordering that justifies the design. If these ever stop holding, the choice of
    // catalogue has to be revisited, which is exactly what this assertion is for.
    assert!(
        one_day_m > 3.0,
        "the one-day interpolation error works out at {one_day_m:.1} m. If the orientation \
         substrate really had become metre-accurate, the ~1 m DE440-vs-DE430 realisation \
         difference would no longer be negligible and the catalogue choice would need \
         re-examining."
    );
    assert!(
        one_day_m < 600.0,
        "the one-day interpolation error works out at {one_day_m:.1} m, which is \
         approaching the ~800 m PA-vs-MER frame difference. The frame distinction only \
         matters while it dominates this error; if it stops dominating, this whole \
         analysis needs revisiting rather than the bound being widened."
    );
}
