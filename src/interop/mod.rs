// SPDX-License-Identifier: AGPL-3.0-only
//! **Interoperability exports: a scenario's geometry in the formats other tools read.**
//!
//! A run already writes a result document, a chart and a report. This module writes the
//! same scenario's *geometry* for the visualisation and mission-analysis tools people
//! already use, so a Kshana scenario can be looked at on a globe or loaded into a
//! flight-dynamics package without a hand-written converter:
//!
//! | Format | Reader | Module |
//! |---|---|---|
//! | CZML (Cesium Language, a JSON stream of time-tagged packets) | CesiumJS | [`czml`] |
//! | KML (Keyhole Markup Language, Open Geospatial Consortium 2.2) | Google Earth, most geographic information system (GIS) tools | [`kml`] |
//! | GeoJSON (Internet Engineering Task Force RFC 7946) | web maps, QGIS, most GIS tools | [`geojson`] |
//! | STK ephemeris `.e` (Systems Tool Kit `EphemerisTimePosVel`) | Ansys STK, and tools that read its ephemeris format | [`stk`] |
//! | SigMF (Signal Metadata Format) | software-defined-radio tools | [`crate::sigmf`], through [`crate::spectrum`] |
//!
//! Imports: a GeoJSON `LineString` becomes the straight-track input of the kinds that fly
//! one ([`geojson::apply_route`]); a SigMF recording is read by the `spectrum` kind's
//! `[recording]` block, which already uses [`crate::sigmf`].
//!
//! ## One scene, several writers
//!
//! [`scene::scene_of`] reads a scenario and builds a [`scene::Scene`]: the satellites and
//! other moving objects sampled on the scenario's own time grid, the fixed sites, the
//! untimed tracks and the jammer footprints. Each writer turns that one scene into its
//! format, so the four geospatial formats cannot disagree about where anything is. A
//! kind that has nothing to place on the Earth returns
//! [`ExportError::NotApplicable`] with the reason, and that reason is what the command
//! line prints and what `docs/INTEROP.md` tabulates for every bundled scenario.
//!
//! ## Frames and time
//!
//! * Moving objects are propagated in the engine's native frame, TEME (true equator,
//!   mean equinox of date), and written in two frames: the Geocentric Celestial Reference
//!   System (GCRS, whose axes are the International Celestial Reference Frame axes) via
//!   the [`crate::nutation::teme_to_gcrs`] reduction (0.11 m from Vallado's published
//!   TEME-to-GCRF example, `tests/frame_reference_vectors.rs`), for CZML (`INERTIAL`) and
//!   STK (`ICRF`); and Earth-fixed via [`crate::frames::teme_to_ecef`] (Greenwich mean
//!   sidereal rotation, polar motion and UT1−UTC not applied, the same reduction the SP3
//!   export uses), for KML and GeoJSON longitude, latitude and height. The `ephemeris`
//!   kind is the exception: its engine output already carries GCRS and Earth-fixed
//!   positions (with its own UT1 and polar motion), and those are written unchanged.
//! * Every time is Coordinated Universal Time (UTC), written as ISO 8601 with a `Z`
//!   suffix to the microsecond. Where a scenario gives no calendar epoch, `t = 0` is the
//!   earliest epoch its satellites' own data carry (TLE, broadcast ephemeris, SP3), and
//!   each such satellite is rotated into the GCRS and Earth-fixed frames at its own
//!   instant; the output names the epoch and where it came from (see
//!   [`scene::Scene::epoch_note`]).
//!
//! ## Determinism
//!
//! Nothing here reads a clock, the filesystem or the network, and no output carries a
//! generation timestamp: the same scenario gives byte-identical files on every run and
//! every platform. Numbers are rounded to fixed decimal places before serialisation
//! (positions to 0.1 mm, angles to 1e-9 degree), so the bytes do not depend on
//! floating-point printing.

pub mod czml;
pub mod geojson;
pub mod kml;
pub mod scene;
pub mod stk;
mod time;

pub use time::UtcEpoch;

/// The export formats `--export` accepts.
#[derive(Clone, Copy, Debug, PartialEq, Eq, Hash, PartialOrd, Ord)]
pub enum Format {
    /// CZML, the Cesium Language.
    Czml,
    /// KML 2.2 (Open Geospatial Consortium), with the Google `gx:Track` extension.
    Kml,
    /// GeoJSON, RFC 7946.
    GeoJson,
    /// Ansys STK ephemeris `.e`, `EphemerisTimePosVel`.
    Stk,
    /// SigMF recording (metadata + data file pair).
    Sigmf,
}

impl Format {
    /// Every format, in the order the command line and the documentation list them.
    pub const ALL: [Format; 5] = [
        Format::Czml,
        Format::Kml,
        Format::GeoJson,
        Format::Stk,
        Format::Sigmf,
    ];

    /// The name `--export` takes.
    pub fn as_str(self) -> &'static str {
        match self {
            Format::Czml => "czml",
            Format::Kml => "kml",
            Format::GeoJson => "geojson",
            Format::Stk => "stk",
            Format::Sigmf => "sigmf",
        }
    }

    /// Parse an `--export` value (case-insensitive; `stk-e` and `e` name STK too).
    pub fn parse(s: &str) -> Result<Format, String> {
        match s.to_ascii_lowercase().as_str() {
            "czml" => Ok(Format::Czml),
            "kml" => Ok(Format::Kml),
            "geojson" | "json-geo" => Ok(Format::GeoJson),
            "stk" | "stk-e" | "e" => Ok(Format::Stk),
            "sigmf" => Ok(Format::Sigmf),
            other => Err(format!(
                "unknown export format '{other}'; expected one of czml, kml, geojson, stk, sigmf, all or list"
            )),
        }
    }

    /// The published specification the writer follows.
    pub fn spec_url(self) -> &'static str {
        match self {
            Format::Czml => {
                "https://github.com/AnalyticalGraphicsInc/czml-writer/wiki/CZML-Structure"
            }
            Format::Kml => "https://www.ogc.org/standard/kml/",
            Format::GeoJson => "https://www.rfc-editor.org/rfc/rfc7946",
            Format::Stk => "https://help.agi.com/stk/#stk/importfiles-02.htm",
            Format::Sigmf => "https://github.com/sigmf/SigMF/blob/main/sigmf-spec.md",
        }
    }
}

/// One file of an export: the suffix appended to the output base (for example
/// `.czml`, or `.G01.e` for one of several STK files) and its bytes.
#[derive(Clone, Debug, PartialEq, Eq)]
pub struct ExportFile {
    /// Suffix appended to the output base, starting with a dot.
    pub suffix: String,
    /// File contents.
    pub bytes: Vec<u8>,
}

/// Why an export produced no file.
#[derive(Clone, Debug, PartialEq, Eq)]
pub enum ExportError {
    /// The format does not apply to this scenario; the text says why.
    NotApplicable(String),
    /// The scenario could not be read or propagated.
    Failed(String),
}

impl std::fmt::Display for ExportError {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        match self {
            ExportError::NotApplicable(why) => write!(f, "not applicable: {why}"),
            ExportError::Failed(e) => write!(f, "{e}"),
        }
    }
}

/// Export a scenario (TOML source) to one format.
pub fn export(src: &str, fmt: Format) -> Result<Vec<ExportFile>, ExportError> {
    if fmt == Format::Sigmf {
        return export_sigmf(src);
    }
    let scene = scene::scene_of(src)?;
    export_scene(&scene, fmt)
}

/// Write an already-built scene in one of the geospatial formats. [`Format::Sigmf`] is
/// not a scene format and is refused here; use [`export`].
pub fn export_scene(scene: &scene::Scene, fmt: Format) -> Result<Vec<ExportFile>, ExportError> {
    match fmt {
        Format::Czml => Ok(vec![ExportFile {
            suffix: ".czml".into(),
            bytes: czml::write(scene).into_bytes(),
        }]),
        Format::Kml => Ok(vec![ExportFile {
            suffix: ".kml".into(),
            bytes: kml::write(scene).into_bytes(),
        }]),
        Format::GeoJson => Ok(vec![ExportFile {
            suffix: ".geojson".into(),
            bytes: geojson::write(scene).into_bytes(),
        }]),
        Format::Stk => stk::write_all(scene),
        Format::Sigmf => Err(ExportError::NotApplicable(
            "SigMF records a signal, not geometry; it is written from the scenario, not a scene"
                .into(),
        )),
    }
}

/// Whether each format applies to a scenario, without writing anything large: `Ok(())`
/// when it applies, the reason otherwise. The geospatial formats share one scene, so it
/// is built once.
pub fn plan(src: &str) -> Vec<(Format, Result<(), String>)> {
    let scene = scene::scene_of(src);
    Format::ALL
        .iter()
        .map(|&f| {
            let r = match f {
                Format::Sigmf => sigmf_applicability(src),
                Format::Stk => match &scene {
                    Ok(s) => stk::applicability(s),
                    Err(e) => Err(reason_of(e)),
                },
                _ => match &scene {
                    Ok(_) => Ok(()),
                    Err(e) => Err(reason_of(e)),
                },
            };
            (f, r)
        })
        .collect()
}

fn reason_of(e: &ExportError) -> String {
    match e {
        ExportError::NotApplicable(w) => w.clone(),
        ExportError::Failed(m) => format!("the scenario could not be exported: {m}"),
    }
}

fn sigmf_applicability(src: &str) -> Result<(), String> {
    let kind = crate::api::ScenarioKind::classify(src).map_err(|e| e.to_string())?;
    if kind != crate::api::ScenarioKind::Spectrum {
        return Err(
            "SigMF holds complex baseband samples, which only the `spectrum` kind synthesises"
                .into(),
        );
    }
    let scn: crate::spectrum::SpectrumScenario =
        toml::from_str(src).map_err(|e| format!("invalid spectrum scenario: {e}"))?;
    if scn.iq.is_none() {
        return Err(
            "this spectrum scenario has no [iq] block, so no samples are synthesised to record"
                .into(),
        );
    }
    Ok(())
}

fn export_sigmf(src: &str) -> Result<Vec<ExportFile>, ExportError> {
    sigmf_applicability(src).map_err(ExportError::NotApplicable)?;
    let scn: crate::spectrum::SpectrumScenario = toml::from_str(src)
        .map_err(|e| ExportError::Failed(format!("invalid spectrum scenario: {e}")))?;
    let (meta, data) = scn
        .export_sigmf()
        .map_err(ExportError::Failed)?
        .ok_or_else(|| ExportError::NotApplicable("no [iq] block".into()))?;
    Ok(vec![
        ExportFile {
            suffix: ".sigmf-meta".into(),
            bytes: meta.into_bytes(),
        },
        ExportFile {
            suffix: ".sigmf-data".into(),
            bytes: data,
        },
    ])
}

/// The outcome of every format for a list of `(scenario name, TOML source)` pairs, as the
/// Markdown table `docs/INTEROP.md` carries. Pure: the caller reads the files.
/// `tests/interop_formats.rs` fails when the committed table is stale; regenerate with
/// `cargo run --bin gen_validation_artifacts`.
pub fn scenario_table_md(scenarios: &[(String, String)]) -> String {
    let mut out = String::new();
    out.push_str("| Scenario | Kind | CZML | KML | GeoJSON | STK `.e` | SigMF |\n");
    out.push_str("|---|---|---|---|---|---|---|\n");
    let mut reasons: Vec<String> = Vec::new();
    for (name, src) in scenarios {
        let kind = crate::api::ScenarioKind::classify(src)
            .map(|k| k.as_str().to_string())
            .unwrap_or_else(|_| "?".into());
        out.push_str(&format!("| `{name}` | `{kind}` |"));
        for (_, r) in plan(src) {
            match r {
                Ok(()) => out.push_str(" yes |"),
                Err(why) => {
                    let idx = match reasons.iter().position(|w| *w == why) {
                        Some(i) => i,
                        None => {
                            reasons.push(why);
                            reasons.len() - 1
                        }
                    };
                    out.push_str(&format!(" no [{}] |", idx + 1));
                }
            }
        }
        out.push('\n');
    }
    out.push_str("\nWhy a format does not apply:\n\n");
    for (i, w) in reasons.iter().enumerate() {
        out.push_str(&format!("{}. {}\n", i + 1, w));
    }
    out
}

/// Round to `dp` decimal places, so serialised numbers do not depend on how the last
/// floating-point digits happen to fall. `-0.0` is folded to `0.0`.
pub(crate) fn round_dp(v: f64, dp: i32) -> f64 {
    let s = 10f64.powi(dp);
    let r = (v * s).round() / s;
    if r == 0.0 {
        0.0
    } else {
        r
    }
}

/// A fixed-decimal rendering with trailing zeros trimmed (`1.2500` → `1.25`, `3.0000` →
/// `3`), for the text formats (KML, STK) where the writer controls the digits.
pub(crate) fn fmt_dp(v: f64, dp: usize) -> String {
    let v = round_dp(v, dp as i32);
    let s = format!("{v:.dp$}");
    if s.contains('.') {
        let t = s.trim_end_matches('0').trim_end_matches('.');
        if t == "-0" {
            "0".into()
        } else {
            t.to_string()
        }
    } else {
        s
    }
}
