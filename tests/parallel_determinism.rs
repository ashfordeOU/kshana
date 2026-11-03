// SPDX-License-Identifier: AGPL-3.0-only
//! A Monte Carlo run gives the same bytes on one core and on many (crate::par, roadmap L10a).
//!
//! PIN-SCOPE:    the result document of every parallel kind (the clock-holdover ensemble, an
//!               inertial Monte Carlo, a campaign Monte Carlo, the generic and N-D sweeps, the LEO
//!               PPP ensemble), run through the command line with KSHANA_THREADS=1 and 8
//! PIN-EXCLUDES: speed (benchmarks are separate); kinds whose runs share one random stream stay
//!               sequential and are not listed here

use std::path::{Path, PathBuf};
use std::process::Command;

fn run_with_threads(scenario: &str, threads: &str, dir: &Path) -> String {
    std::fs::create_dir_all(dir).unwrap();
    let f = dir.join("s.toml");
    std::fs::write(&f, scenario).unwrap();
    let out = Command::new(env!("CARGO_BIN_EXE_kshana"))
        .arg(&f)
        .env("KSHANA_THREADS", threads)
        .current_dir(dir)
        .output()
        .unwrap();
    assert!(
        out.status.success(),
        "{}",
        String::from_utf8_lossy(&out.stderr)
    );
    std::fs::read_to_string(dir.join("s.result.json")).unwrap()
}

fn same_bytes_on_one_and_eight(name: &str, scenario: &str) {
    static SEQ: std::sync::atomic::AtomicU64 = std::sync::atomic::AtomicU64::new(0);
    let seq = SEQ.fetch_add(1, std::sync::atomic::Ordering::Relaxed);
    let base: PathBuf =
        std::env::temp_dir().join(format!("kshana-par-{name}-{}-{seq}", std::process::id()));
    let one = run_with_threads(scenario, "1", &base.join("one"));
    let eight = run_with_threads(scenario, "8", &base.join("eight"));
    assert_eq!(
        one, eight,
        "{name}: the result differs between 1 and 8 threads"
    );
    let _ = std::fs::remove_dir_all(&base);
}

#[test]
fn clock_holdover_ensemble() {
    let src = std::fs::read_to_string(concat!(
        env!("CARGO_MANIFEST_DIR"),
        "/scenarios/clock-ensemble.toml"
    ))
    .unwrap();
    same_bytes_on_one_and_eight("ensemble", &src);
}

#[test]
fn inertial_monte_carlo() {
    let src = std::fs::read_to_string(concat!(
        env!("CARGO_MANIFEST_DIR"),
        "/scenarios/imu-deadreckoning.toml"
    ))
    .unwrap();
    // Twenty runs instead of the file's single run, so the ensemble path is the one exercised.
    let src = src.replacen("seed = 42", "seed = 42\nruns = 20", 1);
    same_bytes_on_one_and_eight("inertial", &src);
}

fn scenario(name: &str) -> String {
    std::fs::read_to_string(format!("{}/scenarios/{name}", env!("CARGO_MANIFEST_DIR"))).unwrap()
}

#[test]
fn campaign_monte_carlo() {
    // 24 members instead of 200 keeps the test short; the path is the same.
    let src =
        scenario("campaign-monte-carlo-clock-holdover.toml").replacen("runs = 200", "runs = 24", 1);
    same_bytes_on_one_and_eight("campaign", &src);
}

#[test]
fn generic_sweep() {
    same_bytes_on_one_and_eight("sweep", &scenario("sweep-clock-stability.toml"));
}

#[test]
fn nd_sweep() {
    same_bytes_on_one_and_eight("sweep-nd", &scenario("sweep-nd-inertial.toml"));
}

#[test]
fn leo_ppp_ensemble() {
    same_bytes_on_one_and_eight("leo-ppp", &scenario("leo-ppp-convergence.toml"));
}
