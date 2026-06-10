// SPDX-License-Identifier: Apache-2.0
//! Scenario dispatch shared by the CLI and the language bindings.
//!
//! [`run_toml`] parses a scenario from a TOML string, dispatches on its `kind`,
//! runs the matching pack, and returns the result as pretty JSON together with an
//! SVG chart and a one-line summary. The CLI, the Python binding, and the
//! WebAssembly binding all go through this one entry point so they never drift.

use crate::scenario::GnssState;
use serde::Deserialize;
use sha2::{Digest, Sha256};

/// The outputs of a scenario run: the result document, an SVG chart, and a
/// human-readable one-line summary.
#[derive(Clone, Debug)]
pub struct RunOutput {
    pub json: String,
    pub svg: String,
    pub summary: String,
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

/// A stable 12-char fingerprint of the scenario source, for charts whose result
/// document does not carry a `scenario_hash` (e.g. the integrity/lunar reports).
fn src_fingerprint(src: &str) -> String {
    let mut h = Sha256::new();
    h.update(src.as_bytes());
    hex::encode(h.finalize()).chars().take(12).collect()
}

impl RunOutput {
    /// Render a self-contained, branded HTML scorecard: the one-line summary, the
    /// chart (as an inert image), and the full JSON result.
    pub fn html_report(&self) -> String {
        format!(
            "<!doctype html>\n<html lang=\"en\">\n<head>\n<meta charset=\"utf-8\"/>\n\
             <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\"/>\n\
             <title>Kshana — scenario result</title>\n<style>\n\
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
             footer{{margin-top:2rem;padding-top:1rem;border-top:1px solid #8884;font-size:.85rem;opacity:.75}}\
             </style>\n</head>\n<body>\n\
             <p class=\"eyebrow\">क्षण · the precise instant</p>\n\
             <h1>Kshana</h1>\n\
             <p class=\"tag\">Hybrid quantum / classical PNT performance scorecard</p>\n\
             <p class=\"summary\">{summary}</p>\n\
             <div class=\"chart\"><img alt=\"Result chart\" src=\"{chart}\"/></div>\n\
             <details><summary>Full result (JSON)</summary><pre>{json}</pre></details>\n\
             <footer>Generated by Kshana {version}. Reproducible from scenario + seed + engine version. \
             Free and open source (Apache-2.0) — <a href=\"https://github.com/AshfordeOU/kshana\">source &amp; docs</a>.</footer>\n\
             </body>\n</html>\n",
            summary = html_escape(&self.summary),
            chart = svg_data_uri(&self.svg),
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

fn json_of<T: serde::Serialize>(v: &T) -> String {
    serde_json::to_string_pretty(v).expect("result serialises")
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
    Hybrid,
    Fusion,
    GnssIns,
    GnssSim,
    Jamming,
    Spoof,
    SpoofDetect,
    Sweep,
    SweepNd,
    Orbit,
    LunarIntegrity,
    GravityMap,
    Terrain,
    CombinedAltPnt,
}

impl ScenarioKind {
    /// The canonical `kind` string for this variant.
    pub fn as_str(self) -> &'static str {
        match self {
            ScenarioKind::Clock => "clock",
            ScenarioKind::Inertial => "inertial",
            ScenarioKind::Integrity => "integrity",
            ScenarioKind::TimeTransfer => "timetransfer",
            ScenarioKind::Hybrid => "hybrid",
            ScenarioKind::Fusion => "fusion",
            ScenarioKind::GnssIns => "gnss-ins",
            ScenarioKind::GnssSim => "gnss-sim",
            ScenarioKind::Jamming => "jamming",
            ScenarioKind::Spoof => "spoof",
            ScenarioKind::SpoofDetect => "spoof-detect",
            ScenarioKind::Sweep => "sweep",
            ScenarioKind::SweepNd => "sweep-nd",
            ScenarioKind::Orbit => "orbit",
            ScenarioKind::LunarIntegrity => "lunar-integrity",
            ScenarioKind::GravityMap => "gravity-map",
            ScenarioKind::Terrain => "terrain-nav",
            ScenarioKind::CombinedAltPnt => "combined-altpnt",
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
            "hybrid" => ScenarioKind::Hybrid,
            "fusion" => ScenarioKind::Fusion,
            "gnss-ins" => ScenarioKind::GnssIns,
            "gnss-sim" => ScenarioKind::GnssSim,
            "jamming" => ScenarioKind::Jamming,
            "spoof" => ScenarioKind::Spoof,
            "spoof-detect" => ScenarioKind::SpoofDetect,
            "sweep" => ScenarioKind::Sweep,
            "sweep-nd" => ScenarioKind::SweepNd,
            "orbit" => ScenarioKind::Orbit,
            "lunar-integrity" => ScenarioKind::LunarIntegrity,
            "gravity-map" => ScenarioKind::GravityMap,
            "terrain-nav" => ScenarioKind::Terrain,
            "combined-altpnt" => ScenarioKind::CombinedAltPnt,
            // Empty or unknown ⇒ the clock pack (historical default).
            _ => ScenarioKind::Clock,
        })
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

/// List every built-in scenario kind with its metadata. Bindings expose this so a
/// caller can discover the packs and their fields without reading the source.
pub fn list_scenario_kinds() -> Vec<ScenarioMeta> {
    vec![
        ScenarioMeta { name: "clock", description: "Clock holdover vs spec; optional Monte-Carlo ensemble (runs > 1).", required_fields: &["threshold_ns", "time", "gnss", "clock_quantum", "clock_classical"], optional_fields: &["seed", "runs"] },
        ScenarioMeta { name: "inertial", description: "1-DOF inertial dead-reckoning during a GNSS outage.", required_fields: &["threshold_m", "time", "gnss", "accel_quantum", "accel_classical"], optional_fields: &["seed", "runs"] },
        ScenarioMeta { name: "orbit", description: "GNSS availability + DOP from an orbital constellation (Walker / TLE / RINEX).", required_fields: &["threshold_ns", "time", "user", "constellation", "clock_quantum", "clock_classical"], optional_fields: &["mask_deg", "sigma_uere_m", "seed"] },
        ScenarioMeta { name: "integrity", description: "Snapshot / solution-separation / ARAIM RAIM with HPL/VPL and a Stanford diagram.", required_fields: &["time", "user", "constellation"], optional_fields: &["mask_deg", "sigma_uere_m", "p_fa", "p_md"] },
        ScenarioMeta { name: "lunar-integrity", description: "Lunar south-pole ARAIM protection-level pass vs a representative LunaNet relay set.", required_fields: &[], optional_fields: &["step_s", "duration_s", "alert_limit_m", "p_hmi"] },
        ScenarioMeta { name: "timetransfer", description: "Optical vs RF two-way time/frequency transfer.", required_fields: &["time", "optical", "rf"], optional_fields: &["seed"] },
        ScenarioMeta { name: "hybrid", description: "Hybrid PNT capstone: clock + IMU + time-transfer aiding.", required_fields: &["timing_spec_ns", "position_spec_m", "time", "gnss", "clock_quantum", "clock_classical", "accel_quantum", "accel_classical"], optional_fields: &["resync", "seed"] },
        ScenarioMeta { name: "fusion", description: "Joint Kalman sensor-fusion PNT over the same hybrid inputs.", required_fields: &["timing_spec_ns", "position_spec_m", "time", "gnss", "clock_quantum", "clock_classical", "accel_quantum", "accel_classical"], optional_fields: &["resync", "seed"] },
        ScenarioMeta { name: "gnss-ins", description: "Loosely- and tightly-coupled GNSS/INS error-state EKF.", required_fields: &["time", "gnss", "imu_quantum", "imu_classical"], optional_fields: &["seed", "threshold_m", "fix_interval_s", "sigma_pos_m", "sigma_vel_mps", "lat_deg", "lon_deg", "alt_m"] },
        ScenarioMeta { name: "gnss-sim", description: "Measurement-domain pseudorange simulation (Klobuchar iono, Saastamoinen/Niell tropo) + RAIM.", required_fields: &["seed", "time", "receiver", "constellation"], optional_fields: &["iono", "tropo", "mask_deg", "noise_sigma_m", "multipath_m", "sat_clock_rms_m", "uere_m", "p_fa", "p_md", "alert_limit_h_m", "alert_limit_v_m"] },
        ScenarioMeta { name: "jamming", description: "Link-budget jamming: J/S → effective C/N₀ → loss of lock.", required_fields: &["seed", "time", "receiver", "constellation"], optional_fields: &["jammer", "mask_deg", "tracking_threshold_dbhz", "degraded_margin_db", "signal_power_dbw", "temp_k", "freq_hz", "chip_rate_hz"] },
        ScenarioMeta { name: "spoof", description: "Stochastic time-spoof detector (Neyman–Pearson / χ²₁) with Monte-Carlo P_fa/P_md.", required_fields: &["threshold_ns", "time", "attack", "clock_quantum", "clock_classical"], optional_fields: &[] },
        ScenarioMeta { name: "spoof-detect", description: "Combined RF/measurement spoof detector (multi-SV RAIM-consistency + AGC + SQM, fused) vs a parameterised attack (power advantage, carrier-phase alignment, time/position push; TEXBAT-style).", required_fields: &["attack"], optional_fields: &["satellites", "detector"] },
        ScenarioMeta { name: "sweep", description: "1-D trade-study sweep over a clock-pack parameter.", required_fields: &["parameter", "metric", "start", "stop", "steps", "base"], optional_fields: &["scale"] },
        ScenarioMeta { name: "sweep-nd", description: "Generic N-D sweep over any pack via dotted TOML keys / JSON metric paths.", required_fields: &["base", "axes", "metrics"], optional_fields: &[] },
        ScenarioMeta { name: "gravity-map", description: "GPS-denied gravity-map-matching navigation: a cold-atom gravimeter recovers a constant INS drift from the gravity-anomaly sequence it flies through.", required_fields: &["nmax", "start_lat_deg", "start_lon_deg", "step_lat_deg", "step_lon_deg", "waypoints", "drift_lat_deg", "drift_lon_deg", "gravimeter_asd", "averaging_time_s", "map_sigma_mgal", "search_half_deg", "search_step_deg"], optional_fields: &["coeffs", "mascons", "refine_stages", "refine_factor", "noise_seed"] },
        ScenarioMeta { name: "terrain-nav", description: "GPS-denied terrain-referenced navigation (TERCOM/SITAN): a radar/baro altimeter matches the ground-elevation profile against an SRTM-style DEM to recover the INS drift.", required_fields: &["dem_seed", "start_lat_deg", "start_lon_deg", "step_lat_deg", "step_lon_deg", "waypoints", "drift_lat_deg", "drift_lon_deg", "altimeter_sigma_m", "map_sigma_m", "search_half_deg", "search_step_deg"], optional_fields: &["refine_stages", "refine_factor", "noise_seed"] },
        ScenarioMeta { name: "combined-altpnt", description: "GPS-denied combined gravity + magnetic + terrain navigator: three scalar field channels fused per waypoint for a sharper (lower-CRLB) drift fix than any single field.", required_fields: &["start_lat_deg", "start_lon_deg", "step_lat_deg", "step_lon_deg", "waypoints", "drift_lat_deg", "drift_lon_deg", "search_half_deg", "search_step_deg", "nmax", "gravity_sigma_mgal", "igrf_year", "magnetic_sigma_nt", "dem_seed", "terrain_sigma_m"], optional_fields: &["coeffs", "mascons", "magnetic_mascons", "igrf_alt_km", "refine_stages", "refine_factor", "noise_seed"] },
    ]
}

/// The built-in scenario kinds and their metadata as a JSON array — the form the
/// language bindings expose for programmatic introspection.
pub fn list_scenario_kinds_json() -> String {
    json_of(&list_scenario_kinds())
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
            json: json_of(&r),
            svg: crate::jamming::to_svg(&r),
            summary,
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

/// The dispatch itself, before the chart is provenance-stamped.
fn run_toml_inner(src: &str) -> Result<RunOutput, String> {
    match ScenarioKind::classify(src).map_err(|e| e.to_string())? {
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
                json: json_of(&r),
                svg: crate::inertial::to_svg(&r),
                summary,
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
                json: json_of(&report),
                svg: crate::raim::availability_svg(&report),
                summary,
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
                json: json_of(&report),
                svg: crate::lunar::lunar_report_svg(&report),
                summary,
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
                json: json_of(&r),
                svg: crate::timetransfer::to_svg(&r),
                summary,
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
                json: json_of(&r),
                svg: crate::hybrid::to_svg(&r),
                summary,
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
                json: json_of(&r),
                svg: crate::hybrid::to_svg(&r),
                summary,
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
                json: json_of(&r),
                svg: crate::fusion::pack::to_svg(&r),
                summary,
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
                json: json_of(&r),
                svg: crate::gnss_sim::to_svg(&r, alert_h, alert_v),
                summary,
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
                json: json_of(&r),
                svg: crate::spoof::to_svg(&r),
                summary,
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
                json: json_of(&r),
                svg: crate::spoof_detect::to_svg(&r),
                summary,
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
                json: json_of(&r),
                svg: crate::sweep::to_svg(&r),
                summary,
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
                json: json_of(&r),
                svg: crate::sweep::generic_to_svg(&r),
                summary,
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
                json: json_of(&OrbitOutput { run: &r, geometry }),
                svg: crate::report::to_svg(&r),
                summary,
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
                json: json_of(&out),
                svg: crate::altpnt::terrain::gravity_nav_svg(
                    r.free_inertial_drift_m,
                    r.map_matched_error_m,
                ),
                summary,
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
                json: json_of(&r),
                svg: crate::altpnt::terrain::terrain_nav_svg(&r),
                summary,
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
                json: json_of(&r),
                svg: crate::altpnt::terrain::combined_altpnt_svg(&r),
                summary,
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
                    json: json_of(&r),
                    svg: crate::ensemble::to_svg(&r),
                    summary,
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
                json: json_of(&r),
                svg: crate::report::to_svg(&r),
                summary,
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
        // An empty or unknown kind falls back to the clock pack (historical default).
        assert_eq!(ScenarioKind::classify("").unwrap(), ScenarioKind::Clock);
        assert_eq!(
            ScenarioKind::classify("kind = \"frobnicate\"").unwrap(),
            ScenarioKind::Clock
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
            ScenarioKind::Hybrid,
            ScenarioKind::Fusion,
            ScenarioKind::GnssIns,
            ScenarioKind::GnssSim,
            ScenarioKind::Jamming,
            ScenarioKind::Spoof,
            ScenarioKind::Sweep,
            ScenarioKind::SweepNd,
            ScenarioKind::Orbit,
            ScenarioKind::LunarIntegrity,
            ScenarioKind::GravityMap,
            ScenarioKind::Terrain,
            ScenarioKind::CombinedAltPnt,
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
            include_str!("../scenarios/sweep-clock-stability.toml"),
            include_str!("../scenarios/spoof-attack.toml"),
            include_str!("../scenarios/spoof-meaconing.toml"),
            include_str!("../scenarios/spoof-detect.toml"),
            include_str!("../scenarios/integrity-raim.toml"),
            include_str!("../scenarios/jamming-demo.toml"),
            include_str!("../scenarios/gnss-sim-raim.toml"),
            include_str!("../scenarios/gps-denied-gravity-nav.toml"),
            include_str!("../scenarios/terrain-nav.toml"),
            include_str!("../scenarios/combined-altpnt.toml"),
        ] {
            let out = run_toml(src).expect("scenario runs");
            assert!(out.json.starts_with('{'));
            assert!(out.svg.starts_with("<svg"));
            assert!(!out.summary.is_empty());
        }
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
    }

    #[test]
    fn html_escape_handles_the_five_characters() {
        assert_eq!(
            html_escape("<a href=\"x\">&'</a>"),
            "&lt;a href=&quot;x&quot;&gt;&amp;&#39;&lt;/a&gt;"
        );
    }
}
