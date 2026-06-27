// SPDX-License-Identifier: AGPL-3.0-only
//! SP3 precise-ephemeris interpolation -> satellite ECEF position reference test
//! (external oracle).
//!
//! kshana's precise-ephemeris interpolator (`kshana::sp3::parse_sp3` feeding
//! `kshana::sp3::Sp3File::interpolator` ->
//! `kshana::sp3::Sp3Interpolator::position_ecef`) is checked against an
//! **independent third-party implementation**: RTKLIB's `peph2pos` (the de-facto
//! open IGS precise-ephemeris interpolator, `tomojitakasu/RTKLIB`,
//! `src/preceph.c`), compiled from C source and run offline.
//!
//! Both sides read the IDENTICAL vendored SP3-c file
//! (`fixtures/sp3_interp/igs16296.sp3`, RTKLIB's own committed IGS final product):
//! RTKLIB parses it with its own SP3 reader and interpolates with `peph2pos`,
//! kshana parses the same bytes and interpolates with its `Sp3Interpolator`.
//!
//! What is actually validated is the **Earth-rotation node correction** that the
//! IGS interpolation standard requires: before fitting the polynomial, each
//! tabulated node's ECEF position is rotated about +Z by `ω⊕·(t_node − t)` so all
//! nodes are expressed in the Earth-fixed frame at the SAME evaluation instant
//! (RTKLIB `pephpos`, "correction for earh rotation ver.2.4.0"). Without it a
//! plain Lagrange fit on the raw ECEF samples disagrees with RTKLIB by several
//! centimetres at GNSS orbital velocity; with it (plus a precision-clean node-time
//! construction) kshana matches RTKLIB to far better than the 1e-3 m per-axis gate.
//!
//! The committed reference vectors in `sp3_ecef_reference.txt` are RTKLIB's actual
//! `peph2pos` output (provenance + RTKLIB version/commit in that file's header and
//! in the directory `NOTICE`).
//!
//! Time base: the SP3 file is on the GPS time scale (its first epoch is t_s = 0).
//! Each satellite is sampled at off-node instants t_s = 900·k + frac for interior
//! grid indices k and fractional offsets frac inside the 900 s step. The oracle is
//! driven by `gpst2time(1629, 518400 + 900·k + frac)`; kshana is queried at
//! `position_ecef(900·k + frac)`. Both evaluate the identical instant against the
//! identical tabulated grid; see the fixture header.

use kshana::sp3::parse_sp3;

/// The exact SP3 bytes both kshana and the RTKLIB oracle parsed.
const SP3: &str = include_str!("fixtures/sp3_interp/igs16296.sp3");
/// RTKLIB peph2pos reference vectors (committed, real RTKLIB output).
const REFERENCE: &str = include_str!("fixtures/sp3_interp/sp3_ecef_reference.txt");

/// Per-axis agreement gate (m). The two implementations share the IGS
/// interpolation scheme (11-point polynomial + Earth-rotation node correction),
/// so the residual is f64 round-off plus the Neville-vs-Lagrange evaluation order.
const TOL_M: f64 = 1e-3;

/// One pinned oracle row: SP3 satellite id, grid index, fractional offset,
/// seconds-from-file-start (the query point), and the RTKLIB peph2pos ECEF.
struct Row {
    sat: String,
    t_s: f64,
    xyz: [f64; 3],
}

fn parse_reference() -> Vec<Row> {
    let mut rows = Vec::new();
    for line in REFERENCE.lines() {
        let line = line.trim();
        if line.is_empty() || line.starts_with('#') {
            continue;
        }
        let f: Vec<&str> = line.split_whitespace().collect();
        // sat k frac t_s X Y Z
        assert_eq!(f.len(), 7, "malformed reference row: {line:?}");
        rows.push(Row {
            sat: f[0].to_string(),
            // f[1] = k, f[2] = frac (informational; t_s is the query key)
            t_s: f[3].parse().unwrap(),
            xyz: [
                f[4].parse().unwrap(),
                f[5].parse().unwrap(),
                f[6].parse().unwrap(),
            ],
        });
    }
    rows
}

#[test]
fn sp3_interpolation_matches_rtklib_peph2pos() {
    let file = parse_sp3(SP3).expect("vendored IGS SP3 file parses");
    let rows = parse_reference();

    // Coverage guard: the brief asks for >= 20 off-node SV-epoch cases; the
    // fixture carries 72 (6 GPS satellites x 4 interior grid indices x 3
    // fractional offsets).
    assert!(
        rows.len() >= 20,
        "expected >= 20 off-node SV-epoch reference cases, found {}",
        rows.len()
    );

    // Build one interpolator per distinct satellite (reused across its rows).
    use std::collections::BTreeMap;
    let mut interps: BTreeMap<String, _> = BTreeMap::new();

    let mut worst = 0.0_f64;
    let mut worst_label = String::new();
    let mut sats_seen = std::collections::BTreeSet::new();

    for row in &rows {
        let interp = interps
            .entry(row.sat.clone())
            .or_insert_with(|| {
                file.interpolator(&row.sat)
                    .unwrap_or_else(|| panic!("interpolator builds for {}", row.sat))
            });
        sats_seen.insert(row.sat.clone());

        let got = interp.position_ecef(row.t_s);

        for axis in 0..3 {
            let d = (got[axis] - row.xyz[axis]).abs();
            if d > worst {
                worst = d;
                worst_label = format!(
                    "{} t_s={:.1}s axis={} kshana={:.6} RTKLIB={:.6}",
                    row.sat, row.t_s, axis, got[axis], row.xyz[axis]
                );
            }
            assert!(
                d <= TOL_M,
                "{} t_s={:.1}s axis {}: kshana {:.6} m vs RTKLIB peph2pos {:.6} m \
                 (|Δ|={:.3e} > {:.0e})",
                row.sat,
                row.t_s,
                axis,
                got[axis],
                row.xyz[axis],
                d,
                TOL_M
            );
        }
    }

    // The cross-validation must span several satellites, not collapse to one.
    assert!(
        sats_seen.len() >= 4,
        "expected >= 4 satellites in the cross-validation, saw {:?}",
        sats_seen
    );

    eprintln!(
        "SP3 interp vs RTKLIB peph2pos: {} off-node SV-epoch cases across {} satellites; \
         worst per-axis |Δ| = {:.3e} m (gate {:.0e} m) at {}",
        rows.len(),
        sats_seen.len(),
        worst,
        TOL_M,
        worst_label
    );
}
