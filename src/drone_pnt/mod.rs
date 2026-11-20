// SPDX-License-Identifier: AGPL-3.0-only
//! Drone, UTM and robotics PNT tools: `kshana drone ...` (docs/DRONE-PNT.md).
//!
//! * [`prearm`]: a pre-arm GNSS spoofing and jamming check that fuses the receiver's own flags
//!   (jamming and spoofing states, jamming indicator, AGC, authentication state) with the
//!   kinematics of a vehicle standing on the ground (drift, reported speed, jumps, receiver
//!   disagreement, clock steps), from a PX4 ULog, an ArduPilot DataFlash log or a JSON Lines
//!   epoch file; a verdict (`PASS`, `WARN`, `FAIL`), the operator playbook steps for it, and a
//!   seeded calibration that states the false-alarm rate of the published thresholds.
//! * [`estimator_cases`]: behavioural cases for autopilot and ROS estimators (driver output,
//!   multi-receiver selection, GNSS heading, estimator initialisation, source switching, UTM zone
//!   handling, replay determinism, NaN guards), each citing the public issue it reproduces; run
//!   against a trace the user exports, or against the built-in reference traces.
//! * [`budget`]: the dead-reckoning coast budget for an airframe and sensor class (inertial error
//!   growth from [`crate::inertial::coast`], plus velocity-aided dead reckoning) and a
//!   consumer-quadcopter behaviour model under GNSS loss.
//! * [`failover`]: a cascade failover harness over three or more position sources with stated
//!   detection latencies and error growth.
//! * [`zonotope`]: a set-based (zonotope) protection level for a snapshot least-squares position
//!   under bounded range errors, as a reference.
//!
//! Every result is decision support and test evidence, labelled `MODELLED`; none is a flight
//! authorisation and none replaces the autopilot's own checks.

pub mod budget;
pub mod dataflash;
pub mod epochs;
pub mod estimator_cases;
pub mod failover;
pub mod prearm;
pub mod zonotope;

/// The evidence label every `kshana drone` result carries.
pub const EVIDENCE: &str = "MODELLED";

fn read_file(path: &str) -> Result<Vec<u8>, String> {
    std::fs::read(path).map_err(|e| format!("{path}: {e}"))
}

fn flag<'a>(args: &'a [String], name: &str) -> Option<&'a str> {
    args.iter()
        .position(|a| a == name)
        .and_then(|i| args.get(i + 1))
        .map(String::as_str)
}

fn num(args: &[String], name: &str, default: f64) -> Result<f64, String> {
    match flag(args, name) {
        None => Ok(default),
        Some(v) => v
            .parse::<f64>()
            .ok()
            .filter(|x| x.is_finite())
            .ok_or_else(|| crate::terr!("e-drone-bad-number", flag = name, value = v)),
    }
}

fn print_json(v: &serde_json::Value) -> Result<(), String> {
    println!(
        "{}",
        serde_json::to_string_pretty(v).map_err(|e| e.to_string())?
    );
    Ok(())
}

/// `kshana drone <prearm|prearm-calibrate|estimator-cases|dr-budget|quad-loss|failover|zonotope-pl> ...`.
/// Prints one JSON document on standard output; writes no file.
pub fn run(args: &[String]) -> Result<(), String> {
    let rest = args.get(1..).unwrap_or(&[]);
    match args.first().map(String::as_str) {
        Some("prearm") => {
            let path = rest
                .first()
                .filter(|p| !p.starts_with("--"))
                .ok_or_else(|| crate::t!("drone-usage"))?;
            let bytes = read_file(path)?;
            let log = epochs::load(&bytes)?;
            let mut cfg = match flag(rest, "--config") {
                Some(c) => {
                    prearm::PrearmConfig::from_json(&String::from_utf8_lossy(&read_file(c)?))?
                }
                None => prearm::PrearmConfig::default(),
            };
            cfg.window_s = num(rest, "--window", cfg.window_s)?;
            let r = prearm::check(&log, &cfg);
            print_json(&serde_json::to_value(&r).map_err(|e| e.to_string())?)?;
            if r.verdict == prearm::Verdict::Fail && rest.iter().any(|a| a == "--gate") {
                return Err(crate::terr!("e-drone-prearm-gate-failed"));
            }
            Ok(())
        }
        Some("prearm-calibrate") => {
            let runs = num(rest, "--runs", 1000.0)?.clamp(10.0, 100_000.0) as usize;
            let seed = num(rest, "--seed", 1.0)? as u64;
            let r = prearm::calibrate(&prearm::PrearmConfig::default(), runs, seed);
            print_json(&serde_json::to_value(&r).map_err(|e| e.to_string())?)
        }
        Some("estimator-cases") => {
            let report = match flag(rest, "--trace") {
                Some(p) => {
                    let case = flag(rest, "--case").ok_or_else(|| crate::t!("drone-usage"))?;
                    let trace = estimator_cases::Trace::from_jsonl(&String::from_utf8_lossy(
                        &read_file(p)?,
                    ))?;
                    let params = match flag(rest, "--params") {
                        Some(j) => serde_json::from_str(j).map_err(|e| e.to_string())?,
                        None => serde_json::Value::Null,
                    };
                    estimator_cases::run_case(case, &trace, &params)?
                }
                None => estimator_cases::self_test(),
            };
            print_json(&report)
        }
        Some("dr-budget") => {
            let spec = match rest.first().filter(|p| !p.starts_with("--")) {
                Some(p) => budget::BudgetSpec::from_json(&String::from_utf8_lossy(&read_file(p)?))?,
                None => {
                    budget::BudgetSpec::preset(flag(rest, "--airframe").unwrap_or("multirotor"))?
                }
            };
            print_json(&budget::plan(&spec)?)
        }
        Some("quad-loss") => {
            let spec = match rest.first().filter(|p| !p.starts_with("--")) {
                Some(p) => serde_json::from_slice(&read_file(p)?).map_err(|e| e.to_string())?,
                None => budget::QuadLossSpec::default(),
            };
            print_json(&budget::quad_loss(&spec))
        }
        Some("failover") => {
            let spec = match rest.first().filter(|p| !p.starts_with("--")) {
                Some(p) => serde_json::from_slice(&read_file(p)?).map_err(|e| e.to_string())?,
                None => failover::FailoverSpec::three_source_example(),
            };
            let r = failover::simulate(&spec)?;
            print_json(&serde_json::to_value(&r).map_err(|e| e.to_string())?)
        }
        Some("zonotope-pl") => {
            let path = rest
                .first()
                .filter(|p| !p.starts_with("--"))
                .ok_or_else(|| crate::t!("drone-usage"))?;
            let spec: zonotope::ZonotopeSpec =
                serde_json::from_slice(&read_file(path)?).map_err(|e| e.to_string())?;
            let r = zonotope::protection_levels(&spec)?;
            print_json(&serde_json::to_value(&r).map_err(|e| e.to_string())?)
        }
        Some("--help") | Some("-h") => {
            println!("{}", crate::t!("drone-usage"));
            Ok(())
        }
        _ => Err(crate::t!("drone-usage")),
    }
}
