// SPDX-License-Identifier: AGPL-3.0-only
//! Scenario dispatch shared by the CLI and the language bindings.
//!
//! [`run_toml`] parses a scenario from a TOML string, dispatches on its `kind`,
//! runs the matching pack, and returns the result as pretty JSON together with an
//! SVG chart and a one-line summary. The CLI, the Python binding, and the
//! WebAssembly binding all go through this one entry point so they never drift.

use crate::scenario::GnssState;
use serde::Deserialize;
use sha2::{Digest, Sha256};

/// The outputs of a scenario run: the result document, an SVG chart, a
/// human-readable one-line summary, and an optional CSV reproducibility artifact
/// (emitted by scenarios that publish a byte-stable table — e.g. `realtime-frame-eop`
/// writes its P4 Table 1 + Table 2 CSV here so a plain run produces the file the paper
/// cites, not only the `#[ignore]` golden-regen test).
#[derive(Clone, Debug, Default)]
pub struct RunOutput {
    pub json: String,
    pub svg: String,
    pub summary: String,
    /// Optional CSV artifact; `None` for scenarios that publish no CSV table.
    pub csv: Option<String>,
}

impl RunOutput {
    /// Write the CSV artifact (when present) to `path`, returning the bytes written.
    /// A no-op returning `Ok(0)` when the scenario produced no CSV.
    pub fn write_csv(&self, path: &std::path::Path) -> std::io::Result<usize> {
        match &self.csv {
            Some(csv) => {
                std::fs::write(path, csv)?;
                Ok(csv.len())
            }
            None => Ok(0),
        }
    }
}

/// Escape the five characters that matter in HTML text/attribute context.
fn html_escape(s: &str) -> String {
    s.replace('&', "&amp;")
        .replace('<', "&lt;")
        .replace('>', "&gt;")
        .replace('"', "&quot;")
        .replace('\'', "&#39;")
}

/// Percent-encode an SVG for an inert `data:` URI: the chart renders as an image
/// (so no embedded markup or script can execute) and the report stays a single
/// self-contained file.
fn svg_data_uri(svg: &str) -> String {
    let mut out = String::from("data:image/svg+xml,");
    for b in svg.bytes() {
        match b {
            b'%' | b'#' | b'<' | b'>' | b'"' | b'&' | b'\n' | b'\r' | b'\t' => {
                out.push_str(&format!("%{b:02X}"));
            }
            _ => out.push(b as char),
        }
    }
    out
}

/// Stamp a chart SVG with a self-identifying provenance footer in the bottom-right
/// corner — `Kshana v<version> · scenario <hash> · kshana.dev` — so a saved or
/// downloaded image always carries its version, the scenario fingerprint, and the
/// source. Applied centrally so every scenario kind is stamped identically.
fn with_provenance(svg: String, hash12: &str) -> String {
    let w = parse_svg_dim(&svg, "width").unwrap_or(800.0);
    let h = parse_svg_dim(&svg, "height").unwrap_or(420.0);
    let footer = format!(
        "<text x=\"{:.0}\" y=\"{:.0}\" text-anchor=\"end\" fill=\"#62594b\" font-size=\"10\" font-family=\"sans-serif\">Kshana v{} \u{00b7} scenario {} \u{00b7} kshana.dev</text>",
        w - 8.0,
        h - 6.0,
        env!("CARGO_PKG_VERSION"),
        hash12,
    );
    match svg.rfind("</svg>") {
        Some(i) => {
            let mut s = svg;
            s.insert_str(i, &footer);
            s
        }
        None => svg,
    }
}

/// Parse the root `<svg>`'s first `width`/`height` attribute as an f64 (the root
/// tag's dimensions precede any inner `rect`/`line`, so the first match is it).
fn parse_svg_dim(svg: &str, attr: &str) -> Option<f64> {
    let needle = format!("{attr}=\"");
    let start = svg.find(&needle)? + needle.len();
    let rest = &svg[start..];
    let end = rest.find('"')?;
    rest[..end].parse().ok()
}

/// Pull the 12-char `scenario_hash` fingerprint out of a result JSON document, if
/// present, so the chart footer matches the hash shown elsewhere for that run.
fn extract_scenario_hash(json: &str) -> Option<String> {
    let key = json.find("\"scenario_hash\"")?;
    let rest = &json[key + "\"scenario_hash\"".len()..];
    let open = rest.find('"')?; // opening quote of the value, after the colon
    let val = &rest[open + 1..];
    let end = val.find('"')?;
    Some(val[..end].chars().take(12).collect())
}

/// Pull a string value for `key` out of the result document's `"meta"` object,
/// if both the object and the key are present. Scoped to the `"meta"` block (which
/// the engine emits only when [`crate::report::StudyMeta`] is set) so it cannot
/// pick up an unrelated same-named key elsewhere in the JSON. Returns `None` when
/// the result carries no metadata, keeping meta-less reports byte-identical.
fn extract_meta_str(json: &str, key: &str) -> Option<String> {
    let meta_at = json.find("\"meta\"")?;
    let block = &json[meta_at..];
    let needle = format!("\"{key}\"");
    let key_at = block.find(&needle)?;
    let rest = &block[key_at + needle.len()..];
    let colon = rest.find(':')?;
    let after = &rest[colon + 1..];
    let open = after.find('"')?; // opening quote of the string value
    let val = &after[open + 1..];
    let end = val.find('"')?;
    Some(val[..end].to_string())
}

/// A stable 12-char fingerprint of the scenario source, for charts whose result
/// document does not carry a `scenario_hash` (e.g. the integrity/lunar reports).
fn src_fingerprint(src: &str) -> String {
    let mut h = Sha256::new();
    h.update(src.as_bytes());
    hex::encode(h.finalize()).chars().take(12).collect()
}

/// The timing-domain figures of merit, in report order, paired with a human label
/// and unit. These are the [`crate::fom::FoMScores`] field names; each carries a
/// validation tier looked up from [`crate::fom_label::tier_for`] (which derives it
/// from the verification matrix). Kept here so the HTML report and the lookup never
/// drift on the set of names.
const FOM_LABELS: &[(&str, &str, &str)] = &[
    ("holdover_s", "Holdover", "s"),
    ("timing_rms_ns", "Timing RMS", "ns"),
    ("timing_p95_ns", "Timing p95", "ns"),
    ("resilience_slope_ns_per_s", "Resilience slope", "ns/s"),
    ("availability", "Availability", ""),
    ("integrity", "Integrity", ""),
    ("security", "Security", ""),
];

/// Render a per-FoM validation-tier table from a run's JSON, walking it for any
/// `fom` objects (e.g. `quantum.fom` / `classical.fom`) and emitting one row per
/// present-and-numeric figure of merit with its value and its MODELLED/VALIDATED
/// tier from the verification matrix. Returns an empty string when the result
/// carries no clock-style FoM block (ephemeris / RAIM / spoof reports), so those
/// reports are unchanged. The tier is the honesty surface this method exists for.
fn fom_tier_table(json: &str) -> String {
    let Ok(root) = serde_json::from_str::<serde_json::Value>(json) else {
        return String::new();
    };
    // Collect (clock-label, fom-object) pairs from the known result shapes.
    let mut blocks: Vec<(String, &serde_json::Map<String, serde_json::Value>)> = Vec::new();
    for clock in ["quantum", "classical"] {
        if let Some(fom) = root
            .get(clock)
            .and_then(|c| c.get("fom"))
            .and_then(|f| f.as_object())
        {
            let label = root
                .get(clock)
                .and_then(|c| c.get("spec"))
                .and_then(|s| s.get("id"))
                .and_then(|v| v.as_str())
                .unwrap_or(clock)
                .to_string();
            blocks.push((label, fom));
        }
    }
    // A single top-level `fom` block (some packs report one clock).
    if blocks.is_empty() {
        if let Some(fom) = root.get("fom").and_then(|f| f.as_object()) {
            blocks.push((String::new(), fom));
        }
    }
    if blocks.is_empty() {
        return String::new();
    }

    let mut rows = String::new();
    for (clock_label, fom) in &blocks {
        for (key, label, unit) in FOM_LABELS {
            let Some(value) = fom.get(*key).and_then(|v| v.as_f64()) else {
                continue;
            };
            let Some(tier) = crate::fom_label::tier_for(key) else {
                continue;
            };
            let metric = if unit.is_empty() {
                (*label).to_string()
            } else {
                format!("{label} ({unit})")
            };
            let clock_cell = if clock_label.is_empty() {
                String::new()
            } else {
                format!("<td>{}</td>", html_escape(clock_label))
            };
            rows.push_str(&format!(
                "<tr>{clock_cell}<td>{}</td><td class=\"num\">{:.3}</td><td><span class=\"tier\">{}</span></td></tr>",
                html_escape(&metric),
                value,
                tier.tag(),
            ));
        }
    }
    if rows.is_empty() {
        return String::new();
    }
    let clock_header = if blocks.iter().any(|(l, _)| !l.is_empty()) {
        "<th>Clock</th>"
    } else {
        ""
    };
    format!(
        "<h2 class=\"fom-h\">Figures of merit</h2>\n\
         <table class=\"fom\"><thead><tr>{clock_header}<th>Metric</th>\
         <th class=\"num\">Value</th><th>Validation</th></tr></thead><tbody>{rows}</tbody></table>\n\
         <p class=\"tier-note\">Each figure of merit is tagged VALIDATED (checked against an \
         external oracle) or MODELLED (first-principles, internally tested), derived from the \
         verification matrix.</p>\n"
    )
}

impl RunOutput {
    /// Render a self-contained, branded HTML scorecard: the one-line summary, the
    /// chart (as an inert image), a per-FoM validation-tier table, and the full
    /// JSON result.
    pub fn html_report(&self) -> String {
        // Fallback-safe study metadata: when the result document carries a
        // `meta.study_title`, the page title becomes "<title> — Kshana"; when it
        // carries a caller-supplied `meta.generated_utc`, a stamp line is appended
        // to the footer. With no metadata both extractors return None and the
        // strings are EXACTLY the legacy ones (byte back-compat). The timestamp is
        // only ever read from the document — never from a clock — so the report
        // stays pure/deterministic.
        let title = match extract_meta_str(&self.json, "study_title") {
            Some(t) => format!("{} \u{2014} Kshana", html_escape(&t)),
            None => "Kshana \u{2014} scenario result".to_string(),
        };
        let generation_stamp = match extract_meta_str(&self.json, "generated_utc") {
            Some(ts) => format!(" Study generated {}.", html_escape(&ts)),
            None => String::new(),
        };
        format!(
            "<!doctype html>\n<html lang=\"en\">\n<head>\n<meta charset=\"utf-8\"/>\n\
             <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\"/>\n\
             <title>{title}</title>\n<style>\n\
             :root{{color-scheme:light dark}}\
             body{{font-family:system-ui,-apple-system,Segoe UI,Roboto,sans-serif;line-height:1.55;\
             max-width:900px;margin:0 auto;padding:2rem 1.25rem 3rem}}\
             .eyebrow{{letter-spacing:.18em;text-transform:uppercase;font-size:.72rem;opacity:.6;text-align:center}}\
             h1{{text-align:center;font-size:2.4rem;margin:.1rem 0;\
             background:linear-gradient(135deg,#2dd4bf,#6366f1,#a855f7);-webkit-background-clip:text;\
             background-clip:text;color:transparent}}\
             .tag{{text-align:center;opacity:.7;margin-top:0}}\
             .summary{{font-family:ui-monospace,Menlo,Consolas,monospace;font-size:.86rem;\
             border-left:3px solid #6366f1;padding:.7rem .9rem;background:rgba(99,102,241,.08);\
             border-radius:8px;overflow-x:auto;white-space:pre-wrap;word-break:break-word}}\
             .chart{{text-align:center;margin:1.2rem 0}}\
             .chart img{{max-width:100%;height:auto;border:1px solid #8884;border-radius:8px;background:#fff}}\
             details{{border:1px solid #8884;border-radius:8px;padding:.5rem .9rem}}\
             summary{{cursor:pointer;font-weight:600}}\
             pre{{font-family:ui-monospace,Menlo,Consolas,monospace;font-size:.78rem;overflow:auto;max-height:520px}}\
             h2.fom-h{{font-size:1.15rem;margin:1.6rem 0 .6rem;border-bottom:1px solid #8884;padding-bottom:.2rem}}\
             table.fom{{border-collapse:collapse;width:100%;font-size:.9rem}}\
             table.fom th,table.fom td{{border:1px solid #8884;padding:.35rem .6rem;text-align:left}}\
             table.fom .num{{text-align:right;font-variant-numeric:tabular-nums}}\
             .tier{{font-size:.72rem;letter-spacing:.06em;font-weight:600;padding:.05rem .4rem;border:1px solid #8886;border-radius:4px;white-space:nowrap}}\
             .tier-note{{font-size:.8rem;opacity:.75;margin:.5rem 0 1rem}}\
             footer{{margin-top:2rem;padding-top:1rem;border-top:1px solid #8884;font-size:.85rem;opacity:.75}}\
             </style>\n</head>\n<body>\n\
             <p class=\"eyebrow\">क्षण · the precise instant</p>\n\
             <h1>Kshana</h1>\n\
             <p class=\"tag\">Hybrid quantum / classical PNT performance scorecard</p>\n\
             <p class=\"summary\">{summary}</p>\n\
             <div class=\"chart\"><img alt=\"Result chart\" src=\"{chart}\"/></div>\n\
             {fom_table}\
             <details><summary>Full result (JSON)</summary><pre>{json}</pre></details>\n\
             <footer>Generated by Kshana {version}.{generation_stamp} Reproducible from scenario + seed + engine version. \
             Free and open source (AGPL-3.0) — <a href=\"https://github.com/AshfordeOU/kshana\">source &amp; docs</a>.</footer>\n\
             </body>\n</html>\n",
            summary = html_escape(&self.summary),
            chart = svg_data_uri(&self.svg),
            fom_table = fom_tier_table(&self.json),
            json = html_escape(&self.json),
            version = env!("CARGO_PKG_VERSION"),
        )
    }
}

#[derive(Deserialize)]
struct Kind {
    #[serde(default)]
    kind: String,
}

// Serialise a report to pretty JSON. Returns an error string rather than
// panicking: `serde_json` can fail when a `Serialize` impl errors or a map is
// keyed by a non-string type, which is a property of the (evolving) report types
// rather than something provable infallible at this call site, so the failure is
// propagated to the caller instead of being asserted away.
fn json_of<T: serde::Serialize>(v: &T) -> Result<String, String> {
    serde_json::to_string_pretty(v).map_err(|e| format!("failed to serialise report to JSON: {e}"))
}

/// [`json_of`], plus the report's `units` block.
///
/// Packs whose result document is built with `serde_json::json!` insert their own
/// `units` key inline. The packs that instead serialise a typed report struct have no
/// such literal to insert into, and bolting a `units` field onto the struct would change
/// a public type that other code round-trips. This helper adds the block to the
/// serialised document instead: purely additive, and the units table still lives in the
/// pack's own module, so the convention is one convention.
fn json_of_with_units<T: serde::Serialize>(
    v: &T,
    units: &[crate::field_schema::FieldUnit],
) -> Result<String, String> {
    json_of(&Documented {
        report: v,
        units: crate::field_schema::units_block(units),
    })
}

/// The wrapper [`json_of_with_units`] serialises: the report's own fields, flattened, and
/// then one `units` key.
///
/// Flattening rather than round-tripping through [`serde_json::Value`] is deliberate.
/// `serde_json`'s map is a `BTreeMap` here, so a `to_value` round trip would alphabetise
/// every key of a released document; `#[serde(flatten)]` keeps the report's declaration
/// order byte-for-byte and appends the new key at the end. The same shape as the
/// `OrbitOutput` wrapper further down this file.
#[derive(serde::Serialize)]
struct Documented<'a, T: serde::Serialize> {
    #[serde(flatten)]
    report: &'a T,
    units: serde_json::Value,
}

/// A minimal one-line SVG banner for scenario kinds whose primary artifact is the
/// JSON report (the rich table lives in the JSON, not a bespoke chart).
fn minimal_svg(summary: &str) -> String {
    let esc = summary
        .replace('&', "&amp;")
        .replace('<', "&lt;")
        .replace('>', "&gt;");
    format!(
        "<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"1180\" height=\"40\" \
         font-family=\"sans-serif\" font-size=\"12\" fill=\"#e6edf3\">\
         <rect width=\"1180\" height=\"40\" fill=\"#0b0e14\"/>\
         <text x=\"10\" y=\"24\">{esc}</text></svg>"
    )
}

fn integ(i: Option<f64>) -> String {
    i.map_or_else(|| "n/a".to_string(), |v| format!("{v:.3}"))
}

fn fnum(v: Option<f64>) -> String {
    v.map_or_else(|| "n/a".to_string(), |v| format!("{v:.2}"))
}

fn posm(v: Option<f64>) -> String {
    v.map_or_else(|| "n/a".to_string(), |v| format!("{v:.2}m"))
}

/// A structured failure taxonomy for the typed API, so binding callers can
/// pattern-match on the *kind* of failure rather than parse an opaque string.
#[derive(Clone, Debug, PartialEq, Eq)]
pub enum KshanaError {
    /// The scenario could not be parsed or violated an input constraint.
    InvalidInput(String),
    /// A solver failed to converge (reserved; the deterministic packs do not
    /// currently produce this).
    NonConvergence(String),
    /// The requested scenario kind or feature is not supported.
    Unsupported(String),
    /// An I/O failure (reserved for file-backed callers).
    IoError(String),
}

impl std::fmt::Display for KshanaError {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        // The message passes through unchanged so the string-returning
        // `run_toml` keeps producing the same human-readable text it always has.
        match self {
            KshanaError::InvalidInput(s)
            | KshanaError::NonConvergence(s)
            | KshanaError::Unsupported(s)
            | KshanaError::IoError(s) => write!(f, "{s}"),
        }
    }
}

impl KshanaError {
    /// A stable machine tag for the failure kind, so binding callers can branch on
    /// it without parsing the human-readable message.
    pub fn kind_tag(&self) -> &'static str {
        match self {
            KshanaError::InvalidInput(_) => "invalid_input",
            KshanaError::NonConvergence(_) => "non_convergence",
            KshanaError::Unsupported(_) => "unsupported",
            KshanaError::IoError(_) => "io_error",
        }
    }
}

impl std::error::Error for KshanaError {}

impl From<String> for KshanaError {
    fn from(s: String) -> Self {
        KshanaError::InvalidInput(s)
    }
}

/// The scenario kinds the engine can dispatch — the typed replacement for matching
/// on a raw `kind` string. [`ScenarioKind::classify`] resolves a TOML document's
/// `kind` field to one of these; the dispatcher then matches exhaustively on the
/// enum, so adding a pack is a compile-checked change rather than a string typo.
#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub enum ScenarioKind {
    Clock,
    Inertial,
    Integrity,
    TimeTransfer,
    QuantumTimeTransfer,
    QuantumGnssFreeNav,
    QuantumAnomalyDetect,
    Hybrid,
    Fusion,
    HybridUkf,
    GnssIns,
    GnssSim,
    Jamming,
    Spoof,
    SpoofDetect,
    Sweep,
    SweepNd,
    Orbit,
    Ephemeris,
    LunarIntegrity,
    LunarTime,
    LunarVlbi,
    LunarCombination,
    LunarFrameRealise,
    LunarService,
    LunarDpnt,
    LunarInterop,
    GravityMap,
    Terrain,
    TerrainSlam,
    CombinedAltPnt,
    Pvt,
    MarsPnt,
    ImpairmentEval,
    QuantumTrade,
    SpaceWeather,
    OemInterop,
    LaunchWindow,
    Reentry,
    EoCoverage,
    SpacePacket,
    AttitudeBudget,
    Passes,
    LinkBudget,
    LunarTimeBudget,
    RealtimeFrameEop,
    HybridOpticalRf,
    CislunarObservability,
    /// Independent-estimator corroboration of the cislunar arc-length observability
    /// threshold: a seeded Monte-Carlo batch least-squares recovery study whose
    /// measurement partials are central finite differences of the forward model, so it
    /// shares no Jacobian with the observability Gramian it is tested against.
    CislunarArcRecovery,
    ConflictResilience,
    LunarAttackSurface,
    /// Aperture navigation-versus-communications duty cycle from a contact plan.
    ApertureDutyCycle,
    /// Lunar surface-navigation RF jamming with a per-satellite J/S table.
    LunarJamming,
    /// Surface-beacon augmentation of a lunar orbital navigation service.
    LunarBeacon,
    /// Earth-GNSS reception at lunar distance, through the transmit sidelobes.
    EarthGnssLunar,
    /// INS/TRN coasting error growth and the coast durations reaching stated thresholds.
    InsTrnCoast,
    /// Lunar-VLBI station-coordinate covariance accumulated from the delay partials over a
    /// schedule of baselines and epochs.
    LunarVlbiFim,
    /// Tracking-loop loss of lock: C/N0 thresholds with hysteresis, time to lose lock,
    /// spoof pull-in versus code and carrier offset rate, and a loop-dynamics denial
    /// radius reported alongside the power-ratio one.
    TrackingLoop,
    /// The engine's ARAIM HPL/VPL against the published worked numerical examples
    /// of the EU-U.S. Working Group C ARAIM Technical Subgroup reference airborne
    /// algorithm, at the tolerance (`TOL_PL`) those documents themselves state.
    AraimReferenceCheck,
    /// Seven-parameter Helmert frame datum driven by a simulated observing campaign: the
    /// lunar-VLBI beacon-coordinate information accumulated over a schedule and propagated
    /// through the Helmert design, with no transform injected anywhere.
    LunarFrameCampaign,
    /// The same seven-parameter Helmert frame datum driven by a **real, archived** observing
    /// campaign: measured ILRS lunar laser ranging normal points supply the schedule and
    /// every observation weight.
    LunarLlrDatum,
}

impl ScenarioKind {
    /// The canonical `kind` string for this variant.
    pub fn as_str(self) -> &'static str {
        match self {
            ScenarioKind::Clock => "clock",
            ScenarioKind::Inertial => "inertial",
            ScenarioKind::Integrity => "integrity",
            ScenarioKind::TimeTransfer => "timetransfer",
            ScenarioKind::QuantumTimeTransfer => "quantum-time-transfer",
            ScenarioKind::QuantumGnssFreeNav => "quantum-gnss-free-nav",
            ScenarioKind::QuantumAnomalyDetect => "quantum-anomaly-detect",
            ScenarioKind::Hybrid => "hybrid",
            ScenarioKind::Fusion => "fusion",
            ScenarioKind::HybridUkf => "hybrid-ukf",
            ScenarioKind::GnssIns => "gnss-ins",
            ScenarioKind::GnssSim => "gnss-sim",
            ScenarioKind::Jamming => "jamming",
            ScenarioKind::Spoof => "spoof",
            ScenarioKind::SpoofDetect => "spoof-detect",
            ScenarioKind::Sweep => "sweep",
            ScenarioKind::SweepNd => "sweep-nd",
            ScenarioKind::Orbit => "orbit",
            ScenarioKind::Ephemeris => "ephemeris",
            ScenarioKind::LunarIntegrity => "lunar-integrity",
            ScenarioKind::LunarTime => "lunar-time-offset",
            ScenarioKind::LunarVlbi => "lunar-vlbi",
            ScenarioKind::LunarCombination => "lunar-joint-od-clock",
            ScenarioKind::LunarFrameRealise => "lunar-frame-realisation",
            ScenarioKind::LunarFrameCampaign => "lunar-frame-campaign",
            ScenarioKind::LunarLlrDatum => "lunar-llr-datum",
            ScenarioKind::LunarService => "moonlight-service-volume",
            ScenarioKind::LunarDpnt => "lunar-differential-pnt",
            ScenarioKind::LunarInterop => "lunar-interop-export",
            ScenarioKind::GravityMap => "gravity-map",
            ScenarioKind::Terrain => "terrain-nav",
            ScenarioKind::TerrainSlam => "terrain-slam",
            ScenarioKind::CombinedAltPnt => "combined-altpnt",
            ScenarioKind::Pvt => "pvt",
            ScenarioKind::MarsPnt => "mars-pnt",
            ScenarioKind::ImpairmentEval => "impairment-eval",
            ScenarioKind::QuantumTrade => "quantum-trade",
            ScenarioKind::SpaceWeather => "space-weather",
            ScenarioKind::OemInterop => "oem-interop",
            ScenarioKind::LaunchWindow => "launch-window",
            ScenarioKind::Reentry => "reentry",
            ScenarioKind::EoCoverage => "eo-coverage",
            ScenarioKind::SpacePacket => "space-packet",
            ScenarioKind::AttitudeBudget => "attitude-budget",
            ScenarioKind::Passes => "passes",
            ScenarioKind::LinkBudget => "link-budget",
            ScenarioKind::LunarTimeBudget => "lunar-time-budget",
            ScenarioKind::RealtimeFrameEop => "realtime-frame-eop",
            ScenarioKind::HybridOpticalRf => "hybrid-optical-rf",
            ScenarioKind::CislunarObservability => "cislunar-observability",
            ScenarioKind::CislunarArcRecovery => "cislunar-arc-recovery",
            ScenarioKind::ConflictResilience => "conflict-resilience",
            ScenarioKind::LunarAttackSurface => "lunar-attack-surface",
            ScenarioKind::ApertureDutyCycle => "aperture-duty-cycle",
            ScenarioKind::LunarJamming => "lunar-jamming",
            ScenarioKind::LunarBeacon => "lunar-beacon",
            ScenarioKind::EarthGnssLunar => "earth-gnss-lunar",
            ScenarioKind::InsTrnCoast => "ins-trn-coast",
            ScenarioKind::LunarVlbiFim => "lunar-vlbi-fim",
            ScenarioKind::TrackingLoop => "tracking-loop",
            ScenarioKind::AraimReferenceCheck => "araim-reference-check",
        }
    }

    /// Resolve the `kind` field of a TOML scenario to a typed variant. An absent or
    /// `clock` kind (and, for backward compatibility, any unrecognised kind) maps to
    /// [`ScenarioKind::Clock`], the historical default pack.
    pub fn classify(src: &str) -> Result<ScenarioKind, KshanaError> {
        let kind: Kind = toml::from_str(src).unwrap_or(Kind {
            kind: String::new(),
        });
        Ok(match kind.kind.as_str() {
            "inertial" => ScenarioKind::Inertial,
            "integrity" => ScenarioKind::Integrity,
            "timetransfer" => ScenarioKind::TimeTransfer,
            "quantum-time-transfer" => ScenarioKind::QuantumTimeTransfer,
            "quantum-gnss-free-nav" => ScenarioKind::QuantumGnssFreeNav,
            "quantum-anomaly-detect" => ScenarioKind::QuantumAnomalyDetect,
            "hybrid" => ScenarioKind::Hybrid,
            "fusion" => ScenarioKind::Fusion,
            "hybrid-ukf" => ScenarioKind::HybridUkf,
            "gnss-ins" => ScenarioKind::GnssIns,
            "gnss-sim" => ScenarioKind::GnssSim,
            "jamming" => ScenarioKind::Jamming,
            "spoof" => ScenarioKind::Spoof,
            "spoof-detect" => ScenarioKind::SpoofDetect,
            "sweep" => ScenarioKind::Sweep,
            "sweep-nd" => ScenarioKind::SweepNd,
            "orbit" => ScenarioKind::Orbit,
            "ephemeris" => ScenarioKind::Ephemeris,
            "lunar-integrity" => ScenarioKind::LunarIntegrity,
            "lunar-time-offset" => ScenarioKind::LunarTime,
            "lunar-vlbi" => ScenarioKind::LunarVlbi,
            "lunar-joint-od-clock" => ScenarioKind::LunarCombination,
            "lunar-frame-realisation" => ScenarioKind::LunarFrameRealise,
            "lunar-frame-campaign" => ScenarioKind::LunarFrameCampaign,
            "lunar-llr-datum" => ScenarioKind::LunarLlrDatum,
            "moonlight-service-volume" => ScenarioKind::LunarService,
            "lunar-differential-pnt" => ScenarioKind::LunarDpnt,
            "lunar-interop-export" => ScenarioKind::LunarInterop,
            "gravity-map" => ScenarioKind::GravityMap,
            "terrain-nav" => ScenarioKind::Terrain,
            "terrain-slam" => ScenarioKind::TerrainSlam,
            "combined-altpnt" => ScenarioKind::CombinedAltPnt,
            "pvt" => ScenarioKind::Pvt,
            "mars-pnt" => ScenarioKind::MarsPnt,
            "impairment-eval" => ScenarioKind::ImpairmentEval,
            "quantum-trade" => ScenarioKind::QuantumTrade,
            "space-weather" => ScenarioKind::SpaceWeather,
            "oem-interop" => ScenarioKind::OemInterop,
            "launch-window" => ScenarioKind::LaunchWindow,
            "reentry" => ScenarioKind::Reentry,
            "eo-coverage" => ScenarioKind::EoCoverage,
            "space-packet" => ScenarioKind::SpacePacket,
            "attitude-budget" => ScenarioKind::AttitudeBudget,
            "passes" => ScenarioKind::Passes,
            "link-budget" => ScenarioKind::LinkBudget,
            "lunar-time-budget" => ScenarioKind::LunarTimeBudget,
            "realtime-frame-eop" => ScenarioKind::RealtimeFrameEop,
            "hybrid-optical-rf" => ScenarioKind::HybridOpticalRf,
            "cislunar-observability" => ScenarioKind::CislunarObservability,
            "cislunar-arc-recovery" => ScenarioKind::CislunarArcRecovery,
            "conflict-resilience" => ScenarioKind::ConflictResilience,
            "lunar-attack-surface" => ScenarioKind::LunarAttackSurface,
            "aperture-duty-cycle" => ScenarioKind::ApertureDutyCycle,
            "lunar-jamming" => ScenarioKind::LunarJamming,
            "lunar-beacon" => ScenarioKind::LunarBeacon,
            "earth-gnss-lunar" => ScenarioKind::EarthGnssLunar,
            "ins-trn-coast" => ScenarioKind::InsTrnCoast,
            "lunar-vlbi-fim" => ScenarioKind::LunarVlbiFim,
            "tracking-loop" => ScenarioKind::TrackingLoop,
            "araim-reference-check" => ScenarioKind::AraimReferenceCheck,
            // The clock pack, named explicitly. It had no arm of its own before, because
            // it was reached through the catch-all below — so removing that catch-all
            // orphaned the one kind the engine has always had. The round-trip test found
            // this on the first run.
            "clock" => ScenarioKind::Clock,
            // An ABSENT kind keeps the historical default: the three bundled clock
            // scenarios carry no `kind` line at all, and documents written before the
            // field existed must keep running.
            "" => ScenarioKind::Clock,
            // An UNKNOWN kind is a typo, and used to fall through to the clock pack —
            // so `kind = "lunar-vbli-fim"` ran a clock-holdover simulation and reported
            // it as a successful run of something the user never asked for. An engine
            // whose whole claim is that its numbers can be believed must not silently
            // answer a different question. Name the nearest built-in, because the
            // overwhelmingly likely cause is a slip of one or two characters.
            other => {
                return Err(KshanaError::InvalidInput(match nearest_kind(other) {
                    Some(hint) => format!(
                        "unknown scenario kind {other:?} — did you mean {hint:?}? \
                         `kshana kinds` lists all {n} built-in kinds.",
                        n = list_scenario_kinds().len()
                    ),
                    None => format!(
                        "unknown scenario kind {other:?}. `kshana kinds` lists all {n} \
                         built-in kinds.",
                        n = list_scenario_kinds().len()
                    ),
                }))
            }
        })
    }

    /// The registry id for this kind — the canonical kebab string interned as a
    /// [`crate::registry::ScenarioId`].
    pub fn to_id(&self) -> crate::registry::ScenarioId {
        crate::registry::ScenarioId::from_static(self.as_str())
    }
}

/// Metadata describing one scenario kind for programmatic introspection
/// (auto-complete, UI, notebooks): the `kind` name, a one-line description, and the
/// required / optional top-level fields.
#[derive(Clone, Debug, serde::Serialize)]
pub struct ScenarioMeta {
    pub name: &'static str,
    pub description: &'static str,
    pub required_fields: &'static [&'static str],
    pub optional_fields: &'static [&'static str],
}

/// The built-in kind closest to `probe`, for the "did you mean" on an unknown kind.
///
/// Two passes. First plain Levenshtein distance, accepted only when it is at most a
/// third of the probe's length (minimum 1). That bound is deliberate: a suggestion is
/// useful for a typo and actively misleading for a name the caller invented, so
/// `"lunar-vbli-fim"` earns a hint and `"frobnicate"` earns none. Then, only if that
/// finds nothing, a prefix relation in either direction — because the other common
/// slip is a real kind plus or minus a whole qualifier, which edit distance scores as
/// far away.
fn nearest_kind(probe: &str) -> Option<&'static str> {
    fn distance(a: &str, b: &str) -> usize {
        let (a, b): (Vec<char>, Vec<char>) = (a.chars().collect(), b.chars().collect());
        let mut prev: Vec<usize> = (0..=b.len()).collect();
        let mut cur = vec![0usize; b.len() + 1];
        for (i, ca) in a.iter().enumerate() {
            cur[0] = i + 1;
            for (j, cb) in b.iter().enumerate() {
                let sub = prev[j] + usize::from(ca != cb);
                cur[j + 1] = sub.min(prev[j + 1] + 1).min(cur[j] + 1);
            }
            std::mem::swap(&mut prev, &mut cur);
        }
        prev[b.len()]
    }
    let budget = (probe.chars().count() / 3).max(1);
    let by_distance = list_scenario_kinds()
        .into_iter()
        .map(|m| (distance(probe, m.name), m.name))
        .filter(|(d, _)| *d <= budget)
        .min_by_key(|(d, name)| (*d, *name))
        .map(|(_, name)| name);
    if by_distance.is_some() {
        return by_distance;
    }
    // `"integrity-raim"` — the README's own scenario FILE name typed as a kind — is 5
    // edits from `"integrity"` against a budget of 4, so it earned no hint at all. A
    // prefix relation is a stronger signal than a long edit path and still refuses an
    // invented name: no kind starts with "frobnicate" and "frobnicate" starts with no
    // kind. Shortest match first, then alphabetical, so the answer is deterministic.
    list_scenario_kinds()
        .into_iter()
        .map(|m| m.name)
        .filter(|name| probe.starts_with(name) || name.starts_with(probe))
        .min_by_key(|name| (name.len(), *name))
}

/// List every built-in scenario kind with its metadata. Bindings expose this so a
/// caller can discover the packs and their fields without reading the source.
pub fn list_scenario_kinds() -> Vec<ScenarioMeta> {
    vec![
        ScenarioMeta { name: "clock", description: "Clock holdover vs spec; optional Monte-Carlo ensemble (runs > 1).", required_fields: &["threshold_ns", "time", "gnss", "clock_quantum", "clock_classical"], optional_fields: &["seed", "runs"] },
        ScenarioMeta { name: "inertial", description: "1-DOF inertial dead-reckoning during a GNSS outage.", required_fields: &["threshold_m", "time", "gnss", "accel_quantum", "accel_classical"], optional_fields: &["seed", "runs"] },
        ScenarioMeta { name: "orbit", description: "GNSS availability + DOP from an orbital constellation (Walker / TLE / RINEX).", required_fields: &["threshold_ns", "time", "user", "constellation", "clock_quantum", "clock_classical"], optional_fields: &["mask_deg", "sigma_uere_m", "seed"] },
        ScenarioMeta { name: "ephemeris", description: "Ephemeris & ground track: propagate one satellite (TLE→SGP4 or analytic orbit) and emit its TEME/GCRS state (position + velocity), ITRF/ECEF position, WGS-84 sub-satellite lat/lon/alt, and per-step station az/el/range + range-rate (Doppler).", required_fields: &[], optional_fields: &["tle", "orbit", "epoch", "step_s", "duration_s", "station", "dut1_s", "xp_arcsec", "yp_arcsec", "carrier_hz", "eop_finals2000a"] },
        ScenarioMeta { name: "integrity", description: "Snapshot / solution-separation / ARAIM RAIM with HPL/VPL and a Stanford diagram.", required_fields: &["time", "user", "constellation"], optional_fields: &["mask_deg", "sigma_uere_m", "p_fa", "p_md"] },
        ScenarioMeta { name: "lunar-integrity", description: "Lunar south-pole ARAIM protection-level pass vs a representative LunaNet relay set. sigma_ure_m exposes the signal-in-space ranging accuracy (protection levels scale linearly with it, so sweeping it answers what ranging accuracy an alert limit requires). Defaults to the historical LNIS-class south-pole case.", required_fields: &[], optional_fields: &["step_s", "duration_s", "alert_limit_m", "p_hmi", "sigma_ure_m"] },
        ScenarioMeta { name: "lunar-time-offset", description: "Modelled relativistic Earth–Moon clock rate (Lunar Coordinate Time, LTC/TCL): the secular LTC−TT rate from the self-potential difference and the Moon's kinetic term, reported with the published 56–59 µs/day band, plus the accumulated offset over a horizon.", required_fields: &[], optional_fields: &["epoch_year", "epoch_month", "epoch_day", "horizon_days"] },
        ScenarioMeta { name: "lunar-vlbi", description: "Modelled lunar geodetic VLBI delay observable: an Earth baseline (two ground stations, GCRS) observes a one-way signal from a NovaMoon-class lunar-surface beacon. Emits the near-field two-range-difference delay, its rate, and the wavefront-curvature near-field correction over a pass — cross-checked against the same-codebase plane-wave Δ-DOR observable in the far-field limit, with finite-difference-verified partials. MODELLED, NOT validated against real VLBI data; carries the frame-consistency, xp=yp=0 polar-motion and plane-wave-vs-near-field caveats.", required_fields: &[], optional_fields: &["station1_lat_deg", "station1_lon_deg", "station1_alt_m", "station2_lat_deg", "station2_lon_deg", "station2_alt_m", "beacon_lat_deg", "beacon_lon_deg", "beacon_alt_m", "epoch_year", "epoch_month", "epoch_day", "horizon_hours", "step_min"] },
        ScenarioMeta { name: "lunar-joint-od-clock", description: "Modelled joint multi-technique lunar OD + clock batch estimator on a SIMULATED network: a Gauss-Newton snapshot fit that fuses Earth-baseline geodetic VLBI delays, lunar-local station↔satellite ranges and inter-satellite ranges to recover, together, a lunar surface station's 3-D position, a small constellation's positions and every asset's clock offset from an injected truth. The headline honest result — VLBI makes the station's full 3-D position observable where lunar-local ranging alone leaves a weakly-observed direction — is reported as the with-vs-without-VLBI station-error contrast. MODELLED simulated closed-loop recovery (truth shares the observation model), deterministic (seeded), NOT real-data validated; no force-model propagation inside the solver; no TRL/heritage/agency endorsement.", required_fields: &[], optional_fields: &["n_sat", "n_earth", "seed", "sigma_vlbi_s", "sigma_range_m", "sigma_isl_m", "station_lat_deg", "station_lon_deg", "station_alt_m", "orbit_radius_km", "epoch_year", "epoch_month", "epoch_day"] },
        ScenarioMeta { name: "lunar-frame-realisation", description: "Modelled lunar reference-frame realisation: a 7-parameter Helmert (similarity) datum fit — 3 translation, 3 small-angle rotation, 1 scale — tying an estimated set of selenographic-derived MCMF point coordinates to a datum by weighted least squares (crate::batch_ls::gauss_newton), plus a simple orientation tie expressing the realised small rotation about the ICRF axes relative to the IAU 2015 WGCCRE body orientation. The scenario injects a known small transform (translation ~tens of m, rotation ~µrad, scale ~1e-7) into a well-spread synthetic point network, adds seeded Gaussian noise, recovers the datum, and reports the recovered transform, the per-parameter recovery error vs the injected truth, and the post-fit RMS residual. MODELLED self-consistency — recovers an injected similarity transform (noiseless to ~machine precision), NOT a realisation against real tracking/VLBI data; deterministic (seeded); no TRL/heritage/agency endorsement.", required_fields: &[], optional_fields: &["n_points", "tx_m", "ty_m", "tz_m", "rot_x_urad", "rot_y_urad", "rot_z_urad", "scale_ppb", "noise_sigma_m", "seed", "epoch_year", "epoch_month", "epoch_day"] },
        ScenarioMeta { name: "moonlight-service-volume", description: "Modelled lunar navigation service-volume analysis from an ILLUSTRATIVE, public-source Moonlight/LCNS-class lunar-orbit constellation (not affiliated with ESA): sweeps a selenographic lat/lon grid over a time horizon and reports DOP / coverage / availability (≥4 sats AND PDOP < threshold) plus a generalised lunar ARAIM protection-level (HPL/VPL) envelope over the volume. The DOP geometry REUSES the gnss_lib_py-VALIDATED kernel (crate::orbit::dop); the protection level REUSES the LunaNet LNIS lunar ARAIM machinery (crate::lunar, σ_URE≈30 m) and reduces to the existing south-pole PL as a special case. MODELLED composition: a circular-/elliptical-Keplerian relay set (not the real differential-corrected LCNS/NRHO ephemeris), a mean-rotation Moon (no libration/precessing pole). Deterministic (pure geometry). No TRL/heritage/agency endorsement.", required_fields: &[], optional_fields: &["n_sats", "sma_km", "eccentricity", "inc_deg", "argp_deg", "lat_min_deg", "lat_max_deg", "lat_step_deg", "lon_min_deg", "lon_max_deg", "lon_step_deg", "horizon_hours", "step_min", "elev_mask_deg", "pdop_threshold", "alert_limit_m", "p_hmi", "perturbed", "sigma_ure_m", "export_site_lat_deg", "export_site_lon_deg", "export_antenna", "ephemeris_path"] },
        ScenarioMeta { name: "lunar-differential-pnt", description: "Modelled lunar DIFFERENTIAL PNT (a lunar DGNSS/SBAS analogue): a NovaMoon-class reference station at a KNOWN selenographic location computes per-satellite differential corrections from an ILLUSTRATIVE, public-source Moonlight/LCNS-class constellation (NovaMoon referenced only as a system CLASS, not affiliated with ESA), and a user offset by baseline_km applies them so the COMMON-MODE orbit + clock errors cancel. The clock term cancels EXACTLY (an algebraic identity); the orbit term leaves only the line-of-sight-difference projection, which → 0 as baseline → 0 (the spatial-decorrelation floor) and grows ≈ linearly with baseline. Reports the user 3-D position error WITH vs WITHOUT corrections, the reduction factor, the error-vs-baseline curve, and a user protection level that REUSES the DO-229E SBAS machinery (crate::sbas) with the differential residual σ. MODELLED — exact cancellation identity + first-order decorrelation model; not real-data validated; no TRL/heritage/agency endorsement. Deterministic if seeded.", required_fields: &[], optional_fields: &["n_sats", "sma_km", "eccentricity", "inc_deg", "argp_deg", "ref_lat_deg", "ref_lon_deg", "baseline_km", "orbit_err_m", "clock_err_m", "noise_m", "seed", "t_s", "residual_sigma_m", "p_hmi", "survey_sigma_m", "latency_s", "quantization_bits"] },
        ScenarioMeta { name: "lunar-interop-export", description: "Modelled lunar interoperability export: emits the lunar reference frame, lunar time scale and lunar ephemeris in LunaNet/IOAG-aligned, CCSDS-based interchange forms with round-trip / field conformance. REUSES the crate's CCSDS OEM 2.0 emitter+parser (crate::oem) re-tagged for the lunar context — the OEM REF_FRAME carries the IAU 2015 WGCCRE lunar body frame (MOON_ME / MOON_PA), TIME_SYSTEM the lunar time scale (LTC / TCL / UTC), CENTER_NAME = MOON — over a sample illustrative LCNS-class ephemeris (positions from crate::lunar_service, velocity by finite difference). Also emits a LunaNet/IOAG-aligned lunar-time descriptor (scale id, secular rate µs/day from crate::lunar_time, published band, reference surface) that round-trips via serde_json, and wraps the artifacts in the existing KIF envelope (crate::interchange) with the MODELLED honesty label. Reports artifacts emitted, OEM line count, field-conformance pass + present/missing field list, OEM round-trip ok, time-metadata round-trip ok, and KIF byte size. MODELLED — deterministic round-trip + field-name conformance vs published CCSDS OEM + LunaNet/IOAG field semantics is the oracle; NOT a certified interoperability conformance test; illustrative public-source ephemeris, not affiliated with ESA; no TRL/heritage/agency endorsement.", required_fields: &[], optional_fields: &["frame", "time_system", "n_states", "epoch", "step_min", "object"] },
        ScenarioMeta { name: "timetransfer", description: "Optical vs RF two-way time/frequency transfer.", required_fields: &["time", "optical", "rf"], optional_fields: &["seed"] },
        ScenarioMeta { name: "quantum-anomaly-detect", description: "MODELLED fault/anomaly detection for quantum PNT systems: a labelled fault catalog (clock frequency-jump/drift/lock-loss; sensor bias-step/dropout), a detection-statistic ROC AUC (with a bootstrap CI from the externally-validated eval_stats) and a minimum-detectable-fault at a fixed false-alarm rate, with the quantum-clock-aided monitor (lower noise) detecting smaller faults — as honest TradeEvidence + representativeness. Gaussian detection-statistic model (AUC = Phi(mu/(sigma*sqrt2))); models the class, illustrative public-source params, no TRL/flight/certification.", required_fields: &[], optional_fields: &["fault_mu", "quantum_sigma", "classical_sigma", "pfa", "pd", "samples", "seed"] },
        ScenarioMeta { name: "quantum-gnss-free-nav", description: "MODELLED GNSS-free quantum navigation: during a GNSS outage, a quantum (cold-atom interferometer) inertial budget vs a classical navigation-grade INS — position-error growth over the coast, holdover to a position threshold, and the quantum-vs-classical trade as honest TradeEvidence with representativeness. Honest observability note: with no external fix the accelerometer bias is unobservable so the error grows; the quantum sensor slows but does not close that gap. Illustrative public-source device params; models the class, no TRL/flight/certification.", required_fields: &[], optional_fields: &["outage_s", "threshold_m", "quantum_bias_m_s2", "classical_bias_m_s2"] },
        ScenarioMeta { name: "quantum-time-transfer", description: "MODELLED trusted-quantum-timing chain: an end-to-end quantum (optical-lattice clock + entanglement/single-photon link) vs classical (CSAC + RF two-way) time-transfer budget, a reused timing protection level + a delay/replay-attack security FoM (1-P_md), a clock-anomaly detection probability + CUSUM latency, and the quantum-vs-classical trade as honest TradeEvidence with a representativeness + gaps-to-flight record. Illustrative public-source device/link params; models the class, no TRL/flight/certification claimed.", required_fields: &[], optional_fields: &["integration_s", "dissemination_interval_s", "link_loss_db", "classical_link_sigma_s", "monitor_pfa", "attack_delay_s", "clock_fault_sigma"] },
        ScenarioMeta { name: "hybrid", description: "Hybrid PNT capstone: clock + IMU + time-transfer aiding.", required_fields: &["timing_spec_ns", "position_spec_m", "time", "gnss", "clock_quantum", "clock_classical", "accel_quantum", "accel_classical"], optional_fields: &["resync", "seed"] },
        ScenarioMeta { name: "fusion", description: "Joint Kalman sensor-fusion PNT over the same hybrid inputs.", required_fields: &["timing_spec_ns", "position_spec_m", "time", "gnss", "clock_quantum", "clock_classical", "accel_quantum", "accel_classical"], optional_fields: &["resync", "seed"] },
        ScenarioMeta { name: "hybrid-ukf", description: "17-state hybrid quantum+classical tightly-coupled GNSS/INS UKF (MODELLED): 15 INS error states + CAI-derived accel-bias correction + a 2-state (phase+frequency) clock from the q-parameter clock engine, driven by the bracketed CAI error model. The figure of merit is filter self-consistency (NEES + innovation-whiteness vs χ² bounds) — a self-consistency statement, NOT a real-world accuracy guarantee. Simulation only; no TRL>3, no flight heritage, no external validation.", required_fields: &["time", "gnss", "accel", "clock"], optional_fields: &["seed", "residual_accel_bias_m_s2", "speed_m_s", "sigma_pr_m", "sigma_rr_mps", "consistency_seeds", "q_factor", "r_factor"] },
        ScenarioMeta { name: "gnss-ins", description: "Loosely- and tightly-coupled GNSS/INS error-state EKF.", required_fields: &["time", "gnss", "imu_quantum", "imu_classical"], optional_fields: &["seed", "threshold_m", "fix_interval_s", "sigma_pos_m", "sigma_vel_mps", "lat_deg", "lon_deg", "alt_m"] },
        ScenarioMeta { name: "gnss-sim", description: "Measurement-domain pseudorange simulation (Klobuchar iono, Saastamoinen/Niell tropo) + RAIM.", required_fields: &["seed", "time", "receiver", "constellation"], optional_fields: &["iono", "tropo", "mask_deg", "noise_sigma_m", "multipath_m", "sat_clock_rms_m", "uere_m", "p_fa", "p_md", "alert_limit_h_m", "alert_limit_v_m"] },
        ScenarioMeta { name: "jamming", description: "Link-budget jamming: J/S → effective C/N₀ → loss of lock.", required_fields: &["seed", "time", "receiver", "constellation"], optional_fields: &["jammer", "mask_deg", "tracking_threshold_dbhz", "degraded_margin_db", "signal_power_dbw", "temp_k", "freq_hz", "chip_rate_hz"] },
        ScenarioMeta { name: "spoof", description: "Stochastic time-spoof detector (Neyman–Pearson / χ²₁) with Monte-Carlo P_fa/P_md.", required_fields: &["threshold_ns", "time", "attack", "clock_quantum", "clock_classical"], optional_fields: &[] },
        ScenarioMeta { name: "spoof-detect", description: "Combined RF/measurement spoof detector (multi-SV RAIM-consistency + AGC + SQM, fused) vs a parameterised attack (power advantage, carrier-phase alignment, time/position push; TEXBAT-style).", required_fields: &["attack"], optional_fields: &["satellites", "detector"] },
        ScenarioMeta { name: "sweep", description: "1-D trade-study sweep over a clock-pack parameter.", required_fields: &["parameter", "metric", "start", "stop", "steps", "base"], optional_fields: &["scale"] },
        ScenarioMeta { name: "sweep-nd", description: "Generic N-D sweep over any pack via dotted TOML keys / JSON metric paths.", required_fields: &["base", "axes", "metrics"], optional_fields: &[] },
        ScenarioMeta { name: "gravity-map", description: "GPS-denied gravity-map-matching navigation: a cold-atom gravimeter recovers a constant INS drift from the gravity-anomaly sequence it flies through.", required_fields: &["nmax", "start_lat_deg", "start_lon_deg", "step_lat_deg", "step_lon_deg", "waypoints", "drift_lat_deg", "drift_lon_deg", "gravimeter_asd", "averaging_time_s", "map_sigma_mgal", "search_half_deg", "search_step_deg"], optional_fields: &["coeffs", "mascons", "refine_stages", "refine_factor", "noise_seed"] },
        ScenarioMeta { name: "terrain-nav", description: "GPS-denied terrain-referenced navigation (TERCOM/SITAN): a radar/baro altimeter matches the ground-elevation profile against an SRTM-style DEM to recover the INS drift.", required_fields: &["dem_seed", "start_lat_deg", "start_lon_deg", "step_lat_deg", "step_lon_deg", "waypoints", "drift_lat_deg", "drift_lon_deg", "altimeter_sigma_m", "map_sigma_m", "search_half_deg", "search_step_deg"], optional_fields: &["refine_stages", "refine_factor", "noise_seed"] },
        ScenarioMeta { name: "terrain-slam", description: "GPS-denied sequential (recursive) terrain-referenced navigation: a particle filter runs the terrain-match measurement model epoch by epoch (SITAN as a running filter) so a time-varying INS drift is tracked along the track, where the batch terrain-nav only recovers a single constant offset.", required_fields: &["dem_seed", "start_lat_deg", "start_lon_deg", "step_lat_deg", "step_lon_deg", "waypoints", "drift_rate_lat_deg", "drift_rate_lon_deg", "altimeter_sigma_m", "map_sigma_m"], optional_fields: &["n_particles", "init_pos_sigma_deg", "process_sigma_deg", "resample_ess_frac", "seed"] },
        ScenarioMeta { name: "combined-altpnt", description: "GPS-denied combined gravity + magnetic + terrain navigator: three scalar field channels fused per waypoint for a sharper (lower-CRLB) drift fix than any single field.", required_fields: &["start_lat_deg", "start_lon_deg", "step_lat_deg", "step_lon_deg", "waypoints", "drift_lat_deg", "drift_lon_deg", "search_half_deg", "search_step_deg", "nmax", "gravity_sigma_mgal", "igrf_year", "magnetic_sigma_nt", "dem_seed", "terrain_sigma_m"], optional_fields: &["coeffs", "mascons", "magnetic_mascons", "igrf_alt_km", "refine_stages", "refine_factor", "noise_seed"] },
        ScenarioMeta { name: "pvt", description: "Real-observation single-point positioning: solve a receiver's position from a RINEX 3 observation file and a broadcast-navigation file (code pseudoranges, broadcast ephemeris, Klobuchar iono, Saastamoinen/Niell tropo), optionally validated against a surveyed coordinate.", required_fields: &["obs_rinex", "nav_rinex"], optional_fields: &["truth_ecef", "apriori_ecef", "mask_deg"] },
        ScenarioMeta { name: "mars-pnt", description: "Deep-space Mars PNT: a simulated MARCONI relay constellation (areostationary + inclined relays broadcasting one-way + relaying two-way to a deep-space station) navigates a reference user (transfer | lmo | surface) through the joint one-way/two-way radiometric fusion estimator. Reports per-epoch geometry/visibility, achieved RMS vs truth, and the formal covariance (1σ / 3σ position) — an honest simulated FoM, NOT a certified protection level.", required_fields: &[], optional_fields: &["user", "clock_class", "step_s", "duration_s", "nmax", "range_sigma_m", "doppler_sigma_mps", "dynamic_tightness", "two_way_period_s", "seed"] },
        ScenarioMeta { name: "impairment-eval", description: "AI/ML RF-impairment detection evaluation testbed (13494): generate a labelled, parameter-grounded SYNTHETIC corpus (nominal/jamming/spoof-time/spoof-position/multipath), score a detector (energy|agc|sqm|parity|fused) with the detector-agnostic harness, and report AUC/ROC/confusion + per-class Pd at a target Pfa, plus the in- vs out-of-distribution optimism gap. MODELLED operating characteristics only — never field/IQ, no good/bad verdict.", required_fields: &[], optional_fields: &["seed", "n_per_class", "nominal_cn0_dbhz", "meas_noise", "detector", "target_pfa", "shift_severity_scale", "optimism_tol"] },
        ScenarioMeta { name: "quantum-trade", description: "Quantum-vs-classical PNT trade (13503): timing-holdover + inertial-holdover benefit of a candidate clock (a measured-ADEV curve — the defensibility hinge — or a quantum clock class) vs a classical baseline class, with the long-tau floor-assumption caveat carried on the artifact, plus a GNSS-denied resilience-vs-time envelope. MODELLED; quantifies (never validates) a partner device.", required_fields: &["timing_threshold_s", "position_threshold_m", "baseline_clock_class"], optional_fields: &["candidate_clock_class", "candidate_adev_taus", "candidate_adev_values", "baseline_ins", "candidate_ins", "resilience_times_s", "alt_pnt_bound_m"] },
        ScenarioMeta { name: "space-weather", description: "Space-weather environment model: solar (F10.7/F10.7a) and geomagnetic (Kp, with the definitional Kp↔ap table) activity indices, the Jacchia-1971 exospheric temperature they drive (validated vs published solar-min/mean/max), and the activity-corrected vs static thermospheric neutral density at a set of altitudes — the solar-cycle density dependence the static USSA76 atmosphere omits. MODELLED: the density correction is a calibrated first-order scale-height coupling, NOT a data-validated (NRLMSISE) atmosphere.", required_fields: &[], optional_fields: &["f107", "f107a", "kp", "altitudes_km"] },
        ScenarioMeta { name: "oem-interop", description: "CCSDS OEM interoperability bridge: import an Orbit Ephemeris Message produced by an external flight-dynamics tool (GMAT/Orekit/STK all emit OEM) and report its segments/objects/frames/epoch-span plus a velocity-consistency check; with no input it round-trips a generated reference orbit and reports the import↔export fidelity. MODELLED structural/physical ingest check, NOT an orbit-accuracy validation of the source.", required_fields: &[], optional_fields: &["oem_text"] },
        ScenarioMeta { name: "launch-window", description: "Two-body launch & ascent geometry: launch azimuth(s) (sin Az = cos i / cos lat), minimum reachable inclination, circular velocity, the Earth-rotation eastward bonus, dogleg plane-change Δv when the target inclination is below the site latitude, and the number of daily launch opportunities. MODELLED spherical-Earth geometry (no rotating-Earth velocity-triangle correction, no ascent/drag-loss model).", required_fields: &[], optional_fields: &["site_lat_deg", "target_inclination_deg", "altitude_km"] },
        ScenarioMeta { name: "reentry", description: "Allen-Eggers ballistic re-entry corridor: peak deceleration (ballistic-coefficient-independent, V_e^2 sin|γ|/(2eH)), the velocity and altitude at peak-g, and the peak-heating velocity, for an entry velocity/flight-path-angle/ballistic-coefficient through an exponential atmosphere. MODELLED ballistic (no-lift) analytic entry; heating output is the peak-heating VELOCITY, not a heat-flux (no aerothermal/TPS model).", required_fields: &[], optional_fields: &["entry_velocity_m_s", "flight_path_angle_deg", "ballistic_coeff_kg_m2", "scale_height_m", "rho0_kg_m3"] },
        ScenarioMeta { name: "eo-coverage", description: "Earth-observation payload footprint & coverage geometry (SMAD space triangle): Earth angular radius, swath width, nadir ground sample distance, maximum off-nadir access, circular period and equatorial ground-track spacing with a contiguous-coverage flag, for an orbit altitude + sensor FOV/IFOV. MODELLED spherical-Earth geometry (no radiometry/MTF/atmosphere/jitter/glint; nodal R_e·ω·T spacing, no J2 regression).", required_fields: &[], optional_fields: &["altitude_km", "half_fov_deg", "ifov_microrad", "max_off_nadir_deg"] },
        ScenarioMeta { name: "space-packet", description: "CCSDS 133.0-B Space Packet Protocol framing: encode a synthetic TM/TC packet stream (6-octet primary header + data field) and report the per-packet header decode, total octets and an exact encode↔decode round trip. Deterministic exact bit-layout framing — the agency packet-format interop layer; NOT a conformance certification (no secondary-header/CRC/segmentation logic beyond the flags).", required_fields: &[], optional_fields: &["apid", "telecommand", "packet_count", "data_len"] },
        ScenarioMeta { name: "attitude-budget", description: "3-DOF attitude & pointing error budget: the worst-case gravity-gradient disturbance torque ((3/2)(μ/R³)ΔI) and a root-sum-square pointing-error budget over named 1σ contributors (sensor noise, reaction-wheel jitter, thermal, alignment) with the dominant term, for an orbit altitude + body inertia spread. MODELLED scalar AOCS budget — a pre-hardware complement to Basilisk/42, not a control-loop/6-DoF/flexible-mode simulation.", required_fields: &[], optional_fields: &["altitude_km", "i_max_kg_m2", "i_min_kg_m2", "contributors"] },
        ScenarioMeta { name: "passes", description: "Ground-station pass prediction: the time-domain visibility passes (AOS/TCA/LOS, maximum elevation, duration) of a circular orbit over a station above an elevation mask across a window, with interpolated rise/set crossings and total access time. MODELLED Keplerian propagation + Earth rotation (no SGP4 drag/J2 regression), TCA at the sample-step resolution, no light-time/refraction correction.", required_fields: &[], optional_fields: &["altitude_km", "inclination_deg", "raan_deg", "arg_lat_deg", "station_lat_deg", "station_lon_deg", "station_alt_m", "epoch", "mask_deg", "duration_hours", "step_s"] },
        ScenarioMeta { name: "link-budget", description: "One-way link budget over the CCSDS 401 / DSN 810-005 link equation: free-space path loss, C/N₀, Eb/N₀, margin and closure for a transmit EIRP, receive G/T, range, data rate and band (s|x|ka) against a required Eb/N₀. A deterministic engineering calculation from the supplied inputs (not a calibrated terminal datasheet).", required_fields: &[], optional_fields: &["band", "eirp_dbw", "g_over_t_db", "range_km", "data_rate_bps", "other_losses_db", "required_eb_n0_db", "tsys_k"] },
        ScenarioMeta { name: "lunar-time-budget", description: "MODELLED end-to-end Coordinated Lunar Time (LTC) time-error budget: the seven LTC error terms assembled as time-error curves x_i(τ) over a whole averaging-time grid, root-summed into x_Σ(τ), and the clock-vs-frame CROSSOVER τ at which the growing clock term overtakes the constant real-time frame-realisation term (below it the budget is frame-limited, above it clock-limited) — the honest answer to the single-τ artifact. The τ-slopes are closed-form and analytically checkable (clock τ^{+1/2}/τ^{+1}, floors τ^0, measurement τ^{-1/2}) and the clock rows reproduce the published one-day clock specs (crate::clock_specs); the RF/optical-link, frame-realisation, relativistic-residual and ephemeris floor MAGNITUDES are Modelled budget allocations (documented defaults, caller-overridable), not measurements. The contribution is the reproducible crossover τ, not a certified per-term number; not certified for operational timekeeping.", required_fields: &[], optional_fields: &["clock", "tau_min_s", "tau_max_s", "points_per_decade", "clocks"] },
        ScenarioMeta { name: "hybrid-optical-rf", description: "MODELLED heterogeneous optical + RF PNT joint figure of merit (P5): composes the 1550 nm two-way optical link budget (photon-limited two-way ranging CRLB σ_τ/√N and diffraction footprint λ/D·range), a cross-modality solution-separation RAIM protection level (position AND timing) that fuses the loose RF and tight optical solutions with disparate covariances, the N-station optical clear-sky availability (independent-union 1−Π(1−a_i) and a spatially-correlated variant), an optical↔RF state/covariance handoff with a PROVEN bit-continuous (no-jump) mean and a NEES χ² consistency gate, and a joint P(available AND precision-grade AND integrity-assured) score with correlation handling. VALIDATED closed form: the ranging CRLB, diffraction footprint, χ² protection-level quantile, union combinatorics, handoff mean-continuity + NEES gate, and the joint independent product. MODELLED: the optical loss allocations, RF/optical σ magnitudes, cloud-climatology inputs, correlations, and P_HMI budget. Not a certified availability/integrity product.", required_fields: &[], optional_fields: &["wavelength_nm", "tx_power_w", "tx_aperture_m", "rx_aperture_m", "range_km", "pulse_rms_ps", "integration_s", "atmospheric_loss_db", "pointing_loss_db", "optics_efficiency", "detector_efficiency", "two_way", "rf_pos_sigma_m", "rf_vertical_sigma_m", "rf_clock_sigma_s", "p_fa", "p_md", "alert_limit_h_m", "alert_limit_v_m", "alert_limit_t_s", "grade_pos_m", "grade_time_s", "n_optical_sites", "site_correlation", "fom_correlation", "handoff_inflation", "p_hmi", "fault_ramp_rate_pos_m_s", "fault_ramp_rate_clock_s_s", "process_noise_pos_psd_m2_s", "process_noise_clock_psd_s2_s", "coast_coverage_k", "rf_band", "rf_eirp_dbw", "rf_g_over_t_db", "rf_other_losses_db", "rf_data_rate_bps", "rf_required_eb_n0_db", "rf_chip_rate_hz", "rf_correlator_spacing_chips", "rf_dll_bandwidth_hz", "rf_tracking_threshold_dbhz", "rf_degraded_margin_db"] },
        ScenarioMeta { name: "cislunar-observability", description: "MODELLED planar cislunar constellation observability (P6): tracks a four-spacecraft differential-corrected planar-DRO constellation with inter-satellite ranging and reports how much of a spacecraft's four-state [x,y,ẋ,ẏ] the arc makes observable. Emits (1) the rank-vs-arc-length table for a single range-only link — instantaneously rank-1, growing toward the full four-state as the arc extends (P6 Table 1); (2) the observability-Gramian eigen-spectrum + condition number over the arc; (3) the range-only-vs-range+range-rate instantaneous-rank comparison (the Doppler design lever) plus the range-only-singular / range+rate-defined GDOP reporting; and (4) an independent SRIF cross-validation whose posterior covariance turns finite / well-conditioned exactly at the arc where the observable rank reaches four. VALIDATED core: the observable rank is a rank-revealing singular-value threshold cross-checked against the Gramian eigen-rank; the eigen-spectrum obeys the spectral invariants (trace=Σλ, det=Πλ, Frobenius²=Σλ²); the variational STM is the finite-difference-validated CR3BP STM; the range/range-rate Jacobian rows are finite-difference-validated analytic partials (cross-checked against the crate's 3-D range-rate observable); the four initial conditions are differential-corrected planar DROs that close to a tight periodicity residual and are retrograde; the rank transition is cross-validated against the crate's square-root information filter (posterior covariance finite exactly at full rank, cond(P)=cond(OᵀO)); a rank-deficient snapshot is flagged GDOP-undefined (fim condition=inf), never a bogus finite value — the same singular-geometry guard pvt::solve_spp applies. MODELLED: the constellation design (DRO perilune amplitudes and phases) and the specific rank progression it produces. Not a certified navigation-performance product.", required_fields: &[], optional_fields: &["mu", "arc_hours", "epochs", "steps", "rel_tol", "spatial", "sigma_range_m", "family", "n_spacecraft", "sigma_pos_threshold_km"] },
        ScenarioMeta { name: "conflict-resilience", description: "MODELLED layered-PNT conflict resilience (P7): a contested-environment user fields several PNT layers (open-service GNSS, wideband GNSS, an authenticated constellation, an augmentation relay), each with a base availability, a 1σ accuracy and a per-vector denial vulnerability to the shared jamming/spoofing threat. An intensity-swept SEEDED Monte-Carlo denies each layer with probability clamp(vulnerability·intensity·vector_weight,0,1), fuses the survivors by the closed-form inverse-variance rule σ_fused=(Σ 1/σ_i²)^(−1/2), and reports the total-loss probability (all layers denied), the median fused error and per-layer usable/denial statistics vs intensity. The headline resilience ratio (single-layer vs layered total-loss probability) lands at ~7x under the INDEPENDENCE assumption; a one-factor Gaussian-copula correlated-denial sweep then shows that ~7x collapse toward 1 as denial correlation rises (correlation defeats layering). A prior-sensitivity block ranges the headline over the SOURCED vulnerability priors via the mcda tornado + a Dirichlet threat-effort re-allocation + percentile CIs. VALIDATED core: the Monte-Carlo total-loss converges to the closed-form independent product Π_i p_deny_i (within MC standard error at a fixed seed and large N); the inverse-variance fuse is a closed-form identity; at ρ=0 the copula reduces to the independent model and every ρ preserves each layer's marginal denial rate. MODELLED: the per-layer vulnerability/availability/accuracy magnitudes are sourced-but-Modelled inputs (JammerTest 2024, TEXBAT, EASA SIB, RTCA DO-229, LunaNet/IOAG — see conflict_threat_params), and the specific ~7x magnitude and the ratio-vs-correlation curve shape follow from that parameterisation. A §4.2 per-vector survival breakdown then resolves the shared RF threat into the four named vectors (jamming/spoofing/kinetic/cyber) and reports each vector's usable-PNT graceful-degradation curve S_v(x)=1-Prod_i(1-a_i(1-clamp(susceptibility_i,v·x,0,1))) — VALIDATED: the seeded per-layer Monte-Carlo converges to that closed form; jamming is the sharpest vector for the correlated-RF baseline and the RF-immune inertial layer is the decisive survivor. Not a certified navigation-availability product.", required_fields: &[], optional_fields: &["layers", "intensity", "correlation", "trials", "seed", "primary_layer"] },
        ScenarioMeta { name: "lunar-attack-surface", description: "Lunar surface-navigation signal-security attack surface (P1): composes the open signal-security analyses into one binary-reachable run. Reports (1) the AFS received power and its power SURPLUS versus a terrestrial GPS reference, plus the 12-18 dB sensitivity band as a genuine multi-axis sweep over the link inputs (reference level x EIRP x slant range) with the 25x-rounded / 28x-unrounded linear-factor reconciliation. REVISED (rule R4): this reported a 15.6 dB power DEFICIT and a 32x/36x factor until the GPS reference was corrected from -125 / -128.5 (which are the dBm figures) to -155 / -158.5 dBW, the ICD-GPS-200 values the jamming module has always carried. The sign inverts: the modelled lunar AFS signal is 14.4 dB STRONGER than terrestrial GPS L1 C/A, not weaker. The received power itself did not move by a bit, and the linear factor is the old one over exactly 1000, which is exactly the 30 dB dBm-to-dBW offset; (2) the required attacker transmit power to spoof (J/S = 3 dB) and to deny (J/S = 30 dB) at each standoff, the inverse of the J/S link; (3) the orbital capture footprint under a real uniform-aperture antenna pattern (Airy [2 J1(x)/x]^2), an altitude-limited sub-hemispheric cap whose limb is NOT captured; (4) a computed tracking-loop spoof-capture pull-in outcome (does a matched-code spoofer at a given power advantage and code offset actually drag the DLL/PLL) rather than the asserted 3 dB threshold; (5) the airless-body geometric horizon reach of a raised surface transmitter; and (6) the OSNMA/TESLA authentication budget (20 bit/s overhead = ~40 % of a 50 bit/s AFS nav message, key-disclosure latency, 2^-40 forgery). An empty body reproduces the P1 baseline; every input is defaulted and overridable. VALIDATED sub-results carry their source module's oracle (closed-form dB radiometry; inverse-J/S round trip; Airy pattern vs A&S Bessel and spherical-cap geometry; DLL/PLL pull-in vs Kaplan & Hegarty; spherical-tangent horizon identity vs eo_payload; OSNMA SIS-ICD field sizing). MODELLED: the representative geometry/power magnitudes and the specific capture-map cell values. Not a certified security product.", required_fields: &[], optional_fields: &["afs_eirp_dbw", "user_gain_dbi", "slant_range_m", "slant_range_max_m", "carrier_hz", "gps_reference_dbw", "gps_reference_min_dbw", "afs_isotropic_signal_dbw", "transmitter_altitude_m", "transmitter_power_dbw", "antenna_diameter_m", "footprint_grid", "spoof_power_advantage_db", "spoof_code_offset_chips", "attacker_gain_dbi", "spoof_capture_js_db", "jam_denial_js_db", "standoffs_m", "mast_height_m", "user_antenna_height_m", "footprint_altitude_min_m", "footprint_altitude_max_m", "footprint_altitude_steps", "footprint_altitude_scale", "footprint_diameter_min_m", "footprint_diameter_max_m", "footprint_diameter_steps", "footprint_diameter_scale"] },
        ScenarioMeta { name: "realtime-frame-eop", description: "Real-time lunar frame / Earth-orientation prediction budget: P4 Table 1 (the frame-error consistency check — post-processed ~0.27 m ↔ ~0.010 ms and real-time ~15 m ↔ ~0.5 ms, each frame position expressed as its equivalent UT1 error via the L19 lever arm Δr = D_EM·ω⊕·ΔUT1) and Table 2 (measured UT1 prediction error vs horizon — the L18 curve read directly off the real IERS finals2000A series: the Bulletin A − Bulletin B final floor and the multi-day persistence-predictor error, each mapped to a Moon-frame position by L19), plus the L21 root-sum-square real-time frame-error budget (EOP + ephemeris + realisation floor). VALIDATED closed form (the L19 lever arm, ω⊕ cross-checked against the CIO Earth-rotation angle) and VALIDATED real data (the L18 curve off the real finals2000A rows); MODELLED are the lunar-relay OD covariance magnitudes and frame-realisation floor (representative allocations) and the persistence predictor (not IERS's operational Bulletin A algorithm). Not a certified real-time frame product.", required_fields: &[], optional_fields: &["epoch", "horizons_days", "ephemeris_pos_sigma_m", "ephemeris_vel_sigma_mps", "latency_s", "frame_realization_floor_m", "delta_ut1_ms", "delta_xp_mas", "delta_yp_mas", "eop_finals2000a", "eop_finals2000a_later", "frame_realization_tie_noise_m", "operational_window_days", "operational_min_cycle_fraction", "operational_anchor_residual"] },
        ScenarioMeta { name: "aperture-duty-cycle", description: "Aperture duty cycle: the navigation-versus-communications time-share a contact plan implies for a pool of steerable apertures. Takes a contact plan (a list of `[[contacts]]` aos_s/los_s windows, each asking for navigation or communications \u{2014} the same aos_s/los_s vocabulary the `passes` predictor emits), an aperture count, and an ARBITRATION POLICY (navigation-priority by default, or communications-priority, or non-preemptive first-come-first-served), and reports the navigation duty, the communications duty, the idle duty, and the per-session outage \u{2014} the contact time a session requested and no aperture served. An exact interval sweep over the window boundaries, so touching windows never contend and no aperture-second is double-counted; navigation, communications and idle aperture-seconds are accumulated independently and close against apertures*horizon_s. The report states the resolved policy, its full definition, and the duty and outage definitions, because a duty figure quoted without its arbitration policy is not reproducible. MODELLED scheduling arithmetic: no slew / retune / changeover time is charged when an aperture changes service or session, no data volume, buffer state, energy budget or link closure enters the decision, and the contact windows are inputs \u{2014} their geometry is whatever produced them. Not a ground-segment scheduling product.", required_fields: &[], optional_fields: &["apertures", "arbitration", "horizon_start_s", "horizon_end_s", "contacts"] },
        ScenarioMeta { name: "lunar-jamming", description: "Lunar-native RF jamming: per-satellite jammer-to-signal ratio, effective C/N₀ and loss of lock for a selenographic surface user under a lunar surface (or raised) jammer, over the illustrative public-source Moonlight/LCNS-class lunar-orbit constellation. Composes the existing open jamming physics (jamming::j_over_s_db, effective_cn0_dbhz, rx_antenna_gain_db, lock_status, q_factor) with the existing lunar sky geometry (lunar_service::LunarConstellation + topocentric, lunar::selenographic_to_mcmf); no geometry or radiometry is re-derived. Unlike the Earth `jamming` kind, the signal leg is NOT a fixed received power: each satellite's isotropic received power is its own link budget EIRP − FSPL(slant range), so the J/S varies satellite by satellite with lunar range and elevation. Reports ONE ROW PER VISIBLE (epoch, satellite) LINK — azimuth, elevation, slant range, both received powers the J/S is the difference of, the J/S, the nominal and effective C/N₀ and the lock status — plus aggregate figures of merit beside (never in place of) that table, and the same table as a CSV artifact. Every emitted numeric field carries a unit and a provenance class. VALIDATED sub-results carry their source module oracle (the anti-jam equation and J/S link of Kaplan & Hegarty §9.4, externally referenced in tests/gnss_denied_jamming_resilience_reference.rs; the lunar geometry of lunar_service). The composition itself is cross-checked against an independent two-link-budget path (linkbudget::received_signal_power_dbw, a different free-space-loss expression) to 1e-9 dB. MODELLED: the illustrative constellation, the representative EIRP / jammer power / antenna gains / noise temperature, and the absence of terrain shadowing, multipath, AGC dynamics and adaptive nulling. Not a certified denial-of-service product. With a jammer configured the report also carries a DENIAL CONTOUR WITH AN UNCERTAINTY BAND rather than a contour read off one scalar: the full measured wanted-signal C/N₀ distribution over the per-satellite table (n, min, p05, p25, median, p75, p95, max, mean, sample stdev, and the sample's own asymmetry), and the contour evaluated at each of those order statistics under BOTH denial criteria the engine recognises — the incumbent power-ratio one (J/S = 30 dB, as in attack-surface and tracking-loop) and the loss-of-lock one (effective C/N₀ falling to tracking_threshold_dbhz, the criterion this report's own status column uses) — on both axes of the denial plane (required jammer EIRP at the scenario standoff, denial standoff at the scenario EIRP). The band edges ARE contour(p05) and contour(p95), the same closed-form map applied to the sample's own quantiles: not a sigma fitted to the sample and not median ± k·stdev, with stdev emitted for continuity and used by nothing. A quantile already at or below the tracking threshold has no finite denying J/S and its loss-of-lock columns are null with a counted reason, never a clamped radius.", required_fields: &[], optional_fields: &["n_sats", "sma_km", "eccentricity", "inc_deg", "argp_deg", "site_lat_deg", "site_lon_deg", "site_alt_m", "horizon_hours", "step_min", "elev_mask_deg", "sat_eirp_dbw", "carrier_hz", "chip_rate_hz", "user_boresight_gain_dbi", "temp_k", "tracking_threshold_dbhz", "degraded_margin_db", "jammer"] },
        ScenarioMeta { name: "ins-trn-coast", description: "INS/TRN coasting error model: position error against coast duration, built from IMU coefficients rather than swept as an assumed drift rate. Five growth contributions, each with its own power of time — accelerometer bias (t²), gyro-bias tilt through gravity (t³), velocity random walk (t^1.5), angle random walk (t^2.5) and scale factor against travelled distance (t¹ cruising, t² under sustained specific force) — combined under a STATED rule (root-sum-square by default, or linear-sum, or deterministic-sum with stochastic-rss; all three are computed on every run so the choice is visible rather than buried). The coast durations reaching caller-supplied position thresholds (10 m and 50 m by default) are located by the engine's existing bisection, each with a per-contribution breakdown naming the dominant source, and each single contribution's crossing is additionally inverted algebraically so the two agree. A terrain-relative-navigation mode bounds the coast with periodic position fixes and reports the largest fix interval that holds each threshold; a position-only fix leaves velocity error and tilt alive across the fix, so it does not always bound the coast at any fix rate, and the report says so rather than returning a zero. MODELLED: the IMU class coefficients are representative band figures, not a datasheet, and the terrain-fix residual is an input. An unreached threshold is reported as null with a status, never as a zero. Not a certified inertial-navigation performance product.", required_fields: &[], optional_fields: &["imu_grade", "accel_bias_ug", "accel_vrw_m_s_per_sqrt_hr", "accel_scale_factor_ppm", "gyro_bias_deg_per_hr", "gyro_arw_deg_per_sqrt_hr", "speed_m_s", "ref_accel_m_s2", "combination", "crossing_thresholds_m", "grades", "drift_band_lo_m_per_s", "drift_band_hi_m_per_s", "trn_fix_mode", "trn_fix_interval_s", "trn_fix_residual_m", "mission_duration_s"] },
        ScenarioMeta { name: "lunar-vlbi-fim", description: "Lunar-VLBI station-coordinate covariance: the delay partials of the lunar-vlbi observable accumulated over an explicit SCHEDULE (baselines x epochs) into a Fisher information matrix, inverted, and reported as the station coordinate covariance and the per-coordinate station sigma — a computed engine output rather than a scalar delay precision pushed through an assumed isotropic g = 3 equipartition factor. The state carries Earth-FIXED (ITRS) station coordinates, so the Jacobian is the inertial partial rotated by each epoch's GCRS->ITRS matrix: Earth rotation is what makes those coordinates observable, and the report MEASURES the Earth-fixed line-of-sight sweep and the beacon declination rather than assuming them. One observation is one (baseline, epoch) pair with BOTH stations above the elevation mask, weighted 1/delay_sigma_s^2. Reports rank, datum defect, condition number, the full information spectrum, the covariance matrix, per-station per-axis and 3-D sigmas, and the free-network null space on every run; under a rank deficiency the headline sigma is published as NULL with a status, never read out of a near-singular inverse. The equipartition value c*delay_sigma_s*sqrt(g/N) for the SAME schedule is emitted beside the computed value with the ratio, together with the isotropic trace bound sqrt(p/trace(M)) that AM-HM makes a hard floor — so the ratio is the anisotropy the assumption discarded. The delay closure tau_ik = tau_ij + tau_jk makes only n-1 of the n(n-1)/2 baselines geometrically independent; the report states both counts. MODELLED: the Moon-centre ephemeris, station clocks, troposphere and Earth-orientation parameters are held FIXED and observations are treated as independent, so the covariance is a Cramer-Rao bound for a reduced parameter set, not a predicted session result; the delay sigma, station coordinates and schedule are inputs. The partial the geometric-delay Jacobian leaves out (the differenced Shapiro term) is measured by finite difference and emitted. Not a geodetic product.", required_fields: &[], optional_fields: &["stations", "beacon_lat_deg", "beacon_lon_deg", "beacon_alt_m", "epoch_year", "epoch_month", "epoch_day", "arc_hours", "step_min", "delay_sigma_s", "elevation_mask_deg", "datum", "estimate_beacon", "rel_tol", "equipartition_g"] },
        ScenarioMeta { name: "tracking-loop", description: "Tracking-loop loss of lock: C/N0 -> lock/unlock WITH HYSTERESIS, the time it takes to lose lock, and spoof pull-in as a function of code and carrier offset RATE. The engine's existing denial and capture criteria are ratios on received power (a jammer denies at J/S = 30 dB, a spoofer captures at 3 dB); real loss of lock is not a power ratio, it is where a loop's jitter plus dynamic stress leaves its tracking-threshold budget. Reports (1) carrier (Costas) and code (non-coherent early/late) 1-sigma thermal jitter versus C/N0, squaring loss included, against the stated rules 3*sigma_PLL + theta_e <= 45 deg (the 15-degree rule in three-sigma form) and 3*sigma_DLL + ramp lag <= d/2 chips; (2) the drop and re-lock C/N0 thresholds with the binding loop named, the re-lock threshold DERIVED from the wider bandwidth a receiver re-pulls-in at rather than asserted, so the hysteresis width must fall between 5*log10(ratio) and 10*log10(ratio) dB; (3) the declared time to lose lock from a two-threshold lock detector with confirmation dwells driven over a C/N0 ramp, reported separately from the physical phase-escape time (the Viterbi mean time between cycle slips, in log10 s because it spans hundreds of decades); (4) spoof pull-in limits — the largest code slew and carrier Doppler rate a victim's loops can follow, with a map over both axes, because a spoofer that slews faster than these does not capture the loop, it outruns it; and (5) the DENIAL RADIUS the loop dynamics imply reported ALONGSIDE the existing power-ratio radius, never in place of it, with their signed difference as its own named field (denial_radius_delta_km) and a definition beside it. Every emitted numeric field carries a unit and a provenance class. VALIDATED closed forms: the carrier and code jitter expressions, the loop-filter reduction sqrt(2*B_n*T) and the first-order ramp lag are cross-checked against the engine's own sdr correlator stepped forward on seeded synthetic IF — a different route to the same numbers — to 0.6 %, 3.7 % and 0.17 % respectively, and the modified Bessel I0 behind the cycle-slip time against standard tabulated values to 1e-7. The lower validity limit is asserted, not merely stated: below ~32 dB-Hz at 1 ms the real atan discriminator saturates against its +-pi/2 range and measures less jitter than any linear theory. MODELLED: the loop bandwidths, integration time, correlator spacing, pull-in bandwidth ratio, confirmation dwells, jammer power and antenna gains are representative band figures, not a datasheet. NOT modelled: oscillator (Allan-deviation) and vibration jitter, front-end bandwidth limiting, multipath, AGC dynamics, data-bit-transition loss, external aiding, and any half-cycle correction to the Costas cycle-slip formula. Under loop dynamics spoof capture has no radius at all — the binding constraint is offset rate, not power — so that field is null with a reason rather than a fabricated number. Not a certified receiver-performance product.", required_fields: &[], optional_fields: &["pll_bandwidth_hz", "dll_bandwidth_hz", "predetection_integration_s", "correlator_spacing_chips", "carrier_allowance_deg", "code_allowance_chips", "pullin_bandwidth_ratio", "drop_confirm_epochs", "relock_confirm_epochs", "doppler_rate_hz_per_s", "code_slew_chips_per_s", "cn0_high_dbhz", "cn0_low_dbhz", "ramp_duration_s", "jitter_table_cn0_dbhz", "jammer_power_dbw", "jammer_gain_dbi", "rx_gain_toward_jammer_db", "rx_gain_toward_sat_db", "signal_power_dbw", "temp_k", "freq_hz", "chip_rate_hz", "jammer_type", "q_override", "denial_js_threshold_db", "capture_js_threshold_db", "spoof_code_slew_chips_per_s", "spoof_doppler_rate_hz_per_s"] },
        ScenarioMeta { name: "araim-reference-check", description: "Published ARAIM certification reference vectors: the engine's ARAIM horizontal and vertical protection levels run against the WG-C ARAIM Technical Subgroup's OWN worked numerical examples, at the tolerance (TOL_PL = 5e-2 m) those documents themselves state. Two vectors are committed as fixtures, each carrying its retrieval URL, retrieval date, source-file SHA-256 and page: the Reference Airborne Algorithm Description Document v3.1 (2019) Appendix D — self-consistent, and the acceptance vector — and the Milestone 3 Report (2016) Annex A section A.IX, the statement the research bibliographies cite. Every published input (the 10-satellite 2-constellation geometry matrix, the C_int and C_acc variance diagonals, b_nom, P_sat, P_const and the LPV-200 constant set) and every published output (VPL, HPL, EMT, sigma_v_acc, K_fa_3 and the two constellation-fault modes' sigma_3, sigma_ss_3 and b_3) is reported beside the engine's own number and their absolute difference. The protection-level equation is NOT re-solved here: the reference's mode list is handed to the engine's existing raim::araim_protection_level / araim_integrity_risk, so the bisection and the Gaussian-tail algebra under test are the engine's own; only the geometry, the sub-solutions, the detection thresholds and the published budget split are built for it. EXTERNALLY CHECKED against the 2019 vector: VPL 18.2926 m vs 18.3 m published, HPL 13.4063 m vs 13.45 m, EMT 7.2997 m vs 7.2998 m, sigma_v_acc 1.3694 m vs 1.3694 m, and all six published intermediates to within half a unit in their last printed decimal. The 2016 vector carries two internal defects the report states rather than hides — a sign typo in row 3 of G, and a K_fa_3 evaluated at 57 fault modes while the document states N_fault_max = 1 (12 modes) — so its geometry intermediates reproduce exactly while its protection levels are reported as measured discrepancies and excluded from the acceptance figure; the tolerance is never widened to absorb them. Every emitted numeric field carries a unit and a provenance class, and a transcribed figure is labelled `published` so it can never be mistaken for a computed one. SCOPE: only N_fault_max = 1 (single-satellite and single-constellation fault modes) is implemented, and a case whose priors require simultaneous multi-event fault subsets is REFUSED rather than silently truncated; fault detection, exclusion, the chi-square consistency check and the double-counting re-allocation step of the reference algorithm are out of scope. This reproduces a published reference algorithm's worked example — it is not a certification, an airworthiness artefact or an approval.", required_fields: &[], optional_fields: &["vector"] },
        ScenarioMeta { name: "lunar-frame-campaign", description: "Seven-parameter Helmert (similarity) frame datum driven by a SIMULATED OBSERVING CAMPAIGN rather than by an injected transform. A network of Earth stations observes a catalogue of lunar-surface beacons over an explicit schedule; the lunar-VLBI delay partials are accumulated over that schedule into a beacon-coordinate Fisher information matrix exactly as lunar-vlbi-fim does; and that information is propagated through the Helmert design A = [I3 | [p]_x | p] at the catalogue points into the datum covariance H = A^T M_b A, diagnosed by crate::fim::crlb. NO transform is injected and nothing is recovered from a planted answer, so the reported datum accuracy derives from the observing programme: halving the delay sigma halves it exactly, and lengthening the arc improves it because the libration the report MEASURES (sub_earth_direction_sweep_deg) is what separates the line-of-sight beacon coordinate from the plane-of-sky ones. Rank, datum defect, condition number, the full spectrum, the unobservable directions IN THE SEVEN-PARAMETER BASIS, the weakest direction even at full rank and each parameter's share of it are emitted on every run; a parameter the campaign does not constrain is published as NULL with a status, never read out of a near-singular inverse. Beacon-error correlation is measured, not assumed: with the stations held fixed no observation touches two beacons so the information matrix is exactly block-diagonal (offblock_fraction 0), and with the stations estimated the Schur-marginalised block is coupled, with the induced correlation printed and the whole propagation re-run with it discarded so the price of an independence assumption is a number. The same propagation under an isotropic per-coordinate sigma, and the recovery error the lunar-frame-realisation scenario reports, are both run here and printed beside the campaign value with their ratios. MODELLED: the beacon catalogue is sourced but the CAMPAIGN is simulated — the station network and the delay sigma are illustrative inputs, individual delay observations are treated as independent, and the Moon-centre ephemeris, station clocks, troposphere and Earth-orientation parameters are held FIXED, so the datum covariance is a Cramer-Rao bound for a reduced parameter set. Not a geodetic product.", required_fields: &[], optional_fields: &["stations", "beacons", "epoch_year", "epoch_month", "epoch_day", "arc_hours", "step_min", "delay_sigma_s", "elevation_mask_deg", "earth_elevation_mask_deg", "station_datum", "rel_tol", "assumed_coordinate_sigma_m"] },
        ScenarioMeta { name: "lunar-llr-datum", description: "Seven-parameter Helmert lunar frame datum driven by a REAL, ARCHIVED observing campaign rather than a simulated one. Where lunar-frame-campaign removed the injected transform but still stated its station network, its schedule and its per-observation sigma as ILLUSTRATIVE inputs, this kind takes all three from measurement: the epochs are the ground-transmit times of archived ILRS Consolidated Laser Ranging Data normal points, the observations are the laser ranges really fired at the five retroreflector arrays on the Moon, and every observation weight is that normal point's own archived precision bin_rms/sqrt(n_raw) read out of the file. Station coordinates come from the IERS ITRF2020 SLR solution (propagated to epoch by their published velocities) and the reflector coordinates from JPL DE430 Table 7 in the mean-Earth/mean-rotation frame the IAU 2015 WGCCRE model realises. Range partials accumulate into the joint reflector-coordinate Fisher information matrix and propagate through the same Helmert design into the datum covariance, diagnosed by crate::fim::crlb. Rank, defect, condition, spectrum, unobservable directions in the seven-parameter basis, the weakest direction at full rank and each parameter's share of it are emitted on every run, and an unconstrained parameter is published as NULL with a status. Inter-array correlation is MEASURED at exactly zero rather than assumed, because a laser range touches one array. A record the catalogues cannot place — a station with no published ITRF position — is SKIPPED AND COUNTED, never given a substituted coordinate. WHICH LINKS ARE MEASURED AND WHICH ARE MODELLED IS THE REPORT, NOT A FOOTNOTE: the Moon-centre ephemeris and the IAU body orientation remain modelled and their combined size is emitted as the observed-minus-computed one-way range residual over every point used; troposphere, solid-body tides, station eccentricity, polar motion, UT1-UTC, relativistic delay and station clocks are absent and inside that residual. Because an ephemeris error reaches a covariance only through the direction of each line of sight, every run also re-solves the whole datum with all partials tilted by sensitivity_tilt_deg (sign alternating) and emits the ratio, so the covariance's insensitivity to the modelled ephemeris is a number rather than an argument. The simulated campaign's own figures are RUN and printed beside the measured ones, not transcribed. MODELLED: the seven-parameter figures are a Cramer-Rao bound for a reduced parameter set on a real schedule — not a solved datum, not an LLR analysis and not a geodetic product. The committed real-data slice ships with the repository but not with the published crate; point data_dir at a copy of it.", required_fields: &[], optional_fields: &["data_dir", "normal_points_dir", "reflectors_path", "stations_path", "dut1_s", "rel_tol", "compare_simulated_campaign", "sensitivity_tilt_deg"] },
        ScenarioMeta { name: "lunar-beacon", description: "Surface-beacon augmentation of a lunar orbital navigation service, as a runnable before/after table. A south-polar user sees a sparse orbital set in a narrow patch of sky, so the ranging geometry is ill-conditioned; a few SURVEYED SURFACE BEACONS supply the low-elevation, wide-azimuth line-of-sight rows an all-overhead set lacks, and the horizontal dilution of precision collapses. The scenario reports three configurations at one epoch — satellites alone, satellites plus the visible beacons, and a larger constellation as the alternative route to the same geometry — each with its visible-source counts, its full DOP, and the realised 1-sigma accuracy in METRES obtained by multiplying through a per-beacon user-equivalent ranging error assembled as the root-sum-square of clock-synchronisation, multipath and survey terms. Beacon visibility is the airless-Moon two-height geometric horizon (no atmosphere, so the bound is exact), and the DOP assembly is the same kernel cross-checked against gnss_lib_py in tests/dop_reference.rs. WHY THIS KIND EXISTS: the module behind it has been in the engine and checked against an independent DOP path since L08/L09, but it was not reachable from a run — no kind, no dispatch arm, no bundled file. The README advertised the capability and the verification matrix carried NO row for it at all, so it was simultaneously claimed in prose and unclaimed in the ledger, while being unreachable in the engine. The defaults are the geometry that already carries a committed golden (a user at -80 deg with a 2 m antenna, three beacons at -80/0, -79/+60 and -79/-60 at 2 km, a six-satellite illustrative LCNS snapshot at t=0, a 5 deg mask), so a bare run reproduces a table an oracle already covers rather than inventing fresh numbers. MODELLED: the constellation design, the beacon placement and every error-budget magnitude are illustrative inputs, not a fielded survey or a measured link; only the DOP arithmetic, the horizon closed form and the sigma = DOP x sigma_URE relation are externally anchored. Not a service-performance commitment.", required_fields: &[], optional_fields: &["user", "beacons", "n_satellites", "comparison_n_satellites", "epoch_s", "elevation_mask_deg", "clock_sync_m", "multipath_m", "survey_m"] },
        ScenarioMeta { name: "earth-gnss-lunar", description: "Earth-GNSS reception at lunar distance, the weak-signal layer the conflict-resilience paper names and the engine had no model for. A GNSS satellite points its antenna at the Earth; a receiver near the Moon sits about fifteen times the orbital radius away, so three things bite at once. The Earth OCCULTS THE BORESIGHT: from 26,560 km it subtends a 13.9 deg half-angle, so any lunar-bound ray must leave the transmitter at least that far off nadir, which removes the peak of the beam before any power is computed. What remains is the MAIN-LOBE EDGE AND THE SIDELOBES, the regime the LuGRE payload actually operated in during 2025. And the free-space loss is about 208 dB at L1, roughly 25 dB more than a terrestrial user pays. The report emits one row per satellite (off-boresight angle, Earth occultation, range, path loss, transmit gain at that angle, received power, carrier-to-noise density) and aggregates only the links clearing the tracking threshold. IT ALSO REPORTS THE CONDITIONING, because that is what defines this layer: every visible satellite lies inside a cone a couple of degrees wide as seen from the Moon, so the lines of sight are nearly parallel, the dilution of precision is enormous, and an Earth-GNSS fix at lunar distance is a TIMING-grade observation far more than a position-grade one. MODELLED, and the transmit pattern is the reason: the gain at angle is a uniform circular aperture (Airy), while a real GPS L1 antenna is a twelve-element helical array with a shaped main lobe and non-Airy sidelobes. Measured patterns exist and are not vendored here, so orderings and orders of magnitude are meaningful while the dB of any single satellite is not. Deliberately ABSENT, each making the budget optimistic: no ionospheric or tropospheric loss on the limb-grazing rays, no polarisation, pointing or implementation loss, and a spherical Earth with no refractive extension. The Moon position is an INPUT (range plus inertial direction) rather than an ephemeris lookup, because the quantity under test is the link and the beam geometry. Upgrading this row to Validated needs a measured transmit pattern and LuGRE normal points; neither is in the repository and neither is invented here.", required_fields: &[], optional_fields: &["altitude_km", "inclination_deg", "planes", "sats_per_plane", "phasing_f", "epoch_s", "receiver_range_m", "receiver_ra_deg", "receiver_dec_deg", "tx_power_dbw", "tx_diameter_m", "tx_efficiency", "freq_hz", "rx_gain_dbi", "system_temp_k", "tracking_threshold_dbhz"] },
        ScenarioMeta { name: "cislunar-arc-recovery", description: "MODELLED independent-estimator test of the cislunar arc-length observability threshold. That threshold is a RANK read on the observability matrix assembled from the ANALYTIC range Jacobian rows and the ANALYTIC variational state-transition matrix, and its square-root-information-filter cross-check folds those same rows — a consistency check between two numerical machines, not corroboration. This kind supplies the missing arbiter: a batch least-squares estimator that actually RECOVERS the chief's initial state from simulated measurements, with the measurement partials taken as CENTRAL FINITE DIFFERENCES of the composed forward model. It calls no analytic Jacobian row, no variational STM, no singular-value or eigen decomposition, no rank tolerance and no square-root information filter — a source-text guard in tests/cislunar_arc_recovery_reference.rs makes that enforceable — while the dynamics (the same RK4 CR3BP flow), the initial conditions (the same differential-corrected constellation), the scalar observable and the epoch grid are shared deliberately and named in the emitted `independence` block, because two analyses of one physical problem must agree about the physics to be comparable. Two criteria, each swept over five decades of its own bound: NOISE-FREE RECOVERY (every seeded trial's final state error at most recovery_factor times its a-priori displacement — the rank analogue, with no singular-value tolerance in it) and MONTE-CARLO ESTIMABILITY (the measured RMS position error over a seeded noise ensemble below a stated bound — the estimability analogue, measured rather than predicted). Supports the planar four-state and the spatial six-state, the DRO / L2 halo / L2 NRHO families, range and range-rate observables, and a Moon-centred polar parameterisation in which the transformation is applied to the STATE and the forward model re-differenced there. MEASURED on the published planar DRO grid: the estimator recovers the four-state from 0.782609 h against the rank criterion's 2.086957 h at rel_tol 1e-6 (ratio 0.375) — the rank threshold is NOT corroborated as a recoverability boundary — while the measured estimability boundary lands in the same grid cell as the formal one, 5.739130 h, and the measured error curve reproduces the formal 1-sigma over 21 arc lengths to a geometric-mean ratio of 0.98. MODELLED: the constellation design, the epoch grid, the single tracked link, the displacement magnitude, the measurement sigma and the two stated bounds. Not a certified navigation-performance product.", required_fields: &[], optional_fields: &["mu", "arc_hours", "epochs", "steps", "spatial", "family", "n_spacecraft", "observable", "coordinates", "trials", "seed", "displacement_nd", "recovery_factor", "sigma_range_m", "sigma_range_rate_mm_s", "error_bound_km", "max_iterations", "rel_tol"] },
    ]
}

/// The built-in scenario kinds and their metadata as a JSON array — the form the
/// language bindings expose for programmatic introspection.
pub fn list_scenario_kinds_json() -> String {
    // `ScenarioMeta` holds only `&'static str` and `&[&'static str]` fields (see
    // `list_scenario_kinds`): no floats, no maps, no fallible custom `Serialize`
    // impls. Serialising a `Vec` of such values to JSON cannot fail, so the error
    // arm is unreachable by construction.
    json_of(&list_scenario_kinds())
        .expect("ScenarioMeta is all-static-string data; JSON serialisation is infallible")
}

/// Render the built-in scenario-kind catalogue as a standalone Markdown reference
/// (`docs/SCENARIOS.md`): every dispatchable kind with its one-line description and
/// its required / optional TOML fields.
///
/// Generated from [`list_scenario_kinds`] — the single source of truth — so the
/// per-kind reference can never drift from the dispatcher.
/// `tests/scenarios_reference_doc_sync.rs` fails the build if the committed copy is
/// stale; regenerate with `cargo run --bin gen_validation_artifacts`.
pub fn scenarios_reference_md() -> String {
    // Escape the one character that would break a Markdown table cell.
    fn cell(s: &str) -> String {
        s.replace('|', "\\|")
    }
    // A field list as inline code, or an explicit "none" so an empty pack is not
    // rendered as a silent blank.
    fn fields(list: &[&str]) -> String {
        if list.is_empty() {
            "*(none)*".to_string()
        } else {
            list.iter()
                .map(|f| format!("`{f}`"))
                .collect::<Vec<_>>()
                .join(", ")
        }
    }

    let kinds = list_scenario_kinds();
    let mut s = String::new();
    s.push_str("# Scenario kinds\n\n");
    s.push_str(&format!(
        "The {} built-in scenario kinds that `kshana::api::run_toml` dispatches over, \
each with its one-line description and its required / optional TOML fields.\n\n\
This file is **generated** from `api::list_scenario_kinds()` — the single source of \
truth — by `cargo run --bin gen_validation_artifacts`; edit the source, not this file. \
Every binding (the Python package, the MCP server's `list_scenario_kinds` tool, and \
the WASM playground) exposes this same catalogue, so what is listed here is exactly \
what every surface can run.\n\n",
        kinds.len()
    ));

    s.push_str("| # | Kind | Description |\n|--:|------|-------------|\n");
    for (i, m) in kinds.iter().enumerate() {
        s.push_str(&format!(
            "| {} | [`{}`](#{}) | {} |\n",
            i + 1,
            m.name,
            m.name,
            cell(m.description)
        ));
    }
    s.push('\n');

    for m in &kinds {
        s.push_str(&format!("## `{}`\n\n{}\n\n", m.name, m.description));
        s.push_str(&format!(
            "- **Required fields:** {}\n",
            fields(m.required_fields)
        ));
        s.push_str(&format!(
            "- **Optional fields:** {}\n\n",
            fields(m.optional_fields)
        ));
    }
    s
}

/// Lint a scenario TOML against the crate's own introspection and return a list of
/// problems — so a caller can be told what is wrong BEFORE a (possibly long) run,
/// instead of hitting a late runtime failure.
///
/// The check reuses the one schema the crate already publishes: it
/// [`ScenarioKind::classify`]es the kind, then looks up that kind's REQUIRED
/// top-level fields from [`list_scenario_kinds`] and reports one violation for each
/// required field that is absent from the document (e.g.
/// `clock: missing required field "time"`). It is deliberately conservative —
/// it only flags what the metadata already marks required and makes NO new validity
/// claims — and it never runs the scenario. An empty Vec means the scenario is
/// well-formed as far as the published metadata can express.
pub fn validate_scenario(src: &str) -> Vec<String> {
    // 1. The document must parse as TOML at all. A parse failure is the clearest,
    //    earliest problem to report, so we return it on its own.
    let value: toml::Value = match toml::from_str(src) {
        Ok(v) => v,
        Err(e) => return vec![format!("TOML parse error: {e}")],
    };

    // 2. Classify the kind via the existing classifier (defaults to Clock for an
    //    absent/unknown kind, exactly as the runner does).
    let kind = match ScenarioKind::classify(src) {
        Ok(k) => k,
        Err(e) => return vec![format!("could not classify scenario kind: {e}")],
    };
    let kind_name = kind.as_str();

    // 3. Look up this kind's published REQUIRED fields and report each one that is
    //    absent from the document's top-level table. If the document is not a table
    //    (e.g. a bare value), every required field is treated as absent.
    let table = value.as_table();
    let required = list_scenario_kinds()
        .into_iter()
        .find(|m| m.name == kind_name)
        .map(|m| m.required_fields)
        .unwrap_or(&[]);

    let mut violations = Vec::new();
    for field in required {
        let present = table.map(|t| t.contains_key(*field)).unwrap_or(false);
        if !present {
            violations.push(format!("{kind_name}: missing required field \"{field}\""));
        }
    }
    violations
}

/// Export an orbit/constellation scenario's propagated constellation as SP3-c text.
/// Errors if the scenario is not an `orbit` kind (only that pack has a constellation
/// to write). This is the CLI `--export-sp3` path.
pub fn export_sp3(src: &str) -> Result<String, String> {
    match ScenarioKind::classify(src).map_err(|e| e.to_string())? {
        ScenarioKind::Orbit => {
            let scn: crate::orbit::OrbitClockScenario =
                toml::from_str(src).map_err(|e| format!("invalid orbit scenario: {e}"))?;
            scn.to_sp3_string()
        }
        k => Err(format!(
            "SP3 export requires an orbit scenario, not '{}'",
            k.as_str()
        )),
    }
}

/// If `src` is an orbit scenario with `export_sp3 = true`, return its SP3-c text;
/// otherwise `None`. Lets the CLI auto-write an SP3 alongside the usual outputs.
pub fn auto_export_sp3(src: &str) -> Result<Option<String>, String> {
    if ScenarioKind::classify(src).map_err(|e| e.to_string())? != ScenarioKind::Orbit {
        return Ok(None);
    }
    let scn: crate::orbit::OrbitClockScenario =
        toml::from_str(src).map_err(|e| format!("invalid orbit scenario: {e}"))?;
    if scn.export_sp3 {
        Ok(Some(scn.to_sp3_string()?))
    } else {
        Ok(None)
    }
}

/// Export an orbit scenario's TLE mean elements as a CCSDS OMM catalogue — one OMM
/// (Orbit Mean-Elements Message) per TLE-defined satellite, in KVN form, carrying
/// the real NORAD catalogue number, COSPAR designator, and epoch from each TLE.
/// Errors if the scenario is not an `orbit` kind, or has no TLE-defined
/// constellation (a synthetic Walker or RINEX scenario has no mean elements to
/// publish). This is the CLI `--export-omm` path, mirroring [`export_sp3`].
pub fn export_omm(src: &str) -> Result<String, String> {
    match ScenarioKind::classify(src).map_err(|e| e.to_string())? {
        ScenarioKind::Orbit => {
            let scn: crate::orbit::OrbitClockScenario =
                toml::from_str(src).map_err(|e| format!("invalid orbit scenario: {e}"))?;
            scn.to_omm_string()
        }
        k => Err(format!(
            "OMM export requires an orbit scenario, not '{}'",
            k.as_str()
        )),
    }
}

/// If `src` is an orbit scenario with `export_omm = true`, return its OMM catalogue
/// text; otherwise `None`. Lets the CLI auto-write an OMM alongside the usual outputs.
pub fn auto_export_omm(src: &str) -> Result<Option<String>, String> {
    if ScenarioKind::classify(src).map_err(|e| e.to_string())? != ScenarioKind::Orbit {
        return Ok(None);
    }
    let scn: crate::orbit::OrbitClockScenario =
        toml::from_str(src).map_err(|e| format!("invalid orbit scenario: {e}"))?;
    if scn.export_omm {
        Ok(Some(scn.to_omm_string()?))
    } else {
        Ok(None)
    }
}

/// Export an orbit scenario's propagated constellation as CCSDS OEM text — the
/// inertial (TEME) state time series, position AND velocity, in the spacecraft-
/// ephemeris interchange format flight-dynamics tools (GMAT/Orekit/STK) read. This
/// is the velocity-carrying complement of the position-only [`export_sp3`]. Errors
/// if the scenario is not an `orbit` kind. This is the CLI `--export-oem` path.
pub fn export_oem(src: &str) -> Result<String, String> {
    match ScenarioKind::classify(src).map_err(|e| e.to_string())? {
        ScenarioKind::Orbit => {
            let scn: crate::orbit::OrbitClockScenario =
                toml::from_str(src).map_err(|e| format!("invalid orbit scenario: {e}"))?;
            scn.to_oem_string()
        }
        k => Err(format!(
            "OEM export requires an orbit scenario, not '{}'",
            k.as_str()
        )),
    }
}

/// If `src` is an orbit scenario with `export_oem = true`, return its OEM text;
/// otherwise `None`. Lets the CLI auto-write an OEM alongside the usual outputs.
pub fn auto_export_oem(src: &str) -> Result<Option<String>, String> {
    if ScenarioKind::classify(src).map_err(|e| e.to_string())? != ScenarioKind::Orbit {
        return Ok(None);
    }
    let scn: crate::orbit::OrbitClockScenario =
        toml::from_str(src).map_err(|e| format!("invalid orbit scenario: {e}"))?;
    if scn.export_oem {
        Ok(Some(scn.to_oem_string()?))
    } else {
        Ok(None)
    }
}

/// Inline a real IERS `finals2000A` body into a scenario's `eop_finals2000a` field
/// (the `--eop <file>` CLI path), returning the merged TOML. Carrying the data in
/// the scenario keeps the run reproducible and filesystem-free downstream; the
/// ephemeris runner then reduces the ground track through the real Earth-orientation
/// series instead of the nominal scalars. The key is inserted at the table root, so
/// `toml` serialises it ahead of any `[section]` headers.
pub fn inject_eop(src: &str, finals2000a_body: &str) -> Result<String, String> {
    let mut value: toml::Value =
        toml::from_str(src).map_err(|e| format!("invalid scenario TOML: {e}"))?;
    let table = value
        .as_table_mut()
        .ok_or_else(|| "scenario TOML is not a table".to_string())?;
    table.insert(
        "eop_finals2000a".to_string(),
        toml::Value::String(finals2000a_body.to_string()),
    );
    toml::to_string(&value).map_err(|e| format!("could not re-serialise scenario: {e}"))
}

/// Splice a study-metadata block into an already-rendered result JSON document,
/// returning the document with a top-level `"meta"` key inserted right after the
/// opening brace. Pure and deterministic — the [`crate::report::StudyMeta`] (incl.
/// its caller-supplied timestamp) is passed in, no clock is read here — and it
/// preserves every existing key and its order, so only the additive `"meta"` block
/// changes. Used by the CLI when `--study-name` is given; meta-less runs never call
/// it and stay byte-identical.
pub fn with_study_meta(json: &str, meta: &crate::report::StudyMeta) -> String {
    // Serialize the meta on its own, then indent it to match the surrounding
    // pretty document and splice it after the opening brace + newline. If the
    // document is not a pretty object starting with "{\n", fall back to returning
    // it unchanged (the engine always emits pretty objects).
    let meta_json = match serde_json::to_string_pretty(meta) {
        Ok(s) => s,
        Err(_) => return json.to_string(),
    };
    let Some(rest) = json.strip_prefix("{\n") else {
        return json.to_string();
    };
    // Re-indent the meta object's lines by two spaces to sit at the same depth as
    // the other top-level fields in the pretty document.
    let indented: String = meta_json
        .lines()
        .map(|l| format!("  {l}"))
        .collect::<Vec<_>>()
        .join("\n");
    format!("{{\n  \"meta\": {},\n{rest}", indented.trim_start())
}

/// The contract a scenario pack fulfils: run itself and produce the unified output
/// envelope, returning a structured [`KshanaError`] on failure.
pub trait Scenario {
    fn run(&self) -> Result<RunOutput, KshanaError>;
}

/// Extension point for third-party packs: a registrable pack implements
/// [`Scenario`] plus identifies its kind and metadata. See `ARCHITECTURE.md`
/// (“Extending Kshana with an external pack”). The trait is intentionally small and
/// semver-stable so out-of-tree packs do not need to fork core.
pub trait ExternalPack: Scenario {
    /// The `kind` string this pack answers to.
    fn kind_name(&self) -> &'static str;
    /// Introspection metadata, surfaced alongside the built-ins.
    fn meta(&self) -> ScenarioMeta;
    /// Register this pack's [`crate::registry::ScenarioFactory`] into `reg` so the
    /// dispatch seam can build it by id. The default is a no-op: pre-existing and
    /// out-of-tree implementors that predate this seam keep compiling unchanged, and
    /// only packs that opt into registry dispatch override it (typically by inserting
    /// a `Box<dyn ScenarioFactory>` keyed on [`kind_name`](ExternalPack::kind_name)).
    fn register_into(_reg: &mut crate::registry::PackRegistry)
    where
        Self: Sized,
    {
    }
}

// A built-in pack implemented through the `Scenario` trait, as the worked example
// the dispatcher and any external pack follow. (The other built-ins run inline in
// `run_toml`; migrating each is a mechanical follow-on.)
impl Scenario for crate::jamming::JammingScenario {
    fn run(&self) -> Result<RunOutput, KshanaError> {
        self.time.validate()?;
        let r = crate::jamming::run_jamming(self);
        let summary = format!(
            "scenario {} | jamming {} | availability under jamming {:.2} (nominal {:.2}) | min tracking {} | mean J/S {}",
            &r.scenario_hash[..12],
            if r.jammer_present { "ON" } else { "OFF" },
            r.fom.availability_under_jamming,
            r.fom.availability_nominal,
            r.fom.min_tracking,
            if r.fom.mean_js_db.is_nan() { "n/a".to_string() } else { format!("{:.1} dB", r.fom.mean_js_db) },
        );
        Ok(RunOutput {
            json: json_of_with_units(&r, crate::jamming::UNITS)
                .map_err(KshanaError::InvalidInput)?,
            svg: crate::jamming::to_svg(&r),
            summary,
            csv: None,
        })
    }
}

/// Run a scenario and return a typed result with a structured error — the entry
/// point binding callers should prefer over the string-error [`run_toml`].
pub fn run_scenario(src: &str) -> Result<RunOutput, KshanaError> {
    // Resolve the kind with the typed classifier (a real structured error), then
    // run; pack-level parse/validation failures surface as `InvalidInput`.
    ScenarioKind::classify(src)?;
    run_toml(src).map_err(KshanaError::InvalidInput)
}

/// Parse, dispatch, and run a scenario given as a TOML string. Dispatch is on the
/// typed [`ScenarioKind`]; the string-error signature is retained for the CLI and
/// the existing bindings (see [`run_scenario`] for the structured-error variant).
/// Every chart is stamped with a provenance footer so saved images stand alone.
pub fn run_toml(src: &str) -> Result<RunOutput, String> {
    let mut out = run_toml_inner(src)?;
    let hash = extract_scenario_hash(&out.json).unwrap_or_else(|| src_fingerprint(src));
    out.svg = with_provenance(out.svg, &hash);
    Ok(out)
}

/// The dispatch itself, before the chart is provenance-stamped. Classification is
/// behaviour-preserving: resolve the typed kind, then route through the
/// [`crate::registry::PackRegistry`] of built-ins. The error mapping is identical to
/// the historical inline dispatch (the registry wraps the built-in's `String` error
/// in `InvalidInput`, whose `Display` passes it through unchanged).
fn run_toml_inner(src: &str) -> Result<RunOutput, String> {
    let kind = ScenarioKind::classify(src).map_err(|e| e.to_string())?;
    crate::registry::PackRegistry::with_builtins()
        .build(&kind.to_id(), src)?
        .run()
        .map_err(|e| e.to_string())
}

/// The built-in dispatch table, keyed on an already-resolved [`ScenarioKind`]. This
/// is the same exhaustive match the engine has always run; it is now reached through
/// the registry seam (see [`run_toml_inner`]) so out-of-tree packs can interpose
/// without forking core.
pub(crate) fn run_builtin_kind(kind: ScenarioKind, src: &str) -> Result<RunOutput, String> {
    match kind {
        ScenarioKind::Inertial => {
            let scn: crate::inertial::InertialScenario =
                toml::from_str(src).map_err(|e| format!("invalid inertial scenario: {e}"))?;
            scn.time.validate()?;
            let r = crate::inertial::run_inertial(&scn);
            let summary = format!(
                "scenario {} | quantum holdover {:.0}s p95 {:.2}m | classical holdover {:.0}s p95 {:.1}m",
                &r.scenario_hash[..12],
                r.quantum.fom.holdover_s, r.quantum.fom.pos_p95_m,
                r.classical.fom.holdover_s, r.classical.fom.pos_p95_m,
            );
            Ok(RunOutput {
                json: json_of_with_units(&r, crate::inertial::UNITS)?,
                svg: crate::inertial::to_svg(&r),
                summary,
                csv: None,
            })
        }
        ScenarioKind::Integrity => {
            let scn: crate::raim::IntegrityScenario =
                toml::from_str(src).map_err(|e| format!("invalid integrity scenario: {e}"))?;
            scn.time.validate()?;
            let n_sats = scn.all_satellites()?.len();
            let report = scn.run()?;
            let summary = format!(
                "integrity | {} satellites | {}/{} epochs available ({:.1}%) | HAL {:.0} m VAL {:.0} m | sigma {:.1} m | Stanford(V): {} integrity events, {} HMI",
                n_sats,
                report.samples_available,
                report.samples_total,
                report.availability() * 100.0,
                report.al_h_m,
                report.al_v_m,
                scn.sigma_uere_m,
                report.stanford.integrity_events(),
                report
                    .stanford
                    .count(crate::raim::StanfordRegion::HazardouslyMisleadingInformation),
            );
            Ok(RunOutput {
                json: json_of_with_units(&report, crate::raim::UNITS)?,
                svg: crate::raim::availability_svg(&report),
                summary,
                csv: None,
            })
        }
        ScenarioKind::LunarIntegrity => {
            let scn: crate::lunar::LunarScenario = toml::from_str(src)
                .map_err(|e| format!("invalid lunar-integrity scenario: {e}"))?;
            let report = scn.run();
            let summary = format!(
                "lunar-integrity | south pole | {}/{} epochs available ({:.1}%) | AL {:.0} m | σ_URE {:.0} m | HPL {:.0}–{:.0} m",
                report.samples_available,
                report.samples_total,
                report.availability() * 100.0,
                report.alert_limit_m,
                report.sigma_ure_m,
                report.min_hpl_m,
                report.max_hpl_m,
            );
            Ok(RunOutput {
                json: json_of_with_units(&report, crate::lunar::UNITS)?,
                svg: crate::lunar::lunar_report_svg(&report),
                summary,
                csv: None,
            })
        }
        ScenarioKind::LunarTime => {
            let scn: crate::lunar_time::LunarTimeScenario = toml::from_str(src)
                .map_err(|e| format!("invalid lunar-time-offset scenario: {e}"))?;
            let report = scn.run();
            let summary = format!(
                "lunar-time-offset | secular LTC−TT rate {:.2} µs/day (band {:.0}–{:.0}) | self-pot {:.2} kinetic {:.2} | offset @ {:.2} d = {:.2} µs",
                report.secular_rate_us_per_day,
                report.band_low,
                report.band_high,
                report.self_potential_us_per_day,
                report.kinetic_us_per_day,
                report.horizon_days,
                report.offset_at_horizon_us,
            );
            Ok(RunOutput {
                json: json_of_with_units(&report, crate::lunar_time::UNITS)?,
                svg: crate::lunar_time::lunar_time_svg(&report),
                summary,
                csv: None,
            })
        }
        ScenarioKind::LunarVlbi => {
            let scn: crate::lunar_vlbi::LunarVlbiScenario =
                toml::from_str(src).map_err(|e| format!("invalid lunar-vlbi scenario: {e}"))?;
            let report = scn.run();
            let summary = format!(
                "lunar-vlbi | baseline {:.0} km | beacon range {:.0} km | delay {:.3} µs (rate {:.3e} s/s) | near-field {:.1} µs | {} samples over {:.1} h",
                report.baseline_km,
                report.beacon_range_km,
                report.delay_s * 1e6,
                report.delay_rate_s_per_s,
                report.near_field_correction_us,
                report.samples,
                report.horizon_hours,
            );
            Ok(RunOutput {
                json: json_of_with_units(&report, crate::lunar_vlbi::UNITS)?,
                svg: crate::lunar_vlbi::lunar_vlbi_svg(&report),
                summary,
                csv: None,
            })
        }
        ScenarioKind::LunarCombination => {
            let scn: crate::lunar_combination::LunarCombinationScenario = toml::from_str(src)
                .map_err(|e| format!("invalid lunar-joint-od-clock scenario: {e}"))?;
            let report = scn.run();
            let summary = format!(
                "lunar-joint-od-clock | {} sats, {} Earth stations | station 3-D err with VLBI {:.2} m vs range-only {:.2} m ({:.1}× sharper) | sat pos RMS {:.2} m | station clk err {:.2e} s | obs {}/{} params",
                report.n_sat,
                report.n_earth,
                report.with_vlbi.station_pos_err_m,
                report.without_vlbi.station_pos_err_m,
                report.station_observability_improvement_factor,
                report.with_vlbi.sat_pos_rms_m,
                report.with_vlbi.station_clock_err_s,
                report.with_vlbi.n_obs,
                report.with_vlbi.n_params,
            );
            Ok(RunOutput {
                json: json_of_with_units(&report, crate::lunar_combination::UNITS)?,
                svg: crate::lunar_combination::lunar_combination_svg(&report),
                summary,
                csv: None,
            })
        }
        ScenarioKind::LunarFrameRealise => {
            let scn: crate::lunar_frame_realise::LunarFrameRealiseScenario = toml::from_str(src)
                .map_err(|e| format!("invalid lunar-frame-realisation scenario: {e}"))?;
            let report = scn.run();
            let summary = format!(
                "lunar-frame-realisation | {} points | translation err {:.3e} m, rotation err {:.3e} rad, scale err {:.3e} ppb | rms residual {:.3} m | converged {}",
                report.n_points,
                report.trans_err_norm_m,
                report.rot_err_norm_rad,
                report.scale_err_ppb,
                report.rms_residual_m,
                report.converged,
            );
            Ok(RunOutput {
                json: json_of_with_units(&report, crate::lunar_frame_realise::UNITS)?,
                svg: crate::lunar_frame_realise::lunar_frame_realise_svg(&report),
                summary,
                csv: None,
            })
        }
        ScenarioKind::LunarService => {
            let scn: crate::lunar_service::LunarServiceScenario = toml::from_str(src)
                .map_err(|e| format!("invalid moonlight-service-volume scenario: {e}"))?;
            // `try_run` rather than `run`: with `ephemeris_path` set the scenario reads a
            // file, and a missing or malformed one must surface as a clean dispatch error
            // rather than a panic. With the path unset the two are identical.
            let report = scn.try_run()?;
            // The headline geometry is the illustrative set UNLESS a file supplied it, in
            // which case saying "illustrative LCNS-class" of it would be false. The
            // default wording is byte-unchanged.
            let geometry_label = match &report.ephemeris {
                None => "illustrative LCNS-class, not affiliated",
                Some(e) if e.provenance_class == "published-ephemeris" => {
                    "retrieved ephemeris, published-ephemeris"
                }
                Some(_) => "retrieved constellation definition, published-elements",
            };
            let mut summary = format!(
                "moonlight-service-volume | {} sats ({geometry_label}) | {} pts × {} epochs | coverage {:.1}% (PDOP<{:.1}) | sats {}–{} | PDOP {:.2}/{:.2}/{:.2} | HPL {:.0}–{:.0} m | PL avail {:.1}% | MODELLED",
                report.n_sats,
                report.n_grid_points,
                report.n_epochs,
                report.coverage_pct,
                report.pdop_threshold,
                report.min_sats,
                report.max_sats,
                report.pdop_min,
                report.pdop_mean,
                report.pdop_max,
                report.hpl_min_m,
                report.hpl_max_m,
                report.pl_availability_pct,
            );
            // Appended only when `ephemeris_path` named a file, so the default summary
            // line is unchanged: the sigma requirement under the retrieved geometry and
            // the one it is reported beside, never in place of.
            if let Some(c) = &report.ephemeris_comparison {
                let fmt = |v: Option<f64>| match v {
                    Some(x) => format!("{x:.4} m"),
                    None => "n/a".to_string(),
                };
                summary.push_str(&format!(
                    " | ephemeris {} ({}) σ_URE required {} vs Keplerian {} vs perturbed {} (Δ {})",
                    report
                        .ephemeris
                        .as_ref()
                        .map(|e| e.name.as_str())
                        .unwrap_or(""),
                    c.ephemeris.provenance,
                    fmt(c.ephemeris.sigma_required_m),
                    fmt(c.keplerian.sigma_required_m),
                    fmt(c.perturbed.sigma_required_m),
                    fmt(c.sigma_requirement_delta_vs_keplerian_m),
                ));
            }
            // G11: publish the per-satellite geometry as a long-form runtime artifact.
            // It is the largest array the crate emits — 2304 rows in the released joint
            // communications-and-navigation table — and reached consumers only inside
            // JSON, the shape that silently truncated a sibling scenario's curve.
            // `None` unless an export site was configured, so the default run is
            // byte-unchanged and no empty file is written.
            let csv = report.per_sat_geometry_csv();
            Ok(RunOutput {
                json: json_of_with_units(&report, crate::lunar_service::UNITS)?,
                svg: crate::lunar_service::lunar_service_svg(&report),
                summary,
                csv,
            })
        }
        ScenarioKind::LunarDpnt => {
            let scn: crate::lunar_dpnt::LunarDpntScenario = toml::from_str(src)
                .map_err(|e| format!("invalid lunar-differential-pnt scenario: {e}"))?;
            let report = scn.run();
            let summary = format!(
                "lunar-differential-pnt | {} sats (illustrative LCNS-class, not affiliated) | baseline {:.0} km | user error {:.2} m → {:.4} m ({:.0}× reduction) | HPL {:.1} m (σ_resid {:.1} m) | MODELLED",
                report.n_sats,
                report.baseline_km,
                report.user_error_uncorrected_m,
                report.user_error_corrected_m,
                report.reduction_factor,
                report.protection_level_m,
                report.residual_sigma_m,
            );
            Ok(RunOutput {
                json: json_of(&report)?,
                svg: crate::lunar_dpnt::lunar_dpnt_svg(&report),
                summary,
                csv: None,
            })
        }
        ScenarioKind::LunarInterop => {
            let scn: crate::lunar_interop::LunarInteropScenario = toml::from_str(src)
                .map_err(|e| format!("invalid lunar-interop-export scenario: {e}"))?;
            let report = scn.run();
            let summary = format!(
                "lunar-interop-export | REF_FRAME {} / TIME_SYSTEM {} | {} states, OEM {} lines | conformance {} ({} present / {} missing) | OEM round-trip {} | time-meta round-trip {} | KIF {} bytes | MODELLED",
                report.frame,
                report.time_system,
                report.n_states,
                report.oem_line_count,
                if report.conformance.pass { "PASS" } else { "FAIL" },
                report.conformance.present_fields.len(),
                report.conformance.missing_fields.len(),
                if report.oem_roundtrip_ok { "ok" } else { "fail" },
                if report.time_metadata_roundtrip_ok { "ok" } else { "fail" },
                report.kif_bytes,
            );
            Ok(RunOutput {
                json: json_of_with_units(&report, crate::lunar_interop::UNITS)?,
                svg: crate::lunar_interop::lunar_interop_svg(&report),
                summary,
                csv: None,
            })
        }
        ScenarioKind::TimeTransfer => {
            let scn: crate::timetransfer::TimeTransferScenario =
                toml::from_str(src).map_err(|e| format!("invalid time-transfer scenario: {e}"))?;
            let r = crate::timetransfer::run_timetransfer(&scn);
            let summary = format!(
                "scenario {} | optical sync_rms {:.2}ps range_rms {:.3}mm adev(1s) {:.2e} | RF sync_rms {:.1}ps range_rms {:.1}mm adev(1s) {:.2e}",
                &r.scenario_hash[..12],
                r.quantum.fom.sync_rms_ps, r.quantum.fom.range_rms_mm, r.quantum.fom.adev_tau0,
                r.classical.fom.sync_rms_ps, r.classical.fom.range_rms_mm, r.classical.fom.adev_tau0,
            );
            Ok(RunOutput {
                json: json_of_with_units(&r, crate::timetransfer::UNITS)?,
                svg: crate::timetransfer::to_svg(&r),
                summary,
                csv: None,
            })
        }
        ScenarioKind::QuantumTimeTransfer => {
            let scn: crate::timetransfer_chain::QuantumTimeTransferScenario =
                toml::from_str(src)
                    .map_err(|e| format!("invalid quantum-time-transfer scenario: {e}"))?;
            let r = scn.run();
            let summary = format!(
                "quantum-time-transfer | quantum chain {:.3e}s vs classical {:.3e}s | PL {:.2} ns | security Pd {:.3} (Pfa {:.0e}) | anomaly Pd {:.3} | trade quantum wins {}/{} | MODELLED",
                r.quantum_chain_sigma_s,
                r.classical_chain_sigma_s,
                r.protection_level_ns,
                r.security_pd,
                r.monitor_pfa,
                r.anomaly_pd,
                r.trade.quantum_wins(),
                r.trade.foms.len(),
            );
            Ok(RunOutput {
                json: json_of_with_units(&r, crate::timetransfer_chain::UNITS)?,
                svg: crate::timetransfer_chain::to_svg(&r),
                summary,
                csv: None,
            })
        }
        ScenarioKind::QuantumGnssFreeNav => {
            let scn: crate::quantum_nav_od::QuantumNavOdScenario = toml::from_str(src)
                .map_err(|e| format!("invalid quantum-gnss-free-nav scenario: {e}"))?;
            let r = scn.run();
            let summary = format!(
                "quantum-gnss-free-nav | outage {:.0}s | quantum pos err {:.2} m vs classical {:.2} m ({:.1}x) | holdover quantum {:.0}s vs classical {:.0}s (thr {:.0} m) | trade quantum wins {}/{} | MODELLED",
                r.outage_s,
                r.quantum_pos_err_m,
                r.classical_pos_err_m,
                r.improvement_x,
                r.quantum_holdover_s,
                r.classical_holdover_s,
                r.threshold_m,
                r.trade.quantum_wins(),
                r.trade.foms.len(),
            );
            Ok(RunOutput {
                json: json_of_with_units(&r, crate::quantum_nav_od::UNITS)?,
                svg: crate::quantum_nav_od::to_svg(&r),
                summary,
                csv: None,
            })
        }
        ScenarioKind::QuantumAnomalyDetect => {
            let scn: crate::quantum_faults::QuantumAnomalyScenario = toml::from_str(src)
                .map_err(|e| format!("invalid quantum-anomaly-detect scenario: {e}"))?;
            let r = scn.run();
            let summary = format!(
                "quantum-anomaly-detect | AUC quantum {:.4} vs classical {:.4} | min-detectable fault quantum {:.3} vs classical {:.3} | {} fault classes | trade quantum wins {}/{} | MODELLED",
                r.quantum_auc,
                r.classical_auc,
                r.quantum_min_detectable,
                r.classical_min_detectable,
                r.fault_catalog.len(),
                r.trade.quantum_wins(),
                r.trade.foms.len(),
            );
            Ok(RunOutput {
                json: json_of_with_units(&r, crate::quantum_faults::UNITS)?,
                svg: crate::quantum_faults::to_svg(&r),
                summary,
                csv: None,
            })
        }
        ScenarioKind::Hybrid => {
            let scn: crate::hybrid::HybridScenario =
                toml::from_str(src).map_err(|e| format!("invalid hybrid scenario: {e}"))?;
            scn.time.validate()?;
            let r = crate::hybrid::run_hybrid(&scn);
            let summary = format!(
                "scenario {} | quantum PNT-holdover {:.0}s (t {:.0}s/p {:.0}s) integrity {} security {} | classical PNT-holdover {:.0}s (t {:.0}s/p {:.0}s) integrity {} security {}",
                &r.scenario_hash[..12],
                r.quantum.fom.pnt_holdover_s, r.quantum.fom.timing_holdover_s, r.quantum.fom.position_holdover_s, integ(r.quantum.fom.integrity), integ(r.quantum.fom.security),
                r.classical.fom.pnt_holdover_s, r.classical.fom.timing_holdover_s, r.classical.fom.position_holdover_s, integ(r.classical.fom.integrity), integ(r.classical.fom.security),
            );
            Ok(RunOutput {
                json: json_of_with_units(&r, crate::hybrid::UNITS)?,
                svg: crate::hybrid::to_svg(&r),
                summary,
                csv: None,
            })
        }
        ScenarioKind::Fusion => {
            let scn: crate::hybrid::HybridScenario =
                toml::from_str(src).map_err(|e| format!("invalid fusion scenario: {e}"))?;
            scn.time.validate()?;
            let r = crate::fusion::run_fusion(&scn);
            let summary = format!(
                "scenario {} | fused | quantum PNT-holdover {:.0}s (t {:.0}s/p {:.0}s) integrity {} security {} | classical PNT-holdover {:.0}s (t {:.0}s/p {:.0}s) integrity {} security {}",
                &r.scenario_hash[..12],
                r.quantum.fom.pnt_holdover_s, r.quantum.fom.timing_holdover_s, r.quantum.fom.position_holdover_s, integ(r.quantum.fom.integrity), integ(r.quantum.fom.security),
                r.classical.fom.pnt_holdover_s, r.classical.fom.timing_holdover_s, r.classical.fom.position_holdover_s, integ(r.classical.fom.integrity), integ(r.classical.fom.security),
            );
            Ok(RunOutput {
                json: json_of_with_units(&r, crate::fusion::UNITS)?,
                svg: crate::hybrid::to_svg(&r),
                summary,
                csv: None,
            })
        }
        ScenarioKind::HybridUkf => {
            let scn: crate::fusion::hybrid_ukf::HybridUkfScenario =
                toml::from_str(src).map_err(|e| format!("invalid hybrid-ukf scenario: {e}"))?;
            scn.time.validate()?;
            let r = crate::fusion::hybrid_ukf::run_hybrid_ukf(&scn);
            let c = &r.consistency;
            let summary = format!(
                "scenario {} | hybrid-ukf (17-state, MODELLED) | sensor {} (q_va {:.2e}) | clock q_wf {:.2e} q_rw {:.2e} | NIS {:.2}/{} in [{:.2},{:.2}] | NEES {:.2}/{} in [{:.2},{:.2}] | {} | aided {:.1}m -> coast {:.1}m over {:.0}s | self-consistency, not accuracy",
                &r.scenario_hash[..12],
                if r.quantum_cai { "quantum-CAI" } else { "classical" },
                r.effective_q_va,
                r.clock_q_wf, r.clock_q_rw,
                c.nis_mean, c.nis_dof, c.nis_chi2_lower_95, c.nis_chi2_upper_95,
                c.nees_mean, c.nees_dof, c.nees_chi2_lower_95, c.nees_chi2_upper_95,
                if c.consistent { "CONSISTENT" } else { "INCONSISTENT" },
                r.coast.aided_pos_rms_m, r.coast.coast_end_pos_rms_m, r.coast.coast_duration_s,
            );
            Ok(RunOutput {
                json: json_of_with_units(&r, crate::fusion::hybrid_ukf::UNITS)?,
                svg: crate::fusion::hybrid_ukf::to_svg(&r),
                summary,
                csv: None,
            })
        }
        ScenarioKind::GnssIns => {
            let scn: crate::fusion::pack::GnssInsScenario =
                toml::from_str(src).map_err(|e| format!("invalid gnss-ins scenario: {e}"))?;
            scn.time.validate()?;
            let r = crate::fusion::pack::run_gnss_ins(&scn);
            let summary = format!(
                "scenario {} | gnss-ins | quantum outage-RMS fused {:.1}m vs free {:.1}m (hold {:.0}s, avail {:.2}) | classical fused {:.1}m vs free {:.1}m (hold {:.0}s, avail {:.2})",
                &r.scenario_hash[..12],
                r.quantum.fused_outage_rms_m, r.quantum.free_outage_rms_m, r.quantum.fom.holdover_s, r.quantum.fom.availability,
                r.classical.fused_outage_rms_m, r.classical.free_outage_rms_m, r.classical.fom.holdover_s, r.classical.fom.availability,
            );
            Ok(RunOutput {
                json: json_of_with_units(&r, crate::fusion::pack::UNITS)?,
                svg: crate::fusion::pack::to_svg(&r),
                summary,
                csv: None,
            })
        }
        ScenarioKind::GnssSim => {
            let scn: crate::gnss_sim::GnssSimScenario =
                toml::from_str(src).map_err(|e| format!("invalid gnss-sim scenario: {e}"))?;
            scn.time.validate()?;
            let (alert_h, alert_v) = (scn.alert_limit_h_m, scn.alert_limit_v_m);
            let r = crate::gnss_sim::run_gnss_sim(&scn);
            let summary = format!(
                "scenario {} | gnss-sim | mean iono {:.1}m tropo {:.1}m | RAIM avail {:.2} mean HPL {:.1}m VPL {:.1}m fault-rate {:.3}",
                &r.scenario_hash[..12],
                r.fom.mean_iono_m, r.fom.mean_tropo_m,
                r.fom.raim_availability, r.fom.mean_hpl_m, r.fom.mean_vpl_m, r.fom.fault_rate,
            );
            Ok(RunOutput {
                json: json_of_with_units(&r, crate::gnss_sim::UNITS)?,
                svg: crate::gnss_sim::to_svg(&r, alert_h, alert_v),
                summary,
                csv: None,
            })
        }
        ScenarioKind::Jamming => {
            // Routed through the `Scenario` trait — the extension-point contract.
            let scn: crate::jamming::JammingScenario =
                toml::from_str(src).map_err(|e| format!("invalid jamming scenario: {e}"))?;
            scn.run().map_err(|e| e.to_string())
        }
        ScenarioKind::Spoof => {
            let scn: crate::spoof::SpoofScenario =
                toml::from_str(src).map_err(|e| format!("invalid spoof scenario: {e}"))?;
            scn.time.validate()?;
            let r = crate::spoof::run_spoof(&scn);
            let det = |c: &crate::spoof::SpoofClock| {
                c.detect_time_s
                    .map_or_else(|| "undetected".to_string(), |t| format!("detected {t:.0}s"))
            };
            let summary = format!(
                "scenario {} | spoof {:?} vs {:.3} ns spec (P_fa {:.3}) | quantum security {:.3} (P_md {:.3}, MC {:.3}) {} | classical security {:.3} (P_md {:.3}, MC {:.3}) {}",
                &r.scenario_hash[..12], scn.attack.resolved_shape(), r.threshold_ns, scn.attack.target_pfa,
                r.quantum.security_fom, r.quantum.detection.analytic_pmd, r.quantum.detection.mc_pmd, det(&r.quantum),
                r.classical.security_fom, r.classical.detection.analytic_pmd, r.classical.detection.mc_pmd, det(&r.classical),
            );
            Ok(RunOutput {
                json: json_of_with_units(&r, crate::spoof::UNITS)?,
                svg: crate::spoof::to_svg(&r),
                summary,
                csv: None,
            })
        }
        ScenarioKind::SpoofDetect => {
            let scn: crate::spoof_detect::SpoofDetectScenario =
                toml::from_str(src).map_err(|e| format!("invalid spoof-detect scenario: {e}"))?;
            let r = crate::spoof_detect::run_spoof_detect(&scn);
            let summary = format!(
                "scenario {} | spoof-detect | {} SVs, +{:.1} dB{} | {:?} push | fused score {:.2} (thr {:.2}) | {}",
                &r.scenario_hash[..12],
                r.n_sats,
                r.attack.power_advantage_db,
                if r.attack.carrier_aligned { ", carrier-aligned" } else { "" },
                r.attack.push,
                r.decision.fused.score,
                scn.detector.fusion_threshold,
                r.verdict,
            );
            Ok(RunOutput {
                json: json_of_with_units(&r, crate::spoof_detect::UNITS)?,
                svg: crate::spoof_detect::to_svg(&r),
                summary,
                csv: None,
            })
        }
        ScenarioKind::Sweep => {
            let scn: crate::sweep::SweepScenario =
                toml::from_str(src).map_err(|e| format!("invalid sweep scenario: {e}"))?;
            scn.base.time.validate()?;
            let r = crate::sweep::run_sweep(&scn)?;
            let (first, last) = (r.points.first(), r.points.last());
            let summary = format!(
                "sweep {} over {} ({:.2e}..{:.2e}, {} pts, {} scale) | quantum {:.3}->{:.3} | classical {:.3}->{:.3}",
                r.metric, r.parameter,
                first.map_or(0.0, |p| p.value), last.map_or(0.0, |p| p.value), r.points.len(), r.scale,
                first.map_or(0.0, |p| p.quantum), last.map_or(0.0, |p| p.quantum),
                first.map_or(0.0, |p| p.classical), last.map_or(0.0, |p| p.classical),
            );
            Ok(RunOutput {
                json: json_of_with_units(&r, &crate::sweep::units(&r.parameter, &r.metric))?,
                svg: crate::sweep::to_svg(&r),
                summary,
                csv: None,
            })
        }
        ScenarioKind::SweepNd => {
            let scn: crate::sweep::GenericSweepScenario =
                toml::from_str(src).map_err(|e| format!("invalid generic sweep scenario: {e}"))?;
            let r = crate::sweep::run_generic_sweep(&scn)?;
            let summary = format!(
                "generic sweep of `{}` over [{}] | {} nodes (shape {:?}) | metrics [{}]",
                r.kind,
                r.keys.join(", "),
                r.points.len(),
                r.shape,
                r.metrics.join(", "),
            );
            Ok(RunOutput {
                json: json_of_with_units(&r, crate::sweep::GENERIC_UNITS)?,
                svg: crate::sweep::generic_to_svg(&r),
                summary,
                csv: None,
            })
        }
        ScenarioKind::Orbit => {
            let scn: crate::orbit::OrbitClockScenario =
                toml::from_str(src).map_err(|e| format!("invalid orbit scenario: {e}"))?;
            scn.time.validate()?;
            let r = crate::run::run_orbit_clock(&scn)?;
            let geometry = crate::orbit::summarize_dop(
                &scn.user.to_orbit(),
                &scn.all_satellites()?,
                scn.time.step_s,
                scn.time.duration_s,
                scn.mask_deg,
                scn.sigma_uere_m,
            );
            let nominal = r
                .quantum
                .series
                .iter()
                .filter(|s| s.gnss == GnssState::Nominal)
                .count();
            let summary = format!(
                "scenario {} | {}/{} samples GNSS-nominal | best PDOP {} pos {} | quantum holdover {:.0}s p95 {:.1}ns integrity {} security {} | classical holdover {:.0}s p95 {:.1}ns integrity {} security {}",
                &r.scenario_hash[..12],
                nominal, r.quantum.series.len(),
                fnum(geometry.best_pdop), posm(geometry.best_position_sigma_m),
                r.quantum.fom.holdover_s, r.quantum.fom.timing_p95_ns, integ(r.quantum.fom.integrity), integ(r.quantum.fom.security),
                r.classical.fom.holdover_s, r.classical.fom.timing_p95_ns, integ(r.classical.fom.integrity), integ(r.classical.fom.security),
            );
            #[derive(serde::Serialize)]
            struct OrbitOutput<'a> {
                #[serde(flatten)]
                run: &'a crate::report::RunResult,
                geometry: crate::orbit::DopSummary,
            }
            Ok(RunOutput {
                json: json_of_with_units(
                    &OrbitOutput { run: &r, geometry },
                    &[crate::orbit::UNITS, crate::report::UNITS].concat(),
                )?,
                svg: crate::report::to_svg(&r),
                summary,
                csv: None,
            })
        }
        ScenarioKind::Ephemeris => {
            let scn: crate::ephemeris::EphemerisScenario =
                toml::from_str(src).map_err(|e| format!("invalid ephemeris scenario: {e}"))?;
            let r = crate::ephemeris::run_ephemeris(&scn).map_err(|e| format!("ephemeris: {e}"))?;
            let pass = match (r.max_elevation_deg, r.peak_doppler_hz) {
                (Some(el), Some(d)) => {
                    format!(" | max el {el:.1}° peak Doppler {:.1} kHz", d / 1000.0)
                }
                _ => String::new(),
            };
            let summary = format!(
                "scenario {} | {} | {} samples | alt {:.0}–{:.0} km | |lat| ≤ {:.1}° | speed {:.0}–{:.0} m/s{}",
                &r.scenario_hash[..12],
                r.source,
                r.n_samples,
                r.alt_min_km,
                r.alt_max_km,
                r.lat_max_deg.abs().max(r.lat_min_deg.abs()),
                r.speed_min_m_s,
                r.speed_max_m_s,
                pass,
            );
            Ok(RunOutput {
                json: json_of_with_units(&r, crate::ephemeris::UNITS)?,
                svg: crate::ephemeris::to_svg(&r),
                summary,
                csv: None,
            })
        }
        ScenarioKind::GravityMap => {
            let cfg: crate::gravimeter::GravityMapBenchmarkCfg =
                toml::from_str(src).map_err(|e| format!("invalid gravity-map scenario: {e}"))?;
            let r = crate::gravimeter::run_gps_denied_gravity_nav(&cfg);
            let summary = format!(
                "gravity-map | free-inertial drift {:.0} m | gravity-matched {:.0} m | matching sigma {:.3e} mGal",
                r.free_inertial_drift_m, r.map_matched_error_m, r.measurement_sigma_mgal,
            );
            #[derive(serde::Serialize)]
            struct GravityMapOut {
                free_inertial_drift_m: f64,
                map_matched_error_m: f64,
                measurement_sigma_mgal: f64,
            }
            let out = GravityMapOut {
                free_inertial_drift_m: r.free_inertial_drift_m,
                map_matched_error_m: r.map_matched_error_m,
                measurement_sigma_mgal: r.measurement_sigma_mgal,
            };
            Ok(RunOutput {
                json: json_of_with_units(&out, crate::gravimeter::UNITS)?,
                svg: crate::altpnt::terrain::gravity_nav_svg(
                    r.free_inertial_drift_m,
                    r.map_matched_error_m,
                ),
                summary,
                csv: None,
            })
        }
        ScenarioKind::Terrain => {
            let cfg: crate::altpnt::terrain::TerrainNavCfg =
                toml::from_str(src).map_err(|e| format!("invalid terrain-nav scenario: {e}"))?;
            let r = crate::altpnt::terrain::run_terrain_nav(&cfg);
            let summary = format!(
                "terrain-nav | free-inertial drift {:.0} m | terrain-matched {:.0} m ({:.0}x cut) | matching sigma {:.1} m",
                r.free_inertial_drift_m,
                r.matched_error_m,
                if r.matched_error_m > 0.0 { r.free_inertial_drift_m / r.matched_error_m } else { 0.0 },
                r.measurement_sigma_m,
            );
            Ok(RunOutput {
                json: json_of_with_units(&r, crate::altpnt::terrain::TERRAIN_NAV_UNITS)?,
                svg: crate::altpnt::terrain::terrain_nav_svg(&r),
                summary,
                csv: None,
            })
        }
        ScenarioKind::TerrainSlam => {
            let cfg: crate::altpnt::sequential::SequentialTrnCfg =
                toml::from_str(src).map_err(|e| format!("invalid terrain-slam scenario: {e}"))?;
            let r = crate::altpnt::sequential::run_sequential_trn(&cfg);
            let summary = format!(
                "terrain-slam | {} waypoints | free-inertial RMS {:.0} m (final {:.0} m) | terrain-matched RMS {:.0} m (final {:.0} m, {:.0}x cut) | mean ESS {:.0}/{} | matching sigma {:.1} m",
                r.waypoints,
                r.free_inertial_rms_m,
                r.free_inertial_final_m,
                r.matched_rms_m,
                r.matched_final_m,
                if r.matched_rms_m > 0.0 { r.free_inertial_rms_m / r.matched_rms_m } else { 0.0 },
                r.mean_ess,
                cfg.n_particles.max(1),
                r.measurement_sigma_m,
            );
            Ok(RunOutput {
                json: json_of_with_units(&r, crate::altpnt::sequential::UNITS)?,
                svg: crate::altpnt::sequential::sequential_trn_svg(&r),
                summary,
                csv: None,
            })
        }
        ScenarioKind::CombinedAltPnt => {
            let cfg: crate::altpnt::terrain::CombinedAltPntCfg = toml::from_str(src)
                .map_err(|e| format!("invalid combined-altpnt scenario: {e}"))?;
            let r = crate::altpnt::terrain::run_combined_altpnt(&cfg);
            let summary = format!(
                "combined-altpnt | free-inertial drift {:.0} m | gravity {:.0} m magnetic {:.0} m terrain {:.0} m | FUSED {:.0} m",
                r.free_inertial_drift_m,
                r.gravity_only_m,
                r.magnetic_only_m,
                r.terrain_only_m,
                r.combined_m,
            );
            Ok(RunOutput {
                json: json_of_with_units(&r, crate::altpnt::terrain::COMBINED_ALTPNT_UNITS)?,
                svg: crate::altpnt::terrain::combined_altpnt_svg(&r),
                summary,
                csv: None,
            })
        }
        ScenarioKind::Pvt => {
            let scn: crate::pvt::PvtScenario =
                toml::from_str(src).map_err(|e| format!("invalid pvt scenario: {e}"))?;
            let r = crate::pvt::run_pvt(&scn)?;
            let summary = crate::pvt::summary(&r);
            Ok(RunOutput {
                json: json_of_with_units(&r, crate::pvt::UNITS)?,
                svg: crate::pvt::pvt_svg(&r),
                summary,
                csv: None,
            })
        }
        ScenarioKind::MarsPnt => {
            let scn: crate::mars_pnt::MarsScenario =
                toml::from_str(src).map_err(|e| format!("invalid mars-pnt scenario: {e}"))?;
            let r = crate::mars_pnt::run_mars_pnt(&scn)?;
            let summary = crate::mars_pnt::summary(&r);
            Ok(RunOutput {
                json: json_of_with_units(&r, crate::mars_pnt::UNITS)?,
                svg: crate::mars_pnt::to_svg(&r),
                summary,
                csv: None,
            })
        }
        ScenarioKind::ImpairmentEval => {
            let scn: crate::impairment_eval::ImpairmentEvalScenario = toml::from_str(src)
                .map_err(|e| format!("invalid impairment-eval scenario: {e}"))?;
            let (json, summary) = scn.run_json()?;
            let svg = minimal_svg(&summary);
            Ok(RunOutput {
                json,
                svg,
                summary,
                csv: None,
            })
        }
        ScenarioKind::QuantumTrade => {
            let scn: crate::quantum_trade::QuantumTradeScenario =
                toml::from_str(src).map_err(|e| format!("invalid quantum-trade scenario: {e}"))?;
            let (json, summary) = scn.run_json()?;
            let svg = minimal_svg(&summary);
            Ok(RunOutput {
                json,
                svg,
                summary,
                csv: None,
            })
        }
        ScenarioKind::SpaceWeather => {
            let scn: crate::space_weather::SpaceWeatherScenario =
                toml::from_str(src).map_err(|e| format!("invalid space-weather scenario: {e}"))?;
            let (json, summary) = scn.run_json()?;
            let svg = minimal_svg(&summary);
            Ok(RunOutput {
                json,
                svg,
                summary,
                csv: None,
            })
        }
        ScenarioKind::OemInterop => {
            let scn: crate::oem::OemInteropScenario =
                toml::from_str(src).map_err(|e| format!("invalid oem-interop scenario: {e}"))?;
            let (json, summary) = scn.run_json()?;
            let svg = minimal_svg(&summary);
            Ok(RunOutput {
                json,
                svg,
                summary,
                csv: None,
            })
        }
        ScenarioKind::LaunchWindow => {
            let scn: crate::launch::LaunchWindowScenario =
                toml::from_str(src).map_err(|e| format!("invalid launch-window scenario: {e}"))?;
            let (json, summary) = scn.run_json()?;
            let svg = minimal_svg(&summary);
            Ok(RunOutput {
                json,
                svg,
                summary,
                csv: None,
            })
        }
        ScenarioKind::Reentry => {
            let scn: crate::reentry::ReentryScenario =
                toml::from_str(src).map_err(|e| format!("invalid reentry scenario: {e}"))?;
            let (json, summary) = scn.run_json()?;
            let svg = minimal_svg(&summary);
            Ok(RunOutput {
                json,
                svg,
                summary,
                csv: None,
            })
        }
        ScenarioKind::EoCoverage => {
            let scn: crate::eo_payload::EoCoverageScenario =
                toml::from_str(src).map_err(|e| format!("invalid eo-coverage scenario: {e}"))?;
            let (json, summary) = scn.run_json()?;
            let svg = minimal_svg(&summary);
            Ok(RunOutput {
                json,
                svg,
                summary,
                csv: None,
            })
        }
        ScenarioKind::SpacePacket => {
            let scn: crate::space_packet::SpacePacketScenario =
                toml::from_str(src).map_err(|e| format!("invalid space-packet scenario: {e}"))?;
            let (json, summary) = scn.run_json()?;
            let svg = minimal_svg(&summary);
            Ok(RunOutput {
                json,
                svg,
                summary,
                csv: None,
            })
        }
        ScenarioKind::AttitudeBudget => {
            let scn: crate::attitude_budget::AttitudeBudgetScenario = toml::from_str(src)
                .map_err(|e| format!("invalid attitude-budget scenario: {e}"))?;
            let (json, summary) = scn.run_json()?;
            let svg = minimal_svg(&summary);
            Ok(RunOutput {
                json,
                svg,
                summary,
                csv: None,
            })
        }
        ScenarioKind::Passes => {
            let scn: crate::passes::PassesScenario =
                toml::from_str(src).map_err(|e| format!("invalid passes scenario: {e}"))?;
            let (json, summary) = scn.run_json()?;
            let svg = minimal_svg(&summary);
            Ok(RunOutput {
                json,
                svg,
                summary,
                csv: None,
            })
        }
        ScenarioKind::LinkBudget => {
            let scn: crate::linkbudget::LinkBudgetScenario =
                toml::from_str(src).map_err(|e| format!("invalid link-budget scenario: {e}"))?;
            let (json, summary) = scn.run_json()?;
            let svg = minimal_svg(&summary);
            Ok(RunOutput {
                json,
                svg,
                summary,
                csv: None,
            })
        }
        ScenarioKind::LunarTimeBudget => {
            let scn: crate::lunar_time_budget_scenario::LunarTimeBudgetScenario =
                toml::from_str(src)
                    .map_err(|e| format!("invalid lunar-time-budget scenario: {e}"))?;
            let (json, summary) = scn.run_json()?;
            let svg = minimal_svg(&summary);
            // G11: publish the long-form (tau, term) budget table as a runtime artifact.
            // The array-valued fields previously reached consumers only as JSON arrays,
            // which is how a released table came to publish 23 of its 57 averaging times.
            let csv = Some(scn.to_csv()?);
            Ok(RunOutput {
                json,
                svg,
                summary,
                csv,
            })
        }
        ScenarioKind::RealtimeFrameEop => {
            let scn: crate::realtime_frame_eop::RealtimeFrameEopScenario = toml::from_str(src)
                .map_err(|e| format!("invalid realtime-frame-eop scenario: {e}"))?;
            let (json, summary, svg) = scn.run_output()?;
            // G4: publish the P4 Table 1 + Table 2 reproducibility CSV as a runtime
            // artifact, so a plain scenario run produces the file the paper cites (not
            // only the #[ignore] golden-regen test).
            let csv = Some(scn.to_csv()?);
            Ok(RunOutput {
                json,
                svg,
                summary,
                csv,
            })
        }
        ScenarioKind::HybridOpticalRf => {
            let scn: crate::hybrid_integrity::HybridOpticalRfScenario = toml::from_str(src)
                .map_err(|e| format!("invalid hybrid-optical-rf scenario: {e}"))?;
            let (json, summary, svg) = scn.run_output()?;
            Ok(RunOutput {
                json,
                svg,
                summary,
                csv: None,
            })
        }
        ScenarioKind::CislunarObservability => {
            let scn: crate::cislunar_observability::CislunarObservabilityScenario =
                toml::from_str(src)
                    .map_err(|e| format!("invalid cislunar-observability scenario: {e}"))?;
            let (json, summary, svg) = scn.run_output()?;
            Ok(RunOutput {
                json,
                svg,
                summary,
                csv: None,
            })
        }
        ScenarioKind::CislunarArcRecovery => {
            let scn: crate::cislunar_arc_recovery::CislunarArcRecoveryScenario =
                toml::from_str(src)
                    .map_err(|e| format!("invalid cislunar-arc-recovery scenario: {e}"))?;
            let (json, summary, svg) = scn.run_output()?;
            Ok(RunOutput {
                json,
                svg,
                summary,
                csv: None,
            })
        }
        ScenarioKind::EarthGnssLunar => {
            let scn: crate::earth_gnss_lunar::EarthGnssLunarScenario = toml::from_str(src)
                .map_err(|e| format!("invalid earth-gnss-lunar scenario: {e}"))?;
            let (json, summary, svg) = scn.run_output()?;
            Ok(RunOutput {
                json,
                svg,
                summary,
                csv: None,
            })
        }
        ScenarioKind::LunarBeacon => {
            let scn: crate::lunar_beacon::LunarBeaconScenario =
                toml::from_str(src).map_err(|e| format!("invalid lunar-beacon scenario: {e}"))?;
            let (json, summary, svg) = scn.run_output()?;
            Ok(RunOutput {
                json,
                svg,
                summary,
                csv: None,
            })
        }
        ScenarioKind::ConflictResilience => {
            let scn: crate::conflict_resilience::ConflictResilienceScenario =
                toml::from_str(src)
                    .map_err(|e| format!("invalid conflict-resilience scenario: {e}"))?;
            let (json, summary, svg) = scn.run_output()?;
            Ok(RunOutput {
                json,
                svg,
                summary,
                csv: None,
            })
        }
        ScenarioKind::LunarAttackSurface => {
            let scn: crate::attack_surface::LunarAttackSurfaceScenario = toml::from_str(src)
                .map_err(|e| format!("invalid lunar-attack-surface scenario: {e}"))?;
            let (json, summary, svg) = scn.run_output()?;
            Ok(RunOutput {
                json,
                svg,
                summary,
                csv: None,
            })
        }
        ScenarioKind::ApertureDutyCycle => {
            let scn: crate::aperture_duty::ApertureDutyCycleScenario = toml::from_str(src)
                .map_err(|e| format!("invalid aperture-duty-cycle scenario: {e}"))?;
            let (json, summary) = scn.run_json()?;
            let svg = minimal_svg(&summary);
            Ok(RunOutput {
                json,
                svg,
                summary,
                csv: None,
            })
        }
        ScenarioKind::TrackingLoop => {
            let scn: crate::tracking_loop::TrackingLoopScenario =
                toml::from_str(src).map_err(|e| format!("invalid tracking-loop scenario: {e}"))?;
            let (json, summary) = scn.run_json()?;
            let svg = minimal_svg(&summary);
            Ok(RunOutput {
                json,
                svg,
                summary,
                csv: None,
            })
        }
        ScenarioKind::AraimReferenceCheck => {
            let scn: crate::araim_reference::AraimReferenceCheckScenario = toml::from_str(src)
                .map_err(|e| format!("invalid araim-reference-check scenario: {e}"))?;
            let (json, summary) = scn.run_json()?;
            let svg = minimal_svg(&summary);
            Ok(RunOutput {
                json,
                svg,
                summary,
                csv: None,
            })
        }
        ScenarioKind::InsTrnCoast => {
            let scn: crate::inertial::coast::InsTrnCoastScenario =
                toml::from_str(src).map_err(|e| format!("invalid ins-trn-coast scenario: {e}"))?;
            let (json, summary) = scn.run_json()?;
            let svg = minimal_svg(&summary);
            Ok(RunOutput {
                json,
                svg,
                summary,
                csv: None,
            })
        }
        ScenarioKind::LunarLlrDatum => {
            let scn: crate::lunar_llr::LunarLlrDatumScenario = toml::from_str(src)
                .map_err(|e| format!("invalid lunar-llr-datum scenario: {e}"))?;
            let (json, summary) = scn.run_json()?;
            let svg = minimal_svg(&summary);
            Ok(RunOutput {
                json,
                svg,
                summary,
                csv: None,
            })
        }
        ScenarioKind::LunarFrameCampaign => {
            let scn: crate::lunar_frame_campaign::LunarFrameCampaignScenario = toml::from_str(src)
                .map_err(|e| format!("invalid lunar-frame-campaign scenario: {e}"))?;
            let (json, summary) = scn.run_json()?;
            let svg = minimal_svg(&summary);
            Ok(RunOutput {
                json,
                svg,
                summary,
                csv: None,
            })
        }
        ScenarioKind::LunarVlbiFim => {
            let scn: crate::lunar_vlbi_fim::LunarVlbiFimScenario =
                toml::from_str(src).map_err(|e| format!("invalid lunar-vlbi-fim scenario: {e}"))?;
            let (json, summary) = scn.run_json()?;
            let svg = minimal_svg(&summary);
            Ok(RunOutput {
                json,
                svg,
                summary,
                csv: None,
            })
        }
        ScenarioKind::LunarJamming => {
            let scn: crate::lunar_jamming::LunarJammingScenario =
                toml::from_str(src).map_err(|e| format!("invalid lunar-jamming scenario: {e}"))?;
            let (json, summary, svg) = scn.run_output()?;
            // The per-satellite J/S table is the result, so it is published as a runtime
            // CSV artifact too: the table a paper cites is then a file the engine wrote,
            // not a block a manuscript transcribed out of two separate link-budget runs.
            let csv = Some(scn.to_csv()?);
            Ok(RunOutput {
                json,
                svg,
                summary,
                csv,
            })
        }
        ScenarioKind::Clock => {
            let scn: crate::scenario::Scenario =
                toml::from_str(src).map_err(|e| format!("invalid scenario: {e}"))?;
            scn.time.validate()?;
            if scn.runs > 1 {
                // Monte Carlo ensemble: report confidence bands instead of one run.
                let r = crate::ensemble::run_ensemble(&scn);
                let q = &r.quantum;
                let c = &r.classical;
                let summary = format!(
                    "scenario {} | {} runs | quantum holdover {:.0}s [{:.0}-{:.0}] p95 {:.1}ns security {} | classical holdover {:.0}s [{:.0}-{:.0}] p95 {:.1}ns security {}",
                    &r.scenario_hash[..12], r.runs,
                    q.holdover_s.mean, q.holdover_s.p05, q.holdover_s.p95, q.timing_p95_ns.mean, integ(q.security),
                    c.holdover_s.mean, c.holdover_s.p05, c.holdover_s.p95, c.timing_p95_ns.mean, integ(c.security),
                );
                return Ok(RunOutput {
                    json: json_of_with_units(&r, crate::ensemble::UNITS)?,
                    svg: crate::ensemble::to_svg(&r),
                    summary,
                    csv: None,
                });
            }
            let r = crate::run::run(&scn);
            let summary = format!(
                "scenario {} | quantum holdover {:.0}s p95 {:.1}ns integrity {} security {} | classical holdover {:.0}s p95 {:.1}ns integrity {} security {}",
                &r.scenario_hash[..12],
                r.quantum.fom.holdover_s, r.quantum.fom.timing_p95_ns, integ(r.quantum.fom.integrity), integ(r.quantum.fom.security),
                r.classical.fom.holdover_s, r.classical.fom.timing_p95_ns, integ(r.classical.fom.integrity), integ(r.classical.fom.security),
            );
            Ok(RunOutput {
                json: json_of_with_units(&r, crate::report::UNITS)?,
                svg: crate::report::to_svg(&r),
                summary,
                csv: None,
            })
        }
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn scenario_kind_classifies_and_round_trips() {
        // Every built-in kind classifies to its variant and back to its string.
        for meta in list_scenario_kinds() {
            let src = format!("kind = \"{}\"\n", meta.name);
            let k = ScenarioKind::classify(&src).unwrap();
            assert_eq!(k.as_str(), meta.name, "round-trip for {}", meta.name);
        }
        // An ABSENT kind keeps the historical clock default — three bundled scenarios
        // carry no `kind` line and must keep running.
        assert_eq!(ScenarioKind::classify("").unwrap(), ScenarioKind::Clock);
        assert_eq!(
            ScenarioKind::classify("threshold_ns = 20.0\n").unwrap(),
            ScenarioKind::Clock
        );

        // An UNKNOWN kind is an ERROR, not a silent clock run. This used to return
        // ScenarioKind::Clock, so a one-character typo ran a clock-holdover simulation
        // and reported it as a successful run of the kind the caller asked for.
        let invented = ScenarioKind::classify("kind = \"frobnicate\"").unwrap_err();
        let msg = invented.to_string();
        assert!(
            msg.contains("unknown scenario kind") && msg.contains("frobnicate"),
            "an invented kind must be named back to the caller, got: {msg}"
        );
        assert!(
            !msg.contains("did you mean"),
            "an invented name is not a typo and must not earn a suggestion: {msg}"
        );

        // A TYPO earns the nearest built-in by name.
        let typo = ScenarioKind::classify("kind = \"lunar-vbli-fim\"")
            .unwrap_err()
            .to_string();
        assert!(
            typo.contains("did you mean \"lunar-vlbi-fim\""),
            "a transposition must be pointed at the real kind, got: {typo}"
        );

        // And the validator no longer calls such a document valid.
        let problems = validate_scenario("kind = \"lunar-vbli-fim\"\n");
        assert!(
            problems.iter().any(|p| p.contains("unknown scenario kind")),
            "validate_scenario must report an unknown kind, got: {problems:?}"
        );
    }

    #[test]
    fn list_scenario_kinds_covers_every_dispatch_variant() {
        let names: std::collections::HashSet<_> =
            list_scenario_kinds().iter().map(|m| m.name).collect();
        for k in [
            ScenarioKind::Clock,
            ScenarioKind::Inertial,
            ScenarioKind::Integrity,
            ScenarioKind::TimeTransfer,
            ScenarioKind::QuantumTimeTransfer,
            ScenarioKind::QuantumGnssFreeNav,
            ScenarioKind::QuantumAnomalyDetect,
            ScenarioKind::Hybrid,
            ScenarioKind::Fusion,
            ScenarioKind::HybridUkf,
            ScenarioKind::GnssIns,
            ScenarioKind::GnssSim,
            ScenarioKind::Jamming,
            ScenarioKind::Spoof,
            ScenarioKind::Sweep,
            ScenarioKind::SweepNd,
            ScenarioKind::Orbit,
            ScenarioKind::Ephemeris,
            ScenarioKind::LunarIntegrity,
            ScenarioKind::LunarTime,
            ScenarioKind::LunarVlbi,
            ScenarioKind::LunarCombination,
            ScenarioKind::LunarFrameRealise,
            ScenarioKind::LunarService,
            ScenarioKind::LunarDpnt,
            ScenarioKind::LunarInterop,
            ScenarioKind::GravityMap,
            ScenarioKind::Terrain,
            ScenarioKind::CombinedAltPnt,
            ScenarioKind::Pvt,
            ScenarioKind::MarsPnt,
        ] {
            assert!(
                names.contains(k.as_str()),
                "metadata missing for {}",
                k.as_str()
            );
        }
        // The JSON form parses and is non-empty.
        let j: serde_json::Value = serde_json::from_str(&list_scenario_kinds_json()).unwrap();
        assert!(j.as_array().unwrap().len() >= 16);
    }

    #[test]
    fn run_scenario_returns_a_structured_error_taxonomy() {
        // A malformed scenario yields a typed InvalidInput, not an opaque string.
        let err = run_scenario("kind = \"inertial\"\nthis is not valid toml = =").unwrap_err();
        assert!(matches!(err, KshanaError::InvalidInput(_)));
        // A valid scenario runs through the typed entry too.
        let out = run_scenario(include_str!("../scenarios/jamming-demo.toml")).unwrap();
        assert!(out.json.starts_with('{'));
    }

    #[test]
    fn jamming_pack_runs_through_the_scenario_trait() {
        // The trait is the real execution path for at least one built-in.
        let scn: crate::jamming::JammingScenario =
            toml::from_str(include_str!("../scenarios/jamming-demo.toml")).unwrap();
        let out = Scenario::run(&scn).unwrap();
        assert!(out.summary.contains("jamming"));
        assert!(out.svg.starts_with("<svg"));
    }

    #[test]
    fn dispatches_each_kind_and_emits_json_and_svg() {
        for src in [
            include_str!("../scenarios/clock-holdover.toml"),
            include_str!("../scenarios/clock-ensemble.toml"),
            include_str!("../scenarios/imu-deadreckoning.toml"),
            include_str!("../scenarios/timetransfer.toml"),
            include_str!("../scenarios/hybrid-pnt.toml"),
            include_str!("../scenarios/fusion-pnt.toml"),
            include_str!("../scenarios/gnss-ins.toml"),
            include_str!("../scenarios/orbit-gnss-challenged.toml"),
            include_str!("../scenarios/orbit-molniya.toml"),
            include_str!("../scenarios/orbit-multignss.toml"),
            include_str!("../scenarios/orbit-real-tle.toml"),
            include_str!("../scenarios/ephemeris.toml"),
            include_str!("../scenarios/sweep-clock-stability.toml"),
            include_str!("../scenarios/spoof-attack.toml"),
            include_str!("../scenarios/spoof-meaconing.toml"),
            include_str!("../scenarios/spoof-detect.toml"),
            include_str!("../scenarios/integrity-raim.toml"),
            include_str!("../scenarios/jamming-demo.toml"),
            include_str!("../scenarios/gnss-sim-raim.toml"),
            include_str!("../scenarios/gps-denied-gravity-nav.toml"),
            include_str!("../scenarios/terrain-nav.toml"),
            include_str!("../scenarios/terrain-slam.toml"),
            include_str!("../scenarios/combined-altpnt.toml"),
            include_str!("../scenarios/mars-pnt-lmo.toml"),
            include_str!("../scenarios/moonlight-service-volume.toml"),
            include_str!("../scenarios/lunar-differential-pnt.toml"),
            include_str!("../scenarios/lunar-interop-export.toml"),
        ] {
            let out = run_toml(src).expect("scenario runs");
            assert!(out.json.starts_with('{'));
            assert!(out.svg.starts_with("<svg"));
            assert!(!out.summary.is_empty());
        }
    }

    #[test]
    fn mars_pnt_kind_round_trips_through_the_dispatch() {
        // The new deep-space kind dispatches end-to-end through the shared entry point the
        // CLI/Python/wasm/MCP bindings all use: a `mars-pnt` TOML in, valid JSON + SVG out, with
        // the honest covariance figure of merit (and its explicit "not a certified protection
        // level" labelling) present.
        let out = run_toml(include_str!("../scenarios/mars-pnt-lmo.toml"))
            .expect("mars-pnt scenario dispatches");
        // Classifies to the new variant.
        assert_eq!(
            ScenarioKind::classify(include_str!("../scenarios/mars-pnt-lmo.toml")).unwrap(),
            ScenarioKind::MarsPnt
        );
        // Valid JSON carrying the FoM and the honesty note (covariance, not a certified PL).
        assert!(out.json.starts_with('{'));
        assert!(out.json.contains("\"scenario_hash\""));
        assert!(out.json.contains("converged_pos_rms_m"));
        assert!(out.json.contains("converged_pos_3sigma_m"));
        assert!(out
            .json
            .contains("NOT aviation-certified protection levels"));
        // Non-empty SVG and a one-line summary that names the kind and the FoM honestly.
        assert!(out.svg.starts_with("<svg"));
        assert!(out.summary.starts_with("mars-pnt "));
        assert!(out.summary.contains("not a certified PL"));
    }

    #[test]
    fn moonlight_service_volume_kind_round_trips_through_the_dispatch() {
        // The lunar service-volume kind dispatches end-to-end through the shared entry
        // point the CLI/Python/wasm/MCP bindings use, even with a bare kind line (every
        // field has a serde default): valid JSON + SVG out, with the honest
        // illustrative/MODELLED labelling present and the summary naming the kind.
        let src = "kind = \"moonlight-service-volume\"\n";
        assert_eq!(
            ScenarioKind::classify(src).unwrap(),
            ScenarioKind::LunarService
        );
        let out = run_toml(src).expect("moonlight-service-volume scenario dispatches");
        assert!(out.json.starts_with('{'));
        // Valid JSON that parses.
        let _: serde_json::Value = serde_json::from_str(&out.json).unwrap();
        // The honesty labels are carried in the JSON note.
        assert!(out.json.contains("not affiliated with ESA"));
        assert!(out.json.contains("MODELLED"));
        assert!(out.json.contains("coverage_pct"));
        // SVG and a one-line summary that names the kind.
        assert!(out.svg.starts_with("<svg"));
        assert!(out.summary.contains("moonlight-service-volume"));
    }

    #[test]
    fn lunar_jamming_kind_round_trips_through_the_dispatch_with_a_per_satellite_table() {
        // The lunar-native jamming kind dispatches end-to-end through the shared entry
        // point the CLI / Python / wasm / MCP bindings use, with a bare kind line (every
        // field is defaulted). What it must carry out is the per-satellite J/S table —
        // the thing a manuscript previously had to compose by hand from two separate
        // link-budget runs — plus the CSV artifact of the same table, the units block,
        // and the honesty labelling.
        let src = "kind = \"lunar-jamming\"\n[jammer]\npower_dbw = 10.0\nrange_m = 25000.0\n";
        assert_eq!(
            ScenarioKind::classify(src).unwrap(),
            ScenarioKind::LunarJamming
        );
        let out = run_toml(src).expect("lunar-jamming scenario dispatches");
        let v: serde_json::Value = serde_json::from_str(&out.json).unwrap();
        let links = v["links"].as_array().expect("a per-satellite link table");
        assert!(links.len() > 1, "a table, not a single collapsed number");
        for l in links {
            assert!(l["js_db"].is_number(), "every row carries its own J/S");
            assert!(l["sat"].is_number());
            assert!(l["cn0_effective_dbhz"].is_number());
        }
        // No central statistic stands in for the table: the aggregate lives beside it.
        assert!(v["fom"]["n_links"].as_u64().unwrap() as usize == links.len());
        assert!(v["units"]["links.js_db"]["unit"].as_str() == Some("dB"));
        assert!(v["units"]["links.js_db"]["provenance"].is_string());
        // …and the denial contour comes out through the same dispatch, carrying the
        // measured C/N0 distribution and a band, not one scalar. This source is the
        // documented mixed operating point (jammer 25 km, 10 dBW), so the band must
        // bracket it: that is the whole claim, checked on the surface a caller sees.
        let c = &v["denial_contour"];
        assert!(c["cn0_nominal"]["median_dbhz"].is_number());
        assert!(c["cn0_nominal"]["p05_dbhz"].is_number());
        assert!(c["cn0_nominal"]["p95_dbhz"].is_number());
        assert_eq!(
            c["cn0_nominal"]["n"].as_u64().unwrap() as usize,
            links.len(),
            "the distribution must be over the very rows the table carries"
        );
        assert_eq!(c["points"].as_array().unwrap().len(), 7);
        let b = &c["loss_of_lock"];
        let (lo, med, hi) = (
            b["standoff_p95_km"].as_f64().unwrap(),
            b["standoff_median_km"].as_f64().unwrap(),
            b["standoff_p05_km"].as_f64().unwrap(),
        );
        assert!(lo < 25.0 && 25.0 < hi, "the band must bracket 25 km");
        assert!(lo < med && med < hi);
        assert!(
            (hi - med - (med - lo)).abs() > 1e-6,
            "a band symmetric about the median contour would be a reparametrised sigma"
        );
        assert!(v["units"]["denial_contour.loss_of_lock.standoff_p05_km"]["unit"] == "km");
        assert!(v["units"]["denial_contour.cn0_nominal.stdev_dbhz"]["provenance"].is_string());
        // The table is also published as a CSV artifact, one row per link.
        let csv = out.csv.as_ref().expect("a CSV table artifact");
        assert_eq!(csv.lines().count(), links.len() + 1);
        assert!(out.svg.starts_with("<svg"));
        assert!(out.summary.contains("lunar-jamming"));
        assert!(out.json.contains("MODELLED"));
    }

    #[test]
    fn lunar_attack_surface_kind_round_trips_through_the_dispatch() {
        // The composed P1 attack-surface kind dispatches end-to-end through the shared
        // entry point the CLI/Python/wasm/MCP bindings use, with a bare kind line (every
        // field has a serde default reproducing the P1 baseline): valid JSON + SVG out,
        // carrying each composed sub-result, and a summary naming the kind. This is the
        // binary-reachability the P1 audit (G1/G2/G5/G6) requires — the analyses are no
        // longer library-only.
        let src = "kind = \"lunar-attack-surface\"\n";
        assert_eq!(
            ScenarioKind::classify(src).unwrap(),
            ScenarioKind::LunarAttackSurface
        );
        let out = run_toml(src).expect("lunar-attack-surface scenario dispatches");
        assert!(out.json.starts_with('{'));
        let v: serde_json::Value = serde_json::from_str(&out.json).unwrap();
        // Each composed analysis is present in the JSON.
        assert!(v.get("deficit_band_lo_db").is_some());
        assert!(v.get("standoff_curve").is_some());
        assert!(v.get("footprint_captured_fraction").is_some());
        assert!(v.get("spoof_captured").is_some());
        assert!(v.get("surface_transmitter_reach_m").is_some());
        assert!(v.get("nma_overhead_bps").is_some());
        // SVG and a one-line summary that names the kind.
        assert!(out.svg.starts_with("<svg"));
        assert!(out.summary.contains("lunar-attack-surface"));
    }

    #[test]
    fn lunar_differential_pnt_kind_round_trips_through_the_dispatch() {
        // The lunar differential-PNT kind dispatches end-to-end through the shared entry
        // point the CLI/Python/wasm/MCP bindings use, even with a bare kind line (every
        // field has a serde default): valid JSON + SVG out, with the honest
        // illustrative/MODELLED labelling present and the summary naming the kind.
        let src = "kind = \"lunar-differential-pnt\"\n";
        assert_eq!(
            ScenarioKind::classify(src).unwrap(),
            ScenarioKind::LunarDpnt
        );
        let out = run_toml(src).expect("lunar-differential-pnt scenario dispatches");
        assert!(out.json.starts_with('{'));
        // Valid JSON that parses.
        let _: serde_json::Value = serde_json::from_str(&out.json).unwrap();
        // The honesty labels are carried in the JSON note.
        assert!(out.json.contains("not affiliated with ESA"));
        assert!(out.json.contains("MODELLED"));
        assert!(out.json.contains("reduction_factor"));
        // SVG and a one-line summary that names the kind.
        assert!(out.svg.starts_with("<svg"));
        assert!(out.summary.contains("lunar-differential-pnt"));
    }

    #[test]
    fn lunar_interop_export_kind_round_trips_through_the_dispatch() {
        // The lunar interoperability-export kind dispatches end-to-end through the shared
        // entry point the CLI/Python/wasm/MCP bindings use, even with a bare kind line (every
        // field has a serde default): valid JSON + SVG out, naming the kind, with the lunar
        // REF_FRAME/TIME_SYSTEM and the MODELLED honesty label present.
        let src = "kind = \"lunar-interop-export\"\n";
        assert_eq!(
            ScenarioKind::classify(src).unwrap(),
            ScenarioKind::LunarInterop
        );
        let out = run_toml(src).expect("lunar-interop-export scenario dispatches");
        assert!(out.json.starts_with('{'));
        // Valid JSON that parses.
        let _: serde_json::Value = serde_json::from_str(&out.json).unwrap();
        // The lunar interchange tokens and honesty label are carried in the JSON.
        assert!(out.json.contains("MOON_ME"));
        assert!(out.json.contains("MODELLED"));
        assert!(out.json.contains("conformance"));
        // SVG and a one-line summary that names the kind.
        assert!(out.svg.starts_with("<svg"));
        assert!(out.summary.contains("lunar-interop-export"));
    }

    #[test]
    fn hybrid_ukf_kind_round_trips_through_the_dispatch() {
        // The 17-state hybrid quantum+classical UKF scenario dispatches end-to-end through the
        // shared entry point the CLI/Python/wasm/MCP bindings use: a `hybrid-ukf` TOML in, valid
        // JSON + SVG out, carrying the consistency oracle (NEES + innovation-whiteness) and the
        // explicit MODELLED / self-consistency-not-accuracy honesty labels.
        let src = include_str!("../scenarios/hybrid-ukf.toml");
        assert_eq!(
            ScenarioKind::classify(src).unwrap(),
            ScenarioKind::HybridUkf
        );
        let out = run_toml(src).expect("hybrid-ukf scenario dispatches");
        assert!(out.json.starts_with('{'));
        assert!(out.json.contains("\"scenario_hash\""));
        // The statistical oracle is present in the JSON…
        assert!(out.json.contains("nis_mean") && out.json.contains("nees_mean"));
        assert!(out.json.contains("nis_chi2_lower_95") && out.json.contains("nees_chi2_upper_95"));
        assert!(out.json.contains("\"consistent\""));
        // …and the honesty labelling is unmissable.
        assert!(out.json.contains("MODELLED SIMULATION"));
        assert!(out.json.contains("NOT a"));
        // Non-empty SVG and a one-line summary that names the kind and the honesty caveat.
        assert!(out.svg.starts_with("<svg"));
        assert!(out.summary.contains("hybrid-ukf"));
        assert!(out.summary.contains("MODELLED"));
        assert!(out.summary.contains("self-consistency, not accuracy"));
    }

    #[test]
    fn every_chart_carries_the_provenance_footer() {
        // A saved/downloaded chart must be self-identifying: every scenario kind's
        // SVG ends with the "Kshana v<ver> · <hash> · kshana.dev" footer, just
        // before the closing tag, so the image stands on its own.
        for src in [
            include_str!("../scenarios/clock-holdover.toml"),
            include_str!("../scenarios/imu-deadreckoning.toml"),
            include_str!("../scenarios/timetransfer.toml"),
            include_str!("../scenarios/hybrid-pnt.toml"),
            include_str!("../scenarios/gnss-ins.toml"),
            include_str!("../scenarios/integrity-raim.toml"),
            include_str!("../scenarios/jamming-demo.toml"),
            include_str!("../scenarios/spoof-attack.toml"),
            include_str!("../scenarios/spoof-detect.toml"),
            include_str!("../scenarios/sweep-clock-stability.toml"),
            include_str!("../scenarios/gnss-sim-raim.toml"),
            include_str!("../scenarios/orbit-gnss-challenged.toml"),
            include_str!("../scenarios/ephemeris.toml"),
        ] {
            let out = run_toml(src).expect("scenario runs");
            assert!(out.svg.contains("\u{00b7} kshana.dev"), "footer present");
            assert!(out.svg.contains("Kshana v"), "version stamped");
            assert!(
                out.svg.contains("\u{00b7} scenario "),
                "hash labelled as scenario"
            );
            // The footer is inside the chart, just before the closing tag.
            assert!(out.svg.trim_end().ends_with("</svg>"));
            let foot = out.svg.rfind("kshana.dev").unwrap();
            let close = out.svg.rfind("</svg>").unwrap();
            assert!(foot < close, "footer sits inside the svg");
            // Exactly one footer (no duplication from a per-chart + central stamp).
            assert_eq!(out.svg.matches("kshana.dev").count(), 1, "single footer");
        }
    }

    #[test]
    fn integrity_scenario_reports_an_availability_map() {
        let out = run_toml(include_str!("../scenarios/integrity-raim.toml"))
            .expect("integrity scenario runs");
        assert!(out.summary.contains("epochs available"));
        // JSON carries the per-epoch availability map and the alert limits.
        assert!(out.json.contains("samples_available"));
        assert!(out.json.contains("\"epochs\""));
        assert!(out.json.contains("hpl_m") && out.json.contains("vpl_m"));
        // The vertical Stanford integrity diagram is exported end-to-end, and the
        // summary reports its integrity-event / HMI counts.
        assert!(out.json.contains("\"stanford\"") && out.json.contains("alert_limit_m"));
        assert!(out.json.contains("region") && out.json.contains("error_m"));
        assert!(out.summary.contains("Stanford(V)") && out.summary.contains("HMI"));
        // The chart is a self-contained protection-level/availability SVG.
        assert!(out.svg.starts_with("<svg") && out.svg.contains("protection level"));
    }

    #[test]
    fn rinex_constellation_scenario_runs_end_to_end() {
        // A real RINEX 3 broadcast-ephemeris block drives an orbit scenario from
        // the same entry point the CLI/Python/wasm bindings use: RINEX in, PNT
        // geometry out.
        let out = run_toml(include_str!("../scenarios/orbit-rinex.toml"))
            .expect("rinex constellation scenario runs");
        assert!(out.summary.contains("GNSS-nominal"));
        assert!(out.json.contains("\"geometry\"") && out.json.contains("best_pdop"));
        assert!(out.svg.starts_with("<svg"));
    }

    #[test]
    fn invalid_scenario_is_an_error() {
        assert!(run_toml("kind = \"orbit\"\nnot_valid = true").is_err());
    }

    #[test]
    fn html_report_is_self_contained_and_escaped() {
        let out = run_toml(include_str!("../scenarios/clock-holdover.toml")).unwrap();
        let html = out.html_report();
        assert!(html.starts_with("<!doctype html>"));
        assert!(html.contains("<img alt=\"Result chart\" src=\"data:image/svg+xml,"));
        assert!(html.contains("Kshana"));
        assert!(html.trim_end().ends_with("</html>"));
        // The embedded JSON must be HTML-escaped (no raw quotes from the document).
        assert!(html.contains("&quot;"));
        // The chart is an inert data-URI image, not inline markup that could execute.
        assert!(!html.contains("<svg"));
        // The per-FoM validation-tier table renders, with the MODELLED tag inline
        // next to the holdover figure of merit (surfaced from the matrix).
        assert!(html.contains("Figures of merit"));
        assert!(html.contains("Holdover"));
        assert!(html.contains("MODELLED"));
        assert!(html.contains("Validation"));
    }

    #[test]
    fn html_report_is_byte_identical_without_meta() {
        // Back-compat: a result with no study metadata renders the EXACT current
        // title and footer strings (no new markup, no timestamp).
        let out = run_toml(include_str!("../scenarios/clock-holdover.toml")).unwrap();
        let html = out.html_report();
        assert!(html.contains("<title>Kshana \u{2014} scenario result</title>"));
        assert!(html.contains("Generated by Kshana "));
        // No generation-stamp line is emitted when meta is absent.
        assert!(!html.contains("Study generated"));
    }

    #[test]
    fn html_report_uses_study_title_and_generation_stamp_from_meta() {
        // When the embedded JSON carries study metadata, the title uses the study
        // title and the footer shows the caller-supplied UTC stamp.
        let base = run_toml(include_str!("../scenarios/clock-holdover.toml")).unwrap();
        // Inject a meta block into the result JSON the way the engine would, so the
        // report surfaces it without RunOutput growing a field or reading a clock.
        let json = base.json.replacen(
            "{\n",
            "{\n  \"meta\": {\n    \"study_title\": \"Holdover Study A\",\n    \"generated_utc\": \"2026-06-23T00:00:00Z\"\n  },\n",
            1,
        );
        let out = RunOutput {
            json,
            svg: base.svg.clone(),
            summary: base.summary.clone(),
            csv: None,
        };
        let html = out.html_report();
        // Study title drives the <title>; the default title string is gone.
        assert!(html.contains("<title>Holdover Study A \u{2014} Kshana</title>"));
        assert!(!html.contains("<title>Kshana \u{2014} scenario result</title>"));
        // The caller-supplied stamp surfaces in the footer.
        assert!(html.contains("Study generated 2026-06-23T00:00:00Z"));
        // Still self-contained and escaped.
        assert!(html.starts_with("<!doctype html>"));
        assert!(html.trim_end().ends_with("</html>"));
    }

    #[test]
    fn html_report_title_only_meta_keeps_default_footer() {
        // study_title without a generated_utc: custom title, but no stamp line.
        let base = run_toml(include_str!("../scenarios/clock-holdover.toml")).unwrap();
        let json = base.json.replacen(
            "{\n",
            "{\n  \"meta\": {\n    \"study_title\": \"Only A Title\"\n  },\n",
            1,
        );
        let out = RunOutput {
            json,
            svg: base.svg.clone(),
            summary: base.summary.clone(),
            csv: None,
        };
        let html = out.html_report();
        assert!(html.contains("<title>Only A Title \u{2014} Kshana</title>"));
        assert!(!html.contains("Study generated"));
    }

    #[test]
    fn with_study_meta_inserts_a_parseable_meta_block() {
        let base = run_toml(include_str!("../scenarios/clock-holdover.toml")).unwrap();
        let meta = crate::report::study_meta_with_title("My Study", "2026-06-23T00:00:00Z");
        let withed = with_study_meta(&base.json, &meta);
        // The result is still a single valid JSON object.
        let v: serde_json::Value = serde_json::from_str(&withed).unwrap();
        assert_eq!(v["meta"]["study_title"], "My Study");
        assert_eq!(v["meta"]["generated_utc"], "2026-06-23T00:00:00Z");
        // Every original top-level key survives unchanged.
        assert_eq!(
            v["scenario_hash"],
            serde_json::from_str::<serde_json::Value>(&base.json).unwrap()["scenario_hash"]
        );
        // And the report surfaces it (title + stamp), end to end.
        let out = RunOutput {
            json: withed,
            svg: base.svg.clone(),
            summary: base.summary.clone(),
            csv: None,
        };
        let html = out.html_report();
        assert!(html.contains("<title>My Study \u{2014} Kshana</title>"));
        assert!(html.contains("Study generated 2026-06-23T00:00:00Z"));
    }

    #[test]
    fn fom_tier_table_is_empty_for_a_no_clock_fom_result() {
        // A RAIM/integrity report has no clock-style FoM block, so the tier table is
        // omitted entirely (those reports stay unchanged).
        let out = run_toml(include_str!("../scenarios/integrity-raim.toml")).unwrap();
        assert!(fom_tier_table(&out.json).is_empty());
    }

    #[test]
    fn html_escape_handles_the_five_characters() {
        assert_eq!(
            html_escape("<a href=\"x\">&'</a>"),
            "&lt;a href=&quot;x&quot;&gt;&amp;&#39;&lt;/a&gt;"
        );
    }

    #[test]
    fn inject_eop_inlines_a_real_finals_body_and_still_runs() {
        // The `--eop <file>` path: a real IERS finals2000A row is folded into the
        // ephemeris scenario, the merged TOML re-parses with the field set, and the
        // run still succeeds — i.e. the data travels in the self-contained scenario.
        let row = "22 1 1 59580.00 I  0.054644 0.000026  0.276986 0.000032  I-0.1104988 0.0000023 -0.0267 0.0022  I     0.095    0.060    -0.250    0.299  0.054574  0.276983 -0.1105197     0.059    -0.259  ";
        let src = include_str!("../scenarios/ephemeris.toml");
        let merged = inject_eop(src, row).expect("inject");
        let scn: crate::ephemeris::EphemerisScenario =
            toml::from_str(&merged).expect("merged TOML re-parses");
        assert_eq!(scn.eop_finals2000a.as_deref(), Some(row));
        // Top-level key serialised ahead of any [section] header (valid TOML).
        run_toml(&merged).expect("scenario with inlined EOP runs");
        // A non-TOML input is a clean error, not a panic.
        assert!(inject_eop("=$ not toml", row).is_err());
    }

    #[test]
    fn aperture_duty_cycle_kind_round_trips_through_the_dispatch() {
        // The scheduling kind dispatches end-to-end through the shared entry point the
        // CLI/Python/wasm/MCP bindings all use, with a bare kind line (every field has a
        // serde default, including the bundled illustrative contact plan): valid JSON +
        // SVG out, the duty numbers and per-session outage present, and the arbitration
        // policy named in both the document and the summary — a duty figure quoted
        // without its policy is not reproducible.
        let src = "kind = \"aperture-duty-cycle\"\n";
        assert_eq!(
            ScenarioKind::classify(src).unwrap(),
            ScenarioKind::ApertureDutyCycle
        );
        let out = run_toml(src).expect("aperture-duty-cycle scenario dispatches");
        assert!(out.json.starts_with('{'));
        let v: serde_json::Value = serde_json::from_str(&out.json).unwrap();
        assert_eq!(v["kind"], "aperture-duty-cycle");
        assert!(v.get("navigation_duty").is_some());
        assert!(v.get("communications_duty").is_some());
        assert!(v["sessions"][0].get("outage_s").is_some());
        assert_eq!(v["arbitration_policy"], "navigation-priority");
        assert!(v["arbitration_policy_definition"].is_string());
        assert!(v["label"].as_str().unwrap().contains("MODELLED"));
        assert!(out.svg.starts_with("<svg"));
        assert!(out.summary.contains("aperture-duty-cycle"));
        assert!(out.summary.contains("navigation-priority"));
        // The bundled TOML file is the same run.
        let file = run_toml(include_str!("../scenarios/aperture-duty-cycle.toml"))
            .expect("the bundled contact plan runs");
        assert_eq!(file.json, out.json);
    }

    #[test]
    fn tracking_loop_kind_round_trips_through_the_dispatch() {
        // The tracking-loop kind dispatches end-to-end through the shared entry point the
        // CLI/Python/wasm/MCP bindings all use, from a bare kind line. The acceptance
        // contract travels with it: BOTH denial radii are present and their difference is
        // a named field, so the loop-dynamics answer is reported alongside the existing
        // power-ratio one rather than silently replacing it.
        let src = "kind = \"tracking-loop\"\n";
        assert_eq!(
            ScenarioKind::classify(src).unwrap(),
            ScenarioKind::TrackingLoop
        );
        let out = run_toml(src).expect("tracking-loop scenario dispatches");
        assert!(out.json.starts_with('{'));
        let v: serde_json::Value = serde_json::from_str(&out.json).unwrap();
        assert_eq!(v["kind"], "tracking-loop");
        let d = &v["denial"];
        assert!(d["denial_radius_threshold_km"].as_f64().is_some());
        assert!(d["denial_radius_loop_dynamics_km"].as_f64().is_some());
        assert!(d["denial_radius_delta_km"].as_f64().is_some());
        assert!(d["denial_radius_delta_definition"].is_string());
        assert!(v["thresholds"]["hysteresis_db"].as_f64().is_some());
        assert!(v["lock_history"]["declared_loss_of_lock_s"]
            .as_f64()
            .is_some());
        assert!(v["spoof_pull_in"]["max_code_slew_chips_per_s"]
            .as_f64()
            .is_some());
        assert!(v["units"]["denial.denial_radius_delta_km"]["provenance"].is_string());
        assert!(v["label"].as_str().unwrap().contains("MODELLED"));
        assert!(out.svg.starts_with("<svg"));
        assert!(out.summary.contains("tracking-loop"));
        // The bundled TOML file is the same run.
        let file = run_toml(include_str!("../scenarios/tracking-loop.toml"))
            .expect("the bundled tracking-loop scenario runs");
        assert_eq!(file.json, out.json);
    }

    /// The engine-flow diagram states how many figures of merit the engine scores. Pin
    /// that number to [`FOM_LABELS`], which is the set the report and the tier lookup
    /// both read, so the picture cannot drift from the engine.
    ///
    /// It already had. The diagram, its committed SVG and the README's inline copy all
    /// said "the 6 figures of merit" while `FoMScores` carried seven — `timing_p95_ns`
    /// was added and the figure was never revisited. Nothing caught it: every other
    /// diagram has a doc-sync guard, and these two (engine-flow, distribution) had none
    /// since June. A published figure that contradicts the code is worse than no figure,
    /// because a reader has no reason to doubt it.
    ///
    /// The SVG is checked separately from the prose because mermaid splits a label into
    /// one element per word — the count lands in its own `<tspan>`, so no phrase search
    /// over the rendered file can ever see it. That is precisely why this went unnoticed.
    #[test]
    fn the_engine_flow_diagram_states_the_live_figure_of_merit_count() {
        let n = FOM_LABELS.len();
        assert!(
            n >= 5,
            "FOM_LABELS collapsed to {n} — the guard would be vacuous"
        );

        let phrase = format!("vs the {n} figures of merit");
        for (name, body) in [
            (
                "docs/diagrams/engine-flow.mmd",
                include_str!("../docs/diagrams/engine-flow.mmd"),
            ),
            ("README.md", include_str!("../README.md")),
        ] {
            assert!(
                body.contains(&phrase),
                "{name} does not say {phrase:?}; the engine scores {n} figures of merit                  (FOM_LABELS). Fix the .mmd AND the README's inline mermaid block AND the                  committed SVG, then re-render the PNG with tools/render-diagram.sh — the                  README embeds the PNG, not the source."
            );
        }

        // The rendered SVG: mermaid emits the number as its own tspan, so look for the
        // digit as a standalone text node rather than inside the sentence.
        let svg = include_str!("../docs/assets/diagrams/engine-flow.svg");
        assert!(
            svg.contains("> figures<") && svg.contains("> merit<"),
            "the engine-flow SVG no longer splits the label word-per-word; this guard's              assumption about the rendering changed, so re-derive it rather than delete it"
        );
        assert!(
            svg.contains(&format!("> {n}</tspan>")),
            "the committed engine-flow SVG does not carry {n} as a standalone tspan — the              picture a reader sees still states the old count"
        );
    }
}
