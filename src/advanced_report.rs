// SPDX-License-Identifier: AGPL-3.0-only
//! **The advanced run report**: one structured record of a scenario run, rendered as a
//! printable HyperText Markup Language (HTML) page and as a machine-readable JavaScript
//! Object Notation (JSON) document with the same content.
//!
//! A result document answers *what the engine computed*. A reader who has to act on it
//! also needs *what went in*, *what the numbers rest on*, *what was left out* and *how to
//! get the same bytes again*. This module assembles those from sources the engine already
//! keeps, and invents none of them:
//!
//! | Section | Source |
//! |---|---|
//! | Executive summary | the run's one-line summary, the result's own honesty `label`, the kind catalogue |
//! | Inputs | the scenario file, flattened; each unit from the result's `units` block (the field-units schema), else the field-name suffix, else stated as not stated |
//! | Results | every scalar of the result document, a summary of every numeric column, the run's chart |
//! | Aggregation | a campaign's sweep nodes, Monte Carlo percentiles, chain phases or composed members; a `sweep` or `sweep-nd` grid |
//! | Events timeline | timed windows in the scenario (`t0`/`t1`, `on_s`/`off_s`, …), `events` arrays in the result, a campaign's phases |
//! | Verification labels | the verification matrix ([`crate::verification::verification_matrix`]), through [`KIND_CAPABILITIES`] |
//! | Not modelled | `not_modelled` / `not_implemented` / `honesty` blocks in the result, the kind catalogue's MODELLED clauses, the scenario's own comments, and the matrix's reason each MODELLED row stays modelled |
//! | Reproducibility | engine version, build-time commit, Secure Hash Algorithm 256-bit (SHA-256) digests, seed, platform, the exact command |
//!
//! **Determinism.** The builder is a pure function of the run output, the scenario bytes
//! and the [`Invocation`]: it reads no clock, no environment at run time and no file, so
//! the same scenario, seed and engine build give a byte-identical report. The only
//! timestamp it can carry is the one `--study-name` already stamps into the result's
//! `meta.generated_utc`; a run without `--study-name` carries none. The build-time commit
//! is read with `option_env!("KSHANA_GIT_COMMIT")`, a compile-time constant.
//!
//! **What a label here means.** A verification label grades the *capability* named in a
//! matrix row, as the matrix records it. It does not grade this scenario's configuration,
//! and a VALIDATED row does not make a run's inputs measured. The report says so in the
//! section itself.
//!
//! WebAssembly-safe: no threads, no clock, no file system.

use crate::verification::{verification_matrix, VerificationItem, VerificationStatus};
use serde::Serialize;
use serde_json::{Map, Value};
use sha2::{Digest, Sha256};
use std::collections::{BTreeMap, BTreeSet};

/// The `report_schema` value of every report document.
pub const REPORT_SCHEMA: &str = "kshana-report";
/// The version of the report document shape. Additive changes bump the minor number.
pub const REPORT_SCHEMA_VERSION: &str = "1.0";

/// The environment variable read **at build time** for the source commit. Set it when
/// building (`KSHANA_GIT_COMMIT=$(git rev-parse HEAD) cargo build --release`); a build
/// without it reports the commit as not recorded rather than guessing.
pub const GIT_COMMIT_ENV: &str = "KSHANA_GIT_COMMIT";

/// Row cap for the results scalar table; the rest are counted, and all of them are in the
/// result document itself.
const MAX_SCALARS: usize = 150;
/// Row cap for the numeric-column summary.
const MAX_SERIES: usize = 60;
/// Row cap for the events timeline.
const MAX_EVENTS: usize = 200;
/// Row cap for the inputs table.
const MAX_INPUTS: usize = 400;
/// Longest string a results cell carries; a longer string is prose, not a result.
const MAX_RESULT_STRING: usize = 160;

/// The verification-matrix rows each built-in kind exercises, by the matrix row's
/// `requirement`. The label shown in a report is read back from the matrix at build time,
/// so this table is a crosswalk only, never a second status table: moving a row between
/// VALIDATED and MODELLED moves every report with it.
///
/// A PARTNER row listed here is a discipline the kind *relies on* (antenna hardware for
/// the radio-frequency kinds, the quantum payload for the quantum kinds) and that Kshana
/// does not provide; the report shows it as relied on, not exercised.
///
/// `campaign` carries no fixed rows: its rows are the one for its mode (chain, sweep or
/// Monte Carlo, compose) plus every row of every member kind it ran.
pub const KIND_CAPABILITIES: &[(&str, &[&str])] = &[
    ("clock", &["GNSS-denied clock holdover", "Onboard clock state estimation", "Frequency stability characterisation", "Spoofing detection"]),
    ("inertial", &["Quantum inertial sensor performance", "Quantum inertial dead-reckoning resilience", "Quantum payload hardware design & maturation"]),
    ("integrity", &["Integrity (RAIM/ARAIM/SBAS)", "RAIM/ARAIM integrity statistical kernel (χ² / non-central χ² / normal laws)", "GNSS geometry / dilution of precision (DOP)"]),
    ("timetransfer", &["Time-transfer error budgeting"]),
    ("quantum-time-transfer", &["Trusted quantum timing (time transfer + secure dissemination + anomaly)", "Time-transfer error budgeting", "CUSUM change-detection latency & ARL", "Quantum-vs-classical trade evidence (common shape)", "Quantum payload hardware design & maturation"]),
    ("quantum-gnss-free-nav", &["GNSS-free quantum navigation", "Quantum inertial sensor performance", "Quantum-vs-classical trade evidence (common shape)", "Quantum payload hardware design & maturation"]),
    ("quantum-anomaly-detect", &["Fault/anomaly detection for quantum PNT systems", "Detection statistics — Gaussian AUC & minimum detectable fault", "Quantum-vs-classical trade evidence (common shape)", "Quantum payload hardware design & maturation"]),
    ("hybrid", &["GNSS-denied clock holdover", "Quantum inertial sensor performance", "Time-transfer error budgeting"]),
    ("fusion", &["GNSS/INS sensor fusion", "GNSS-denied clock holdover", "Quantum inertial sensor performance"]),
    ("hybrid-ukf", &["GNSS/INS sensor fusion", "Quantum inertial sensor performance", "CAI cited error-model parameter sheet (13503)"]),
    ("gnss-ins", &["GNSS/INS sensor fusion", "Quantum inertial sensor performance"]),
    ("gnss-sim", &["Broadcast ionosphere model (Klobuchar, IS-GPS-200)", "Integrity (RAIM/ARAIM/SBAS)", "RAIM/ARAIM integrity statistical kernel (χ² / non-central χ² / normal laws)", "GNSS geometry / dilution of precision (DOP)"]),
    ("jamming", &["GNSS-denied jamming resilience", "Navigation RF payload & antenna hardware design"]),
    ("spoof", &["Spoofing detection"]),
    ("spoof-detect", &["Spoofing detection", "Navigation RF payload & antenna hardware design"]),
    ("sweep", &["GNSS-denied clock holdover", "Parameter sweeps and seeded Monte Carlo ensembles over any scenario kind"]),
    ("sweep-nd", &["Parameter sweeps and seeded Monte Carlo ensembles over any scenario kind"]),
    ("orbit", &["Orbit propagation & determination", "GNSS geometry / dilution of precision (DOP)", "GNSS-denied clock holdover", "Onboard clock state estimation"]),
    ("ephemeris", &["Orbit propagation & determination", "Reference frames & timescales"]),
    ("lunar-integrity", &["Lunar ARAIM protection-level kernel", "Integrity (RAIM/ARAIM/SBAS)"]),
    ("lunar-time-offset", &["Lunar coordinate time"]),
    ("lunar-vlbi", &["Lunar geodetic VLBI"]),
    ("lunar-joint-od-clock", &["Lunar joint multi-technique OD + clock", "Lunar absolute-station observability (datum defect)", "Fisher information & Cramér–Rao observability"]),
    ("lunar-frame-realisation", &["Lunar reference-frame realisation"]),
    ("lunar-frame-campaign", &["Lunar frame datum from an observing campaign"]),
    ("lunar-llr-datum", &["Lunar frame datum from a REAL observing campaign"]),
    ("moonlight-service-volume", &["Lunar navigation service volume", "Lunar joint communications-and-navigation geometry"]),
    ("lunar-differential-pnt", &["Lunar differential PNT", "Lunar differential PNT — correction-link residual budget"]),
    ("lunar-beacon", &["Lunar surface-beacon DOP augmentation"]),
    ("earth-gnss-lunar", &["Earth-GNSS at lunar distance", "Navigation RF payload & antenna hardware design"]),
    ("lunar-interop-export", &["Lunar interoperability export"]),
    ("gravity-map", &["Alternative / complementary PNT"]),
    ("terrain-nav", &["Alternative / complementary PNT"]),
    ("terrain-slam", &["Alternative / complementary PNT"]),
    ("combined-altpnt", &["Alternative / complementary PNT"]),
    ("pvt", &["Broadcast-ephemeris satellite position (multi-GNSS RINEX)"]),
    ("mars-pnt", &["Batch & sequential orbit determination", "Onboard clock state estimation"]),
    ("impairment-eval", &["AI/ML RF-impairment detection evaluation (13494)", "ML detector-evaluation metrics (ROC/AUC/confusion/Pfa-Pmd)"]),
    ("quantum-trade", &["Quantum-vs-classical PNT trade & GNSS-denied resilience (13503)", "Quantum-trade numerical kernels (NNLS / χ² bands / van-Loan Q)", "Quantum payload hardware design & maturation"]),
    ("space-weather", &["Space-weather environment & activity-driven thermospheric density"]),
    ("oem-interop", &["CCSDS OEM interoperability (GMAT/Orekit/STK ephemeris import)"]),
    ("launch-window", &["Launch-window & ascent geometry (mission analysis)"]),
    ("reentry", &["Ballistic re-entry corridor (Allen–Eggers)"]),
    ("eo-coverage", &["EO payload footprint & coverage geometry"]),
    ("space-packet", &["CCSDS Space Packet (133.0) TM/TC framing"]),
    ("attitude-budget", &["3-DOF attitude & pointing error budget (AOCS)", "Spacecraft bus engineering (AOCS/thermal/structures/propulsion/power)"]),
    ("passes", &["Ground-station pass prediction (ground segment)"]),
    ("link-budget", &["One-way link budget (comms / link design)", "Link-budget report self-description"]),
    ("lunar-time-budget", &["Per-clock-class lunar time crossover table", "Lunar time-error budget reproducibility"]),
    ("realtime-frame-eop", &["Joint UT1 and polar-motion error over a common row set", "Offline default Earth-orientation input is a real IERS product", "Operational-style Earth-orientation prediction error, measured predicted-versus-final"]),
    ("hybrid-optical-rf", &["Hybrid optical/RF report self-description", "Hybrid optical/RF link availability on the RF side", "Like-for-like optical-versus-RF ranging comparison", "Cross-modality integrity monitor detection power", "Post-handover covariance re-growth against the alert limit"]),
    ("cislunar-observability", &["Spatial, noisy, multi-family cislunar arc-length observability"]),
    ("cislunar-arc-recovery", &["Independent-estimator corroboration of the cislunar arc-length threshold"]),
    ("conflict-resilience", &["PNT-resilience framework-aligned scoring"]),
    ("lunar-attack-surface", &["Capture footprint against altitude and beamwidth", "GNSS-denied jamming resilience"]),
    ("aperture-duty-cycle", &["Aperture navigation-versus-communications duty cycle"]),
    ("lunar-jamming", &["Lunar surface-navigation RF jamming (per-satellite J/S)", "Lunar denial contour with an uncertainty band from the measured C/N₀ spread", "Navigation RF payload & antenna hardware design"]),
    ("ins-trn-coast", &["INS/TRN coasting error growth & threshold crossings"]),
    ("lunar-vlbi-fim", &["Lunar-VLBI station-coordinate covariance from a tracking schedule", "Lunar-surface-point coordinate covariance from a VLBI delay schedule, kept distinct from the Earth-station one"]),
    ("tracking-loop", &["Tracking-loop loss of lock and spoof pull-in under interference", "Navigation RF payload & antenna hardware design"]),
    ("araim-reference-check", &["ARAIM MHSS protection levels against published reference vectors"]),
    ("telecom-timing", &["Telecom-timing MTIE and TDEV on a holdover time-error series", "ITU-T telecom synchronisation masks with PASS/FAIL and margin", "Oscillator holdover presets from public datasheets"]),
    ("slot-timing", &["Holdover prediction from a measured clock record, checked on held-out data", "Seconds until a free-running clock leaves a time-indexed slot's guard, and the fix cadence that keeps it inside", "Timing protection level for a receiver in orbit under GNSS spoofing"]),
    ("spectrum", &["Closed-form L-band signal power spectral densities and spectral separation coefficients", "L-band spectrum waterfall with per-band J/S and effective C/N0 under a scripted jammer timeline", "SigMF recording input and output, and Welch spectral estimates of complex IQ", "Navigation RF payload & antenna hardware design", "Multi-band spectrum waterfall (UHF, L, S, C) with designed signals and per-band jammers"]),
    ("solar-system", &["Planet positions across the solar system from the JPL Standish Keplerian elements", "Light time between solar-system bodies", "Uranus and Neptune from Standish Table 1, Pluto, and planetary velocities", "Positions of the Moon and seven major moons (Phobos, Deimos, the Galilean moons, Titan)", "Physical constants of every solar-system body and the whole-system report"]),
    ("body-pnt", &["Positioning around any solar-system body with a local constellation and a deep-space link from Earth"]),
    ("constellation-design", &["Walker constellation geometry and the published nominal slots of GPS, Galileo and GLONASS", "Global dilution of precision of the GPS baseline constellation", "Coverage and dilution-of-precision maps for arbitrary multi-constellation designs at scale, around any central body"]),
    ("campaign", &[]),
    ("leo-signal", &["Band-limited closed forms for any ranging signal: power in band and early-late code-tracking jitter against published values, with the Gabor bandwidth and offset spectral separation cross-checked", "Maximum Doppler of a low Earth orbit navigation satellite, which sizes the acquisition search", "Low Earth orbit positioning, navigation and timing signal designs: code tracking, acquisition, GNSS compatibility and a band trade for any system"]),
    ("leo-pass", &["A LEO-PNT pass and its per-band link budget against the MEO GNSS satellites in view", "First-order ionospheric delay per band, the ionosphere-free combination and free-space loss", "Maximum Doppler a static user sees from a LEO or MEO orbit", "Tropospheric amplitude scintillation on an Earth-space link", "Rain specific-attenuation coefficients for any band a LEO-PNT link uses", "Long-term slant-path rain attenuation on an Earth-space link", "Building entry loss for an indoor LEO-PNT user", "Named LEO-PNT system presets with stated sources, and a system-agnostic engine", "Low-energy positioning: time to first fix and energy per fix against duty cycle"]),
    ("leo-navmsg", &["Global-average signal-in-space range error weights for any orbit altitude", "Galileo ICD broadcast-ephemeris user algorithm as the base of a LEO navigation message", "LEO broadcast-ephemeris fitter and signal-in-space range error versus fit interval and update period", "Selectable LEO ephemeris models: the Liu et al. 2025 22-parameter model and the ATOMIC zero-clock polynomial", "Single-frequency ionospheric and UTC services of a LEO navigation message", "Mid-pass LEO navigation message update with a continuity check at the switch", "CRC-24Q frame check for the LEO navigation message", "Documented binary encoding of the LEO navigation message with a quantisation-error budget", "RINEX-4-style and CSV exports of LEO navigation messages"]),
    ("leo-pvt", &["Positioning from LEO Doppler, single- and multi-satellite, with clock-drift and velocity states", "Doppler a ground receiver must handle from a LEO navigation satellite", "Joint GNSS and LEO pseudorange positioning with inter-system biases and per-signal error models", "LEO-assisted time transfer to UTC against C/N0 and the receiver oscillator", "LEO coverage and dilution of precision for polar and Arctic users against MEO GNSS", "Named LEO PNT systems as optional data presets, each with its source"]),
    ("leo-ppp", &["Precise point positioning convergence with GNSS only and with LEO augmentation"]),
    ("ntn-positioning", &["5G non-terrestrial-network positioning accuracy from signal bandwidth"]),
    ("leo-pnt-chain", &["One LEO-PNT system end to end: signal design, pass link budget, navigation message and fused positioning, each stage's output handed to the next", "Band-limited closed forms for any ranging signal: power in band and early-late code-tracking jitter against published values, with the Gabor bandwidth and offset spectral separation cross-checked", "Low Earth orbit positioning, navigation and timing signal designs: code tracking, acquisition, GNSS compatibility and a band trade for any system", "A LEO-PNT pass and its per-band link budget against the MEO GNSS satellites in view", "First-order ionospheric delay per band, the ionosphere-free combination and free-space loss", "Maximum Doppler a static user sees from a LEO or MEO orbit", "Tropospheric amplitude scintillation on an Earth-space link", "Rain specific-attenuation coefficients for any band a LEO-PNT link uses", "Long-term slant-path rain attenuation on an Earth-space link", "Building entry loss for an indoor LEO-PNT user", "Named LEO-PNT system presets with stated sources, and a system-agnostic engine", "Global-average signal-in-space range error weights for any orbit altitude", "Galileo ICD broadcast-ephemeris user algorithm as the base of a LEO navigation message", "LEO broadcast-ephemeris fitter and signal-in-space range error versus fit interval and update period", "Joint GNSS and LEO pseudorange positioning with inter-system biases and per-signal error models", "Precise point positioning convergence with GNSS only and with LEO augmentation", "Named LEO PNT systems as optional data presets, each with its source"]),
];

/// Rows a kind exercises only on one input path, as (kind, matrix `requirement`, scenario
/// key). The row is listed for that kind only when the scenario carries the key somewhere
/// in its tree; otherwise the run took another path and the row, often a VALIDATED one,
/// would claim evidence the run never touched.
///
/// * `orbit` and `ephemeris` reach SGP4 only through a `tle`; an analytic orbit is a
///   two-body (optionally J2) propagation, which the SGP4-anchored row does not grade.
/// * `slot-timing` reaches the measured-record path only through `oscillator.record`; a
///   class, preset or datasheet oscillator is the modelled path.
///
/// The SRTM reader row ("SRTM digital-elevation reader on real terrain") is mapped to no
/// kind at all: `terrain-nav` and `terrain-slam` run on the synthetic DEM
/// (`DemGrid::synthetic_fixture`, keyed by `dem_seed`) and no scenario field reaches
/// `DemGrid::from_srtm_hgt`.
pub const PATH_GATED_CAPABILITIES: &[(&str, &str, &str)] = &[
    ("spectrum", "Multi-band spectrum waterfall (UHF, L, S, C) with designed signals and per-band jammers", "doc:panels"),
    ("leo-pass", "Tropospheric amplitude scintillation on an Earth-space link", "!scintillation=false"),
    ("leo-pass", "Rain specific-attenuation coefficients for any band a LEO-PNT link uses", "rain_rate_mm_h"),
    ("leo-pass", "Long-term slant-path rain attenuation on an Earth-space link", "rain_rate_mm_h"),
    ("leo-pass", "Building entry loss for an indoor LEO-PNT user", "building"),
    ("leo-pass", "Low-energy positioning: time to first fix and energy per fix against duty cycle", "iot"),
    ("leo-navmsg", "LEO broadcast-ephemeris fitter and signal-in-space range error versus fit interval and update period", "doc:fit_interval_trade"),
    ("leo-navmsg", "Selectable LEO ephemeris models: the Liu et al. 2025 22-parameter model and the ATOMIC zero-clock polynomial", "doc:model_comparison"),
    ("leo-navmsg", "Mid-pass LEO navigation message update with a continuity check at the switch", "doc:midpass_update"),
    ("leo-navmsg", "CRC-24Q frame check for the LEO navigation message", "doc:encode_decode"),
    ("leo-navmsg", "Documented binary encoding of the LEO navigation message with a quantisation-error budget", "doc:encode_decode"),
    ("leo-navmsg", "RINEX-4-style and CSV exports of LEO navigation messages", "doc:encode_decode"),
    ("leo-pvt", "Positioning from LEO Doppler, single- and multi-satellite, with clock-drift and velocity states", "doc:doppler"),
    ("leo-pvt", "Doppler a ground receiver must handle from a LEO navigation satellite", "doc:doppler"),
    ("leo-pvt", "Joint GNSS and LEO pseudorange positioning with inter-system biases and per-signal error models", "doc:joint"),
    ("leo-pvt", "LEO-assisted time transfer to UTC against C/N0 and the receiver oscillator", "doc:timing"),
    ("leo-pvt", "LEO coverage and dilution of precision for polar and Arctic users against MEO GNSS", "doc:polar"),
    ("leo-pvt", "Named LEO PNT systems as optional data presets, each with its source", "leo_preset"),
    ("leo-pnt-chain", "Tropospheric amplitude scintillation on an Earth-space link", "!scintillation=false"),
    ("leo-pnt-chain", "Rain specific-attenuation coefficients for any band a LEO-PNT link uses", "rain_rate_mm_h"),
    ("leo-pnt-chain", "Long-term slant-path rain attenuation on an Earth-space link", "rain_rate_mm_h"),
    ("leo-pnt-chain", "Building entry loss for an indoor LEO-PNT user", "building"),
    ("leo-pnt-chain", "Precise point positioning convergence with GNSS only and with LEO augmentation", "doc:ppp"),
    ("leo-pnt-chain", "Named LEO PNT systems as optional data presets, each with its source", "leo_preset"),
    ("orbit", "Orbit propagation & determination", "tle"),
    ("ephemeris", "Orbit propagation & determination", "tle"),
    (
        "slot-timing",
        "Holdover prediction from a measured clock record, checked on held-out data",
        "record",
    ),
];

/// Whether a path gate holds. A plain `key` must name a field anywhere in the scenario
/// tree; `doc:key` must name a non-null field anywhere in the result document (the run
/// took that analysis or mode); `!key=false` holds unless the scenario sets `key` to
/// `false` anywhere (a term that is on by default).
fn gate_holds(gate: &str, scn: &Value, doc: &Value) -> bool {
    if let Some(k) = gate.strip_prefix("doc:") {
        doc_has_value(doc, k)
    } else if let Some(k) = gate
        .strip_prefix('!')
        .and_then(|g| g.strip_suffix("=false"))
    {
        !scenario_sets_false(scn, k)
    } else {
        scenario_has_key(scn, gate)
    }
}

/// Whether `key` names a non-null field anywhere in the document.
fn doc_has_value(v: &Value, key: &str) -> bool {
    match v {
        Value::Object(m) => m
            .iter()
            .any(|(k, val)| (k == key && !val.is_null()) || doc_has_value(val, key)),
        Value::Array(a) => a.iter().any(|e| doc_has_value(e, key)),
        _ => false,
    }
}

/// Whether the scenario sets `key = false` anywhere.
fn scenario_sets_false(v: &Value, key: &str) -> bool {
    match v {
        Value::Object(m) => m.iter().any(|(k, val)| {
            (k == key && val == &Value::Bool(false)) || scenario_sets_false(val, key)
        }),
        Value::Array(a) => a.iter().any(|e| scenario_sets_false(e, key)),
        _ => false,
    }
}

/// Whether `key` names a field anywhere in the scenario tree.
fn scenario_has_key(v: &Value, key: &str) -> bool {
    match v {
        Value::Object(m) => m
            .iter()
            .any(|(k, val)| k == key || scenario_has_key(val, key)),
        Value::Array(a) => a.iter().any(|e| scenario_has_key(e, key)),
        _ => false,
    }
}

/// The matrix row every run exercises: the result hashing, seeding and determinism
/// discipline this report's reproducibility record rests on.
pub const COMMON_REQUIREMENT: &str = "Reproducibility & software assurance";
/// The matrix row of a campaign `timeline` (chain).
pub const CAMPAIGN_CHAIN_REQUIREMENT: &str =
    "A chained mission across scenario kinds on one shared timeline";
/// The matrix row of a campaign `sweep` or `monte_carlo`.
pub const CAMPAIGN_SWEEP_REQUIREMENT: &str =
    "Parameter sweeps and seeded Monte Carlo ensembles over any scenario kind";
/// The matrix row of a campaign `compose`.
pub const CAMPAIGN_COMPOSE_REQUIREMENT: &str =
    "Several scenarios under shared conditions, with a combined summary";

/// The matrix requirements a kind maps to in [`KIND_CAPABILITIES`]; `None` for a name
/// that is not a built-in kind.
pub fn capabilities_for_kind(kind: &str) -> Option<&'static [&'static str]> {
    KIND_CAPABILITIES
        .iter()
        .find(|(k, _)| *k == kind)
        .map(|(_, reqs)| *reqs)
}

/// How a run was invoked: the facts only the caller knows. The command-line interface
/// fills it from its arguments; a library caller may leave everything but
/// `scenario_arg` at its default.
#[derive(Clone, Debug, Default)]
pub struct Invocation {
    /// The scenario path exactly as it was passed on the command line.
    pub scenario_arg: String,
    /// Further arguments that change the result document, in order (`--eop <file>`,
    /// `--study-name <s>`). Export flags do not change it and are not listed.
    pub extra_args: Vec<String>,
    /// SHA-256 of every further input file the run read (the `--eop` file), as
    /// `(path as given, hex digest)`.
    pub input_files: Vec<(String, String)>,
    /// File name of the result document written beside the report.
    pub result_file: Option<String>,
    /// File name of the chart written beside the report.
    pub chart_file: Option<String>,
    /// File names of the animation exports this run wrote beside the report (`--animate`).
    pub animation_files: Vec<String>,
    /// `(format, file name)` of every interoperability export this run wrote beside the
    /// report (`--export`).
    pub export_files: Vec<(String, String)>,
}

/// The run's animation as the report carries it.
#[derive(Clone, Debug, Serialize)]
pub struct AnimationCompanion {
    /// Whether the result carries a time series the animation exporter can draw.
    pub available: bool,
    /// Whether the HTML report embeds the animated drawing.
    pub embedded: bool,
    /// Why there is no animation, when there is none.
    #[serde(skip_serializing_if = "Option::is_none")]
    pub reason: Option<String>,
    /// Animation files this run wrote beside the report.
    pub files: Vec<String>,
    /// The command that writes the stand-alone player.
    pub command: String,
}

/// One interoperability format as the report lists it.
#[derive(Clone, Debug, Serialize)]
pub struct ExportRow {
    /// Format name as `--export` takes it.
    pub format: String,
    /// Whether the format applies to this scenario.
    pub applies: bool,
    /// Why it does not, when it does not.
    #[serde(skip_serializing_if = "Option::is_none")]
    pub reason: Option<String>,
    /// The format's published specification.
    pub spec_url: String,
    /// Files of this format this run wrote beside the report.
    pub files: Vec<String>,
}

/// The files that accompany a run: its animation and its interoperability exports.
#[derive(Clone, Debug, Serialize)]
pub struct Companions {
    pub animation: AnimationCompanion,
    pub exports: Vec<ExportRow>,
    /// The command that writes every applicable export.
    pub export_command: String,
}

/// A section: its rows, how many rows the cap left out, and a sentence when there is
/// nothing to list (so an empty list always says why it is empty).
#[derive(Clone, Debug, Serialize)]
pub struct Section<T> {
    pub items: Vec<T>,
    pub omitted: usize,
    #[serde(skip_serializing_if = "Option::is_none")]
    pub statement: Option<String>,
}

impl<T> Section<T> {
    fn new(mut items: Vec<T>, cap: usize, empty_statement: &str) -> Self {
        let omitted = items.len().saturating_sub(cap);
        items.truncate(cap);
        let statement = if items.is_empty() {
            Some(empty_statement.to_string())
        } else {
            None
        };
        Section {
            items,
            omitted,
            statement,
        }
    }
}

/// One headline figure.
#[derive(Clone, Debug, Serialize)]
pub struct Figure {
    pub path: String,
    pub value: Value,
    pub display: String,
    pub unit: String,
    /// The per-figure verification tier, when the result's own `figure_tiers` block
    /// states one.
    #[serde(skip_serializing_if = "Option::is_none")]
    pub tier: Option<String>,
}

/// Label counts over the capability rows the run used.
#[derive(Clone, Debug, Default, Serialize)]
pub struct LabelCounts {
    pub validated: usize,
    pub modelled: usize,
    pub partner: usize,
}

/// The executive summary.
#[derive(Clone, Debug, Serialize)]
pub struct ExecutiveSummary {
    /// What the kind does, from the kind catalogue (`kshana kinds --json`).
    pub what_ran: String,
    /// The run's own one-line summary.
    pub summary: String,
    /// The run-level honesty label.
    pub label: String,
    /// Where `label` came from.
    pub label_source: String,
    pub key_figures: Vec<Figure>,
    pub capability_labels: LabelCounts,
    /// Member scenario runs, for a campaign.
    #[serde(skip_serializing_if = "Option::is_none")]
    pub member_runs: Option<u64>,
}

/// One scenario input.
#[derive(Clone, Debug, Serialize)]
pub struct InputRow {
    pub path: String,
    pub value: Value,
    pub display: String,
    pub unit: String,
    pub unit_source: String,
}

/// One scalar of the result document.
#[derive(Clone, Debug, Serialize)]
pub struct ValueRow {
    pub path: String,
    pub value: Value,
    pub display: String,
    pub unit: String,
    pub unit_source: String,
}

/// A summary of one numeric column of the result document.
#[derive(Clone, Debug, Serialize)]
pub struct SeriesRow {
    pub path: String,
    pub n: usize,
    pub min: f64,
    pub max: f64,
    pub first: f64,
    pub last: f64,
    pub unit: String,
}

/// A chart the report shows.
#[derive(Clone, Debug, Serialize)]
pub struct ChartRef {
    pub id: String,
    pub title: String,
    /// The file the chart is also written to, when it has one.
    #[serde(skip_serializing_if = "Option::is_none")]
    pub file: Option<String>,
}

/// The results section.
#[derive(Clone, Debug, Serialize)]
pub struct Results {
    pub scalars: Section<ValueRow>,
    pub series: Section<SeriesRow>,
    pub charts: Vec<ChartRef>,
}

/// One entry of the events timeline. A window has `t_end_s`; a point event does not.
#[derive(Clone, Debug, Serialize)]
pub struct EventRow {
    pub t_s: f64,
    #[serde(skip_serializing_if = "Option::is_none")]
    pub t_end_s: Option<f64>,
    pub label: String,
    pub source: String,
}

/// One verification-matrix row the run used.
#[derive(Clone, Debug, Serialize)]
pub struct CapabilityRow {
    pub requirement: String,
    pub capability: String,
    /// VALIDATED, MODELLED or PARTNER, read from the matrix.
    pub label: String,
    /// "exercised" for a row the run's code implements, "relied on, not provided" for
    /// a PARTNER row.
    pub role: String,
    pub oracle_kind: String,
    /// The oracle the row names: the source of its label.
    pub oracle: String,
    /// The test evidence the row names.
    pub tests: String,
    pub module: String,
    /// The kinds of this run that map to the row ("every run" for the common row).
    pub used_by: Vec<String>,
}

/// One per-figure tier from the result's own `figure_tiers` block.
#[derive(Clone, Debug, Serialize)]
pub struct FigureTierRow {
    pub path: String,
    pub requirement: String,
    pub tier: String,
    pub applicable: bool,
}

/// The verification-labels section.
#[derive(Clone, Debug, Serialize)]
pub struct Capabilities {
    pub statement: String,
    pub rows: Vec<CapabilityRow>,
    pub figure_tiers: Vec<FigureTierRow>,
}

/// One not-modelled item or assumption, with where it was read from.
#[derive(Clone, Debug, Serialize)]
pub struct NoteRow {
    pub text: String,
    pub source: String,
}

/// A table of the aggregation section. Cells are the raw values; `null` is a missing
/// member value.
#[derive(Clone, Debug, Serialize)]
pub struct Table {
    pub title: String,
    pub columns: Vec<String>,
    pub units: Vec<String>,
    pub rows: Vec<Vec<Value>>,
}

/// A Monte Carlo metric's samples, for the distribution chart.
#[derive(Clone, Debug, Serialize)]
pub struct Distribution {
    pub metric: String,
    pub unit: String,
    pub n: usize,
    /// Histogram bin edges (`bins + 1` of them) and counts.
    pub edges: Vec<f64>,
    pub counts: Vec<usize>,
    pub p05: Option<f64>,
    pub p50: Option<f64>,
    pub p95: Option<f64>,
}

/// The aggregation section of a campaign or sweep.
#[derive(Clone, Debug, Serialize)]
pub struct Aggregation {
    /// `chain`, `sweep`, `monte-carlo` or `compose`.
    pub mode: String,
    #[serde(skip_serializing_if = "Option::is_none")]
    pub member_kind: Option<String>,
    #[serde(skip_serializing_if = "Option::is_none")]
    pub runs_total: Option<u64>,
    #[serde(skip_serializing_if = "Option::is_none")]
    pub run_digest: Option<String>,
    pub tables: Vec<Table>,
    pub distributions: Vec<Distribution>,
}

/// The build platform.
#[derive(Clone, Debug, Serialize)]
pub struct Platform {
    pub os: String,
    pub arch: String,
    pub family: String,
}

/// A further input file and its digest.
#[derive(Clone, Debug, Serialize)]
pub struct InputFile {
    pub path: String,
    pub sha256: String,
}

/// The reproducibility record.
#[derive(Clone, Debug, Serialize)]
pub struct Reproducibility {
    pub engine_version: String,
    /// The source commit recorded at build time, if the build recorded one.
    pub git_commit: Option<String>,
    pub git_commit_note: String,
    pub scenario_file: String,
    /// SHA-256 of the scenario file's exact bytes.
    pub scenario_sha256: String,
    /// The `scenario_hash` the result document states, when it states one. It is the
    /// kind's own fingerprint (often of a canonical form, not of the file bytes).
    pub result_scenario_hash: Option<String>,
    /// SHA-256 of the result document's exact bytes.
    pub result_sha256: String,
    #[serde(skip_serializing_if = "Option::is_none")]
    pub result_file: Option<String>,
    pub seed: Option<u64>,
    pub seed_source: String,
    pub platform: Platform,
    /// The command that reproduces the result document, shell-quoted.
    pub command: String,
    /// The same command as an argument vector.
    pub argv: Vec<String>,
    pub working_directory: String,
    pub input_files: Vec<InputFile>,
    /// The generation stamp the result carries (only with `--study-name`).
    #[serde(skip_serializing_if = "Option::is_none")]
    pub generated_utc: Option<String>,
    pub determinism: String,
}

/// The whole report. Field order is the document order of `report.json`.
#[derive(Clone, Debug, Serialize)]
pub struct Report {
    pub report_schema: String,
    pub report_schema_version: String,
    pub kind: String,
    pub title: String,
    pub executive_summary: ExecutiveSummary,
    pub inputs: Section<InputRow>,
    pub results: Results,
    #[serde(skip_serializing_if = "Option::is_none")]
    pub aggregation: Option<Aggregation>,
    pub events: Section<EventRow>,
    pub capabilities: Capabilities,
    pub not_modelled: Section<NoteRow>,
    pub companions: Companions,
    pub reproducibility: Reproducibility,
    /// The animated drawing the HTML report embeds (not part of `report.json`).
    #[serde(skip)]
    pub animation_svg: Option<String>,
}

// ---------------------------------------------------------------------------------------
// Small pure helpers
// ---------------------------------------------------------------------------------------

/// Lower-case hexadecimal SHA-256 of `bytes`.
pub fn sha256_hex(bytes: &[u8]) -> String {
    let mut h = Sha256::new();
    h.update(bytes);
    hex::encode(h.finalize())
}

/// A number as the report prints it: an integer value as an integer, a magnitude in
/// [1e-3, 1e5) with up to six decimals and trailing zeros trimmed, and anything else in
/// exponent form with five significant figures. Deterministic for a given `f64`.
pub fn fmt_num(v: f64) -> String {
    if !v.is_finite() {
        // A JSON document cannot carry a non-finite number; this branch exists so the
        // function is total, and it never prints the three letters a reader would take
        // for a defect.
        return if v.is_nan() {
            "not a number".to_string()
        } else if v > 0.0 {
            "+infinity".to_string()
        } else {
            "-infinity".to_string()
        };
    }
    if v == 0.0 {
        return "0".to_string();
    }
    let a = v.abs();
    if v.fract() == 0.0 && a < 1e12 {
        return format!("{v:.0}");
    }
    if !(1e-3..1e5).contains(&a) {
        return format!("{v:.4e}");
    }
    let s = format!("{v:.6}");
    let s = s.trim_end_matches('0');
    s.trim_end_matches('.').to_string()
}

/// A JSON value as a report cell shows it. `null` reads "no value"; an ensemble
/// statistic object reads as its mean with the 5th-95th percentile span.
pub fn display_value(v: &Value) -> String {
    match v {
        Value::Null => "no value".to_string(),
        Value::Bool(b) => b.to_string(),
        Value::Number(n) => n.as_f64().map(fmt_num).unwrap_or_else(|| n.to_string()),
        Value::String(s) if s.is_empty() => "(empty text)".to_string(),
        // A text value that happens to be a word a reader takes for a rendering defect
        // (the geometric dilution of precision status of a singular geometry is the string
        // "undefined") is quoted and
        // attributed, so the page cannot be misread as broken.
        Value::String(s)
            if ["undefined", "nan", "null", "none", "inf", "-inf"]
                .contains(&s.trim().to_ascii_lowercase().as_str()) =>
        {
            format!("\u{201c}{s}\u{201d} (text as the document states it)")
        }
        Value::String(s) => s.clone(),
        Value::Array(a) => {
            if a.is_empty() {
                return "[] (no elements)".to_string();
            }
            let shown: Vec<String> = a.iter().take(8).map(display_value).collect();
            if a.len() > 8 {
                format!("[{}, …] ({} values)", shown.join(", "), a.len())
            } else {
                format!("[{}]", shown.join(", "))
            }
        }
        Value::Object(m) => {
            if let (Some(mean), Some(p05), Some(p95)) = (
                m.get("mean").and_then(Value::as_f64),
                m.get("p05").and_then(Value::as_f64),
                m.get("p95").and_then(Value::as_f64),
            ) {
                return format!(
                    "mean {} (5th to 95th percentile {} to {})",
                    fmt_num(mean),
                    fmt_num(p05),
                    fmt_num(p95)
                );
            }
            if m.is_empty() {
                return "{} (no fields)".to_string();
            }
            let parts: Vec<String> = m
                .iter()
                .take(6)
                .map(|(k, v)| format!("{k}: {}", display_value(v)))
                .collect();
            if m.len() > 6 {
                format!("{}; … ({} fields)", parts.join("; "), m.len())
            } else {
                parts.join("; ")
            }
        }
    }
}

/// Quote one argument for a POSIX shell: bare when it is plainly safe, single-quoted
/// otherwise.
pub fn shell_quote(arg: &str) -> String {
    let safe = !arg.is_empty()
        && arg
            .chars()
            .all(|c| c.is_ascii_alphanumeric() || "_./:=+-@%,".contains(c));
    if safe {
        arg.to_string()
    } else {
        format!("'{}'", arg.replace('\'', "'\\''"))
    }
}

/// The unit a field-name suffix states, by the crate's naming convention (`_s`, `_ns`,
/// `_m`, `_deg`, `_dbw`, …). `None` when the name carries no recognised suffix.
pub fn unit_from_suffix(name: &str) -> Option<&'static str> {
    const SUFFIXES: &[(&str, &str)] = &[
        ("_dbhz", "dB-Hz"),
        ("_db_hz", "dB-Hz"),
        ("_dbw", "dBW"),
        ("_dbm", "dBm"),
        ("_dbi", "dBi"),
        ("_db", "dB"),
        ("_ns", "ns"),
        ("_ps", "ps"),
        ("_us", "us"),
        ("_ms", "ms"),
        ("_ghz", "GHz"),
        ("_mhz", "MHz"),
        ("_khz", "kHz"),
        ("_hz", "Hz"),
        ("_km_s", "km/s"),
        ("_m_s2", "m/s^2"),
        ("_m_s", "m/s"),
        ("_mps", "m/s"),
        ("_km", "km"),
        ("_mm", "mm"),
        ("_cm", "cm"),
        ("_m", "m"),
        ("_deg", "deg"),
        ("_rad", "rad"),
        ("_arcsec", "arcsec"),
        ("_mas", "mas"),
        ("_mgal", "mGal"),
        ("_nt", "nT"),
        ("_kg", "kg"),
        ("_k", "K"),
        ("_w", "W"),
        ("_bps", "bit/s"),
        ("_days", "d"),
        ("_day", "d"),
        ("_hours", "h"),
        ("_min", "min"),
        ("_s", "s"),
        ("_ppb", "ppb"),
        ("_ppm", "ppm"),
        ("_pct", "%"),
    ];
    let lower = name.to_ascii_lowercase();
    SUFFIXES
        .iter()
        .find(|(suf, _)| lower.ends_with(suf) && lower.len() > suf.len())
        .map(|(_, unit)| *unit)
}

/// Escape the five characters that matter in HTML text and attribute context.
fn esc(s: &str) -> String {
    s.replace('&', "&amp;")
        .replace('<', "&lt;")
        .replace('>', "&gt;")
        .replace('"', "&quot;")
        .replace('\'', "&#39;")
}

/// Percent-encode an SVG for an inert `data:` URI image.
fn svg_data_uri(svg: &str) -> String {
    let mut out = String::from("data:image/svg+xml,");
    for b in svg.bytes() {
        match b {
            b'%' | b'#' | b'<' | b'>' | b'"' | b'&' | b'\n' | b'\r' | b'\t' => {
                out.push_str(&format!("%{b:02X}"));
            }
            // A multi-byte UTF-8 character is percent-encoded byte by byte; pushing each
            // byte as a `char` would re-encode it as Latin-1 and print mojibake.
            b if b >= 0x80 => out.push_str(&format!("%{b:02X}")),
            _ => out.push(b as char),
        }
    }
    out
}

/// A TOML value as JSON. A non-finite float (legal in TOML, not in JSON) becomes its
/// TOML spelling as a string, so nothing is lost and nothing becomes `null`.
fn toml_to_json(v: &toml::Value) -> Value {
    match v {
        toml::Value::String(s) => Value::String(s.clone()),
        toml::Value::Integer(i) => Value::from(*i),
        toml::Value::Float(f) => serde_json::Number::from_f64(*f)
            .map(Value::Number)
            .unwrap_or_else(|| Value::String(f.to_string())),
        toml::Value::Boolean(b) => Value::Bool(*b),
        toml::Value::Datetime(d) => Value::String(d.to_string()),
        toml::Value::Array(a) => Value::Array(a.iter().map(toml_to_json).collect()),
        toml::Value::Table(t) => {
            let mut m = Map::new();
            for (k, v) in t {
                m.insert(k.clone(), toml_to_json(v));
            }
            Value::Object(m)
        }
    }
}

/// The value at a dotted path of plain object keys.
fn value_at<'a>(doc: &'a Value, path: &str) -> Option<&'a Value> {
    let mut cur = doc;
    for seg in path.split('.') {
        cur = cur.get(seg)?;
    }
    Some(cur)
}

/// `a[3].b[0].c` → `a[].b[].c`: the units-block spelling of an indexed path.
fn pattern_of(path: &str) -> String {
    let mut out = String::with_capacity(path.len());
    let mut in_index = false;
    for c in path.chars() {
        match c {
            '[' => {
                in_index = true;
                out.push('[');
            }
            ']' => {
                in_index = false;
                out.push(']');
            }
            _ if in_index => {}
            _ => out.push(c),
        }
    }
    out
}

/// The last name segment of a path, without any `[]`.
fn leaf_name(path: &str) -> &str {
    let last = path.rsplit('.').next().unwrap_or(path);
    match last.find('[') {
        Some(i) => &last[..i],
        None => last,
    }
}

// ---------------------------------------------------------------------------------------
// Unit resolution
// ---------------------------------------------------------------------------------------

/// Resolve a unit for `path` (an indexed path) against the result's `units` block.
/// `input` restricts the by-name fallback to entries whose provenance is an input class.
fn resolve_unit(units: Option<&Map<String, Value>>, path: &str, input: bool) -> (String, String) {
    let pat = pattern_of(path);
    if let Some(units) = units {
        if let Some((key, entry)) = crate::field_schema::lookup(units, &pat) {
            if let Some(u) = entry.get("unit").and_then(Value::as_str) {
                return (
                    u.to_string(),
                    format!("field-units schema: units entry `{key}`"),
                );
            }
        }
        if input {
            let leaf = leaf_name(path);
            let mut found: BTreeMap<String, String> = BTreeMap::new();
            for (key, entry) in units {
                let prov = entry
                    .get("provenance")
                    .and_then(Value::as_str)
                    .unwrap_or("");
                if !matches!(prov, "input" | "modelled-input" | "measured-or-input") {
                    continue;
                }
                if leaf_name(key) != leaf {
                    continue;
                }
                if let Some(u) = entry.get("unit").and_then(Value::as_str) {
                    found.entry(u.to_string()).or_insert_with(|| key.clone());
                }
            }
            if found.len() == 1 {
                if let Some((u, key)) = found.into_iter().next() {
                    return (
                        u,
                        format!("field-units schema: input entry `{key}`, matched by field name"),
                    );
                }
            }
        }
    }
    if let Some(u) = unit_from_suffix(leaf_name(path)) {
        return (u.to_string(), "field-name suffix".to_string());
    }
    (
        "not stated".to_string(),
        "no units entry and no unit suffix".to_string(),
    )
}

// ---------------------------------------------------------------------------------------
// Section builders
// ---------------------------------------------------------------------------------------

/// Arrays of tables longer than this are summarised per column in the inputs table
/// rather than listed row by row (an ingested series can carry thousands of rows).
const MAX_INPUT_TABLE_ROWS: usize = 24;

fn flatten_inputs(v: &Value, prefix: &str, out: &mut Vec<(String, Value, Option<String>)>) {
    match v {
        Value::Object(m) => {
            for (k, val) in m {
                let p = if prefix.is_empty() {
                    k.clone()
                } else {
                    format!("{prefix}.{k}")
                };
                flatten_inputs(val, &p, out);
            }
        }
        Value::Array(a) if a.len() > MAX_INPUT_TABLE_ROWS && a.iter().all(Value::is_object) => {
            let mut keys: BTreeSet<&str> = BTreeSet::new();
            for e in a {
                if let Some(m) = e.as_object() {
                    keys.extend(m.keys().map(String::as_str));
                }
            }
            for k in keys {
                let nums: Vec<f64> = a
                    .iter()
                    .filter_map(|e| e.get(k).and_then(Value::as_f64))
                    .collect();
                let path = format!("{prefix}[].{k}");
                if nums.is_empty() {
                    let n = a.iter().filter(|e| e.get(k).is_some()).count();
                    let text = format!("{n} rows of a non-numeric column");
                    out.push((path, Value::String(text.clone()), Some(text)));
                } else {
                    let min = nums.iter().copied().fold(f64::INFINITY, f64::min);
                    let max = nums.iter().copied().fold(f64::NEG_INFINITY, f64::max);
                    let mut summary = Map::new();
                    summary.insert("rows".into(), Value::from(nums.len()));
                    summary.insert("min".into(), Value::from(min));
                    summary.insert("max".into(), Value::from(max));
                    out.push((
                        path,
                        Value::Object(summary),
                        Some(format!(
                            "{} rows, from {} to {}",
                            nums.len(),
                            fmt_num(min),
                            fmt_num(max)
                        )),
                    ));
                }
            }
        }
        Value::Array(a) if a.iter().any(Value::is_object) => {
            for (i, e) in a.iter().enumerate() {
                flatten_inputs(e, &format!("{prefix}[{i}]"), out);
            }
        }
        _ => out.push((prefix.to_string(), v.clone(), None)),
    }
}

fn build_inputs(scn: &Value, units: Option<&Map<String, Value>>) -> Section<InputRow> {
    let mut leaves = Vec::new();
    flatten_inputs(scn, "", &mut leaves);
    let rows: Vec<InputRow> = leaves
        .into_iter()
        .map(|(path, value, display)| {
            let (unit, unit_source) = match &value {
                Value::String(_) => (
                    "text".to_string(),
                    "a text input carries no unit".to_string(),
                ),
                Value::Bool(_) => (
                    "flag".to_string(),
                    "a true/false input carries no unit".to_string(),
                ),
                _ => resolve_unit(units, &path, true),
            };
            InputRow {
                display: display.unwrap_or_else(|| display_value(&value)),
                path,
                value,
                unit,
                unit_source,
            }
        })
        .collect();
    Section::new(
        rows,
        MAX_INPUTS,
        "The scenario sets no field beyond `kind`: the kind ran its reference configuration from its documented defaults.",
    )
}

/// Root keys of a result document that are metadata, not results.
const RESULT_META_KEYS: &[&str] = &[
    "units",
    "figure_tiers",
    "schema_version",
    "engine_version",
    "scenario_hash",
    "kind",
    "label",
    "title",
    "meta",
];

fn collect_scalars(v: &Value, prefix: &str, root: bool, out: &mut Vec<(String, Value)>) {
    match v {
        Value::Object(m) => {
            for (k, val) in m {
                if root && RESULT_META_KEYS.contains(&k.as_str()) {
                    continue;
                }
                let p = if prefix.is_empty() {
                    k.clone()
                } else {
                    format!("{prefix}.{k}")
                };
                collect_scalars(val, &p, false, out);
            }
        }
        Value::Array(_) => {}
        Value::String(s) if s.chars().count() > MAX_RESULT_STRING => {}
        _ => out.push((prefix.to_string(), v.clone())),
    }
}

fn collect_series(
    v: &Value,
    prefix: &str,
    root: bool,
    in_array: bool,
    out: &mut BTreeMap<String, Vec<f64>>,
) {
    match v {
        Value::Object(m) => {
            for (k, val) in m {
                if root && RESULT_META_KEYS.contains(&k.as_str()) {
                    continue;
                }
                let p = if prefix.is_empty() {
                    k.clone()
                } else {
                    format!("{prefix}.{k}")
                };
                collect_series(val, &p, false, in_array, out);
            }
        }
        Value::Array(a) => {
            let p = format!("{prefix}[]");
            for e in a {
                collect_series(e, &p, false, true, out);
            }
        }
        Value::Number(n) if in_array => {
            if let Some(f) = n.as_f64() {
                out.entry(prefix.to_string()).or_default().push(f);
            }
        }
        _ => {}
    }
}

fn build_results(
    doc: &Value,
    units: Option<&Map<String, Value>>,
    charts: Vec<ChartRef>,
) -> Results {
    let mut leaves = Vec::new();
    collect_scalars(doc, "", true, &mut leaves);
    let scalars: Vec<ValueRow> = leaves
        .into_iter()
        .map(|(path, value)| {
            let (unit, unit_source) = match &value {
                Value::Number(_) => resolve_unit(units, &path, false),
                Value::Null => resolve_unit(units, &path, false),
                Value::Bool(_) => (
                    "flag".to_string(),
                    "a true/false result carries no unit".to_string(),
                ),
                _ => (
                    "text".to_string(),
                    "a text result carries no unit".to_string(),
                ),
            };
            ValueRow {
                display: display_value(&value),
                path,
                value,
                unit,
                unit_source,
            }
        })
        .collect();
    let mut cols = BTreeMap::new();
    collect_series(doc, "", true, false, &mut cols);
    let series: Vec<SeriesRow> = cols
        .into_iter()
        .filter(|(_, v)| !v.is_empty())
        .map(|(path, v)| {
            let min = v.iter().copied().fold(f64::INFINITY, f64::min);
            let max = v.iter().copied().fold(f64::NEG_INFINITY, f64::max);
            let (unit, _) = resolve_unit(units, &path, false);
            SeriesRow {
                n: v.len(),
                min,
                max,
                first: v[0],
                last: v[v.len() - 1],
                unit,
                path,
            }
        })
        .collect();
    Results {
        scalars: Section::new(
            scalars,
            MAX_SCALARS,
            "The result document carries no scalar outside its arrays; its numbers are summarised by column below.",
        ),
        series: Section::new(
            series,
            MAX_SERIES,
            "The result document carries no numeric array: every result is a scalar in the table above.",
        ),
        charts,
    }
}

/// Keys that name a timed window's start and end in a scenario table.
const WINDOW_KEYS: &[(&str, Option<&str>)] = &[
    ("t0", Some("t1")),
    ("t0_s", Some("t1_s")),
    ("on_s", Some("off_s")),
    ("t_on_s", Some("t_off_s")),
    ("start_s", Some("end_s")),
    ("start_s", Some("stop_s")),
    ("onset_s", None),
    ("at_s", None),
];
/// String fields that name what a window is.
const LABEL_KEYS: &[&str] = &[
    "name",
    "state",
    "kind",
    "type",
    "jammer_type",
    "id",
    "label",
    "mode",
];

fn window_label(obj: &Map<String, Value>, path: &str) -> String {
    let parts: Vec<String> = LABEL_KEYS
        .iter()
        .filter_map(|k| {
            obj.get(*k)
                .and_then(Value::as_str)
                .map(|s| format!("{k} = {s}"))
        })
        .collect();
    if parts.is_empty() {
        path.to_string()
    } else {
        format!("{path}: {}", parts.join(", "))
    }
}

fn collect_input_events(v: &Value, prefix: &str, out: &mut Vec<EventRow>) {
    match v {
        Value::Object(m) => {
            for (k, val) in m {
                let p = if prefix.is_empty() {
                    k.clone()
                } else {
                    format!("{prefix}.{k}")
                };
                collect_input_events(val, &p, out);
            }
        }
        Value::Array(a) => {
            for (i, e) in a.iter().enumerate() {
                let p = format!("{prefix}[{i}]");
                if let Some(obj) = e.as_object() {
                    for (start, end) in WINDOW_KEYS {
                        let Some(t0) = obj.get(*start).and_then(Value::as_f64) else {
                            continue;
                        };
                        let t1 = end.and_then(|k| obj.get(k)).and_then(Value::as_f64);
                        out.push(EventRow {
                            t_s: t0,
                            t_end_s: t1,
                            label: window_label(obj, &p),
                            source: format!(
                                "scenario `{p}.{start}`{}",
                                end.filter(|_| t1.is_some())
                                    .map(|k| format!(" / `{k}`"))
                                    .unwrap_or_default()
                            ),
                        });
                        break;
                    }
                }
                collect_input_events(e, &p, out);
            }
        }
        _ => {}
    }
}

fn collect_result_events(v: &Value, prefix: &str, out: &mut Vec<EventRow>) {
    let Value::Object(m) = v else {
        return;
    };
    for (k, val) in m {
        if prefix.is_empty() && k == "units" {
            continue;
        }
        let p = if prefix.is_empty() {
            k.clone()
        } else {
            format!("{prefix}.{k}")
        };
        if k == "events" {
            if let Some(a) = val.as_array() {
                for e in a {
                    let Some(obj) = e.as_object() else { continue };
                    let Some(t) = obj
                        .get("t_s")
                        .or_else(|| obj.get("t"))
                        .and_then(Value::as_f64)
                    else {
                        continue;
                    };
                    let mut label = ["label", "name", "event", "what"]
                        .iter()
                        .find_map(|k| obj.get(*k).and_then(Value::as_str))
                        .unwrap_or("event")
                        .to_string();
                    if let Some(ph) = obj.get("phase").and_then(Value::as_str) {
                        label = format!("{label} (phase {ph})");
                    }
                    if obj.get("alarm").and_then(Value::as_bool) == Some(true) {
                        label.push_str(" [alarm]");
                    }
                    out.push(EventRow {
                        t_s: t,
                        t_end_s: None,
                        label,
                        source: format!("result `{p}[]`"),
                    });
                }
            }
        }
        if val.is_object() {
            collect_result_events(val, &p, out);
        }
    }
}

fn build_events(kind: &str, scn: &Value, doc: &Value) -> Section<EventRow> {
    let mut rows = Vec::new();
    if let Some(tl) = doc.get("timeline").filter(|_| kind == "campaign") {
        if let Some(phases) = tl.get("phases").and_then(Value::as_array) {
            for (i, ph) in phases.iter().enumerate() {
                let (Some(t0), Some(t1)) = (
                    ph.get("t0_s").and_then(Value::as_f64),
                    ph.get("t1_s").and_then(Value::as_f64),
                ) else {
                    continue;
                };
                let name = ph.get("name").and_then(Value::as_str).unwrap_or("phase");
                let ended = ph.get("ended_by").and_then(Value::as_str).unwrap_or("");
                rows.push(EventRow {
                    t_s: t0,
                    t_end_s: Some(t1),
                    label: if ended.is_empty() {
                        format!("phase {name}")
                    } else {
                        format!("phase {name} (ended by {ended})")
                    },
                    source: format!("result `timeline.phases[{i}]`"),
                });
            }
        }
        if let Some(hs) = tl.get("handoffs").and_then(Value::as_array) {
            for (i, h) in hs.iter().enumerate() {
                let phase = h.get("phase").and_then(Value::as_str).unwrap_or("");
                let t0 = tl
                    .get("phases")
                    .and_then(Value::as_array)
                    .and_then(|ps| {
                        ps.iter()
                            .find(|p| p.get("name").and_then(Value::as_str) == Some(phase))
                    })
                    .and_then(|p| p.get("t0_s"))
                    .and_then(Value::as_f64);
                if let Some(t0) = t0 {
                    rows.push(EventRow {
                        t_s: t0,
                        t_end_s: None,
                        label: format!(
                            "hand-off into phase {phase}: {} → {} = {} {}",
                            h.get("from").and_then(Value::as_str).unwrap_or(""),
                            h.get("to").and_then(Value::as_str).unwrap_or(""),
                            h.get("value").map(display_value).unwrap_or_default(),
                            h.get("unit").and_then(Value::as_str).unwrap_or("")
                        )
                        .trim_end()
                        .to_string(),
                        source: format!("result `timeline.handoffs[{i}]`"),
                    });
                }
            }
        }
    } else {
        collect_input_events(scn, "", &mut rows);
        let duration = scn
            .get("time")
            .and_then(|t| t.get("duration_s"))
            .and_then(Value::as_f64)
            .map(|d| (d, "time.duration_s"))
            .or_else(|| {
                scn.get("duration_s")
                    .and_then(Value::as_f64)
                    .map(|d| (d, "duration_s"))
            });
        if let Some((d, key)) = duration {
            rows.push(EventRow {
                t_s: 0.0,
                t_end_s: Some(d),
                label: "run span".to_string(),
                source: format!("scenario `{key}`"),
            });
        }
    }
    collect_result_events(doc, "", &mut rows);
    rows.sort_by(|a, b| {
        a.t_s
            .total_cmp(&b.t_s)
            .then_with(|| {
                b.t_end_s
                    .unwrap_or(f64::NEG_INFINITY)
                    .total_cmp(&a.t_end_s.unwrap_or(f64::NEG_INFINITY))
            })
            .then_with(|| a.label.cmp(&b.label))
            .then_with(|| a.source.cmp(&b.source))
    });
    Section::new(
        rows,
        MAX_EVENTS,
        "No timed event: the scenario scripts no window or onset time and the result reports no event. The kind evaluates its configuration as one case.",
    )
}

/// Every built-in kind name found in `kind` / `scenario_kind` string fields of the
/// scenario (below its root) and of the result (anywhere).
fn member_kinds(scn: &Value, doc: &Value, known: &BTreeSet<&'static str>) -> BTreeSet<String> {
    fn walk(
        v: &Value,
        root: bool,
        skip_root_kind: bool,
        known: &BTreeSet<&'static str>,
        out: &mut BTreeSet<String>,
    ) {
        match v {
            Value::Object(m) => {
                for (k, val) in m {
                    if (k == "kind" || k == "scenario_kind") && !(root && skip_root_kind) {
                        if let Some(s) = val.as_str() {
                            if known.contains(s) {
                                out.insert(s.to_string());
                            }
                        }
                    }
                    if !(root && k == "units") {
                        walk(val, false, skip_root_kind, known, out);
                    }
                }
            }
            Value::Array(a) => {
                for e in a {
                    walk(e, false, skip_root_kind, known, out);
                }
            }
            _ => {}
        }
    }
    let mut out = BTreeSet::new();
    walk(scn, true, true, known, &mut out);
    walk(doc, true, false, known, &mut out);
    out
}

fn status_tag(s: VerificationStatus) -> &'static str {
    s.tag()
}

fn build_capabilities(
    kind: &str,
    members: &BTreeSet<String>,
    scn: &Value,
    doc: &Value,
    matrix: &[VerificationItem],
) -> Capabilities {
    // requirement -> (matrix index, used_by)
    let mut used: BTreeMap<usize, BTreeSet<String>> = BTreeMap::new();
    let mut add = |req: &str, by: &str| {
        if let Some(i) = matrix.iter().position(|r| r.requirement == req) {
            used.entry(i).or_default().insert(by.to_string());
        }
    };
    add(COMMON_REQUIREMENT, "every run");
    let mut kinds: BTreeSet<String> = members.clone();
    kinds.insert(kind.to_string());
    for k in &kinds {
        if let Some(reqs) = capabilities_for_kind(k) {
            for r in reqs {
                let gated = PATH_GATED_CAPABILITIES
                    .iter()
                    .find(|(gk, gr, _)| gk == k && gr == r);
                if let Some((_, _, key)) = gated {
                    if !gate_holds(key, scn, doc) {
                        continue;
                    }
                }
                add(r, k);
            }
        }
    }
    if kinds.contains("campaign") {
        if doc.get("timeline").is_some() {
            add(CAMPAIGN_CHAIN_REQUIREMENT, "campaign");
        }
        if doc.get("sweep").is_some() || doc.get("monte_carlo").is_some() {
            add(CAMPAIGN_SWEEP_REQUIREMENT, "campaign");
        }
        if doc.get("compose").is_some() {
            add(CAMPAIGN_COMPOSE_REQUIREMENT, "campaign");
        }
    }
    let rows = used
        .into_iter()
        .map(|(i, by)| {
            let it = &matrix[i];
            let partner = it.status == VerificationStatus::PartnerOwned;
            CapabilityRow {
                requirement: it.requirement.to_string(),
                capability: it.capability.to_string(),
                label: status_tag(it.status).to_string(),
                role: if partner {
                    "relied on, not provided".to_string()
                } else {
                    "exercised".to_string()
                },
                oracle_kind: format!("{:?}", it.oracle_kind),
                oracle: if it.oracle.is_empty() {
                    "none: a partner-owned discipline, with no module and no test by design"
                        .to_string()
                } else {
                    it.oracle.to_string()
                },
                tests: if it.tests.is_empty() {
                    "none: a partner-owned discipline".to_string()
                } else {
                    it.tests.to_string()
                },
                module: if it.module.is_empty() {
                    "none".to_string()
                } else {
                    it.module.to_string()
                },
                used_by: by.into_iter().collect(),
            }
        })
        .collect();
    let figure_tiers = doc
        .get(crate::api::FIGURE_TIERS_KEY)
        .and_then(|b| b.get("figures"))
        .and_then(Value::as_array)
        .map(|figs| {
            figs.iter()
                .filter_map(|f| {
                    Some(FigureTierRow {
                        path: f.get("path")?.as_str()?.to_string(),
                        requirement: f
                            .get("requirement")
                            .and_then(Value::as_str)
                            .unwrap_or("")
                            .to_string(),
                        tier: f.get("tier")?.as_str()?.to_string(),
                        applicable: f.get("applicable").and_then(Value::as_bool).unwrap_or(true),
                    })
                })
                .collect()
        })
        .unwrap_or_default();
    Capabilities {
        statement: "Each row is a verification-matrix row this run's kinds exercise, with the label and the oracle the matrix gives it (src/verification.rs, docs/VERIFICATION-MATRIX.md). A label grades the capability as the matrix records it; it does not grade this scenario's configuration, and a VALIDATED row does not make the run's inputs measured. A PARTNER row is a discipline the run relies on that Kshana does not provide.".to_string(),
        rows,
        figure_tiers,
    }
}

fn split_sentences(text: &str) -> Vec<String> {
    let mut out = Vec::new();
    let mut cur = String::new();
    let chars: Vec<char> = text.chars().collect();
    for (i, &c) in chars.iter().enumerate() {
        cur.push(c);
        let end = c == '.' && chars.get(i + 1).is_none_or(|n| n.is_whitespace());
        if end {
            let s = cur.trim().to_string();
            if !s.is_empty() {
                out.push(s);
            }
            cur.clear();
        }
    }
    let s = cur.trim().to_string();
    if !s.is_empty() {
        out.push(s);
    }
    out
}

fn is_not_modelled_text(s: &str) -> bool {
    let lower = s.to_ascii_lowercase();
    s.contains("MODELLED")
        || lower.contains("not modelled")
        || lower.contains("not modeled")
        || lower.contains("not model")
        || lower.contains("assum")
}

const NOTE_KEYS: &[&str] = &[
    "not_modelled",
    "not_implemented",
    "honesty",
    "limitations",
    "assumptions",
    "modelled_note",
    "caveats",
];

fn collect_note_blocks(v: &Value, prefix: &str, out: &mut Vec<NoteRow>) {
    let Value::Object(m) = v else {
        if let Value::Array(a) = v {
            for (i, e) in a.iter().enumerate() {
                collect_note_blocks(e, &format!("{prefix}[{i}]"), out);
            }
        }
        return;
    };
    for (k, val) in m {
        if prefix.is_empty() && k == "units" {
            continue;
        }
        let p = if prefix.is_empty() {
            k.clone()
        } else {
            format!("{prefix}.{k}")
        };
        if NOTE_KEYS.contains(&k.as_str()) {
            push_note_value(val, &p, out);
        } else {
            collect_note_blocks(val, &p, out);
        }
    }
}

fn push_note_value(v: &Value, path: &str, out: &mut Vec<NoteRow>) {
    match v {
        Value::String(s) if !s.trim().is_empty() => out.push(NoteRow {
            text: s.trim().to_string(),
            source: format!("result `{path}`"),
        }),
        Value::Array(a) => {
            for (i, e) in a.iter().enumerate() {
                push_note_value(e, &format!("{path}[{i}]"), out);
            }
        }
        Value::Object(m) => {
            for (k, e) in m {
                match e {
                    Value::String(s) if !s.trim().is_empty() => out.push(NoteRow {
                        text: format!("{k}: {}", s.trim()),
                        source: format!("result `{path}.{k}`"),
                    }),
                    Value::Bool(b) => out.push(NoteRow {
                        text: format!("{k}: {b}"),
                        source: format!("result `{path}.{k}`"),
                    }),
                    _ => push_note_value(e, &format!("{path}.{k}"), out),
                }
            }
        }
        _ => {}
    }
}

fn collect_input_notes(v: &Value, prefix: &str, out: &mut Vec<NoteRow>) {
    match v {
        Value::Object(m) => {
            for (k, val) in m {
                let p = if prefix.is_empty() {
                    k.clone()
                } else {
                    format!("{prefix}.{k}")
                };
                collect_input_notes(val, &p, out);
            }
        }
        Value::Array(a) => {
            for (i, e) in a.iter().enumerate() {
                collect_input_notes(e, &format!("{prefix}[{i}]"), out);
            }
        }
        Value::String(s) => {
            let lower = s.to_ascii_lowercase();
            if lower.contains("not model") || s.contains("MODELLED") {
                out.push(NoteRow {
                    text: s.trim().to_string(),
                    source: format!("scenario input `{prefix}`"),
                });
            }
        }
        _ => {}
    }
}

/// Comment paragraphs of the scenario file that state what is modelled or assumed.
fn collect_comment_notes(src: &str, out: &mut Vec<NoteRow>) {
    let mut para: Vec<&str> = Vec::new();
    let mut start = 0usize;
    let flush = |para: &mut Vec<&str>, start: usize, out: &mut Vec<NoteRow>| {
        if para.is_empty() {
            return;
        }
        let text = para.join(" ");
        let text = text.split_whitespace().collect::<Vec<_>>().join(" ");
        if is_not_modelled_text(&text) {
            out.push(NoteRow {
                text,
                source: if para.len() == 1 {
                    format!("scenario file comment, line {start}")
                } else {
                    format!(
                        "scenario file comment, lines {start} to {}",
                        start + para.len() - 1
                    )
                },
            });
        }
        para.clear();
    };
    for (i, line) in src.lines().enumerate() {
        let t = line.trim_start();
        if let Some(body) = t.strip_prefix('#') {
            let body = body.trim();
            if body.is_empty() {
                flush(&mut para, start, out);
            } else {
                if para.is_empty() {
                    start = i + 1;
                }
                para.push(body);
            }
        } else {
            flush(&mut para, start, out);
        }
    }
    flush(&mut para, start, out);
}

fn build_not_modelled(
    kind_description: &str,
    (label, label_source): (&str, &str),
    src: &str,
    scn: &Value,
    doc: &Value,
    caps: &Capabilities,
    matrix: &[VerificationItem],
) -> Section<NoteRow> {
    let mut rows = Vec::new();
    collect_note_blocks(doc, "", &mut rows);
    if !label.is_empty() && is_not_modelled_text(label) {
        rows.push(NoteRow {
            text: label.to_string(),
            source: label_source.to_string(),
        });
    }
    for s in split_sentences(kind_description) {
        if is_not_modelled_text(&s) {
            rows.push(NoteRow {
                text: s,
                source: "kind catalogue (`kshana kinds --json`)".to_string(),
            });
        }
    }
    collect_input_notes(scn, "", &mut rows);
    collect_comment_notes(src, &mut rows);
    for row in &caps.rows {
        if row.label != "MODELLED" {
            continue;
        }
        if let Some(it) = matrix.iter().find(|r| r.requirement == row.requirement) {
            rows.push(NoteRow {
                text: format!(
                    "{} is MODELLED, not validated: {}.",
                    row.requirement,
                    it.oracle_kind.modelled_reason()
                ),
                source: "verification matrix (docs/MODELLED-RATIONALE.md)".to_string(),
            });
        }
    }
    let mut seen = BTreeSet::new();
    rows.retain(|r| seen.insert(r.text.clone()));
    Section::new(
        rows,
        usize::MAX,
        "Nothing in the result, the kind catalogue, the scenario or the matrix rows used states a modelling limitation for this run.",
    )
}

fn table_from_rows(
    title: &str,
    columns: Vec<String>,
    units: Vec<String>,
    rows: Vec<Vec<Value>>,
) -> Table {
    Table {
        title: title.to_string(),
        columns,
        units,
        rows,
    }
}

fn histogram(samples: &[f64], bins: usize) -> (Vec<f64>, Vec<usize>) {
    let lo = samples.iter().copied().fold(f64::INFINITY, f64::min);
    let hi = samples.iter().copied().fold(f64::NEG_INFINITY, f64::max);
    if !lo.is_finite() || !hi.is_finite() {
        return (vec![], vec![]);
    }
    let (lo, hi) = if hi > lo {
        (lo, hi)
    } else {
        (lo - 0.5, hi + 0.5)
    };
    let w = (hi - lo) / bins as f64;
    let mut edges: Vec<f64> = (0..=bins).map(|i| lo + w * i as f64).collect();
    // `lo + w * bins` can round a unit in the last place below `hi`; the last edge is the
    // largest sample exactly, so the drawn range always contains every sample.
    edges[bins] = hi;
    let mut counts = vec![0usize; bins];
    for &s in samples {
        let mut b = ((s - lo) / w).floor() as isize;
        if b < 0 {
            b = 0;
        }
        if b as usize >= bins {
            b = bins as isize - 1;
        }
        counts[b as usize] += 1;
    }
    (edges, counts)
}

fn str_of(v: &Value, k: &str) -> String {
    v.get(k).and_then(Value::as_str).unwrap_or("").to_string()
}

fn build_aggregation(kind: &str, doc: &Value) -> Option<Aggregation> {
    let repro = doc.get("reproducibility");
    let runs_total = repro
        .and_then(|r| r.get("runs_total"))
        .and_then(Value::as_u64);
    let run_digest = repro
        .and_then(|r| r.get("run_digest"))
        .and_then(Value::as_str)
        .map(str::to_string);
    let mut agg = Aggregation {
        mode: String::new(),
        member_kind: None,
        runs_total,
        run_digest,
        tables: vec![],
        distributions: vec![],
    };
    if kind == "campaign" {
        if let Some(sw) = doc.get("sweep") {
            agg.mode = "sweep".to_string();
            agg.member_kind = Some(str_of(sw, "scenario_kind"));
            let order: Vec<String> = sw
                .get("axis_order")
                .and_then(Value::as_array)
                .map(|a| {
                    a.iter()
                        .filter_map(|x| x.as_str().map(str::to_string))
                        .collect()
                })
                .unwrap_or_default();
            let metrics: Vec<(String, String)> = sw
                .get("metrics")
                .and_then(Value::as_object)
                .map(|m| {
                    m.iter()
                        .map(|(k, v)| (k.clone(), str_of(v, "unit")))
                        .collect()
                })
                .unwrap_or_default();
            let mut columns = Vec::new();
            let mut units = Vec::new();
            for a in &order {
                columns.push(a.clone());
                units.push(
                    sw.get("axes")
                        .and_then(|x| x.get(a))
                        .map(|x| str_of(x, "unit"))
                        .unwrap_or_default(),
                );
            }
            for (m, u) in &metrics {
                columns.push(m.clone());
                units.push(u.clone());
            }
            let rows = sw
                .get("nodes")
                .and_then(Value::as_array)
                .map(|nodes| {
                    nodes
                        .iter()
                        .map(|n| {
                            let mut r = Vec::new();
                            for a in &order {
                                r.push(
                                    n.get("coords")
                                        .and_then(|c| c.get(a))
                                        .cloned()
                                        .unwrap_or(Value::Null),
                                );
                            }
                            for (m, _) in &metrics {
                                r.push(
                                    n.get("metrics")
                                        .and_then(|c| c.get(m))
                                        .cloned()
                                        .unwrap_or(Value::Null),
                                );
                            }
                            r
                        })
                        .collect()
                })
                .unwrap_or_default();
            agg.tables
                .push(table_from_rows("Sweep nodes", columns, units, rows));
        } else if let Some(mc) = doc.get("monte_carlo") {
            agg.mode = "monte-carlo".to_string();
            agg.member_kind = Some(str_of(mc, "scenario_kind"));
            let cols = [
                "n",
                "mean",
                "std",
                "p05",
                "p50",
                "p95",
                "ci95_low",
                "ci95_high",
            ];
            let mut rows = Vec::new();
            if let Some(ms) = mc.get("metrics").and_then(Value::as_object) {
                for (name, m) in ms {
                    let unit = str_of(m, "unit");
                    let mut r = vec![
                        Value::String(name.clone()),
                        Value::String(str_of(m, "path")),
                        Value::String(unit.clone()),
                    ];
                    for c in cols {
                        r.push(m.get(c).cloned().unwrap_or(Value::Null));
                    }
                    rows.push(r);
                    if let Some(samples) = m.get("samples").and_then(Value::as_array) {
                        let s: Vec<f64> = samples.iter().filter_map(Value::as_f64).collect();
                        if !s.is_empty() {
                            let (edges, counts) = histogram(&s, 20);
                            agg.distributions.push(Distribution {
                                metric: name.clone(),
                                unit,
                                n: s.len(),
                                edges,
                                counts,
                                p05: m.get("p05").and_then(Value::as_f64),
                                p50: m.get("p50").and_then(Value::as_f64),
                                p95: m.get("p95").and_then(Value::as_f64),
                            });
                        }
                    }
                }
            }
            let mut columns: Vec<String> = vec!["metric".into(), "path".into(), "unit".into()];
            columns.extend(cols.iter().map(|c| c.to_string()));
            let units = vec![String::new(); columns.len()];
            agg.tables.push(table_from_rows(
                "Monte Carlo distribution summary (percentiles are nearest-rank; the 95% confidence interval on the mean is a fixed-seed percentile bootstrap)",
                columns,
                units,
                rows,
            ));
        } else if let Some(tl) = doc.get("timeline") {
            agg.mode = "chain".to_string();
            let mut rows = Vec::new();
            for ph in tl
                .get("phases")
                .and_then(Value::as_array)
                .into_iter()
                .flatten()
            {
                let t0 = ph.get("t0_s").and_then(Value::as_f64);
                let t1 = ph.get("t1_s").and_then(Value::as_f64);
                let dur = match (t0, t1) {
                    (Some(a), Some(b)) => serde_json::Number::from_f64(b - a)
                        .map(Value::Number)
                        .unwrap_or(Value::Null),
                    _ => Value::Null,
                };
                let kinds: Vec<String> = ph
                    .get("runs")
                    .and_then(Value::as_array)
                    .map(|rs| rs.iter().map(|r| str_of(r, "kind")).collect())
                    .unwrap_or_default();
                let carried: Vec<String> = ph
                    .get("carried")
                    .and_then(Value::as_object)
                    .map(|c| {
                        c.iter()
                            .map(|(k, v)| format!("{k} = {}", display_value(v)))
                            .collect()
                    })
                    .unwrap_or_default();
                rows.push(vec![
                    Value::String(str_of(ph, "name")),
                    ph.get("t0_s").cloned().unwrap_or(Value::Null),
                    ph.get("t1_s").cloned().unwrap_or(Value::Null),
                    dur,
                    Value::String(str_of(ph, "ended_by")),
                    Value::String(kinds.join(", ")),
                    Value::String(if carried.is_empty() {
                        "nothing carried".to_string()
                    } else {
                        carried.join("; ")
                    }),
                ]);
            }
            agg.tables.push(table_from_rows(
                "Chain phases",
                [
                    "phase",
                    "start",
                    "end",
                    "duration",
                    "ended by",
                    "member kinds",
                    "carried in",
                ]
                .iter()
                .map(|s| s.to_string())
                .collect(),
                ["", "s", "s", "s", "", "", ""]
                    .iter()
                    .map(|s| s.to_string())
                    .collect(),
                rows,
            ));
        } else if let Some(cp) = doc.get("compose") {
            agg.mode = "compose".to_string();
            let mut shared_rows = Vec::new();
            for (k, v) in cp
                .get("shared")
                .and_then(Value::as_object)
                .into_iter()
                .flatten()
            {
                shared_rows.push(vec![
                    Value::String(k.clone()),
                    v.get("value").cloned().unwrap_or(Value::Null),
                    Value::String(str_of(v, "unit")),
                ]);
            }
            agg.tables.push(table_from_rows(
                "Shared conditions",
                vec!["condition".into(), "value".into(), "unit".into()],
                vec![String::new(); 3],
                shared_rows,
            ));
            let metric_units: Vec<(String, String)> = cp
                .get("metric_units")
                .and_then(Value::as_object)
                .map(|m| {
                    m.iter()
                        .map(|(k, v)| (k.clone(), v.as_str().unwrap_or("").to_string()))
                        .collect()
                })
                .unwrap_or_default();
            let mut member_rows = Vec::new();
            for (name, m) in cp
                .get("members")
                .and_then(Value::as_object)
                .into_iter()
                .flatten()
            {
                let bound: Vec<String> = m
                    .get("bound")
                    .and_then(Value::as_object)
                    .map(|b| {
                        b.iter()
                            .map(|(k, v)| format!("{k} → {}", v.as_str().unwrap_or("")))
                            .collect()
                    })
                    .unwrap_or_default();
                let mut r = vec![
                    Value::String(name.clone()),
                    Value::String(str_of(m, "kind")),
                    Value::String(if bound.is_empty() {
                        "none".into()
                    } else {
                        bound.join("; ")
                    }),
                ];
                for (mk, _) in &metric_units {
                    r.push(
                        m.get("metrics")
                            .and_then(|x| x.get(mk))
                            .cloned()
                            .unwrap_or(Value::Null),
                    );
                }
                member_rows.push(r);
            }
            let mut columns: Vec<String> = vec![
                "member".into(),
                "kind".into(),
                "shared conditions bound to".into(),
            ];
            let mut units = vec![String::new(); 3];
            for (mk, u) in &metric_units {
                columns.push(mk.clone());
                units.push(u.clone());
            }
            agg.tables
                .push(table_from_rows("Members", columns, units, member_rows));
            let mut comb_rows = Vec::new();
            for (k, c) in cp
                .get("combined")
                .and_then(Value::as_object)
                .into_iter()
                .flatten()
            {
                comb_rows.push(vec![
                    Value::String(k.clone()),
                    Value::String(str_of(c, "unit")),
                    c.get("members").cloned().unwrap_or(Value::Null),
                    c.get("min").cloned().unwrap_or(Value::Null),
                    Value::String(str_of(c, "min_member")),
                    c.get("max").cloned().unwrap_or(Value::Null),
                    Value::String(str_of(c, "max_member")),
                    c.get("mean").cloned().unwrap_or(Value::Null),
                ]);
            }
            agg.tables.push(table_from_rows(
                "Combined across members",
                [
                    "metric",
                    "unit",
                    "members",
                    "min",
                    "min member",
                    "max",
                    "max member",
                    "mean",
                ]
                .iter()
                .map(|s| s.to_string())
                .collect(),
                vec![String::new(); 8],
                comb_rows,
            ));
        } else {
            return None;
        }
        return Some(agg);
    }
    if kind == "sweep" {
        let param = str_of(doc, "parameter");
        let metric = str_of(doc, "metric");
        let rows: Vec<Vec<Value>> = doc
            .get("points")
            .and_then(Value::as_array)
            .map(|ps| {
                ps.iter()
                    .map(|p| {
                        vec![
                            p.get("value").cloned().unwrap_or(Value::Null),
                            p.get("quantum").cloned().unwrap_or(Value::Null),
                            p.get("classical").cloned().unwrap_or(Value::Null),
                        ]
                    })
                    .collect()
            })
            .unwrap_or_default();
        agg.mode = "sweep".to_string();
        agg.member_kind = Some("clock".to_string());
        agg.tables.push(table_from_rows(
            &format!("Sweep of {param} ({} scale)", str_of(doc, "scale")),
            vec![
                param.clone(),
                format!("quantum {metric}"),
                format!("classical {metric}"),
            ],
            vec![
                String::new(),
                unit_from_suffix(&metric).unwrap_or("").to_string(),
                unit_from_suffix(&metric).unwrap_or("").to_string(),
            ],
            rows,
        ));
        return Some(agg);
    }
    if kind == "sweep-nd" {
        let strings = |k: &str| -> Vec<String> {
            doc.get(k)
                .and_then(Value::as_array)
                .map(|a| {
                    a.iter()
                        .filter_map(|x| x.as_str().map(str::to_string))
                        .collect()
                })
                .unwrap_or_default()
        };
        let keys = strings("keys");
        let metrics = strings("metrics");
        let rows: Vec<Vec<Value>> = doc
            .get("points")
            .and_then(Value::as_array)
            .map(|ps| {
                ps.iter()
                    .map(|p| {
                        let mut r: Vec<Value> = p
                            .get("coords")
                            .and_then(Value::as_array)
                            .cloned()
                            .unwrap_or_default();
                        r.resize(keys.len(), Value::Null);
                        let mut m: Vec<Value> = p
                            .get("metrics")
                            .and_then(Value::as_array)
                            .cloned()
                            .unwrap_or_default();
                        m.resize(metrics.len(), Value::Null);
                        r.extend(m);
                        r
                    })
                    .collect()
            })
            .unwrap_or_default();
        let mut columns = keys.clone();
        columns.extend(metrics.iter().cloned());
        let units = columns
            .iter()
            .map(|c| unit_from_suffix(leaf_name(c)).unwrap_or("").to_string())
            .collect();
        agg.mode = "sweep".to_string();
        agg.member_kind = doc.get("kind").and_then(Value::as_str).map(str::to_string);
        agg.tables
            .push(table_from_rows("Sweep grid", columns, units, rows));
        return Some(agg);
    }
    None
}

// ---------------------------------------------------------------------------------------
// The builder
// ---------------------------------------------------------------------------------------

/// Build the report of one run. `src` is the scenario file's exact text (before any
/// `--eop` injection), `out` the run's output, `inv` how it was invoked. Pure: the same
/// three inputs always give the same report.
pub fn build(out: &crate::api::RunOutput, src: &str, inv: &Invocation) -> Result<Report, String> {
    let doc: Value = serde_json::from_str(&out.json)
        .map_err(|e| format!("the result document is not JSON: {e}"))?;
    let scn = toml::from_str::<toml::Value>(src)
        .map(|v| toml_to_json(&v))
        .map_err(|e| format!("the scenario is not TOML: {e}"))?;
    let kind = crate::api::ScenarioKind::classify(src)
        .map(|k| k.as_str().to_string())
        .map_err(|e| e.to_string())?;
    let catalogue = crate::api::list_scenario_kinds();
    let known: BTreeSet<&'static str> = catalogue.iter().map(|m| m.name).collect();
    let description = catalogue
        .iter()
        .find(|m| m.name == kind)
        .map(|m| m.description)
        .unwrap_or("");
    let matrix = verification_matrix();
    let units = doc.get("units").and_then(Value::as_object);

    let study_title = doc
        .get("meta")
        .and_then(|m| m.get("study_title"))
        .and_then(Value::as_str);
    let generated_utc = doc
        .get("meta")
        .and_then(|m| m.get("generated_utc"))
        .and_then(Value::as_str)
        .map(str::to_string);
    let title = study_title
        .or_else(|| doc.get("title").and_then(Value::as_str))
        .or_else(|| scn.get("title").and_then(Value::as_str))
        .or_else(|| scn.get("name").and_then(Value::as_str))
        .map(str::to_string)
        .unwrap_or_else(|| {
            let stem = std::path::Path::new(&inv.scenario_arg)
                .file_stem()
                .and_then(|n| n.to_str())
                .unwrap_or("");
            if stem.is_empty() {
                format!("{kind} scenario")
            } else {
                format!("{stem} ({kind})")
            }
        });

    let (label, label_source) = match doc.get("label").and_then(Value::as_str) {
        Some(l) if !l.trim().is_empty() => (l.to_string(), "result `label`".to_string()),
        _ => (
            "The result carries no run-level honesty label; the verification labels of the capabilities it used are listed in their own section, and the per-figure tiers where the result states them.".to_string(),
            "not stated by the result".to_string(),
        ),
    };
    let what_ran = split_sentences(description)
        .into_iter()
        .next()
        .unwrap_or_else(|| format!("A `{kind}` scenario."));

    let members = member_kinds(&scn, &doc, &known);
    let caps = build_capabilities(&kind, &members, &scn, &doc, &matrix);

    let mut charts = vec![ChartRef {
        id: "primary".to_string(),
        title: "Result chart".to_string(),
        file: inv.chart_file.clone(),
    }];
    let aggregation = build_aggregation(&kind, &doc);
    if let Some(a) = &aggregation {
        for d in &a.distributions {
            charts.push(ChartRef {
                id: format!("distribution-{}", d.metric),
                title: format!("Monte Carlo distribution of {}", d.metric),
                file: None,
            });
        }
    }
    let (companions, animation_svg) = build_companions(out, src, &kind, inv);
    let events = build_events(&kind, &scn, &doc);
    if events.items.iter().any(|e| e.t_end_s.is_some()) {
        charts.push(ChartRef {
            id: "timeline".to_string(),
            title: "Events timeline".to_string(),
            file: None,
        });
    }
    let results = build_results(&doc, units, charts);
    let inputs = build_inputs(&scn, units);
    let not_modelled = build_not_modelled(
        description,
        (
            doc.get("label").and_then(Value::as_str).unwrap_or(""),
            &label_source,
        ),
        src,
        &scn,
        &doc,
        &caps,
        &matrix,
    );

    // Key figures: the result's own tiered figures, else its figure-of-merit block,
    // else a campaign's aggregate, else its first numeric scalars.
    let mut key_figures = Vec::new();
    for ft in &caps.figure_tiers {
        if let Some(v) = value_at(&doc, &ft.path) {
            let (unit, _) = resolve_unit(units, &ft.path, false);
            key_figures.push(Figure {
                path: ft.path.clone(),
                value: v.clone(),
                display: if ft.applicable {
                    display_value(v)
                } else {
                    "not applicable (no attack configured)".to_string()
                },
                unit,
                tier: Some(ft.tier.clone()),
            });
        }
    }
    if key_figures.is_empty() {
        // A Monte Carlo campaign's headline is its percentiles.
        if let Some(mc) = doc.get("monte_carlo").filter(|_| kind == "campaign") {
            for (name, m) in mc
                .get("metrics")
                .and_then(Value::as_object)
                .into_iter()
                .flatten()
            {
                let unit = str_of(m, "unit");
                for q in ["p05", "p50", "p95"] {
                    if let Some(v) = m.get(q).filter(|v| v.is_number()) {
                        key_figures.push(Figure {
                            path: format!("monte_carlo.metrics.{name}.{q}"),
                            value: v.clone(),
                            display: display_value(v),
                            unit: if unit.is_empty() {
                                "not stated".to_string()
                            } else {
                                unit.clone()
                            },
                            tier: None,
                        });
                    }
                }
            }
        }
    }
    if key_figures.is_empty() {
        let fom_rows: Vec<&ValueRow> = results
            .scalars
            .items
            .iter()
            .filter(|r| {
                r.value.is_number() && (r.path.starts_with("fom.") || r.path.contains(".fom."))
            })
            .take(8)
            .collect();
        let pick: Vec<&ValueRow> = if fom_rows.is_empty() {
            results
                .scalars
                .items
                .iter()
                .filter(|r| r.value.is_number() || r.value.is_boolean())
                .take(6)
                .collect()
        } else {
            fom_rows
        };
        for r in pick {
            key_figures.push(Figure {
                path: r.path.clone(),
                value: r.value.clone(),
                display: r.display.clone(),
                unit: r.unit.clone(),
                tier: None,
            });
        }
    }
    if key_figures.is_empty() {
        if let Some(t) = aggregation.as_ref().and_then(|a| a.tables.first()) {
            key_figures.push(Figure {
                path: format!("{} (rows)", t.title),
                value: Value::from(t.rows.len()),
                display: t.rows.len().to_string(),
                unit: "count".to_string(),
                tier: None,
            });
        }
    }
    if let Some(a) = &aggregation {
        if let Some(n) = a.runs_total {
            key_figures.push(Figure {
                path: "reproducibility.runs_total".to_string(),
                value: Value::from(n),
                display: n.to_string(),
                unit: "count".to_string(),
                tier: None,
            });
        }
    }

    let mut counts = LabelCounts::default();
    for r in &caps.rows {
        match r.label.as_str() {
            "VALIDATED" => counts.validated += 1,
            "MODELLED" => counts.modelled += 1,
            _ => counts.partner += 1,
        }
    }

    // Reproducibility.
    let (seed, seed_source) = match scn.get("seed").and_then(Value::as_u64) {
        Some(s) => (Some(s), "scenario `seed`".to_string()),
        None => match doc.get("seed").and_then(Value::as_u64) {
            Some(s) => (Some(s), "result `seed` (the kind's default: the scenario sets none)".to_string()),
            None => (
                None,
                "Neither the scenario nor the result carries a seed. The result is fixed by the scenario file and the engine build alone; the determinism test re-runs every bundled scenario and requires byte-identical output.".to_string(),
            ),
        },
    };
    let mut argv = vec!["kshana".to_string(), inv.scenario_arg.clone()];
    argv.extend(inv.extra_args.iter().cloned());
    let command = argv
        .iter()
        .map(|a| shell_quote(a))
        .collect::<Vec<_>>()
        .join(" ");
    let git_commit = option_env!("KSHANA_GIT_COMMIT")
        .map(str::trim)
        .filter(|s| !s.is_empty())
        .map(str::to_string);
    let git_commit_note = if git_commit.is_some() {
        format!("recorded at build time from the {GIT_COMMIT_ENV} environment variable")
    } else {
        format!("not recorded: this engine was built without the {GIT_COMMIT_ENV} environment variable; the engine version identifies the release")
    };
    let scenario_file = std::path::Path::new(&inv.scenario_arg)
        .file_name()
        .and_then(|n| n.to_str())
        .unwrap_or(&inv.scenario_arg)
        .to_string();
    let reproducibility = Reproducibility {
        engine_version: env!("CARGO_PKG_VERSION").to_string(),
        git_commit,
        git_commit_note,
        scenario_file,
        scenario_sha256: sha256_hex(src.as_bytes()),
        result_scenario_hash: doc
            .get("scenario_hash")
            .and_then(Value::as_str)
            .map(str::to_string),
        result_sha256: sha256_hex(out.json.as_bytes()),
        result_file: inv.result_file.clone(),
        seed,
        seed_source,
        platform: Platform {
            os: std::env::consts::OS.to_string(),
            arch: std::env::consts::ARCH.to_string(),
            family: std::env::consts::FAMILY.to_string(),
        },
        command,
        argv,
        working_directory: "Run the command from the directory the original run was started in: the scenario path, and any relative data path inside the scenario, resolve against it. Check the scenario file against scenario_sha256 first.".to_string(),
        input_files: inv
            .input_files
            .iter()
            .map(|(p, h)| InputFile {
                path: p.clone(),
                sha256: h.clone(),
            })
            .collect(),
        generated_utc: generated_utc.clone(),
        determinism: if generated_utc.is_some() {
            "Same scenario bytes, seed and engine build give the same result document, except its meta.generated_utc stamp, which --study-name writes from the clock; run without --study-name for byte-identical output. Floating-point results are pinned per platform; another operating system or architecture may differ in the last digits.".to_string()
        } else {
            "Same scenario bytes, seed and engine build give a byte-identical result document and report; this report carries no timestamp. Floating-point results are pinned per platform; another operating system or architecture may differ in the last digits.".to_string()
        },
    };

    let member_runs = aggregation.as_ref().and_then(|a| a.runs_total);
    Ok(Report {
        report_schema: REPORT_SCHEMA.to_string(),
        report_schema_version: REPORT_SCHEMA_VERSION.to_string(),
        kind,
        title,
        executive_summary: ExecutiveSummary {
            what_ran,
            summary: out.summary.clone(),
            label,
            label_source,
            key_figures,
            capability_labels: counts,
            member_runs,
        },
        inputs,
        results,
        aggregation,
        events,
        capabilities: caps,
        not_modelled,
        companions,
        reproducibility,
        animation_svg,
    })
}

/// Only a bare file name may become a link: nothing that could leave the report's folder.
fn is_bare_file_name(n: &str) -> bool {
    !n.is_empty()
        && !n.starts_with('.')
        && n.bytes()
            .all(|b| b.is_ascii_alphanumeric() || matches!(b, b'.' | b'-' | b'_'))
}

fn build_companions(
    out: &crate::api::RunOutput,
    src: &str,
    kind: &str,
    inv: &Invocation,
) -> (Companions, Option<String>) {
    let q = shell_quote(&inv.scenario_arg);
    let (available, svg, reason) = match crate::animation::animate_result(
        &out.json,
        Some(kind),
        crate::animation::AnimationFormat::Svg,
        &crate::animation::AnimationOptions::default(),
    ) {
        Ok(a) => (true, a.files.into_iter().next().map(|f| f.content), None),
        Err(e) => (false, None, Some(e.to_string())),
    };
    let animation = AnimationCompanion {
        available,
        embedded: svg.is_some(),
        reason,
        files: inv
            .animation_files
            .iter()
            .filter(|n| is_bare_file_name(n))
            .cloned()
            .collect(),
        command: format!("kshana {q} --animate html"),
    };
    let exports = crate::interop::plan(src)
        .into_iter()
        .map(|(fmt, r)| ExportRow {
            format: fmt.as_str().to_string(),
            applies: r.is_ok(),
            reason: r.err(),
            spec_url: fmt.spec_url().to_string(),
            files: inv
                .export_files
                .iter()
                .filter(|(f, n)| f == fmt.as_str() && is_bare_file_name(n))
                .map(|(_, n)| n.clone())
                .collect(),
        })
        .collect();
    (
        Companions {
            animation,
            exports,
            export_command: format!("kshana {q} --export all"),
        },
        svg,
    )
}

impl Report {
    /// The report as pretty JSON with a trailing newline: `report.json`.
    pub fn to_json(&self) -> String {
        let mut s = serde_json::to_string_pretty(self).unwrap_or_else(|e| {
            format!("{{\"error\": \"the report could not be serialised: {e}\"}}")
        });
        s.push('\n');
        s
    }

    /// The report as one self-contained HTML page: `report.html`. `chart_svg` is the
    /// run's chart, embedded as an inert image.
    pub fn to_html(&self, chart_svg: &str) -> String {
        render_html(self, chart_svg)
    }
}

// ---------------------------------------------------------------------------------------
// HTML rendering
// ---------------------------------------------------------------------------------------

const STYLE: &str = r#"
:root{--bg:#fbfaf7;--fg:#1d1a15;--muted:#62594b;--line:#d9d2c5;--card:#f3efe7;--accent:#9a5b22;--val:#1f6f43;--mod:#8a5a00;--par:#5a4f8a;color-scheme:light}
@media (prefers-color-scheme:dark){:root:not([data-theme="light"]){--bg:#12100c;--fg:#ece6da;--muted:#a79d8c;--line:#3a3328;--card:#1c1914;--accent:#e0a36a;--val:#6fd39b;--mod:#f0c060;--par:#b3a8ee;color-scheme:dark}}
:root[data-theme="dark"]{--bg:#12100c;--fg:#ece6da;--muted:#a79d8c;--line:#3a3328;--card:#1c1914;--accent:#e0a36a;--val:#6fd39b;--mod:#f0c060;--par:#b3a8ee;color-scheme:dark}
*{box-sizing:border-box}
body{margin:0 auto;max-width:980px;padding:24px 16px 48px;background:var(--bg);color:var(--fg);font:15px/1.55 system-ui,-apple-system,"Segoe UI",Roboto,sans-serif}
header.top{border-bottom:2px solid var(--accent);padding-bottom:12px;margin-bottom:8px}
.eyebrow{letter-spacing:.16em;text-transform:uppercase;font-size:.72rem;color:var(--muted);margin:0}
h1{font-size:1.9rem;line-height:1.2;margin:.2rem 0 .3rem}
.meta{color:var(--muted);font-size:.85rem;margin:0}
nav.toc{font-size:.85rem;margin:12px 0 4px;color:var(--muted)}
nav.toc a{color:var(--accent);margin-right:.9rem;text-decoration:none;white-space:nowrap}
section{margin-top:28px}
h2{font-size:1.25rem;border-bottom:1px solid var(--line);padding-bottom:4px;margin:0 0 10px}
h3{font-size:1rem;margin:18px 0 6px}
p{margin:.4rem 0}
.note{color:var(--muted);font-size:.85rem}
.summary{font-family:ui-monospace,Menlo,Consolas,monospace;font-size:.84rem;background:var(--card);border-left:3px solid var(--accent);padding:10px 12px;white-space:pre-wrap;overflow-wrap:anywhere}
.cards{display:grid;grid-template-columns:repeat(auto-fit,minmax(170px,1fr));gap:8px;margin:10px 0}
.card{background:var(--card);border:1px solid var(--line);border-radius:6px;padding:8px 10px}
.card .k{font-size:.72rem;color:var(--muted);overflow-wrap:anywhere}
.card .v{font-size:1.05rem;font-weight:600;font-variant-numeric:tabular-nums;overflow-wrap:anywhere}
.wrap{overflow-x:auto}
table{border-collapse:collapse;width:100%;font-size:.84rem;margin:6px 0}
table.fixed{table-layout:fixed}
td .note,td.note{font-size:inherit}
th,td{border:1px solid var(--line);padding:4px 7px;text-align:left;vertical-align:top;overflow-wrap:anywhere}
th{background:var(--card);font-weight:600}
td.num{text-align:right;font-variant-numeric:tabular-nums;white-space:nowrap}
code,.mono{font-family:ui-monospace,Menlo,Consolas,monospace;font-size:.8rem;overflow-wrap:anywhere}
.tag{display:inline-block;font-size:.7rem;font-weight:700;letter-spacing:.05em;padding:1px 6px;border-radius:4px;border:1px solid currentColor;white-space:nowrap}
.tag.VALIDATED{color:var(--val)}.tag.MODELLED{color:var(--mod)}.tag.PARTNER{color:var(--par)}.tag.PARTIAL{color:var(--mod)}
figure{margin:12px 0;text-align:center}
figure img{max-width:100%;height:auto;border:1px solid var(--line);border-radius:6px}
figure svg{max-width:100%;height:auto}
figcaption{font-size:.8rem;color:var(--muted)}
svg .ax{stroke:var(--line)}svg .bar{fill:var(--accent);opacity:.8}svg .pt{fill:var(--fg)}svg text{fill:var(--muted);font:11px system-ui,sans-serif}svg .p{stroke:var(--fg);stroke-dasharray:4 3}
footer{margin-top:36px;padding-top:10px;border-top:1px solid var(--line);font-size:.8rem;color:var(--muted)}
@page{margin:15mm 14mm 16mm}
@media print{
:root,:root:not([data-theme="light"]),:root[data-theme="dark"]{--bg:#fff;--fg:#000;--muted:#444;--line:#999;--card:#f2f2f2;--accent:#000;--val:#000;--mod:#000;--par:#000;color-scheme:light}
body{max-width:none;padding:0 1px;font-size:9.5pt;background:#fff}
nav.toc{display:none}
h1{font-size:18pt}h2{font-size:12.5pt;break-after:avoid-page;page-break-after:avoid}h3{break-after:avoid-page;page-break-after:avoid}
section{margin-top:14pt}
section.newpage{break-before:page;page-break-before:always}
table{font-size:7.8pt}
thead{display:table-header-group}
tr,figure,.card,.summary{break-inside:avoid;page-break-inside:avoid}
.wrap{overflow:visible}
figure img{max-height:110mm;border-color:#999}
a{color:inherit;text-decoration:none}
}
"#;

fn tag(label: &str) -> String {
    format!("<span class=\"tag {0}\">{0}</span>", esc(label))
}

fn cell(v: &Value) -> String {
    match v {
        Value::Number(_) => format!("<td class=\"num\">{}</td>", esc(&display_value(v))),
        _ => format!("<td>{}</td>", esc(&display_value(v))),
    }
}

fn omitted_note(n: usize, what: &str) -> String {
    if n == 0 {
        String::new()
    } else {
        format!(
            "<p class=\"note\">{n} further {what} are left out of this page; report.json lists the same rows, and the result document carries every value.</p>\n"
        )
    }
}

fn statement_p(s: &Option<String>) -> String {
    s.as_ref()
        .map(|t| format!("<p class=\"note\">{}</p>\n", esc(t)))
        .unwrap_or_default()
}

fn timeline_svg(events: &[EventRow]) -> String {
    let spans: Vec<&EventRow> = events
        .iter()
        .filter(|e| e.t_end_s.is_some())
        .take(14)
        .collect();
    let points: Vec<&EventRow> = events.iter().filter(|e| e.t_end_s.is_none()).collect();
    if spans.is_empty() {
        return String::new();
    }
    let t_max = events
        .iter()
        .map(|e| e.t_end_s.unwrap_or(e.t_s).max(e.t_s))
        .fold(0.0_f64, f64::max);
    let t_min = events.iter().map(|e| e.t_s).fold(0.0_f64, f64::min);
    let span = if t_max > t_min { t_max - t_min } else { 1.0 };
    let (w, left, right) = (900.0_f64, 250.0_f64, 20.0_f64);
    let pw = w - left - right;
    let rows = spans.len() + usize::from(!points.is_empty());
    let h = 30.0 + rows as f64 * 22.0 + 24.0;
    let x = |t: f64| left + (t - t_min) / span * pw;
    let mut s = format!(
        "<svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 {w:.0} {h:.0}\" width=\"{w:.0}\" height=\"{h:.0}\" role=\"img\" aria-label=\"Events timeline\">"
    );
    for (i, e) in spans.iter().enumerate() {
        let y = 20.0 + i as f64 * 22.0;
        let t1 = e.t_end_s.unwrap_or(e.t_s);
        let label: String = e.label.chars().take(38).collect();
        s.push_str(&format!(
            "<text x=\"{:.0}\" y=\"{:.1}\" text-anchor=\"end\">{}</text><rect class=\"bar\" x=\"{:.1}\" y=\"{:.1}\" width=\"{:.1}\" height=\"14\" rx=\"2\"/>",
            left - 8.0,
            y + 11.0,
            esc(&label),
            x(e.t_s),
            y,
            (x(t1) - x(e.t_s)).max(1.5)
        ));
    }
    if !points.is_empty() {
        let y = 20.0 + spans.len() as f64 * 22.0;
        s.push_str(&format!(
            "<text x=\"{:.0}\" y=\"{:.1}\" text-anchor=\"end\">point events ({})</text>",
            left - 8.0,
            y + 11.0,
            points.len()
        ));
        for p in &points {
            s.push_str(&format!(
                "<circle class=\"pt\" cx=\"{:.1}\" cy=\"{:.1}\" r=\"4\"/>",
                x(p.t_s),
                y + 7.0
            ));
        }
    }
    let ay = h - 22.0;
    s.push_str(&format!(
        "<line class=\"ax\" x1=\"{left:.0}\" y1=\"{ay:.1}\" x2=\"{:.0}\" y2=\"{ay:.1}\"/>",
        left + pw
    ));
    for i in 0..=4 {
        let t = t_min + span * i as f64 / 4.0;
        s.push_str(&format!(
            "<text x=\"{:.1}\" y=\"{:.1}\" text-anchor=\"middle\">{} s</text>",
            x(t),
            ay + 15.0,
            esc(&fmt_num(t))
        ));
    }
    s.push_str("</svg>");
    s
}

fn distribution_svg(d: &Distribution) -> String {
    if d.counts.is_empty() || d.edges.len() != d.counts.len() + 1 {
        return String::new();
    }
    let (w, h, l, r, t, b) = (640.0_f64, 230.0_f64, 50.0_f64, 16.0_f64, 14.0_f64, 40.0_f64);
    let pw = w - l - r;
    let ph = h - t - b;
    let lo = d.edges[0];
    let hi = d.edges[d.edges.len() - 1];
    let cmax = d.counts.iter().copied().max().unwrap_or(1).max(1) as f64;
    let x = |v: f64| l + (v - lo) / (hi - lo) * pw;
    let mut s = format!(
        "<svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 {w:.0} {h:.0}\" width=\"{w:.0}\" height=\"{h:.0}\" role=\"img\" aria-label=\"Distribution of {}\">",
        esc(&d.metric)
    );
    for (i, &c) in d.counts.iter().enumerate() {
        let bh = c as f64 / cmax * ph;
        s.push_str(&format!(
            "<rect class=\"bar\" x=\"{:.1}\" y=\"{:.1}\" width=\"{:.1}\" height=\"{:.1}\"/>",
            x(d.edges[i]) + 0.5,
            t + ph - bh,
            (x(d.edges[i + 1]) - x(d.edges[i]) - 1.0).max(0.5),
            bh
        ));
    }
    for (name, v) in [("p05", d.p05), ("p50", d.p50), ("p95", d.p95)] {
        if let Some(v) = v {
            if v >= lo && v <= hi {
                s.push_str(&format!(
                    "<line class=\"p\" x1=\"{0:.1}\" y1=\"{1:.1}\" x2=\"{0:.1}\" y2=\"{2:.1}\"/><text x=\"{0:.1}\" y=\"{3:.1}\" text-anchor=\"middle\">{name}</text>",
                    x(v),
                    t,
                    t + ph,
                    t + ph + 28.0
                ));
            }
        }
    }
    let ay = t + ph;
    s.push_str(&format!(
        "<line class=\"ax\" x1=\"{l:.0}\" y1=\"{ay:.1}\" x2=\"{:.0}\" y2=\"{ay:.1}\"/>",
        l + pw
    ));
    s.push_str(&format!(
        "<text x=\"{l:.0}\" y=\"{:.1}\" text-anchor=\"start\">{}</text><text x=\"{:.0}\" y=\"{:.1}\" text-anchor=\"end\">{}</text>",
        ay + 14.0,
        esc(&fmt_num(lo)),
        l + pw,
        ay + 14.0,
        esc(&fmt_num(hi))
    ));
    s.push_str(&format!(
        "<text x=\"{:.0}\" y=\"{:.1}\" text-anchor=\"end\">max bin {}</text>",
        l - 4.0,
        t + 10.0,
        cmax as usize
    ));
    s.push_str("</svg>");
    s
}

fn render_html(r: &Report, chart_svg: &str) -> String {
    let mut h = String::with_capacity(64 * 1024);
    let page_title = format!("{} \u{2014} Kshana", r.title);
    h.push_str("<!doctype html>\n<html lang=\"en\">\n<head>\n<meta charset=\"utf-8\"/>\n<meta name=\"viewport\" content=\"width=device-width, initial-scale=1\"/>\n");
    h.push_str(&format!("<title>{}</title>\n", esc(&page_title)));
    h.push_str("<style>");
    h.push_str(STYLE);
    h.push_str("</style>\n</head>\n<body>\n");

    // Header.
    let rp = &r.reproducibility;
    h.push_str("<header class=\"top\">\n<p class=\"eyebrow\">Kshana run report</p>\n");
    h.push_str(&format!("<h1>{}</h1>\n", esc(&r.title)));
    h.push_str(&format!(
        "<p class=\"meta\">Kind <code>{}</code> \u{00b7} engine {} \u{00b7} scenario <code>{}</code> (file digest {}\u{2026})</p>\n</header>\n",
        esc(&r.kind),
        esc(&rp.engine_version),
        esc(&rp.scenario_file),
        esc(&rp.scenario_sha256.chars().take(16).collect::<String>())
    ));
    h.push_str("<nav class=\"toc\"><a href=\"#summary\">1 Summary</a><a href=\"#inputs\">2 Inputs</a><a href=\"#results\">3 Results</a>");
    if r.aggregation.is_some() {
        h.push_str("<a href=\"#aggregation\">3a Aggregation</a>");
    }
    {
        h.push_str("<a href=\"#companions\">3b Animation and exports</a>");
    }
    h.push_str("<a href=\"#events\">4 Events</a><a href=\"#labels\">5 Verification labels</a><a href=\"#not-modelled\">6 Not modelled</a><a href=\"#reproducibility\">7 Reproducibility</a></nav>\n");

    // 1 Executive summary.
    let es = &r.executive_summary;
    h.push_str("<section id=\"summary\">\n<h2>1. Executive summary</h2>\n");
    h.push_str(&format!("<p>{}</p>\n", esc(&es.what_ran)));
    h.push_str(&format!("<p class=\"summary\">{}</p>\n", esc(&es.summary)));
    h.push_str("<div class=\"cards\">");
    for f in &es.key_figures {
        let unit = if f.unit.is_empty()
            || !f.value.is_number()
            || !f
                .display
                .chars()
                .next()
                .is_some_and(|c| c.is_ascii_digit() || c == '-')
            || matches!(f.unit.as_str(), "1" | "not stated" | "text" | "flag")
        {
            String::new()
        } else {
            format!(" {}", f.unit)
        };
        h.push_str(&format!(
            "<div class=\"card\"><div class=\"k\">{}</div><div class=\"v\">{}{}</div>{}</div>",
            esc(&f.path),
            esc(&f.display),
            esc(&unit),
            f.tier.as_ref().map(|t| tag(t)).unwrap_or_default()
        ));
    }
    h.push_str("</div>\n");
    let c = &es.capability_labels;
    h.push_str(&format!(
        "<p><strong>Honesty label</strong> ({}): {}</p>\n",
        esc(&es.label_source),
        esc(&es.label)
    ));
    h.push_str(&format!(
        "<p><strong>Capabilities used:</strong> {} VALIDATED, {} MODELLED, {} PARTNER (relied on, not provided); see section 5.</p>\n",
        c.validated, c.modelled, c.partner
    ));
    if let Some(n) = es.member_runs {
        h.push_str(&format!(
            "<p><strong>Member runs:</strong> {n}, aggregated in section 3a.</p>\n"
        ));
    }
    h.push_str("</section>\n");

    // 2 Inputs.
    h.push_str("<section id=\"inputs\" class=\"newpage\">\n<h2>2. Inputs</h2>\n<p class=\"note\">Every field the scenario file sets, flattened to its path. Units come from the result's <code>units</code> block (the field-units schema, docs/field-units-schema.json) where it describes the field, otherwise from the field-name suffix; a unit neither states is shown as not stated.</p>\n");
    h.push_str(&statement_p(&r.inputs.statement));
    if !r.inputs.items.is_empty() {
        h.push_str("<div class=\"wrap\"><table class=\"fixed\"><colgroup><col style=\"width:30%\"/><col style=\"width:30%\"/><col style=\"width:10%\"/><col style=\"width:30%\"/></colgroup><thead><tr><th>Parameter</th><th>Value</th><th>Unit</th><th>Unit source</th></tr></thead><tbody>");
        for row in &r.inputs.items {
            let vcell = if row.value.is_number() {
                format!("<td class=\"num\">{}</td>", esc(&row.display))
            } else {
                format!("<td>{}</td>", esc(&row.display))
            };
            h.push_str(&format!(
                "<tr><td><code>{}</code></td>{}<td>{}</td><td class=\"note\">{}</td></tr>",
                esc(&row.path),
                vcell,
                esc(&row.unit),
                esc(&row.unit_source)
            ));
        }
        h.push_str("</tbody></table></div>\n");
    }
    h.push_str(&omitted_note(r.inputs.omitted, "inputs"));
    h.push_str("</section>\n");

    // 3 Results.
    h.push_str("<section id=\"results\" class=\"newpage\">\n<h2>3. Results</h2>\n");
    for ch in &r.results.charts {
        if ch.id == "primary" {
            h.push_str(&format!(
                "<figure><img alt=\"Result chart\" src=\"{}\"/><figcaption>{}{}</figcaption></figure>\n",
                svg_data_uri(chart_svg),
                esc(&ch.title),
                ch.file
                    .as_ref()
                    .map(|f| format!(" (also written to {})", esc(f)))
                    .unwrap_or_default()
            ));
        }
    }
    h.push_str("<h3>Scalar results</h3>\n");
    h.push_str(&statement_p(&r.results.scalars.statement));
    if !r.results.scalars.items.is_empty() {
        h.push_str("<div class=\"wrap\"><table class=\"fixed\"><colgroup><col style=\"width:56%\"/><col style=\"width:30%\"/><col style=\"width:14%\"/></colgroup><thead><tr><th>Result</th><th>Value</th><th>Unit</th></tr></thead><tbody>");
        for row in &r.results.scalars.items {
            h.push_str(&format!(
                "<tr><td><code>{}</code></td>{}<td>{}</td></tr>",
                esc(&row.path),
                cell(&row.value),
                esc(&row.unit)
            ));
        }
        h.push_str("</tbody></table></div>\n");
    }
    h.push_str(&omitted_note(r.results.scalars.omitted, "scalar results"));
    h.push_str("<h3>Numeric columns</h3>\n");
    h.push_str(&statement_p(&r.results.series.statement));
    if !r.results.series.items.is_empty() {
        h.push_str("<div class=\"wrap\"><table class=\"fixed\"><colgroup><col style=\"width:34%\"/><col style=\"width:9%\"/><col style=\"width:12%\"/><col style=\"width:12%\"/><col style=\"width:12%\"/><col style=\"width:12%\"/><col style=\"width:9%\"/></colgroup><thead><tr><th>Column</th><th>Count</th><th>Min</th><th>Max</th><th>First</th><th>Last</th><th>Unit</th></tr></thead><tbody>");
        for s in &r.results.series.items {
            h.push_str(&format!(
                "<tr><td><code>{}</code></td><td class=\"num\">{}</td><td class=\"num\">{}</td><td class=\"num\">{}</td><td class=\"num\">{}</td><td class=\"num\">{}</td><td>{}</td></tr>",
                esc(&s.path),
                s.n,
                esc(&fmt_num(s.min)),
                esc(&fmt_num(s.max)),
                esc(&fmt_num(s.first)),
                esc(&fmt_num(s.last)),
                esc(&s.unit)
            ));
        }
        h.push_str("</tbody></table></div>\n");
    }
    h.push_str(&omitted_note(r.results.series.omitted, "numeric columns"));
    h.push_str("</section>\n");

    // 3a Aggregation.
    if let Some(a) = &r.aggregation {
        h.push_str("<section id=\"aggregation\">\n<h2>3a. Aggregation of member runs</h2>\n");
        h.push_str(&format!(
            "<p>Mode <strong>{}</strong>{}{}.</p>\n",
            esc(&a.mode),
            a.member_kind
                .as_ref()
                .filter(|k| !k.is_empty())
                .map(|k| format!(" over the <code>{}</code> kind", esc(k)))
                .unwrap_or_default(),
            a.runs_total
                .map(|n| format!(", {n} member runs"))
                .unwrap_or_default()
        ));
        if let Some(d) = &a.run_digest {
            h.push_str(&format!(
                "<p class=\"note\">Run digest (SHA-256 over the member result digests, in dispatch order): <code>{}</code></p>\n",
                esc(d)
            ));
        }
        for t in &a.tables {
            h.push_str(&format!("<h3>{}</h3>\n", esc(&t.title)));
            if t.rows.is_empty() {
                h.push_str(
                    "<p class=\"note\">This table has no rows: the result lists none.</p>\n",
                );
                continue;
            }
            h.push_str("<div class=\"wrap\"><table><thead><tr>");
            for (i, col) in t.columns.iter().enumerate() {
                let u = t.units.get(i).filter(|u| !u.is_empty());
                h.push_str(&format!(
                    "<th>{}{}</th>",
                    esc(col),
                    u.map(|u| format!(" ({})", esc(u))).unwrap_or_default()
                ));
            }
            h.push_str("</tr></thead><tbody>");
            for row in &t.rows {
                h.push_str("<tr>");
                for v in row {
                    h.push_str(&cell(v));
                }
                h.push_str("</tr>");
            }
            h.push_str("</tbody></table></div>\n");
        }
        for d in &a.distributions {
            h.push_str(&format!(
                "<figure>{}<figcaption>Monte Carlo distribution of {} ({} samples{}), 20 equal-width bins; dashed lines mark the 5th, 50th and 95th percentiles.</figcaption></figure>\n",
                distribution_svg(d),
                esc(&d.metric),
                d.n,
                if d.unit.is_empty() { String::new() } else { format!(", {}", esc(&d.unit)) }
            ));
        }
        h.push_str("</section>\n");
    }

    // 3b Animation and exports.
    let c = &r.companions;
    h.push_str("<section id=\"companions\">\n<h2>3b. Animation and exports</h2>\n");
    match &r.animation_svg {
        Some(svg) => h.push_str(&format!(
            "<figure><img src=\"{}\" alt=\"Animation of the run's time series\"/><figcaption>The run's own samples drawing in behind a moving time cursor (the animated drawing of <code>--animate svg</code>; it shows the finished picture under reduced motion and in print).</figcaption></figure>\n",
            svg_data_uri(svg)
        )),
        None => h.push_str(&format!(
            "<p class=\"note\">No animation: {}</p>\n",
            esc(c.animation.reason.as_deref().unwrap_or("the result carries no time series"))
        )),
    }
    if c.animation.available {
        if c.animation.files.is_empty() {
            h.push_str(&format!(
                "<p>The interactive player is written by <code>{}</code>.</p>\n",
                esc(&c.animation.command)
            ));
        } else {
            let links: Vec<String> = c
                .animation
                .files
                .iter()
                .map(|n| format!("<a href=\"{0}\">{0}</a>", esc(n)))
                .collect();
            h.push_str(&format!(
                "<p>Written beside this report: {}.</p>\n",
                links.join(", ")
            ));
        }
    }
    h.push_str("<div class=\"wrap\"><table><thead><tr><th>Export</th><th>Applies</th><th>Files or reason</th></tr></thead><tbody>");
    for e in &c.exports {
        let detail = if !e.files.is_empty() {
            e.files
                .iter()
                .map(|n| format!("<a href=\"{0}\">{0}</a>", esc(n)))
                .collect::<Vec<_>>()
                .join(", ")
        } else if e.applies {
            format!("written by <code>{}</code>", esc(&c.export_command))
        } else {
            esc(e.reason.as_deref().unwrap_or("does not apply"))
        };
        h.push_str(&format!(
            "<tr><td>{}<br/><span class=\"note\">{}</span></td><td>{}</td><td>{}</td></tr>",
            esc(&e.format),
            esc(&e.spec_url),
            if e.applies { "yes" } else { "no" },
            detail
        ));
    }
    h.push_str("</tbody></table></div>\n</section>\n");

    // 4 Events.
    h.push_str("<section id=\"events\">\n<h2>4. Events timeline</h2>\n");
    h.push_str(&statement_p(&r.events.statement));
    if !r.events.items.is_empty() {
        let svg = timeline_svg(&r.events.items);
        if !svg.is_empty() {
            h.push_str(&format!(
                "<figure>{svg}<figcaption>Windows as bars, point events as dots, on the run's own time axis.</figcaption></figure>\n"
            ));
        }
        h.push_str("<div class=\"wrap\"><table class=\"fixed\"><colgroup><col style=\"width:11%\"/><col style=\"width:11%\"/><col style=\"width:44%\"/><col style=\"width:34%\"/></colgroup><thead><tr><th>Start (s)</th><th>End (s)</th><th>Event</th><th>Source</th></tr></thead><tbody>");
        for e in &r.events.items {
            h.push_str(&format!(
                "<tr><td class=\"num\">{}</td><td class=\"num\">{}</td><td>{}</td><td class=\"note\">{}</td></tr>",
                esc(&fmt_num(e.t_s)),
                e.t_end_s
                    .map(|t| esc(&fmt_num(t)))
                    .unwrap_or_else(|| "point event".to_string()),
                esc(&e.label),
                esc(&e.source)
            ));
        }
        h.push_str("</tbody></table></div>\n");
    }
    h.push_str(&omitted_note(r.events.omitted, "events"));
    h.push_str("</section>\n");

    // 5 Verification labels.
    h.push_str("<section id=\"labels\" class=\"newpage\">\n<h2>5. Verification labels</h2>\n");
    h.push_str(&format!(
        "<p class=\"note\">{}</p>\n",
        esc(&r.capabilities.statement)
    ));
    h.push_str("<div class=\"wrap\"><table class=\"fixed\"><colgroup><col style=\"width:25%\"/><col style=\"width:13%\"/><col style=\"width:10%\"/><col style=\"width:28%\"/><col style=\"width:24%\"/></colgroup><thead><tr><th>Capability (matrix requirement)</th><th>Label</th><th>Used by</th><th>Source: oracle</th><th>Test evidence</th></tr></thead><tbody>");
    for c in &r.capabilities.rows {
        h.push_str(&format!(
            "<tr><td><strong>{}</strong><br/><span class=\"note\">{}</span></td><td>{}<br/><span class=\"note\">{}</span></td><td>{}</td><td class=\"note\">{} <em>({})</em></td><td class=\"note\">{}</td></tr>",
            esc(&c.requirement),
            esc(&c.capability),
            tag(&c.label),
            esc(&c.role),
            esc(&c.used_by.join(", ")),
            esc(&c.oracle),
            esc(&c.oracle_kind),
            esc(&c.tests)
        ));
    }
    h.push_str("</tbody></table></div>\n");
    if !r.capabilities.figure_tiers.is_empty() {
        h.push_str("<h3>Per-figure tiers stated by the result</h3>\n<div class=\"wrap\"><table class=\"fixed\"><colgroup><col style=\"width:42%\"/><col style=\"width:14%\"/><col style=\"width:30%\"/><col style=\"width:14%\"/></colgroup><thead><tr><th>Figure</th><th>Tier</th><th>Matrix requirement</th><th>Applicable</th></tr></thead><tbody>");
        for f in &r.capabilities.figure_tiers {
            h.push_str(&format!(
                "<tr><td><code>{}</code></td><td>{}</td><td>{}</td><td>{}</td></tr>",
                esc(&f.path),
                tag(&f.tier),
                esc(&f.requirement),
                if f.applicable {
                    "yes"
                } else {
                    "no (no attack configured)"
                }
            ));
        }
        h.push_str("</tbody></table></div>\n");
    }
    h.push_str("</section>\n");

    // 6 Not modelled.
    h.push_str("<section id=\"not-modelled\">\n<h2>6. Not modelled, and assumptions</h2>\n<p class=\"note\">Each item is quoted from where it is stated: the result document, the kind catalogue, the scenario file, or the verification matrix's reason a MODELLED row stays modelled.</p>\n");
    h.push_str(&statement_p(&r.not_modelled.statement));
    if !r.not_modelled.items.is_empty() {
        h.push_str("<div class=\"wrap\"><table class=\"fixed\"><colgroup><col style=\"width:72%\"/><col style=\"width:28%\"/></colgroup><thead><tr><th>Statement</th><th>Source</th></tr></thead><tbody>");
        for n in &r.not_modelled.items {
            h.push_str(&format!(
                "<tr><td>{}</td><td class=\"note\">{}</td></tr>",
                esc(&n.text),
                esc(&n.source)
            ));
        }
        h.push_str("</tbody></table></div>\n");
    }
    h.push_str("</section>\n");

    // 7 Reproducibility.
    h.push_str("<section id=\"reproducibility\" class=\"newpage\">\n<h2>7. Reproducibility record</h2>\n<div class=\"wrap\"><table class=\"fixed\"><colgroup><col style=\"width:22%\"/><col style=\"width:78%\"/></colgroup><tbody>");
    let mut kv = |k: &str, v: String| {
        let prose = matches!(
            k,
            "Working directory" | "Determinism" | "Seed" | "Source commit"
        );
        h.push_str(&format!(
            "<tr><th>{}</th><td{}>{}</td></tr>",
            esc(k),
            if prose { "" } else { " class=\"mono\"" },
            v
        ));
    };
    kv("Command to reproduce", esc(&rp.command));
    kv("Working directory", esc(&rp.working_directory));
    kv("Engine version", esc(&rp.engine_version));
    kv(
        "Source commit",
        match &rp.git_commit {
            Some(c) => format!("{} ({})", esc(c), esc(&rp.git_commit_note)),
            None => esc(&rp.git_commit_note),
        },
    );
    kv("Scenario file", esc(&rp.scenario_file));
    kv(
        "Scenario file SHA-256 (Secure Hash Algorithm 256-bit)",
        esc(&rp.scenario_sha256),
    );
    kv(
        "Result scenario_hash",
        rp.result_scenario_hash
            .as_ref()
            .map(|s| {
                format!(
                    "{} (the kind's own fingerprint of the scenario; not the file digest)",
                    esc(s)
                )
            })
            .unwrap_or_else(|| "the result document states none".to_string()),
    );
    kv(
        "Result document SHA-256",
        format!(
            "{}{}",
            esc(&rp.result_sha256),
            rp.result_file
                .as_ref()
                .map(|f| format!(" ({})", esc(f)))
                .unwrap_or_default()
        ),
    );
    kv(
        "Seed",
        match rp.seed {
            Some(s) => format!("{s} ({})", esc(&rp.seed_source)),
            None => esc(&rp.seed_source),
        },
    );
    kv(
        "Platform",
        esc(&format!(
            "{} / {} ({})",
            rp.platform.os, rp.platform.arch, rp.platform.family
        )),
    );
    for f in &rp.input_files {
        kv(
            &format!("Input file {}", f.path),
            format!("SHA-256 {}", esc(&f.sha256)),
        );
    }
    if let Some(g) = &rp.generated_utc {
        kv("Study generated (UTC)", esc(g));
    }
    kv("Determinism", esc(&rp.determinism));
    h.push_str("</tbody></table></div>\n");
    h.push_str("<p class=\"note\">To print this page to a Portable Document Format (PDF) file, use the browser's print dialog and choose \u{201c}Save as PDF\u{201d}; the print stylesheet fits A4 and US Letter paper, repeats table headers across pages and starts the inputs, results, labels and reproducibility sections on a new page. The engine writes no PDF itself. report.json carries the same content as this page.</p>\n");
    h.push_str("</section>\n");

    let stamp = rp
        .generated_utc
        .as_ref()
        .map(|g| format!(" Study generated {}.", esc(g)))
        .unwrap_or_default();
    h.push_str(&format!(
        "<footer>Generated by Kshana {}.{} Reproducible from scenario + seed + engine version. Free and open source (GNU Affero General Public License, AGPL-3.0) \u{2014} <a href=\"https://github.com/AshfordeOU/kshana\">source &amp; docs</a>.</footer>\n</body>\n</html>\n",
        esc(&rp.engine_version),
        stamp
    ));
    h
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn every_path_gate_names_a_row_its_kind_maps_to() {
        for (k, r, key) in PATH_GATED_CAPABILITIES {
            let reqs = capabilities_for_kind(k).expect("gated kind is built in");
            assert!(
                reqs.contains(r),
                "gate ({k}, {r:?}, {key}) names an unmapped row"
            );
        }
        // No scenario field reaches the SRTM reader, so no kind may claim it.
        for (k, reqs) in KIND_CAPABILITIES {
            assert!(
                !reqs.contains(&"SRTM digital-elevation reader on real terrain"),
                "kind {k} claims the SRTM reader row, which no scenario path reaches"
            );
        }
    }

    #[test]
    fn the_print_palette_overrides_the_dark_palette() {
        // The dark palette's selector is `:root:not([data-theme="light"])`; a print rule
        // with a lower specificity would print light text on the white print background.
        let print = &STYLE[STYLE.find("@media print").expect("print block")..];
        assert!(print.contains(r#":root:not([data-theme="light"])"#));
    }

    #[test]
    fn every_builtin_kind_has_a_crosswalk_entry_and_every_requirement_resolves() {
        let matrix = verification_matrix();
        let kinds: Vec<&str> = crate::api::list_scenario_kinds()
            .iter()
            .map(|m| m.name)
            .collect();
        for k in &kinds {
            let reqs = capabilities_for_kind(k)
                .unwrap_or_else(|| panic!("kind {k} has no KIND_CAPABILITIES entry"));
            if *k != "campaign" {
                assert!(!reqs.is_empty(), "kind {k} maps to no matrix row");
            }
            for r in reqs {
                let n = matrix.iter().filter(|it| it.requirement == *r).count();
                assert_eq!(n, 1, "kind {k}: requirement {r:?} matches {n} matrix rows");
            }
        }
        assert_eq!(
            KIND_CAPABILITIES.len(),
            kinds.len(),
            "a crosswalk entry names no built-in kind"
        );
        for r in [
            COMMON_REQUIREMENT,
            CAMPAIGN_CHAIN_REQUIREMENT,
            CAMPAIGN_SWEEP_REQUIREMENT,
            CAMPAIGN_COMPOSE_REQUIREMENT,
        ] {
            assert_eq!(
                matrix.iter().filter(|it| it.requirement == r).count(),
                1,
                "{r}"
            );
        }
    }

    #[test]
    fn numbers_print_without_non_finite_spellings() {
        assert_eq!(fmt_num(0.0), "0");
        assert_eq!(fmt_num(-0.0), "0");
        assert_eq!(fmt_num(7200.0), "7200");
        assert_eq!(fmt_num(1.5), "1.5");
        assert_eq!(fmt_num(1.0e-30), "1.0000e-30");
        assert_eq!(fmt_num(123456.5), "1.2346e5");
        assert_eq!(fmt_num(f64::NAN), "not a number");
        assert_eq!(display_value(&Value::Null), "no value");
        assert_eq!(
            display_value(&Value::String("undefined".into())),
            "\u{201c}undefined\u{201d} (text as the document states it)"
        );
    }

    #[test]
    fn suffix_units_and_shell_quoting() {
        assert_eq!(unit_from_suffix("duration_s"), Some("s"));
        assert_eq!(unit_from_suffix("power_dbw"), Some("dBW"));
        assert_eq!(unit_from_suffix("tracking_threshold_dbhz"), Some("dB-Hz"));
        assert_eq!(unit_from_suffix("alt_m"), Some("m"));
        assert_eq!(unit_from_suffix("q_wf"), None);
        assert_eq!(unit_from_suffix("_s"), None);
        assert_eq!(
            shell_quote("scenarios/clock-holdover.toml"),
            "scenarios/clock-holdover.toml"
        );
        assert_eq!(shell_quote("My Study"), "'My Study'");
        assert_eq!(shell_quote("it's"), "'it'\\''s'");
    }

    #[test]
    fn indexed_paths_map_to_the_units_spelling() {
        assert_eq!(pattern_of("gnss.windows[1].t0"), "gnss.windows[].t0");
        assert_eq!(leaf_name("a.b[2]"), "b");
    }

    #[test]
    fn the_report_of_a_clock_run_is_complete_and_pure() {
        let src = include_str!("../scenarios/clock-holdover.toml");
        let out = crate::api::run_toml(src).expect("run");
        let inv = Invocation {
            scenario_arg: "scenarios/clock-holdover.toml".into(),
            ..Default::default()
        };
        let a = build(&out, src, &inv).expect("report");
        let b = build(&out, src, &inv).expect("report");
        assert_eq!(a.to_json(), b.to_json());
        assert_eq!(a.to_html(&out.svg), b.to_html(&out.svg));
        assert_eq!(a.kind, "clock");
        assert_eq!(a.reproducibility.seed, Some(42));
        assert_eq!(
            a.reproducibility.scenario_sha256,
            sha256_hex(src.as_bytes())
        );
        assert!(a
            .events
            .items
            .iter()
            .any(|e| e.label.contains("state = denied")));
        assert!(a
            .capabilities
            .rows
            .iter()
            .any(|r| r.requirement == "GNSS-denied clock holdover"));
        let t = a
            .inputs
            .items
            .iter()
            .find(|r| r.path == "threshold_ns")
            .expect("threshold input");
        assert_eq!(t.unit, "ns");
        assert!(a
            .not_modelled
            .items
            .iter()
            .any(|n| n.text.contains("not modeled")));
    }
}
