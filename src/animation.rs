// SPDX-License-Identifier: AGPL-3.0-only
//! Animation export: a run's time series as an animated Scalable Vector Graphics (SVG)
//! file, a self-contained HyperText Markup Language (HTML) player, or a numbered
//! sequence of SVG frames with a manifest for a video encoder.
//!
//! The exporter reads the result document a run already wrote; it never re-runs the
//! physics and it adds no number of its own. Every point it draws is a sample from the
//! result JSON, so an animation is exactly as good as the run behind it: MODELLED where
//! the run is modelled, and never evidence of anything the run does not already say.
//!
//! **What counts as a time series.** The result documents differ kind by kind, so the
//! extractor recognises the shapes the engine actually emits rather than a list of kinds:
//!
//! - an array of records, each carrying a time field (`t`, `t_s`, `t_hours`, `t_min`,
//!   `t_days`; `k` on an `epochs` array) that strictly increases along the array: every
//!   other numeric field of the records becomes a trace (`quantum.series[].error_ns`);
//! - an object holding a strictly increasing time array (`t_s`, `t`, `times_s`, …) beside
//!   arrays of the same length: sibling numeric arrays, a `channels` map of `{unit,
//!   values}` records (the `campaign` timeline), an array of records whose members hold
//!   such arrays (the `spectrum` bands), and a two-dimensional array whose rows match the
//!   time axis (the `spectrum` waterfall, which animates row by row);
//! - beside that time array, `phases` (`name`, `t0_s`, `t1_s`) and `events` (`t_s`,
//!   `label`, `alarm`) become the phase strip and the event markers, so a campaign plays
//!   as its phases (jamming, spoofing, holdover, integrity alarm) with its alarms marked.
//!
//! A kind whose result carries none of these (a link budget, a single-epoch geometry) is
//! refused with [`AnimationError::NoTimeSeries`], never animated from invented samples.
//!
//! **Determinism.** Output is a pure function of the result document and the
//! [`AnimationOptions`]: no clock, no random numbers, no hash-map iteration, no file or
//! network access. The same scenario, seed and options give byte-identical files, and no
//! timestamp is written at all. The module is WebAssembly-safe for that reason.

use serde_json::{Map, Value};
use std::fmt::Write as _;

/// The three export shapes.
#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum AnimationFormat {
    /// One animated SVG: Cascading Style Sheets (CSS) keyframes, no script.
    Svg,
    /// One self-contained HTML player with inline script and no external asset.
    Html,
    /// Numbered static SVG frames plus `manifest.json`.
    Frames,
}

impl AnimationFormat {
    /// Every format, in the order `all` expands to.
    pub const ALL: [AnimationFormat; 3] = [
        AnimationFormat::Svg,
        AnimationFormat::Html,
        AnimationFormat::Frames,
    ];

    /// The format's command-line name.
    pub fn as_str(self) -> &'static str {
        match self {
            AnimationFormat::Svg => "svg",
            AnimationFormat::Html => "html",
            AnimationFormat::Frames => "frames",
        }
    }

    /// Parse a command-line name (`svg`, `html`, `frames`).
    pub fn parse(s: &str) -> Result<Self, String> {
        match s.trim().to_ascii_lowercase().as_str() {
            "svg" => Ok(AnimationFormat::Svg),
            "html" => Ok(AnimationFormat::Html),
            "frames" => Ok(AnimationFormat::Frames),
            other => Err(format!(
                "unknown animation format '{other}'; expected svg, html, frames or all"
            )),
        }
    }

    /// Parse a comma-separated list (`svg,html`, or `all`), de-duplicated, in
    /// [`AnimationFormat::ALL`] order.
    pub fn parse_list(s: &str) -> Result<Vec<Self>, String> {
        let mut want = [false; 3];
        for part in s.split(',').filter(|p| !p.trim().is_empty()) {
            if part.trim().eq_ignore_ascii_case("all") {
                want = [true; 3];
                continue;
            }
            let f = Self::parse(part)?;
            want[Self::ALL.iter().position(|x| *x == f).unwrap_or(0)] = true;
        }
        let out: Vec<Self> = Self::ALL
            .iter()
            .zip(want)
            .filter(|(_, w)| *w)
            .map(|(f, _)| *f)
            .collect();
        if out.is_empty() {
            return Err("no animation format given; expected svg, html, frames or all".into());
        }
        Ok(out)
    }
}

/// Playback settings. The defaults give an 8-second loop at 12 frames per second.
#[derive(Debug, Clone, PartialEq)]
pub struct AnimationOptions {
    /// Frames per second of the frame sequence (and the rate the manifest states).
    pub fps: u32,
    /// Wall-clock length of one playthrough, in seconds, at 1x speed.
    pub duration_s: f64,
    /// Width of the drawing in pixels; the height follows from the number of panels.
    pub width: u32,
}

impl Default for AnimationOptions {
    fn default() -> Self {
        AnimationOptions {
            fps: 12,
            duration_s: 8.0,
            width: 960,
        }
    }
}

impl AnimationOptions {
    /// Largest frame sequence the exporter writes.
    pub const MAX_FRAMES: usize = 7200;

    /// Refuse settings that cannot produce a sensible animation.
    pub fn validate(&self) -> Result<(), String> {
        if !(1..=60).contains(&self.fps) {
            return Err(format!(
                "animation fps must be between 1 and 60, got {}",
                self.fps
            ));
        }
        if !self.duration_s.is_finite() || !(0.5..=600.0).contains(&self.duration_s) {
            return Err(format!(
                "animation duration must be between 0.5 s and 600 s, got {}",
                self.duration_s
            ));
        }
        if !(480..=3840).contains(&self.width) {
            return Err(format!(
                "animation width must be between 480 and 3840 pixels, got {}",
                self.width
            ));
        }
        let n = self.frame_count();
        if !(2..=Self::MAX_FRAMES).contains(&n) {
            return Err(format!(
                "duration x fps gives {n} frames; the frame sequence needs between 2 and {}",
                Self::MAX_FRAMES
            ));
        }
        Ok(())
    }

    /// Number of frames in the sequence: `round(duration_s * fps)`.
    pub fn frame_count(&self) -> usize {
        (self.duration_s * self.fps as f64).round().max(0.0) as usize
    }
}

/// Why a result could not be animated.
#[derive(Debug, Clone, PartialEq)]
pub enum AnimationError {
    /// The result document holds no time series the extractor recognises.
    NoTimeSeries(String),
    /// The input or the options are unusable.
    Invalid(String),
}

impl std::fmt::Display for AnimationError {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        match self {
            AnimationError::NoTimeSeries(k) => write!(
                f,
                "no time series to animate: the {k} result carries no sampled time axis \
                 (see docs/ANIMATION.md for the shapes the exporter recognises)"
            ),
            AnimationError::Invalid(m) => write!(f, "{m}"),
        }
    }
}

impl std::error::Error for AnimationError {}

/// One sampled line: its own time grid (seconds, or epoch index) and values, with gaps
/// as `None`.
#[derive(Debug, Clone, PartialEq)]
pub struct Trace {
    pub label: String,
    pub t: Vec<f64>,
    pub y: Vec<Option<f64>>,
}

/// One panel: traces that share a quantity and unit.
#[derive(Debug, Clone, PartialEq)]
pub struct Chart {
    pub title: String,
    pub unit: String,
    pub traces: Vec<Trace>,
}

/// A named interval of the timeline (a campaign phase).
#[derive(Debug, Clone, PartialEq)]
pub struct Phase {
    pub name: String,
    pub t0: f64,
    pub t1: f64,
}

/// A marked instant (a campaign alarm, a first loss of lock).
#[derive(Debug, Clone, PartialEq)]
pub struct Event {
    pub t: f64,
    pub label: String,
    pub alarm: bool,
}

/// Rows of a time-frequency grid, revealed in time order.
#[derive(Debug, Clone, PartialEq)]
pub struct Waterfall {
    pub title: String,
    pub unit: String,
    pub t: Vec<f64>,
    pub freq_hz: Vec<f64>,
    pub rows: Vec<Vec<Option<f64>>>,
    pub lo: f64,
    pub hi: f64,
}

/// Everything the renderers draw, extracted from one result document.
#[derive(Debug, Clone, PartialEq)]
pub struct Timeline {
    pub title: String,
    pub kind: String,
    /// `s` for physical time, `epoch` for an epoch index.
    pub t_unit: String,
    pub t0: f64,
    pub t1: f64,
    pub charts: Vec<Chart>,
    pub phases: Vec<Phase>,
    pub events: Vec<Event>,
    pub waterfall: Option<Waterfall>,
    /// JSON paths the traces were read from, in drawing order.
    pub sources: Vec<String>,
    /// Series that were found but not drawn (panel or trace caps).
    pub omitted: Vec<String>,
}

/// One written file of an export.
#[derive(Debug, Clone, PartialEq)]
pub struct AnimationFile {
    /// Name relative to the export's directory (`animation.svg`, `frame_0000.svg`, …).
    pub name: String,
    pub content: String,
}

/// The files of one export plus the summary the CLI splices into `result.json`.
#[derive(Debug, Clone, PartialEq)]
pub struct Animation {
    pub format: AnimationFormat,
    pub files: Vec<AnimationFile>,
    pub frame_count: usize,
}

/// Most panels drawn; further series are listed in [`Timeline::omitted`].
pub const MAX_CHARTS: usize = 6;
/// Most traces per panel (a constellation track has one per satellite).
pub const MAX_TRACES: usize = 6;
const MAX_WATERFALL_BINS: usize = 96;
const MAX_WATERFALL_ROWS: usize = 120;
const MAX_POINTS: usize = 2400;

/// Time keys of record arrays, with their scale to seconds.
const RECORD_TIME_KEYS: &[(&str, f64)] = &[
    ("t", 1.0),
    ("t_s", 1.0),
    ("t_hours", 3600.0),
    ("t_min", 60.0),
    ("t_days", 86400.0),
];
/// Time keys of parallel-array objects, with their scale to seconds.
const ARRAY_TIME_KEYS: &[(&str, f64)] = &[
    ("t_s", 1.0),
    ("t", 1.0),
    ("times_s", 1.0),
    ("t_hours", 3600.0),
    ("t_min", 60.0),
    ("t_days", 86400.0),
];
/// Record fields that are identifiers or a second clock, not a quantity to plot.
const SKIP_FIELDS: &[&str] = &[
    "sat",
    "prn",
    "index",
    "epoch_index",
    "naif_id",
    "jd_utc",
    "mjd",
    "k",
    "arc_time_tu",
];

// ---------------------------------------------------------------------------
// Extraction
// ---------------------------------------------------------------------------

struct Cand {
    group: String,
    field: String,
    unit: String,
    label: String,
    source: String,
    t: Vec<f64>,
    y: Vec<Option<f64>>,
    epoch: bool,
}

#[derive(Default)]
struct Found {
    cands: Vec<Cand>,
    phases: Vec<Phase>,
    events: Vec<Event>,
    waterfall: Option<Waterfall>,
}

fn num(v: &Value) -> Option<f64> {
    v.as_f64().filter(|x| x.is_finite())
}

fn strictly_increasing(t: &[f64]) -> bool {
    t.len() >= 3 && t.windows(2).all(|w| w[1] > w[0])
}

/// A numeric-or-null array of exactly `n` entries with at least two numbers.
fn opt_array(v: &Value, n: usize) -> Option<Vec<Option<f64>>> {
    let a = v.as_array()?;
    if a.len() != n {
        return None;
    }
    let mut out = Vec::with_capacity(n);
    for e in a {
        match e {
            Value::Null => out.push(None),
            Value::Number(_) => out.push(num(e)),
            _ => return None,
        }
    }
    (out.iter().filter(|x| x.is_some()).count() >= 2).then_some(out)
}

fn unit_of(units: &Map<String, Value>, path: &str) -> Option<String> {
    let u = units.get(path)?;
    match u {
        Value::String(s) => Some(s.clone()),
        Value::Object(o) => o.get("unit").and_then(Value::as_str).map(str::to_string),
        _ => None,
    }
}

/// A unit guessed from a field-name suffix when the document's units map has none.
fn unit_from_name(field: &str) -> String {
    const SUFFIXES: &[(&str, &str)] = &[
        ("_dbhz", "dB-Hz"),
        ("_dbw_per_hz", "dBW/Hz"),
        // Before `_s`, which would otherwise claim every speed in metres per second.
        ("_m_s", "m/s"),
        ("_dbw", "dBW"),
        ("_dbi", "dBi"),
        ("_db", "dB"),
        ("_ns", "ns"),
        ("_us", "us"),
        ("_ms", "ms"),
        ("_km", "km"),
        ("_m", "m"),
        ("_s", "s"),
        ("_deg", "deg"),
        ("_hz", "Hz"),
    ];
    for (suf, u) in SUFFIXES {
        if field.ends_with(suf) {
            return (*u).to_string();
        }
    }
    "1".to_string()
}

fn clean_label(s: &str) -> String {
    let mut out = String::new();
    for c in s.chars() {
        if c.is_control() {
            out.push(' ');
        } else {
            out.push(c);
        }
    }
    // Never carry a link into a self-contained export.
    let out = out.replace("://", ": ");
    if out.chars().count() > 72 {
        let mut t: String = out.chars().take(71).collect();
        t.push('\u{2026}');
        t
    } else {
        out
    }
}

/// A short series label from a JSON path: `quantum.series` -> `quantum`.
fn short_label(path: &str) -> String {
    let mut parts: Vec<&str> = path.split('.').filter(|p| !p.is_empty()).collect();
    while parts.len() > 1 {
        let last = parts[parts.len() - 1];
        if matches!(
            last,
            "series" | "epochs" | "samples" | "points" | "band" | "estimation" | "geometry"
        ) {
            parts.pop();
        } else {
            break;
        }
    }
    let s = parts.join(".");
    if s.is_empty() {
        "result".into()
    } else {
        s
    }
}

fn join(path: &str, key: &str) -> String {
    if path.is_empty() {
        key.to_string()
    } else {
        format!("{path}.{key}")
    }
}

struct Walker<'a> {
    units: &'a Map<String, Value>,
    found: Found,
}

impl Walker<'_> {
    /// `upath` is the units-map spelling (`a.b[].c`), `dpath` the display spelling
    /// (`a.b[2].c`).
    fn walk(&mut self, v: &Value, upath: &str, dpath: &str, depth: usize) {
        if depth > 8 {
            return;
        }
        match v {
            Value::Object(o) => {
                if upath == "units" {
                    return;
                }
                if self.parallel(o, upath, dpath) {
                    return;
                }
                for (k, x) in o {
                    self.walk(x, &join(upath, k), &join(dpath, k), depth + 1);
                }
            }
            Value::Array(a) => {
                if a.first().is_some_and(Value::is_object) && self.records(a, upath, dpath) {
                    return;
                }
                for (i, e) in a.iter().take(16).enumerate() {
                    if e.is_object() || e.is_array() {
                        self.walk(
                            e,
                            &format!("{upath}[]"),
                            &format!("{dpath}[{i}]"),
                            depth + 1,
                        );
                    }
                }
            }
            _ => {}
        }
    }

    /// An array of records with a time field. Returns true when it was consumed.
    fn records(&mut self, a: &[Value], upath: &str, dpath: &str) -> bool {
        if a.len() < 3 || !a.iter().all(Value::is_object) {
            return false;
        }
        let first = a[0].as_object().expect("checked object");
        let last_key = upath.rsplit('.').next().unwrap_or("");
        let mut time: Option<(&str, f64, bool)> = RECORD_TIME_KEYS
            .iter()
            .find(|(k, _)| first.get(*k).and_then(num).is_some())
            .map(|(k, s)| (*k, *s, false));
        if time.is_none() && last_key == "epochs" && first.get("k").and_then(num).is_some() {
            time = Some(("k", 1.0, true));
        }
        let Some((tkey, scale, epoch)) = time else {
            return false;
        };
        let mut t = Vec::with_capacity(a.len());
        for r in a {
            match r.get(tkey).and_then(num) {
                Some(x) => t.push(x * scale),
                None => return false,
            }
        }
        if !strictly_increasing(&t) {
            return false;
        }
        let label = short_label(dpath);
        for (field, fv) in first {
            if field == tkey || SKIP_FIELDS.contains(&field.as_str()) || !fv.is_number() {
                continue;
            }
            let y: Vec<Option<f64>> = a.iter().map(|r| r.get(field).and_then(num)).collect();
            if y.iter().filter(|x| x.is_some()).count() < 2 {
                continue;
            }
            let unit = unit_of(self.units, &format!("{upath}[].{field}"))
                .unwrap_or_else(|| unit_from_name(field));
            self.found.cands.push(Cand {
                group: format!("field:{field}|{unit}"),
                field: field.clone(),
                unit,
                label: label.clone(),
                source: format!("{dpath}[].{field}"),
                t: t.clone(),
                y,
                epoch,
            });
        }
        true
    }

    /// An object with a time array and same-length siblings. Returns true when the
    /// object was consumed (it held a usable time axis).
    fn parallel(&mut self, o: &Map<String, Value>, upath: &str, dpath: &str) -> bool {
        let Some((tkey, t)) = ARRAY_TIME_KEYS.iter().find_map(|(k, s)| {
            let a = o.get(*k)?.as_array()?;
            let t: Option<Vec<f64>> = a.iter().map(|e| num(e).map(|x| x * s)).collect();
            t.filter(|t| strictly_increasing(t)).map(|t| (*k, t))
        }) else {
            return false;
        };
        let n = t.len();
        let before = self.found.cands.len();
        let mut had_extra = false;
        for (key, v) in o {
            if key == tkey {
                continue;
            }
            let ukey = join(upath, key);
            let dkey = join(dpath, key);
            if let Some(y) = opt_array(v, n) {
                let unit = unit_of(self.units, &format!("{ukey}[]"))
                    .unwrap_or_else(|| unit_from_name(key));
                self.found.cands.push(Cand {
                    group: format!("unit:{unit}"),
                    field: key.clone(),
                    unit,
                    label: key.clone(),
                    source: format!("{dkey}[]"),
                    t: t.clone(),
                    y,
                    epoch: false,
                });
                continue;
            }
            match v {
                Value::Object(ch) if key == "channels" => {
                    for (name, c) in ch {
                        let Some(y) = c.get("values").and_then(|x| opt_array(x, n)) else {
                            continue;
                        };
                        let unit = c
                            .get("unit")
                            .and_then(Value::as_str)
                            .map(str::to_string)
                            .or_else(|| unit_of(self.units, &format!("{ukey}.{name}.values[]")))
                            .unwrap_or_else(|| unit_from_name(name));
                        self.found.cands.push(Cand {
                            group: format!("unit:{unit}"),
                            field: name.clone(),
                            unit,
                            label: name.clone(),
                            source: format!("{dkey}.{name}.values[]"),
                            t: t.clone(),
                            y,
                            epoch: false,
                        });
                    }
                }
                Value::Array(a) if key == "phases" => {
                    had_extra = true;
                    for p in a {
                        if let (Some(t0), Some(t1)) =
                            (p.get("t0_s").and_then(num), p.get("t1_s").and_then(num))
                        {
                            let name = p.get("name").and_then(Value::as_str).unwrap_or("phase");
                            self.found.phases.push(Phase {
                                name: clean_label(name),
                                t0,
                                t1,
                            });
                        }
                    }
                }
                Value::Array(a) if key == "events" => {
                    had_extra = true;
                    for e in a {
                        if let Some(te) = e.get("t_s").and_then(num) {
                            let label = e
                                .get("label")
                                .and_then(Value::as_str)
                                .or_else(|| e.get("name").and_then(Value::as_str))
                                .unwrap_or("event");
                            let alarm = e.get("alarm").and_then(Value::as_bool).unwrap_or(false);
                            self.found.events.push(Event {
                                t: te,
                                label: clean_label(label),
                                alarm,
                            });
                        }
                    }
                }
                Value::Array(a) if a.first().is_some_and(Value::is_array) => {
                    self.grid(o, key, a, &t, &ukey);
                }
                Value::Array(a) if a.first().is_some_and(Value::is_object) => {
                    self.member_arrays(a, &t, &ukey, &dkey);
                }
                _ => {}
            }
        }
        // A time axis with nothing sampled on it (a bare grid, or one whose siblings are
        // all scalars) is not consumed, so its children are still searched.
        self.found.cands.len() > before || had_extra || self.found.waterfall.is_some()
    }

    /// Array of records whose members hold time-aligned arrays (spectrum bands, the
    /// satellites of a constellation track).
    fn member_arrays(&mut self, a: &[Value], t: &[f64], ukey: &str, dkey: &str) {
        let n = t.len();
        for (i, m) in a.iter().enumerate() {
            let Some(mo) = m.as_object() else { continue };
            let name = mo
                .get("name")
                .or_else(|| mo.get("label"))
                .or_else(|| mo.get("id"))
                .and_then(Value::as_str)
                .map(str::to_string)
                .unwrap_or_else(|| format!("{}[{i}]", short_label(dkey)));
            for (field, fv) in mo {
                if let Some(y) = opt_array(fv, n) {
                    let unit = unit_of(self.units, &format!("{ukey}[].{field}[]"))
                        .unwrap_or_else(|| unit_from_name(field));
                    self.found.cands.push(Cand {
                        group: format!("field:{field}|{unit}"),
                        field: field.clone(),
                        unit,
                        label: clean_label(&name),
                        source: format!("{dkey}[{i}].{field}[]"),
                        t: t.to_vec(),
                        y,
                        epoch: false,
                    });
                } else if field.ends_with("_t_s") {
                    if let Some(te) = num(fv) {
                        let what = field.trim_end_matches("_t_s").replace('_', " ");
                        self.found.events.push(Event {
                            t: te,
                            label: clean_label(&format!("{name}: {what}")),
                            alarm: field.contains("loss"),
                        });
                    }
                }
            }
        }
    }

    /// A two-dimensional array whose rows match the time axis: a waterfall.
    fn grid(&mut self, o: &Map<String, Value>, key: &str, a: &[Value], t: &[f64], ukey: &str) {
        if self.found.waterfall.is_some() || a.len() != t.len() {
            return;
        }
        let Some(width) = a[0].as_array().map(Vec::len).filter(|w| *w >= 2) else {
            return;
        };
        let freq: Option<Vec<f64>> = o
            .iter()
            .filter(|(k, _)| k.ends_with("_hz") && k.as_str() != key)
            .find_map(|(_, v)| {
                let f: Option<Vec<f64>> = v.as_array()?.iter().map(num).collect();
                f.filter(|f| f.len() == width)
            });
        let Some(freq) = freq else { return };
        let mut rows = Vec::with_capacity(a.len());
        for r in a {
            match r.as_array() {
                Some(row) if row.len() == width => rows.push(row.iter().map(num).collect()),
                _ => return,
            }
        }
        let unit = unit_of(self.units, &format!("{ukey}[][]")).unwrap_or_else(|| "dB".into());
        let (rows, freq, t) = decimate_grid(rows, freq, t.to_vec(), unit.starts_with("dB"));
        let finite = rows.iter().flatten().filter_map(|x| *x);
        let (lo, hi) = finite.fold((f64::INFINITY, f64::NEG_INFINITY), |(l, h), x| {
            (l.min(x), h.max(x))
        });
        if !lo.is_finite() || !hi.is_finite() {
            return;
        }
        self.found.waterfall = Some(Waterfall {
            title: key.to_string(),
            unit,
            t,
            freq_hz: freq,
            rows,
            lo,
            hi: if hi > lo { hi } else { lo + 1.0 },
        });
    }
}

type Grid = (Vec<Vec<Option<f64>>>, Vec<f64>, Vec<f64>);

/// Reduce a grid to at most [`MAX_WATERFALL_BINS`] x [`MAX_WATERFALL_ROWS`] cells,
/// averaging decibel cells in power so a narrow jammer is not diluted in dB.
fn decimate_grid(rows: Vec<Vec<Option<f64>>>, freq: Vec<f64>, t: Vec<f64>, db: bool) -> Grid {
    let fstep = freq.len().div_ceil(MAX_WATERFALL_BINS).max(1);
    let tstep = t.len().div_ceil(MAX_WATERFALL_ROWS).max(1);
    if fstep == 1 && tstep == 1 {
        return (rows, freq, t);
    }
    let mean = |xs: &[f64]| -> Option<f64> {
        if xs.is_empty() {
            return None;
        }
        if db {
            let p: f64 = xs.iter().map(|x| 10f64.powf(x / 10.0)).sum::<f64>() / xs.len() as f64;
            Some(10.0 * p.log10())
        } else {
            Some(xs.iter().sum::<f64>() / xs.len() as f64)
        }
    };
    let nf = freq.len().div_ceil(fstep);
    let nt = t.len().div_ceil(tstep);
    let mut out = Vec::with_capacity(nt);
    for ti in 0..nt {
        let r0 = ti * tstep;
        let r1 = (r0 + tstep).min(rows.len());
        let mut row = Vec::with_capacity(nf);
        for fi in 0..nf {
            let c0 = fi * fstep;
            let c1 = (c0 + fstep).min(freq.len());
            let mut xs = Vec::new();
            for r in &rows[r0..r1] {
                xs.extend(r[c0..c1].iter().filter_map(|x| *x));
            }
            row.push(mean(&xs));
        }
        out.push(row);
    }
    let f2 = (0..nf).map(|i| freq[i * fstep]).collect();
    let t2 = (0..nt).map(|i| t[i * tstep]).collect();
    (out, f2, t2)
}

fn max_abs(c: &Cand) -> f64 {
    c.y.iter()
        .filter_map(|x| *x)
        .fold(0.0_f64, |m, x| m.max(x.abs()))
}

fn humanise(field: &str, unit: &str) -> String {
    let mut f = field.to_string();
    for suf in [
        "_dbw_per_hz",
        "_m_s",
        "_dbhz",
        "_dbw",
        "_dbi",
        "_db",
        "_ns",
        "_us",
        "_ms",
        "_km",
        "_m",
        "_s",
        "_deg",
        "_hz",
    ] {
        if let Some(stripped) = f.strip_suffix(suf) {
            if !stripped.is_empty() {
                f = stripped.to_string();
            }
            break;
        }
    }
    let f = f.replace('_', " ");
    if unit.is_empty() || unit == "1" {
        f
    } else {
        format!("{f} [{unit}]")
    }
}

/// Read a result document and pull out everything the renderers draw.
///
/// `kind` names the scenario kind for titles and errors; `None` reads the document's
/// own `kind` field.
pub fn extract_timeline(json: &str, kind: Option<&str>) -> Result<Timeline, AnimationError> {
    let doc: Value = serde_json::from_str(json)
        .map_err(|e| AnimationError::Invalid(format!("result is not JSON: {e}")))?;
    let kind = kind
        .map(str::to_string)
        .or_else(|| doc.get("kind").and_then(Value::as_str).map(str::to_string))
        .unwrap_or_else(|| "scenario".into());
    let empty = Map::new();
    let units = doc
        .get("units")
        .and_then(Value::as_object)
        .unwrap_or(&empty);
    let mut w = Walker {
        units,
        found: Found::default(),
    };
    w.walk(&doc, "", "", 0);
    let Found {
        mut cands,
        phases,
        mut events,
        waterfall,
    } = w.found;

    // One time unit per timeline: physical time wins over an epoch index.
    if cands.iter().any(|c| !c.epoch) {
        cands.retain(|c| !c.epoch);
    }
    let t_unit = if cands.first().is_some_and(|c| c.epoch) {
        "epoch"
    } else {
        "s"
    };
    if cands.is_empty() && waterfall.is_none() {
        return Err(AnimationError::NoTimeSeries(kind));
    }

    // Group into panels in order of first appearance. Unit groups split when their
    // magnitudes differ by more than a factor of 100, so a guard of 50 ns does not
    // flatten a 2 ns error into the axis.
    let mut groups: Vec<(String, Vec<Cand>)> = Vec::new();
    for c in cands {
        let key = if c.group.starts_with("unit:") {
            let mag = max_abs(&c);
            let mut chosen = None;
            for (gi, (gk, members)) in groups.iter().enumerate() {
                if !gk.starts_with(&c.group) {
                    continue;
                }
                let gm = members.iter().map(max_abs).fold(0.0_f64, f64::max);
                let (a, b) = (mag.max(1e-300), gm.max(1e-300));
                if a / b <= 100.0 && b / a <= 100.0 {
                    chosen = Some(gi);
                    break;
                }
            }
            match chosen {
                Some(gi) => {
                    groups[gi].1.push(c);
                    continue;
                }
                None => format!("{}#{}", c.group, groups.len()),
            }
        } else {
            c.group.clone()
        };
        match groups.iter_mut().find(|(k, _)| *k == key) {
            Some((_, m)) => m.push(c),
            None => groups.push((key, vec![c])),
        }
    }

    let mut charts = Vec::new();
    let mut sources = Vec::new();
    let mut omitted = Vec::new();
    for (gi, (key, members)) in groups.into_iter().enumerate() {
        if gi >= MAX_CHARTS {
            omitted.extend(members.into_iter().map(|c| c.source));
            continue;
        }
        let unit = members[0].unit.clone();
        let title = if key.starts_with("field:") {
            humanise(&members[0].field, &unit)
        } else {
            let names: Vec<String> = members
                .iter()
                .take(3)
                .map(|c| humanise(&c.field, ""))
                .collect();
            let more = if members.len() > 3 { ", \u{2026}" } else { "" };
            if unit == "1" {
                format!("{}{more}", names.join(", "))
            } else {
                format!("{}{more} [{unit}]", names.join(", "))
            }
        };
        let mut traces = Vec::new();
        for (ti, c) in members.into_iter().enumerate() {
            if ti >= MAX_TRACES {
                omitted.push(c.source);
                continue;
            }
            sources.push(c.source);
            let (t, y) = decimate_trace(c.t, c.y);
            traces.push(Trace {
                label: clean_label(&c.label),
                t,
                y,
            });
        }
        charts.push(Chart {
            title: clean_label(&title),
            unit,
            traces,
        });
    }

    let mut t0 = f64::INFINITY;
    let mut t1 = f64::NEG_INFINITY;
    for tr in charts.iter().flat_map(|c| &c.traces) {
        if let (Some(a), Some(b)) = (tr.t.first(), tr.t.last()) {
            t0 = t0.min(*a);
            t1 = t1.max(*b);
        }
    }
    if let Some(wf) = &waterfall {
        if let (Some(a), Some(b)) = (wf.t.first(), wf.t.last()) {
            t0 = t0.min(*a);
            t1 = t1.max(*b);
        }
    }
    for p in &phases {
        t0 = t0.min(p.t0);
        t1 = t1.max(p.t1);
    }
    if !(t0.is_finite() && t1.is_finite() && t1 > t0) {
        return Err(AnimationError::NoTimeSeries(kind));
    }
    events.retain(|e| e.t >= t0 && e.t <= t1);
    events.sort_by(|a, b| a.t.total_cmp(&b.t));
    events.dedup_by(|a, b| a.t == b.t && a.label == b.label);

    let title = doc
        .get("title")
        .or_else(|| doc.get("label"))
        .and_then(Value::as_str)
        .map(clean_label)
        .unwrap_or_else(|| kind.clone());
    Ok(Timeline {
        title,
        kind,
        t_unit: t_unit.into(),
        t0,
        t1,
        charts,
        phases,
        events,
        waterfall,
        sources,
        omitted,
    })
}

/// Keep at most [`MAX_POINTS`] samples by striding, always keeping the last one.
fn decimate_trace(t: Vec<f64>, y: Vec<Option<f64>>) -> (Vec<f64>, Vec<Option<f64>>) {
    if t.len() <= MAX_POINTS {
        return (t, y);
    }
    let step = t.len().div_ceil(MAX_POINTS);
    let mut ti = Vec::new();
    let mut yi = Vec::new();
    for i in (0..t.len()).step_by(step) {
        ti.push(t[i]);
        yi.push(y[i]);
    }
    if ti.last() != t.last() {
        ti.push(t[t.len() - 1]);
        yi.push(y[y.len() - 1]);
    }
    (ti, yi)
}

// ---------------------------------------------------------------------------
// Geometry shared by every renderer
// ---------------------------------------------------------------------------

/// "Nice" tick values covering `[lo, hi]`, about `n` of them.
fn nice_ticks(lo: f64, hi: f64, n: usize) -> (f64, f64, f64) {
    let span = (hi - lo).abs().max(1e-300);
    let raw = span / n.max(1) as f64;
    let mag = 10f64.powf(raw.log10().floor());
    let norm = raw / mag;
    let step = mag
        * if norm <= 1.0 {
            1.0
        } else if norm <= 2.0 {
            2.0
        } else if norm <= 5.0 {
            5.0
        } else {
            10.0
        };
    ((lo / step).floor() * step, (hi / step).ceil() * step, step)
}

fn fmt_tick(v: f64, step: f64) -> String {
    let v = if v.abs() < step * 1e-9 { 0.0 } else { v };
    let a = v.abs();
    if a != 0.0 && !(1e-3..1e6).contains(&a) {
        return format!("{v:.2e}");
    }
    let dec = (-(step.log10().floor())).clamp(0.0, 6.0) as usize;
    format!("{v:.dec$}")
}

fn esc(s: &str) -> String {
    s.replace('&', "&amp;")
        .replace('<', "&lt;")
        .replace('>', "&gt;")
        .replace('"', "&quot;")
        .replace('\'', "&#39;")
}

/// Choose the display unit of the time axis.
fn time_display(t_unit: &str, span: f64) -> (&'static str, f64) {
    if t_unit == "epoch" {
        return ("epoch", 1.0);
    }
    if span >= 3.0 * 86400.0 {
        ("d", 86400.0)
    } else if span >= 3.0 * 3600.0 {
        ("h", 3600.0)
    } else if span >= 600.0 {
        ("min", 60.0)
    } else {
        ("s", 1.0)
    }
}

struct Panel {
    top: f64,
    h: f64,
    lo: f64,
    hi: f64,
    step: f64,
}

struct Layout {
    w: f64,
    h: f64,
    ml: f64,
    pw: f64,
    strip: Option<(f64, f64)>,
    panels: Vec<Panel>,
    wf: Option<(f64, f64)>,
    /// Bottom of the time-on-x panels: cursor and event lines stop here, above the
    /// waterfall, whose x axis is frequency.
    lines_bottom: f64,
    t0: f64,
    t1: f64,
    tdisp: (&'static str, f64),
    xticks: (f64, f64, f64),
}

const PANEL_H: f64 = 132.0;
const PANEL_GAP: f64 = 40.0;
const HEADER_H: f64 = 64.0;
const STRIP_H: f64 = 26.0;
const WF_H: f64 = 200.0;

impl Layout {
    fn new(tl: &Timeline, width: u32) -> Layout {
        let w = width as f64;
        let ml = 76.0;
        let pw = w - ml - 28.0;
        let mut y = HEADER_H;
        let strip = if tl.phases.is_empty() && tl.events.is_empty() {
            None
        } else {
            let s = Some((y + 4.0, STRIP_H));
            y += STRIP_H + 14.0;
            s
        };
        let mut panels = Vec::new();
        for c in &tl.charts {
            y += 22.0;
            let (mut lo, mut hi) = (f64::INFINITY, f64::NEG_INFINITY);
            for v in c.traces.iter().flat_map(|t| t.y.iter()).filter_map(|x| *x) {
                lo = lo.min(v);
                hi = hi.max(v);
            }
            if !lo.is_finite() {
                lo = 0.0;
                hi = 1.0;
            }
            if hi - lo < 1e-12 * lo.abs().max(1.0) {
                let pad = (lo.abs() * 0.1).max(1.0);
                lo -= pad;
                hi += pad;
            }
            let (lo, hi, step) = nice_ticks(lo, hi, 4);
            panels.push(Panel {
                top: y,
                h: PANEL_H,
                lo,
                hi,
                step,
            });
            y += PANEL_H + PANEL_GAP - 22.0;
        }
        let wf = tl.waterfall.as_ref().map(|_| {
            // Room for the time-axis title of the panels above.
            y += if panels.is_empty() { 22.0 } else { 40.0 };
            let r = (y, WF_H);
            y += WF_H + PANEL_GAP - 22.0;
            r
        });
        let axis_y = y - PANEL_GAP + 22.0;
        let lines_bottom = panels
            .last()
            .map(|p| p.top + p.h)
            .or(strip.map(|(sy, sh)| sy + sh))
            .unwrap_or(HEADER_H);
        let span = tl.t1 - tl.t0;
        let tdisp = time_display(&tl.t_unit, span);
        let xticks = nice_ticks(tl.t0 / tdisp.1, tl.t1 / tdisp.1, 6);
        Layout {
            w,
            h: axis_y + 44.0,
            ml,
            pw,
            strip,
            panels,
            wf,
            lines_bottom,
            t0: tl.t0,
            t1: tl.t1,
            tdisp,
            xticks,
        }
    }

    fn x(&self, t: f64) -> f64 {
        self.ml + (t - self.t0) / (self.t1 - self.t0) * self.pw
    }

    fn y(&self, p: &Panel, v: f64) -> f64 {
        p.top + p.h - (v - p.lo) / (p.hi - p.lo) * p.h
    }

    fn frac(&self, t: f64) -> f64 {
        ((t - self.t0) / (self.t1 - self.t0)).clamp(0.0, 1.0)
    }

    fn fmt_time(&self, t: f64) -> String {
        let (u, s) = self.tdisp;
        let step = self.xticks.2 / 10.0;
        format!("{} {u}", fmt_tick(t / s, step))
    }
}

// ---------------------------------------------------------------------------
// SVG (animated and per-frame)
// ---------------------------------------------------------------------------

const DARK_CSS: &str = ".bg{fill:#0c0b08}.fg{fill:#bcb3a3}.mu{fill:#8a8172}.gr{stroke:#262019}\
.ax{stroke:#342c21}.ph0{fill:#17130e}.ph1{fill:#211b14}.phl{fill:#bcb3a3}\
.ev{stroke:#8a8172}.eva{stroke:#e5645a}.evt{fill:#8a8172}.evta{fill:#e5645a}.cur{stroke:#f2e6cf}\
.s0{stroke:#e0bd84}.s1{stroke:#e5645a}.s2{stroke:#6fb3a8}.s3{stroke:#8fa3d9}.s4{stroke:#d2925e}.s5{stroke:#b58ad0}\
.f0{fill:#e0bd84}.f1{fill:#e5645a}.f2{fill:#6fb3a8}.f3{fill:#8fa3d9}.f4{fill:#d2925e}.f5{fill:#b58ad0}";

const LIGHT_CSS: &str = ".bg{fill:#faf7f1}.fg{fill:#2a241c}.mu{fill:#6b6255}.gr{stroke:#e8e1d5}\
.ax{stroke:#cbbfae}.ph0{fill:#f1ebe1}.ph1{fill:#e7dfd1}.phl{fill:#2a241c}\
.ev{stroke:#6b6255}.eva{stroke:#b3261e}.evt{fill:#6b6255}.evta{fill:#b3261e}.cur{stroke:#2a241c}\
.s0{stroke:#9a6b1f}.s1{stroke:#b3261e}.s2{stroke:#2f7f73}.s3{stroke:#3d5aa8}.s4{stroke:#a4521c}.s5{stroke:#7a4a9a}\
.f0{fill:#9a6b1f}.f1{fill:#b3261e}.f2{fill:#2f7f73}.f3{fill:#3d5aa8}.f4{fill:#a4521c}.f5{fill:#7a4a9a}";

const COMMON_CSS: &str = "text{font-family:system-ui,-apple-system,Segoe UI,Roboto,sans-serif}\
.tr{fill:none;stroke-width:1.6;stroke-linejoin:round}.ev,.eva{stroke-dasharray:3 3}.cur{stroke-width:1.4}";

/// Waterfall colour for a normalised level in [0, 1] (dark to warm).
fn wf_colour(x: f64) -> String {
    const STOPS: [(f64, [f64; 3]); 5] = [
        (0.0, [20.0, 14.0, 28.0]),
        (0.35, [90.0, 31.0, 74.0]),
        (0.65, [200.0, 85.0, 61.0]),
        (0.85, [224.0, 164.0, 88.0]),
        (1.0, [247.0, 231.0, 180.0]),
    ];
    let x = x.clamp(0.0, 1.0);
    let mut i = 0;
    while i + 2 < STOPS.len() && x > STOPS[i + 1].0 {
        i += 1;
    }
    let (a, ca) = STOPS[i];
    let (b, cb) = STOPS[i + 1];
    let f = ((x - a) / (b - a)).clamp(0.0, 1.0);
    let c: Vec<u8> = (0..3)
        .map(|k| (ca[k] + (cb[k] - ca[k]) * f).round() as u8)
        .collect();
    format!("#{:02x}{:02x}{:02x}", c[0], c[1], c[2])
}

const WF_LEVELS: f64 = 24.0;

/// One waterfall row as run-length-merged rectangles of quantised colour.
fn wf_row(out: &mut String, wf: &Waterfall, lay: &Layout, ri: usize, top: f64, rh: f64) {
    let row = &wf.rows[ri];
    let n = row.len();
    let cw = lay.pw / n as f64;
    let q = |v: Option<f64>| -> Option<i64> {
        v.map(|v| (((v - wf.lo) / (wf.hi - wf.lo)) * (WF_LEVELS - 1.0)).round() as i64)
    };
    let mut i = 0;
    while i < n {
        let lv = q(row[i]);
        let mut j = i + 1;
        while j < n && q(row[j]) == lv {
            j += 1;
        }
        if let Some(lv) = lv {
            let _ = write!(
                out,
                "<rect x=\"{:.1}\" y=\"{top:.1}\" width=\"{:.1}\" height=\"{rh:.2}\" fill=\"{}\"/>",
                lay.ml + i as f64 * cw,
                (j - i) as f64 * cw + 0.3,
                wf_colour(lv as f64 / (WF_LEVELS - 1.0))
            );
        }
        i = j;
    }
}

/// The static scaffold: background, titles, phase strip, panel frames, ticks, legends.
fn svg_scaffold(out: &mut String, tl: &Timeline, lay: &Layout) {
    let _ = write!(
        out,
        "<rect class=\"bg\" width=\"{:.0}\" height=\"{:.0}\"/>\
         <text class=\"fg\" x=\"24\" y=\"28\" font-size=\"16\" font-weight=\"bold\">{}</text>\
         <text class=\"mu\" x=\"24\" y=\"46\" font-size=\"11\">kind {} \u{b7} {} to {} \u{b7} samples from result.json, drawn without resampling \u{b7} Kshana {}</text>",
        lay.w,
        lay.h,
        esc(&tl.title),
        esc(&tl.kind),
        esc(&lay.fmt_time(tl.t0)),
        esc(&lay.fmt_time(tl.t1)),
        env!("CARGO_PKG_VERSION"),
    );
    if let Some((sy, sh)) = lay.strip {
        let _ = write!(
            out,
            "<text class=\"mu\" x=\"{:.0}\" y=\"{:.1}\" font-size=\"10\" text-anchor=\"end\">{}</text>",
            lay.ml - 8.0,
            sy + sh / 2.0 + 3.5,
            if tl.phases.is_empty() { "events" } else { "phases" }
        );
        for (i, p) in tl.phases.iter().enumerate() {
            let x0 = lay.x(p.t0);
            let x1 = lay.x(p.t1);
            let _ = write!(
                out,
                "<rect class=\"ph{}\" x=\"{x0:.1}\" y=\"{sy:.1}\" width=\"{:.1}\" height=\"{sh:.0}\"/>",
                i % 2,
                (x1 - x0).max(0.5)
            );
            if x1 - x0 > 36.0 {
                let max_chars = ((x1 - x0 - 8.0) / 6.2).max(3.0) as usize;
                let name: String = if p.name.chars().count() > max_chars {
                    let mut s: String = p.name.chars().take(max_chars - 1).collect();
                    s.push('\u{2026}');
                    s
                } else {
                    p.name.clone()
                };
                let _ = write!(
                    out,
                    "<text class=\"phl\" x=\"{:.1}\" y=\"{:.1}\" font-size=\"11\">{}</text>",
                    x0 + 5.0,
                    sy + sh / 2.0 + 4.0,
                    esc(&name)
                );
            }
        }
    }
    for (c, p) in tl.charts.iter().zip(&lay.panels) {
        let _ = write!(
            out,
            "<text class=\"fg\" x=\"{:.0}\" y=\"{:.0}\" font-size=\"12\">{}</text>",
            lay.ml,
            p.top - 8.0,
            esc(&c.title)
        );
        // Legend, right-aligned on the caption line.
        let mut lx = lay.ml + lay.pw;
        for (i, tr) in c.traces.iter().enumerate().rev() {
            let label: String = tr.label.chars().take(28).collect();
            let wlab = label.chars().count() as f64 * 6.0 + 22.0;
            lx -= wlab;
            let _ = write!(
                out,
                "<line class=\"s{k} tr\" x1=\"{lx:.1}\" y1=\"{yy:.1}\" x2=\"{:.1}\" y2=\"{yy:.1}\"/>\
                 <text class=\"f{k}\" x=\"{:.1}\" y=\"{:.1}\" font-size=\"10\">{}</text>",
                lx + 12.0,
                lx + 15.0,
                p.top - 8.0,
                esc(&label),
                k = i % 6,
                yy = p.top - 11.5,
            );
        }
        let mut v = p.lo;
        while v <= p.hi + p.step * 0.5 {
            let y = lay.y(p, v);
            let _ = write!(
                out,
                "<line class=\"gr\" x1=\"{:.0}\" y1=\"{y:.1}\" x2=\"{:.0}\" y2=\"{y:.1}\"/>\
                 <text class=\"mu\" x=\"{:.0}\" y=\"{:.1}\" font-size=\"10\" text-anchor=\"end\">{}</text>",
                lay.ml,
                lay.ml + lay.pw,
                lay.ml - 6.0,
                y + 3.5,
                fmt_tick(v, p.step)
            );
            v += p.step;
        }
        let _ = write!(
            out,
            "<line class=\"ax\" x1=\"{ml:.0}\" y1=\"{:.0}\" x2=\"{ml:.0}\" y2=\"{b:.0}\"/>\
             <line class=\"ax\" x1=\"{ml:.0}\" y1=\"{b:.0}\" x2=\"{:.0}\" y2=\"{b:.0}\"/>",
            p.top,
            lay.ml + lay.pw,
            ml = lay.ml,
            b = p.top + p.h,
        );
    }
    if let (Some(wf), Some((wy, wh))) = (&tl.waterfall, lay.wf) {
        let f0 = wf.freq_hz.first().copied().unwrap_or(0.0) / 1e6;
        let f1 = wf.freq_hz.last().copied().unwrap_or(1.0) / 1e6;
        let _ = write!(
            out,
            "<text class=\"fg\" x=\"{:.0}\" y=\"{:.0}\" font-size=\"12\">waterfall: {} [{}], time runs downward, colour {} to {}</text>\
             <text class=\"mu\" x=\"{:.0}\" y=\"{:.0}\" font-size=\"10\">{:.1} MHz</text>\
             <text class=\"mu\" x=\"{:.0}\" y=\"{:.0}\" font-size=\"10\" text-anchor=\"end\">{:.1} MHz</text>\
             <rect class=\"ax\" fill=\"none\" x=\"{:.0}\" y=\"{wy:.0}\" width=\"{:.0}\" height=\"{wh:.0}\"/>",
            lay.ml,
            wy - 8.0,
            esc(&humanise(&wf.title, "")),
            esc(&wf.unit),
            fmt_tick(wf.lo, 0.1),
            fmt_tick(wf.hi, 0.1),
            lay.ml,
            wy + wh + 14.0,
            f0,
            lay.ml + lay.pw,
            wy + wh + 14.0,
            f1,
            lay.ml,
            lay.pw,
        );
    }
    // Time axis under the last time panel.
    let (lo, hi, step) = lay.xticks;
    let mut v = lo;
    let last_panel_bottom = lay.panels.last().map(|p| p.top + p.h);
    while v <= hi + step * 0.5 {
        let t = v * lay.tdisp.1;
        if t >= lay.t0 - 1e-9 * (lay.t1 - lay.t0).abs()
            && t <= lay.t1 + 1e-9 * (lay.t1 - lay.t0).abs()
        {
            let x = lay.x(t);
            for p in &lay.panels {
                let _ = write!(
                    out,
                    "<line class=\"gr\" x1=\"{x:.1}\" y1=\"{:.0}\" x2=\"{x:.1}\" y2=\"{:.0}\"/>",
                    p.top,
                    p.top + p.h
                );
            }
            if let Some(b) = last_panel_bottom {
                let _ = write!(
                    out,
                    "<text class=\"mu\" x=\"{x:.1}\" y=\"{:.0}\" font-size=\"10\" text-anchor=\"middle\">{}</text>",
                    b + 14.0,
                    fmt_tick(v, step)
                );
            }
        }
        v += step;
    }
    let _ = write!(
        out,
        "<text class=\"mu\" x=\"{:.0}\" y=\"{:.0}\" font-size=\"11\" text-anchor=\"middle\">{}</text>",
        lay.ml + lay.pw / 2.0,
        match (last_panel_bottom, lay.wf) {
            (Some(b), Some(_)) => b + 30.0,
            _ => lay.h - 12.0,
        },
        if lay.tdisp.0 == "epoch" {
            "epoch index".to_string()
        } else {
            format!("mission time ({})", lay.tdisp.0)
        }
    );
}

/// Path data for a trace, up to time `until` (the whole trace when `None`), with an
/// interpolated end point at `until` and gaps where values are missing.
fn trace_path(lay: &Layout, p: &Panel, tr: &Trace, until: Option<f64>) -> String {
    let mut d = String::new();
    let mut pen = false;
    let clampy = |v: f64| v.clamp(p.lo, p.hi);
    for i in 0..tr.t.len() {
        let t = tr.t[i];
        if let Some(u) = until {
            if t > u {
                if let (true, Some(Some(a)), Some(b)) = (pen, tr.y.get(i.wrapping_sub(1)), tr.y[i])
                {
                    let ta = tr.t[i - 1];
                    let f = ((u - ta) / (t - ta)).clamp(0.0, 1.0);
                    let v = a + (b - a) * f;
                    let _ = write!(d, "L{:.1} {:.1}", lay.x(u), lay.y(p, clampy(v)));
                }
                break;
            }
        }
        match tr.y[i] {
            Some(v) => {
                let _ = write!(
                    d,
                    "{}{:.1} {:.1}",
                    if pen { "L" } else { "M" },
                    lay.x(t),
                    lay.y(p, clampy(v))
                );
                pen = true;
            }
            None => pen = false,
        }
    }
    d
}

fn event_marks(out: &mut String, tl: &Timeline, lay: &Layout, e: &Event, cls: &str) {
    let x = lay.x(e.t);
    let top = lay.strip.map(|s| s.0).unwrap_or(HEADER_H);
    let bottom = lay.lines_bottom;
    let (l, t) = if e.alarm {
        ("eva", "evta")
    } else {
        ("ev", "evt")
    };
    let label: String = e.label.chars().take(60).collect();
    let _ = write!(
        out,
        "<g class=\"{cls}\"><line class=\"{l}\" x1=\"{x:.1}\" y1=\"{top:.0}\" x2=\"{x:.1}\" y2=\"{bottom:.0}\"/>\
         <path class=\"{t}\" d=\"M{:.1} {:.1}L{:.1} {:.1}L{:.1} {:.1}Z\"/>\
         <title>{} at {}</title></g>",
        x - 4.0,
        top - 6.0,
        x + 4.0,
        top - 6.0,
        x,
        top,
        esc(&label),
        esc(&lay.fmt_time(e.t)),
    );
    let _ = tl;
}

fn svg_open(lay: &Layout, tl: &Timeline, css: &str) -> String {
    format!(
        "<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"{w:.0}\" height=\"{h:.0}\" viewBox=\"0 0 {w:.0} {h:.0}\" role=\"img\" aria-labelledby=\"kx-title kx-desc\">\
         <title id=\"kx-title\">{title}</title>\
         <desc id=\"kx-desc\">Animated time series of a {kind} run: {n} panel(s), {e} event(s), {p} phase(s). \
         Every point is a sample from the run's result.json.</desc><style>{css}</style>",
        w = lay.w,
        h = lay.h,
        title = esc(&tl.title),
        kind = esc(&tl.kind),
        n = tl.charts.len() + usize::from(tl.waterfall.is_some()),
        e = tl.events.len(),
        p = tl.phases.len(),
    )
}

fn pct(x: f64) -> String {
    format!("{:.3}%", (x * 100.0).clamp(0.0, 100.0))
}

/// Render the animated SVG: traces draw in behind a moving time cursor, events appear
/// at their instant, waterfall rows reveal in time order. CSS keyframes only, no
/// script; under `prefers-reduced-motion: reduce` every animation is switched off and
/// the finished picture is shown.
pub fn render_svg(tl: &Timeline, opts: &AnimationOptions) -> String {
    let lay = Layout::new(tl, opts.width);
    let hold = 1.5;
    let cycle = opts.duration_s + hold;
    let p_end = opts.duration_s / cycle;
    let mut css = String::new();
    css.push_str(COMMON_CSS);
    css.push_str(DARK_CSS);
    let _ = write!(
        css,
        "@media (prefers-color-scheme: light){{{LIGHT_CSS}}}\
         .kx-anim{{animation-duration:{cycle:.3}s;animation-iteration-count:infinite;animation-timing-function:linear;animation-fill-mode:both}}\
         .kx-reveal{{transform-box:view-box;transform-origin:{ml:.1}px 0px;animation-name:kx-reveal}}\
         @keyframes kx-reveal{{0%{{transform:scaleX(0)}}{pe}{{transform:scaleX(1)}}100%{{transform:scaleX(1)}}}}\
         .kx-cursor{{transform:translateX({pw:.1}px);animation-name:kx-cursor}}\
         @keyframes kx-cursor{{0%{{transform:translateX(0px)}}{pe}{{transform:translateX({pw:.1}px)}}100%{{transform:translateX({pw:.1}px)}}}}",
        ml = lay.ml,
        pw = lay.pw,
        pe = pct(p_end),
    );
    if let (Some(wf), Some((wy, wf_h))) = (&tl.waterfall, lay.wf) {
        let a = lay.frac(wf.t.first().copied().unwrap_or(lay.t0)) * p_end;
        let b = lay.frac(wf.t.last().copied().unwrap_or(lay.t1)) * p_end;
        let _ = write!(
            css,
            ".kx-wf{{transform-box:view-box;transform-origin:0px {wy:.1}px;animation-name:kx-wf}}\
             @keyframes kx-wf{{0%{{transform:scaleY(0)}}{a}{{transform:scaleY(0)}}{b}{{transform:scaleY(1)}}100%{{transform:scaleY(1)}}}}\
             .kx-wfcur{{transform:translateY({wh:.1}px);animation-name:kx-wfcur}}\
             @keyframes kx-wfcur{{0%{{transform:translateY(0px)}}{a}{{transform:translateY(0px)}}{b}{{transform:translateY({wh:.1}px)}}100%{{transform:translateY({wh:.1}px)}}}}",
            a = pct(a),
            b = pct(b.max(a + 1e-5)),
            wh = wf_h,
        );
    }
    for (i, e) in tl.events.iter().enumerate() {
        let f = lay.frac(e.t) * p_end;
        let _ = write!(
            css,
            ".kx-e{i}{{animation-name:kx-e{i}}}@keyframes kx-e{i}{{0%{{opacity:0}}{}{{opacity:0}}{}{{opacity:1}}100%{{opacity:1}}}}",
            pct(f),
            pct((f + 0.0001).min(1.0)),
        );
    }
    css.push_str("@media (prefers-reduced-motion: reduce){.kx-anim{animation:none!important}}");

    let mut out = svg_open(&lay, tl, &css);
    svg_scaffold(&mut out, tl, &lay);
    // Clip that grows left to right with mission time.
    let top = lay.strip.map(|s| s.0).unwrap_or(HEADER_H) - 8.0;
    let _ = write!(
        out,
        "<defs><clipPath id=\"kx-clip\"><rect class=\"kx-anim kx-reveal\" x=\"{:.1}\" y=\"{top:.0}\" width=\"{:.1}\" height=\"{:.0}\"/></clipPath>",
        lay.ml - 2.0,
        lay.pw + 4.0,
        lay.h - top
    );
    if let Some((wy, wh)) = lay.wf {
        let _ = write!(
            out,
            "<clipPath id=\"kx-wfclip\"><rect class=\"kx-anim kx-wf\" x=\"{:.1}\" y=\"{wy:.1}\" width=\"{:.1}\" height=\"{wh:.1}\"/></clipPath>",
            lay.ml,
            lay.pw
        );
    }
    out.push_str("</defs><g clip-path=\"url(#kx-clip)\">");
    for (c, p) in tl.charts.iter().zip(&lay.panels) {
        for (i, tr) in c.traces.iter().enumerate() {
            let _ = write!(
                out,
                "<path class=\"tr s{}\" d=\"{}\"/>",
                i % 6,
                trace_path(&lay, p, tr, None)
            );
        }
    }
    out.push_str("</g>");
    if let (Some(wf), Some((wy, wh))) = (&tl.waterfall, lay.wf) {
        out.push_str("<g clip-path=\"url(#kx-wfclip)\">");
        let rh = wh / wf.rows.len() as f64;
        for ri in 0..wf.rows.len() {
            wf_row(&mut out, wf, &lay, ri, wy + ri as f64 * rh, rh + 0.2);
        }
        out.push_str("</g>");
    }
    for (i, e) in tl.events.iter().enumerate() {
        event_marks(&mut out, tl, &lay, e, &format!("kx-anim kx-e{i}"));
    }
    if let (Some(_), Some((wy, _))) = (&tl.waterfall, lay.wf) {
        let _ = write!(
            out,
            "<g class=\"kx-anim kx-wfcur\"><line class=\"cur\" x1=\"{:.1}\" y1=\"{wy:.1}\" x2=\"{:.1}\" y2=\"{wy:.1}\"/></g>",
            lay.ml,
            lay.ml + lay.pw
        );
    }
    if !tl.charts.is_empty() || lay.strip.is_some() {
        let _ = write!(
            out,
            "<g class=\"kx-anim kx-cursor\"><line class=\"cur\" x1=\"{ml:.1}\" y1=\"{top:.0}\" x2=\"{ml:.1}\" y2=\"{:.0}\"/></g>",
            lay.lines_bottom,
            ml = lay.ml,
        );
    }
    out.push_str("</svg>\n");
    out
}

/// Render one static frame at mission time `tc`.
fn render_frame(tl: &Timeline, lay: &Layout, tc: f64, css: &str) -> String {
    let mut out = svg_open(lay, tl, css);
    svg_scaffold(&mut out, tl, lay);
    // Highlight the current phase and name it with the time readout.
    let phase = tl.phases.iter().find(|p| tc >= p.t0 && tc <= p.t1);
    for (c, p) in tl.charts.iter().zip(&lay.panels) {
        for (i, tr) in c.traces.iter().enumerate() {
            let d = trace_path(lay, p, tr, Some(tc));
            if !d.is_empty() {
                let _ = write!(out, "<path class=\"tr s{}\" d=\"{d}\"/>", i % 6);
            }
        }
    }
    if let (Some(wf), Some((wy, wh))) = (&tl.waterfall, lay.wf) {
        let rh = wh / wf.rows.len() as f64;
        for (ri, t) in wf.t.iter().enumerate() {
            if *t > tc {
                break;
            }
            wf_row(&mut out, wf, lay, ri, wy + ri as f64 * rh, rh + 0.2);
        }
    }
    for e in tl.events.iter().filter(|e| e.t <= tc) {
        event_marks(&mut out, tl, lay, e, "ev-on");
    }
    let x = lay.x(tc);
    let top = lay.strip.map(|s| s.0).unwrap_or(HEADER_H) - 8.0;
    let readout = match phase {
        Some(p) => format!("t = {} \u{b7} {}", lay.fmt_time(tc), p.name),
        None => format!("t = {}", lay.fmt_time(tc)),
    };
    if !tl.charts.is_empty() || lay.strip.is_some() {
        let _ = write!(
            out,
            "<line class=\"cur\" x1=\"{x:.1}\" y1=\"{top:.0}\" x2=\"{x:.1}\" y2=\"{:.0}\"/>",
            lay.lines_bottom,
        );
    }
    if let (Some(wf), Some((wy, wh))) = (&tl.waterfall, lay.wf) {
        let shown = wf.t.iter().take_while(|t| **t <= tc).count();
        let y = wy + wh * shown as f64 / wf.rows.len().max(1) as f64;
        let _ = write!(
            out,
            "<line class=\"cur\" x1=\"{:.1}\" y1=\"{y:.1}\" x2=\"{:.1}\" y2=\"{y:.1}\"/>",
            lay.ml,
            lay.ml + lay.pw
        );
    }
    let _ = writeln!(
        out,
        "<text class=\"fg\" x=\"{:.0}\" y=\"28\" font-size=\"13\" text-anchor=\"end\">{}</text></svg>",
        lay.w - 24.0,
        esc(&readout)
    );
    out
}

/// Render the frame sequence: `round(duration_s * fps)` static SVG frames spanning the
/// timeline end to end, plus `manifest.json`.
pub fn render_frames(tl: &Timeline, opts: &AnimationOptions) -> Vec<AnimationFile> {
    let lay = Layout::new(tl, opts.width);
    let mut css = String::from(COMMON_CSS);
    css.push_str(DARK_CSS);
    let n = opts.frame_count().max(2);
    let mut files = Vec::with_capacity(n + 1);
    let mut times = Vec::with_capacity(n);
    for i in 0..n {
        let tc = tl.t0 + (tl.t1 - tl.t0) * i as f64 / (n - 1) as f64;
        times.push(tc);
        files.push(AnimationFile {
            name: format!("frame_{i:04}.svg"),
            content: render_frame(tl, &lay, tc, &css),
        });
    }
    let manifest = serde_json::json!({
        "format": "kshana-animation-frames",
        "format_version": 1,
        "engine_version": env!("CARGO_PKG_VERSION"),
        "kind": tl.kind,
        "title": tl.title,
        "fps": opts.fps,
        "duration_s": opts.duration_s,
        "frame_count": n,
        "frame_pattern": "frame_%04d.svg",
        "width": lay.w as u64,
        "height": lay.h as u64,
        "t_start": tl.t0,
        "t_end": tl.t1,
        "t_unit": tl.t_unit,
        "frame_times": times,
        "charts": tl.charts.iter().map(|c| c.title.clone()).collect::<Vec<_>>(),
        "phases": tl.phases.iter().map(|p| serde_json::json!({"name": p.name, "t0": p.t0, "t1": p.t1})).collect::<Vec<_>>(),
        "events": tl.events.iter().map(|e| serde_json::json!({"t": e.t, "label": e.label, "alarm": e.alarm})).collect::<Vec<_>>(),
        "sources": tl.sources,
        "omitted": tl.omitted,
        "encode": format!(
            "ffmpeg -framerate {} -i frame_%04d.svg -pix_fmt yuv420p animation.mp4  (needs an ffmpeg built with librsvg; otherwise rasterise the frames first)",
            opts.fps
        ),
        "tier": "MODELLED: a rendering of the run's own samples; it adds no evidence",
    });
    files.push(AnimationFile {
        name: "manifest.json".into(),
        content: serde_json::to_string_pretty(&manifest).unwrap_or_default() + "\n",
    });
    files
}

// ---------------------------------------------------------------------------
// HTML player
// ---------------------------------------------------------------------------

fn opt_json(y: &[Option<f64>]) -> Value {
    Value::Array(
        y.iter()
            .map(|v| match v {
                Some(x) => serde_json::json!(x),
                None => Value::Null,
            })
            .collect(),
    )
}

fn player_data(tl: &Timeline, opts: &AnimationOptions) -> Value {
    let lay = Layout::new(tl, opts.width);
    serde_json::json!({
        "title": tl.title,
        "kind": tl.kind,
        "t0": tl.t0,
        "t1": tl.t1,
        "tUnit": lay.tdisp.0,
        "tScale": lay.tdisp.1,
        "duration": opts.duration_s,
        "charts": tl.charts.iter().zip(&lay.panels).map(|(c, p)| serde_json::json!({
            "title": c.title,
            "unit": c.unit,
            "lo": p.lo, "hi": p.hi, "step": p.step,
            "traces": c.traces.iter().map(|t| serde_json::json!({
                "label": t.label, "t": t.t, "y": opt_json(&t.y),
            })).collect::<Vec<_>>(),
        })).collect::<Vec<_>>(),
        "phases": tl.phases.iter().map(|p| serde_json::json!({"name": p.name, "t0": p.t0, "t1": p.t1})).collect::<Vec<_>>(),
        "events": tl.events.iter().map(|e| serde_json::json!({"t": e.t, "label": e.label, "alarm": e.alarm})).collect::<Vec<_>>(),
        "waterfall": tl.waterfall.as_ref().map(|w| serde_json::json!({
            "title": humanise(&w.title, ""),
            "unit": w.unit,
            "t": w.t,
            "f0": w.freq_hz.first().copied().unwrap_or(0.0),
            "f1": w.freq_hz.last().copied().unwrap_or(0.0),
            "lo": w.lo, "hi": w.hi,
            "rows": w.rows.iter().map(|r| opt_json(r)).collect::<Vec<_>>(),
            "colours": (0..WF_LEVELS as usize).map(|i| wf_colour(i as f64 / (WF_LEVELS - 1.0))).collect::<Vec<_>>(),
        })),
        "sources": tl.sources,
        "omitted": tl.omitted,
    })
}

const PLAYER_CSS: &str = r#":root{color-scheme:light dark;--bg:#faf7f1;--panel:#fffdf9;--fg:#2a241c;--mu:#6b6255;--grid:#e8e1d5;--axis:#cbbfae;--ph0:#f1ebe1;--ph1:#e7dfd1;--cur:#2a241c;--alarm:#b3261e;--s0:#9a6b1f;--s1:#b3261e;--s2:#2f7f73;--s3:#3d5aa8;--s4:#a4521c;--s5:#7a4a9a}
@media (prefers-color-scheme: dark){:root{--bg:#0c0b08;--panel:#12100c;--fg:#bcb3a3;--mu:#8a8172;--grid:#262019;--axis:#342c21;--ph0:#17130e;--ph1:#211b14;--cur:#f2e6cf;--alarm:#e5645a;--s0:#e0bd84;--s1:#e5645a;--s2:#6fb3a8;--s3:#8fa3d9;--s4:#d2925e;--s5:#b58ad0}}
*{box-sizing:border-box}
body{margin:0;background:var(--bg);color:var(--fg);font-family:system-ui,-apple-system,Segoe UI,Roboto,sans-serif;line-height:1.45}
main{max-width:1100px;margin:0 auto;padding:20px 16px 40px}
h1{font-size:1.25rem;margin:0 0 2px}
.sub{color:var(--mu);font-size:.82rem;margin:0 0 14px}
.bar{position:sticky;top:0;z-index:2;display:flex;flex-wrap:wrap;gap:10px;align-items:center;padding:10px 0;background:var(--bg);border-bottom:1px solid var(--axis)}
button,select{font:inherit;color:var(--fg);background:var(--panel);border:1px solid var(--axis);border-radius:6px;padding:5px 12px;cursor:pointer}
button:focus-visible,select:focus-visible,input:focus-visible{outline:2px solid var(--s3);outline-offset:2px}
input[type=range]{flex:1 1 260px;min-width:160px;accent-color:var(--s0)}
.now{font-variant-numeric:tabular-nums;min-width:15ch;color:var(--fg)}
.phase{color:var(--mu);font-size:.85rem}
figure{margin:16px 0 0;background:var(--panel);border:1px solid var(--axis);border-radius:8px;padding:10px 12px}
figcaption{display:flex;flex-wrap:wrap;justify-content:space-between;gap:6px 14px;font-size:.85rem;margin-bottom:4px}
.legend{display:flex;flex-wrap:wrap;gap:4px 14px;color:var(--mu);font-variant-numeric:tabular-nums}
.legend i{display:inline-block;width:12px;height:3px;border-radius:2px;margin-right:5px;vertical-align:middle}
canvas{display:block;width:100%}
ol.events{padding-left:1.2rem;font-size:.85rem}
ol.events button{padding:1px 8px;margin-right:6px;font-variant-numeric:tabular-nums}
.alarm{color:var(--alarm)}
footer{margin-top:24px;color:var(--mu);font-size:.8rem}
@media (prefers-reduced-motion: reduce){*{transition:none!important;animation:none!important;scroll-behavior:auto!important}}"#;

const PLAYER_JS: &str = r#"(function(){
"use strict";
var D=JSON.parse(document.getElementById("kx-data").textContent);
var span=D.t1-D.t0, frac=0, playing=false, speed=1, last=null;
var reduce=window.matchMedia&&window.matchMedia("(prefers-reduced-motion: reduce)");
var $=function(id){return document.getElementById(id);};
var css=function(n){return getComputedStyle(document.documentElement).getPropertyValue(n).trim();};
var ML=64, MR=12;
function fmt(v,step){if(v===null||!isFinite(v))return "—";var a=Math.abs(v);if(a!==0&&(a>=1e6||a<1e-3))return v.toExponential(2);var d=Math.max(0,Math.min(6,-Math.floor(Math.log10(step||1))));return v.toFixed(d);}
function tfmt(t){var s=span/D.tScale/1000;return fmt(t/D.tScale,s>0?Math.pow(10,Math.floor(Math.log10(s))):1)+" "+D.tUnit;}
function el(tag,cls,txt){var e=document.createElement(tag);if(cls)e.className=cls;if(txt!==undefined)e.textContent=txt;return e;}
var figs=[], root=$("kx-charts");
function addFig(title,h){var f=el("figure"),c=el("figcaption"),t=el("span","",title),lg=el("span","legend"),cv=el("canvas");cv.height=h;cv.setAttribute("role","img");cv.setAttribute("aria-label",title);c.appendChild(t);c.appendChild(lg);f.appendChild(c);f.appendChild(cv);root.appendChild(f);return {cv:cv,lg:lg,h:h};}
if(D.phases.length||D.events.length){figs.push({kind:"strip",f:addFig("phases and events",40)});}
D.charts.forEach(function(c){var f=addFig(c.title,150),items=[];c.traces.forEach(function(tr,i){var s=el("span"),sw=el("i"),v=el("b");sw.style.background="var(--s"+(i%6)+")";s.appendChild(sw);s.appendChild(document.createTextNode(tr.label+" "));s.appendChild(v);f.lg.appendChild(s);items.push(v);});figs.push({kind:"chart",c:c,f:f,vals:items});});
if(D.waterfall){figs.push({kind:"wf",w:D.waterfall,f:addFig("waterfall: "+D.waterfall.title+" ["+D.waterfall.unit+"], time runs downward",220)});}
var evl=$("kx-events");
D.events.forEach(function(e){var li=el("li",e.alarm?"alarm":""),b=el("button","",tfmt(e.t));b.addEventListener("click",function(){seek((e.t-D.t0)/span);});li.appendChild(b);li.appendChild(document.createTextNode(e.label));evl.appendChild(li);});
if(!D.events.length){$("kx-events-h").hidden=true;}
function size(cv,h){var dpr=window.devicePixelRatio||1,w=cv.clientWidth||800;if(cv.width!==Math.round(w*dpr)){cv.width=Math.round(w*dpr);cv.height=Math.round(h*dpr);cv.style.height=h+"px";}var g=cv.getContext("2d");g.setTransform(dpr,0,0,dpr,0,0);return {g:g,w:w,h:h};}
function X(t,w){return ML+(t-D.t0)/span*(w-ML-MR);}
function valueAt(tr,t){var lo=0,hi=tr.t.length-1;if(t<tr.t[0])return null;while(lo<hi){var m=(lo+hi+1)>>1;if(tr.t[m]<=t)lo=m;else hi=m-1;}return tr.y[lo];}
function events(g,w,h,tc){D.events.forEach(function(e){if(e.t>tc)return;var x=X(e.t,w);g.strokeStyle=e.alarm?css("--alarm"):css("--mu");g.setLineDash([3,3]);g.beginPath();g.moveTo(x,0);g.lineTo(x,h);g.stroke();g.setLineDash([]);});}
function cursor(g,w,h,tc){var x=X(tc,w);g.strokeStyle=css("--cur");g.lineWidth=1.4;g.beginPath();g.moveTo(x,0);g.lineTo(x,h);g.stroke();g.lineWidth=1;}
function draw(){var tc=D.t0+frac*span;var ph=null;
figs.forEach(function(F){var s=size(F.f.cv,F.f.h),g=s.g,w=s.w,h=s.h;g.fillStyle=css("--panel");g.fillRect(0,0,w,h);g.font="11px system-ui,sans-serif";
if(F.kind==="strip"){D.phases.forEach(function(p,i){var x0=X(p.t0,w),x1=X(p.t1,w);g.fillStyle=css(i%2?"--ph1":"--ph0");g.fillRect(x0,6,Math.max(1,x1-x0),h-12);if(tc>=p.t0&&tc<=p.t1){ph=p.name;g.strokeStyle=css("--s0");g.strokeRect(x0+.5,6.5,Math.max(1,x1-x0)-1,h-13);}g.fillStyle=css("--fg");if(x1-x0>40){g.save();g.beginPath();g.rect(x0,0,x1-x0-4,h);g.clip();g.fillText(p.name,x0+5,h/2+4);g.restore();}});
D.events.forEach(function(e){var x=X(e.t,w);g.fillStyle=e.t<=tc?(e.alarm?css("--alarm"):css("--mu")):css("--grid");g.beginPath();g.moveTo(x-5,2);g.lineTo(x+5,2);g.lineTo(x,10);g.fill();});cursor(g,w,h,tc);return;}
if(F.kind==="chart"){var c=F.c,ph2=h-18,Y=function(v){v=Math.max(c.lo,Math.min(c.hi,v));return 4+(ph2-4)-(v-c.lo)/(c.hi-c.lo)*(ph2-4);};
g.strokeStyle=css("--grid");g.fillStyle=css("--mu");g.textAlign="right";for(var v=c.lo;v<=c.hi+c.step/2;v+=c.step){var y=Y(v);g.beginPath();g.moveTo(ML,y);g.lineTo(w-MR,y);g.stroke();g.fillText(fmt(v,c.step),ML-6,y+3.5);}
g.textAlign="center";var xs=Math.pow(10,Math.floor(Math.log10(span/D.tScale/5||1)));for(var k=Math.ceil(D.t0/D.tScale/xs);k*xs<=D.t1/D.tScale+1e-9;k++){var x=X(k*xs*D.tScale,w);g.beginPath();g.moveTo(x,4);g.lineTo(x,ph2);g.stroke();g.fillText(fmt(k*xs,xs),x,h-4);}
g.strokeStyle=css("--axis");g.beginPath();g.moveTo(ML,4);g.lineTo(ML,ph2);g.lineTo(w-MR,ph2);g.stroke();
events(g,w,ph2,tc);
c.traces.forEach(function(tr,i){g.strokeStyle=css("--s"+(i%6));g.lineWidth=1.6;g.beginPath();var pen=false;for(var j=0;j<tr.t.length;j++){if(tr.t[j]>tc){if(pen&&j>0&&tr.y[j]!==null){var f=(tc-tr.t[j-1])/(tr.t[j]-tr.t[j-1]);g.lineTo(X(tc,w),Y(tr.y[j-1]+(tr.y[j]-tr.y[j-1])*f));}break;}var yv=tr.y[j];if(yv===null){pen=false;continue;}if(pen)g.lineTo(X(tr.t[j],w),Y(yv));else g.moveTo(X(tr.t[j],w),Y(yv));pen=true;}g.stroke();g.lineWidth=1;F.vals[i].textContent=fmt(valueAt(tr,tc),c.step/100)+(c.unit&&c.unit!=="1"?" "+c.unit:"");});
cursor(g,w,ph2,tc);return;}
if(F.kind==="wf"){var W=F.w,n=W.rows.length,rh=(h-18)/n,cw=(w-ML-MR)/W.rows[0].length,L=W.colours.length;
for(var r=0;r<n;r++){if(W.t[r]>tc)break;var row=W.rows[r];for(var q=0;q<row.length;q++){if(row[q]===null)continue;var lv=Math.round((row[q]-W.lo)/(W.hi-W.lo)*(L-1));g.fillStyle=W.colours[Math.max(0,Math.min(L-1,lv))];g.fillRect(ML+q*cw,r*rh,cw+.5,rh+.5);}}
g.strokeStyle=css("--axis");g.strokeRect(ML+.5,.5,w-ML-MR-1,h-18);g.fillStyle=css("--mu");g.textAlign="left";g.fillText((W.f0/1e6).toFixed(1)+" MHz",ML,h-4);g.textAlign="right";g.fillText((W.f1/1e6).toFixed(1)+" MHz",w-MR,h-4);
var rr=0;while(rr<n-1&&W.t[rr+1]<=tc)rr++;g.strokeStyle=css("--cur");g.beginPath();g.moveTo(ML,(rr+1)*rh);g.lineTo(w-MR,(rr+1)*rh);g.stroke();}
});
$("kx-now").textContent="t = "+tfmt(tc);$("kx-phase").textContent=ph?("phase: "+ph):"";$("kx-scrub").value=Math.round(frac*1000);$("kx-scrub").setAttribute("aria-valuetext",tfmt(tc));}
function tick(ts){if(!playing){last=null;return;}if(last!==null){frac+=(ts-last)/1000*speed/D.duration;if(frac>=1){frac=1;setPlaying(false);}}last=ts;draw();if(playing)requestAnimationFrame(tick);}
function setPlaying(p){playing=p;$("kx-play").textContent=p?"Pause":"Play";$("kx-play").setAttribute("aria-pressed",p?"true":"false");if(p){if(frac>=1)frac=0;last=null;requestAnimationFrame(tick);}}
function seek(f){frac=Math.max(0,Math.min(1,f));draw();}
$("kx-play").addEventListener("click",function(){setPlaying(!playing);});
$("kx-scrub").addEventListener("input",function(e){seek(e.target.value/1000);});
$("kx-speed").addEventListener("change",function(e){speed=parseFloat(e.target.value)||1;});
document.addEventListener("keydown",function(e){if(e.target.tagName==="INPUT"||e.target.tagName==="SELECT"||e.target.tagName==="BUTTON")return;if(e.key===" "){e.preventDefault();setPlaying(!playing);}else if(e.key==="ArrowRight"){seek(frac+0.01);}else if(e.key==="ArrowLeft"){seek(frac-0.01);}else if(e.key==="Home"){seek(0);}else if(e.key==="End"){seek(1);}});
window.addEventListener("resize",draw);
if(window.matchMedia){var cs=window.matchMedia("(prefers-color-scheme: dark)");if(cs.addEventListener)cs.addEventListener("change",draw);}
if(reduce&&reduce.matches){frac=1;draw();}else{frac=0;draw();setPlaying(true);}
})();"#;

/// Render the self-contained HTML player: play and pause, a scrubber, playback speed,
/// every panel on one synced cursor, the phase strip and clickable event markers. The
/// theme follows `prefers-color-scheme`; under `prefers-reduced-motion: reduce` the
/// player opens paused on the finished picture instead of playing. No external asset:
/// the samples ride in an inline JSON block and the drawing is done on canvases.
pub fn render_html(tl: &Timeline, opts: &AnimationOptions) -> String {
    let data = serde_json::to_string(&player_data(tl, opts)).unwrap_or_else(|_| "{}".into());
    // Nothing inside the JSON block may close the script element.
    let data = data.replace("</", "<\\/");
    let omitted = if tl.omitted.is_empty() {
        String::new()
    } else {
        format!(
            " {} further series were found but not drawn (the player shows at most {MAX_CHARTS} panels of {MAX_TRACES} traces); they are listed in the manifest of the frames export.",
            tl.omitted.len()
        )
    };
    format!(
        "<!doctype html>\n<html lang=\"en\">\n<head>\n<meta charset=\"utf-8\"/>\n\
         <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\"/>\n\
         <title>{title} \u{2014} Kshana animation</title>\n<style>\n{PLAYER_CSS}\n</style>\n</head>\n<body>\n<main>\n\
         <h1>{title}</h1>\n\
         <p class=\"sub\">kind {kind} \u{b7} {n} series from result.json, drawn without resampling \u{b7} Kshana {version}</p>\n\
         <div class=\"bar\" role=\"group\" aria-label=\"Playback\">\
         <button id=\"kx-play\" type=\"button\" aria-pressed=\"false\">Play</button>\
         <input id=\"kx-scrub\" type=\"range\" min=\"0\" max=\"1000\" value=\"0\" aria-label=\"Mission time\"/>\
         <label>speed <select id=\"kx-speed\" aria-label=\"Playback speed\">\
         <option value=\"0.25\">0.25x</option><option value=\"0.5\">0.5x</option><option value=\"1\" selected>1x</option>\
         <option value=\"2\">2x</option><option value=\"4\">4x</option></select></label>\
         <span id=\"kx-now\" class=\"now\" aria-live=\"off\"></span><span id=\"kx-phase\" class=\"phase\"></span></div>\n\
         <div id=\"kx-charts\"></div>\n\
         <h2 id=\"kx-events-h\" style=\"font-size:1rem;margin-top:22px\">Events</h2>\n<ol id=\"kx-events\" class=\"events\"></ol>\n\
         <footer>Space plays or pauses, the arrow keys step, Home and End jump. \
         This is a rendering of the run's own samples: it is exactly as good as the run and adds no evidence \
         (MODELLED, internal consistency).{omitted} Same scenario, seed and options give a byte-identical file.</footer>\n\
         </main>\n<script type=\"application/json\" id=\"kx-data\">{data}</script>\n<script>\n{PLAYER_JS}\n</script>\n</body>\n</html>\n",
        title = esc(&tl.title),
        kind = esc(&tl.kind),
        n = tl.sources.len(),
        version = env!("CARGO_PKG_VERSION"),
    )
}

// ---------------------------------------------------------------------------
// Entry points
// ---------------------------------------------------------------------------

/// Animate one result document in one format.
pub fn animate_result(
    json: &str,
    kind: Option<&str>,
    format: AnimationFormat,
    opts: &AnimationOptions,
) -> Result<Animation, AnimationError> {
    opts.validate().map_err(AnimationError::Invalid)?;
    let tl = extract_timeline(json, kind)?;
    let files = match format {
        AnimationFormat::Svg => vec![AnimationFile {
            name: "animation.svg".into(),
            content: render_svg(&tl, opts),
        }],
        AnimationFormat::Html => vec![AnimationFile {
            name: "animation.html".into(),
            content: render_html(&tl, opts),
        }],
        AnimationFormat::Frames => render_frames(&tl, opts),
    };
    let frame_count = match format {
        AnimationFormat::Frames => files.len() - 1,
        _ => 0,
    };
    Ok(Animation {
        format,
        files,
        frame_count,
    })
}

/// The `animation` block the CLI splices into `result.json` when `--animate` ran: what
/// was drawn and from where. Deterministic, and carries no timestamp.
pub fn animation_meta(
    json: &str,
    kind: Option<&str>,
    formats: &[AnimationFormat],
    opts: &AnimationOptions,
    files: &[String],
) -> Result<Value, AnimationError> {
    let tl = extract_timeline(json, kind)?;
    Ok(serde_json::json!({
        "formats": formats.iter().map(|f| f.as_str()).collect::<Vec<_>>(),
        "fps": opts.fps,
        "duration_s": opts.duration_s,
        "frame_count": if formats.contains(&AnimationFormat::Frames) { opts.frame_count() } else { 0 },
        "t_start": tl.t0,
        "t_end": tl.t1,
        "t_unit": tl.t_unit,
        "charts": tl.charts.iter().map(|c| c.title.clone()).collect::<Vec<_>>(),
        "phases": tl.phases.len(),
        "events": tl.events.len(),
        "waterfall": tl.waterfall.is_some(),
        "sources": tl.sources,
        "omitted": tl.omitted,
        "files": files,
        "tier": "MODELLED",
    }))
}

/// Splice an `animation` block into a pretty result document, after the opening brace,
/// the same way [`crate::api::with_study_meta`] adds `meta`. A document that is not a
/// pretty object is returned unchanged.
pub fn with_animation_meta(json: &str, meta: &Value) -> String {
    let Ok(meta_json) = serde_json::to_string_pretty(meta) else {
        return json.to_string();
    };
    let Some(rest) = json.strip_prefix("{\n") else {
        return json.to_string();
    };
    let indented: String = meta_json
        .lines()
        .map(|l| format!("  {l}"))
        .collect::<Vec<_>>()
        .join("\n");
    format!("{{\n  \"animation\": {},\n{rest}", indented.trim_start())
}

#[cfg(test)]
mod tests {
    use super::*;

    fn clock_json() -> String {
        crate::api::run_toml(include_str!("../scenarios/clock-holdover.toml"))
            .expect("clock runs")
            .json
    }

    #[test]
    fn format_list_parses_all_and_dedups() {
        assert_eq!(
            AnimationFormat::parse_list("all").unwrap(),
            AnimationFormat::ALL.to_vec()
        );
        assert_eq!(
            AnimationFormat::parse_list("html,svg,html").unwrap(),
            vec![AnimationFormat::Svg, AnimationFormat::Html]
        );
        assert!(AnimationFormat::parse_list("gif").is_err());
        assert!(AnimationFormat::parse_list("").is_err());
    }

    #[test]
    fn options_are_validated() {
        let mut o = AnimationOptions::default();
        assert!(o.validate().is_ok());
        assert_eq!(o.frame_count(), 96);
        o.fps = 0;
        assert!(o.validate().is_err());
        o = AnimationOptions {
            duration_s: f64::NAN,
            ..Default::default()
        };
        assert!(o.validate().is_err());
    }

    #[test]
    fn clock_series_become_one_panel_with_two_traces() {
        let tl = extract_timeline(&clock_json(), Some("clock")).unwrap();
        let err = tl
            .charts
            .iter()
            .find(|c| c.title.starts_with("error"))
            .expect("error panel");
        let labels: Vec<&str> = err.traces.iter().map(|t| t.label.as_str()).collect();
        assert_eq!(labels, vec!["classical", "quantum"]);
        assert_eq!(err.unit, "ns");
        assert_eq!(tl.t_unit, "s");
        assert!(tl.t1 > tl.t0);
    }

    #[test]
    fn nice_ticks_cover_the_range() {
        // Span 9.4 over 4 intervals is 2.35; the next of 1, 2, 5, 10 at or above it is
        // 5, and 0.3..9.7 widens to the multiples of 5 around it.
        let (lo, hi, step) = nice_ticks(0.3, 9.7, 4);
        assert_eq!((lo, hi, step), (0.0, 10.0, 5.0));
        // Span 90 over 4 is 22.5: magnitude 10, normalised 2.25, so the step is 50.
        assert_eq!(nice_ticks(-5.0, 85.0, 4), (-50.0, 100.0, 50.0));
    }

    #[test]
    fn a_scalar_result_is_refused_as_no_time_series() {
        let e = extract_timeline("{\"kind\":\"link-budget\",\"margin_db\":3.0}", None).unwrap_err();
        assert_eq!(e, AnimationError::NoTimeSeries("link-budget".into()));
    }

    #[test]
    fn a_speed_in_metres_per_second_is_not_read_as_seconds() {
        assert_eq!(unit_from_name("speed_m_s"), "m/s");
        assert_eq!(unit_from_name("range_m"), "m");
        assert_eq!(unit_from_name("t_s"), "s");
        assert_eq!(humanise("speed_m_s", "m/s"), "speed [m/s]");
    }

    #[test]
    fn a_label_cannot_close_the_player_script() {
        let doc = "{\"kind\":\"clock\",\"title\":\"a</script><p>b\",\
                   \"s\":{\"t_s\":[0,1,2],\"x_m\":[1,2,3]}}";
        let tl = extract_timeline(doc, None).unwrap();
        let html = render_html(&tl, &AnimationOptions::default());
        // One closing tag for the JSON block, one for the player code.
        assert_eq!(html.matches("</script>").count(), 2);
        assert!(html.contains("<h1>a&lt;/script&gt;&lt;p&gt;b</h1>"));
    }

    #[test]
    fn labels_never_carry_a_link() {
        assert_eq!(clean_label("see https://x.y"), "see https: x.y");
    }

    #[test]
    fn meta_splices_after_the_opening_brace() {
        let j = with_animation_meta("{\n  \"a\": 1\n}", &serde_json::json!({"fps": 12}));
        let v: Value = serde_json::from_str(&j).unwrap();
        assert_eq!(v["animation"]["fps"], 12);
        assert_eq!(v["a"], 1);
    }
}
