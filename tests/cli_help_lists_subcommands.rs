//! `kshana --help` names every subcommand, so a user is not sent to the source to find one.

use std::process::Command;

#[test]
fn the_top_level_usage_names_every_subcommand() {
    let out = Command::new(env!("CARGO_BIN_EXE_kshana"))
        .arg("--help")
        .output()
        .unwrap();
    let text =
        String::from_utf8_lossy(&out.stdout).to_string() + &String::from_utf8_lossy(&out.stderr);
    for want in [
        "receiver-trust live",
        "receiver-trust evidence",
        "evidence <keygen|verify|attach-timestamp>",
        "trust-telemetry",
        "osnma verify",
        "nmea-scenario",
        "interference-map",
        "route-exposure",
        "bench-export",
        "compliance-report",
        "kinds",
        "example",
        "--validate",
        "--study",
        "labfit",
        "campaign",
        "conditions",
        "frontend",
        "monitor",
        "inventory",
        "decimate",
    ] {
        assert!(
            text.contains(want),
            "`kshana --help` does not mention `{want}`:\n{text}"
        );
    }
}
