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
        "ephem-export",
        "osnma verify",
        "osnma scenario run",
        "nmea-scenario",
        "interference-map",
        "route-exposure",
        "bench-export",
        "compliance-report",
        "standards-pack",
        "lunanet-afs-check",
        "evidence round-trip",
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
        "time-vectors",
        "utc-readiness",
        "ais-integrity",
        "rnss-design",
        "space-receiver",
        "sil-obs",
        "interference-lib",
        "antenna-cal",
        "arctic-plan",
        "lunar-afs-kit",
        "lunar-ref",
        "quantum-bench",
        "soop-clock",
        "adsb-indicators",
        "interference-atlas",
        "claim-check",
        "afs-interop",
        "timing-stack",
        "register-products",
        "sil-obsgen",
        "lunar-oem",
        "corrections",
        "space-weather",
        "rtk-qa",
        "diagnose",
        "gnss-sdr-conf",
        "orbit-data",
        "leo-verify",
        "transition scan",
        "pbom",
        "datasets|cite|golden",
        "feed <pack|verify|send|spectrum|leaderboard|watch>",
        "register <check|crl-check|view|sign>",
        "interference-env <evaluate|thresholds|degradation>",
        "signal-readiness <profile.toml>",
        "leo-od-plan <plan.toml>",
        "leo-sparse <study.toml>",
    ] {
        assert!(
            text.contains(want),
            "`kshana --help` does not mention `{want}`:\n{text}"
        );
    }
}
