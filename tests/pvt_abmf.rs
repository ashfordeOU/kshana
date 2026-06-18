// SPDX-License-Identifier: AGPL-3.0-only
//! Real-data validation of single-point positioning against a surveyed IGS station.
//!
//! This drives the engine's SPP solver with genuine GNSS measurements — the
//! receiver's RINEX code pseudoranges and the broadcast ephemeris — and checks the
//! computed position against the station's surveyed coordinate. It is the
//! end-to-end proof that the measurement-to-position pipeline works on real data,
//! not only on synthetic geometry.
//!
//! Station ABMF (Aubergine, Le Moule, Guadeloupe), an IGS core multi-GNSS station,
//! 2018-05-13 (day 133) at 01:30:00 GPS, eleven GPS satellites tracked. The
//! observation excerpt is from the georinex test corpus (BSD-3); the GPS broadcast
//! navigation is the IGS/BKG BRDC product for the same day, trimmed to the GPS
//! records bracketing the epoch. See `tests/fixtures/igs/NOTICE`.

use kshana::pvt::{run_pvt, PvtScenario};

const OBS: &str = include_str!("fixtures/igs/ABMF00GLP_R_20181330000_01D_30S_MO.rnx");
const NAV: &str = include_str!("fixtures/igs/BRDC00WRD_R_20181330000_01D_GN.rnx");

/// ABMF surveyed ECEF coordinate (m): the APPROX POSITION XYZ carried in the IGS
/// observation header, which for a permanent IGS station is the precise a-priori
/// (centimetre-level) coordinate from the station's ITRF solution.
const TRUTH: [f64; 3] = [2919786.4480, -5383745.1780, 1774604.7340];

fn scenario(apriori: Option<[f64; 3]>) -> PvtScenario {
    PvtScenario {
        obs_rinex: OBS.to_string(),
        nav_rinex: NAV.to_string(),
        truth_ecef: Some(TRUTH),
        apriori_ecef: apriori,
        mask_deg: 5.0,
        dual_frequency: true,
    }
}

#[test]
fn abmf_single_point_positioning_recovers_the_surveyed_coordinate() {
    let r = run_pvt(&scenario(None)).expect("runs");
    assert!(
        r.fom.epochs_solved >= 1,
        "expected at least one solved epoch, got {}",
        r.fom.epochs_solved
    );
    let rms = r
        .fom
        .rms_3d_m
        .expect("3D error against the truth coordinate");
    eprintln!(
        "ABMF SPP — {}/{} epochs solved, mean {:.1} sats, PDOP {:.1} | \
         3D RMS {:.2} m (max {:.2} m), H {:.2} m, V {:.2} m, post-fit {:.2} m",
        r.fom.epochs_solved,
        r.fom.epochs_total,
        r.fom.mean_n_used,
        r.fom.mean_pdop,
        rms,
        r.fom.max_3d_m.unwrap(),
        r.fom.rms_h_m.unwrap(),
        r.fom.rms_v_m.unwrap(),
        r.fom.mean_postfit_rms_m,
    );
    // Dual-frequency ionosphere-free code SPP from broadcast ephemeris is a
    // metre-level solution; a healthy geometry sits well inside this honest bound.
    assert!(
        rms < 10.0,
        "ionosphere-free code SPP 3D RMS {rms:.2} m should be within 10 m"
    );
}

#[test]
fn abmf_solution_is_determined_by_the_data_not_the_a_priori() {
    // The least-squares fix is the minimum of the pseudorange residuals, set by the
    // measurements rather than the starting point. Seeding the solve 3 km off the
    // truth converges to within a few centimetres of the header-seeded solve — the
    // only difference being the once-evaluated correction linearisation, not the
    // a-priori itself. (A real station a-priori is accurate to centimetres, so the
    // effect vanishes in practice.) This proves the ~6 m-from-truth fix is the data
    // talking, not the a-priori being echoed back.
    let from_header = run_pvt(&scenario(None)).unwrap();
    let offset = [TRUTH[0] + 3000.0, TRUTH[1] - 3000.0, TRUTH[2] + 3000.0];
    let from_offset = run_pvt(&scenario(Some(offset))).unwrap();

    let a = from_header.epochs[0]
        .fix
        .as_ref()
        .expect("a fix at epoch 0");
    let b = from_offset.epochs[0]
        .fix
        .as_ref()
        .expect("a fix at epoch 0");
    let d = ((a.ecef_m[0] - b.ecef_m[0]).powi(2)
        + (a.ecef_m[1] - b.ecef_m[1]).powi(2)
        + (a.ecef_m[2] - b.ecef_m[2]).powi(2))
    .sqrt();
    assert!(
        d < 0.1,
        "a 3 km a-priori shift moved the solution {d:.4} m; it must be data-determined"
    );
}
