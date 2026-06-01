// SPDX-License-Identifier: Apache-2.0
use std::path::PathBuf;
use std::process::ExitCode;

fn main() -> ExitCode {
    let args: Vec<String> = std::env::args().collect();
    if args.len() != 2 {
        eprintln!("usage: kshana <scenario.toml>");
        return ExitCode::from(2);
    }
    let path = PathBuf::from(&args[1]);
    let src = match std::fs::read_to_string(&path) {
        Ok(s) => s,
        Err(e) => {
            eprintln!("error: cannot read {}: {e}", path.display());
            return ExitCode::FAILURE;
        }
    };
    #[derive(serde::Deserialize)]
    struct Kind {
        #[serde(default)]
        kind: String,
    }
    let kind: Kind = toml::from_str(&src).unwrap_or(Kind {
        kind: String::new(),
    });
    if kind.kind == "inertial" {
        let scn: kshana::inertial::InertialScenario = match toml::from_str(&src) {
            Ok(s) => s,
            Err(e) => {
                eprintln!("error: invalid inertial scenario: {e}");
                return ExitCode::FAILURE;
            }
        };
        let result = kshana::inertial::run_inertial(&scn);
        let out = path.with_extension("result.json");
        let json = serde_json::to_string_pretty(&result).expect("serialize");
        if let Err(e) = std::fs::write(&out, json) {
            eprintln!("error: cannot write {}: {e}", out.display());
            return ExitCode::FAILURE;
        }
        let svg = kshana::inertial::to_svg(&result);
        let svg_path = path.with_extension("chart.svg");
        if let Err(e) = std::fs::write(&svg_path, svg) {
            eprintln!("error: cannot write {}: {e}", svg_path.display());
            return ExitCode::FAILURE;
        }
        println!(
            "scenario {} | quantum holdover {:.0}s p95 {:.2}m | classical holdover {:.0}s p95 {:.1}m",
            &result.scenario_hash[..12],
            result.quantum.fom.holdover_s, result.quantum.fom.pos_p95_m,
            result.classical.fom.holdover_s, result.classical.fom.pos_p95_m,
        );
        println!("wrote {} and {}", out.display(), svg_path.display());
        return ExitCode::SUCCESS;
    }
    if kind.kind == "timetransfer" {
        let scn: kshana::timetransfer::TimeTransferScenario = match toml::from_str(&src) {
            Ok(s) => s,
            Err(e) => {
                eprintln!("error: invalid time-transfer scenario: {e}");
                return ExitCode::FAILURE;
            }
        };
        let result = kshana::timetransfer::run_timetransfer(&scn);
        let out = path.with_extension("result.json");
        let json = serde_json::to_string_pretty(&result).expect("serialize");
        if let Err(e) = std::fs::write(&out, json) {
            eprintln!("error: cannot write {}: {e}", out.display());
            return ExitCode::FAILURE;
        }
        let svg = kshana::timetransfer::to_svg(&result);
        let svg_path = path.with_extension("chart.svg");
        if let Err(e) = std::fs::write(&svg_path, svg) {
            eprintln!("error: cannot write {}: {e}", svg_path.display());
            return ExitCode::FAILURE;
        }
        println!(
            "scenario {} | optical sync_rms {:.2}ps range_rms {:.3}mm | RF sync_rms {:.1}ps range_rms {:.1}mm",
            &result.scenario_hash[..12],
            result.quantum.fom.sync_rms_ps, result.quantum.fom.range_rms_mm,
            result.classical.fom.sync_rms_ps, result.classical.fom.range_rms_mm,
        );
        println!("wrote {} and {}", out.display(), svg_path.display());
        return ExitCode::SUCCESS;
    }
    if kind.kind == "hybrid" {
        let scn: kshana::hybrid::HybridScenario = match toml::from_str(&src) {
            Ok(s) => s,
            Err(e) => {
                eprintln!("error: invalid hybrid scenario: {e}");
                return ExitCode::FAILURE;
            }
        };
        let result = kshana::hybrid::run_hybrid(&scn);
        let out = path.with_extension("result.json");
        let json = serde_json::to_string_pretty(&result).expect("serialize");
        if let Err(e) = std::fs::write(&out, json) {
            eprintln!("error: cannot write {}: {e}", out.display());
            return ExitCode::FAILURE;
        }
        let svg = kshana::hybrid::to_svg(&result);
        let svg_path = path.with_extension("chart.svg");
        if let Err(e) = std::fs::write(&svg_path, svg) {
            eprintln!("error: cannot write {}: {e}", svg_path.display());
            return ExitCode::FAILURE;
        }
        println!(
            "scenario {} | quantum PNT-holdover {:.0}s (t {:.0}s/p {:.0}s) | classical PNT-holdover {:.0}s (t {:.0}s/p {:.0}s)",
            &result.scenario_hash[..12],
            result.quantum.fom.pnt_holdover_s, result.quantum.fom.timing_holdover_s, result.quantum.fom.position_holdover_s,
            result.classical.fom.pnt_holdover_s, result.classical.fom.timing_holdover_s, result.classical.fom.position_holdover_s,
        );
        println!("wrote {} and {}", out.display(), svg_path.display());
        return ExitCode::SUCCESS;
    }
    if kind.kind == "orbit" {
        let scn: kshana::orbit::OrbitClockScenario = match toml::from_str(&src) {
            Ok(s) => s,
            Err(e) => {
                eprintln!("error: invalid orbit scenario: {e}");
                return ExitCode::FAILURE;
            }
        };
        let result = kshana::run::run_orbit_clock(&scn);
        let out = path.with_extension("result.json");
        let json = serde_json::to_string_pretty(&result).expect("serialize");
        if let Err(e) = std::fs::write(&out, json) {
            eprintln!("error: cannot write {}: {e}", out.display());
            return ExitCode::FAILURE;
        }
        let svg = kshana::report::to_svg(&result);
        let svg_path = path.with_extension("chart.svg");
        if let Err(e) = std::fs::write(&svg_path, svg) {
            eprintln!("error: cannot write {}: {e}", svg_path.display());
            return ExitCode::FAILURE;
        }
        let integ = |i: Option<f64>| i.map_or_else(|| "n/a".to_string(), |v| format!("{v:.3}"));
        let nominal = result
            .quantum
            .series
            .iter()
            .filter(|s| s.gnss == kshana::scenario::GnssState::Nominal)
            .count();
        println!(
            "scenario {} | {}/{} samples GNSS-nominal | quantum holdover {:.0}s p95 {:.1}ns integrity {} | classical holdover {:.0}s p95 {:.1}ns integrity {}",
            &result.scenario_hash[..12],
            nominal,
            result.quantum.series.len(),
            result.quantum.fom.holdover_s,
            result.quantum.fom.timing_p95_ns,
            integ(result.quantum.fom.integrity),
            result.classical.fom.holdover_s,
            result.classical.fom.timing_p95_ns,
            integ(result.classical.fom.integrity),
        );
        println!("wrote {} and {}", out.display(), svg_path.display());
        return ExitCode::SUCCESS;
    }
    let scn: kshana::scenario::Scenario = match toml::from_str(&src) {
        Ok(s) => s,
        Err(e) => {
            eprintln!("error: invalid scenario: {e}");
            return ExitCode::FAILURE;
        }
    };
    let result = kshana::run::run(&scn);
    let out = path.with_extension("result.json");
    let json = serde_json::to_string_pretty(&result).expect("serialize result");
    if let Err(e) = std::fs::write(&out, json) {
        eprintln!("error: cannot write {}: {e}", out.display());
        return ExitCode::FAILURE;
    }
    let svg = kshana::report::to_svg(&result);
    let svg_path = path.with_extension("chart.svg");
    if let Err(e) = std::fs::write(&svg_path, svg) {
        eprintln!("error: cannot write {}: {e}", svg_path.display());
        return ExitCode::FAILURE;
    }
    let integ = |i: Option<f64>| i.map_or_else(|| "n/a".to_string(), |v| format!("{v:.3}"));
    println!(
        "scenario {} | quantum holdover {:.0}s p95 {:.1}ns integrity {} | classical holdover {:.0}s p95 {:.1}ns integrity {}",
        &result.scenario_hash[..12],
        result.quantum.fom.holdover_s,
        result.quantum.fom.timing_p95_ns,
        integ(result.quantum.fom.integrity),
        result.classical.fom.holdover_s,
        result.classical.fom.timing_p95_ns,
        integ(result.classical.fom.integrity),
    );
    println!("wrote {} and {}", out.display(), svg_path.display());
    ExitCode::SUCCESS
}
