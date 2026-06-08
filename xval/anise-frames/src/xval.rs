// SPDX-License-Identifier: Apache-2.0
//! The cross-validation driver: `kshana`'s CIO chain vs ANISE's ITRF93, epoch by epoch.
//!
//! For each validation epoch BOTH sides are driven by the SAME IERS Earth-orientation
//! parameters (so the comparison isolates frame-model disagreement, not EOP-source
//! disagreement) and the resulting inertial -> Earth-fixed rotations are compared via
//! [`crate::compare`]. The headline figures are the relative rotation angle (arcsec)
//! and the worst-case position disagreement at the Earth surface and at GNSS orbit.
//!
//! Honest scope of the residual (what this number is and is NOT):
//! - `kshana` realizes the rigorous IERS 2010 / IAU 2006/2000A **CIO** transform.
//! - ANISE's ITRF93 is JPL's `earth_latest_high_prec.bpc` realization (IAU 1976/1980
//!   precession-nutation + interpolated IERS EOP), tied to the ITRF93 datum.
//!
//! Fed identical UT1 and polar motion, the residual is dominated by the
//! precession-nutation model difference, the ITRF93-vs-ITRF20xx frame tie, and the
//! omitted celestial-pole offsets (dX, dY ~ sub-mas). It is therefore expected at the
//! sub-metre-to-few-metre level, NOT bit-for-bit. The bit-for-bit anchor for `kshana`
//! remains the SOFA/ERFA vectors in `kshana::cio`; this is an independent sanity bound.

use serde::Serialize;

use crate::anise_bridge::AniseEarth;
use crate::compare::{relative_angle_arcsec, worst_case_ground_m};
use crate::eop::{nearest, parse_all, EopRecord};
use crate::kshana_chain;
use crate::timeconv::{from_utc, Epoch};

/// WGS-84 equatorial radius (m) — "surface" worst-case scale.
pub const EARTH_RADIUS_M: f64 = 6_378_137.0;
/// Representative low-Earth-orbit radius (m), ~550 km altitude.
pub const LEO_RADIUS_M: f64 = EARTH_RADIUS_M + 550_000.0;
/// GPS / MEO orbit radius (m).
pub const GPS_RADIUS_M: f64 = 26_560_000.0;

/// The validation epochs (UTC midnight) with their integer MJD for EOP lookup.
/// Quarterly across 2020-2023 — well inside the BPC's final-EOP coverage.
pub const EPOCHS: &[(i32, u32, u32, f64)] = &[
    (2020, 1, 1, 58849.0),
    (2020, 7, 1, 59031.0),
    (2021, 1, 1, 59215.0),
    (2021, 7, 1, 59396.0),
    (2022, 1, 1, 59580.0),
    (2022, 7, 1, 59761.0),
    (2023, 1, 1, 59945.0),
    (2023, 7, 1, 60126.0),
];

/// The committed IERS finals2000A excerpt (see `fixtures/`).
pub fn fixture_eop() -> Vec<EopRecord> {
    parse_all(include_str!("../fixtures/finals2000A_excerpt.txt"))
}

/// One epoch's cross-check outcome.
#[derive(Serialize, Clone, Debug)]
pub struct EpochResult {
    /// ISO date label (UTC midnight).
    pub date: String,
    pub mjd: f64,
    /// IERS EOP fed to BOTH sides.
    pub ut1_utc_s: f64,
    pub xp_arcsec: f64,
    pub yp_arcsec: f64,
    /// Relative rotation angle between the two inertial->Earth-fixed matrices (arcsec).
    pub angle_arcsec: f64,
    /// Worst-case position disagreement (m) at the Earth surface / LEO / GPS radius.
    pub surface_m: f64,
    pub leo_m: f64,
    pub gps_m: f64,
}

/// Compute the cross-check for one epoch given its EOP record.
pub fn check_epoch(
    earth: &AniseEarth,
    year: i32,
    month: u32,
    day: u32,
    eop: &EopRecord,
) -> Result<EpochResult, String> {
    let epoch: Epoch = from_utc(year, month, day, 0, 0, 0.0, eop.ut1_utc_s);
    let k = kshana_chain::gcrs_to_itrs(&epoch, eop.xp_arcsec, eop.yp_arcsec);
    let a = earth.gcrf_to_itrf93(&epoch)?;
    Ok(EpochResult {
        date: format!("{year:04}-{month:02}-{day:02}"),
        mjd: eop.mjd,
        ut1_utc_s: eop.ut1_utc_s,
        xp_arcsec: eop.xp_arcsec,
        yp_arcsec: eop.yp_arcsec,
        angle_arcsec: relative_angle_arcsec(&k, &a),
        surface_m: worst_case_ground_m(&k, &a, EARTH_RADIUS_M),
        leo_m: worst_case_ground_m(&k, &a, LEO_RADIUS_M),
        gps_m: worst_case_ground_m(&k, &a, GPS_RADIUS_M),
    })
}

/// Run the full cross-validation over [`EPOCHS`] using the given EOP records. Epochs
/// whose rotation cannot be produced (e.g. outside the BPC coverage) are skipped, with
/// their dates returned in `skipped`.
pub fn run(earth: &AniseEarth, records: &[EopRecord]) -> (Vec<EpochResult>, Vec<String>) {
    let mut results = Vec::new();
    let mut skipped = Vec::new();
    for &(y, m, d, mjd) in EPOCHS {
        let Some(eop) = nearest(records, mjd) else {
            skipped.push(format!("{y:04}-{m:02}-{d:02} (no EOP)"));
            continue;
        };
        match check_epoch(earth, y, m, d, &eop) {
            Ok(r) => results.push(r),
            Err(e) => skipped.push(format!("{y:04}-{m:02}-{d:02} ({e})")),
        }
    }
    (results, skipped)
}

/// Rollup of a cross-validation run, suitable for serialization to `report.json`.
#[derive(Serialize, Clone, Debug)]
pub struct Report {
    pub reference: String,
    pub kshana_chain: String,
    pub anise_frame: String,
    pub eop_source: String,
    pub n_epochs: usize,
    pub max_angle_arcsec: f64,
    pub mean_angle_arcsec: f64,
    pub max_surface_m: f64,
    pub max_leo_m: f64,
    pub max_gps_m: f64,
    pub results: Vec<EpochResult>,
    pub skipped: Vec<String>,
}

impl Report {
    /// Build the rollup from per-epoch results.
    pub fn summarize(results: Vec<EpochResult>, skipped: Vec<String>) -> Self {
        let n = results.len().max(1) as f64;
        let max_by =
            |f: &dyn Fn(&EpochResult) -> f64| results.iter().map(f).fold(0.0_f64, f64::max);
        let mean_angle = results.iter().map(|r| r.angle_arcsec).sum::<f64>() / n;
        Report {
            reference: "ANISE (pure-Rust NAIF/SPICE) v0.10".into(),
            kshana_chain: "kshana::cio GCRS->ITRS (IAU 2006/2000A CIO, SOFA eraC2tcio)".into(),
            anise_frame: "EARTH_ITRF93 from earth_latest_high_prec.bpc, source frame GCRF".into(),
            eop_source: "IERS finals2000A (Bulletin A final), fed identically to both sides".into(),
            n_epochs: results.len(),
            max_angle_arcsec: max_by(&|r| r.angle_arcsec),
            mean_angle_arcsec: mean_angle,
            max_surface_m: max_by(&|r| r.surface_m),
            max_leo_m: max_by(&|r| r.leo_m),
            max_gps_m: max_by(&|r| r.gps_m),
            results,
            skipped,
        }
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::kernel::resolve_bpc;

    #[test]
    fn fixture_has_all_eight_epochs() {
        let recs = fixture_eop();
        assert_eq!(recs.len(), 8, "fixture must hold the 8 validation epochs");
        // Every EPOCHS entry must resolve to its exact MJD record.
        for &(_, _, _, mjd) in EPOCHS {
            let r = nearest(&recs, mjd).unwrap();
            assert_eq!(r.mjd, mjd);
        }
    }

    #[test]
    fn probe_print_residuals() {
        // Diagnostic: prints the actual kshana-vs-ANISE residuals so the assertion
        // tolerance (see tests/cross_validation.rs) is set from measured truth, not a
        // guess. Self-skips without a kernel. Loose bound here; the real gate is the
        // integration test.
        let Some(path) = resolve_bpc() else {
            eprintln!("SKIP probe_print_residuals: no BPC kernel");
            return;
        };
        let earth = AniseEarth::from_bpc_path(path.to_str().unwrap()).unwrap();
        let (results, skipped) = run(&earth, &fixture_eop());
        let report = Report::summarize(results, skipped);
        eprintln!(
            "\n=== kshana CIO vs ANISE ITRF93 (same IERS EOP) ===\n{:<12} {:>12} {:>12} {:>12}",
            "date", "angle(\")", "surface(m)", "gps(m)"
        );
        for r in &report.results {
            eprintln!(
                "{:<12} {:>12.6} {:>12.3} {:>12.3}",
                r.date, r.angle_arcsec, r.surface_m, r.gps_m
            );
        }
        eprintln!(
            "MAX angle={:.6}\" surface={:.3} m leo={:.3} m gps={:.3} m  (n={}, skipped={:?})",
            report.max_angle_arcsec,
            report.max_surface_m,
            report.max_leo_m,
            report.max_gps_m,
            report.n_epochs,
            report.skipped
        );
        assert!(
            report.n_epochs > 0,
            "expected at least one in-coverage epoch"
        );
    }
}
