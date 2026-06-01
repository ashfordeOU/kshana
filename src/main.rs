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
        Err(e) => { eprintln!("error: cannot read {}: {e}", path.display()); return ExitCode::FAILURE; }
    };
    #[derive(serde::Deserialize)]
    struct Kind { #[serde(default)] kind: String }
    let kind: Kind = toml::from_str(&src).unwrap_or(Kind { kind: String::new() });
    if kind.kind == "inertial" {
        let scn: kshana::inertial::InertialScenario = match toml::from_str(&src) {
            Ok(s) => s,
            Err(e) => { eprintln!("error: invalid inertial scenario: {e}"); return ExitCode::FAILURE; }
        };
        let result = kshana::inertial::run_inertial(&scn);
        let out = path.with_extension("result.json");
        let json = serde_json::to_string_pretty(&result).expect("serialize");
        if let Err(e) = std::fs::write(&out, json) {
            eprintln!("error: cannot write {}: {e}", out.display()); return ExitCode::FAILURE;
        }
        let svg = kshana::inertial::to_svg(&result);
        let svg_path = path.with_extension("chart.svg");
        if let Err(e) = std::fs::write(&svg_path, svg) {
            eprintln!("error: cannot write {}: {e}", svg_path.display()); return ExitCode::FAILURE;
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
    let scn: kshana::scenario::Scenario = match toml::from_str(&src) {
        Ok(s) => s,
        Err(e) => { eprintln!("error: invalid scenario: {e}"); return ExitCode::FAILURE; }
    };
    let result = kshana::run::run(&scn);
    let out = path.with_extension("result.json");
    let json = serde_json::to_string_pretty(&result).expect("serialize result");
    if let Err(e) = std::fs::write(&out, json) {
        eprintln!("error: cannot write {}: {e}", out.display()); return ExitCode::FAILURE;
    }
    let svg = kshana::report::to_svg(&result);
    let svg_path = path.with_extension("chart.svg");
    if let Err(e) = std::fs::write(&svg_path, svg) {
        eprintln!("error: cannot write {}: {e}", svg_path.display());
        return ExitCode::FAILURE;
    }
    println!(
        "scenario {} | quantum holdover {:.0}s p95 {:.1}ns | classical holdover {:.0}s p95 {:.1}ns",
        &result.scenario_hash[..12],
        result.quantum.fom.holdover_s, result.quantum.fom.timing_p95_ns,
        result.classical.fom.holdover_s, result.classical.fom.timing_p95_ns,
    );
    println!("wrote {} and {}", out.display(), svg_path.display());
    ExitCode::SUCCESS
}
