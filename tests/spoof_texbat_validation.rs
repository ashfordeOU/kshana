// SPDX-License-Identifier: AGPL-3.0-only
//! Characterisation of the [`CombinedSpoofDetector`] against the **published TEXBAT scenario
//! parameters** — the Texas Spoofing Test Battery, the de-facto public standard for evaluating
//! GPS signal-authentication techniques (Humphreys, Bhatti, Shepard & Wesson, *"The Texas
//! Spoofing Test Battery: Toward a Standard for Evaluating GPS Signal Authentication
//! Techniques,"* Proc. ION GNSS 2012).
//!
//! ## Honest scope — read this first
//!
//! kshana is a **simulator, not a software-defined receiver** (see CAPABILITY: "a forward
//! simulator, not a receiver/solver"). It does **not** ingest the raw TEXBAT IQ recordings —
//! doing so would need a full acquisition/tracking/correlation front-end kshana does not have.
//! What this test validates is narrower and stated plainly: the combined detector's per-layer
//! response to each scenario's **documented parameters** — the spoofer power advantage (dB), the
//! carrier-phase alignment, and the time-vs-position push class — reproduces the detectability
//! pattern the TEXBAT literature reports. That includes the *negative* results: the
//! carrier-phase-aligned, matched-power scenario (ds7) defeats every RF/measurement layer here,
//! exactly as the literature documents, and is left to the clock-aided time-drift monitor
//! (`kshana::spoof`) or cryptographic authentication. Validation against the **raw** vectors
//! (TEXBAT IQ, or a licensed Spirent scenario) needs that external front-end / dataset and
//! remains a documented follow-on.
//!
//! The point is to pin the detector to a recognised public reference and to be exact about what
//! "validated" means — not to claim raw-signal fidelity the architecture cannot support.

use kshana::spoof_monitors::{combine_power_dbm, CombinedSpoofDetector, SpoofEpoch};

/// The push class of a spoofing scenario, which determines the RAIM-layer response.
#[derive(Clone, Copy, Debug, PartialEq, Eq)]
enum Push {
    /// No spoofing (the clean ds0 baseline).
    None,
    /// A common-mode time push: every pseudorange biased equally — absorbed by the receiver
    /// clock state, so RAIM is blind to it (the honest limit of any RAIM detector).
    Time,
    /// A position push: a *subset* of pseudoranges biased inconsistently — geometrically
    /// detectable by the RAIM parity test.
    Position,
}

/// One TEXBAT scenario reduced to its published, detector-relevant parameters, plus the
/// per-layer response the literature documents (the expectation this test asserts).
struct TexbatCase {
    id: &'static str,
    desc: &'static str,
    /// Spoofer power advantage over the authentic signal aggregate, dB (TEXBAT records range
    /// from ~0.4 dB "matched power" to ~10 dB "overpowered").
    power_adv_db: f64,
    /// Whether the spoofer is carrier-phase aligned with the authentic signal. A non-aligned
    /// spoofer must drag the correlation peak, distorting the Early/Late balance (an SQM hit);
    /// a carrier-aligned spoofer leaves a near-symmetric peak (no SQM signature).
    carrier_aligned: bool,
    push: Push,
    expect_agc: bool,
    expect_sqm: bool,
    expect_raim: bool,
    expect_fused_alert: bool,
}

/// The eight-satellite line-of-sight geometry the parity test runs on (well spread for good
/// conditioning), each row `[eₓ, e_y, e_z, 1]` with the trailing receiver-clock column.
fn geometry8() -> Vec<[f64; 4]> {
    let azels = [
        (0.0, 80.0),
        (45.0, 30.0),
        (100.0, 55.0),
        (150.0, 20.0),
        (200.0, 60.0),
        (255.0, 25.0),
        (300.0, 45.0),
        (340.0, 15.0),
    ];
    azels
        .iter()
        .map(|&(az, el): &(f64, f64)| {
            let (a, e) = (az.to_radians(), el.to_radians());
            [e.cos() * a.sin(), e.cos() * a.cos(), e.sin(), 1.0]
        })
        .collect()
}

/// Encode a scenario's published parameters as one [`SpoofEpoch`]. The mapping is deliberately
/// transparent: power advantage → AGC excess; carrier alignment → SQM Early/Late balance; push
/// class → RAIM residual structure. Nominal floor is eight SVs at −130 dBm.
fn epoch_for(case: &TexbatCase) -> (SpoofEpoch, f64) {
    let g = geometry8();
    let floor = combine_power_dbm(&[-130.0; 8]);

    // A consistent residual set from a chosen true state (RAIM statistic ≈ 0 unless perturbed).
    let x_true = [9.0, -4.0, 6.0, 25.0];
    let mut residuals: Vec<f64> = g
        .iter()
        .map(|row| (0..4).map(|a| row[a] * x_true[a]).sum())
        .collect();
    match case.push {
        Push::None => {}
        // Common-mode bias on every pseudorange (RAIM-invisible by construction).
        Push::Time => residuals.iter_mut().for_each(|z| *z += 250.0),
        // Bias a subset of three satellites by ~15σ each: geometrically inconsistent.
        Push::Position => {
            for k in [1usize, 4, 6] {
                residuals[k] += 75.0;
            }
        }
    }

    // Carrier-phase alignment sets the correlation-peak symmetry. Aligned ⇒ symmetric taps
    // (R(0.1) = 0.9 each); non-aligned ⇒ a ~12 % Early/Late imbalance from the dragged peak.
    let (early, late) = if case.carrier_aligned {
        (0.9, 0.9)
    } else {
        (1.0, 0.78)
    };

    let epoch = SpoofEpoch {
        geometry: g,
        residuals,
        sigma_m: 5.0,
        measured_dbm: floor + case.power_adv_db,
        early,
        late,
    };
    (epoch, floor)
}

/// The TEXBAT scenarios this characterisation covers, with the published parameters and the
/// documented detectability outcome. Power-advantage figures are the representative values
/// reported for the records (matched-power ≈ 0.4–1.3 dB, overpowered ≈ 10 dB); the AGC margin
/// is the conventional 3 dB, so only the overpowered scenario crosses it.
fn texbat_cases() -> Vec<TexbatCase> {
    vec![
        TexbatCase {
            id: "ds0",
            desc: "clean (no spoofing) baseline",
            power_adv_db: 0.0,
            carrier_aligned: true,
            push: Push::None,
            expect_agc: false,
            expect_sqm: false,
            expect_raim: false,
            expect_fused_alert: false,
        },
        TexbatCase {
            id: "ds2",
            desc: "static overpowered time push (~10 dB advantage)",
            power_adv_db: 10.0,
            carrier_aligned: false,
            push: Push::Time,
            expect_agc: true,         // 10 dB ≫ 3 dB margin
            expect_sqm: true,         // non-aligned peak drag
            expect_raim: false,       // common-mode time push is RAIM-invisible
            expect_fused_alert: true, // AGC + SQM corroborate (0.3 + 0.2 = 0.5)
        },
        TexbatCase {
            id: "ds3",
            desc: "static matched-power time push (~1.3 dB advantage)",
            power_adv_db: 1.3,
            carrier_aligned: false,
            push: Push::Time,
            expect_agc: false, // 1.3 dB < 3 dB margin: power-only detectors miss it
            expect_sqm: true,  // SQM still catches the dragged peak
            expect_raim: false,
            // Single-layer (SQM) detection only — below the conservative fused threshold, which
            // requires corroboration. The operator still sees the SQM diagnostic. This matches
            // TEXBAT's finding that ds3 challenges power-based authentication.
            expect_fused_alert: false,
        },
        TexbatCase {
            id: "ds4",
            desc: "static matched-power position push (~0.4 dB advantage)",
            power_adv_db: 0.4,
            carrier_aligned: false,
            push: Push::Position,
            expect_agc: false,
            expect_sqm: true,
            expect_raim: true, // a position push biases a subset → RAIM fires
            expect_fused_alert: true, // RAIM + SQM (0.5 + 0.2)
        },
        TexbatCase {
            id: "ds7",
            desc: "matched-power, carrier-phase-aligned time push (the hard case)",
            power_adv_db: 0.4,
            carrier_aligned: true,
            push: Push::Time,
            expect_agc: false,  // matched power
            expect_sqm: false,  // carrier-aligned: no correlation distortion
            expect_raim: false, // common-mode time push
            // The documented worst case: it defeats every RF/measurement layer here and is left
            // to the clock-aided time-drift monitor (kshana::spoof) or cryptographic auth.
            expect_fused_alert: false,
        },
    ]
}

#[test]
fn combined_detector_reproduces_texbat_detectability_pattern() {
    let cases = texbat_cases();
    for case in &cases {
        let (epoch, _floor) = epoch_for(case);
        let det = CombinedSpoofDetector::new(epoch.measured_dbm - case.power_adv_db);
        let d = det.evaluate(&epoch);
        let raim_alert = d.raim.map(|r| r.alert).unwrap_or(false);

        eprintln!(
            "TEXBAT {} ({}): AGC={} SQM={} RAIM={} fused={}  [excess {:+.1} dB, E/L {:.3}]",
            case.id,
            case.desc,
            d.fused.layers.agc,
            d.fused.layers.sqm,
            raim_alert,
            d.fused.alert,
            d.agc_excess_db,
            d.sqm_el_metric,
        );

        assert_eq!(
            d.fused.layers.agc, case.expect_agc,
            "{}: AGC layer response differs from the documented expectation",
            case.id
        );
        assert_eq!(
            d.fused.layers.sqm, case.expect_sqm,
            "{}: SQM layer response differs from the documented expectation",
            case.id
        );
        assert_eq!(
            raim_alert, case.expect_raim,
            "{}: RAIM layer response differs from the documented expectation",
            case.id
        );
        assert_eq!(
            d.fused.alert, case.expect_fused_alert,
            "{}: fused decision differs from the documented expectation",
            case.id
        );
    }

    // The battery as a whole must exercise every layer: at least one scenario each where AGC,
    // SQM, and RAIM are the firing evidence — otherwise the "combined" claim is hollow.
    assert!(cases.iter().any(|c| c.expect_agc), "no AGC-driven scenario");
    assert!(cases.iter().any(|c| c.expect_sqm), "no SQM-driven scenario");
    assert!(
        cases.iter().any(|c| c.expect_raim),
        "no RAIM-driven scenario"
    );
    // And the clean baseline must stay quiet (no false alert on ds0).
    assert!(
        !cases[0].expect_fused_alert && cases[0].id == "ds0",
        "ds0 clean baseline must not alert"
    );
}
