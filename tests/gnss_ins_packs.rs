// SPDX-License-Identifier: AGPL-3.0-only
//! The maritime, rail and aviation `gnss-ins` packs (RM-21) and the pack's tight-coupling
//! option. MODELLED: synthetic motion, constellation and sensors; the checks are the pack's own
//! figures of merit against its own truth.

use kshana::fusion::pack::{run_gnss_ins, GnssInsScenario};

fn load(name: &str) -> GnssInsScenario {
    let path = format!("{}/scenarios/{name}.toml", env!("CARGO_MANIFEST_DIR"));
    let scn: GnssInsScenario = toml::from_str(&std::fs::read_to_string(path).unwrap()).unwrap();
    scn.validate().unwrap();
    scn
}

#[test]
fn each_pack_runs_and_fusion_beats_free_inertial_over_the_outage() {
    for name in ["gnss-ins-maritime", "gnss-ins-rail", "gnss-ins-aviation"] {
        let r = run_gnss_ins(&load(name));
        for run in [&r.quantum, &r.classical] {
            eprintln!(
                "{name} {}: fused {:.1} m vs free {:.1} m over the outage, availability {:.2}",
                run.spec.id, run.fused_outage_rms_m, run.free_outage_rms_m, run.fom.availability
            );
            assert!(run.fused_outage_rms_m < run.free_outage_rms_m, "{name}");
        }
    }
}

/// Through a cutting where only two satellites stay in view, the tightly-coupled receiver keeps
/// correcting while the loosely-coupled one has no fix.
#[test]
fn tight_coupling_beats_loose_through_the_rail_cutting() {
    let tight = load("gnss-ins-rail");
    let mut loose = tight.clone();
    loose.tight = None;
    let (t, l) = (run_gnss_ins(&tight), run_gnss_ins(&loose));
    for (a, b) in [(&t.quantum, &l.quantum), (&t.classical, &l.classical)] {
        eprintln!(
            "{}: tight {:.1} m vs loose {:.1} m over the outage; availability {:.2} vs {:.2}",
            a.spec.id,
            a.fused_outage_rms_m,
            b.fused_outage_rms_m,
            a.fom.availability,
            b.fom.availability
        );
        assert!(a.fused_outage_rms_m < b.fused_outage_rms_m);
        assert!(a.fom.availability >= b.fom.availability);
    }
}

#[test]
fn a_tight_table_is_validated() {
    let mut scn = load("gnss-ins-rail");
    scn.tight.as_mut().unwrap().sigma_range_m = 0.0;
    assert!(scn.validate().is_err());
}
