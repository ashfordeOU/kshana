// SPDX-License-Identifier: AGPL-3.0-only
//! CAP-06 (c): the `jamming` kind's optional `[acquisition]` and `[front_end]` sections against
//! the bars of `docs/design/evidence/jamming-acq-agc/PREREGISTRATION.md` (committed before the
//! code existed).
//!
//! H2: no hysteresis is no hysteresis. H3: an independent Python recomputation of every link's
//! `acquired` flag (`xval/jamming-acq-agc/hysteresis.py`, given only the per-epoch visible links
//! and their effective C/N0 exported by `export_hysteresis_inputs`), with its informativeness
//! condition. H4: monotone in the acquisition threshold. G2: the quantiser loss against an
//! independent numpy Monte Carlo (`xval/jamming-acq-agc/quantiser_mc.py`). G3: the AGC reading
//! against the IQ layer's AGC loop. H1/G1 (additivity) is the units test here, the unchanged
//! jamming tests and goldens, and the before/after scenario run recorded in `RESULTS.md`.
//!
//! PIN-SCOPE:    the acquisition flags of the four registered runs, the quantiser loss and the
//!               AGC reading against their oracles.
//! PIN-EXCLUDES: the acquisition search itself and AGC dynamics in time (out of scope).

use kshana::iq::frontend::agc::Agc;
use kshana::iq::frontend::Stage;
use kshana::jamming::{run_jamming, JammingResult, JammingScenario};
use kshana::sdr::Cf64;
use rand::SeedableRng;
use rand_chacha::ChaCha8Rng;
use rand_distr::{Distribution, StandardNormal};

const DEMO: &str = include_str!("../scenarios/jamming-demo.toml");
const POWERS: [f64; 4] = [10.0, 20.0, 25.0, 30.0];
/// The informative run set of `PREREGISTRATION-SUPPLEMENT-1.md` (37793290).
const POWERS_S1: [f64; 4] = [-40.0, -35.0, -30.0, -25.0];
const TRACKING: f64 = 25.0;

fn scenario(power_dbw: f64, extra: &str) -> JammingScenario {
    let mut s: JammingScenario = toml::from_str(&format!("{DEMO}\n{extra}")).unwrap();
    assert_eq!(s.tracking_threshold_dbhz, TRACKING);
    s.jammer.as_mut().unwrap().power_dbw = power_dbw;
    s
}

fn acquisition(acq: f64, delay: f64) -> String {
    format!(
        "[acquisition]\nacquisition_threshold_dbhz = {acq:?}\nreacquisition_delay_s = {delay:?}\n"
    )
}

fn run(s: &JammingScenario) -> JammingResult {
    run_jamming(s).unwrap()
}

/// H2: with the acquisition threshold at the tracking threshold and no delay, `acquired` is
/// exactly "not lost" on every link of the four runs.
#[test]
fn h2_no_hysteresis_is_no_hysteresis() {
    h2(&POWERS);
}

/// H2-S: H2 on the supplementary runs.
#[test]
fn h2s_no_hysteresis_is_no_hysteresis_on_the_supplementary_runs() {
    h2(&POWERS_S1);
}

fn h2(powers: &[f64]) {
    for &p in powers {
        let r = run(&scenario(p, &acquisition(TRACKING, 0.0)));
        for e in &r.epochs {
            for l in &e.sats {
                assert_eq!(
                    l.acquired,
                    Some(l.status != "LOST"),
                    "{p} dBW t={} prn {}",
                    e.t,
                    l.prn
                );
            }
        }
    }
}

/// Writes `xval/jamming-acq-agc/inputs.json` (the registered runs) and `inputs_s1.json` (the
/// supplementary runs) for `hysteresis.py`: per run, the per-epoch visible links and their
/// effective C/N0, with the thresholds, the delay and the step.
#[test]
#[ignore = "fixture export for xval/jamming-acq-agc/hysteresis.py; run on demand"]
fn export_hysteresis_inputs() {
    export(&POWERS, "inputs.json");
    export(&POWERS_S1, "inputs_s1.json");
}

fn export(powers: &[f64], name: &str) {
    let runs: Vec<serde_json::Value> = powers
        .iter()
        .map(|&p| {
            let r = run(&scenario(p, &acquisition(32.0, 60.0)));
            let epochs: Vec<serde_json::Value> = r
                .epochs
                .iter()
                .map(|e| {
                    let links: Vec<(usize, f64)> = e
                        .sats
                        .iter()
                        .map(|l| (l.prn, l.cn0_effective_dbhz))
                        .collect();
                    serde_json::json!({"t": e.t, "links": links})
                })
                .collect();
            serde_json::json!({"jammer_power_dbw": p, "epochs": epochs})
        })
        .collect();
    let doc = serde_json::json!({
        "acquisition_threshold_dbhz": 32.0, "tracking_threshold_dbhz": TRACKING,
        "reacquisition_delay_s": 60.0, "step_s": scenario(10.0, "").time.step_s, "runs": runs,
    });
    let path = format!("{}/xval/jamming-acq-agc/{name}", env!("CARGO_MANIFEST_DIR"));
    std::fs::write(path, serde_json::to_string(&doc).unwrap()).unwrap();
}

/// H3: every `acquired` flag of the four runs equals the independent recomputation, and the
/// informativeness condition gives the recorded verdict (NOT MET: uninformative).
#[test]
fn h3_flags_match_the_independent_recomputation() {
    let differing = h3(
        include_str!("../xval/jamming-acq-agc/expected_hysteresis.json"),
        &POWERS,
    );
    // The recorded verdict (RESULTS.md): every flag agrees, but on the registered runs every
    // link is lost (effective C/N0 from -30 to -7 dB-Hz), so no link shows the hysteresis and
    // H3 is NOT MET as uninformative under its own registered condition.
    assert_eq!(differing, [0, 0, 0, 0], "the recorded H3 verdict moved");
}

/// H3-S: H3 on the supplementary runs, with the same informativeness condition.
#[test]
fn h3s_flags_match_the_independent_recomputation_on_the_supplementary_runs() {
    let differing = h3(
        include_str!("../xval/jamming-acq-agc/expected_hysteresis_s1.json"),
        &POWERS_S1,
    );
    assert!(
        differing.iter().any(|&n| n > 0),
        "H3-S uninformative: no link shows the hysteresis"
    );
}

/// Every flag of the runs at `powers` against the recomputation in `expected`; returns, per
/// run, the number of links whose `acquired` differs from "not lost".
fn h3(expected: &str, powers: &[f64]) -> Vec<usize> {
    let expected: serde_json::Value = serde_json::from_str(expected).unwrap();
    let runs = expected["runs"].as_array().unwrap();
    assert_eq!(runs.len(), powers.len());
    let mut differing = Vec::new();
    for (run_x, &p) in runs.iter().zip(powers) {
        assert_eq!(run_x["jammer_power_dbw"].as_f64().unwrap(), p);
        let r = run(&scenario(p, &acquisition(32.0, 60.0)));
        let got: Vec<(f64, usize, bool, bool)> = r
            .epochs
            .iter()
            .flat_map(|e| {
                e.sats
                    .iter()
                    .map(move |l| (e.t, l.prn, l.acquired.unwrap(), l.status != "LOST"))
            })
            .collect();
        let flags = run_x["flags"].as_array().unwrap();
        assert_eq!(flags.len(), got.len(), "{p} dBW: link count");
        for (f, (t, prn, acq, _)) in flags.iter().zip(&got) {
            assert_eq!(f[0].as_f64().unwrap(), *t);
            assert_eq!(f[1].as_u64().unwrap() as usize, *prn);
            assert_eq!(f[2].as_bool().unwrap(), *acq, "{p} dBW t={t} prn {prn}");
        }
        let n = got
            .iter()
            .filter(|(_, _, a, tracking)| a != tracking)
            .count();
        let acquired = got.iter().filter(|g| g.2).count();
        eprintln!(
            "H3 {p} dBW: {} links, {acquired} acquired, {n} with acquired != not-lost",
            got.len()
        );
        differing.push(n);
    }
    differing
}

/// H4: raising the acquisition threshold never raises any epoch's acquired count.
#[test]
fn h4_monotone_in_the_acquisition_threshold() {
    h4(&POWERS);
}

/// H4-S: H4 on the supplementary runs.
#[test]
fn h4s_monotone_in_the_acquisition_threshold_on_the_supplementary_runs() {
    h4(&POWERS_S1);
}

fn h4(powers: &[f64]) {
    for &p in powers {
        let counts: Vec<Vec<usize>> = [25.0, 28.0, 32.0, 36.0, 40.0]
            .iter()
            .map(|&a| {
                run(&scenario(p, &acquisition(a, 60.0)))
                    .epochs
                    .iter()
                    .map(|e| e.acquired.unwrap())
                    .collect()
            })
            .collect();
        for w in counts.windows(2) {
            for (i, (lo, hi)) in w[0].iter().zip(&w[1]).enumerate() {
                assert!(hi <= lo, "{p} dBW epoch {i}: {hi} > {lo}");
            }
        }
        let total = |c: &Vec<usize>| c.iter().sum::<usize>();
        eprintln!(
            "H4 {p} dBW: acquired link-epochs {:?}",
            counts.iter().map(total).collect::<Vec<_>>()
        );
    }
}

fn front_end(bits: u32) -> String {
    format!("[front_end]\nadc_bits = {bits}\n")
}

/// G2: the engine's quantiser loss within 0.02 dB of each of the twelve Monte Carlo estimates.
#[test]
fn g2_quantiser_loss_matches_the_independent_monte_carlo() {
    let expected: serde_json::Value = serde_json::from_str(include_str!(
        "../xval/jamming-acq-agc/expected_quantiser.json"
    ))
    .unwrap();
    let rows = expected["gaussian"].as_array().unwrap();
    assert_eq!(rows.len(), 12);
    let mut worst = 0.0f64;
    for row in rows {
        let bits = row["adc_bits"].as_u64().unwrap() as u32;
        let r = run(&scenario(10.0, &front_end(bits)));
        let got = r.front_end.as_ref().unwrap().quantiser_loss_db;
        let mc = row["mc_loss_db"].as_f64().unwrap();
        eprintln!(
            "G2 {bits} bits J/N {}: engine {got:.4} dB, Monte Carlo {mc:.4} dB",
            row["jn_db"]
        );
        worst = worst.max((got - mc).abs());
        assert!((got - mc).abs() <= 0.02, "{bits} bits: {got} vs {mc}");
    }
    eprintln!("G2: worst difference {worst:.4} dB");
}

/// The engine's J/N (dB) of the demo jammer at `power_dbw`, read back from its AGC reading.
fn engine_jn_db(power_dbw: f64) -> f64 {
    let r = run(&scenario(power_dbw, &front_end(2)));
    let red = r.front_end.unwrap().agc_gain_reduction_db;
    10.0 * (10f64.powf(red / 10.0) - 1.0).log10()
}

/// The IQ layer's AGC loop on Gaussian noise plus a Gaussian jammer of `jn_db`: its mean gain
/// (dB) over the last half of 2^20 samples at 4 MHz with a 1 ms time constant.
fn agc_loop_gain_db(jn_db: Option<f64>, seed: u64) -> f64 {
    let n = 1 << 20;
    let mut rng = ChaCha8Rng::seed_from_u64(seed);
    let scale = jn_db.map_or(1.0, |j| (1.0 + 10f64.powf(j / 10.0)).sqrt());
    // Noise plus an independent Gaussian jammer is Gaussian with the summed power.
    let mut block: Vec<Cf64> = (0..n)
        .map(|_| {
            let re: f64 = StandardNormal.sample(&mut rng);
            let im: f64 = StandardNormal.sample(&mut rng);
            Cf64 {
                re: re * scale / 2f64.sqrt(),
                im: im * scale / 2f64.sqrt(),
            }
        })
        .collect();
    let mut agc = Agc::new(4e6, 1e-3, 1.0, 1.0);
    let mut sum = 0.0;
    for (k, chunk) in block.chunks_mut(1024).enumerate() {
        agc.process(chunk);
        if k * 1024 >= n / 2 {
            sum += agc.gain_db();
        }
    }
    sum / (n / 2 / 1024) as f64
}

/// G3: the engine's AGC reading within 0.05 dB of the IQ-layer AGC loop at J/N 0 to 40 dB.
#[test]
fn g3_agc_reading_matches_the_iq_layer_agc_loop() {
    let base_jn = engine_jn_db(10.0);
    let quiet = agc_loop_gain_db(None, 1);
    for (k, target) in [0.0, 10.0, 20.0, 30.0, 40.0].into_iter().enumerate() {
        let power = 10.0 + target - base_jn;
        let r = run(&scenario(power, &front_end(2)));
        let engine = r.front_end.unwrap().agc_gain_reduction_db;
        let jn = engine_jn_db(power);
        let looped = quiet - agc_loop_gain_db(Some(jn), 10 + k as u64);
        eprintln!("G3 J/N {jn:.6} dB: engine {engine:.4} dB, AGC loop {looped:.4} dB");
        assert!(
            (engine - looped).abs() <= 0.05,
            "J/N {jn}: {engine} vs {looped}"
        );
    }
}

/// H1/G1 (units): each section's units appear only with it.
#[test]
fn h1_g1_units_only_with_their_section() {
    let units = |extra: &str| {
        let out = kshana::api::run_toml(&format!("{DEMO}\n{extra}")).unwrap();
        let v: serde_json::Value = serde_json::from_str(&out.json).unwrap();
        v["units"].clone()
    };
    let plain = units("");
    for p in ["epochs[].acquired", "front_end.quantiser_loss_db"] {
        assert!(plain.get(p).is_none(), "{p}");
    }
    let with = units(&format!("{}{}", acquisition(32.0, 60.0), front_end(2)));
    assert_eq!(with["epochs[].acquired"]["unit"], "count");
    assert_eq!(with["fom.availability_acquired"]["unit"], "1");
    assert_eq!(with["front_end.quantiser_loss_db"]["unit"], "dB");
    assert_eq!(with["front_end.agc_gain_reduction_db"]["unit"], "dB");
}

/// Invalid sections are errors through the API.
#[test]
fn invalid_sections_are_errors() {
    for bad in [
        acquisition(20.0, 0.0),
        acquisition(32.0, -1.0),
        front_end(0),
        front_end(17),
    ] {
        match kshana::api::run_toml(&format!("{DEMO}\n{bad}")) {
            Ok(_) => panic!("accepted: {bad}"),
            Err(e) => assert!(e.contains("acquisition") || e.contains("front_end"), "{e}"),
        }
    }
}
