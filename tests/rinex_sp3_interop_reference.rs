// SPDX-License-Identifier: AGPL-3.0-only
//! RINEX broadcast-ephemeris -> satellite ECEF position reference test (external oracle).
//!
//! kshana's broadcast-ephemeris position evaluator (`kshana::rinex::parse_nav`
//! feeding `kshana::rinex::RinexEphemeris::sv_position_ecef`, the IS-GPS-200
//! §20.3.3.4.3 / Galileo OS SIS ICD / BeiDou OS SIS ICD user algorithm) is checked
//! against an **independent third-party implementation**: RTKLIB's `eph2pos`
//! (tomojitakasu/RTKLIB, `src/ephemeris.c`), the de-facto open GNSS reference,
//! compiled from C source and run offline.
//!
//! Both sides read the IDENTICAL vendored multi-GNSS RINEX 3.05 navigation slice
//! (`fixtures/rinex_sp3_interop/brdc_multignss_slice.rnx`): RTKLIB parses it with
//! its own decoder and evaluates each broadcast record with its own, separately
//! authored Keplerian-to-ECEF algorithm; kshana parses the same bytes and
//! evaluates with its own. Reproducing RTKLIB's ECEF positions across GPS,
//! Galileo, and BeiDou-MEO satellites and a window of times makes the evaluator
//! externally validated, not merely self-consistent.
//!
//! The committed reference vectors in `rinex_ecef_reference.txt` are RTKLIB's
//! actual `eph2pos` output (provenance + RTKLIB version/commit in that file's
//! header and in the directory `NOTICE`). Both implementations use the same
//! per-system constants (mu_GPS = 3.9860050e14, mu_GAL = mu_CMP = 3.986004418e14,
//! OMGE_GAL = 7.2921151467e-5, OMGE_CMP = 7.292115e-5), so the only residual is
//! f64 round-off plus the Kepler Newton-iteration tolerance; kshana matches RTKLIB
//! to far better than the 1e-2 m per-axis gate.
//!
//! Time base: each ephemeris is evaluated at tk offsets from its own toe, with the
//! oracle driven by RTKLIB `timeadd(eph->toe, tk)` and kshana by `eph.toe + tk`.
//! Driving by tk = t - toe isolates the position algorithm from time-system
//! bookkeeping (notably RTKLIB's BeiDou BDT->GPST conversion of toe, which kshana
//! keeps in BDT); see the fixture header.

use kshana::rinex::{parse_nav, RinexEphemeris};

/// The exact bytes both kshana and the RTKLIB oracle parsed.
const NAV: &str = include_str!("fixtures/rinex_sp3_interop/brdc_multignss_slice.rnx");
/// RTKLIB eph2pos reference vectors (committed, real RTKLIB output).
const REFERENCE: &str = include_str!("fixtures/rinex_sp3_interop/rinex_ecef_reference.txt");

/// Per-axis agreement gate (m). The two implementations share the IS-GPS-200
/// algorithm and constants, so the residual is f64 round-off + Kepler iteration.
const TOL_M: f64 = 1e-2;

/// One pinned oracle row: system, prn, toe-seconds-in-week, tk offset, RTKLIB ECEF.
struct Row {
    system: char,
    prn: u8,
    toes: f64,
    tk: f64,
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
        // sys prn toes iode tk X Y Z
        assert_eq!(f.len(), 8, "malformed reference row: {line:?}");
        rows.push(Row {
            system: f[0].chars().next().unwrap(),
            prn: f[1].parse().unwrap(),
            toes: f[2].parse().unwrap(),
            // f[3] = iode (informational, not used for matching)
            tk: f[4].parse().unwrap(),
            xyz: [
                f[5].parse().unwrap(),
                f[6].parse().unwrap(),
                f[7].parse().unwrap(),
            ],
        });
    }
    rows
}

/// Find the parsed kshana ephemeris matching this oracle row by (system, prn, toe).
/// toe is the unambiguous key: the slice holds exactly one record per satellite.
fn match_ephemeris<'a>(ephs: &'a [RinexEphemeris], row: &Row) -> &'a RinexEphemeris {
    ephs.iter()
        .find(|e| e.system == row.system && e.prn == row.prn && (e.toe - row.toes).abs() < 1e-3)
        .unwrap_or_else(|| {
            panic!(
                "no kshana ephemeris for {}{:02} toe={} (oracle row)",
                row.system, row.prn, row.toes
            )
        })
}

#[test]
fn sv_position_ecef_matches_rtklib_eph2pos() {
    let ephs = parse_nav(NAV).expect("vendored multi-GNSS nav slice parses");
    let rows = parse_reference();

    // Coverage guard: the brief asks for >= 20 SV-epoch cases over a real
    // multi-GNSS file; the fixture carries 84 (GPS + Galileo + BeiDou-MEO).
    assert!(
        rows.len() >= 20,
        "expected >= 20 SV-epoch reference cases, found {}",
        rows.len()
    );

    let mut worst = 0.0_f64;
    let mut worst_label = String::new();
    let mut systems_seen = std::collections::BTreeSet::new();

    for row in &rows {
        let eph = match_ephemeris(&ephs, row);
        systems_seen.insert(row.system);

        // Evaluate kshana at the SAME tk the oracle used: t = toe + tk.
        let got = eph.sv_position_ecef(eph.toe + row.tk);

        #[allow(clippy::needless_range_loop)] // paired got/row.xyz axis indexing reads clearer
        for axis in 0..3 {
            let d = (got[axis] - row.xyz[axis]).abs();
            if d > worst {
                worst = d;
                worst_label = format!(
                    "{}{:02} tk={:+.0}s axis={} kshana={:.6} RTKLIB={:.6}",
                    row.system, row.prn, row.tk, axis, got[axis], row.xyz[axis]
                );
            }
            assert!(
                d <= TOL_M,
                "{}{:02} tk={:+.0}s axis {}: kshana {:.6} m vs RTKLIB eph2pos {:.6} m \
                 (|Δ|={:.3e} > {:.0e})",
                row.system,
                row.prn,
                row.tk,
                axis,
                got[axis],
                row.xyz[axis],
                d,
                TOL_M
            );
        }
    }

    // The cross-validation must actually span the three Keplerian constellations
    // present in the fixture, not silently collapse to one.
    assert!(
        systems_seen.contains(&'G') && systems_seen.contains(&'E') && systems_seen.contains(&'C'),
        "expected GPS+Galileo+BeiDou coverage, saw {systems_seen:?}"
    );

    eprintln!(
        "RINEX->ECEF vs RTKLIB eph2pos: {} SV-epoch cases across {:?}; \
         worst per-axis |Δ| = {:.3e} m (gate {:.0e} m) at {}",
        rows.len(),
        systems_seen,
        worst,
        TOL_M,
        worst_label
    );
}
