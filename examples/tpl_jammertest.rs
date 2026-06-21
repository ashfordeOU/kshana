// SPDX-License-Identifier: AGPL-3.0-only
//! **Timing Protection Level calibrated on a real recorded spoofing attack.**
//!
//! All numbers below are derived from the public JammerTest 2024 campaign dataset
//! ("GNSS Dataset Under Jamming, Spoofing, and Meaconing Conditions", Zenodo
//! record 15911589, CC/GPL), scenario 2.1.1 -- a real over-the-air GNSS spoof of a
//! survey-grade u-blox ZED-F9P timing receiver at Bleik/Andoya, Norway. The raw
//! dataset is not redistributed here; only the scalars recovered from it are, with
//! provenance. They were obtained by solving the receiver clock-bias trajectory
//! from the recorded L1 pseudoranges, the receiver's own clean dual-band position,
//! and IGS broadcast ephemeris (per-satellite agreement ~7 m in clean epochs).
//!
//! The point: the attack pulled the receiver's *served time* by about 1.01 ms while
//! the receiver kept reporting a healthy 3-D fix with a self-reported time accuracy
//! of at most ~51 ns -- a roughly 20000x gap between claimed and actual integrity.
//! Given detection by a model-free cross-check, a clock-aided holdover bounds the
//! *undetected* time error to the Timing Protection Level, far below that silent
//! 1 ms. (There is no finite UNconditional bound: a slow enough ramp evades a single
//! clock-aided monitor; the TPL is the conditional, holdover-limited error.)
//!
//! Run: `cargo run --example tpl_jammertest`

use kshana::clock_state::q_from_allan;
use kshana::tpl::{timing_protection_level_ns, tpl_band, TplInputs};

// --- Real measured constants (JammerTest 2024, scenario 2.1.1) ---------------
/// Receiver clock white-FM Allan deviation at tau = 1 s, measured on the clean
/// pre-attack segment (overlapping ADEV of the solved clock residual).
const ADEV_1S: f64 = 2.8e-9;
/// Served time error at full spoofer capture (holdover-referenced), ns.
const OBSERVED_PULL_NS: f64 = 1_010_923.0;
/// Receiver's own self-reported time accuracy during the capture, ns.
const CLAIMED_TACC_NS: f64 = 51.0;
/// Clean cross-satellite clock-consistency 1-sigma (the realised monitor floor), ns.
const MONITOR_CONSISTENCY_NS: f64 = 22.1;

fn main() {
    // White-FM from the measured ADEV; the long-tau red-noise floor is not
    // observable in a ~12 min clean window, so it is swept as a band (below).
    let (q_wf, q_rw, q_drift) = q_from_allan(ADEV_1S, 4.4e-10, 1.0e-11);

    // Monitor: k = 5 sigma alarm on the measured ~22 ns clock-consistency floor.
    let base = TplInputs {
        q_wf,
        q_rw,
        q_drift,
        r: (MONITOR_CONSISTENCY_NS * 1e-9).powi(2), // per-sample phase variance, s^2
        tau: 1.0,
        samples: 1.0,
        k: 5.0,
        detection_latency_s: 1.0,
    };

    println!("Timing Protection Level -- calibrated on JammerTest 2024 scenario 2.1.1");
    println!("  receiver clock ADEV(1 s)      : {:.1e}", ADEV_1S);
    println!(
        "  OBSERVED uncontrolled pull    : {:.0} ns ({:.2} ms)  <- silently served",
        OBSERVED_PULL_NS,
        OBSERVED_PULL_NS / 1e6
    );
    println!(
        "  receiver CLAIMED accuracy     : <= {:.0} ns  (gap {:.0}x)",
        CLAIMED_TACC_NS,
        OBSERVED_PULL_NS / CLAIMED_TACC_NS
    );
    println!("  conditional TPL vs detection latency (given model-free detection + holdover):");
    for lat in [1.0, 5.0, 10.0, 30.0, 60.0] {
        let inp = TplInputs {
            detection_latency_s: lat,
            ..base
        };
        let tpl = timing_protection_level_ns(&inp);
        println!(
            "    latency {:5.0} s  ->  TPL {:8.0} ns   ({:.0}x below the uncontrolled pull)",
            lat,
            tpl,
            OBSERVED_PULL_NS / tpl
        );
    }
    let band = tpl_band(
        &TplInputs {
            detection_latency_s: 30.0,
            ..base
        },
        1.0,
    );
    println!(
        "  red-noise-floor band @30 s    : [{:.0}, {:.0}, {:.0}] ns (low, nominal, high; +/-1 decade)",
        band.low_ns, band.nominal_ns, band.high_ns
    );
    println!(
        "  => even at a 60 s coast the conditional bound is far below the 1.01 ms the\n     receiver accepted while reporting <= 51 ns: the protection is the holdover,\n     not the receiver's own (untrustworthy) integrity flag."
    );
}
