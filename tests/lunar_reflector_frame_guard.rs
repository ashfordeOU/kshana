// SPDX-License-Identifier: AGPL-3.0-only
//! The lunar retroreflector catalogue must keep saying which FRAME it is in, because two
//! incompatible frames are in circulation and confusing them moves every reflector by
//! about 800 m.
//!
//! ## The two frames
//!
//! A lunar surface point has two standard Cartesian realisations and they are not the same
//! numbers:
//!
//! * **MER** — the mean Earth / mean rotation axis frame, centre of mass. This is what JPL
//!   DE430 Table 7 publishes, and it is what this repository vendors in
//!   `tests/fixtures/lunar_llr/de430_retroreflectors_mer.csv` for the `lunar-llr-datum`
//!   scenario.
//! * **PA** — the principal-axis body frame. This is what the DE440 solution (Park et al.
//!   2021) publishes, and what a PA-frame rotation such as a `de440_moon_pa_body_to_inertial`
//!   expects to be handed.
//!
//! The two differ by the standard PA-to-MER rotation, a fraction of a degree. On the lunar
//! surface that is not a fraction of anything useful.
//!
//! ## Measured, not asserted
//!
//! Comparing the DE430 MER catalogue vendored here against the DE440 PA coordinates for the
//! same five arrays: the geocentric radii agree to 0.1 m, and the positions differ by
//!
//! ```text
//!   Apollo 11    829.5 m        Apollo 14    842.0 m
//!   Apollo 15    823.3 m        Lunokhod 1   870.9 m
//!   Lunokhod 2   672.7 m
//! ```
//!
//! Identical distances from the centre, rotated by a few hundred arcseconds. That is the
//! signature of a frame difference and it is exactly what makes it dangerous: every
//! sanity check based on "is this a plausible lunar surface radius" passes, and the
//! coordinates are still wrong by the better part of a kilometre.
//!
//! ## Why this guard exists now
//!
//! A port of a datum-identifiability module was proposed that would have fed the MER
//! catalogue to a PA-frame rotation. The module's whole purpose is sub-metre datum
//! analysis, so an 800 m systematic would not have been a rounding difference — and
//! nothing in the build would have objected, because both catalogues are well-formed CSVs
//! of plausible lunar coordinates.
//!
//! This test does not stop anyone adding a PA catalogue. It insists that the frame stays
//! DECLARED and that the MER file keeps being the MER file, so a swap is a build failure
//! rather than a silent 800 m.

use std::path::Path;

const MER_CSV: &str = "tests/fixtures/lunar_llr/de430_retroreflectors_mer.csv";

/// Mean lunar radius (m), for the plausibility band below.
const R_MOON_M: f64 = 1_737_400.0;

fn read(rel: &str) -> String {
    let root = Path::new(env!("CARGO_MANIFEST_DIR"));
    std::fs::read_to_string(root.join(rel)).unwrap_or_else(|e| panic!("{rel}: {e}"))
}

#[test]
fn the_reflector_catalogue_declares_its_frame_in_its_own_header() {
    let body = read(MER_CSV);
    let header: String = body
        .lines()
        .take_while(|l| l.starts_with('#'))
        .collect::<Vec<_>>()
        .join("\n")
        .to_lowercase();

    assert!(
        !header.is_empty(),
        "{MER_CSV} has no comment header at all. The frame must be stated IN THE FILE: a \
         catalogue that does not say which frame it is in can be handed to the wrong \
         rotation without anything noticing."
    );
    assert!(
        header.contains("mean earth") || header.contains("mean-earth"),
        "{MER_CSV} no longer declares the mean Earth / mean rotation frame in its header. \
         Either the file was replaced with a different realisation — in which case every \
         consumer needs checking, because PA and MER differ by about 800 m at the surface \
         — or the provenance note was trimmed, which removes the only thing standing \
         between a reader and that mistake."
    );
    assert!(
        header.contains("de430"),
        "{MER_CSV} no longer names DE430 as its source. The DE440 solution publishes \
         PRINCIPAL-AXIS coordinates, not these; if this file has moved to DE440, confirm \
         which frame the new numbers are in before anything consumes them."
    );
}

#[test]
fn every_catalogued_array_sits_on_the_lunar_surface() {
    let body = read(MER_CSV);
    let mut rows = body
        .lines()
        .filter(|l| !l.starts_with('#') && !l.trim().is_empty());
    let header = rows.next().expect("a column header row");
    let cols: Vec<&str> = header.split(',').map(|c| c.trim()).collect();
    let idx = |name: &str| {
        cols.iter()
            .position(|c| *c == name)
            .unwrap_or_else(|| panic!("{MER_CSV} has no {name} column; columns are {cols:?}"))
    };
    let (ix, iy, iz) = (idx("x_m"), idx("y_m"), idx("z_m"));

    let mut n = 0usize;
    for line in rows {
        let f: Vec<&str> = line.split(',').collect();
        let g = |i: usize| -> f64 {
            f[i].trim()
                .parse()
                .unwrap_or_else(|e| panic!("{MER_CSV}: unparseable coordinate {:?}: {e}", f[i]))
        };
        let (x, y, z) = (g(ix), g(iy), g(iz));
        let r = (x * x + y * y + z * z).sqrt();
        // Every LLR array is near the mean radius; the widest real departure is a couple
        // of kilometres of relief. A band of +/- 10 km is loose enough never to fire on
        // real data and tight enough to catch a unit error or a truncated column.
        assert!(
            (r - R_MOON_M).abs() < 10_000.0,
            "an array sits {r:.1} m from the lunar centre, {:.1} m off the mean radius. \
             That is not relief — check the units and the column mapping.",
            r - R_MOON_M
        );
        n += 1;
    }
    assert_eq!(
        n, 5,
        "the catalogue should hold the five near-side arrays (Apollo 11/14/15, Lunokhod \
         1/2); found {n}. A changed row count means a different product, so re-check the \
         frame before trusting it."
    );
}

/// A PA-frame catalogue may legitimately be added later — the degeneracy analyses want
/// one. When it is, it must be a SEPARATE file, and this one must be untouched.
#[test]
fn a_principal_axis_catalogue_never_overwrites_the_mean_earth_one() {
    let root = Path::new(env!("CARGO_MANIFEST_DIR"));
    let dir = root.join("tests/fixtures/lunar_llr");
    let mut pa_files = Vec::new();
    if let Ok(entries) = std::fs::read_dir(&dir) {
        for e in entries.flatten() {
            let name = e.file_name().to_string_lossy().to_lowercase();
            if name.contains("_pa") || name.contains("principal") || name.contains("de440") {
                pa_files.push(name);
            }
        }
    }
    // Their presence is fine. What is not fine is the MER file having become one of them.
    let body = read(MER_CSV).to_lowercase();
    assert!(
        !body.contains("principal"),
        "{MER_CSV} now mentions principal axes. If this file has been converted to PA, \
         every consumer expecting MER is silently wrong by about 800 m; give the PA \
         realisation its own filename instead. PA-looking files already present: {pa_files:?}"
    );
    assert!(
        MER_CSV.contains("_mer"),
        "the mean-Earth catalogue must keep _mer in its filename so a reader can see the \
         frame without opening it"
    );
}
