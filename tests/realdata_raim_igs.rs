// SPDX-License-Identifier: AGPL-3.0-only
//! Real-data check of the RAIM ingest adapter on a surveyed IGS station.
//!
//! The optimism-gap probe's `raim` detector is only credible if its consistency
//! statistic comes from a genuine pseudorange solve, not a toy. This drives
//! [`kshana::realdata::raim::observations`] with the same ABMF (Guadeloupe)
//! observation + broadcast-navigation fixtures the SPP solver is validated against
//! (`tests/pvt_abmf.rs`) and confirms it yields a well-formed per-epoch χ² statistic.

use kshana::realdata::raim;

const OBS: &str = include_str!("fixtures/igs/ABMF00GLP_R_20181330000_01D_30S_MO.rnx");
const NAV: &str = include_str!("fixtures/igs/BRDC00WRD_R_20181330000_01D_GN.rnx");

#[test]
fn raim_adapter_yields_a_finite_statistic_over_real_igs_data() {
    // a-priori falls back to the observation header's APPROX POSITION XYZ; sigma 5 m is
    // a conventional broadcast-code pseudorange error.
    let obs = raim::observations(OBS, NAV, None, 5.0, 1e-5).expect("adapter runs on real data");

    assert!(
        !obs.is_empty(),
        "expected at least one solvable epoch (>= 5 GPS satellites)"
    );
    for o in &obs {
        assert_eq!(o.detector, "raim");
        // The RAIM test statistic is SSE/sigma^2: finite and non-negative.
        assert!(
            o.raw.is_finite() && o.raw >= 0.0,
            "statistic {} invalid",
            o.raw
        );
        // Orient::Raw — already rises with inconsistency, so score == raw.
        assert_eq!(o.score, o.raw);
    }

    let n = obs.len();
    let mean = obs.iter().map(|o| o.raw).sum::<f64>() / n as f64;
    eprintln!("ABMF RAIM ingest — {n} epochs, mean test statistic {mean:.2}");
}
