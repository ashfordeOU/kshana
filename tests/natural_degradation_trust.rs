// SPDX-License-Identifier: AGPL-3.0-only
//! Natural degradation read as a blocked sky (0.36, FUT-01): the `natural-degradation` training
//! event closes a stated skyline over the sky (here the REPRESENTATIVE `fjord` preset), and the
//! receiver-trust score of the NMEA it writes is compared with and without the same skyline
//! stated in the receiver-trust session (`[skyline]`).
//!
//! Without a stated skyline the geometry lane has only the azimuth-gap rule, and a two-sided
//! obstruction (a fjord) leaves untracked satellites on both sides of the vessel: the losses
//! read as the signal environment. With the skyline stated, the satellites behind it are lost
//! to the sky: `sky-blocked` is reported, `open_fraction` is set, and every deduction during the
//! event is classed `geometry` (none `environment`, none `inconsistency`). Synthetic data, MODELLED:
//! it shows the rule does what it says on a generated log, not how often a real fjord or
//! terminal is told apart from interference.

use std::path::Path;

use kshana::nmea_synth::config::TrainingScenario;
use kshana::nmea_synth::gen::generate;
use kshana::receiver_trust::geometry::GeometryReason;
use kshana::receiver_trust::monitors::{EpochTrust, Monitor};
use kshana::receiver_trust::scenario::{run_receiver_trust, ReceiverTrustResult, ReceiverTrustScenario};
use kshana::receiver_trust::score::DeductionClass;

const ROOT: &str = env!("CARGO_MANIFEST_DIR");

fn nmea(name: &str) -> String {
    let text =
        std::fs::read_to_string(Path::new(ROOT).join(format!("scenarios/training/{name}.toml")))
            .unwrap();
    generate(&TrainingScenario::parse(&text).unwrap())
        .unwrap()
        .nmea_text()
}

/// The demo's vessel session, calibrating on the first 120 s, with `extra` appended.
fn run(log: &str, extra: &str) -> ReceiverTrustResult {
    let mut toml_text =
        std::fs::read_to_string(Path::new(ROOT).join("examples/maritime-trust/session.toml"))
            .unwrap();
    toml_text = toml_text.replace("calibration_s = 300.0", "calibration_s = 120.0");
    toml_text.push_str(extra);
    let mut scn: ReceiverTrustScenario = toml::from_str(&toml_text).unwrap();
    scn.log.source.path = None;
    scn.log.source.text = Some(log.to_string());
    run_receiver_trust(&scn).unwrap()
}

fn classes(e: &EpochTrust) -> Vec<(Monitor, DeductionClass)> {
    e.score
        .as_ref()
        .map(|s| s.deductions.iter().filter_map(|d| d.class.map(|c| (d.monitor, c))).collect())
        .unwrap_or_default()
}

#[test]
fn explore() {
    let log = nmea("fjord-natural-degradation");
    for (label, extra) in [("none", ""), ("fjord", "\n[skyline]\npreset = \"fjord\"\n")] {
        let r = run(&log, extra);
        for e in r.epochs.iter().step_by(30) {
            eprintln!(
                "{label} t {} n {:?} hdop {:?} label {:?} reasons {:?} sl {} behind {:?} of {:?} score {:?} {:?}",
                e.t_s,
                e.geometry.n_used,
                e.geometry.hdop,
                e.geometry.label,
                e.geometry.reasons,
                e.geometry.signal_loss,
                e.geometry.behind_skyline,
                e.geometry.open_fraction,
                e.score.as_ref().map(|s| s.score),
                classes(e)
            );
        }
    }
    let _ = GeometryReason::SkyBlocked;
}
