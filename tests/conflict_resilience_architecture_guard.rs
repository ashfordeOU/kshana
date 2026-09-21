// SPDX-License-Identifier: AGPL-3.0-only
//! Finding F36, made executable: the configuration the conflict-resilience pack actually
//! runs is a TERRESTRIAL, all-radio one, and it is not the architecture the P7 manuscript
//! describes.
//!
//! ## The finding
//!
//! P7's Table 1 names four *lunar* layers and gives their receive paths: Earth-GNSS at
//! lunar distance (space radio), a lunar orbital service (space radio), surface beacons
//! (local radio), and an onboard inertial navigator with optical terrain reference whose
//! receive path is stated as **none** and whose only denial vector is **cyber**.
//!
//! The engine's `conflict_baseline()` is `threat_catalog().take(4)`: GNSS L1 C/A, GNSS
//! L5/E5a, Galileo E1 OS + OSNMA, and SBAS. Four terrestrial layers, every one of them
//! radio, every one of them jam-susceptible. The catalog *does* hold an RF-immune inertial
//! entry — it sits at index 4, so `take(4)` excludes it structurally.
//!
//! The paper's §4.2 argument rests on that fourth layer being immune to the shared RF
//! vector. The configuration that produced the numbers has no such layer in it.
//!
//! ## How much it matters
//!
//! Not a rounding difference. Measured by adding the catalog's RF-immune inertial entry to
//! the baseline and re-running the closed form: the resilience ratio goes from the 6.732
//! the paper prints to **1684**, a factor of about 250. The reason is visible in the
//! per-layer loss probabilities — the four radio layers sit at 0.527, 0.525, 0.529, 0.535,
//! and the inertial layer at 0.004. Layering buys little when every layer fails together
//! and a great deal when one does not, which is precisely what P7 argues in prose and what
//! its own configuration does not contain.
//!
//! ## Why a test and not a note
//!
//! This was written up in a document first. A document does not fail a build, and the
//! reproduction harness passes either way because the released CSV carries only
//! aggregates and no per-layer rows — the one artefact that would have exposed it is the
//! per-layer prior table the engine can emit and the paper does not print.
//!
//! So the mismatch is pinned here instead. These tests assert what is TRUE TODAY. They
//! are expected to be *changed* by the repair, not deleted: when a lunar layer set exists,
//! the assertions about the baseline's homogeneity move to it and the exclusion assertion
//! goes away. Until then the build states the gap out loud every run.
//!
//! ## What the repair needs, and why it is not done here
//!
//! Two of P7's four layers have no honest engine-derived prior yet, and inventing one
//! would reproduce the exact defect this file records:
//!
//! * **Earth-GNSS at lunar distance** — no such capability exists in the engine at all.
//!   Searching by symbol finds only antenna-aperture and PRN-autocorrelation sidelobes;
//!   there is no weak-signal-at-lunar-range model and no LuGRE anywhere.
//! * **Surface beacons as an INDEPENDENT layer** — `lunar-beacon` reports the augmented
//!   solution (satellites plus beacons), not the beacons alone, and on the bundled
//!   geometry only one beacon clears the horizon, so the layer cannot produce a fix by
//!   itself. A four-source minimum is arithmetic, not a tuning choice.
//!
//! The two that ARE cleanly sourced are recorded in
//! [`the_lunar_priors_the_engine_can_already_source`], so the repair starts from measured
//! ground rather than from a fresh guess.

use kshana::conflict_threat_params::{conflict_baseline, threat_catalog};

#[test]
fn the_configuration_backing_p7_is_terrestrial_and_uniformly_radio() {
    let base = conflict_baseline();
    assert_eq!(base.len(), 4, "P7 describes a four-layer architecture");

    // Every layer the engine actually runs is radio-borne and jam-susceptible. P7's Table 1
    // says one of its four has no receive path at all.
    for p in &base {
        assert!(
            p.vector_profile.jamming > 0.5,
            "{}: jamming susceptibility {:.2}. Every layer in the configuration that \
             produced P7's numbers is jam-susceptible, which is the finding — the paper's \
             fourth layer is an inertial navigator with no radio receive path.",
            p.layer,
            p.vector_profile.jamming
        );
    }

    // And none of them is the paper's RF-immune layer.
    let rf_immune: Vec<&str> = base
        .iter()
        .filter(|p| p.vector_profile.jamming == 0.0 && p.vector_profile.spoofing == 0.0)
        .map(|p| p.layer)
        .collect();
    assert!(
        rf_immune.is_empty(),
        "an RF-immune layer has appeared in conflict_baseline(): {rf_immune:?}. If the \
         lunar repair has landed, this file is now describing history — move the \
         homogeneity assertions onto the terrestrial set and delete the exclusion test."
    );
}

#[test]
fn the_catalogs_one_rf_immune_layer_is_excluded_by_construction() {
    let catalog = threat_catalog();
    let immune: Vec<(usize, &str)> = catalog
        .iter()
        .enumerate()
        .filter(|(_, p)| p.vector_profile.jamming == 0.0 && p.vector_profile.spoofing == 0.0)
        .map(|(i, p)| (i, p.layer))
        .collect();

    assert_eq!(
        immune.len(),
        1,
        "the catalog should hold exactly one RF-immune layer; found {immune:?}"
    );
    let (idx, name) = immune[0];
    assert!(
        idx >= 4,
        "the RF-immune layer {name:?} is at catalog index {idx}, so conflict_baseline()'s \
         take(4) would now include it. That would change P7's numbers — check whether the \
         repair landed deliberately."
    );

    // Say the exclusion out loud: the baseline is a prefix, and the immune layer is past it.
    let base = conflict_baseline();
    assert!(
        !base.iter().any(|p| p.layer == name),
        "{name:?} must not be in the baseline while this finding stands"
    );
}

/// The reason the numbers were never questioned: they are arithmetically consistent with
/// the terrestrial layers. Reproducing that here is what makes the finding a finding
/// rather than a suspicion — the paper's printed ratio comes from THIS layer set.
#[test]
fn the_terrestrial_layers_reproduce_the_papers_printed_ratio() {
    let base = conflict_baseline();

    // Total-loss probability of each layer at unit threat intensity, the closed form the
    // paper's Equation (1) uses: p_i = 1 - availability_i * (1 - vulnerability_i * weight_i).
    let p: Vec<f64> = base
        .iter()
        .map(|l| 1.0 - l.availability * (1.0 - l.vulnerability_nominal * l.vector_weight))
        .collect();

    let layered: f64 = p.iter().product();
    let single = p[0];
    let ratio = single / layered;

    // P7 prints 6.732. Reproduced from the four TERRESTRIAL layers to four significant
    // figures — which is the point: the published ratio is a property of this layer set,
    // not of the lunar architecture Table 1 describes.
    assert!(
        (ratio - 6.732).abs() < 5e-3,
        "the terrestrial layer set no longer reproduces the ratio P7 prints (6.732); got \
         {ratio:.6} from per-layer losses {p:?}. Either the priors moved or the repair \
         landed — both change what this file should say."
    );
}

/// The lunar priors the engine can already source, each a direct read of a named field of
/// a runnable scenario. Recorded so the repair starts from measurement.
///
/// This test deliberately asserts only the two that are clean. The other two layers of
/// P7's Table 1 are named in this file's header with what each would need; neither is
/// guessed here.
#[test]
fn the_lunar_priors_the_engine_can_already_source() {
    use kshana::api::run_toml;

    // Layer: lunar orbital navigation service. Availability and the ranging error are
    // direct reads; the jamming susceptibility comes from the separate jamming scenario.
    let svc: serde_json::Value = serde_json::from_str(
        &run_toml(include_str!("../scenarios/moonlight-service-volume.toml"))
            .expect("moonlight-service-volume must run")
            .json,
    )
    .expect("valid JSON");
    let coverage = svc["coverage_pct"].as_f64().expect("coverage_pct");
    let sigma_ure = svc["sigma_ure_m"].as_f64().expect("sigma_ure_m");
    let pl_avail = svc["pl_availability_pct"]
        .as_f64()
        .expect("pl_availability_pct");
    assert!(
        (coverage - 37.847_222_222_222_22).abs() < 1e-9,
        "orbital-service coverage moved: {coverage}"
    );
    assert!(
        (sigma_ure - 30.0).abs() < 1e-12,
        "orbital-service sigma_URE moved: {sigma_ure}"
    );
    assert_eq!(
        pl_avail, 0.0,
        "the orbital service's protection-level availability at the stated alert limit is \
         0 %, which is the honest headline for this layer and must not drift silently"
    );

    // The same layer under a 10 W jammer: availability collapses to zero. This is the
    // measured jamming susceptibility, not an allocation.
    let jam: serde_json::Value = serde_json::from_str(
        &run_toml(include_str!("../scenarios/lunar-jamming.toml"))
            .expect("lunar-jamming must run")
            .json,
    )
    .expect("valid JSON");
    let nominal = jam["fom"]["availability_nominal"]
        .as_f64()
        .expect("nominal");
    let jammed = jam["fom"]["availability_under_jamming"]
        .as_f64()
        .expect("jammed");
    assert!(nominal > 0.0, "the nominal availability must be non-zero");
    assert_eq!(
        jammed, 0.0,
        "the orbital RF layer is fully denied under the modelled jammer (nominal \
         {nominal}); a susceptibility of 1.0 for this layer is measured, not allocated"
    );

    // Layer: onboard inertial with terrain reference. Bounded error over the mission, and
    // no radio receive path — the one P7 layer the terrestrial baseline has no analogue for.
    let ins: serde_json::Value = serde_json::from_str(
        &run_toml(include_str!("../scenarios/ins-trn-coast.toml"))
            .expect("ins-trn-coast must run")
            .json,
    )
    .expect("valid JSON");
    let peak = ins["trn"]["peak_error_m"].as_f64().expect("peak_error_m");
    let duration = ins["trn"]["mission_duration_s"]
        .as_f64()
        .expect("mission_duration_s");
    assert!(
        (peak - 52.932_679_010_653_31).abs() < 1e-9,
        "the inertial/TRN peak error moved: {peak}"
    );
    assert!(
        (duration - 1200.0).abs() < 1e-12,
        "the mission duration this peak is over moved: {duration}"
    );
}
