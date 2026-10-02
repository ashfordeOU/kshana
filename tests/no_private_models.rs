// SPDX-License-Identifier: AGPL-3.0-only
//! No private orbit, frame or time models in the geometry, time and propagation kernels.
//!
//! Package D8 routes the Earth-orbit scenario kinds through one validated path: SGP4/SDP4
//! (Simplified General Perturbations / Simplified Deep-space Perturbations, checked against
//! the 666 AIAA verification vectors) for propagation, the IAU (International Astronomical
//! Union) 2006/2000A chain for the Earth-fixed frame, and two-part Julian dates (`kshana::jd2`)
//! for time. This test keeps breadth from bypassing that path: it scans the non-test code of
//! the kernels below for the markers of a private model, which are
//! * a Keplerian propagation of its own (`solve_kepler(`, `kepler(`, `Orbit::new(`,
//!   `Propagator::Kepler(`, `SatMotion::kepler(`),
//! * secular J2 rates of its own (`raan_dot`, `argp_dot`, `j2_secular_rates(`),
//! * an Earth rotation by sidereal time alone (`teme_to_ecef(`, `gstime(`) or by a rate times
//!   a time (`EARTH_ROTATION_RATE * t`, `OMEGA_EARTH * t`, `omega * t`).
//!
//! Scope, stated strictly: geometry, time and propagation kernels only. The test does not
//! forbid physics that is itself a row's subject (a closed-form J2 nodal regression in the
//! Earth-observation figures, Jacchia-1971 in its own row), nor a named fast tier that appears
//! in the output label and in the row's claim. Each such use is an entry of [`ALLOWED`] with
//! its category and reason, and an entry that no longer matches anything fails the test, so
//! the list only shrinks as the remaining kinds are routed.

/// The kernels the rule covers: the files package D8 owns.
const KERNELS: &[&str] = &[
    "src/sgp4.rs",
    "src/jd2.rs",
    "src/leo_fusion/polar.rs",
    "src/passes.rs",
    "src/walker.rs",
    "src/constellation.rs",
    "src/leo_pass.rs",
    "src/launch.rs",
    "src/eo_payload.rs",
    "src/leo_pnt_chain.rs",
    "src/handoff.rs",
];

/// Markers of a private model (matched on code, comments removed).
const MARKERS: &[&str] = &[
    "solve_kepler(",
    "kepler(",
    "Orbit::new(",
    "Propagator::Kepler(",
    "raan_dot",
    "argp_dot",
    "j2_secular_rates(",
    "teme_to_ecef(",
    "gstime(",
    "EARTH_ROTATION_RATE * t",
    "OMEGA_EARTH * t",
    "omega * t",
];

/// Why an allowed use is not a private model.
#[derive(Debug, Clone, Copy, PartialEq)]
enum Category {
    /// The validated path itself: SGP4's own definition and the TEME node convention.
    ValidatedPath,
    /// Physics that is the subject of a matrix row, checked there.
    RowSubject,
    /// A fast tier named in the output label and in the row's claim.
    NamedFastTier,
    /// Not yet routed: the model lives in a file outside this package. Tracked debt.
    NotYetRouted,
}

/// `(file, marker, category, reason)`. Every entry must match at least one line.
const ALLOWED: &[(&str, &str, Category, &str)] = &[
    (
        "src/sgp4.rs",
        "gstime(",
        Category::ValidatedPath,
        "Greenwich mean sidereal time is part of SGP4's definition (the deep-space resonance \
         terms) and of the TEME node convention MeanElementSet::from_earth_fixed states",
    ),
    (
        "src/passes.rs",
        "teme_to_ecef(",
        Category::RowSubject,
        "passes::predict_passes, the geometric scheduler on any engine Propagator, is the \
         subject of the VALIDATED row 'Ground-station pass prediction (ground segment)' \
         (Orekit 12.2 on a Keplerian ephemeris); the passes kind runs predict_passes_apparent",
    ),
    (
        "src/eo_payload.rs",
        "j2_secular_rates(",
        Category::RowSubject,
        "the first-order J2 nodal regression, nodal period and ground-track spacing are the \
         closed forms the Earth-observation payload rows state and check",
    ),
    (
        "src/constellation.rs",
        "solve_kepler(",
        Category::NamedFastTier,
        "the constellation-design kind's two-body orbits around any body; its label and the \
         coverage row's claim name 'two-body Keplerian orbits (optional secular J2)'",
    ),
    (
        "src/constellation.rs",
        "raan_dot",
        Category::NamedFastTier,
        "the same named tier's optional secular J2 drift of the node",
    ),
    (
        "src/constellation.rs",
        "argp_dot",
        Category::NamedFastTier,
        "the same named tier's optional secular J2 drift of the perigee",
    ),
    (
        "src/constellation.rs",
        "omega * t",
        Category::NamedFastTier,
        "the same named tier's body rotation at the body's IAU spin rate",
    ),
    (
        "src/leo_pass.rs",
        "kepler(",
        Category::NotYetRouted,
        "leo_pass builds leo_link::geometry::SatMotion::kepler (two-body with secular J2 in \
         a frame turned at the WGS 84 rate) from constellation-design elements; SatMotion \
         lives in src/leo_link/geometry.rs, outside package D8; proposed in .fold",
    ),
];

/// The non-test code of a source file: everything before its `#[cfg(test)]` module, with
/// line comments removed.
fn code_lines(path: &str) -> Vec<(usize, String)> {
    let text = std::fs::read_to_string(path).unwrap_or_else(|e| panic!("{path}: {e}"));
    text.lines()
        .enumerate()
        .take_while(|(_, l)| l.trim() != "#[cfg(test)]")
        .map(|(i, l)| (i + 1, l.split("//").next().unwrap_or("").to_string()))
        .collect()
}

/// Whether `line` contains `marker` starting at an identifier boundary (so `SgpOrbit::new(`
/// is not `Orbit::new(` and `solve_kepler(` is not `kepler(`).
fn has_marker(line: &str, marker: &str) -> bool {
    line.match_indices(marker).any(|(i, _)| {
        line[..i]
            .chars()
            .next_back()
            .is_none_or(|c| !(c.is_alphanumeric() || c == '_'))
    })
}

#[test]
fn the_geometry_time_and_propagation_kernels_carry_no_private_models() {
    let mut violations = Vec::new();
    let mut used = vec![false; ALLOWED.len()];
    for &file in KERNELS {
        for (n, line) in code_lines(file) {
            for &marker in MARKERS {
                if !has_marker(&line, marker) {
                    continue;
                }
                match ALLOWED
                    .iter()
                    .position(|&(f, m, _, _)| f == file && m == marker)
                {
                    Some(k) => used[k] = true,
                    None => violations.push(format!("{file}:{n}: `{marker}` in `{}`", line.trim())),
                }
            }
        }
    }
    assert!(
        violations.is_empty(),
        "private orbit, frame or time model in a kernel (route it through sgp4::SgpOrbit, \
         sgp4::teme_to_itrs_matrix and jd2, or add a reasoned ALLOWED entry):\n{}",
        violations.join("\n")
    );
    let stale: Vec<String> = ALLOWED
        .iter()
        .zip(&used)
        .filter(|(_, u)| !**u)
        .map(|((f, m, c, _), _)| format!("{f} `{m}` ({c:?})"))
        .collect();
    assert!(stale.is_empty(), "stale ALLOWED entries: {stale:?}");
}

#[test]
fn every_allowed_entry_names_a_kernel_a_marker_and_a_reason() {
    for &(file, marker, category, reason) in ALLOWED {
        assert!(KERNELS.contains(&file), "{file} is not a kernel");
        assert!(MARKERS.contains(&marker), "{marker} is not a marker");
        assert!(reason.len() > 40, "{file} `{marker}`: give a reason");
        if category == Category::NamedFastTier {
            assert!(
                reason.contains('\''),
                "{file}: quote the label that names the tier"
            );
        }
    }
}
