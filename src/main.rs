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
    println!("{}", out.summary);
    println!("wrote {} and {}", json_path.display(), svg_path.display());
    ExitCode::SUCCESS
}
