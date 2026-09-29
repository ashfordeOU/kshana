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
    bundled!("automotive-urban-canyon"),
    bundled!("campaign-jam-spoof-holdover-integrity"),
    bundled!("campaign-monte-carlo-clock-holdover"),
    bundled!("campaign-shared-jammer-sea-road"),
    bundled!("campaign-spectrum-holdover-integrity"),
    bundled!("campaign-sweep-jammer-power"),
    bundled!("cislunar-arc-recovery"),
    bundled!("cislunar-observability"),
    bundled!("clock-ensemble"),
    bundled!("clock-holdover"),
    bundled!("clock-holdover-labsr"),
    bundled!("combined-altpnt"),
    bundled!("conflict-resilience"),
    bundled!("constellation-multi-gnss-coverage"),
    bundled!("earth-gnss-lunar"),
    bundled!("eo-coverage"),
    bundled!("ephemeris"),
    bundled!("europa-surface-pnt"),
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
    bundled!("l-band-waterfall-jamming"),
    bundled!("launch-window"),
    bundled!("leo-band-trade"),
    bundled!("leo-doppler-positioning"),
    bundled!("leo-focus-data-services"),
    bundled!("leo-focus-fused-pnt-sisre"),
    bundled!("leo-focus-indoor-uhf"),
    bundled!("leo-focus-iot-eirp"),
    bundled!("leo-focus-ntn-bandwidth"),
    bundled!("leo-focus-ppp-altitude"),
    bundled!("leo-focus-science-iono-sounding"),
    bundled!("leo-indoor-uhf"),
    bundled!("leo-iot-energy"),
    bundled!("leo-navmsg-encode-decode"),
    bundled!("leo-navmsg-fit-interval-trade"),
    bundled!("leo-navmsg-midpass-update"),
    bundled!("leo-navmsg-model-comparison"),
    bundled!("leo-pass-iridium"),
    bundled!("leo-pass-vs-gnss-cn0"),
    bundled!("leo-pass-xona-pulsar"),
    bundled!("leo-pnt-end-to-end"),
    bundled!("leo-pnt-mega-shell"),
    bundled!("leo-ppp-convergence"),
    bundled!("leo-resilience-gnss-jammed-leo-carries"),
    bundled!("leo-resilience-js-margin"),
    bundled!("leo-resilience-multiband-diversity"),
    bundled!("leo-resilience-spoof-doppler"),
    bundled!("leo-resilience-spoof-monitors"),
    bundled!("leo-timing-utc"),
    bundled!("leo-vertical-5g-network-timing"),
    bundled!("leo-vertical-asset-tracking-iot"),
    bundled!("leo-vertical-autonomous-vehicle"),
    bundled!("leo-vertical-critical-infrastructure-timing"),
    bundled!("leo-vertical-polar-arctic"),
    bundled!("leo-vertical-rail-maritime"),
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
    bundled!("lunar-relay-constellation"),
    bundled!("lunar-time-budget"),
    bundled!("lunar-time-offset"),
    bundled!("lunar-vlbi"),
    bundled!("lunar-vlbi-fim"),
    bundled!("maritime-port-approach-coast"),
    bundled!("maritime-spoof-position-push"),
    bundled!("maritime-strait-jamming"),
    bundled!("mars-orbit-pnt"),
    bundled!("mars-pnt-lmo"),
    bundled!("mars-pnt-surface"),
    bundled!("mars-pnt-transfer"),
    bundled!("meo-leo-fused-pvt"),
    bundled!("moonlight-service-volume"),
    bundled!("multi-band-jamming-waterfall"),
    bundled!("ntn-5g-positioning"),
    bundled!("oem-interop"),
    bundled!("orbit-gnss-challenged"),
    bundled!("orbit-molniya"),
    bundled!("orbit-multignss"),
    bundled!("orbit-real-tle"),
    bundled!("orbit-rinex"),
    bundled!("orbit-sgp4-gps"),
    bundled!("passes"),
    bundled!("polar-arctic-leo-coverage"),
    bundled!("pvt-abmf"),
    bundled!("quantum-anomaly-detect"),
    bundled!("quantum-gnss-free-nav"),
    bundled!("quantum-time-transfer"),
    bundled!("quantum-trade"),
    bundled!("rail-tunnel-coast"),
    bundled!("realtime-frame-eop"),
    bundled!("reentry"),
    bundled!("slot-timing-ocxo-leo"),
    bundled!("small-uas-jammed-nav"),
    bundled!("solar-system-tour"),
    bundled!("space-packet"),
    bundled!("space-weather"),
    bundled!("spoof-attack"),
    bundled!("spoof-detect"),
    bundled!("spoof-meaconing"),
    bundled!("starlink-sop-doppler-positioning"),
    bundled!("sweep-clock-stability"),
    bundled!("sweep-nd-inertial"),
    bundled!("telecom-prtc-holdover-24h"),
    bundled!("telecom-tie-ingest"),
    bundled!("terrain-nav"),
    bundled!("terrain-slam"),
    bundled!("timetransfer"),
    bundled!("tracking-loop"),
    bundled!("xona-pulsar-end-to-end"),
    bundled!("xona-pulsar-signals"),
];

/// Scenario files that are deliberately NOT bundled, each with the sentence the CLI prints
/// when someone asks for one. They read data files that ship with the repository only, or
/// (the workshop-parameter preset) must stay removable by deleting that one file: an
/// `include_str!` of it would stop the binary compiling the moment it is withheld.
pub const REPO_ONLY: &[(&str, &str)] = &[
    (
        "celeste-iod-classical-pilot-signals",
        "carries signal parameters presented at the ESA NAVISP LEO-PNT workshop, 2026, and is kept out of the \
         binary so a release can withhold the Celeste IOD preset by deleting \
         src/celeste_iod.rs and the scenarios/*celeste-iod*.toml files; run \
         `kshana scenarios/celeste-iod-classical-pilot-signals.toml` from a checkout of the repository",
    ),
    (
        "celeste-iod-end-to-end",
        "follows the Celeste IOD preset end to end, with signal parameters presented at the ESA NAVISP LEO-PNT workshop, 2026, and is kept out of the \
         binary so a release can withhold the Celeste IOD preset by deleting \
         src/celeste_iod.rs and the scenarios/*celeste-iod*.toml files; run \
         `kshana scenarios/celeste-iod-end-to-end.toml` from a checkout of the repository",
    ),
    (
        "celeste-iod-fused-pvt",
        "uses the Celeste IOD preset, with signal parameters presented at the ESA NAVISP LEO-PNT workshop, 2026, and is kept out of the \
         binary so a release can withhold the Celeste IOD preset by deleting \
         src/celeste_iod.rs and the scenarios/*celeste-iod*.toml files; run \
         `kshana scenarios/celeste-iod-fused-pvt.toml` from a checkout of the repository",
    ),
    (
        "leo-navmsg-celeste-iod",
        "uses the Celeste IOD preset, with message content presented at the ESA NAVISP LEO-PNT workshop, 2026, and is kept out of the \
         binary so a release can withhold the Celeste IOD preset by deleting \
         src/celeste_iod.rs and the scenarios/*celeste-iod*.toml files; run \
         `kshana scenarios/leo-navmsg-celeste-iod.toml` from a checkout of the repository",
    ),
    (
        "leo-pass-celeste-iod-multiband",
        "uses the Celeste IOD preset, with band parameters presented at the ESA NAVISP LEO-PNT workshop, 2026, and is kept out of the \
         binary so a release can withhold the Celeste IOD preset by deleting \
         src/celeste_iod.rs and the scenarios/*celeste-iod*.toml files; run \
         `kshana scenarios/leo-pass-celeste-iod-multiband.toml` from a checkout of the repository",
    ),
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
