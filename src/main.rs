// SPDX-License-Identifier: Apache-2.0
use std::path::PathBuf;
use std::process::ExitCode;

fn main() -> ExitCode {
    let args: Vec<String> = std::env::args().collect();
    // usage: kshana <scenario.toml> [--export-sp3 <out.sp3>] [--export-omm <out.omm>] [--export-oem <out.oem>]
    let mut positional: Option<String> = None;
    let mut export_sp3_path: Option<PathBuf> = None;
    let mut export_omm_path: Option<PathBuf> = None;
    let mut export_oem_path: Option<PathBuf> = None;
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
            "--export-omm" => {
                i += 1;
                match args.get(i) {
                    Some(p) => export_omm_path = Some(PathBuf::from(p)),
                    None => {
                        eprintln!("error: --export-omm needs a path");
                        return ExitCode::from(2);
                    }
                }
            }
            "--export-oem" => {
                i += 1;
                match args.get(i) {
                    Some(p) => export_oem_path = Some(PathBuf::from(p)),
                    None => {
                        eprintln!("error: --export-oem needs a path");
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
        eprintln!(
            "usage: kshana <scenario.toml> [--export-sp3 <out.sp3>] [--export-omm <out.omm>] [--export-oem <out.oem>]"
        );
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

    // OMM export: an explicit `--export-omm <path>`, or the scenario's `export_omm`
    // option which auto-writes `<scenario>.omm`. Both require an orbit scenario with
    // a TLE-defined constellation.
    let omm_target = match (&export_omm_path, kshana::api::auto_export_omm(&src)) {
        (Some(p), _) => Some((p.clone(), kshana::api::export_omm(&src))),
        (None, Ok(Some(text))) => Some((path.with_extension("omm"), Ok(text))),
        (None, Ok(None)) => None,
        (None, Err(e)) => Some((path.with_extension("omm"), Err(e))),
    };
    if let Some((omm_path, result)) = omm_target {
        match result {
            Ok(text) => {
                if let Err(e) = std::fs::write(&omm_path, text) {
                    eprintln!("error: cannot write {}: {e}", omm_path.display());
                    return ExitCode::FAILURE;
                }
                println!("wrote {}", omm_path.display());
            }
            Err(e) => {
                eprintln!("error: OMM export failed: {e}");
                return ExitCode::FAILURE;
            }
        }
    }

    // OEM export: an explicit `--export-oem <path>`, or the scenario's `export_oem`
    // option which auto-writes `<scenario>.oem`. Both require an orbit scenario. OEM
    // carries the full inertial state (position AND velocity), unlike SP3.
    let oem_target = match (&export_oem_path, kshana::api::auto_export_oem(&src)) {
        (Some(p), _) => Some((p.clone(), kshana::api::export_oem(&src))),
        (None, Ok(Some(text))) => Some((path.with_extension("oem"), Ok(text))),
        (None, Ok(None)) => None,
        (None, Err(e)) => Some((path.with_extension("oem"), Err(e))),
    };
    if let Some((oem_path, result)) = oem_target {
        match result {
            Ok(text) => {
                if let Err(e) = std::fs::write(&oem_path, text) {
                    eprintln!("error: cannot write {}: {e}", oem_path.display());
                    return ExitCode::FAILURE;
                }
                println!("wrote {}", oem_path.display());
            }
            Err(e) => {
                eprintln!("error: OEM export failed: {e}");
                return ExitCode::FAILURE;
            }
        }
    }
    ExitCode::SUCCESS
}
