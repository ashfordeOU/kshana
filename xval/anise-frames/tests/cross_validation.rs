// SPDX-License-Identifier: Apache-2.0
//! The headline cross-validation gate: `kshana`'s IAU 2006/2000A CIO reduction must
//! agree with ANISE's high-precision ITRF93 (SPICE) to within the documented bounds,
//! both driven by identical IERS Earth-orientation parameters.
//!
//! Self-skips when no SPICE kernel is available (offline / no `earth_latest_high_prec.bpc`),
//! so it never reddens an offline run; the optional `frame-xval` CI job provides the
//! kernel and runs it for real. Bounds are set from the measured residual
//! (max angle ~0.028″, surface ~0.86 m, GPS ~3.6 m) with margin, and aligned to the
//! ROADMAP "<10 m" frame-cross-check target at GNSS orbit.

use kshana_anise_xval::anise_bridge::AniseEarth;
use kshana_anise_xval::kernel::resolve_bpc;
use kshana_anise_xval::xval::{self, Report};

#[test]
fn kshana_cio_agrees_with_anise_itrf93_within_bounds() {
    let Some(path) = resolve_bpc() else {
        eprintln!(
            "SKIP cross_validation: no BPC kernel. Set KSHANA_ANISE_BPC or run `cargo run --bin frame-xval` to fetch it."
        );
        return;
    };
    let earth = AniseEarth::from_bpc_path(path.to_str().unwrap()).expect("load BPC");
    let (results, skipped) = xval::run(&earth, &xval::fixture_eop());
    let report = Report::summarize(results, skipped);

    assert_eq!(
        report.n_epochs, 8,
        "all 8 quarterly epochs (2020-2023) must lie in the BPC coverage; skipped={:?}",
        report.skipped
    );
    assert!(
        report.max_angle_arcsec < 0.1,
        "relative rotation angle regressed: max {:.6}\" (expected < 0.1\", measured ~0.028\")",
        report.max_angle_arcsec
    );
    assert!(
        report.max_surface_m < 2.0,
        "surface disagreement regressed: max {:.3} m (expected < 2 m, measured ~0.86 m)",
        report.max_surface_m
    );
    assert!(
        report.max_gps_m < 10.0,
        "GNSS-orbit disagreement regressed: max {:.3} m (ROADMAP target < 10 m, measured ~3.6 m)",
        report.max_gps_m
    );
}
