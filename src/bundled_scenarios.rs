// SPDX-License-Identifier: AGPL-3.0-only
//! The reference scenarios, compiled into the command-line interface (CLI) binary so that
//! `kshana example <name>` can hand one to a user who installed from a registry.
//!
//! A `cargo install kshana` user has the executable and nothing else: every quickstart that
//! said `kshana scenarios/clock-holdover.toml` pointed at a file only a clone of the
//! repository has, and failed in the first minute. Each entry here is the file under
//! `scenarios/`, byte for byte, embedded at compile time (the scenario tree ships in the
//! published crate, so this also builds from the registry). The table lives in the CLI
//! binary, not the library, so the Python wheel and the WebAssembly module do not carry it.
//!
//! `tests/cli_first_run.rs` holds the table to the directory in both directions: every
//! scenario file is bundled (or named in [`REPO_ONLY`] with its reason) and every bundled
//! entry prints exactly its file's bytes.

/// One bundled scenario: its name (the file stem under `scenarios/`) and its TOML text.
macro_rules! bundled {
    ($stem:literal) => {
        (
            $stem,
            include_str!(concat!("../scenarios/", $stem, ".toml")),
        )
    };
}

/// Every scenario file in `scenarios/` that runs on its own, in file-name order.
pub const BUNDLED: &[(&str, &str)] = &[
    bundled!("aperture-duty-cycle"),
    bundled!("araim-gps-galileo"),
    bundled!("araim-reference-check"),
    bundled!("attitude-budget"),
    bundled!("cislunar-arc-recovery"),
    bundled!("cislunar-observability"),
    bundled!("clock-ensemble"),
    bundled!("clock-holdover"),
    bundled!("clock-holdover-labsr"),
    bundled!("combined-altpnt"),
    bundled!("conflict-resilience"),
    bundled!("earth-gnss-lunar"),
    bundled!("eo-coverage"),
    bundled!("ephemeris"),
    bundled!("fusion-pnt"),
    bundled!("gnss-ins"),
    bundled!("gnss-sim-raim"),
    bundled!("gps-denied-gravity-nav"),
    bundled!("gravity-map-nav"),
    bundled!("hybrid-optical-rf"),
    bundled!("hybrid-pnt"),
    bundled!("hybrid-ukf"),
    bundled!("impairment-eval"),
    bundled!("imu-deadreckoning"),
    bundled!("ins-trn-coast"),
    bundled!("integrity-raim"),
    bundled!("jamming-demo"),
    bundled!("launch-window"),
    bundled!("link-budget"),
    bundled!("lunanet-araim"),
    bundled!("lunar-attack-surface"),
    bundled!("lunar-beacon"),
    bundled!("lunar-differential-pnt"),
    bundled!("lunar-frame-campaign"),
    bundled!("lunar-frame-realisation"),
    bundled!("lunar-interop-export"),
    bundled!("lunar-jamming"),
    bundled!("lunar-joint-od-clock"),
    bundled!("lunar-time-budget"),
    bundled!("lunar-time-offset"),
    bundled!("lunar-vlbi"),
    bundled!("lunar-vlbi-fim"),
    bundled!("mars-pnt-lmo"),
    bundled!("mars-pnt-surface"),
    bundled!("mars-pnt-transfer"),
    bundled!("moonlight-service-volume"),
    bundled!("oem-interop"),
    bundled!("orbit-gnss-challenged"),
    bundled!("orbit-molniya"),
    bundled!("orbit-multignss"),
    bundled!("orbit-real-tle"),
    bundled!("orbit-rinex"),
    bundled!("orbit-sgp4-gps"),
    bundled!("passes"),
    bundled!("pvt-abmf"),
    bundled!("quantum-anomaly-detect"),
    bundled!("quantum-gnss-free-nav"),
    bundled!("quantum-time-transfer"),
    bundled!("quantum-trade"),
    bundled!("realtime-frame-eop"),
    bundled!("reentry"),
    bundled!("small-uas-jammed-nav"),
    bundled!("space-packet"),
    bundled!("space-weather"),
    bundled!("spoof-attack"),
    bundled!("spoof-detect"),
    bundled!("spoof-meaconing"),
    bundled!("sweep-clock-stability"),
    bundled!("sweep-nd-inertial"),
    bundled!("telecom-prtc-holdover-24h"),
    bundled!("telecom-tie-ingest"),
    bundled!("terrain-nav"),
    bundled!("terrain-slam"),
    bundled!("timetransfer"),
    bundled!("tracking-loop"),
];

/// Scenario files that are deliberately NOT bundled, each with the sentence the CLI prints
/// when someone asks for one. They read data files that ship with the repository only.
pub const REPO_ONLY: &[(&str, &str)] = &[
    (
        "lunar-llr-datum",
        "reads the archived lunar laser-ranging data slice under tests/fixtures/lunar_llr, \
         which ships with the repository but not with the registry packages; clone \
         https://github.com/ashfordeOU/kshana and run `kshana scenarios/lunar-llr-datum.toml` \
         from the checkout, or set `data_dir` to a copy of that slice",
    ),
    (
        "quantum-pnt-demonstrator.suite",
        "is a study manifest, not a scenario: it runs three sibling scenario files \
         (quantum-time-transfer, quantum-gnss-free-nav, quantum-anomaly-detect) resolved \
         from its own directory with `--study`; clone \
         https://github.com/ashfordeOU/kshana and run \
         `kshana --study scenarios/quantum-pnt-demonstrator.suite.toml` from a checkout of the repository",
    ),
];

/// The TOML text of a bundled scenario, by name. A trailing `.toml` is accepted.
pub fn get(name: &str) -> Option<&'static str> {
    let name = name.strip_suffix(".toml").unwrap_or(name);
    BUNDLED.iter().find(|(n, _)| *n == name).map(|(_, t)| *t)
}

/// Why a known scenario is not bundled, if it is one of the repository-only files.
pub fn repo_only_reason(name: &str) -> Option<&'static str> {
    let name = name.strip_suffix(".toml").unwrap_or(name);
    REPO_ONLY.iter().find(|(n, _)| *n == name).map(|(_, r)| *r)
}
