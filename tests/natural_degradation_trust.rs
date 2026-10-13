// SPDX-License-Identifier: AGPL-3.0-only
//! Natural degradation read as a blocked sky (0.36, FUT-01): the `natural-degradation` training
//! event closes a stated skyline over the sky (here the REPRESENTATIVE `fjord` preset), and the
//! receiver-trust score of the NMEA it writes is compared with and without the same skyline
//! stated in the receiver-trust session (`[skyline]`).
//!
//! Without a stated skyline the geometry lane has only the azimuth-gap rule, and a two-sided
//! obstruction (a fjord) leaves untracked satellites on both sides of the vessel: the losses
//! read as the signal environment. With the skyline stated, the satellites behind it are lost
//! to the sky: `sky-blocked` is reported, `open_fraction` is set, and most of the event's
//! deductions move from `environment` to `geometry` (recorded: 78 environment epochs of 624
//! without the skyline, 33 with it; the rest are losses of satellites the stated skyline leaves
//! in the open, which stay `environment`). The score is the same either way. Synthetic data, MODELLED:
//! it shows the rule does what it says on a generated log, not how often a real fjord or
//! terminal is told apart from interference.

use std::path::Path;

use kshana::nmea_synth::config::TrainingScenario;
use kshana::nmea_synth::gen::generate;
use kshana::receiver_trust::geometry::GeometryReason;
use kshana::receiver_trust::monitors::{EpochTrust, Monitor};
use kshana::receiver_trust::scenario::{
    run_receiver_trust, ReceiverTrustResult, ReceiverTrustScenario,
};
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
        .map(|s| {
            s.deductions
                .iter()
                .filter_map(|d| d.class.map(|c| (d.monitor, c)))
                .collect()
        })
        .unwrap_or_default()
}

/// Counts over the event window (300 s to 1080 s, ramp and recovery included) of
/// (epochs with a deduction, of them classed environment, epochs reporting sky-blocked).
fn counts(r: &ReceiverTrustResult) -> (usize, usize, usize) {
    let (mut d, mut env, mut blocked) = (0, 0, 0);
    for e in r
        .epochs
        .iter()
        .filter(|e| (300.0..=1080.0).contains(&e.t_s))
    {
        let c = classes(e);
        if !c.is_empty() {
            d += 1;
        }
        if c.iter().any(|(_, k)| *k == DeductionClass::Environment) {
            env += 1;
        }
        if e.geometry.reasons.contains(&GeometryReason::SkyBlocked) {
            blocked += 1;
        }
    }
    (d, env, blocked)
}

#[test]
fn a_stated_skyline_reads_the_fjord_as_geometry() {
    let log = nmea("fjord-natural-degradation");
    let plain = run(&log, "");
    let sky = run(&log, "\n[skyline]\npreset = \"fjord\"\n");
    let (dp, ep, bp) = counts(&plain);
    let (ds, es, bs) = counts(&sky);
    eprintln!("without skyline: {dp} deducting epochs, {ep} environment, {bp} sky-blocked");
    eprintln!("with skyline:    {ds} deducting epochs, {es} environment, {bs} sky-blocked");
    // The same losses are deducted either way: the skyline changes their class, not the score.
    assert_eq!(dp, ds);
    assert!(dp > 0, "the event must cost something");
    // Stated, the skyline explains the losses: fewer environment-class epochs, and sky-blocked
    // is reported (the fallback azimuth-gap rule sees nothing in a two-sided fjord).
    assert!(
        es < ep,
        "environment epochs {es} with the skyline vs {ep} without"
    );
    assert!(bs > 0 && bp == 0, "sky-blocked {bs} with, {bp} without");
    // Before the event and after recovery the stated skyline costs nothing.
    // Outside the event the stated skyline changes nothing the plain run deducts.
    for (a, b) in plain.epochs.iter().zip(&sky.epochs) {
        if a.t_s < 300.0 || a.t_s > 1080.0 {
            assert_eq!(
                a.score.as_ref().map(|s| s.score),
                b.score.as_ref().map(|s| s.score),
                "t {}",
                a.t_s
            );
            assert_eq!(b.geometry.open_fraction, Some(0.758));
        }
    }
    assert!(plain
        .epochs
        .iter()
        .all(|e| e.geometry.open_fraction.is_none()));
}
