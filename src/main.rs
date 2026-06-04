// SPDX-License-Identifier: Apache-2.0
use std::path::PathBuf;
use std::process::ExitCode;

fn main() -> ExitCode {
    let args: Vec<String> = std::env::args().collect();
    // usage: kshana <scenario.toml> [--export-sp3 <out.sp3>]
    let mut positional: Option<String> = None;
    let mut export_sp3_path: Option<PathBuf> = None;
    let mut i = 1;
    while i < args.len() {
        match args[i].as_str() {
            "--export-sp3" => {
                i += 1;
                match args.get(i) {
                    Some(p) => export_sp3_path = Some(PathBuf::from(p)),
                    None => {
                        eprintln!("error: --export-sp3 needs a path");
                        return ExitCode::from(2);
                    }
                }
            }
            other if positional.is_none() => positional = Some(other.to_string()),
            other => {
                eprintln!("error: unexpected argument '{other}'");
                return ExitCode::from(2);
            }
        }
        i += 1;
    }
    let Some(scenario_arg) = positional else {
        eprintln!("usage: kshana <scenario.toml> [--export-sp3 <out.sp3>]");
        return ExitCode::from(2);
    };
    let path = PathBuf::from(&scenario_arg);
    let src = match std::fs::read_to_string(&path) {
        Ok(s) => s,
        Err(e) => {
            eprintln!("error: cannot read {}: {e}", path.display());
            return ExitCode::FAILURE;
        }
    };
    let out = match kshana::api::run_toml(&src) {
        Ok(o) => o,
        Err(e) => {
            eprintln!("error: {e}");
            return ExitCode::FAILURE;
        }
    };
    let json_path = path.with_extension("result.json");
    if let Err(e) = std::fs::write(&json_path, &out.json) {
        eprintln!("error: cannot write {}: {e}", json_path.display());
        return ExitCode::FAILURE;
    }
    let svg_path = path.with_extension("chart.svg");
    if let Err(e) = std::fs::write(&svg_path, &out.svg) {
        eprintln!("error: cannot write {}: {e}", svg_path.display());
        return ExitCode::FAILURE;
    }
    let html_path = path.with_extension("report.html");
    if let Err(e) = std::fs::write(&html_path, out.html_report()) {
        eprintln!("error: cannot write {}: {e}", html_path.display());
        return ExitCode::FAILURE;
    }
    println!("{}", out.summary);
    println!(
        "wrote {}, {}, and {}",
        json_path.display(),
        svg_path.display(),
        html_path.display()
    );

    // SP3 export: an explicit `--export-sp3 <path>`, or the scenario's `export_sp3`
    // option which auto-writes `<scenario>.sp3`. Both require an orbit scenario.
    let sp3_target = match (&export_sp3_path, kshana::api::auto_export_sp3(&src)) {
        (Some(p), _) => Some((p.clone(), kshana::api::export_sp3(&src))),
        (None, Ok(Some(text))) => Some((path.with_extension("sp3"), Ok(text))),
        (None, Ok(None)) => None,
        (None, Err(e)) => Some((path.with_extension("sp3"), Err(e))),
    };
    if let Some((sp3_path, result)) = sp3_target {
        match result {
            Ok(text) => {
                if let Err(e) = std::fs::write(&sp3_path, text) {
                    eprintln!("error: cannot write {}: {e}", sp3_path.display());
                    return ExitCode::FAILURE;
                }
                println!("wrote {}", sp3_path.display());
            }
            Err(e) => {
                eprintln!("error: SP3 export failed: {e}");
                return ExitCode::FAILURE;
            }
        }
    }
    ExitCode::SUCCESS
}
